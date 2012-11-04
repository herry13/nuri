require 'rubygems'

module Nuri
	module Module
		class Tikiweb

			include Nuri::Resource

			ConfigDir = '/var/lib/tikiweb'
			ConfigFile = '/var/lib/tikiweb/config'

			def initialize
				self.register('Tikiweb', 'tikiweb')
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
puts 'install tikiweb'
				# install required packages
				# memcached
				return false if not Nuri::Util.ensured?('mysql-client')

				# install required PHP5 modules
				# php5-tidy php-pear php5-xcache php5-gd php5-xmlrpc php-xml-parser phpmyadmin
				return false if not Nuri::Util.ensured?('php5-gd')
				return false if not Nuri::Util.ensured?('php-pear')
				return false if not Nuri::Util.ensured?('php5-xmlrpc')
				return false if not Nuri::Util.ensured?('php-xml-parser')

				# download and extract tikiwiki to destination folder
				doc_root = self.get_state('webserver.document_root')
				path = self.get_state('path')
				tiki_dir = doc_root + path
				system('mkdir -p ' + tiki_dir) if not File.directory?(tiki_dir)
				return false if not File.directory?(tiki_dir)
				if not File.file?(tiki_dir + '/index.php')
					cmd = 'cd ' + tiki_dir + ';/usr/bin/wget http://nena.inf.ed.ac.uk/tikiwiki/tiki-9.2.tar.gz 2>/dev/null 1>/dev/null'
					return false if ( system(cmd) != true )
					cmd = 'cd ' + tiki_dir + ';tar xvzf tiki-9.2.tar.gz 1>/dev/null 2>/dev/null;rm -f tiki-9.2.tar.gz;mv tiki-9.2/* .;rm -rf tiki-9.2'
					return false if ( system(cmd) != true )
				end
				cmd = "cd #{tiki_dir}; sudo /bin/sh setup.sh -n 1> /dev/null"
				return false if ( system(cmd) != true )

				config = self.read_config
				config['installed'] = true
				config['path'] = path
				self.write_config(config)

				true
			end
		
			def uninstall(params={})
				doc_root = self.get_state('webserver.document_root')
				path = self.get_state('path')
				tiki_dir = doc_root + path
				if path == '/' or path == nil
					cmd = "/bin/rm -rf #{tiki_dir}/*"
				else
					cmd = "/bin/rm -rf #{tiki_dir}"
				end
				return false if ( system(cmd) != true )
				config = self.read_config
				config['installed'] = false
				self.write_config(config)
				true
			end

			def set_webserver(params={})
				config = self.read_config
				config['webserver'] = params['ws']
				self.write_config(config)
				true
			end

			def set_database(params={})
				config = self.read_config
				config['database'] = params['db']
				self.write_config(config)
				return true
			end
		
			def set_path(params={})
				config = self.read_config
				config['path'] = params['path']
				self.write_config(config)
				true
			end
		
			def upgrade(params={})
				false
			end
		end
	end
end
