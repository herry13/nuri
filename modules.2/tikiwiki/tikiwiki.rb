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
				tiki_dir = doc_root + path
				system('mkdir -p ' + tiki_dir) if not File.directory?(tiki_dir)
				return false if not File.directory?(tiki_dir)
				if not File.file?(tiki_dir + '/index.php')
					cmd = 'cd ' + tiki_dir + ';/usr/bin/wget http://nena.inf.ed.ac.uk/tikiwiki/tiki-9.2.tar.gz 2>/dev/null 1>/dev/null'
puts '::step 0'				
					return false if not system(cmd)
					cmd = 'cd ' + tiki_dir + ';tar xvzf tiki-9.2.tar.gz 1>/dev/null 2>/dev/null;rm -f tiki-9.2.tar.gz;mv tiki-9.2/* .;rm -rf tiki-9.2'
puts '::step 1'				
					return false if not system(cmd)
				end
puts '::step 2'
				return false if ( system("cd #{tiki_dir}; sudo /bin/sh setup.sh -n 1> /dev/null") == true )
puts '::step 3'				
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
				config['installed'] = true
				config['path'] = path
				self.write_config(config)
				self.get_self_state

				true
			end
		
			def uninstall(params={})
				cmd = "/bin/rm -rf /var/lib/tikiwiki"
				path = self.get_state('path')
				if path == '/' or path == ''
					doc_root = self.get_state('webserver.document_root')
					tiki_dir = doc_root + path
					cmd = "/bin/rm -rf #{tiki_dir} ; " + cmd
				end
				return ( system(cmd) == true )
			end

			def set_webserver(params={})
				config = read_config
				config['webserver'] = params['ws']
				self.write_config(config)
				self.get_self_state
				true
			end

			def set_database(params={})
				config = read_config
				config['database'] = params['db']
				self.write_config(config)
				self.get_self_state
				return true
			end
		
			def set_path(params={})
				config = read_config
				config['path'] = params['path']
				self.ite_config(config)
				self.get_self_state
				true
			end
		
			def upgrade(params={})
				false
			end
		end
	end
end
