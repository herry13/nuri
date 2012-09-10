module Nuri
	module Module
		class Network
			@@IPV4 = 2
			@@IPV6 = 10
			@@MAC = 17

			include Nuri::Resource
	
			def initialize
				self.load('Network', 'net')
			end
	
			def mask(netmask)
				masks = netmask.split('.')
				return Math.sqrt(masks[0]+1) + Math.sqrt(masks[1]+1) +
					Math.sqrt(masks[2]+1) + Math.sqrt(masks[3]+1)
			end
	
			# get state of this component in JSON
			def get_state
=begin
				Netifaces.interfaces.sort.each do |dev|
					@state[dev] = self.create_object('NetDevice')
					addresses = Netifaces.addresses(dev)
					@state[dev]['hwaddr'] = addresses[@@MAC][0]['addr']
					@state[dev]['ip'] = (addresses[@@IPV4][0]['addr'] != nil ?
						addresses[@@IPV4][0]['addr'] : "")
					@state[dev]['netmask'] = (addresses[@@IPV4][0]['netmask'] != nil ?
						addresses[@@IPV4][0]['netmask'] : "")
					@state[dev]['ip6'] = (addresses[@@IPV6][0]['addr'] != nil ?
						addresses[@@IPV6][0]['addr'].sub(/%.*/,'') : "")
					@state[dev]['netmask6'] = (addresses[@@IPV6][0]['netmask'] != nil ?
						addresses[@@IPV6][0]['netmask'].sub(/%.*/,'') : "")
				end
=end
				return @state
			end
		end
	end
end
