
class Sfp::Module::Machine
	include Sfp::Resource

	def update_state
		@state['sfpAddress'] = @model['sfpAddress']
		@state['sfpPort'] = @model['sfpPort']
		@state['created'] = true

		data = `dmidecode | grep -i product`.strip
		if data.length <= 0
			@state['is_virtual'] = true
			@state['hypervisor'] = 'N/A'
		else
			_, product = data.split("\n")[0].split(":", 2)
			case product.strip.downcase
			when 'kvm', 'virtualbox', 'vmware'
				@state['is_virtual'] = true
				@state['hypervisor'] = product
			else
				@state['is_virtual'] = false
			end
		end
	end
end
