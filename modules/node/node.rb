class Sfp::Module::Node
	include Sfp::Resource

	def update_state
		@state['sfpAddress'] = @model['sfpAddress']
		@state['sfpPort'] = @model['sfpPort']
	end
end
