require 'thread'

module Nuri
	Port = 1313

	class Util
		@@home_dir = File.expand_path(File.dirname(__FILE__) + "/../..")
		@@logger = Logger.new(@@home_dir + "/log/message.log")
		@@system = nil #{}
		@@debug = false
		@@lock_util = Mutex.new

		def self.set_debug(debug=false); @@debug = debug; end

		def self.home_dir; return @@home_dir; end

		def self.set_system_information(system)
			@@lock_util.synchronize {
				@@system = system
				self_name = hostname
				@@system.keys.each { |k| @@system.delete(k) if @@system[k] == self_name }
				# save to file
				f = File.open(@@home_dir + '/var/system.info')
				f.write(JSON.generate(@@system))
				f.close
			}
		end

		def self.get_system_information
			@@lock_util.synchronize {
				if @@system.nil?
					fpath = @@home_dir + '/var/system.info'
					@@system = (File.exist?(fpath) ? JSON[File.read(fpath)] : {})
				end
				return @@system
			}
		end

		def self.warn(msg=nil)
			@@logger.warn msg if msg != nil
			puts msg if @@debug
			return @@logger
		end

		def self.log(msg=nil)
			@@logger.info msg if msg != nil
			puts msg if @@debug
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

		def self.domainname(ip=nil)
			ip = self.local_ip if ip == nil
			result = `nslookup #{ip}`
			result = result.split("\n")
			if result.length < 4
				return Socket.gethostbyname(Socket.gethostname).first
			else
				result = result[3].split(" ")
				return result[3].chop
			end
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

		def self.nuri_version; return `git rev-parse HEAD`.chop; end

		def self.uninstalled?(package)
			success = ( system("/usr/bin/apt-get -y --purge remove #{package}") == true )
			system('/usr/bin/apt-get -y autoremove') if success
			return success
		end

		def self.installed?(package)
			data = `/usr/bin/dpkg-query -W #{package} 2> /dev/null`.strip.chop
			data = data.split(' ')
			return true if (data.length > 1 and data[0] == package)
			if not ( system("/usr/bin/apt-get -y install #{package} 2>/dev/null 1>/dev/null") == true )
				system("/usr/bin/apt-get update 2>/dev/null 1>/dev/null")
			else
				return true
			end
			return ( system("/usr/bin/apt-get -y install #{package} 2>/dev/null 1>/dev/null") == true )
		end

		private
		def initialize; end
	end
end
