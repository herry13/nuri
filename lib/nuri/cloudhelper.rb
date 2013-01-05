module Nuri
	module CloudHelper
		VMComponent = '$.VM'
		CloudComponent = '$.Cloud'

		def init_cloud
			@clouds = {}
			@clouds_sfp = {}
			@main['system'].each do |name, node|
				next if name[0,1] == '_'
				next if node['_classes'].rindex(CloudComponent).nil?
				@clouds[name] = Nuri::Module::Cloud.new(node)
				@clouds_sfp[name] = Nuri::Sfp.deep_clone(node)
				@clouds_sfp[name]['_parent'] = @clouds_sfp
			end
		end

		def get_cloud_state
			return Nuri::Sfp.deep_clone(@clouds_sfp)
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
			end
			return state
		end

	end
end
