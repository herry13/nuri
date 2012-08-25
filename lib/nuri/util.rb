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
			return @@os if defined?(@@os) != nil and @@os != nil
			#@@os = (`uname -o`).strip if @@os == nil
			@@os = (`uname -s`).strip if @@os == nil
			@@os = (@@os == 'Darwin' ? 'macos' : @@os.downcase)
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

		def self.temp_dir
			case os
				when 'linux'
					return '/tmp'
				when 'macos'
					return '/tmp'
				else
					return nil
			end
		end

		def self.platform
			return @@platform if @@platform != nil
			case self.os
				when 'linux'
					type = `cat /etc/issue`
					if (data =~ /Ubuntu/) != nil
						@@platform = 'ubuntu'
					elsif (data =~ /Scientific Linux/) != nil
						@@platform = 'sl'
					else
						@@platform = 'unknown'
					end
				when 'macos'
					@@platform = 'macos'
				else
					@@platform = 'unknown'
			end
=begin
			if (self.os =~ /Linux/) != nil
				data = `cat /etc/issue`
				@@platform = "ubuntu" if (data =~ /Ubuntu/) != nil
				@@platform = "sl" if (data =~ /Scientific Linux/) != nil
			
			end
=end
			return @@platform
		end
	end
end
