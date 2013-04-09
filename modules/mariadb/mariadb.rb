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
				@state['running'] = Nuri::Helper::Service.running?('mariadb')

				return @state
			end

			Key = "0xcbcb082a1bb943db"
			RepositoryURL = "http://ftp.heanet.ie/mirrors/mariadb/repo/10.0/ubuntu"

			def install
				return false if not Nuri::Helper::Repository.add(RepositoryURL, Key)
				return false if not Nuri::Helper::Repository.update
				return Nuri::Helper::Package.install('mariadb-server')
			end
		
			def uninstall
				return Nuri::Helper::Package.uninstall('mariadb-server')
			end
		
			def start
				return Nuri::Helper::Service.start('mariadb')
			end
		
			def stop
				return Nuri::Helper::Service.stop('mariadb')
			end
		end
	end
end
