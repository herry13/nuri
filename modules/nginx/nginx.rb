require 'rubygems'
require 'json'

module Nuri
	module Module
		class Nginx
			include Nuri::Resource

			def initialize
				self.register('Nginx', 'nginx')
			end

			# get state of this component in JSON
			def update_state
				self.reset

				@state['installed'] = Nuri::Helper::Package.installed?('nginx')
				if @state['installed']
					@state['running'] = (data =~ /Nginx is stopped/).nil?
				end

				return @state
			end

			def install
				return Nuri::Helper::Package.install('nginx')
			end
		
			def uninstall
				return Nuri::Helper::Package.uninstall('nginx')
			end
		
			def start
				return Nuri::Helper::Command.exec '/usr/bin/service nginx start'
			end
		
			def stop
				return Nuri::Helper::Command.exec '/usr/bin/service nginx stop'
			end

			def set_port(params={})
				# TODO -- params['target']
				false
			end
		end
	end
end
