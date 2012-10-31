require 'rubygems'
require 'json'

=begin
This is only an abstract resource for any service
=end

module Nuri
	module Module
		class Service

			include Nuri::Resource

			def initialize
				self.load('Service', 'service', true)
			end
	
			# get state of this component in JSON
			def get_state
				return @states
			end
	
			def install
				return true
			end
		
			def uninstall
				return true
			end
		
			def start
				return true
			end
		
			def stop
				return true
			end
		
			def set_port(p)
				return true
			end
		end
	end
end
