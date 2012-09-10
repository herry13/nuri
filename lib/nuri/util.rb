module Nuri
	class Util
		@@rootdir = File.expand_path(File.dirname(__FILE__) + "/../..")
		@@logger = Logger.new(@@rootdir + "/log/message.log")

		def self.rootdir
			return @@rootdir
		end

		def self.create_object(class_path)
			return if not class_path.is_a?(String)
			class_path = '$.' + class_path if not class_path.isref
			obj = { '_isa'=>class_path, '_context'=>'object' }
			Nuri::Sfp::Sfplibs.expand_object(obj, self.get_main)
			return obj
		end

		def self.get_main
			return @@main if defined?(@@main) != nil
			mainfile = self.rootdir + '/etc/main.sfp'
			parser = Nuri::Sfp::Parser.new(@@rootdir)
			if File.exist?(mainfile)
				@@main = parser.parse_file(mainfile)
			else
				main = 'include "modules/node/node.sfp"'
				self.get_modules.each do |mod|
					main += "\ninclude \"" + @@rootdir + "/modules/" + mod + '/' + mod + '.sfp"'
				end
				main += "\n"
				parser.parse(main)
				@@main = parser.to_sfp
			end
			return @@main
		end

		def self.get_modules
			modules_dir = @@rootdir + "/modules"
			modules = Array.new
			Dir.foreach(modules_dir) do |mod|
				next if mod == 'node'
				path = modules_dir + "/" + mod
				if File.directory?(path) and File.file?(path + "/" + mod + ".sfp") and
						File.file?(path + "/" + mod + ".rb")
					modules << mod
				end
			end
			modules
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
			@@os = (`uname -s`).strip #if @@os == nil
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
