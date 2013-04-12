require 'rubygems'
require 'json'

module Nuri
	module Module
		class Libvirtd
			include Nuri::Resource

			def initialize
				self.register('Libvirtd', 'libvirtd')
			end

			# get state of this component in JSON
			def update_state
				self.reset

				@state['installed'] = Nuri::Helper::Package.installed?('libvirt')
				@state['running'] = Nuri::Helper::Package.running?('libvirtd')

				return @state
			end

			def install
				false
			end
		
			def uninstall
				false
			end
		
			def start
				return Nuri::Helper::Service.start 'libvirtd'
			end
		
			def stop
				return Nuri::Helper::Service.stop 'libvirtd'
			end
		end
	end
end
