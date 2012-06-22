require 'netifaces'
require 'pp'

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
				@state[dev]['mac'] = addresses[MAC][0]['addr']
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

=begin
Netifaces.interfaces.sort.each do |iface| 
	puts "#{iface} :"
	Netifaces.addresses(iface).sort.each do |family,values|
		puts "\t#{family} :"
		values.each do |val| 
			puts "\t\taddr : #{val['addr']}" if val.has_key?("addr")
			puts "\t\tnetmask : #{val['netmask']}" if val.has_key?("netmask")
			puts "\t\tbroadcast : #{val['broadcast']}" if val.has_key?("broadcast")
			puts "\n"
		end
	end
end
=end
