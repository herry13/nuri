module Nuri
	Port = 9090

	class Util
		@@home_dir = File.expand_path(File.dirname(__FILE__) + "/../..")
		@@logger = Logger.new(@@home_dir + "/log/message.log")

		def self.home_dir
			return @@home_dir
		end

		def self.log(msg=nil)
			if msg != nil
				@@logger.info msg
			end
			return @@logger
		end

		def self.os
			return @@os if defined?(@@os) != nil and @@os != nil
			@@os = (`uname -s`).strip 
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
			return `uname -n`.split('.')[0] if ip == nil or ip == ''
			return Socket.getaddrinfo(ip, 0, Socket::AF_UNSPEC, Socket::SOCK_STREAM,
				nil, Socket::AI_CANONNAME)[0][2].split('.')[0]
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
			return @@platform if defined?(@@platform) != nil and @@platform != nil
			case self.os
				when 'linux'
					type = `cat /etc/issue`
					if (type =~ /Ubuntu/) != nil
						@@platform = 'ubuntu'
					elsif (type =~ /Scientific Linux/) != nil
						@@platform = 'sl'
					else
						@@platform = 'unknown'
					end
				when 'macos'
					@@platform = 'macos'
				else
					@@platform = 'unknown'
			end
			return @@platform
		end
	end
end
