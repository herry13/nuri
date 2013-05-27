require 'thread'

module Nuri

module BSig

# The file where Nuri master saves its BSig model
MasterBSigFile = Nuri::Util.home_dir + '/var/bsig_system'

def self.bsig_vm_file(id); Nuri::Util.home_dir + '/var/bsig_' + id.to_s + '.vm'; end

module Operator
	attr_accessor :selected

	# @param signature => a Hash contains the signature of the operator
	#
	def init
		@selected = false
	end

	def priority_index
		self['distance'].to_i
	end

	# @param goal => a Hash contains the goal state
	#
	# @return true if this operator supports the goal state, otherwise false
	#
	def support(goal)
		goal.each { |goal_path,goal_value|
			self['effect'].each { |eff_path,eff_value|
				return true if goal_path == eff_path and goal_Value = eff_value
			}
		}
		false
	end
end

class Executor
	ActiveBSigIdFile = Nuri::Util.home_dir + '/var/bsig_id'
	EmptyBSig = {'id' => nil, 'goal' => {}, 'operators' => []}

	# @return a Hash contains the active BSig model
	#
	def get_bsig
		if File.exist?(ActiveBSigIdFile)
			id = File.read(ActiveBSigIdFile).to_i
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

		self.reset
	end

	def start
		enable(true)

		Nuri::Util.debug "Start BSig executor"

		p = {:min_priority_index => 0}
		while enabled?
			bsig = self.get_bsig
			p[:bsig_id] = bsig['id']
			p[:goal] = bsig['goal']
			achieve_local_goal(p)
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
		p[:flaws] = self.get_flaws(p[:goal])
		return :no_flaw if flaws.empty?

		@local_mutex.synchronize {
			operator = self.select_operator(p[:goal], p[:min_priority_index])
			return :failure if operator.nil?

			return :on_going if operator.selected
			operator.selected = true
		}

		local, remote = self.split_conditions(operator)

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

	protected

	# @params
	# operator => an instance of Nuri::BSig::Operator, which is the BSig
	#             operator to be executed
	#
	# @return :success if execution is success, otherwise :failure
	def invoke(operator)
		return :success if @owner.execute(operator)
		:failure
	end

	def achieve_remote_goal(p={})
		# TODO
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
		bsig['goal']
	end

	# @param goal => a Hash contains the goal state
	# @param min_priority_index => an Integer of minimum priority index value
	#
	# @return an instance of Nuri::BSig::Operator (selected operator)
	#
	def select_operator(goal, min_priority_index)
		operator = nil
		self.get_local_operators.each { |op|
			next if op.priority_index > min_priority_index or
					(!operator.nil? and op.priority_index > operator.priority_index)
			operator = op if op.support(goal)
		}
		operator
	end

	# @param conditions => a Hash instance contains the conditions
	#
	# @return [local, remote]
	#         local => a Hash contains the local conditions
	#         remote => a Hash contains the remote conditions
	#
	def split_conditions(conditions)
		local_goals = self.get_local_goal
		remote = {}
		local = {}
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
						raise RemoteComponentUnavailableException, "Remote Component: #{component_path}"
					else
						remote[address] = {} if !remote.has_key?(address)
						remote[address][path] = value
					end
				end
			end
		}
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

end

end
