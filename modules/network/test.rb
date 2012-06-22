#!/usr/bin/env ruby

require 'socket'

def getIP
orig, Socket.do_not_reverse_lookup = Socket.do_not_reverse_lookup, true
UDPSocket.open do |s|
	s.connect '64.233.187.99', 1
end
ensure
	Socket.do_not_reverse_lookup = orig
end

puts UDPSocket.open { |s| s.connect('64.233.187.99', 1); s.addr.last }

sock = Socket.new(Socket::AF_INET, Socket::SOCK_DGRAM, 0)
buf = ['eth0',""].pack('a16h16')
sock.ioctl(SIOCGIFHWADDR, buf)
sock.close
puts buf[18..24].to_etheraddr
