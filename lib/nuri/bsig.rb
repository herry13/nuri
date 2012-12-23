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
				# has a distace which represents its distance to the goal state
				# in total-order plan
				candidates.uniq!
				# sort in ascending order
				candidates.sort! { |x,y| x['distance'] <=> y['distance'] }
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

				# Operator's conditions are satisfied
				#return 1 if remote_flaws.length <= 0 # HACK! -- local_flaws are ignored
				return 1 if remote_flaws.length <= 0 and
				            local_flaws.length <= 0

				begin
					# Send request to remote node to satisfy the preconditions.
					# Possible response codes:
					# - '202': the node is under process to satisfy the preconditions
					# - '500': the node cannot satisfy the preconditions
					remote_flaws.each do |address,goals|
						data = "json=" + JSON.generate(goals)
						code, _ = @owner.put_data(address, Nuri::Port, '/bsig/goal', data)
puts '==>> request remote condition: ' + code
						raise Exception if code != '202'
					end

					# Send request to localhost to satisfy the preconditions.
					if local_flaws.length > 0
						data = "json=" + JSON.generate(local_flaws)
						code, _ = @owner.put_data('localhost', Nuri::Port, '/bsig/goal', data)
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
