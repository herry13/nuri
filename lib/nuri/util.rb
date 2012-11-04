module Nuri
	Port = 9090

	class Util
		@@home_dir = File.expand_path(File.dirname(__FILE__) + "/../..")
		@@logger = Logger.new(@@home_dir + "/log/message.log")
		@@system = {}

		def self.home_dir
			return @@home_dir
		end

		def self.set_system_information(system)
			@@system = system
			self_name = hostname
			@@system.keys.each { |k| @@system.delete(k) if @@system[k] == self_name }
		end

		def self.get_system_information
			return @@system
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
			name = `uname -n`.chop
			return name if name != ''
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

		def self.nuri_version
			return `git rev-parse HEAD`.chop
		end

		def self.ensured?(package)
			data = `/usr/bin/dpkg-query -W #{package} 2> /dev/null`.chop
			data = data.split(' ')
			return true if (data.length > 1 and data[0] == package)
			return ( system('/usr/bin/apt-get -y install php5-gd') == true )
		end

		private
		def initialize
		end
	end
end
