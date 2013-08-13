require 'uri'
require 'net/http'
require 'thread'

module Sfp::Helper::Constraint
	def self.equals(value)
		{ '_context' => 'constraint', '_type' => 'equals', '_value' => value }
	end

	def self.and(name)
		{ '_context' => 'constraint', '_type' => 'and', '_self' => name }
	end
end

class Nuri::Master
	include Nuri::Net::Helper

	SfpUnknown = Sfp::Unknown.new
	SfpUndefined = Sfp::Undefined.new

	AgentSchema = '$.Node'
	CloudSchema = '$.Cloud'
	VMSchema = '$.VM'

	ModulesDir = File.expand_path(File.dirname(__FILE__)) + "/../../modules"

	attr_accessor :mock
	attr_reader :model

	def initialize(p={})
		@cloudfinder = Sfp::Helper::CloudFinder.new
		set_model(p)
	end

	def set_model(p={})
		@model = (p.is_a?(Hash) and p[:model].is_a?(Hash) ? p[:model] : {})
		push_agents_list if @model.length > 0

		# find a list of cloud proxy
		@model.accept(@cloudfinder.reset)

		# create a set of not-exist VMs' state
		@map = generate_not_exist_vm_state(false)
	end

	def set_model_file(p={})
		if p[:model_file]
			home_dir = File.expand_path File.dirname(p[:model_file])
			@parser = Sfp::Parser.new({:home_dir => home_dir})
			@parser.parse File.read(p[:model_file])
			set_model(:model => @parser.root)
		end
	end

	def execute_plan(p={})
		raise Exception, "Plan file is not exist!" if not File.exist?(p[:execute]) and
			!p[:apply]

		push_agents_list

		plan = (p[:apply] ? p[:apply] : JSON[File.read(p[:execute])])
		raise Exception, "Invalid plan!" if plan['workflow'].nil?
		if plan['type'] == 'sequential'
			execute_sequential_plan(plan, p)
		else
			execute_parallel_plan(plan, p)
		end
	end

	def get_plan(p={})
		task = get_schemata

		print "Getting current state: "
		puts Benchmark.measure { task['initial'] = to_state('initial', get_state(p)) }

		task['initial'].accept(Sfp::Visitor::SfpGenerator.new(task))
		f1 = Sfp::Helper::SfpFlatten.new
		task['initial'].accept(f1)

		# modify condition of procedures of each VM's component
		# modification: add constraint "$.vm.created = true"
		task['initial'].accept(VMProcedureModifier.new(task['initial']))

		# construct goal state		
		goalgen = GoalGenerator.new
		get_agents.accept(goalgen)
		task['goal'] = goalgen.results

		# find dead-node, remove from the task, print WARNING to the console
		dead_nodes = task['initial'].select { |k,v| v.is_a?(Sfp::Unknown) }
		dead_nodes.each_key { |name|
			task['initial'].delete(name)
			task['goal'].keep_if { |k,v| !(k =~ /(\$\.#{name}\.|\$\.#{name}$)/) }
			puts "[WARN] Removing node #{name} from the task.".red
		}

		# print the status of goal state
		puts "Goal state:".yellow
		goalgen.results.each { |k,v|
			next if k[0,1] == '_'
			print "- #{k}: " + Sfp::Helper.sfp_to_s(v['_value']).green
			print " #{Sfp::Helper.sfp_to_s(f1.results[k])}".red if f1.results.has_key?(k) and
				f1.results[k] != v['_value']
			puts ""
		}

		# add global constraint (if exist)
		task['global'] = @model['global'] if @model.has_key?('global')

		# add sometime constraint (if exist)
		task['sometime'] = @model['sometime'] if @model.has_key?('sometime')

		# remove old parent links, and then reconstruct SFP parent links
		task.accept(ParentEliminator)

		# debug
		#puts JSON.pretty_generate(task)

		# rebuild SFP data-structure
		task.accept(Sfp::Visitor::SfpGenerator.new(task))

		plan = nil
		planning_time = Benchmark.measure do
			planner = Sfp::Planner.new
			plan = planner.solve({:sfp => task, :sas_post_processor => self, :parallel => p[:parallel]})
		end
		puts "Planning: #{planning_time}"
		plan
	end

	# post processing SAS after compilation
	# goal: to add additional effects whenever a VM is deleted
	def sas_post_processor(parser)
		return if parser.operators.nil?
		parser.operators.each do |name, operator|
			# skip if it's not "delete_vm"
			next if !(name =~ /\.delete_vm$/) or !operator.params.has_key?('$.vm')
			vm = operator.params['$.vm'].sub(/^\$\./, '')
			next if !@map.has_key?(vm)

			# for each not-exist state VM, add an effect
			@map[vm].each { |k,v|
				next if operator.has_key?(k) # skip if variable is exist (avoid overwrite)
				next if k =~ /\.sfpAddress/ or k =~ /\.sfpPort/ # skip "sfpAddress" and "sfpPort"
				                                                # because these will be assigned dynamically
				var = parser.variables[k]
				next if var.nil? # the variable is not found

				if v.is_a?(Hash)
					val = parser.types[v['_value']][0] if v['_context'] == 'null'
					raise Exception, "Not implemented yet." # this may arise on Set values
				else
					val = v
				end

				# add the value to variable's values
				var << val  
				var.uniq!
	
				# create new parameter, and then add to the operator
				parameter = Sfp::Parameter.new(var, nil, val)
				operator[var.name] = parameter
			}
		end
	end

	def get_state(p={})
		state = {}
		template = get_schemata
		vms = get_vms
		agents = get_agents

		# push agents list to each agent
		push_agents_list

		# get state of non-VM nodes
		(agents.keys - vms.keys).each do |name|
			model = agents[name]
			push_modules(model) if p[:push_modules]
			template[name] = model
			state[name] = get_node_state(name, template)
			template.delete(name)
		end

		# assign VMs' address
		exist_vms, not_exist_vms = assign_vm_address(state, vms)

		# get state of VM nodes
		exist_vms.each { |name,model| state[name] = get_exist_vm_state(name, model, template, p) }
		not_exist_vms.each { |name,model| state[name] = get_not_exist_vm_state(model) }

		@cloudfinder.clouds.each do |cloud|
			# for each servers list of a cloud proxy, assign "in_cloud" attribute
			# to associated VM
			state.at?("#{cloud}.servers").each { |name, data|
				next if not vms.has_key?(name)
				if state[name].is_a?(Hash)
					state[name]['in_cloud'] = cloud
				elsif state[name].is_a?(Sfp::Unknown)
					state[name] = get_dead_vm_state(name, cloud)
				end
			}
		end

		state
	end

	protected
	def get_dead_vm_state(name, cloud)
		# TODO -- this should return the same structure as method "generate_not_exist_vm_state"
=begin
		{
			'sfpAddress' => @model[name]['sfpAddress'],
			'sfpPort' => @model[name]['sfpPort'],
			'created' => !cloud.nil?,
			'in_cloud' => cloud,
			'os' => SfpUnknown
		}
=end
		SfpUnknown
	end

	def get_node_state(name, model)
		begin
			if send_agent_model(name, model)
				agent_state = get_agent_state(name, model)
				raise Exception, "Cannot get the current state of #{name}" if agent_state.nil?
				return agent_state[name]
			end
		rescue Exception => e
			puts "[WARN] Cannot get the current state of #{name} : #{e}".red
		end
		SfpUnknown
	end

	def generate_not_exist_vm_state(with_final_attribute=true)
		map = {}
		get_vms.each do |name,model|
			state = {name => get_not_exist_vm_state(model)}
			state.accept(FinalAttributeRemover) if not with_final_attribute
			state.accept(ParentGenerator)
			flatten = Sfp::Helper::SfpFlatten.new
			state.accept(flatten)
			map[name] = {}
			flatten.results.each { |k,v| map[name][k] = v }
		end
		map
	end

	def get_not_exist_vm_state(model)
		s = {'state' => Sfp::Helper.deep_clone(model)}
		s.accept(ParentEliminator)
		s.accept(VisitorNotExistNodeState)
		s['state']['created'] = false
		s['state']['in_cloud'] = {'_context' => 'null', '_value' => CloudSchema}
		s['state']
	end

	def get_exist_vm_state(name, model, template, p={})
		push_modules(model) if p[:push_modules]
		template[name] = model
		state = get_node_state(name, template)
		template.delete(name)
		state
	end

	def assign_vm_address(state, vms)
		# Reset sfpAddress, sfpPort, in_cloud of a VM if it's not found in
		# previously assigned cloud
		vms.each do |name,model|
			next if !model['in_cloud'].is_a?(String) or !model['in_cloud'].isref
			cloud, _ = @cloudfinder.clouds.select { |cloud| model['in_cloud'] == cloud }
			if !cloud.nil? and !state.at?("#{cloud}.servers").has_key? name
				vms[name]['sfpAddress'] = {'_context'=>'any_value','_isa'=>'$.String'}
				vms[name]['sfpPort'] = {'_context'=>'any_value','_isa'=>'$.Number'}
			end
		end

		@cloudfinder.clouds.each do |cloud|
			# for each servers list of a cloud proxy, assign the available
			# ip address
			state.at?("#{cloud}.servers").each { |name, data|
				next if not vms.has_key?(name)
				vms[name]['sfpAddress'] = data['ip']
				vms[name]['sfpPort'] = 1314
			}
		end

		exist_vms = vms.select { |k,v| v['sfpAddress'].is_a?(String) and v['sfpAddress'] != '' }
		not_exist_vms = vms.select { |k,v| !exist_vms.has_key?(k) }
		[exist_vms, not_exist_vms]
	end

	def push_agents_list
		begin
			agents = {}
			# generate agents list
			get_agents.each do |name, model|
				address = model['sfpAddress'].to_s.strip
				port = model['sfpPort'].to_s.strip.to_i
				next if address == '' or port == 0
				agents[name] = {:sfpAddress => address, :sfpPort => port}
			end
			data = {'agents' => JSON.generate(agents)}
	
			# send the list to all agents
			agents.each do |name, info|
				code, _ = put_data(info[:sfpAddress], info[:sfpPort], '/agents', data)
				raise Exception, "Push agents list to #{info[:sfpAddress]}:#{info[:sfpPort]} [Failed]" if code.to_i != 200
			end
			return true
		rescue Exception => exp
			$stderr.puts "#{exp}\n#{exp.backtrace.join("\n")}"
		end
		false
	end

	def push_modules(agent_model)
		address = agent_model['sfpAddress'].to_s.strip
		port = agent_model['sfpPort'].to_s.strip
		return if address == '' or port == ''

		name = agent_model['_self']
		finder = Sfp::Helper::SchemaCollector.new
		{:agent => agent_model}.accept(finder)
		schemata = finder.schemata.uniq.map { |x| x.sub(/^\$\./, '').downcase }

		begin
			# get modules list
			code, body = get_data(address, port, '/modules')
			raise Exception, "Unable to get modules list from #{address}:#{port}" if code.to_i != 200
			modules = JSON[body]
			schemata.each { |m|
				if m != 'object' and File.exist? "#{ModulesDir}/#{m}"
					if not modules.has_key?(m) or modules[m] != get_module_hash(m).to_s
						print "Push module #{m} to #{name} ".yellow
						puts (system("cd #{ModulesDir}; ./install_module #{address} #{port} #{m} 1>/dev/null 2>/dev/null") ?
							"[OK]".green : "[Failed]".red)
					end
				end
			}
			return true
		rescue Exception => e
			puts "[WARN] Cannot push module to #{name}".red
		end
		false
	end

	def get_module_hash(name)
		module_dir = "#{ModulesDir}/#{name}"
		if File.directory? module_dir
			if `which md5sum`.strip.length > 0
				return `find #{module_dir} -type f -exec md5sum {} + | awk '{print $1}' | sort | md5sum | awk '{print $1}'`.strip
			elsif `which md5`.strip.length > 0
				return `find #{module_dir} -type f -exec md5 {} + | awk '{print $4}' | sort | md5`.strip
			end
		end
		nil
	end

	def send_agent_model(name, agent_model)
		address = agent_model[name]['sfpAddress'].to_s.strip
		port = agent_model[name]['sfpPort'].to_s.strip
		return false if address == '' or port == ''

		agent_model = Sfp::Helper.deep_clone(agent_model)
		agent_model.accept(ParentEliminator)

		data = {'model' => JSON.generate(agent_model)}
		code, _ = put_data(address, port, '/model', data)
		code.to_i == 200
	end

	def get_agent_state(name, agent_model)
		address = agent_model[name]['sfpAddress'].to_s.strip
		port = agent_model[name]['sfpPort'].to_s.strip
		if address != '' and port != ''
			code, body = get_data(address, port, '/sfpstate')
			if code.to_i == 200 and body.length >= 2
				state = JSON[body]
				return state['state'] if state.is_a?(Hash)
				return state
			end
		end
		nil
	end

	def get_schemata
		@model.select { |k,v| k[0,1] != '_' and v.is_a?(Hash) and
			v['_context'] == 'class'
		}
	end

	def get_agents
		@model.select { |k,v| !(k[0,1] == '_' or not v.is_a?(Hash) or
			v['_context'] != 'object' or v['_classes'].index(AgentSchema).nil?)
		}
	end

	def get_vms
		get_agents.select { |k,v| not v['_classes'].index(VMSchema).nil? }
	end

	def to_state(name, value)
		raise Exception, 'Given value should be a Hash!' if not value.is_a?(Hash)
		value['_self'] = name
		value['_context'] = 'state'
		value
	end

	# Given agent's name that owns a cloud proxy
	# - update its state
	# - update the address of VMs
	#
	def update_cloud_addresses(name)
		vms1 = get_exist_vms

		template = get_schemata
		model = @model[name]
		template[name] = model
		state = {name => get_node_state(name, template)}
		assign_vm_address(state, get_vms)
		template.delete(name)

		vms2 = get_exist_vms

		if vms2.length > vms1.length
			# update the state of new VMs
			puts "\nPush model and update state of new VMs: " + (vms2.keys - vms1.keys).inspect
			(vms2.keys - vms1.keys).each { |name|
				push_modules(vms2[name])
				template[name] = vms2[name]
				get_node_state(name, template)
				template.delete(name)
			}
		end
	end

	def get_exist_vms
		get_vms.select { |name,model| model['sfpAddress'].is_a?(String) and
			model['sfpAddress'] != '' }
	end

	def execute_sequential_plan(plan, p)
		puts "Executing a sequential plan..."
		agents = get_agents
		begin
			index = 1
			plan['workflow'].each do |action|
				print "#{index}. #{action['name']} #{JSON.generate(action['parameters'])}... "
				if execute_action(action, agents)
					# if the action is "create_vm" or "delete_vm", then
					# update the VMs' address, and then push agents list
					if action['name'] =~ /^\$(\.[a-zA-Z0-9_]+)*\.(create_vm|delete_vm)/
						_, agent_name, _ = action['name'].split('.', 3)
						update_cloud_addresses(agent_name)
						push_agents_list
					end
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

	def execute_action(action, agents)
		_, agent_name, _ = action['name'].split('.', 3)
		address = agents[agent_name]['sfpAddress'].to_s
		port = agents[agent_name]['sfpPort'].to_s
		raise Exception, "Cannot find address:port of agent #{agent_name}" if
			address.length <= 0 or port.length <= 0

		return true if @mock		

		data = {'action' => JSON.generate(action)}
		code, _ = post_data(address, port, '/execute', data)
		(code.to_i == 200)
	end

	def execute_parallel_plan(plan, options)
		puts "Executing a parallel plan..."

		@agents = get_agents
		@retry = 2

		@actions = plan['workflow']
		@actions.sort! { |x,y| x['id'] <=> y['id'] }
		@actions.each { |op|
			op[:executed] = false
			op[:executor] = nil
			op[:string] = "#{op['id']}: #{op['name']} #{JSON.generate(op['parameters'])}"
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

		def assign_action_with_id(id)
			thread_id = next_thread_id
			action = @actions[id]
			action[:executor] = thread_id
			self.thread_execute_action(thread_id, action)
		end

		def thread_execute_action(tid, action)
			t = Thread.new {
				@mutex.synchronize { @threads << tid }

				while not @failed and not action[:executed]
					# execute the action
					puts "Executing #{action[:string]} [WAIT]".yellow
					num = @retry
					begin
						success = execute_action(action, @agents)
						num -= 1
					end while not success and num > 0

					# check if execution failed
					if success
						puts "Executing #{action[:string]} [OK]".green
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
						$stderr.puts "Executing #{action[:string]} [FAILED]".red
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


	SfpUndefinedString = Sfp::Undefined.create('$.String')
	SfpUndefinedNumber = Sfp::Undefined.create('$.Number')
	SfpUndefinedBoolean = Sfp::Undefined.create('$.Boolean')

	VisitorNotExistNodeState = Object.new
	def VisitorNotExistNodeState.visit(name, value, parent)
		return false if name[0,1] == '_'
		if not value.is_a?(Hash)
			if value.is_a?(String)
				if value.isref
					ref_value = parent.at?(value)
					# TODO - need to handle a reference to a primitive value
					if ref_value.is_a?(Hash) and ref_value.isobject
						parent[name] = Sfp::Undefined.create(ref_value['_isa'])
					else
						puts "[WARN] Sfp::Undefined => #{parent.ref.push(name)}: #{value.class.name}"
						parent[name] = SfpUndefined
					end
				else
					parent[name] = SfpUndefinedString
				end
			elsif value.is_a?(Fixnum) or value.is_a?(Float)
				parent[name] = SfpUndefinedNumber
			elsif value.is_a?(TrueClass) or value.is_a?(FalseClass)
				parent[name] = SfpUndefinedBoolean
			else
				puts "[WARN] Sfp::Undefined => " + parent.ref.push(name) + ": " + value.class.name
				parent[name] = SfpUndefined
			end
		elsif value['_context'] == 'null' or value['_context'] == 'any_value'
			parent[name] = Sfp::Undefined.create(value['_isa'])
		elsif value['_context'] != 'object'
			parent.delete(name)
		end
		true
	end

	class VMProcedureModifier
		def initialize(root)
			@root = root
		end

		def visit(name, value, parent)
			return false if name[0,1] == '_'
			if value.is_a?(Hash) and value['_context'] == 'procedure'
				_, agent, _ = parent.ref.split('.', 3)
				if not @root[agent]['_classes'].index(VMSchema).nil?
					value['_condition']["$.#{agent}.created"] = Sfp::Helper::Constraint.equals(true)
				end
			end
			true
		end
	end

	ParentEliminator = ::Sfp::Visitor::ParentEliminator.new

	ParentGenerator = Object.new
	def ParentGenerator.visit(name, value, parent)
		value['_parent'] = parent if value.is_a?(Hash)
		true
	end

	FinalAttributeRemover = Object.new
	def FinalAttributeRemover.visit(name, value, parent)
		if value.is_a?(Hash) and value.has_key?('_finals')
			value['_finals'].each { |attr| value.delete(attr) }
		end
		true
	end

	SfpUnknownRemover = Object.new
	def SfpUnknownRemover.visit(name, value, parent)
		parent.delete(name) if value.is_a?(Sfp::Unknown)
		true
	end

	def self.start
		# TODO
		fork {
			while true do
				sleep 5000
			end
		}
	end

	def self.stop
		# TODO
	end
end

### Helper classes/modules

class Nuri::Master::GoalGenerator
	attr_reader :results

	def initialize
		@results = Sfp::Helper::Constraint.and('goal')
	end
		
	def visit(name, value, parent)
		return false if name[0,1] == '_'

		if value.is_a?(Hash)
			return true if value['_context'] == 'object'

			if parent.has_key?('_finals') and parent['_finals'].index(name).nil?
				if value['_context'] == 'set'
					@results[parent.ref.push(name)] = Sfp::Helper::Constraint.equals(value['_values'])
				elsif value['_context'] == 'null'
					# HACK! This should not be commented => null value should not be ignored.
					#@results[parent.ref.push(name)] = Sfp::Helper::Constraint.equals(value)
				end
			end
			return false
		end
		if parent.has_key?('_finals') and parent['_finals'].index(name).nil?
			@results[ parent.ref.push(name) ] = Sfp::Helper::Constraint.equals(value)
		end
		false
	end
end

class Sfp::Helper::SfpFlatten
	attr_reader :results

	def initialize
		@results = {}
	end

	def visit(name, value, parent)
		return false if name[0,1] == '_'
		if value.is_a?(Hash)
			return true if value['_context'] == 'object'

			@results[parent.ref.push(name)] = value if value['_context'] == 'null'
			@results[parent.ref.push(name)] = value if value['_context'] == 'set'

			return false
		end

		@results[parent.ref.push(name)] = value
		false
	end
end

module Sfp::Helper
	def self.sfp_to_s(v)
		if v.is_a?(Hash)
			return "null" if v['_context'] == 'null'
			return v['_values'].inspect if v['_context'] == 'set'
			return "<hash>"
		elsif v.is_a?(String) and v =~ /^\$\./
			return v #.sub(/^\$\./, '')
		end
		v.inspect
	end
end

class Sfp::Helper::SchemaCollector
	attr_reader :schemata
	def initialize
		@schemata = []
	end
		
	def visit(name, value, parent)
		if value.is_a?(Hash) and value.has_key?('_classes')
			value['_classes'].each { |s| @schemata << s }
		end
		true
	end
end

class Sfp::Helper::CloudFinder
	CloudSchema = '$.Cloud'
	attr_accessor :clouds

	def reset
		@clouds = []
		self
	end

	def visit(name, value, parent)
		if value.is_a?(Hash)
			if value['_context'] == 'object'
				@clouds << parent.ref.push(name) if value.has_key?('_classes') and value['_classes'].index(CloudSchema)
				return true
			end
		end
		false
	end
end

module Nuri::Console
	def self.print_state(p={})
		p[:state].accept(Sfp::Visitor::SfpGenerator.new(p[:state]))
		f = Sfp::Helper::SfpFlatten.new
		p[:state].accept(f)
		f.results.each { |k,v|
			value = (v.is_a?(String) ? v.sub(/^\$\./, '') : v)
			puts "- #{k}: #{value}"
		}
	end
end
