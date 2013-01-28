require 'rubygems'
require 'json'
require 'augeas'

module Nuri
	module Module
		class Mysql
			include Nuri::Resource

			def initialize
				self.register('Mysql', 'mysql')
			end
	
			# get state of this component in JSON
			def update_state
				# package mysql-server: installed, version, running
				@state['installed'] = Nuri::Helper::Package.installed?('mysql-server')
				@state['version'] = Nuri::Helper::Package.version?('mysql-server')
				@state['running'] = Nuri::Helper::Service.running?('mysql')

				# port
				data = (File.file?("/etc/mysql/my.cnf") ? `/bin/grep -e "^port" /etc/mysql/my.cnf` : "")
				@state['port'] = (data.length > 0 ? data.split('=')[1].strip.to_i : 0)

				# root password
				if File.file?('/etc/mysql/nuri.cnf')
					@state["root_password"] = Nuri::Helper::Command.getoutput("/bin/cat /etc/mysql/nuri.cnf 2>/dev/null").sub(/\n$/,'')
				else
					@state['root_password'] = ''
				end

				# can be accessed from outside?
				if @state['installed']
					data = Nuri::Helper::Command.getoutput("grep '^bind-address' /etc/mysql/my.cnf 2>/dev/null")
					@state['public'] = (data.length <= 0)
				else
					@state['public'] = false
				end

				return @state
			end
	
			def install(params={})
				return (Nuri::Helper::Command.exec('echo mysql-server mysql-server/root_password select mysql | debconf-set-selections') and
					Nuri::Helper::Command.exec('echo mysql-server mysql-server/root_password_again select mysql | debconf-set-selections') and
					Nuri::Helper::Package.install('mysql-server') and
					Nuri::Helper::Service.stop('mysql') and
					Nuri::Helper::Command.exec('/bin/echo mysql > /etc/mysql/nuri.cnf') and
					Nuri::Helper::Command.exec('/bin/chmod 0400 /etc/mysql/nuri.cnf'))
			end
	
			def uninstall(params={})
				Nuri::Helper::Command.exec('/bin/chmod 0600 /etc/mysql/nuri.cnf;/bin/rm -f /etc/mysql/nuri.cnf') if
					File.exist?('/etc/mysql/nuri.cnf')
				result = Nuri::Helper::Package.uninstall('mysql-server')
				Nuri::Helper::Command.exec('/bin/rm -rf /etc/mysql') if File.exist?('/etc/mysql')
				return result
			end
	
			def start(params={})
				return Nuri::Helper::Service.start('mysql')
			end
	
			def stop(params={})
				return Nuri::Helper::Service.stop('mysql')
			end
	
			def set_port(params={})
				p = params['target']
				Augeas::open do |aug|
					paths = aug.match("/files/etc/mysql/my.cnf/*/port")
					paths.each { |path|
						aug.set(path, p.to_s)
					}
					return aug.save
				end
			end

			def set_public(params={})
				if params['pub']
					cmd = '/bin/sed -i "s/^bind\-address/#bind\-address/g" /etc/mysql/my.cnf'
				else
					cmd = '/bin/sed -i "s/^#bind\-address/bind\-address/g" /etc/mysql/my.cnf'
				end
				return false if not Nuri::Helper::Command.exec(cmd)
				if self.get_state('running')
					return (Nuri::Helper::Service.stop('mysql') and
						Nuri::Helper::Service.start('mysql'))
				end
				true
			end
	
			def set_root_password(params={})
				passwd = params['passwd'].to_s
				Nuri::Helper::Command.exec('/bin/chmod 0600 /etc/mysql/nuri.cnf')
				oldpass = Nuri::Helper::Command.getoutput('/bin/cat /etc/mysql/nuri.cnf').sub(/\n$/,'').sub(/"/,'\"')
				passwd.sub!(/"/,'\"')
				return (Nuri::Helper::Command.exec("mysqladmin -u root -p\"#{oldpass}\" password \"#{passwd}\"") and
					Nuri::Helper::Command.exec("/bin/echo \"#{passwd}\" > /etc/mysql/nuri.cnf") and
					Nuri::Helper::Command.exec('/bin/chmod 0400 /etc/mysql/nuri.cnf'))
			end
		end
	end
end
