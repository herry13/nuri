require 'rubygems'
require 'json'
require 'augeas'

module Nuri
	module Module
		class Apache

			include Nuri::Resource

			def initialize
				self.load('Apache', 'apache')
			end
	
			# get state of this component in JSON
			def get_state
				# installed & running
				data = `/usr/bin/dpkg-query -W apache2`
				data = data.split(' ')
				@state["installed"] = data.length > 1 and data[0] == 'apache2'
				if @state["installed"]
					@state["version"] = data[1]
					data = `/usr/bin/service apache2 status`
					@state["running"] = ((data =~ /is running/) != nil)
				else
					@state["version"] = ""
					@state["running"] = false
				end
				# port
				data = (File.file?("/etc/apache2/ports.conf") ?
					`/bin/grep -e "^Listen " /etc/apache2/ports.conf` : "")
				if data.length > 0
					data = data.split(' ')
					@state["port"] = data[1].to_i
				else
					@state["port"] = 0
				end
				# document root
				data = (File.file?("/etc/apache2/sites-available/default") ?
					`/bin/grep -e "DocumentRoot " /etc/apache2/sites-available/default` : "")
				if data.length > 0
					data.strip!
					data = data.strip.split(' ')
					@state["document_root"] = data[1]
				else
					@state["docment_root"] = ""
				end
	
				return @state
			end
	
			def install
				result = system('/usr/bin/apt-get -y install apache2')
				result = system('/usr/bin/service apache2 stop') if result == true
				return (result == true)
			end
		
			def uninstall
				result = system('/usr/bin/apt-get -y remove apache2')
				system('/usr/bin/apt-get -y autoremove') if (result == true)
				return (result == true)
			end
		
			def start
				print 'Start apache2...'
				result = system('/usr/bin/service apache2 start')
				puts 'OK'
				return (result == true)
			end
		
			def stop
				print 'Stop apache2...'
				result = system('/usr/bin/service apache2 stop')
				puts 'OK'
				return (result == true)
			end
		
			def set_port(p)
				Augeas::open do |aug|
					aug.set("/files/etc/apache2/ports.conf/*[self::directive='NameVirtualHost']/arg",
						"*:" + p.to_s)
					aug.set("/files/etc/apache2/ports.conf/*[self::directive='Listen']/arg", p.to_s)
					aug.set('/files/etc/apache2/sites-available/default/VirtualHost/arg', "*:" + p.to_s)
					return true if aug.save
				end
				return false
			end
		
			def set_docroot(dir)
				Augeas::open do |aug|
					aug.set("/files/etc/apache2/sites-available/default/VirtualHost/*[self::directive='DocumentRoot']/arg", dir)
					return true if aug.save
				end
				return false
			end
		end
	end
end