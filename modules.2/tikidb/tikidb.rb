require 'rubygems'

module Nuri
	module Module
		class Tikidb

			include Nuri::Resource

			ConfigDir = '/var/lib/tikidb'
			ConfigFile = '/var/lib/tikidb/config'

			def initialize
				self.register('Tikidb', 'tikidb')
			end
	
			# get state of this component in JSON
			def get_self_state
				if File.file?(ConfigFile)
					config = read_config
					config.each { |k,v| @state[k] = v }
				end

				return @state
			end

			def read_config
				config = {}
				File.open(ConfigFile) do |f|
					f.read.split("\n").each { |line|
						line.chop
						key, value = line.split('=', 2)
						config[key] = (value == 'true' ? true : (value == 'false' ? false : value))
					}
				end if File.file?(ConfigFile)
				config
			end

			def write_config(config={})
				Dir.mkdir(ConfigDir) if not File.directory?(ConfigDir)
				File.open(ConfigFile, 'w') do |f|
					config.each { |k,v| f.write(k + '=' + v.to_s + "\n") }
				end
			end
	
			def install(params={})
				return false if not Nuri::Util.ensured?('mysql-client')

				web_host = self.get_state('tikiweb.parent.domainname')
				db_port = self.get_state('database.port')
				db_host = self.get_state('database.parent.domainname')
				db_root_passwd = self.get_state('database.root_password')
puts web_host.inspect
puts db_port.inspect
puts db_host.inspect
puts db_root_passwd.inspect

				if db_port != nil and db_host != nil and db_root_passwd != nil
					sql = "CREATE DATABASE tikiwiki default character set 'UTF8';"
					sql += "GRANT ALL ON tikiwiki.* TO 'tiki'@'#{localhost}' IDENTIFIED BY 'tikipassword';"
puts 'sql: ' + sql
				end

# TODO -- install database
				config = self.read_config
				config['installed'] = true
				config['path'] = path
				self.write_config(config)

				false
			end
		
			def uninstall(params={})
				false
			end

			def set_tikiweb(params={})
				config = self.read_config
				config['tikiweb'] = params['web']
				self.write_config(config)
				true
			end
		
			def upgrade(params={})
				false
			end
		end
	end
end
