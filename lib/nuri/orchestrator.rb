require 'thread'

module Nuri::Orchestrator
	include Nuri::Net::Helper

	def execute_plan(p={})
		raise Exception, "Plan file is not exist!" if not File.exist?(p[:execute]) and !p[:plan]
		raise Exception, "Plan is not exist (parameter :plan must be given)!" if !p[:plan]

		push_agents_list

		plan = (p[:plan] ? p[:plan] : JSON[File.read(p[:execute])])
		raise Exception, "Invalid plan!" if plan['workflow'].nil?
		if plan['type'] == 'sequential'
			execute_sequential_plan(plan, p)
		else
			execute_parallel_plan(plan, p)
		end
	end

	protected
	def execute_action(action)
		_, agent_name, _ = action['name'].split('.', 3)
		agents = get_agents

		return false if !agents[agent_name]['sfpAddress'].is_a?(String)

		address = agents[agent_name]['sfpAddress'].to_s
		port = agents[agent_name]['sfpPort'].to_s

		raise Exception, "Cannot find address:port of agent #{agent_name}" if
			address.length <= 0 or port.length <= 0

		return true if @mock		

		data = {'action' => JSON.generate(action)}
		code, _ = post_data(address, port, '/execute', data)
		if code.to_i == 200
			# if the action is "create_vm" or "delete_vm", then
			# update the VMs' address, and then push agents list
			postprocess_create_or_delete_vm(action) if action['name'] =~ /^\$(\.[a-zA-Z0-9_]+)*\.(create_vm|delete_vm)/
			true
		else
			false
		end
	end

	def postprocess_create_or_delete_vm(action)
		@mutex_postprocess = Mutex.new if !defined?(@mutex_postprocess)

		@mutex_postprocess.synchronize {
			_, agent_name, _ = action['name'].split('.', 3)
	
			state = {agent_name => get_node_state(agent_name)}
			vms1, vms2 = update_vms_address(state)
	
			if action['name'] =~ /^\$(\.[a-zA-Z0-9_]+)*\.(create_vm)/
				vm_name = action['parameters']['$.vm'].sub(/^\$\./, '')
				get_node_state(vm_name, true)
				
			elsif action['name'] =~ /^\$(\.[a-zA-Z0-9_]+)*\.(delete_vm)/
				model = @model.at?(action['parameters']['$.vm'])
				if model.is_a?(Hash)
					model['sfpAddress'] = {'_context'=>'any_value','_isa'=>'$.String'}
					model['sfpPort'] = {'_context'=>'any_value','_isa'=>'$.Number'}
				end
			end
	
			push_agents_list
		}
	end

	def execute_sequential_plan(plan, p)
		begin
			index = 1 
			plan['workflow'].each do |action|
				print "#{index}. #{action['name']} #{JSON.generate(action['parameters'])}... "
				if execute_action(action)
					puts "[OK]".green
				else
					puts "[Failed]".red
					return false
				end 
				index += 1
			end 
			return true
		rescue Exception => e
			puts "#{e}\n#{e.backtrace.join("\n")}".red
		end 
		false
	end 

	def execute_parallel_plan(plan, options)
		@retries = 2

		@actions = plan['workflow']
		@actions.sort! { |x,y| x['id'] <=> y['id'] }
		@actions.each { |op|
			op[:executed] = false
			op[:executor] = nil
			op[:string] = "#{op['id'] + 1}: #{op['name']} #{JSON.generate(op['parameters'])}"
		}		

		@out = Logger.new(STDOUT)
		@out.formatter = proc do |severity, datetime, progname, msg|
			dt = datetime.split(' ')
			"[#{dt[0]} #{dt[1]}] #{severity} #{msg}\n"
		end

		@threads = []
		@actions_failed = []
		@mutex = Mutex.new
		@failed = false
		@thread_id = 0

		def next_thread_id
			id = 0
			@mutex.synchronize { @thread_id = id = @thread_id + 1 }
			id
		end

		def assign_action_with_id(id)
			thread_id = next_thread_id
			action = @actions[id]
			action[:executor] = thread_id
			self.thread_execute_action(thread_id, action)
		end

		def thread_execute_action(tid, action)
			t = Thread.new {
				# Register the thread
				@mutex.synchronize { @threads << tid }

				while not @failed and not action[:executed]
					# Try to execute the action
					@out.info "Executing #{action[:string]} - thread ##{tid} [WAIT]".yellow
					success = false
					1.upto(@retries) do |i|
						begin
							success = execute_action(action)
						rescue Exception => exp
							@out.error "Executing(#{i}) #{action[:string]} - thread ##{tid} [FAILED]\n#{exp}\n#{exp.backtrace.join("\n")}"
						end
						break if success
					end

					# Check if execution failed
					if success
						# Execution was success
						@out.info "Executing #{action[:string]} - thread ##{tid} [OK]".green
						next_actions = []
						@mutex.synchronize {
							action[:executed] = true # set executed
							# select next action to be executed from successor actions list
							# select a successor action that has not been assigned to any thread yet
							if action['successors'].length > 0
								action['successors'].each { |id|
									if @actions[id][:executor].nil?
										# check if all predecessors actions have been executed
										predecessors_ok = true
										@actions[id]['predecessors'].each { |pid|
											predecessors_ok = (predecessors_ok and @actions[pid][:executed])
										}
										# assign this action to be executed by this thread if all predecessors
										# have been executed
										next_actions << id if predecessors_ok
									end
								}
							end
							next_actions.each { |id| @actions[id][:executor] = tid }
						}
						if next_actions.length > 0				
							# execute the first next actions to this thread
							action = @actions[next_actions[0]]
							if next_actions.length > 1
								# execute other next actions to other threads
								for i in 1..(next_actions.length-1)
									assign_action_with_id(next_actions[i])
								end
							end
						end

					else
						# Execution was failed
						@out.error "Executing #{action[:string]} - thread ##{tid} [FAILED]".red
						@mutex.synchronize {
							@failed = true # set global flag to stop the execution
							@actions_failed << action
						}
					end
				end

				@mutex.synchronize { @threads.delete(tid) }
			}
		end

		plan['init'].each { |id| assign_action_with_id(id) }
		begin
			sleep 1
		end while @threads.length > 0
		(not @failed)
	end
end
