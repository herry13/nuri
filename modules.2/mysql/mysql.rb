require 'rubygems'
require 'json'
require 'augeas'

module Nuri
	module Module
		class Mysql
			include Nuri::Resource

			def initialize
				self.load('Mysql', 'mysql')
			end
	
			# get state of this component in JSON
			def get_self_state
				# installed & running
				data = `/usr/bin/dpkg-query -W mysql-server 2> /dev/null`
				@state["installed"] = ((data =~ /mysql\-server/) != nil)
				if @state["installed"]
					@state["version"] = data.split(' ')[1]
					data = `/usr/bin/service mysql status`
					@state["running"] = ((data =~ /running/) != nil)
				else
					@state["version"] = ""
					@state["running"] = false
				end
				# port
				data = (File.file?("/etc/mysql/my.cnf") ? `/bin/grep -e "^port" /etc/mysql/my.cnf` : "")
				if data.length > 0
					data = data.split('=')
					@state["port"] = data[1].strip.to_i
				else
					@state["port"] = 0
				end

				# root password
				if File.file?('/etc/mysql/nuri.cnf')
					@state["root_password"] = (`/bin/cat /etc/mysql/nuri.cnf`).sub(/\n$/,'')
				else
					@state['root_password'] = ''
				end
	
				return @state
			end
	
			def install
				return false if system('echo mysql-server mysql-server/root_password select mysql | debconf-set-selections') != true
				return false if system('echo mysql-server mysql-server/root_password_again select mysql | debconf-set-selections') != true
				if system('/usr/bin/apt-get -y install mysql-server') == true
					self.stop
					return (system('/bin/echo mysql > /etc/mysql/nuri.cnf') == true and
						system('/bin/chmod 0400 /etc/mysql/nuri.cnf') == true)
				end
				return false
			end
	
			def uninstall
				result = system('/usr/bin/apt-get -y purge mysql-server*')
				if result == true
					system('/bin/chmod 0600 /etc/mysql/nuri.cnf')
					system('/bin/rm /etc/mysql/nuri.cnf')
					system('/usr/bin/apt-get -y autoremove')
					system("/usr/bin/dpkg -l | /bin/grep ^rc | /usr/bin/cut -d' ' -f3| /usr/bin/xargs /usr/bin/apt-get -y purge")
				end
				return (result == true)
			end
	
			def start
				return (system('/usr/bin/service mysql start') == true)
			end
	
			def stop
				return (system('/usr/bin/service mysql stop') == true)
			end
	
			def set_port(params)
				p = params['target']
				Augeas::open do |aug|
					paths = aug.match("/files/etc/mysql/my.cnf/*/port")
					paths.each { |path|
						aug.set(path, p.to_s)
					}
					return aug.save
				end
			end
	
			def set_root_password(params)
				passwd = params['passwd']
				system('/bin/chmod 0600 /etc/mysql/nuri.cnf')
				oldpass = (`/bin/cat /etc/mysql/nuri.cnf`).sub(/\n$/,'').sub(/"/,'\"')
				passwd.sub!(/"/,'\"')
				return (system("mysqladmin -u root -p\"#{oldpass}\" password \"#{passwd}\"") == true and
					system("/bin/echo \"#{passwd}\" > /etc/mysql/nuri.cnf") == true and
					system('/bin/chmod 0400 /etc/mysql/nuri.cnf'))
			end
		end
	end
end
