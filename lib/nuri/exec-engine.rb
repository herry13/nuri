#!/usr/bin/env ruby

require 'thread'

module Nuri
	module Execution
		class ParallelExecutionException < Exception; end

		def parallel_execute(params={})
			def execute_operator(operator)
				return false if not self.execute(operator, node)
				self.update_system
			end

			def assign_operator_with_id(id)
				thread_id = next_thread_id
				operator = @operators[id]
				operator[:executor] = thread_id
				self.thread_execute_operator(thread_id, operator)
			end

			def next_thread_id
				id = 0
				@mutex.synchronize { @thread_id = id = @thread_id + 1 }
				id
			end

			def operator_to_string(operator)
				"#{operator['id']}:#{operator['name']}#{JSON.generate(operator['parameters'])}"
			end

			def thread_execute_operator(tid, operator)
				t = Thread.new {
					@mutex.synchronize { @threads << tid }

					while not @failed and not operator[:executed]
						# execute the operator
						op_str = operator_to_string(operator)
						#Nuri::Util.debug "[ExecutorThread: #{tid}] #{op_str}"
						success = execute_action(operator)

						# check if execution failed
						if success
							next_operators = []
							@mutex.synchronize {
								# set executed
								operator[:executed] = true
								# select next operator to be executed from all predecessor operators
								# if each operator has not been assigned to any thread yet
								if operator['successors'].length > 0
									operator['successors'].each { |id|
										if @operators[id][:executor].nil?
											predecessors_ok = true
											@operators[id]['predecessors'].each { |pid|
												predecessors_ok = (predecessors_ok and @operators[pid][:executed])
											}
											next_operators << id if predecessors_ok
										end
									}
								end
								next_operators.each { |id| @operators[id][:executor] = tid }
							}
							if next_operators.length > 0
								# execute next operators
								operator = @operators[next_operators[0]]
								if next_operators.length > 1
									for i in 1..(next_operators.length-1)
										assign_operator_with_id(next_operators[i])
									end
								end
							end
								
						else
							Nuri::Util.error "Failed executing #{op_str}!"
							@failed = true # set global flag
							@mutex.synchronize { @operators_failed << operator }
						end
					end

					@mutex.synchronize { @threads.delete(tid) }
				}
			end

			Nuri::Util.set_debug(true)

			if params[:plan].nil? or not params[:plan].is_a?(Hash)
				raise ParallelExecutionException, 'Plan is not available.'
			elsif params[:plan]['type'] != 'parallel'
				raise ParallelExecutionException, 'Not a parallel plan.'
			end

			@operators = params[:plan]['workflow']
			@operators.sort! { |x,y| x['id'] <=> y['id'] }
			@operators.each { |op| op[:executed] = false; op[:executor] = nil; }

			@threads = []
			@operators_failed = []
			@mutex = Mutex.new
			@failed = false
			@thread_id = 0

			params[:plan]['init'].each { |op_id| assign_operator_with_id(op_id) }

			begin
				sleep 1
			end while @threads.length > 0

			return (not @failed)
		end

		class Sequential
			def execute(params={})
				# TODO
			end
		end
	end
end
