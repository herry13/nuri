require 'rubygems'
require 'logger'
require 'socket'

module Nuri
	class Util
		@@rootdir = File.expand_path(File.dirname(__FILE__) + "/../..")
		@@logger = Logger.new(@@rootdir + "/log/message.log")
		@@os = nil
		@@platform = nil

		def self.rootdir
			return @@rootdir
		end

		def self.log(msg=nil)
			if msg != nil
				@@logger.info msg
			end
			return @@logger
		end

		def self.os
			@@os = (`uname -o`).strip if @@os == nil
			return @@os
		end

		def self.local_ip
			orig, Socket.do_not_reverse_lookup = Socket.do_not_reverse_lookup, true
			UDPSocket.open { |s|
				s.connect '64.233.187.99', 1
				s.addr.last
			}
		ensure
			Socket.do_not_reverse_lookup = orig
		end

		def self.hostname
			ip = self.local_ip
			return `uname -n` if ip == nil or ip == ''
			return Socket.getaddrinfo(ip, 0, Socket::AF_UNSPEC, Socket::SOCK_STREAM,
				nil, Socket::AI_CANONNAME)[0][2]
		end

		def self.platform
			return @@platform if @@platform != nil
			if (self.os =~ /Linux/) != nil
				data = `cat /etc/issue`
				@@platform = "ubuntu" if (data =~ /Ubuntu/) != nil
				@@platform = "sl" if (data =~ /Scientific Linux/) != nil
			end
			return @@platform
		end
	end
end
