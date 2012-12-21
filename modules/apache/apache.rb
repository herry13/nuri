require 'rubygems'
require 'json'
require 'augeas'

module Nuri
	module Module
		class Apache

			include Nuri::Resource

			ConfigFile = '/etc/apache2/sites-available/default'

			def initialize
				self.register('Apache', 'apache')
			end

			# get state of this component in JSON
			def get_self_state
				# php module
				data = `/usr/bin/dpkg-query -W libapache2-mod-php5 2> /dev/null`.chop
				data = data.split(' ')
				@state['php_module'] = (data.length > 1 and data[0] == 'libapache2-mod-php5')

				# php_mysql module
				data = `/usr/bin/dpkg-query -W php5-mysql 2> /dev/null`
				data = data.split(' ')
				@state['php_mysql_module'] = (data.length > 1 and data[0] == 'php5-mysql')

				# installed & running
				data = `/usr/bin/dpkg-query -W apache2`
				data = data.split(' ')
				@state["installed"] = (data.length > 1 and data[0] == 'apache2')
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
				data = (File.file?(ConfigFile) ?	`/bin/grep -e "DocumentRoot " #{ConfigFile}` : "")
				if data.length > 0
					data = data.strip.split(' ')
					@state["document_root"] = data[1]
				else
					@state["docment_root"] = ""
				end

				# ServerName
				data = (File.file?(ConfigFile) ? `/bin/grep -e "ServerName " #{ConfigFile}` : "")
				if data.length > 0
					data = data.strip.split(' ')
					@state['server_name'] = data[1]
				else
					@state['server_name'] = ''
				end

				return @state
			end
	
			def install
				result = system('/usr/bin/apt-get -y install apache2')
				result = system('sudo /usr/bin/service apache2 stop') if result == true
				return (result == true)
			end
		
			def uninstall
				result = system('/usr/bin/apt-get -y --purge remove apache2')
				system('/usr/bin/apt-get -y --purge autoremove') if (result == true)
				system('/bin/rm -rf /etc/apache2') if File.directory?('/etc/apache2')
				return (result == true)
			end
		
			def start
				print 'Start apache2...'
				result = system('sudo /usr/bin/service apache2 start')
				puts 'OK'
				return (result == true)
			end
		
			def stop
				print 'Stop apache2...'
				result = system('sudo /usr/bin/service apache2 stop')
				puts 'OK'
				return (result == true)
			end
		
			def set_port(params=nil)
				return false if params == nil
				p = params['target']
				Augeas::open do |aug|
					aug.set("/files/etc/apache2/ports.conf/*[self::directive='NameVirtualHost']/arg",
						"*:" + p.to_s)
					aug.set("/files/etc/apache2/ports.conf/*[self::directive='Listen']/arg", p.to_s)
					aug.set('/files/etc/apache2/sites-available/default/VirtualHost/arg', "*:" + p.to_s)
					return true if aug.save
				end
				return false
			end

			def set_document_root(params={})
				return false if not params.has_key?('target')
				dir = params['target']
				Augeas::open do |aug|
					aug.set("/files/etc/apache2/sites-available/default/VirtualHost/*[self::directive='DocumentRoot']/arg", dir)
					return true if aug.save
				end
				return false
			end

			def set_server_name(params={})
				return false if not params.has_key?('target')
				server_name = params['target']
				data = File.read(ConfigFile)
				output = ""
				data.split("\n").each do |line|
					tuple = line.strip.split(' ')
					if tuple[0] == 'ServerName'
						# skip
					elsif tuple[0] == 'DocumentRoot'
						output += "#{line} \n"
						output += "ServerName #{server_name}\n"
					elsif line.strip != ''
						output += "#{line} \n"
					end
				end
				File.open(ConfigFile, 'w') { |f| f.write(output) }

				true
			end

			def install_php_mysql_module
				success = Nuri::Util.installed?('php5-mysql')
				self.stop if success
				return success
			end

			def uninstall_php_mysql_module
				success = Nuri::Util.uninstalled?('php5-mysql')
				self.stop if success
				return success
			end

			def install_php_module
				success = Nuri::Util.installed?('libapache2-mod-php5')
				self.stop if success
				return success
			end

			def uninstall_php_module
				success = Nuri::Util.uninstalled?('libapache2-mod-php5')
				self.stop if success
				return success
			end
		end
	end
end
