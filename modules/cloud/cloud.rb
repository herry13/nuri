module Sfp::Module
	class Cloud
		include Sfp::Resource

		def update_state
			@state['running'] = false
			@state['description'] = @model['description']
		end
	end
end
