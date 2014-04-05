require 'thread'

class Nuri::Master
	include Nuri::Helper
	include Nuri::Orchestrator
	include Nuri::Choreographer

	SfpUnknown = Sfp::Unknown.new
	SfpUndefined = Sfp::Undefined.new

	AgentSchema = '$.Node'
	CloudSchema = '$.Cloud'
	VMSchema = '$.VM'

	InstallModule = File.dirname(__FILE__) + '/../../bin/nuri-install-module'

	attr_reader :model

	def initialize(p={})
		@mutex_vm_updater = Mutex.new
		@cloudfinder = Sfp::Helper::CloudFinder.new
		@local_agent = nil

		# set modules directory
		if p[:modules_dir] and File.directory?(p[:modules_dir])
			@modules_dir = File.expand_path(p[:modules_dir])
		elsif ENV['NURI_HOME'].is_a?(String) and ENV['NURI_HOME'].strip.length > 0
			@modules_dir = File.join(ENV['NURI_HOME'], 'modules')
		elsif File.directory?(File.expand_path(File.dirname(__FILE__) + '/../../modules'))
			@modules_dir = File.expand_path(File.dirname(__FILE__) + '/../../modules')
		elsif File.directory?(File.expand_path('./modules'))
			@modules_dir = File.expand_path('./modules')
		else
			@modules_dir = '/var/nuri/modules'
		end
		fail "Invalid modules directory #{@modules_dir}!" if !File.directory?(@modules_dir)

		@sas_post_processor = SASPostProcessor

		set_model(p)
	end

	def set_model(p={})
		if p[:model_file]
			home_dir = File.expand_path File.dirname(p[:model_file])
			@parser = Sfp::Parser.new({:home_dir => home_dir})
			@parser.parse File.read(p[:model_file])
			p[:model] = @parser.root
		end

		@model = (p.is_a?(Hash) and p[:model].is_a?(Hash) ? p[:model] : {})
		push_agents_list if @model.length > 0

		# find a list of cloud proxy
		@model.accept(@cloudfinder.reset)

		# create a set of not-exist VMs' state
		@map = generate_not_exist_vm_state(false)
		SASPostProcessor.set_map(@map)
	end

	def get_plan(p={})
		# set parameters value to be given to the planner
		p[:sfp] = create_plan_task(p)
		p[:sas_post_processor] = SASPostProcessor

		print "Planning "

		plan = nil
		planning_time = Benchmark.measure do
			planner = Sfp::Planner.new
			plan = planner.solve(p)
		end

		print (p[:no_color] ? "[Finish]" : "[Finish] ".green)
		puts format_benchmark(planning_time)

		plan
	end

	def get_state(p={})
		state = {}
		vms = get_vms
		agents = get_agents

		# push agents list to each agent
		push_agents_list

		mutex = Mutex.new

		# get state of non-VM nodes
		(agents.keys - vms.keys).each do |name|
			Thread.new {
				node_name = name
				node_state = get_node_state(node_name, !!p[:push_modules])
				mutex.synchronize { state[node_name] = node_state }
				state[node_name] = node_state
			}
		end
		total = agents.keys.length - vms.keys.length

		# wait until all threads have finish
		wait? { (state.length >= total) }

		# assign VMs' address
		exist_vms, not_exist_vms = update_vms_address(state)

		# get state of existing VM nodes
		exist_vms.each_key { |name|
			Thread.new {
				node_name = name
				node_state = get_node_state(node_name, !!p[:push_modules])
				mutex.synchronize { state[node_name] = node_state }
				state[node_name] = node_state
			}
		}

		# get state of non-existing VM nodes
		not_exist_vms.each { |name,model|
			state[name] = get_not_exist_vm_state(model)
		}

		# wait until all threads have finish
		wait? { (state.length >= agents.length) }

		# update <vm>.in_cloud value
		update_cloud_vm_relations(state, vms)

		agents.merge!(exist_vms)
		push_agents_list(agents, {:reset => true})

		state
	end

	protected
	def format_benchmark(benchmark)
		user = (benchmark.utime + benchmark.cutime).round(3)
		system = (benchmark.stime + benchmark.cstime).round(3)
		real = benchmark.real.round(3)
		"benchmark: user=#{user} sys=#{system} real=#{real}"
	end

	def create_plan_task(opts={})
		task = get_schemata

		print "Getting current state "
		putf "[Wait]", opts, :yellow

		benchmark = Benchmark.measure do
			task['initial'] = to_state('initial', get_state(opts))
		end
		#puts YAML.dump(task['initial'])

		puts "Getting current state #{f("[OK]", opts, :green)} #{format_benchmark(benchmark)}"

		task['initial'].accept(FinalAttributeRemover)
		task['initial'].accept(Sfp::Visitor::SfpGenerator.new(task))
		f1 = Sfp::Helper::SfpFlatten.new
		task['initial'].accept(f1)

		# modify condition of procedures of each VM's component
		# modification: add constraint "$.vm.created = true"
		task['initial'].accept(VMProcedureModifier.new(task['initial']))

		# construct goal state		
		goalgen = GoalGenerator.new
		goal = Sfp::Helper.deep_clone(get_agents)
		goal.accept(FinalAttributeRemover)
		goal.accept(goalgen)
		task['goal'] = goalgen.results

		# find dead-node, remove from the task, print WARNING to the console
		init = task['initial']
		init.keys.each do |name|
			next if not init[name].is_a?(Sfp::Unknown)
			init.delete(name)
			task['goal'].keep_if { |var,val| !(var =~ /(\$\.#{name}\.|\$\.#{name}$)/) }
			puts "#{f("[Warn]", opts, :yellow)} Remove node #{name} from the planning task."
		end

		# print the status of goal state
		puts "Goal state:"
		goalgen.results.each { |var,val|
			next if var[0] == '_'

			print "  #{var}: "
			value = Sfp::Helper::Sfp2Ruby.val(val['_value']).to_s
			print f(value, opts, :green)

			if f1.results.has_key?(var) and f1.results[var] != val['_value']
				value = Sfp::Helper::Sfp2Ruby.val(f1.results[var]).to_s
				print " ( #{f(value, opts, :red)} )"
			end

			puts ""
		}

		# add global constraint (if exist)
		task['global'] = @model['global'] if @model.has_key?('global')

		# add sometime constraint (if exist)
		task['sometime'] = @model['sometime'] if @model.has_key?('sometime')

		# remove old parent links, and then reconstruct SFP parent links
		task.accept(ParentEliminator)

		# rebuild SFP data-structure
		task.accept(Sfp::Visitor::SfpGenerator.new(task))

		task
	end

	def wait?
		until yield do
			sleep 1
		end
	end

	def get_dead_vm_state(model, cloud)
		s = {'state' => Sfp::Helper.deep_clone(model)}
		s.accept(VisitorDeadAgentNodeState)
		s.accept(ParentEliminator)
		s['state']['created'] = true
		s['state']['in_cloud'] = cloud
		s['state']
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
		state = Sfp::Helper.deep_clone(model)
		s = {'state' => state}
		s.accept(VisitorNotExistNodeState)
		s.accept(ParentEliminator)
		state['created'] = false
		state['in_cloud'] = {'_context' => 'null', '_value' => CloudSchema}
		state
	end

	def update_cloud_vm_relations(state, vms)
		@cloudfinder.clouds.each do |cloud|
			proxy = state.at?(cloud)
			next if not proxy.is_a?(Hash) or not proxy['vms'].is_a?(Hash)
			# for each VMs list of a cloud proxy, assign "in_cloud" attribute
			# to associated VM
			proxy['vms'].each do |name,data|
				next if not vms.has_key?(name)
				if state[name].is_a?(Hash)
					state[name]['in_cloud'] = cloud
					state[name]['created'] = true
				elsif state[name].is_a?(Sfp::Unknown)
					state[name] = get_dead_vm_state(vms[name], cloud)
				end
			end
		end
	end

	def update_vms_address(state)
		exist_vms = not_exist_vms = nil
		@mutex_vm_updater.synchronize {
			vms = get_vms

			# Reset sfpAddress, sfpPort, in_cloud of a VM if it's not found in
			# previously assigned cloud
			vms.each do |name,model|
				next if !model['in_cloud'].is_a?(String) or !model['in_cloud'].isref
				cloud, _ = @cloudfinder.clouds.select { |cloud| model['in_cloud'] == cloud }
				if !cloud.nil? and !state.at?("#{cloud}.vms").has_key?(name)
					vms[name]['sfpAddress'] = {'_context'=>'any_value','_isa'=>'$.String'}
					vms[name]['sfpPort'] = {'_context'=>'any_value','_isa'=>'$.Number'}
				end
			end
	
			@cloudfinder.clouds.each do |cloud|
				proxy = state.at?(cloud)
				next if not proxy.is_a?(Hash) or not proxy['vms'].is_a?(Hash)
				# for each VMs list of a cloud proxy, assign the available
				# ip address
				proxy['vms'].each do |name,data|
					if vms.has_key?(name) and data['running']
						vms[name]['sfpAddress'] = data['ip']
						vms[name]['sfpPort'] = 1314
					end
				end
			end
	
			exist_vms = vms.select { |k,v| v['sfpAddress'].is_a?(String) and v['sfpAddress'] != '' }
			not_exist_vms = vms.select { |k,v| !exist_vms.has_key?(k) }
		}
		[exist_vms, not_exist_vms]
	end

	def clear_agents_list
		get_agents.each do |name,model|
			begin
				next if not model['sfpAddress'].is_a?(String)
				address = model['sfpAddress'].to_s.strip
				port = model['sfpPort'].to_i
				next if address == '' or port <= 0
	
				code, _ = delete_data(address, port, '/agents')
				fail "Bad response: #{code}" if code != '200'
			rescue Exception => exp
				$stderr.puts f("[Warn] Cannot delete agents data on #{name} - #{model['sfpAddress']}:#{model['sfpPort']} - #{exp}", opts, :red)
				return false
			end
		end
		true
	end

	def push_agents_list(agents=nil, options={})
		begin
			agents ||= get_agents
			data = {}
			# generate agents list
			get_agents.each do |name, model|
				next if not model['sfpAddress'].is_a?(String)
				address = model['sfpAddress'].to_s.strip
				port = model['sfpPort'].to_s.strip.to_i
				next if address == '' or port <= 0
				data[name] = {:sfpAddress => address, :sfpPort => port}
			end
			json = {'agents' => JSON.generate(data)}

			# send the list to all agents
			data.each do |name, agent|
				if options[:reset]
					delete_data(agent[:sfpAddress], agent[:sfpPort], '/agents')
				end

				# update current agents list
				code, _ = put_data(agent[:sfpAddress], agent[:sfpPort], '/agents', json, 5, 20)
				raise Exception, "Push agents list to #{agent[:sfpAddress]}:#{agent[:sfpPort]} [Failed]" if code.to_i != 200
			end
			return true
		rescue Exception => exp
		end
		false
	end

	###############
	#
	# Push required modules to agent based on schemata available in agent's model
	#
	# @param agent_model    agent's model
	# @param address        agent's address (IP or DNS address)
	# @param port           agent's port
	#
	###############
	def push_modules(agent_model, address=nil, port=nil)
		if address.nil? or port.nil?
			return false if !agent_model.is_a?(Hash) or !agent_model['sfpAddress'].is_a?(String)
			address = agent_model['sfpAddress'].to_s.strip
			port = agent_model['sfpPort'].to_s.strip
		end

		return false if address == '' or port == ''

		name = agent_model['_self']
		finder = Sfp::Helper::SchemaCollector.new
		{:agent => agent_model}.accept(finder)
		schemata = finder.schemata.uniq.map { |x| x.sub(/^\$\./, '').downcase }

		begin
			# get modules list
			code, body = get_data(address, port, '/modules', DefaultHTTPOpenTimeout, 5)
			raise Exception, "Unable to get modules list from #{name}" if code.to_i != 200

			modules = JSON[body]
			tobe_installed_modules = []
			schemata.each do |name|
				module_dir = "#{@modules_dir}/#{name}"
				if File.exist?(module_dir) and
				   ( not modules.has_key?(name) or modules[name] != get_local_module_hash(name).to_s )
					tobe_installed_modules << name
				end
			end

			return true if tobe_installed_modules.length <= 0

			### install new modules and replace old ones
			list = tobe_installed_modules.join(" ")
			cmd = "#{InstallModule} #{address}:#{port} #{list}"
			output = JSON.parse(`cd #{@modules_dir}; #{cmd}`)
			if output['installed_modules'].length > 0
				putf "Push modules: #{output['installed_modules'].join(" ")} to agent #{name} [OK]", opts, :green
			end
			if output['missing_modules'].length > 0
				putf "Missing modules: #{output['missing_modules'].join(" ")}", opts, :red
			end

			return true

		rescue Exception => e
			putf "[WARN] Cannot push module to #{name} - #{e}", opts, :red
		end

		false
	end

	# return the list of Hash value of all modules
	#
	def get_local_module_hash(name)
		module_dir = "#{@modules_dir}/#{name}"
		if File.directory? module_dir
			if `which md5sum`.strip.length > 0
				return `find #{module_dir} -type f -exec md5sum {} + | awk '{print $1}' | sort | md5sum | awk '{print $1}'`.strip
			elsif `which md5`.strip.length > 0
				return `find #{module_dir} -type f -exec md5 {} + | awk '{print $4}' | sort | md5`.strip
			end
		end
		nil
	end

	def get_node_state(name, do_push_modules=false)
		push_modules(@model[name]) if do_push_modules

		model = get_schemata
		model[name] = @model[name]

		begin
			if http_send_agent_model(name, model)
				agent_state = http_get_agent_state(name, model)
				raise Exception, "Cannot get the current state of #{name}" if agent_state.nil?
				return agent_state[name]
			end
		rescue Exception => e
			putf "[WARN] Cannot get the current state of #{name} : #{e}", opts, :red
		end
		SfpUnknown
	end

	# send HTTP PUT request to push agent's model
	#
	def http_send_agent_model(name, model)
		return false if !model[name].is_a?(Hash) or !model[name]['sfpAddress'].is_a?(String)
		address = model[name]['sfpAddress'].to_s.strip
		port = model[name]['sfpPort'].to_s.strip
		if address != '' and port != ''
			model = Sfp::Helper.deep_clone(model)
			model.accept(ParentEliminator)
			data = {'model' => JSON.generate(model)}
			code, _ = put_data(address, port, '/model', data, DefaultHTTPOpenTimeout, 5)
			return (code.to_i == 200)
		end
		false
	end

	# send HTTP GET requst to get agent's state
	#
	def http_get_agent_state(name, model)
		return nil if !model[name].is_a?(Hash) or !model[name]['sfpAddress'].is_a?(String)
		address = model[name]['sfpAddress'].to_s.strip
		port = model[name]['sfpPort'].to_s.strip
		if address != '' and port != ''
			code, body = get_data(address, port, '/sfpstate', DefaultHTTPOpenTimeout, 20)
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

	def get_agents(model=nil)
		model ||= @model
		model.select { |k,v| !(k[0] == '_' or not v.is_a?(Hash) or
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

	def get_exist_vms
		get_vms.select { |name,model| model['sfpAddress'].is_a?(String) and
			model['sfpAddress'] != '' }
	end


	SfpUndefinedString = Sfp::Undefined.create('$.String')
	SfpUndefinedNumber = Sfp::Undefined.create('$.Number')
	SfpUndefinedBoolean = Sfp::Undefined.create('$.Boolean')

	VisitorNotExistNodeState = Object.new
	def VisitorNotExistNodeState.visit(name, value, parent)
		parent.delete(name) if name == '_parent'
		return false if name[0,1] == '_'
		if value.is_a?(Hash)
			case value['_context']
			when 'null', 'any_value'
				parent[name] = Sfp::Undefined.create(value['_isa'])
			when 'object'
				# do nothing
			when 'procedure'
				return false
			else
				parent.delete(name)
			end
		else
			if value.is_a?(String)
				if value.isref
					ref_value = parent.at?(value)
					# TODO - need to handle a reference to a primitive value
					if ref_value.is_a?(Hash) and (ref_value.isobject or ref_value.isnull)
						parent[name] = Sfp::Undefined.create(ref_value['_isa'])
					elsif ref_value.is_a?(Sfp::Undefined) or ref_value.is_a?(Sfp::Unknown)
						parent[name] = ref_value
					else
						#puts "[WARN] Sfp::Undefined => #{parent.ref.push(name)}: #{ref_value.class.name}"
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
				#puts "[WARN] Sfp::Undefined => " + parent.ref.push(name) + ": " + value.class.name
				parent[name] = SfpUndefined
			end
		end
		true
	end

	VisitorDeadAgentNodeState = Object.new
	def VisitorDeadAgentNodeState.visit(name, value, parent)
		return false if name[0,1] == '_'
		if not value.is_a?(Hash)
			if value.is_a?(String)
				if value.isref
					ref_value = parent.at?(value)
					# TODO - need to handle a reference to a primitive value
					if ref_value.is_a?(Hash) and (ref_value.isobject or ref_value.isnull)
						parent[name] = Sfp::Unknown.create(ref_value['_isa'])
					elsif ref_value.is_a?(Sfp::Unknown) or ref_value.is_a?(Sfp::Unknown)
						parent[name] = ref_value
					else
						#puts "[WARN] Sfp::Unknown => #{parent.ref.push(name)}: #{ref_value.class.name}"
						parent[name] = SfpUnknown
					end
				else
					parent[name] = Sfp::Unknown.create('$.String')
				end
			elsif value.is_a?(Fixnum) or value.is_a?(Float)
				parent[name] = Sfp::Unknown.create('$.Number')
			elsif value.is_a?(TrueClass) or value.is_a?(FalseClass)
				parent[name] = Sfp::Unknown.create('$.Boolean')
			else
				#puts "[WARN] Sfp::Unknown => " + parent.ref.push(name) + ": " + value.class.name
				parent[name] = SfpUnknown
			end
		elsif value['_context'] == 'null' or value['_context'] == 'any_value'
			parent[name] = Sfp::Unknown.create(value['_isa'])
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

	SASPostProcessor = Object.new
	# set a map of VM-name => VM-model
	def SASPostProcessor.set_map(map)
		@map = map
	end
	# post processing SAS after compilation
	# goal: to add additional effects whenever a VM is deleted
	def SASPostProcessor.sas_post_processor(parser)
		return if parser.operators.nil?
		parser.operators.each do |name, operator|
			# skip if it's not "delete_vm"
			next if !(name =~ /\.delete_vm$/) or !operator.params.has_key?('$.vm')
			vm = operator.params['$.vm'].sub(/^\$\./, '')
			next if !@map.has_key?(vm)

			# for each not-exist state VM, add an effect
			@map[vm].each { |k,v|
				next if operator.has_key?(k)                    # skip if variable is exist (avoid overwrite)
				next if k =~ /\.sfpAddress/ or k =~ /\.sfpPort/ # skip "sfpAddress" and "sfpPort"
				                                                # because these will be assigned dynamically
				var = parser.variables[k]
				next if var.nil? # the variable is not found

				if v.is_a?(Hash)
					if v['_context'] == 'null'
						val = parser.types[v['_value']][0]
					else
						raise Exception, "Not implemented yet."      # this may arise on Set values
					end
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

	private
	def f(msg, opts={}, color=:yellow)
		if not opts[:no_color]
			case color
			when :yellow
				return msg.yellow
			when :red
				return msg.red
			when :green
				return msg.green
			end
		end
		msg
	end

	def putf(msg, opts={}, color=:yellow)
		puts f(msg, opts, color)
	end
end

### Helper classes/modules

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
			return v
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
