require 'rubygems'
require 'json'
require 'augeas'

module Nuri
	module Module
		class Apachelb

			include Nuri::Resource

			ConfigFile = '/etc/apache2/sites-enabled/load_balancer'

			def initialize
				self.register('Apachelb', 'apachelb')
			end
	
			# get state of this component in JSON
			def get_self_state
				# TODO

				data = `/usr/bin/dpkg-query -W apache2`
				data = data.split(' ')
				@state['installed'] = (data.length > 1 and data[0] == 'apache2') and
					File.exists?(ConfigFile)

				if @state['installed']
					@state['version'] = data[1]
					data = `/usr/bin/service apache2 status`
					@state['running'] = ((data =~ /is running/) != nil)
				else
					@state['version'] = ''
					@state['running'] = false
				end

				data = `/bin/grep "ServerName" #{ConfigFile} 2>/dev/null`.chop.strip
				data = data.split(' ')
				if data[1] != nil and data[1] != '<server_name>'
					@state['server_name'] = data[1]
				else
					@state['server_name'] = ""
				end
	
				return @state
			end
	
			def install(params={})
				# TODO -- apply load-balancer configuration

				result = system('/usr/bin/apt-get -y install apache2')
				result = system('/usr/bin/service apache2 stop') if result == true
				result = system('/usr/sbin/a2enmod proxy') if result == true
				result = system('/usr/sbin/a2enmod proxy_balancer') if result == true
				result = system('/usr/sbin/a2enmod proxy_http') if result == true
				result = system('/usr/sbin/a2enmod status') if result == true

				cmd = "/bin/rm -f /etc/apache2/sites-enabled/*; /bin/cp -f #{Nuri::Util.home_dir}/modules/apachelb/load_balancer #{ConfigFile}"
				return false if ( system(cmd) != true )

				return (result == true)
			end

			def uninstall(params={})
				result = system("/bin/rm -f #{ConfigFile}")
				result = system('/usr/bin/apt-get -y --purge remove apache2') if (result == true)
				result = system('/usr/bin/apt-get -y --purge autoremove') if (result == true)
				return (result == true)
			end

			def start
				return ( system('/usr/bin/service apache2 start') == true )
			end

			def stop
				return ( system('/usr/bin/service apache2 stop') == true )
			end

			def set_member(params={})
				false
			end

			def set_server_name(params={})
				server_name = params['name']
				return false if server_name == nil

				cmd = "sed -i 's/ServerName.*/ServerName #{server_name}/g' #{ConfigFile}"
				return ( system(cmd) == true )
			end

		end
	end
end
