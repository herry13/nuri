module Nuri
	module Module

		class GangliaMonitor
			include Nuri::Resource

			def initialize
				self.register('GangliaMonitor', 'gmond')
			end

			def update_state
				self.reset
				@state['installed'] = Nuri::Helper::Package.installed?('ganglia-monitor')
				@state['running'] = Nuri::Helper::Service.running?('ganglia-monitor')
				return @state
			end

			def install(params={})
				Nuri::Helper::Package.install('ganglia-monitor')
			end

			def uninstall(params={})
				Nuri::Helper::Package.uninstall('ganglia-monitor')
			end

			def start(params={})
				Nuri::Helper::Service.start('apache2')
			end

			def stop(params={})
				Nuri::Helper::Service.stop('apache2')
			end

			def set_port(params={})
				# TODO
				false
			end

		end
	end
end
