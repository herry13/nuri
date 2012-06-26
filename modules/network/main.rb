begin
	require 'netifaces'
rescue LoadError
	dir = File.dirname(__FILE__) + "/lib"
	exec = dir + "/install.sh"
	`sh #{exec} #{dir}`
end

module Network
	IPV4 = 2
	IPV6 = 10
	MAC = 17
	class Main
		attr_accessor :state

		def initialize
			@state = JSON'{}'
		end

		def mask(netmask)
			masks = netmask.split('.')
			return Math.sqrt(masks[0]+1) + Math.sqrt(masks[1]+1) +
				Math.sqrt(masks[2]+1) + Math.sqrt(masks[3]+1)
		end

		# set state of this component -- TODO
		def set(state)
		end

		# get state of this component in JSON
		def get
			Netifaces.interfaces.sort.each do |dev|
				@state[dev] = JSON'{"_isa": "NetDevice"}'
				addresses = Netifaces.addresses(dev)
				@state[dev]['hwaddr'] = addresses[MAC][0]['addr']
				@state[dev]['ip'] = (addresses[IPV4][0]['addr'] != nil ?
					addresses[IPV4][0]['addr'] : "")
				@state[dev]['netmask'] = (addresses[IPV4][0]['netmask'] != nil ?
					addresses[IPV4][0]['netmask'] : "")
				@state[dev]['ip6'] = (addresses[IPV6][0]['addr'] != nil ?
					addresses[IPV6][0]['addr'].sub(/%.*/,'') : "")
				@state[dev]['netmask6'] = (addresses[IPV6][0]['netmask'] != nil ?
					addresses[IPV6][0]['netmask'].sub(/%.*/,'') : "")
			end
			return @state
		end
	end
end
