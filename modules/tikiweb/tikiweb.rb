require 'rubygems'

module Nuri
	module Module
		class Tikiweb

			include Nuri::Resource

			ConfigDir = '/var/lib/tikiweb'
			ConfigFile = '/var/lib/tikiweb/config'
			DownloadURL = 'http://sourceforge.net/projects/tikiwiki/files/Tiki_9.x_Herbig_Haro/9.2/tiki-9.2.tar.gz'

			def initialize
				self.register('Tikiweb', 'tikiweb')
			end
	
			# get state of this component in JSON
			def update_state
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
				puts 'install tikiweb...'

				# install required packages
				# mysql-client (optional: memcached)
				return false if not Nuri::Util.installed?('mysql-client')

				# install required PHP5 modules
				# php5-tidy php-pear php5-xcache php5-gd php5-xmlrpc php-xml-parser phpmyadmin
				return false if not Nuri::Util.installed?('php5-gd')
				return false if not Nuri::Util.installed?('php-pear')
				return false if not Nuri::Util.installed?('php5-xmlrpc')
				return false if not Nuri::Util.installed?('php-xml-parser')

				# download and extract tikiwiki to destination folder
				doc_root = self.get_state('webserver.document_root')
				path = self.get_state('path')
				tiki_dir = doc_root + path
				system('mkdir -p ' + tiki_dir) if not File.directory?(tiki_dir)
				return false if not File.directory?(tiki_dir)
				if not File.file?(tiki_dir + '/index.php')
					cmd = 'cd ' + tiki_dir + ';/usr/bin/wget ' + DownloadURL
					return false if ( system(cmd) != true )
					cmd = 'cd ' + tiki_dir + ';tar xvzf tiki-9.2.tar.gz 1>/dev/null 2>/dev/null;rm -f tiki-9.2.tar.gz;mv tiki-9.2/* .;rm -rf tiki-9.2'
					return false if ( system(cmd) != true )
				end
				cmd = "cd #{tiki_dir}; sudo /bin/sh setup.sh -n 1> /dev/null"
				return false if ( system(cmd) != true )

				cmd = "cd #{tiki_dir}; mv _htaccess .htaccess"
				return false if ( system(cmd) != true )

				mysql_host = self.get_state('database.parent.address')
				#mysql_host = (mysql_host == Nuri::Util.domainname ? 'localhost' : mysql_host)
				db_name = self.get_state('database.db_name')
				db_user = self.get_state('database.db_user')
				db_password = self.get_state('database.db_password')

				phpdb = "<?php
$db_tiki = 'mysql';
$dbversion_tiki = '8.0';
$host_tiki = '#{mysql_host}';
$user_tiki = '#{db_user}';
$pass_tiki = '#{db_password}';
$dbs_tiki = '#{db_name}';
$client_charset = 'utf8';
"

				local_db_file = "#{tiki_dir}/db/local.php";
				File.open(local_db_file, 'w') { |f| f.write(phpdb) }

				config = self.read_config
				config['installed'] = true
				config['path'] = path
				self.write_config(config)

				true
			end
		
			def uninstall(params={})
				puts 'uninstall tikiweb...'

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
