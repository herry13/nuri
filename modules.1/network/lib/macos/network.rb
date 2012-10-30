begin
	require 'netifaces'
rescue LoadError
	dir = File.dirname(__FILE__) + "/lib"
	exec = dir + "/install.sh"
	`sh #{exec} #{dir}`
	Nuri::Util.log.info "Install gem \"netifaces\""
	begin
		require 'netifaces'
	rescue LoadError
		raise 'Cannot install gem "netifaces"'
	end
end

module Nuri
	module Module
		class Network
			@@IPV4 = 2
			@@IPV6 = 10
			@@MAC = 17

			include Nuri::Resource
	
			def initialize
				self.load
				@state = self.create_object('Network')
			end
	
			def mask(netmask)
				masks = netmask.split('.')
				return Math.sqrt(masks[0]+1) + Math.sqrt(masks[1]+1) +
					Math.sqrt(masks[2]+1) + Math.sqrt(masks[3]+1)
			end
	
			# get state of this component in JSON
			def get_state
				data = `ifconfig`.split("\n")
				i = 0
				while i < data.length
					line = data[i]
					if line[0,2] == 'en' or line[0,2] == 'lo'
						dev = line.split(':')[0]
						@state[dev] = self.create_object('NetDevice')
						j = i + 1
						while j < data.length
							row = data[j].strip.split(' ')
							break if row[0][ row[0].length-1, 1 ] == ':'
							if row[0] == 'ether'
								@state[dev]['hwaddr'] = row[1]
							elsif row[0] == 'inet6'
								@state[dev]['ip6'] = row[1].split('%')[0]
							elsif row[0] == 'inet'
								@state[dev]['ip'] = row[1]
							end
							j += 1
						end
					end
					i += 1
				end
				return @state
			end
		end
	end
end
