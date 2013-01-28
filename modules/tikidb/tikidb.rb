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
			def update_state
				self.reset
				if File.file?(ConfigFile)
					config = read_config
					config.each { |k,v| @state[k] = v }
				end

				db_name = @state['db_name']
				if not @state['database'].nil?
					port = self.get_state(@state['database'] + '.port')
					host = self.get_state(@state['database'] + '.parent.domainname')
					host = (host == Nuri::Util.domainname ? 'localhost' : host)
					user = 'root'
					passwd = self.get_state(@state['database'] + '.root_password')
			
					# installed
					if not port.is_a?(Nuri::Undefined) and not port.nil? and
							not db_name.nil? and db_name != ''
						sql = "show databases like '#{db_name}';"
						result = do_query(host, port, user, passwd, db_name, sql, true)
						@state['installed'] = result.split("\n")[1] == db_name
					end
				end

				return @state
			end

			def install(params={})
				return false if not Nuri::Util.installed?('mysql-client')

				db_name = self.get_state('db_name').to_s
				if db_name != nil and db_name != ''
					sql = "DROP DATABASE IF EXISTS #{db_name}; CREATE DATABASE #{db_name} default character set 'UTF8'; "
					return false if not self.execute_sql(sql)

					tikisql_file = Nuri::Util.home_dir + "/modules/tikidb/tiki.sql"
					sql = File.read(tikisql_file)
					return false if not self.execute_sql(sql, db_name)

					config = self.read_config
					config['installed'] = true
					self.write_config(config)

					return true
				end

				false
			end
	
			def uninstall(params={})
				return false if not Nuri::Util.installed?('mysql-client')
				db_name = self.get_state('db_name')

				if db_name != nil 
					sql = "DELETE FROM db WHERE db = '#{db_name}';";
					return false if not self.execute_sql(sql, 'mysql')

					sql = "DROP DATABASE IF EXISTS #{db_name};"
					return false if not self.execute_sql(sql)

					cmd = '/bin/rm -rf /var/lib/tikidb/'
					return ( system(cmd) == true )
				end

				false
			end

			def set_tikiweb(params={})
				# 1) revoke previous permissions
				db_name = self.get_state('db_name')
				db_user = self.get_state('db_user')
				db_password = self.get_state('db_password')
				sql = "DELETE FROM db WHERE db = '#{db_name}';";
				return false if not self.execute_sql(sql, 'mysql')

				# 2) grant permissions from current tikiweb
				sql = ''
				params['webs'].each.each { |host|
					db_host = self.get_state(host + '.parent.address')
					sql += "GRANT ALL ON #{db_name}.* TO '#{db_user}'@'#{db_host}' IDENTIFIED BY '#{db_password}';"
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

			protected
			def read_config
				config = {}
				File.open(ConfigFile) { |f| config = JSON[ f.read ] } if File.file?(ConfigFile)
				config
			end

			def write_config(config={})
				Dir.mkdir(ConfigDir) if not File.directory?(ConfigDir)
				File.open(ConfigFile, 'w') { |f| f.write( JSON.pretty_generate(config) ) }
			end

			ScriptFile = '/tmp/tikidb.sql'

			def do_query(host, port, user, password, db_name, sql, query=false)
				File.open(ScriptFile, 'w') { |f| f.write(sql) }
				cmd = "mysql --user=#{user} --password=#{password} --host=#{host} --port=#{port} #{db_name} < #{ScriptFile}"
				if not query
					result = system(cmd)
					File.delete(ScriptFile) if File.exist?(ScriptFile)
					return (result == true)
				else
					return `#{cmd} 2>/dev/null`
				end
			end

			def execute_sql(sql, db_name='', query=false)
				port = self.get_state('database.port')
				host = self.get_state('database.parent.domainname')
				host = (host == Nuri::Util.domainname ? 'localhost' : host)
				user = 'root'
				passwd = self.get_state('database.root_password')

				return do_query(host, port, user, passwd, db_name, sql, query)
			end
	
		end
	end
end
