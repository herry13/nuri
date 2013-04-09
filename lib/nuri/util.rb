require 'thread'

module Nuri
	Port = 1313
	MaxLogAge = 7 # 7 days
	MaxLogFileSize = 2097152

	module Util
		@@home_dir = File.expand_path(File.dirname(__FILE__) + "/../..")
		@@logger = Logger.new(@@home_dir + "/var/message.log", Nuri::MaxLogAge, Nuri::MaxLogFileSize)
		@@system = nil
		@@debug = false
		@@lock_util = Mutex.new

		@@oncloud = nil

		def self.set_oncloud(cloud); @@oncloud = cloud; end
		def self.get_oncloud; @@oncloud; end

		def self.set_debug(debug=false); @@debug = debug; end

		def self.home_dir; return @@home_dir; end

		def self.http_log_file; return @@home_dir + "/var/http.log"; end

		def self.pid_file; return @@home_dir + "/var/nuri.pid"; end

		def self.set_system_information(system)
			@@lock_util.synchronize {
				@@system = system
				self_name = hostname
				@@system.keys.each { |k| @@system.delete(k) if @@system[k] == self_name }
				# save to file
				begin
					f = File.open(@@home_dir + '/var/system.info', 'w')
					f.write(JSON.generate(@@system))
					f.close
				rescue Exception => exp
					Nuri::Util.log 'Failed saving system information: ' + exp.to_s
				end
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

		def self.broadcast_system_information
			system = self.get_system_information
			updater = Nuri::SystemInfoUpdater.new
			updater.broadcast(system)
		end

		def self.warn(msg=nil)
			@@logger.warn msg if msg != nil
			puts "[warn] #{msg}" if @@debug
			return @@logger
		end

		def self.log(msg=nil)
			@@logger.info msg if msg != nil
			puts "[info] #{msg}" if @@debug
			return @@logger
		end

		def self.debug(msg=nil)
			@@logger.debug msg if not msg.nil?
			puts "[debug] #{msg}" if @@debug
			return @@logger
		end

		def self.error(msg=nil)
			@@logger.error msg if not msg.nil?
			puts "[error] #{msg}" if @@debug
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

		def self.whoami?; self.hostname.strip.sub(/\..*/,''); end

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
				return (result[3].nil? ? '' : result[3].chop)
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

		def self.nuri_version; return ''; end

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

		def self.is_nuri_active?(address)
			begin
				Timeout::timeout(1) do
					begin
						s = TCPSocket.new(address, Nuri::Port)
						s.close
						return true
					rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
					end
				end
			rescue Timeout::Error
			end
			false
		end
	end

	module Helper
		module Repository
			def self.update
				return Nuri::Helper::Command.exec("/usr/bin/apt-get -y update")
			end

			def self.add(repo, key=nil)
				if not Nuri::Helper::Package.installed?('python-software-properties')
					return false if not Nuri::Helper::Package.install('python-software-properties')
				end

				if repo[0,4] == "ppa:" # personal repository
					return Nuri::Helper::Command.exec("/usr/bin/add-apt-repository -y #{repo}")
				else # public repository
					codename = Command.getoutput(". /etc/lsb-release; echo $DISTRIB_CODENAME")
					cmd = "/us/bin/apt-key adv --recv-keys --keyserver keyserver.ubuntu.com #{key}"
					return false if not Command.exec(cmd)
					cmd = "/usr/bin/add-apt-repository 'deb #{repo} #{codename} main'"
					return Command.exec(cmd)
				end
			end

			def self.remove(repo)
				if not Nuri::Helper::Package.installed?('python-software-properties')
					return false if not Nuri::Helper::Package.install('python-software-properties')
				end

				if repo[0,4] == "ppa:" # personal repository
					return Nuri::Helper::Command.exec("/usr/bin/add-apt-repository -y -r #{repo}")
				else # public repository
					codename = Command.getoutput(". /etc/lsb-release; echo $DISTRIB_CODENAME")
					cmd = "/usr/bin/add-apt-repository -r 'deb #{repo} #{codename} main'"
					return Command.exec(cmd)
				end
			end
		end

		module Package
			def self.installed?(package)
				package = package.to_s
				return false if package.length <= 0
				data = `/usr/bin/dpkg-query -W #{package} 2> /dev/null`.strip.chop.split(' ')
				return true if (data[0].to_s == package)
				false
			end

			def self.version?(package)
				package = package.to_s
				return false if package.length <= 0
				data = `/usr/bin/dpkg-query -W #{package} 2> /dev/null`.strip.chop.split(' ')
				if data[0].to_s == package
					return data[1]
				end
				""
			end

			def self.install(package)
				package = package.to_s
				return false if package.length <= 0
				return true if installed?(package)
				Nuri::Helper::Command.exec("/usr/bin/apt-get -y --purge autoremove 2>/dev/null")
				if (Nuri::Helper::Command.exec("/usr/bin/apt-get -y install #{package} 2>/dev/null") == false)
					Nuri::Helper::Command.exec("/usr/bin/apt-get -y update 2>/dev/null")
				else
					return true
				end
				return (Nuri::Helper::Command.exec("/usr/bin/apt-get -y install #{package} 2>/dev/null") == true)
			end

			def self.uninstall(package)
				package = package.to_s
				return false if package.length <= 0
				return true if not installed?(package)
				Nuri::Helper::Command.exec("sudo /usr/bin/apt-get -y --purge autoremove 2>/dev/null")
				if (Nuri::Helper::Command.exec("sudo /usr/bin/apt-get -y --purge remove #{package} 2>/dev/null") == true)
					Nuri::Helper::Command.exec("sudo /usr/bin/apt-get -y --purge autoremove 2>/dev/null")
					Nuri::Helper::Command.exec("sudo /usr/bin/apt-get -y --purge autoremove 2>/dev/null")
					return true
				end
				return false
			end
		end

		module Command
			def self.getoutput(command)
				command = command.to_s
				return nil if command.length <= 0
				return `#{command} 2>/dev/null`.to_s
			end

			def self.exec(command)
				command = command.to_s
				return true if command.length <= 0
				return (system(command) == true)
			end
		end

		module Service
			def self.running?(service)
				service = service.to_s
				return false if service.length <= 0
				data = `/usr/bin/service #{service} status 2>/dev/null`
				return (not (data =~ /is running/).nil? or not (data =~ /start\/running/).nil?)
			end

			def self.start(service, debug=false)
				service = service.to_s
				return false if service.length <= 0
				return true if running?(service)
				cmd = "/usr/bin/sudo /usr/bin/service #{service} start 2>/dev/null"
				cmd += " 1>/dev/null" if not debug
				return (system(cmd) == true)
			end

			def self.stop(service, debug=false)
				service = service.to_s
				return false if service.length <= 0
				return true if not running?(service)
				cmd = "/usr/bin/sudo /usr/bin/service #{service} stop 2>/dev/null"
				cmd += " 1>/dev/null" if not debug
				return (system(cmd) == true)
			end
		end
	end

end

