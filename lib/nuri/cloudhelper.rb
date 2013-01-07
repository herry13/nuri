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
					return false
				end
				true
			end
		end

		def init_cloud
			# load module's ruby file
			require 'modules/cloud/cloud.rb'

			@clouds = {}
			@clouds_sfp = {}
			@main['system'].each do |name, node|
				next if name[0,1] == '_'
				next if node['_classes'].rindex(CloudComponent).nil?
				begin
					@clouds[name] = Nuri::Module::Cloud.new(node)
					@clouds_sfp[name] = Nuri::Sfp.deep_clone(node)
					@clouds_sfp[name]['_parent'] = @clouds_sfp
				rescue Exception => exp
					Nuri::Util.log 'Error when initializing cloud component: ' + exp.to_s
				end
			end

			# add cloud component to root
			@clouds.each { |name,cloud| @root.add(cloud) }

			# create a template state for non-created VM
			template_file = Nuri::Util.home_dir + "/modules/cloud/vm_template.sfp"
			@vm_template = Nuri::Sfp::Parser.file_to_sfp(template_file)
			@vm_template = @vm_template.at?('$.template.vm')
			@vm_template.accept(Nuri::Sfp::ParentEliminator.new)
		end

		def vm?(node); not node['_classes'].rindex(VMComponent).nil?; end

		def get_cloud_state
			state = Nuri::Sfp.deep_clone(@clouds_sfp)
			state.each do |name,cloud|
				cloud['secret_key'] = ''
				s = @clouds[name].get_state
				cloud['running'] = s['running']
			end
			return state
		end

		def get_vm_address_by_name(vm_name)
			@clouds.each do |cname, cmodule|
				address = cmodule.get_address(:name => vm_name)
				return cname, address if not address.nil?
			end
			return nil, nil
		end

		def get_vm_state(vm)
			vm_name = vm['_self']
			# create VM's temporary state
			state = {vm_name => vm.clone}
			state[vm_name].delete('_parent')
			# search VM's address
			cloud, address = self.get_vm_address_by_name(vm_name)
			if not address.nil?
				# pull VM's state
				node_state = self.get_node_state(address)
				# replace with current state
				node_state[vm_name].each { |k,v| state[vm_name][k] = v if k[0,1] != '_' }
				# set "created=true"
				state[vm_name]['created'] = true
				state[vm_name]['incloud'] = @clouds_sfp[cloud].ref
			else
				@vm_template.each { |k,v|
					if k[0,1] != '_' and v.is_a?(Hash) and v.isobject
						state[vm_name][k] = Nuri::Sfp.deep_clone(v)
					end
				}
				state[vm_name].accept(CloudProcedureModifier.new)
			end
			return state

		end

	end
end
