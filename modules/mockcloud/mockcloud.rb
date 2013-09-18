class Sfp::Module::MockCloud
	include Sfp::Resource

	def update_state
		@state['running'] = @model['running']
		@state['description'] = @model['description']
		@state['vms'] = {}
	end

	def create_vm(p={})
		false
	end

	def delete_vm(p={})
		false
	end
end
