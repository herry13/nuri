require 'thread'

module Nuri

	# Behavioural Signature Engine
	# ============================
	# Controlling the components based on Behavioural Signature (BSig) model
	# which consists of:
	# 1) BSig operators
	# 2) Goal state
	module BSig

		# The file where Nuri client saves its active BSig's ID
		ActiveBSigIdFile = Nuri::Util.home_dir + '/var/bsig_id'

		# The file where Nuri master saves its BSig model
		MasterBSigFile = Nuri::Util.home_dir + '/var/bsig_system'

		def self.get_active_id
			return nil if not File.exist?(ActiveBSigIdFile)
			return File.read(ActiveBSigIdFile).to_i
		end

		class Executor
			# Waiting time before sending another request to related nodes in order
			# to fulfil operator's precondition
			WaitingTime = 2 # (in seconds)
			
			attr_reader :enabled, :active, :bsig

			def initialize(owner)
				@owner = owner     # holds the Nuri::Client object
				@enabled = false   # the executor is disabled
				@active = false    # the executor is not active
				@lock = Mutex.new  # for synchronizing threads in accessing @enabled and @active
				self.reset         # reset the BSig model
			end

			# Send stop-signal to BSig executor thread, then enter an loop until the executor
			# has stopped (@active == false).
			def stop
				Nuri::Util.log 'Send stop-signal to BSig executor'
				@lock.synchronize { @enabled = false }
				while self.is_active; sleep 1; end
			end

			# Reset the BSig model.
			def reset
				@bsig = nil
			end

			# Load the BSig model from cache file.
			def load
				begin
					# 1) get latest BSig's ID
					bsig_id = Nuri::BSig.get_active_id
					return false if bsig_id.nil?
	
					# 2) read BSig
					bsig_file = Nuri::Util.home_dir + "/var/bsig_#{bsig_id}"
					@bsig = JSON[File.read(bsig_file)]

					return true
				rescue Exception => exp
					Nuri::Util.warn 'Cannot load BSig: ' + exp.to_s
				end
				return false
			end

			# Return true if the executor is active, otherwise false.
			def is_active; @lock.synchronize { return @active }; end

			# Start the executor if it is inactive. This method will create a new thread
			# which will load the BSig model from cache file, then enter a loop until
			# a stop-signal is received (see "stop" method) or there is goal-flaw.
			# On each loop, the thread will:
			# 1) calculate the goal-flaws
			# 2) repairing the goal by executing a BSig operator
			def start
				return if self.is_active
				Nuri::Util.log 'BSig engine is started'

				@thread = Thread.new {
					begin
						@lock.synchronize {
							if self.load
								@active = true
								@enabled = true
							end
						}

						while @enabled
							# 1) get the goal and calculate the goal-flaws
							goal = @owner.get_goal
							goal_flaws = self.get_goal_flaws(goal)
							if goal_flaws.length <= 0 # no goal-flaw => at goal state
								Nuri::Util.log 'At goal state'
								@owner.clear_goal
								break
							else
								# 2) if such goal-flaw exists, repair it by selecting and executing
								#    a BSig operator (which may not repair all goal-flaws)
								succeed, effects = repair_goal_flaws(goal_flaws)
								if not succeed
									Nuri::Util.warn 'Failed repairing goal-flaws: ' + goal_flaws.inspect
									break
								else
									# Some goal flaws have been repaired, then remove the achieved goal
									# from goal-stacks
									@owner.remove_goal(effects)
								end
							end
						end
					rescue Exception => exp
						Nuri::Util.warn 'Error when executing the BSig: ' + exp.to_s
						Nuri::Util.warn exp.backtrace
					ensure
						@lock.synchronize { @active = false }
					end
				}
			end

			# Calculate the goal-flaws by comparing the goal with the current state. Then
			# return the goal-flaws as a set of variable-value pairs.
			def get_goal_flaws(goal)
				flaws = {}
				#Nuri::Util.debug 'get goal flaws of: ' + goal.inspect
				goal.each { |path,value| flaws[path] = value if value != @owner.get_state(path) }
				return flaws
			end

			# Repair the goal-flaws by searching all operator candidates, then select
			# an operator which will be executed to repair the goal-flaws.
			# Return a 2-tuple:
			# - [false, nil]    -- iff there's no applicable operator, or
			#                          the condition of selected operator cannot be achieved, or
			#                          the selected operator cannot be executed
			# - [true, effects] -- iff the operator was successfully executed
			def repair_goal_flaws(goal_flaws)
				Nuri::Util.debug 'repairing goal flaws: ' + goal_flaws.inspect
				candidates = self.search_operator_candidates(goal_flaws)
				operator = self.select_operator(candidates)
				if operator.nil?
					# 1) the flaw cannot be repaired -- no operator can repair the flaw
					Nuri::Util.warn 'Cannot repair the flaws: ' + goal_flaws.inspect
					return false, nil
				elsif not achieve_condition(operator)
					# 2) operator's condition cannot be achieved
					Nuri::Util.warn "Operator's condition cannot be achieved: " +
						operator.inspect
					return false, nil
				elsif not execute(operator)
					# 3) the operator cannot be executed
					Nuri::Util.warn "Cannot execute selected operator: " + operator.inspect
					return false, nil
				end
				return true, operator['effect']
			end

			# Execute given BSig operator. Return true if the execution was success, otherwise false
			def execute(operator)
				Nuri::Util.debug "[executing: #{operator['name']}]"
				return @owner.execute(operator)
			end

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

				# Return the operator with the lowest distance
				return candidates.last
			end

			# Search all operators that can be used to repair the goal-flaws by comparing
			# the flaws with operators' effects.
			# Return an array of operators.
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
				end if not @bsig.nil? and @bsig.has_key?('operators')
				return candidates
			end

			# Given a state (either a goal state or an operator's conditions), the method
			# will calculate the flaws. The condition-flaws will be partitioned into two
			# sets i.e. the remote-flaws and local-flaws. Try to satisfy the local-flaws
			# first, then the remote-flaws.
			#
			# Remote-flaws: the flaws that must be repaired by the another agent (node).
			# Local-flaws: the flaws that can be repaired by this agent (node).
			def get_condition_flaws(condition)
				flaws = get_goal_flaws(condition)

				remote_flaws = {}
				local_flaws = {}
				flaws.each do |path,value|
					component_path, variable_name = path.extract
					if not @owner.local?(component_path)
						address = @owner.address?(component_path)
						raise Exception, 'Cannot find component: ' + component_path if address.nil?
						remote_flaws[address] = {} if not remote_flaws.has_key?(address)
						remote_flaws[address][path] = value
					else
						local_flaws[path] = value
					end
				end
				return remote_flaws, local_flaws
			end

			# Repairing given local-flaws by recursively calling "repair_goal_flaws"
			# where the goal is the local-flaws.
			# This method will try 10 times, if in that tries the flaws cannot be repaired
			# then return [false, {disrepair-local-flaws}]
			# otherwise, return [true, nil]
			def repair_local_flaws(local_flaws)
				# Recursively call itself to repair the local flaws.
				Nuri::Util.debug '[repairing local flaws]'
				timeout = 10
				while @enabled and local_flaws.length > 0 and timeout >= 0
					succeed, effects = self.repair_goal_flaws(local_flaws)
					if succeed
						local_flaws = get_goal_flaws(local_flaws)
					else
						timeout -= 1
					end
					sleep 0.5
				end
				return false, local_flaws if local_flaws.length > 0
				return true, nil
			end

			# Repairing given remote-flaws by send a request to remote node that can repair
			# the flaws. Within 30 minutes, it will try several times until the flaws have
			# been repaired. If success, then return [true,nil]. Otherwise return
			# [false, <disrepair-remote-flaws>]
			def repair_remote_flaws(remote_flaws)
				remote_flaws = remote_flaws.clone
				# Send request to remote node to repair the remote flaws periodically until
				# no such flaws exists.
				# Possible response codes:
				# - '202': the node is under process repairing the remote flaws
				# - '500': the node cannot repair the remote flaws
				timeout = 1800 / WaitingTime # timeout is 1800s (30m)
				begin
					Nuri::Util.debug 'remote conditions: ' + remote_flaws.inspect
					remote_flaws.each do |address,flaws|
						code, _ = @owner.put_data(address, Nuri::Port, '/bsig/goal', flaws)
						Nuri::Util.debug 'request remote condition: ' + code + ' -- from: ' + address
						raise Exception if code != '202'
					end
					sleep WaitingTime
					# check whether the remote-flaws have been repaired
					remote_flaws.keys.each do |address|
						flaws = get_goal_flaws(remote_flaws[address])
						if flaws.length <= 0
							remote_flaws.delete(address)
						else
							remote_flaws[address] = flaws
						end
					end
					timeout -= WaitingTime
					# all remote-flaws have been repaired, and no timeout (timeout: 30m)
				end while @enabled and remote_flaws.length > 0 and timeout >= 0

				return false, remote_flaws if remote_flaws.length > 0
				return true, nil
			end

			# Given an operator, the method will:
			# 1) calculate the operator's condition-flaws
			# 2) if such flaws exist, separate into local and remote flaws
			# 3) try to repair local-flaws first
			# 4) if success repairing local-flaws, try to repair remote-flaws;
			#    otherwise raise Exception
			# 5) if success repairing remote-flaws, return true
			#
			# @return true if the operator's conditon-flaws can be repaired, otherwise false
			def achieve_condition(operator)
				operator_name = operator['name'].to_s
				Nuri::Util.debug 'achieving condition of operator: ' + operator_name
				# check flaws of operator's condition, and
				# separate then between local and remote flaws
				remote_flaws, local_flaws = get_condition_flaws(operator['condition'])

				# Operator's conditions are satisfied
				return true if remote_flaws.length <= 0 and
				               local_flaws.length <= 0

				begin
					# repairing local-flaws
					success, local_flaws = repair_local_flaws(local_flaws)
					if not success
						raise DisrepairLocalFlawException,
							"Local conditions of #{operator_name} cannot be satisfied: #{local_flaws.inspect}."
					else
						Nuri::Util.debug "Local conditions of #{operator_name} have been satisfied."
					end

					# repairing remote-flaws
					success, remote_flaws = repair_remote_flaws(remote_flaws)
					if not success
						raise DisrepairRemoteFlawException,
							"Remote conditions of #{operator_name} cannot be satisfied: #{remote_flaws.inspect}."
					else
						Nuri::Util.debug "Remote conditions of #{operator_name} have been satisfied."
					end

					return true
				rescue Timeout::Error
					Nuri::Util.warn "Timeout when achieving the condition"
				rescue Exception => exp
					Nuri::Util.warn "Failed achieving the condition: " + exp.to_s
					Nuri::Util.warn exp.backtrace
				end

				return false
			end
		end

		class DisrepairLocalFlawException < Exception; end
		class DisrepairRemoteFlawException < Exception; end

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

	end
end
