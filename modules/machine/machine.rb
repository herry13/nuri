
class Sfp::Module::Machine
	include Sfp::Resource

	def update_state
		self.reset

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
				@state['hypervisor'] = product.strip
			else
				@state['is_virtual'] = false
			end
		end

		@state["cpus"] = (File.exist?('/proc/cpuinfo') ? `cat /proc/cpuinfo | grep processor | wc -l`.strip.to_i : -1)
		@state['memory'] = (`which free`.strip != '' ? `free`.split("\n")[1].split(" ")[1] : -1)
	end
end
