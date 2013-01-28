require 'rubygems'
require 'json'
require 'augeas'

module Nuri
	module Module
		class Apache
			include Nuri::Resource

			ConfigFile = '/etc/apache2/sites-available/default'
			InstallingLockFile = '/tmp/nuri_apache_installing'
			NotRunningLockFile = '/tmp/nuri_apache_not_running'

			def initialize
				self.register('Apache', 'apache')
			end

			# get state of this component in JSON
			def update_state
				# php module
				@state['php_module'] = Nuri::Helper::Package.installed?('libapache2-mod-php5')
				# php_mysql module
				@state['php_mysql_module'] = Nuri::Helper::Package.installed?('php5-mysql')

				# apache2 installed & running
				if File.exist?(InstallingLockFile)
					@state['installed'] = @state['running'] = false
					@state['version'] = ''
				else
					@state['installed'] = Nuri::Helper::Package.installed?('apache2')
					@state['version'] = Nuri::Helper::Package.version?('apache2')
					@state['running'] = (File.exist?(NotRunningLockFile) ? false : Nuri::Helper::Service.running?('apache2'))
				end

				# port
				data = (File.file?("/etc/apache2/ports.conf") ? `/bin/grep -e "^Listen " /etc/apache2/ports.conf` : "")
				@state['port'] = (data.length > 0 ?	@state["port"] = data.split(' ')[1].to_i : 0)

				# document root
				data = (File.file?(ConfigFile) ?	`/bin/grep -e "DocumentRoot " #{ConfigFile}` : "")
				@state['document_root'] = (data.length > 0 ? data.strip.split(' ')[1] : '')

				# ServerName
				data = (File.file?(ConfigFile) ? `/bin/grep -e "ServerName " #{ConfigFile}` : "")
				@state['server_name'] = (data.length > 0 ? data.strip.split(' ')[1] : '')

				return @state
			end

			def install
				begin
					File.open(InstallingLockFile, 'w') { |f| f.write(' ') }
					return (Nuri::Helper::Package.install('apache2') and
							Nuri::Helper::Service.stop('apache2'))
				rescue
					return false
				ensure
					File.delete(InstallingLockFile) if File.exist?(InstallingLockFile)
				end
			end
		
			def uninstall
				begin
					Nuri::Helper::Package.uninstall('apache2')
					system('/bin/rm -rf /etc/apache2') if File.directory?('/etc/apache2')
					return true
				rescue
				end
				return false
			end
		
			def start
				return Nuri::Helper::Service.start('apache2')
			end
		
			def stop
				return Nuri::Helper::Service.stop('apache2')
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
				begin
					File.open(NotRunningLockFile, 'w') { |f| f.write(' ') }
					return Nuri::Helper::Service.stop('apache2') if Nuri::Helper::Package.install('php5-mysql')
					return false
				rescue
				ensure
					File.delete(NotRunningLockFile) if File.exist?(NotRunningLockFile)
				end
			end

			def uninstall_php_mysql_module
				begin
					File.open(NotRunningLockFile, 'w') { |f| f.write(' ') }
					return Nuri::Helper::Service.stop('apache2') if Nuri::Helper::Package.uninstall('php5-mysql')
					return false
				rescue
				ensure
					File.delete(NotRunningLockFile) if File.exist?(NotRunningLockFile)
				end
			end

			def install_php_module
				begin
					File.open(NotRunningLockFile, 'w') { |f| f.write(' ') }
					return Nuri::Helper::Service.stop('apache2') if Nuri::Helper::Package.install('libapache2-mod-php5')
					return false
				rescue
				ensure
					File.delete(NotRunningLockFile) if File.exist?(NotRunningLockFile)
				end
			end

			def uninstall_php_module
				begin
					File.open(NotRunningLockFile, 'w') { |f| f.write(' ') }
					return Nuri::Helper::Service.stop('apache2') if Nuri::Helper::Package.uninstall('libapache2-mod-php5')
					return false
				rescue
				ensure
					File.delete(NotRunningLockFile) if File.exist?(NotRunningLockFile)
				end
			end
		end
	end
end
