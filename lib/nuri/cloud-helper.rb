module Nuri
	module CloudHelper
		VMComponent = '$.VM'
		CloudComponent = '$.Cloud'

		class CloudProcedureModifier
			def initialize(vm_path='this.parent')
				@vm_path = vm_path
			end

			def visit(name, value, parent)
				if value.is_a?(Hash) and value.isprocedure
					value['_condition']["$.#{@vm_path}.created"] = {
						'_context' => 'constraint',
						'_type' => 'equals',
						'_value' => true
					}
				end
				false
			end
		end

		def init_cloud
=begin
			@clouds = {}
			@clouds_sfp = {}
			@main['system'].each do |name, node|
				next if name[0,1] == '_'
				next if node['_classes'].rindex(CloudComponent).nil?
puts '==> ' + name + '::' + node['_classes'].inspect
				begin
					#@clouds[name] = Nuri::Module::Cloud.new(node)
					#@clouds_sfp[name] = Nuri::Sfp.deep_clone(node)
					#@clouds_sfp[name]['_parent'] = @clouds_sfp
				rescue Exception => exp
					Nuri::Util.log 'Error when initializing cloud component: ' + exp.to_s
				end
			end

			# add cloud component to root
			#@clouds.each { |name,cloud| @root.add(cloud) }
=end

			# create a template state for non-created VM
			template_file = Nuri::Util.home_dir + "/modules/cloud/vm_template.sfp"
			@vm_template = Nuri::Sfp::Parser.file_to_sfp(template_file)
			@vm_template = @vm_template.at?('$.template.vm')
			@vm_template.accept(Nuri::Sfp::ParentEliminator.new)
		end

		def vm?(node); not node['_classes'].rindex(VMComponent).nil?; end

		def get_cloud_state
			# get state of localhost cloud-proxy
			state = {}
			@root.children.first[1].children.each do |name, mod|
				sfp_class = @main.at?(mod.class_path)
				next if sfp_class.nil? or sfp_class.extends != CloudComponent
				s = mod.get_state
				s.delete('_parent')
				s.accept(Nuri::Sfp::ParentEliminator.new)
				if s['running'] == true
					state[Nuri::Util.hostname] = {} if not state.has_key?('localhost')
					state[Nuri::Util.hostname][name] = s
				end
			end
			return state
		end

		def get_vm_address_by_name(vm_name)
			# check localhost cloud-proxy
			@root.children.first[1].children.each do |name, mod|
				sfp_class = @main.at?(mod.class_path)
				next if sfp_class.nil? or sfp_class.extends != CloudComponent
				state = mod.get_state
				if state['running'] == true
					address = mod.get_address(:name => vm_name)
					return mod.ref, state['description'], address if not address.nil?
				end
			end
			return nil, nil, nil
		end

		def get_vm_state(vm)
			vm_name = vm['_self']
			# create VM's temporary state
			state = {vm_name => vm.clone}
			state[vm_name].delete('_parent')
			# search VM's address
			cloud_proxy, cloud_desc, address = self.get_vm_address_by_name(vm_name)
			if not address.nil?
				# pull VM's state
				node_state = self.get_node_state(address)
				return nil if node_state.nil? # connection error with VM
				# replace with current state
				node_state[vm_name].each { |k,v| state[vm_name][k] = v if k[0,1] != '_' }
				# set "created=true"
				state[vm_name]['created'] = true
				state[vm_name]['cloud_proxy'] = cloud_proxy
				state[vm_name]['cloud_desc'] = cloud_desc
			else
				@vm_template.each { |k,v|
					if k[0,1] != '_' and v.is_a?(Hash) and v.isobject
						state[vm_name][k] = Nuri::Sfp.deep_clone(v)
						state[vm_name][k].accept(CloudProcedureModifier.new)
					end
				}
				state[vm_name].accept(CloudProcedureModifier.new('this'))
			end
			return state

		end

	end
end
