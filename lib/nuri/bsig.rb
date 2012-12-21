require 'thread'

module Nuri
	module BSig

		ValueUndefined = Undefined.new

		class Variable
			attr_reader :path, :goal
			
			def initialize(path)
				@path = path
				@value = ValueUndefined
				@goal = []
				@lock = Mutex.new
			end

			def get_value; @lock.synchronize { return @value }; end

			def set_value(value); @lock.synchronize { @value = value }; end

			def add_goal(value)
				@lock.synchronize {
					return false if not @goal.index(value).nil?
					@goal << value
					return true
				}
			end
		end

		class Undefined; end

		class Executor
			WaitingTime = 2 # in seconds

			attr_reader :enabled, :active, :bsig

			def initialize(owner)
				@owner = owner
				@bsig = nil
				@enabled = false
				@active = false
				@lock = Mutex.new
			end

			def start
				Nuri::Util.log 'Starting BSig executor'
				@thread = Thread.new {
					begin
						@lock.synchronize {
							if self.load
								@active = true
								@enabled = true
							end
						}

						while @enabled
							if self.at_goal?
								Nuri::Util.log 'At goal state'
								@owner.clear_goal
								break
							elsif not self.execute_operator
								Nuri::Util.log 'Failed executing BSig operator'
								break
							end
						end
					rescue Exception => exp
						Nuri::Util.log exp.to_s
						Nuri::Util.log exp.backtrace
					ensure
						@active = false
					end
				}
			end

			def stop
				Nuri::Util.log 'Send stop-signal to BSig executor'
				@lock.synchronize { @enabled = false }
				while @active; sleep 1; end
			end

			def load
				begin
					# 1) get latest BSig's ID
					bsig_id_file = Nuri::Util.home_dir + '/var/bsig_id'
					return false if not File.exist?(bsig_id_file)
					bsig_id = File.read(bsig_id_file).to_i
	
					# 2) read BSig
					bsig_file = Nuri::Util.home_dir + "/var/bsig_#{bsig_id}"
					@bsig = JSON[File.read(bsig_file)]

					return true
				rescue Exception => exp
					Nuri::Util.log 'Cannot load BSig: ' + exp.to_s
				end
				return false
			end

			def at_goal?
				@flaws = {}
				Nuri::Util.log 'goal: ' + @owner.get_goal.inspect
				@owner.get_goal.each { |path,value| @flaws[path] = value if value != @owner.get_state(path) }
				return (@flaws.length <= 0)
			end

			def execute_operator
				puts 'select and execute an operator'
				candidates = self.search_candidates
				operator = select_operator(candidates)
				# return false if goal cannot be reached
				return false if operator.nil?
				# check and satisfy the precondition of selected operator
				status = verify_condition(operator)
				return false if status < 0
				if status == 0
					sleep 5
				elsif status >= 1
					# execute the operator
					return false if not @owner.execute(operator)
					@owner.remove_goal(operator['effect'])
				end
				return true
			end

			# Return an operator to be executed and the path of subgoal reached by the operator
			def select_operator(candidates)
				return nil if candidates.nil? or candidates.length <= 0
				# Select the operator that has the highest ID value. Each operator
				# has an ID which represents its index in total-order plan
				candidates.uniq!
				candidates.sort! { |x,y| y['id'] <=> x['id'] }
				return candidates.last
			end

			def search_candidates
				candidates = []
				@flaws.each do |path,value|
					@bsig['operators'].each do |operator|
						operator['effect'].each { |k,v|
							if path == k and value == v
								candidates << operator
								break
							end
						}
					end
				end
				return candidates
			end

			# @return -1: if there is a flaw on the conditions and cannot be fix
			#          0: if there is a flaw, but new goal request has been sent
			#          1: if there is no flaw
			def verify_condition(operator)
				# TODO
				remote_flaws = {}
				local_flaws = {}
				operator['condition'].each do |path,pre|
					if @owner.get_state(path) != pre
						component_path, variable_name = path.extract
						if not @owner.local?(component_path)
							address = @owner.domainname?(component_path)
							raise Exception, 'Cannot find component: ' + component_path if address.nil?
							remote_flaws[address] = {} if not remote_flaws.has_key?(address)
							remote_flaws[address][path] = pre
						else
							local_flaws[path] = pre
						end
					end
				end
				return 1 if remote_flaws.length <= 0 # HACK! -- local_flaws are ignored

				begin
					remote_flaws.each do |address,goals|
						data = "json=" + JSON.generate(goals)
						code, _ = @owner.put_data(address, Nuri::Port, '/bsig/goal', data)
puts '==>> request remote condition: ' + code
						raise Exception if code != '202'
					end
					return 0
				rescue Timeout::Error
					Nuri::Util.log "Timeout when satisfying remote condition"
				rescue Exception => exp
					Nuri::Util.log "Failed satisfying remote condition: " + exp.to_s
				end
				return -1
			end

		end

	end
end

=begin
			def check_and_satisfy_precondition(operator)
				remote_conditions = {}
				local_conditions = []

				operator['condition'].each do |path,pre|
					value = @owner.get_state(path)
					if value != pre
						component_path, variable_name = path.extract
						if not @owner.local?(component_path)
							address = @owner.domainname?(component_path)
							return false if address.nil? # remote address cannot be found
							remote_conditions[address] = [] if not remote_conditions.has_key?(address)
							remote_conditions[address] << {:path => path, :goal => pre}
						else
							local_conditions = {:path => path, :goal => pre}
						end
					end
				end

				return false if not satisfy_remote_conditions(remote_conditions)
				return false if not satisfy_local_conditions(local_conditions)

				return true
			end

			def satisfy_remote_conditions(remote_conditions)
				remote_conditions.each do |address,conditions|
					begin
						data = "json=" + JSON.generate(conditions)
						code, _ = @owner.put_data(address, Nuri::Port, '/bsig/subgoal', data)
puts code
						return false if code != '200'
					rescue Timeout::Error
						Nuri::Util.log "Timeout when satisfying remote condition: " + address.to_s
						return false
					rescue Exception => exp
						Nuri::Util.log exp.to_s
						Nuri::Util.log "Timeout when satisfying remote condition: " + address.to_s
						return false
					end
				end
				return true
			end

			def satisfy_local_conditions(conditions)
				# TODO
				return true
			end


		end
=end
