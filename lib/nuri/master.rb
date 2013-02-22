require 'net/http'
require 'base64'

module Nuri
	module Master
		class Daemon
			include Nuri::Config
			include Nuri::NetHelper
			include Nuri::CloudHelper

			attr_accessor :main, :do_verify_execution

			def initialize
				@do_verify_execution = true
				self.load(false)
				@main = Nuri::Resource.get_root
				self.init_cloud
			end

			def debug_json
				sfp = Nuri::Sfp.deep_clone(@main)
				sfp.delete('system')
				sfp['initial'] = self.get_state
				sfp.accept(Nuri::Sfp::SfpGenerator.new(sfp))
				puts Nuri::Sfp::to_pretty_json(sfp);
			end

			def debug_sas
				sfp = Nuri::Sfp.deep_clone(@main)
				sfp.delete('system')
				sfp['initial'] = self.get_state
				sfp.accept(Nuri::Sfp::SfpGenerator.new(sfp))
				@parser = Nuri::Sfp::Parser.new
				@parser.root = sfp
				puts @parser.to_sas
			end

			def debug_sfp
				sfp = Nuri::Sfp.deep_clone(@main)
				sfp.delete('system')
				sfp['initial'] = self.get_state
				sfp.accept(Nuri::Sfp::ParentEliminator.new)
				puts JSON.pretty_generate(sfp)
			end

			def get_state(path='')
				return nil if @main.nil? or not @main.has_key?('system')

				def collect_state(current, node, state)
					if state.nil?
						Nuri::Util.warn "Cannot get the current state of: #{node['_self']}"
					else
						state.each { |k,v| current[k] = v }
					end
				end

				# update cloud proxies, then populate all VMs' address
				self.update_cloud_proxies
				vms = self.get_all_vm_addresses

				# retrieve node's current state
				current_state = {'_context'=>'state', '_self'=>'initial'}
				@main['system'].each do |key,node|
					next if key[0,1] == '_' or node['_classes'].rindex(MainComponent).nil?
					state = nil
					if self.vm?(node) # node is a virtual machine
						if vms.has_key?(key) # the VM exists (has been created)
							address = vms[key].to_s
							state = self.get_node_state(address) if address.length > 0
							state[key]['created'] = true if not state.nil?
						else
							# the VM does not exist
							state = self.create_vm_template(node)
						end
					else # node is not a virtual machine
						address = node['address'].to_s
						state = self.get_node_state(address) if address.length > 0
					end
					collect_state(current_state, node, state)
				end
				current_state
			end

			def get_node_state(address)
				begin
					code, body = self.get_data(address.to_s, Nuri::Port, '/state')
					if code == '200'
						json = JSON.parse(body)
						return json['value'] if json.is_a?(Hash) and json.has_key?('value')
					end
				rescue Exception => e
					Nuri::Util.log 'Cannot get state of node: "' + address.to_s + '" -- ' + e.to_s
				end
				nil
			end

			def create_task(state=nil, sfp_main=nil)
				raise Exception, 'Invalid SFP main' if sfp_main.nil?
				sfp_task = Nuri::Sfp.deep_clone(sfp_main)
				sfp_task.delete('system')
				sfp_task['initial'] = (state == nil ? self.get_state : Nuri::Sfp.deep_clone(state))
				sfp_task.accept(Nuri::Sfp::SfpGenerator.new(sfp_task))
				return sfp_task
			end

			def get_bsig(state=nil)
				sfp_task = self.create_task(state, @main)
				planner = Nuri::Planner::Solver.new
				plan = planner.solve_sfp(sfp_task)
				bsig = (plan.nil? ? nil : planner.to_bsig)
				return bsig
			end

			def reset
				system = get_system_information
				system.each_value do |address|
					begin
						put_data(address, Nuri::Port, '/reset')
					rescue Exception => e
						Nuri::Util.log 'Cannot reset ' + address.to_s + ': ' + e.to_s
					end
					File.delete(Nuri::BSig::MasterBSigFile) if File.exist?(Nuri::BSig::MasterBSigFile)
				end
			end

			def start_bsig
				system = get_system_information
				system.each_value do |address|
					begin
						put_data(address, Nuri::Port, '/bsig/start')
					rescue Exception => e
						Nuri::Util.log 'Cannot start BSig executor ' + address.to_s + ': ' + e.to_s
					end
				end
			end

			def status_bsig
				status = {:flaws => nil, :id => nil, :created => nil}
				return status if not File.exist?(Nuri::BSig::MasterBSigFile)
				bsig = JSON[File.read(Nuri::BSig::MasterBSigFile)]
				state = self.get_state
				flaws = []
				bsig['goal'].each do |path,value|
					flaws << [path, value, state.at?(path)] if value != state.at?(path)
				end
				status[:flaws] = flaws
				status[:id] = bsig['id']
				status[:created] = File.mtime(Nuri::BSig::MasterBSigFile)
				return status
			end

			def apply_bsig(debug=false)
				bsig = self.get_bsig
				puts JSON.pretty_generate(bsig) if debug
				return true if bsig['operators'].nil? or bsig['operators'].length <= 0
				return self.deploy_bsig(bsig, debug)
			end

			def deploy_bsig(bsig, debug=false)
				def send_to_cloud_proxies(node, id, operator=nil, goal=nil, operators=nil)
					@cloud_proxies.each_value do |address|
						data = {'vm' => node['_self'], 'id' => id}
						data['operator'] = operator if not operator.nil?
						data['operators'] = operators if not operators.nil?
						data['goal'] = goal if not goal.nil?
						code, _ = put_data(address, Nuri::Port, '/bsig/vm', data)
						raise Exception, "Failed sending BSig to cloud-proxy: #{address}" if code != '200'
					end
				end

				def group_operators_by_node(operators)
					groups = {}
					operators.each do |operator|
						node = self.get_node(operator['name'])
						raise Exception, "Cannot find node of operator: #{operator['name']}" if node.nil?
						groups[node] = [] if not groups.has_key?(node)
						groups[node] << operator
					end
					groups
				end

				def group_goals_by_node(goals, goal_operators)
					groups = {}
					goals.each do |variable, value|
						operator = goal_operators[variable]
						node = self.get_node(operator)
						raise Exception, "Cannot find node of operator: #{operator['name']}" if node.nil?
						groups[node] = {} if not groups.has_key?(node)
						groups[node][variable] = value
					end
					groups
				end

				begin
					Nuri::Util.log "Sending BSig: #{bsig['id']}"

					# update system information
					self.update_system

					# reset existing BSig model
					self.reset

					nodes = []
					# send BSig operators to clients
					group_operators_by_node(bsig['operators']).each do |node,operators|
						address = node['address']
						if address.nil?
							raise Exception, "#{node['name']}'s address is nil" if not self.vm?(node)
							send_to_cloud_proxies(node, bsig['id'], nil, nil, operators)
						else
							data = {'id'=>bsig['id'], 'operators'=>operators}
							code, _  = put_data(address, Nuri::Port, '/bsig', data)
							raise Exception, "Failed sending BSig policies:#{code},#{address}" if code != '200'
							nodes << address
						end
					end
=begin
					# send BSig operators to clients
					nodes = []
					bsig['operators'].each do |operator|
						node = self.get_node(operator['name'])
						if node.nil?
							Nuri::Util.error "Cannot find node of operator: #{operator['name']}"
							return false
						end

						address = node['address']
						if address.nil? and self.vm?(node)
							send_to_cloud_proxies(node, bsig['id'], operator)
						else
							data = {'id' => bsig['id'], 'operator' => operator}
							code, _ = put_data(address, Nuri::Port, '/bsig', data)
							if code != '200'
								raise Exception, "sending BSig operator:#{code},#{address}"
							end
							nodes << address
						end
					end

					# send BSig goal to clients
					bsig['goal'].each do |variable,value|
						operator = bsig['goal_operator'][variable]
						node = self.get_node(operator)
						return false if node.nil?

						address = node['address']
						if address.nil? and self.vm?(node)
							send_to_cloud_proxies(node, bsig['id'], nil, {variable => value})
						else
							data = {'id' => bsig['id'], 'goal' => {variable => value}}
							code, _ = put_data(address, Nuri::Port, '/bsig', data)
							if code != '200'
								raise Exception, "sending BSig goal:#{code},#{address}"
							end
							nodes << address
						end
					end
=end
					group_goals_by_node(bsig['goal'], bsig['goal_operator']).each do |node,goal|
						address = node['address']
						if address.nil?
							raise Exception, "#{node['name']}'s address is nil" if not self.vm?(node)
							send_to_cloud_proxies(node, bsig['id'], nil, goal)
						else
							data = {'id'=>bsig['id'], 'goal'=>goal}
							code, _ = put_data(address, Nuri::Port, '/bsig', data)
							raise Exception, "sending BSig goal:#{code},#{address}" if code != '200'
							nodes << address
						end
					end

					# send deployment signal to all clients
					nodes.uniq!
					Nuri::Util.log "Activate BSig ID #" + bsig['id'].to_s
					data = {'id' => bsig['id']}
					nodes.each do |address|
						code, _ = put_data(address, Nuri::Port, '/bsig/activate', data)
						if code != '200'
							raise Exception, "Failed-activate BSig:#{code},#{address}"
						end
					end

					# save the deployed BSig model
					File.open(Nuri::BSig::MasterBSigFile, 'w') { |f| f.write(JSON.generate(bsig)) }

				rescue Timeout::Error
					Nuri::Util.error 'Timeout on sending BSig to clients'
					return false
				rescue Exception => exp
					Nuri::Util.error 'Failed: ' + exp.to_s + ' -- ' + exp.backtrace.to_s
					return false
				end

				return true
			end

			def set_main_file(mainfile)
				@main = self.parse_main_file(mainfile)
			end

			def get_plan(state=nil, json=false, parallel=false)
				sfp_task = self.create_task(state, @main)
				planner = Nuri::Planner::Solver.new
				return planner.solve_sfp(sfp_task, json, parallel)
			end

			def apply(parallel=false, debug=false)
				state = get_state
				plan = self.get_plan(state, false, parallel)
				puts JSON.pretty_generate(plan) if debug
				self.execute_workflow(plan)
			end

			def execute_workflow(plan)
				#state = get_state
				success = true
				if plan['workflow'] != nil
					begin
						# update system information
						self.update_system

						#self.reset

						# execute the action in sequential
						if plan['type'] == 'sequential'
							success = self.sequential_execution(plan)
						elsif plan['type'] == 'parallel'
							# TODO -- implement parallel scheduler
							success = false
						else
							success = false
						end
					rescue Timeout::Error
						success = false
					end
				end
				success
			end

			def sequential_execution(plan)
				plan['workflow'].each do |action|
					node = self.get_node(action['name'])
					if node == nil
						Nuri::Util.log "Cannot find module of action: #{action['name']}"
						return false
					else
						return false if not self.execute(action, node)
					end
					self.update_system
					#state = get_state
				end
				true
			end

			def execute(action, node)
				def verify(action)
					state = get_state
					action['effect'].each do |key,value|
						val = state.at?(key)
						val = nil if val.is_a?(Hash) and val.isnull
						if val != value
							puts 'Failed verifying: ' + key + '=' + value.to_s + ' <> ' + val.to_s
							raise Nuri::ExecutionFailedException, action['name']
						end
						#if self.get_state(key) != value
						#	raise Nuri::ExecutionFailedException, action['name']
						#end
					end
				end

				def remote_execute(action, address)
					data = { 'action' => action, 'system' => self.get_system_information }
					begin
						code, _ = put_data(address, Nuri::Port, '/exec', data)
						if code == '200'
							verify(action) if @do_verify_execution
							return true
						end
					rescue Timeout::Error
						Nuri::Util.log "Timeout when executing: " + action['name']
						raise Timeout::Error
					rescue ExecutionFailedException => efe
						Nuri::Util.log "Execution failed exception: " + efe.to_s
					rescue Exception => e
						Nuri::Util.log 'Cannot execute remote action: ' + action['name'].to_s + ' -- ' + e.to_s
					end
					false
				end

				def clean_parameters(params)
					p = {}
					params.each { |k,v| p[k[2, k.length-2]] = params[k] }
					p
				end

				def local_execute(action)
					begin
						comp_name, procedure_name = action['name'].extract
						component = @root.get(comp_name)
						return false if not component.respond_to?(procedure_name)
						params = clean_parameters(action['parameters'])
						return component.send(procedure_name) if params.size <= 0
						return component.send(procedure_name, params)
					rescue Exception => e
						Nuri::Util.log "Cannot execute local action: #{action['name']}"
					end
					false
				end

				print '- executing ' + action['name'] + JSON.generate(action['parameters']) + '...'
				if node.has_key?('address')
					succeed = remote_execute(action, node['address'])
				else
					succeed = local_execute(action)
				end
				puts (succeed ? 'OK' : 'Failed')

				succeed
			end

			def get_system_information
				system = {}
				self.update_cloud_proxies
				@main['system'].each do |key,value|
					next if key[0,1] == '_'
					if value.is_a?(Hash) and value.isobject and value['_classes'].rindex(Nuri::Config::MainComponent) != nil
						if self.vm?(value) # a VM node
							system[key], _ = self.get_vm_address_by_name(value['_self'])
						else # a standard Machine
							system[key] = value['address'].to_s
						end
					end
				end
				system
			end

			def get_node(path)
				return nil if not path.isref
				node = nil
	
				# 1) find in "localhost"
				first, _ = path.explode[1].explode
				if first == Nuri::Util.hostname
					return {}
				end
	
				# 2) find in the "system" (remote-host)
				if @main.is_a?(Hash) and @main.has_key?('system')
					root = @main['system']
					while path != '$'
						path = path.to_top
						n = root.at?(path)
						#node = n if not n.nil? and not n.is_a?(Nuri::Undefined) and
						#            n['_classes'].rindex(MainComponent) != nil
						node = n if n.is_a?(Hash) and not n['_classes'].rindex(MainComponent).nil?
					end
				end
	
				# update node's state if it's a VM on the cloud
				if not node.nil? and self.vm?(node)
					node['address'], cloud_proxy = self.get_vm_address_by_name(node['_self'])
				end
	
				node
			end

			def update_system
				system = self.get_system_information
				system.each_value do |target|
					next if target.nil? or target.to_s.length <= 0
					next if not Nuri::Util.is_nuri_active?(target)
					begin
						post_data(target, Nuri::Port, '/system', system)
					rescue Exception => e
						Nuri::Util.log 'Cannot send system information to ' + target.to_s + ' (' + e.to_s + ')'
					end
				end
			end

		end

		def self.start
			# TODO -- start Nuri master
		end

		def self.apply(params={})
			debug = (params.has_key?(:debug) ? params[:debug] : false)
			master = Nuri::Master::Daemon.new
			master.apply(false, debug)
		end

		def self.pull
			master = Nuri::Master::Daemon.new
			return master.get_state
		end

		def self.plan(params={})
			parallel = (params.has_key?(:parallel) ? params[:parallel] : false)
			mainfile = (params.has_key?(:mainfile) ? params[:mainfile] : nil)

			master = Nuri::Master::Daemon.new
			puts 'Generating the workflow...'
			if not mainfile.nil?
				master.set_main_file(mainfile)
				plan = master.get_plan(nil, false, parallel)
			else
				plan = master.get_plan(nil, false, parallel)
			end

			if plan.nil? or plan['workflow'].nil?
				puts "\nno solution!"
			else
				puts "#{JSON.pretty_generate(plan)}\n"
				if plan['workflow'].length > 0
					print "Execute the workflow [y/N]? "
					if STDIN.gets.chomp.upcase == 'Y'
						puts "Executing the plan..."
						puts "Execution " + (master.execute_workflow(plan) ? "success!" : "failed!")
					end
				end
				puts ''
			end
		end

		def self.bsig
			master = Nuri::Master::Daemon.new
			puts 'Generating the Behavioural Signature (BSig) model...'
			bsig = master.get_bsig
			if bsig.nil?
				puts 'no solution!'
			else
				puts "#{JSON.pretty_generate(bsig)}\n"
				if bsig['operators'].length > 0
					print "Deploy the BSig model [y/N]? "
					if STDIN.gets.chomp.upcase == 'Y'
						print 'Deploying the Behavioural Signature model...'
						puts (master.deploy_bsig(bsig) ? 'OK' : 'Failed')
					end
				end
			end
			puts ''
		end

		def self.get_bsig
			master = Nuri::Master::Daemon.new
			return master.get_bsig
		end

		def self.apply_bsig(params={})
			debug = (params.has_key?(:debug) ? params[:debug] : false)
			master = Nuri::Master::Daemon.new
			return master.apply_bsig(debug)
		end

		def self.start_bsig
			master = Nuri::Master::Daemon.new
			return master.start_bsig
		end

		def self.status_bsig
			def self.to_string(value)
				if value.is_a?(Hash)
					return "null" if value.isnull
					return "[]" if value.isset
				end
				return "null" if value.nil?
				return value if value.is_a?(String) and value.isref
				return value.inspect
			end

			master = Nuri::Master::Daemon.new
			status = master.status_bsig
			if status[:id].nil?
				puts "BSig model is not exist."
			else
				puts "- ID: #{status[:id]}"
				puts "- Created: #{status[:created].to_s}"
				if status[:flaws].length <= 0
					puts '- Goal: achieved'
				else
					puts "- Goal: not achieved (#{status[:flaws].length} flaws)\n  Flaws are:"
					index = 1
					status[:flaws].each do |flaw|
						puts "  - #{flaw[0]}: goal=#{to_string(flaw[1])}, current=#{to_string(flaw[2])}"
						index += 1;
					end
				end
			end
			puts ''
		end

		def self.debug_json
			master = Nuri::Master::Daemon.new
			master.debug_json
		end

		def self.debug_sas
			master = Nuri::Master::Daemon.new
			master.debug_sas
		end

		def self.debug_sfp
			master = Nuri::Master::Daemon.new
			master.debug_sfp
		end

		def self.exec(params={})
			sfw_file = (params.has_key?(:planfile) ? params[:planfile] : nil)
			raise Exception, 'Invalid file' if not File.exist?(sfw_file)
			plan = nil
			File.open(sfw_file) { |f| plan = JSON[ f.read ] }
			if plan != nil
				master = Nuri::Master::Daemon.new
				if master.execute_workflow(plan)
					puts 'Execution success!'
				else
					puts 'Execution failed!'
				end
			else
				puts 'Invalid workflow (sfw) file'
			end
		end

		def self.reset
			master = Nuri::Master::Daemon.new
			master.reset
		end

		def self.update_system
			master = Nuri::Master::Daemon.new
			master.update_system
		end

	end
end
