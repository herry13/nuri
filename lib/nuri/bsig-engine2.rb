require 'thread'

module Nuri

module BSig

# The file where Nuri master saves its BSig model
MasterBSigFile = Nuri::Util.home_dir + '/var/bsig_system'

ActiveBSigIdFile = Nuri::Util.home_dir + '/var/bsig_id'

def self.get_active_id
	(File.exist?(ActiveBSigIdFile) ? File.read(ActiveBSigIdFile).to_i : nil)
end

def self.bsig_vm_file(id)
	Nuri::Util.home_dir + '/var/bsig_' + id.to_s + '.vm'
end

class Executor
	EmptyBSig = {'id' => nil, 'goal' => {}, 'operators' => []}

	# @return a Hash contains the active BSig model
	#
	def get_bsig
		id = Nuri::BSig.get_active_id
		if !id.nil?
			if @bsig['id'].nil? or @bsig['id'] < id
				# load the new BSig model
				fpath = "#{Nuri::Util.home_dir}/var/bsig_#{id}"
				if File.exist?(fpath)
					@bsig = JSON[File.read(fpath)]
					@bsig['id'] = id
					@bsig['operators'].each { |op|
						op.extend(Nuri::BSig::Operator)
						op.init
					}
				end
			end
			@bsig
		else
			@empty_bsig
		end
	end

	# @params
	# :owner Nuri::Client object
	#
	def initialize(p={})
		@owner = p[:owner]     # holds the Nuri::Client object
		@local_mutex = Mutex.new

		@empty_bsig = EmptyBSig
		
		@lock = Mutex.new
		@enabled = false

		@remote_lock = Mutex.new
		@total_satisfier = 0

		self.reset
	end

	def start
		enable(true)

		Nuri::Util.debug "Execute local BSig model"

		begin
			p = {:min_priority_index => 0}
			while enabled?
				if self.total_satisfier_threads > 0
					Nuri::Util.debug "Some satisfier threads are active!"
					break
				end

				bsig = self.get_bsig
				p[:bsig_id] = bsig['id']
				p[:goal] = bsig['goal']
				if achieve_local_goal(p) == :no_flaw
					Nuri::Util.debug "The local goal is achieved!"
					break
				end
			end
		rescue Exception => exp
			Nuri::Util.error "Error on executing local BSig model: #{exp} [#{exp.backtrace}]"
		end
	end

	def stop
		enable(false)

		Nuri::Util.debug "Stop BSig executor"
	end

	def reset
		@bsig = @empty_bsig
	end

	# @params
	# :bsig_id => the ID of an active BSig model
	# :goal => the goal state
	# :min_priority_index => the minimum priority index value of selected operator
	#
	def achieve_local_goal(p={})
		flaws = self.get_flaws(p[:goal])
		return :no_flaw if flaws.empty?

Nuri::Util.debug "[achieve_local_goal] flaws: #{flaws.inspect}"
		operator = nil
		@local_mutex.synchronize {
			operator = self.select_operator(flaws, p[:min_priority_index])
			return :failure if operator.nil?

Nuri::Util.debug "#{operator.name} => #{operator.selected}"
			return :on_going if operator.selected
			operator.selected = true
Nuri::Util.debug "#{operator.name} => #{operator.selected}"
		}

		local, remote = self.split_conditions(operator.conditions)

		status = nil
		begin
			status = self.achieve_local_goal({
				:bsig_id => p[:bsig_id],
				:goal => local,
				:operators => p[:operators],
				:min_priority_index => operator.priority_index + 1
			})
			sleep 1 if status == :on_going
		end until status == :no_flaw or status == :failure

		@local_mutex.synchronize { operator.selected = false if status == :failure }
		return :failure if status == :failure

		status = self.achieve_remote_goal({
			:bsig_id => p[:bsig_id],
			:goal => remote,
			:min_priority_index => operator.priority_index + 1
		})
		@local_mutex.synchronize { operator.selected = false if status == :failure }
		return :failure if status == :failure

		status = self.invoke(operator)
		@local_mutex.synchronize { operator.selected = false if status == :failure }
		return :failure if status == :failure

		@local_mutex.synchronize { operator.selected = false }
		return :flaw_repaired
	end

	def receive_remote_goal(p={})
Nuri::Util.debug "[receive_remote_goal] #{p.inspect}"
		self.register_satisfier
		status = nil
		data = {:bsig_id => p['bsig_id'],
		        :min_priority_index => p['min_priority_index'],
		        :goal => p['goal']}
		while enabled? and status != :no_flaw and status != :failure
			status = achieve_local_goal(data)
			sleep 5 if status == :on_going
		end
		self.unregister_satisfier
		return (status == :no_flaw)
	end


	protected

	# @param operator => an instance of Nuri::BSig::Operator, which is the BSig
	#             operator to be executed
	#
	# @return :success if execution is success, otherwise :failure
	def invoke(operator)
Nuri::Util.debug "[invoke] operator: #{operator.inspect}"
		return :success if @owner.execute(operator)
		:failure
	end

	# Send a request to remote agent to achieve particular goal
	#
	# @param :goal => a Hash of remote goal {<address>}{<remote_goal}
	# @param :bsig_id => current BSig ID
	# @param :min_priority_index => minimum priority index of operator
	# @return :success if all agents that can achieve given goal, otherwise :failure
	#
	def achieve_remote_goal(p={})
Nuri::Util.debug "[achieve_remote_goal] #{p.inspect}"
		p[:goal].each { |address,remote_goal|
			data = {:bsig_id => p[:bsig_id],
			        :goal => remote_goal,
			        :min_priority_index => p[:min_priority_index]}
			code, _ = @owner.put_data(address, Nuri::Port, '/bsig/achieve_goal', data)
			Nuri::Util.debug 'request remote condition: ' + code + ' -- from: ' + address
			return :failure if code != '200'
		}
		:success
	end

	def register_satisfier
		@remote_lock.synchronize { @total_satisfier += 1 }
	end

	def unregister_satisfier
		@remote_lock.synchronize { @total_satisfier -= 1 }
	end

	def total_satisfier_threads
		@remote_lock.synchronize { return @total_satisfier }
	end

	# @return an Array of Nuri::BSig::Operator instances
	#
	def get_local_operators
		self.get_bsig['operators']
	end

	# @return a Hash contains the local goal of BSig model
	#
	def get_local_goal
		self.get_bsig['goal']
	end

	# @param goal => a Hash contains the goal state
	# @param min_priority_index => an Integer of minimum priority index value
	#
	# @return an instance of Nuri::BSig::Operator (selected operator)
	#
	def select_operator(goal, min_priority_index)
		operator = nil
		self.get_local_operators.each { |op|
			next if op.priority_index < min_priority_index or
					(!operator.nil? and op.priority_index > operator.priority_index)
			operator = op if op.support(goal)
		}
Nuri::Util.debug "[select_operator] operator: #{operator.inspect}"
		operator
	end

	# @param conditions => a Hash instance contains the conditions
	#
	# @return [local, remote]
	#         local => a Hash contains the local conditions
	#         remote => a Hash contains the remote conditions
	#
	def split_conditions(conditions)
Nuri::Util.debug "[split_conditions] conditions: #{conditions.inspect}"
		local_goal = self.get_local_goal
		remote = {}
		local = {}
#Nuri::Util.debug local_goal.inspect
		conditions.each { |path,value|
			if local_goal.has_key?(path) and local_goal[path] == value
				local[path] = value
			else
				component_path, var_name = path.extract
				if @owner.local?(component_path)
					local[path] = value
				else
					address = @owner.address?(component_path)
					if address.nil?
						raise Exception, "Unavailable remote component: #{component_path}"
					else
						remote[address] = {} if !remote.has_key?(address)
						remote[address][path] = value
					end
				end
			end
		}
Nuri::Util.debug "[split_conditions] local: #{local.inspect}, remote: #{remote.inspect}"
		return local, remote
	end

	# @param goal => a Hash instance contains the goal state
	#
	# @return a Hash contains the flaws of the goal
	#
	def get_flaws(goal)
		flaws = {}
		goal.each { |path,value|
			flaws[path] = value if value != @owner.get_state(path)
		}
		flaws
	end

	def enabled?
		@lock.synchronize { return @enabled }
	end

	def enable(enabled=false)
		@lock.synchronize { @enabled = enabled }
	end

end


module Operator
	attr_accessor :selected

	def init
		@selected = false
	end

	def priority_index
		self['distance'].to_i
	end

	def name
		self['name']
	end

	def conditions
		self['condition']
	end

	def effects
		self['effect']
	end

	# @param goal => a Hash contains the goal state
	#
	# @return true if this operator supports the goal state, otherwise false
	#
	def support(goal)
		goal.each { |goal_path,goal_value|
			self['effect'].each { |eff_path,eff_value|
				return true if goal_path == eff_path and goal_value == eff_value
			}
		}
		false
	end
end


class VMHelper
	include ::Nuri::NetHelper

	def send_bsig(vm_name, address)
		begin
			bsig_id = ::Nuri::BSig.get_active_id
			return true if bsig_id.nil? # no BSig available

			bsig_file = ::Nuri::BSig.bsig_vm_file(bsig_id)
			bsig = (File.exist?(bsig_file) ? JSON[File.read(bsig_file)] : {})
			if bsig.has_key?(vm_name)
				# send BSig model
				data = bsig[vm_name]
				data['id'] = bsig_id
				#Nuri::Util.log "vm[#{vm_name}]: send BSig model - #{data.inspect}"
				code, _ = self.put_data(address, Nuri::Port, '/bsig', data)
				raise Exception, "Return code: #{code}" if code != '200'
				Nuri::Util.log "vm[#{vm_name}]: send BSig model - #{code}"
			else
				Nuri::Util.log "vm[#{vm_name}]: no BSig model"
			end
			return true
		rescue Exception => exp
			Nuri::Util.error "Cannot send BSig model to VM: #{vm_name},#{address} - #{exp} [#{exp.backtrace}]"
		end
		false
	end

	def activate_bsig(vm_name, address)
		begin
			bsig_id = ::Nuri::BSig.get_active_id
			return true if bsig_id.nil? # no BSig available

			bsig_file = ::Nuri::BSig.bsig_vm_file(bsig_id)
			bsig = (File.exist?(bsig_file) ? JSON[File.read(bsig_file)] : {})
			if bsig.has_key?(vm_name)
				# activate BSig model
				data = {'id' => bsig_id}
				code, _ = self.put_data(address, Nuri::Port, '/bsig/activate', data)
				raise Exception, "Return code: #{code}" if code != '200'
				Nuri::Util.log "vm[#{vm_name}]: active BSig - #{bsig_id}"
			end
			return true
		rescue Exception => exp
			Nuri::Util.error "Cannot activate BSig model of VM: #{vm_name},#{address} - #{exp} [#{exp.backtrace}]"
		end
		false
	end
end


end

end
