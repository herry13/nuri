require 'rubygems'

module Nuri
	module Module
		class Tikiwiki

			include Nuri::Resource

			ConfigDir = '/var/lib/tikiwiki'
			ConfigFile = '/var/lib/tikiwiki/config'

			def initialize
				self.register('Tikiwiki', 'tikiwiki')
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
				# TODO
puts 'install tikiwiki'
				# install required packages
				# memcached

				# install required PHP5 modules
				# php5-tidy php-pear php5-xcache php5-gd php5-xmlrpc php-xml-parser phpmyadmin

				# download and extract tikiwiki to destination folder
				doc_root = self.get_state('webserver.document_root')
				path = self.get_state('path')
				doc_root = doc_root + path
				system('mkdir -p ' + doc_root) if not File.directory?(doc_root)
				return false if not File.directory?(doc_root)
				if not File.file?(doc_root + '/index.php')
					cmd = 'cd ' + doc_root + ';/usr/bin/wget http://nena.inf.ed.ac.uk/tikiwiki/tiki-9.2.tar.gz 2>/dev/null 1>/dev/null'
					return false if not system(cmd)
					cmd = 'cd ' + doc_root + ';tar xvzf tiki-9.2.tar.gz 1>/dev/null 2>/dev/null;rm -f tiki-9.2.tar.gz;mv tiki-9.2/* .;rm -rf tiki-9.2'
					return false if not system(cmd)
				end
				result = `cd #{doc_root}; sudo /bin/sh setup.sh -n`
puts result
				
				localhost = self.get_state('parent.domainname')
				db_port = self.get_state('database.port')
				db_host = self.get_state('database.parent.domainname')
				db_root_passwd = self.get_state('database.root_password')
				if db_port != nil and db_host != nil and db_root_passwd != nil
					sql = "CREATE DATABASE tikiwiki default character set 'UTF8';"
					sql += "GRANT ALL ON tikiwiki.* TO 'tiki'@'#{localhost}' IDENTIFIED BY 'tikipassword';"
puts 'sql: ' + sql
				end

# TODO -- install database
				config = self.read_config
				config['install'] = true
				config['path'] = path
				self.write_config(config)
				self.self_get_state

				true
			end
		
			def uninstall(params={})
				# TODO
				false
			end

			def set_webserver(params={})
				config = read_config
				config['webserver'] = params['ws']
				write_config(config)
				self_get_state
				true
			end

			def set_database(params={})
				config = read_config
				config['database'] = params['db']
				write_config(config)
				self_get_state
				true
			end
		
			def set_path(params={})
				config = read_config
				config['path'] = params['path']
				write_config(config)
				self_get_state
				true
			end
		
			def upgrade(params={})
				false
			end
		end
	end
end
