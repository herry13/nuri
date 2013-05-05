require 'rubygems'
require 'json'

module Nuri
	module Module
		class Mongodb
			include Nuri::Resource

			def initialize
				self.register('Mongodb', 'mongodb')
			end

			# get state of this component in JSON
			def update_state
				self.reset

				@state['installed'] = Nuri::Helper::Package.installed?('mongodb-server')
				@state['running'] = Nuri::Helper::Service.running?('mongodb')

				return @state
			end

			def install
				return Nuri::Helper::Package.install('mongodb-server')
			end
		
			def uninstall
				return Nuri::Helper::Package.uninstall('mongodb-server')
			end
		
			def start
				return Nuri::Helper::Service.start('mongodb')
			end
		
			def stop
				return Nuri::Helper::Service.stop('mongodb')
			end
		end
	end
end
