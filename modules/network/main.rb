require 'netifaces'

module Network
	IPV4 = 2
	IPV6 = 10
	MAC = 17
	class Main
		attr_accessor :state

		def initialize
			@state = JSON'{}'
		end

		def getState
			Netifaces.interfaces.sort.each do |dev|
				@state[dev] = JSON'{}'
				addresses = Netifaces.addresses(dev)
				@state[dev]['hwaddr'] = addresses[MAC][0]['addr']
				@state[dev]['ip'] = (addresses[IPV4][0]['addr'] != nil ? addresses[IPV4][0]['addr'] : "")
				@state[dev]['netmask'] = (addresses[IPV4][0]['netmask'] != nil ? addresses[IPV4][0]['addr'] : "")
				@state[dev]['broadcast'] = (addresses[IPV4][0]['broadcast'] != nil ? addresses[IPV4][0]['addr'] : "")
				@state[dev]['ip6'] = (addresses[IPV6][0]['addr'] != nil ? addresses[IPV4][0]['addr'] : "")
				@state[dev]['netmask6'] = (addresses[IPV6][0]['netmask'] != nil ? addresses[IPV4][0]['addr'] : "")
				@state[dev]['broadcast6'] = (addresses[IPV6][0]['broadcast'] != nil ? addresses[IPV4][0]['addr'] : "")
			end
			return @state
		end
	end
end
