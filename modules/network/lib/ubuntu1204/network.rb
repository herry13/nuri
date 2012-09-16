module Nuri
	module Module
		class Network
			@@IPV4 = 2
			@@IPV6 = 10
			@@MAC = 17

			include Nuri::Resource
	
			def initialize
				self.load(nil, 'net')
			end
	
			def mask(netmask)
				masks = netmask.split('.')
				return Math.sqrt(masks[0]+1) + Math.sqrt(masks[1]+1) +
					Math.sqrt(masks[2]+1) + Math.sqrt(masks[3]+1)
			end
	
			# get state of this component in JSON
			def get_state
				return @state
			end
		end
	end
end
