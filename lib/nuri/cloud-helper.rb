module Nuri
	module CloudHelper
		VMComponent = '$.VM'
		CloudComponent = '$.Cloud'
		CloudComponents = ['hpcloud', 'rackspace']

		class CloudProcedureModifier
			def initialize(vm_name)
				@path = "$.#{vm_name}.created"
			end

			def visit(name, value, parent)
				if value.is_a?(Hash) and value.isprocedure
					value['_condition'][@path] = {
						'_context' => 'constraint',
						'_type' => 'equals',
						'_value' => true
					}
				end
				true
			end
		end

		def init_cloud
			@cloud_proxies = {}

			# create a template state for non-created VM
			template_file = Nuri::Util.home_dir + "/modules/cloud/vm_template.sfp"
			@vm_template = Nuri::Sfp::Parser.file_to_sfp(template_file)
			@vm_template = @vm_template.at?('$.template.vm')
			@vm_template.accept(Nuri::Sfp::ParentEliminator.new)
		end

		def vm?(node); not node['_classes'].rindex(VMComponent).nil?; end

		def add_cloud_proxy(node)
			if node['address'].to_s.length > 0
				@cloud_proxies[ node['_self'] ] = node['address']
				return true
			end
			false
		end

		# Return true if given node (name,address) is a cloud proxy, otherwise false.
		def cloud_proxy?(name, address)
			CloudComponents.each do |component|
				return true if cloud_component_available?(name, component, address)
			end
			false
		end

		def cloud_component_available?(name, component, address)
			begin
				path = "/state/#{name}/#{component}/running"
				code, body = self.get_data(address, Nuri::Port, path)
				if code == '200'
					data = JSON.parse(body)
					return true if data['value'] == true
				end
			rescue
			end
			false
		end

		# for each children nodes, check if it is a cloud proxy by checking
		# whether $.<node>.<cloud_component>.running == true
		#
		# see CloudComponents for values of <cloud_component>
		def update_cloud_proxies
			return nil if @main.nil? or not @main.has_key?('system')
			@main['system'].each do |name, value|
				if value.is_a?(Hash) and value.isobject and not self.vm?(value)
					address = value['address'].to_s
					next if address.length <= 0
					begin
						if self.cloud_proxy?(name, address)
							@cloud_proxies[name] = address
						end
					rescue Exception => exp
						Nuri::Util.error 'Error: update_cloud_proxies - ' + exp.to_s
					end
				end
			end
		end

		# Return the address of the VM with its proxy
		# [<address>, <proxy_name>]
		def get_vm_address_by_name(vm_name)
			data = {'name' => vm_name}
			@cloud_proxies.each do |name,address|
				next if address.length <= 0
				next if not Nuri::Util.is_nuri_active?(address)

				CloudComponents.each do |component|
					next if not cloud_component_available?(name, component, address)
					begin
						path = "/function/#{name}/#{component}/get_vm_address"
						code, body = self.put_data(address, Nuri::Port, path, data)
						if code == '200'
							data = JSON.parse(body)
							return data['value'], name if not data['value'].nil?
						end
					rescue Exception => e
						Nuri::Util.error 'Cannot get VM address: ' + vm_name + ' - ' + e.to_s
					end
				end
			end
			return nil, nil
		end

		# Return the addresses of all VMs in a hash where:
		# - key is the name of the VM
		# - value is the address of the VM
		def get_all_vm_addresses
			addresses = {}
			@cloud_proxies.each do |name,address|
				next if address.length <= 0
				next if not Nuri::Util.is_nuri_active?(address)

				CloudComponents.each do |component|
					next if not cloud_component_available?(name, component, address)
puts name + ':' + component
					begin
						code, body = self.put_data(address.to_s, Nuri::Port,
							"/function/#{name}/#{component}/get_vms")
						if code == '200'
							data = JSON.parse(body)
							data['value'].each { |k,v| addresses[k] = v }
						end
					rescue Exception => e
						Nuri::Util.log 'Cannot get VMs address from proxy: ' + address + ' - ' + e.to_s
					end
				end
			end
			return addresses
		end

		# Create the state of a non-created VM
		def create_vm_template(vm)
			name = vm['_self']
			state = {name => vm.clone}
			state[name].delete('_parent')
			@vm_template.each { |k,v|
				if k[0,1] != '_' and v.is_a?(Hash) and v.isobject
					state[name][k] = Nuri::Sfp.deep_clone(v)
				end
			}
			state[name].accept(Nuri::Sfp::ParentGenerator.new)
			state[name].accept(CloudProcedureModifier.new(name)) #@cloud_proc_modifier)
			state[name].accept(Nuri::Sfp::ParentEliminator.new)
			return state
		end

	end
end
