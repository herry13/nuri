require 'thread'

module Nuri
	Port = 1313
	MaxLogAge = 7 # 7 days
	MaxLogFileSize = 2097152
	MaxGetLogsLines = 100

	module Util
		@@home_dir = File.expand_path(File.dirname(__FILE__) + "/../..")
		@@log_file = @@home_dir + "/var/message.log"
		@@logger = Logger.new(@@log_file, Nuri::MaxLogAge, Nuri::MaxLogFileSize)
		@@logger_stdout = Logger.new(STDOUT)
		@@system = nil
		@@debug = false
		@@lock_util = Mutex.new

		@@oncloud = nil

		def self.init
			@@logger_stdout.formatter = proc do |severity, datetime, progname, msg|
				"[#{severity[0]}, #{datetime}] #{msg}\n"
			end

			@@logger.formatter = proc do |severity, datetime, progname, msg|
				"[#{severity[0]}, #{datetime}] #{msg}\n"
			end
		end

		def self.get_logs
			numlines = Nuri::Helper::Command.getoutput("cat #{@@log_file} | wc -l").to_s.to_i
			start = (numlines > MaxGetLogsLines ? (numlines - MaxGetLogsLines + 1) : 1)
			Nuri::Helper::Command.getoutput("sed -n #{start},#{numlines}p #{@@log_file}")
		end

		def self.puts(msg)
			@@logger_stdout.info(msg)
		end

		def self.set_oncloud(cloud)
			@@oncloud = cloud
		end

		def self.get_oncloud
			@@oncloud
		end

		def self.set_debug(debug=false)
			@@debug = debug
		end

		def self.home_dir
			return @@home_dir
		end

		def self.http_log_file
			return @@home_dir + "/var/http.log"
		end

		def self.pid_file
			return @@home_dir + "/var/nuri.pid"
		end

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
			#puts "[warn] #{msg}" if @@debug
			@@logger_stdout.warn msg if @@debug
			return @@logger
		end

		def self.log(msg=nil)
			@@logger.info msg if msg != nil
			#puts "[info] #{msg}" if @@debug
			@@logger_stdout.info msg if @@debug
			return @@logger
		end

		def self.debug(msg=nil)
			@@logger.debug msg if not msg.nil?
			#puts "[debug] #{msg}" if @@debug
			@@logger_stdout.debug msg if @@debug
			return @@logger
		end

		def self.error(msg=nil)
			@@logger.error msg if not msg.nil?
			#puts "[error] #{msg}" if @@debug
			@@logger_stdout.error msg if @@debug
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
			if File.exist?('/usr/bin/nslookup')
				result = `nslookup #{ip}`.split("\n")
				if result.length < 4
					return Socket.gethostbyname(Socket.gethostname).first
				else
					result = result[3].split(" ")
					return (result[3].nil? ? '' : result[3].chop)
				end
			end
			ip
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

=begin
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
=end

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
				case Nuri::Util.platform
				when 'ubuntu'
					return Debian.update
				when 'sl'
					return Redhat.update
				end
				false
			end

			def self.remove(repo)
				case Nuri::Util.platform
				when 'ubuntu'
					return Debian.remove(repo)
				when 'sl'
					return Redhat.remove(repo)
				end
				false
			end

			def self.add(repo, key=nil)
				case Nuri::Util.platform
				when 'ubuntu'
					return Debian.add(repo)
				when 'sl'
					return Redhat.add(repo)
				end
				false
			end

			module Redhat
				def self.update; false; end
				def self.remove(repo); false; end
				def self.add(repo, key=nil); false; end
			end

			module Debian
				def self.update
					return Command.exec("/usr/bin/apt-get -y update")
				end
	
				def self.add(repo, key=nil)
					if not Package.installed?('python-software-properties')
						return false if not Package.install('python-software-properties')
					end
	
					if repo[0,4] == "ppa:" # personal repository
						return Command.exec("/usr/bin/add-apt-repository -y #{repo}")
					else # public repository
						codename = Command.getoutput(". /etc/lsb-release; echo $DISTRIB_CODENAME")
						cmd = "/usr/bin/apt-key adv --recv-keys --keyserver keyserver.ubuntu.com #{key}"
						return false if not Command.exec(cmd)
						cmd = "/usr/bin/add-apt-repository 'deb #{repo} #{codename} main'"
						return Command.exec(cmd)
					end
				end
	
				def self.remove(repo)
					if not Package.installed?('python-software-properties')
						return false if not Nuri::Helper::Package.install('python-software-properties')
					end
	
					if repo[0,4] == "ppa:" # personal repository
						return Command.exec("/usr/bin/add-apt-repository -y -r #{repo}")
					else # public repository
						codename = Command.getoutput(". /etc/lsb-release; echo $DISTRIB_CODENAME")
						cmd = "/usr/bin/add-apt-repository -r 'deb #{repo} #{codename} main'"
						return Command.exec(cmd)
					end
				end
			end
		end

		module Package
			def self.installed?(package)
				case Nuri::Util.platform
				when 'ubuntu'
					return Debian.installed?(package)
				when 'sl'
					return Redhat.installed?(package)
				end
				false
			end

			def self.version?(package)
				case Nuri::Util.platform
				when 'ubuntu'
					return Debian.version?(package)
				when 'sl'
					return Redhat.version?(package)
				end
				false
			end

			def self.install(package)
				case Nuri::Util.platform
				when 'ubuntu'
					return Debian.install(package)
				when 'sl'
					return Redhat.install(package)
				end
				false
			end

			def self.uninstall(package)
				case Nuri::Util.platform
				when 'ubuntu'
					return Debian.uninstall(package)
				when 'sl'
					return Redhat.uninstall(package)
				end
				false
			end

			module Redhat
				def self.installed?(package)
					data = Command.getoutput("rpmquery #{package}").strip
					return (data.length > 0)
				end

				def self.version?(package)
					data = Command.getoutput("rpmquery #{package}").strip
					if data.length > package.length
						return data[package.length, data.length-package.length]
					end
					''
				end

				def self.install(package)
					cmd = "yum -y install #{package}"
					return Command.exec(cmd)
				end

				def self.uninstall(package)
					cmd = "yum -y erase #{package}"
					return Command.exec(cmd)
				end
			end

			module Debian
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
					Command.exec("/usr/bin/apt-get -y --purge autoremove 2>/dev/null")
					if (Command.exec("/usr/bin/apt-get -y install #{package} 2>/dev/null") == false)
						Command.exec("/usr/bin/apt-get -y update 2>/dev/null")
					else
						return true
					end
					return (Command.exec("/usr/bin/apt-get -y install #{package} 2>/dev/null") == true)
				end
	
				def self.uninstall(package)
					package = package.to_s
					return false if package.length <= 0
					return true if not installed?(package)
					Command.exec("sudo /usr/bin/apt-get -y --purge autoremove 2>/dev/null")
					if (Command.exec("sudo /usr/bin/apt-get -y --purge remove #{package} 2>/dev/null") == true)
						Command.exec("sudo /usr/bin/apt-get -y --purge autoremove 2>/dev/null")
						Command.exec("sudo /usr/bin/apt-get -y --purge autoremove 2>/dev/null")
						return true
					end
					return false
				end
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
			ServiceCommand = (File.exist?('/usr/bin/service') ? '/usr/bin/service' : '/sbin/service')

			def self.running?(service)
				service = service.to_s
				return false if service.length <= 0
				data = `#{ServiceCommand} #{service} status 2>/dev/null`
				return (not (data =~ /is running/).nil? or not (data =~ /start\/running/).nil?)
			end

			def self.start(service, debug=false)
				service = service.to_s
				return false if service.length <= 0
				return true if running?(service)
				case Nuri::Util.platform
				when 'ubuntu'
					return Debian.start(service, debug)
				when 'sl'
					return Redhat.start(service, debug)
				end
				false
			end

			def self.stop(service, debug=false)
				service = service.to_s
				return false if service.length <= 0
				return true if not running?(service)
				case Nuri::Util.platform
				when 'ubuntu'
					return Debian.stop(service, debug)
				when 'sl'
					return Redhat.stop(service, debug)
				end
				false
			end

			module Debian	
				def self.start(service, debug=false)
					cmd = "/usr/bin/sudo #{ServiceCommand} #{service} start 2>/dev/null"
					cmd += " 1>/dev/null" if not debug
					return (system(cmd) == true)
				end
	
				def self.stop(service, debug=false)
					cmd = "/usr/bin/sudo #{ServiceCommand} #{service} stop 2>/dev/null"
					cmd += " 1>/dev/null" if not debug
					return (system(cmd) == true)
				end
			end

			module Redhat
				def self.start(service, debug=false)
					cmd = "#{ServiceCommand} #{service} start 2>/dev/null"
					cmd += " 1>/dev/null" if not debug
					return (system(cmd) == true)
				end
	
				def self.stop(service, debug=false)
					cmd = "#{ServiceCommand} #{service} stop 2>/dev/null"
					cmd += " 1>/dev/null" if not debug
					return (system(cmd) == true)
				end
			end

		end
	end

end

