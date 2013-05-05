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
				data = Nuri::Helper::Command.getoutput('ps ax | grep /usr/sbin/gmond | grep -v "grep"').strip
				@state['running'] = (data.length > 0)
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
