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
				@state['tikiweb'] = []
				if File.file?(ConfigFile)
					config = read_config
					config.each { |k,v| @state[k] = v }
				end

				return @state
			end

			def read_config
				config = {}
				File.open(ConfigFile) { |f| config = JSON[ f.read ] } if File.file?(ConfigFile)
				config
			end

			def write_config(config={})
				Dir.mkdir(ConfigDir) if not File.directory?(ConfigDir)
				File.open(ConfigFile, 'w') { |f| f.write( JSON.pretty_generate(config) ) }
			end
	
			def install(params={})
				return false if not Nuri::Util.installed?('mysql-client')

				db_name = self.get_state('db_name').to_s

				if db_name != nil and db_name != ''

					sql = "DROP DATABASE IF EXISTS #{db_name}; CREATE DATABASE #{db_name} default character set 'UTF8'; "
puts 'exec: ' + sql
					return false if not self.execute_sql(sql)

					tikisql_file = Nuri::Util.home_dir + "/modules/tikidb/tiki.sql"
					sql = File.read(tikisql_file)
puts 'exec: ' + tikisql_file
					return false if not self.execute_sql(sql)

					config = self.read_config
					config['installed'] = true
					self.write_config(config)

					return true
				end

				false
			end

			def execute_sql(sql)
				port = self.get_state('database.port')
				host = self.get_state('database.parent.domainname')
				host = (mysql_host == Nuri::Util.domainname ? 'localhost' : mysql_host)
				user = 'root'
				passwd = self.get_state('database.root_password')

				script_file = '/tmp/tikidb.sql'
				result = false
				File.open(script_file, 'w') do |file|
					file.write(sql)
					file.flush
				end
				cmd = "mysql --user=#{user} --password=#{passwd} --host=#{host} --port=#{port} < #{script_file}"
				result = system(cmd)
				File.delete(script_file)
				return (result == true)
			end
		
			def uninstall(params={})
				return false if not Nuri::Util.installed?('mysql-client')

				db_name = self.get_state('db_name')

				if db_name != nil 
					sql = "DROP DATABASE IF EXISTS #{db_name};"
					return false if not self.execute_sql(sql)

					config = self.read_config
					config['installed'] = false
					self.write_config(config)

					return true

				end

				false
			end

			def set_tikiweb(params={})
				# 1) revoke previous permissions
				db_name = self.get_state('db_name')
				db_user = self.get_state('db_user')
				db_password = self.get_state('db_password')
				sql = "REVOKE ALL ON #{db_name}.* FROM '#{db_user}'@'%';";

				# 2) grant permissions from current tikiweb
				params['webs'].each.each { |host|
					sql += "GRANT ALL ON #{db_name}.* TO '#{db_user}'@'#{host}' IDENTIFIED BY '#{db_password}';"
				}

				config = self.read_config
				if not self.execute_sql(sql)
					config['tikiweb'] = []
					self.write_config(config)
					return false
				else
					config['tikiweb'] = params['webs']
					self.write_config(config)
					return true
				end
			end

			def set_account(params={})
				config = self.read_config
				config['db_user'] = params['user']
				config['db_password'] = params['passwd']
				self.write_config(config)
				true
			end

			def set_db_name(params={})
				config = self.read_config
				config['db_name'] = params['db']
				self.write_config(config)
				true
			end

			def set_database(params={})
				config = self.read_config
				config['database'] = params['db']
				self.write_config(config)
				true
			end

	
			def upgrade(params={})
				false
			end
		end
	end
end
