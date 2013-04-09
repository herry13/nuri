require 'rubygems'
require 'json'

module Nuri
	module Module
		class Mariadb
			include Nuri::Resource

			def initialize
				self.register('Mariadb', 'mariadb')
			end

			# get state of this component in JSON
			def update_state
				self.reset

				@state['installed'] = Nuri::Helper::Package.installed?('mariadb-server')
				if @state['installed']
					data = Nuri::Helper::Command.getoutput('/usr/bin/service mysql status').to_s
					@state['running'] = (data =~ /MariaDB is stopped/).nil?
				end

				return @state
			end

			Key = "0xcbcb082a1bb943db"
			RepositoryURL = "http://ftp.heanet.ie/mirrors/mariadb/repo/10.0/ubuntu"
			DefaultRootPassword = "root"

			def install
				return (
					Nuri::Helper::Repository.add(RepositoryURL, Key) and
					Nuri::Helper::Repository.update and
					Nuri::Helper::Command.exec("echo mysql-server mysql-server/root_password " +
						"select #{DefaultRootPassword} | debconf-set-selections") and
					Nuri::Helper::Command.exec("echo mysql-server mysql-server/root_password_again " +
						"select #{DefaultRootPassword} | debconf-set-selections") and
					Nuri::Helper::Package.install('mariadb-server') and
					Nuri::Helper::Command.exec('echo "\n[mysqld]\nmax_connect_errors = 10000" >> ' +
						'/etc/mysql/my.cnf') and
					self.stop
				)
			end
		
			def uninstall
				return Nuri::Helper::Package.uninstall('mariadb-server')
			end
		
			def start
				return Nuri::Helper::Command.exec '/usr/bin/service mysql start'
			end
		
			def stop
				return Nuri::Helper::Command.exec '/usr/bin/service mysql stop'
			end
		end
	end
end
