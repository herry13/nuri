require 'thread'

module Nuri::Orchestrator
	include Nuri::Helper

	def execute_plan(options={})
		raise Exception, "Plan file is not exist!" if not File.exist?(options[:execute].to_s) and !options[:plan]
		raise Exception, "Plan is not exist (parameter :plan must be given)!" if !options[:plan]

		push_agents_list

		success = false
		benchmark = Benchmark.measure {
			plan = (options[:plan] ? options[:plan] : JSON[File.read(options[:execute])])
			raise Exception, "No plan." if plan['workflow'].nil?
			if plan.is_a?(Hash) and plan['type'] == 'sequential'
				success = execute_sequential_plan(plan, options)
			elsif plan.is_a?(Hash) and plan['type'] == 'parallel'
				success = execute_parallel_plan(plan, options)
			else
				raise Exception, "Invalid plan."
			end
		}
		puts "Execution " + format_benchmark(benchmark)

		success
	end

	protected
	def send_action_data(action, address, port, options={})
		action['parameters'].each do |name,value|
			next if !value.is_a?(String) or !value.isref or value.split('.').length > 2
			_, target_name = value.split('.', 2)
			data = {'model' => Sfp::Helper.deep_clone(@model[target_name])}
			data.accept(Sfp::Visitor::ParentEliminator.new)
			data = {'model' => JSON.generate(data)}
			code = nil
			begin
				code, _ = put_data(address, port, "/model/cache/#{target_name}", data)
			rescue
			end
			if code != '200'
				$stderr.print "Sending action data of #{value} to #{address}:#{port} "
				$stderr.puts (options[:color] ? "[Failed]".red : "[Failed]")
				return false
			end
		end

		true
	end

	def execute_action(action, options={})
		_, agent_name, _ = action['name'].split('.', 3)
		agents = get_agents

		return false if !agents[agent_name]['sfpAddress'].is_a?(String)

		address = agents[agent_name]['sfpAddress'].to_s
		port = agents[agent_name]['sfpPort'].to_s

		raise Exception, "Cannot find address:port of agent #{agent_name}" if
			address.length <= 0 or port.length <= 0

		send_action_data(action, address, port, options)

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

	def execute_sequential_plan(plan, options)
		begin
			index = 1 
			plan['workflow'].each do |action|
				puts "#{index}. #{action['name']} #{JSON.generate(action['parameters'])} " + (options[:color] ? "[Wait]".yellow : "[Wait]")
				if execute_action(action, options)
					puts "#{index}. #{action['name']} #{JSON.generate(action['parameters'])} " + (options[:color] ? "[OK]".green : "[OK]")
				else
					puts "#{index}. #{action['name']} #{JSON.generate(action['parameters'])} " + (options[:color] ? "[Failed]".red : "[Failed]")
					return false
				end 
				index += 1
			end 
			return true
		rescue Exception => e
			$stderr.puts "#{e}\n#{e.backtrace.join("\n")}"
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

		def assign_action_with_id(id, options={})
			thread_id = next_thread_id
			action = @actions[id]
			action[:executor] = thread_id
			self.thread_execute_action(thread_id, action, options)
		end

		def thread_execute_action(tid, action, options={})
			t = Thread.new {
				# Register the thread
				@mutex.synchronize { @threads << tid }

				while not @failed and not action[:executed]
					# Try to execute the action
					puts "Executing #{action[:string]} - thread ##{tid} " + (options[:color] ? "[Wait]".yellow : "[Wait]")
					success = false
					1.upto(@retries) do |i|
						begin
							success = execute_action(action, options)
						rescue Exception => exp
							puts "Executing(#{i}) #{action[:string]} - thread ##{tid} " + (options[:color] ? "[Failed]".red : "[Failed]")
							puts "#{exp}" #\n#{exp.backtrace.join("\n")}"
						end
						break if success
					end

					# Check if execution failed
					if success
						# Execution was success
						puts "Executing #{action[:string]} - thread ##{tid} " + (options[:color] ? "[OK]".green : "[OK]")
						next_actions = []
						@mutex.synchronize {
							action[:executed] = true # set executed flag
							# select next action to be executed from successor actions list
							# select a successor action that has not been assigned to any thread yet
							if action['successors'].length > 0
								action['successors'].each { |id|
									if @actions[id][:executor].nil?
										# check if all predecessors actions have been executed
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
								# execute other next actions to other threads
								for i in 1..(next_actions.length-1)
									assign_action_with_id(next_actions[i], options)
								end
							end
						end

					else
						# Execution was failed
						puts "Executing #{action[:string]} - thread ##{tid} " + (options[:color] ? "[Failed]".red : "[Failed]")
						@mutex.synchronize {
							@failed = true # set global flag to stop the execution
							@actions_failed << action
						}
					end
				end

				@mutex.synchronize { @threads.delete(tid) }
			}
		end

		### execute actions without predecessor
		plan['init'].each { |id| assign_action_with_id(id, options) }
		begin
			sleep 1
		end while @threads.length > 0
		(not @failed)
	end
end
