require 'rubygems'
require 'json'

module Nuri
	module Module
		class VM < Machine
			alias :super_update_state :update_state

			def initialize
				name = Nuri::Util.hostname.strip.sub(/\..*/,'')
				self.register('VM', name)
			end

			def update_state
				self.super_update_state
				@state['created'] = true
				@state['oncloud'] = Nuri::Util.get_oncloud
			end
		end
	end
end
