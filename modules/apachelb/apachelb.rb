require 'rubygems'
require 'json'
require 'augeas'

module Nuri
	module Module
		class Apachelb

			include Nuri::Resource

			def initialize
				self.register('Apachelb', 'apachelb')
			end
	
			# get state of this component in JSON
			def get_self_state
				# TODO
				data = `/usr/bin/dpkg-query -W apache2`
				data = data.split(' ')
				@state['installed'] = (data.length > 1 and data[0] == 'apache2') and
					File.exists?('/etc/apache2/sites-enabled/load_balancer')

				if @state['installed']
					@state['version'] = data[1]
					data = `/usr/bin/service apache2 status`
					@state['running'] = ((data =~ /is running/) != nil)
				else
					@state['version'] = ''
					@state['running'] = false
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

				cmd = '/bin/cp -f ' + Nuri::Util.home_dir + '/modules/apachelb/load_balancer /etc/apache2/sites-enabled/'
				return false if ( system(cmd) != true )

				member = self.get_state('member')
				puts member.inspect

				return (result == true)
			end

			def uninstall(params={})
				result = system('/bin/rm -f /etc/apache2/sites-enabled/load_balancer')
				result = system('/usr/bin/apt-get -y --purge remove apache2') if (result == true)
				result = system('/usr/bin/apa-get -y --purge autoremove') if (result == true)
				return (result == true)
			end

			def start
				return ( system('/usr/bin/service apache2 start') == true )
			end

			def stop
				return ( system('/usr/bin/service apache2 stop') == true )
			end

			def set_member(params={})
				cmd = 'mkdir -p /var/lib/apachelb'
				return false if ( system(cmd) != true )
				config_file = '/var/lib/apachelb/config'
				begin
					File.open(config_file, 'w') do |f|
						f.write(JSON.pretty_generate(params))
					end
				rescue Exception => e
					Nuri::Util.log e.to_s
					return false
				end
				true
			end

			def set_server_name(params={})
				server_name = self.get_state('server_name')
				
				return false if server_name == nil
				cmd = "sed 's/<server_name>/#{server_name}/g' /etc/apache2/sites-enabled/load-balancer"
				return ( system(cmd) == true )
			end

		end
	end
end
