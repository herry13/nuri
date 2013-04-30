#!/usr/bin/env ruby

require 'thread'

module Nuri
	module Executor
		class ExecutionException < Exception; end
		class ParallelExecutionException < Exception; end
		class SequentialExecutionException < Exception; end

		def execute_plan(params={})
			if params[:plan].nil? or not params[:plan].is_a?(Hash)
				raise ExecutionException, 'Plan is not available.'
			elsif params[:plan]['type'].to_s == 'parallel' or
			      params[:plan][:type].to_s == 'parallel'
				return self.execute_parallel_plan(params)
			elsif params[:plan]['type'].to_s == 'sequential' or
			      params[:plan][:type].to_s == 'sequential'
				return self.execute_sequential_plan(params)
			else
				raise ExecutionException, 'Unknown type of plan!'
			end
			false
		end

		def execute_parallel_plan(params={})
			def assign_action_with_id(id)
				thread_id = next_thread_id
				action = @actions[id]
				action[:executor] = thread_id
				self.thread_execute_action(thread_id, action)
			end

			def next_thread_id
				id = 0
				@mutex.synchronize { @thread_id = id = @thread_id + 1 }
				id
			end

			def action_to_string(action)
				"#{action['id']}:#{action['name']}#{JSON.generate(action['parameters'])}"
			end

			def thread_execute_action(tid, action)
				t = Thread.new {
					@mutex.synchronize { @threads << tid }

					while not @failed and not action[:executed]
						# execute the action
						op_str = action_to_string(action)
						Nuri::Util.puts "[ExecutorThread: #{tid}] #{op_str}"
						#success = true
						for i in 1..3
							success = @owner.execute_action { action }
							break if success
						end

						# check if execution failed
						if success
							next_actions = []
							@mutex.synchronize {
								# set executed
								action[:executed] = true
								# select next action to be executed from all predecessor actions
								# if each action has not been assigned to any thread yet
								if action['successors'].length > 0
									action['successors'].each { |id|
										if @actions[id][:executor].nil?
											predecessors_ok = true
											@actions[id]['predecessors'].each { |pid|
												predecessors_ok = (predecessors_ok and @actions[pid][:executed])
											}
											next_actions << id if predecessors_ok
										end
									}
								end
								next_actions.each { |id| @actions[id][:executor] = tid }
							}
							if next_actions.length > 0
								# execute next actions
								action = @actions[next_actions[0]]
								if next_actions.length > 1
									for i in 1..(next_actions.length-1)
										assign_action_with_id(next_actions[i])
									end
								end
							end
								
						else
							Nuri::Util.error "Failed executing #{op_str}!"
							@mutex.synchronize {
								@failed = true # set global flag
								@actions_failed << action
							}
						end
					end

					@mutex.synchronize { @threads.delete(tid) }
				}
			end

			if params[:plan].nil? or not params[:plan].is_a?(Hash)
				raise ParallelExecutionException, 'Plan is not available.'
			elsif params[:plan]['type'].to_s == 'parallel' or
			      params[:plan][:type].to_s == 'parallel'
			else
				raise ParallelExecutionException, 'Not a parallel plan.'
			end

			@owner = params[:owner]

			@actions = params[:plan]['workflow']
			@actions.sort! { |x,y| x['id'] <=> y['id'] }
			@actions.each { |op| op[:executed] = false; op[:executor] = nil; }

			@threads = []
			@actions_failed = []
			@mutex = Mutex.new
			@failed = false
			@thread_id = 0

			params[:plan]['init'].each { |op_id| assign_action_with_id(op_id) }

			begin
				sleep 1
			end while @threads.length > 0

			Nuri::Util.log "Using #{@thread_id} threads in execution."

			return (not @failed)
		end

		def execute_sequential_plan(params={})
			if params[:plan].nil? or not params[:plan].is_a?(Hash)
				raise ParallelExecutionException, 'Plan is not available.'
			elsif params[:plan]['type'].to_s == 'sequential' or
			      params[:plan][:type].to_s == 'sequential'
			else
				raise ParallelExecutionException, 'Not a parallel plan.'
			end

			owner = params[:owner]
			params[:plan]['workflow'].each { |action| return false if not owner.execute_action { action } }
			true
		end
	end
end
