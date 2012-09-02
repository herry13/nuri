require 'netifaces'

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
