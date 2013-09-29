class Sfp::Module::MockCloud
	include Sfp::Resource

	def update_state
		@state['running'] = @model['running']
		@state['description'] = @model['description']
		@state['vms'] = {}
	end

	def create_vm(p={})
		Sfp::Agent.logger.info p.inspect
		model = resolve_model(p['vm'])
		Sfp::Agent.logger.info "cpu=#{model['cpu']} memory=#{model['memory']}"
		false
	end

	def delete_vm(p={})
		false
	end
end
