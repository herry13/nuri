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
							goal = @owner.get_goal
							goal_flaws = self.get_goal_flaws(goal)
							if goal_flaws.length <= 0 # no goal-flaw => at goal state
								Nuri::Util.log 'At goal state'
								@owner.clear_goal
								break
							elsif not repair_goal_flaws(goal_flaws)
								Nuri::Util.log 'Failed repairing goal-flaws: ' + goal_flaws.inspect
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

			def get_goal_flaws(goal)
				flaws = {}
				Nuri::Util.log 'goal: ' + goal.inspect
				goal.each { |path,value| flaws[path] = value if value != @owner.get_state(path) }
				return flaws
			end

=begin
			def at_goal?
				@flaws = {}
				Nuri::Util.log 'goal: ' + @owner.get_goal.inspect
				@owner.get_goal.each { |path,value| @flaws[path] = value if value != @owner.get_state(path) }
				return (@flaws.length <= 0)
			end
=end

			def repair_goal_flaws(goal_flaws)
Nuri::Util.log 'repairing goal flaws: ' + goal_flaws.inspect
				candidates = self.search_operator_candidates(goal_flaws)
				operator = self.select_operator(candidates)
				# return false if:
				# 1) the flaw cannot be repaired
				# 2) operator's condition cannot be achieved
				# 3) the operator cannot be executed
				return false if operator.nil? or
				                not achieve_condition(operator)
				                not @owner.execute(operator)
				@owner.remove_goal(operator['effect'])
				return true
			end

=begin
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
=end

			# Return an operator to be executed and the path of subgoal reached by the operator
			def select_operator(candidates)
				return nil if candidates.nil? or candidates.length <= 0
				# Select the operator that has the highest ID value. Each operator
				# has a distance which represents its distance to the goal state
				# in total-order plan
				candidates.uniq!
				# sort in ascending order
				#candidates.sort! { |x,y| x['distance'] <=> y['distance'] }
				# sort in decending order
				candidates.sort! { |x,y| y['distance'] <=> x['distance'] }
				return candidates.last
			end

			def search_operator_candidates(flaws)
				candidates = []
				flaws.each do |path,value|
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

			def get_condition_flaws(condition)
				remote_flaws = {}
				local_flaws = {}
				condition.each do |path,value|
					if @owner.get_state(path) != value
						component_path, variable_name = path.extract
						if not @owner.local?(component_path)
							address = @owner.domainname?(component_path)
							raise Exception, 'Cannot find component: ' + component_path if address.nil?
							remote_flaws[address] = {} if not remote_flaws.has_key?(address)
							remote_flaws[address][path] = value
						else
							local_flaws[path] = value
						end
					end
				end
				return remote_flaws, local_flaws
			end

			def get_flaws(goal)
				flaws = {}
				goal.each { |path,value| flaws[path] = value if @owner.get_state(path) != value }
				return flaws
			end

			# @return true if the operator's conditon can be achieved, otherwise false
			def achieve_condition(operator)
				# check flaws of operator's condition, and
				# separate then between local and remote flaws
				remote_flaws, local_flaws = get_condition_flaws(operator['condition'])

				# Operator's conditions are satisfied
				return true if remote_flaws.length <= 0 and
				               local_flaws.length <= 0

				begin
					# Send request to remote node to repair the remote flaws periodically until
					# no such flaws exists.
					# Possible response codes:
					# - '202': the node is under process repairing the remote flaws
					# - '500': the node cannot repair the remote flaws
					begin
						remote_flaws.each do |address,flaws|
							data = "json=" + JSON.generate(flaws)
							code, _ = @owner.put_data(address, Nuri::Port, '/bsig/goal', data)
puts '==>> request remote condition: ' + code
							raise Exception if code != '202'
						end
						sleep WaitingTime
						# check whether the remote-flaws have been repaired
						remote_flaws.keys.each do |address|
							flaws = get_flaws(remote_flaws[address])
							if flaws.length <= 0
								remote_flaws.delete(address)
							else
								remote_flaws[address] = flaws
							end
						end
						# all remote-flaws have been repaired
					end while remote_flaws.length > 0

					# Recursively call itself to repair the local flaws.
					if local_flaws.length > 0
						raise Exception if not self.repair_goal_flaws(local_flaws)
					end

					return true
				rescue Timeout::Error
					Nuri::Util.log "Timeout when achieving the condition"
				rescue Exception => exp
					Nuri::Util.log "Failed achieving the condition: " + exp.to_s
				end

				return false
			end
		end

	end
end
