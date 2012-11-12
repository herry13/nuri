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
				data = `/usr/bin/dpkg-query -W apache`
				data = data.split(' ')
				@state['installed'] = (data.length > 1 and data[0] == 'apache2')

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

config = "<VirtualHost *:80>
	ProxyRequests off
	ServerName <domainname>
	<Proxy balancer://nuricluster>
		BalancerMember <domainname1>
		BalancerMember <domainname2>
		Order Deny,Allow
		Deny from none
		Allow from all
		ProxySet lbmethod=byrequests
	</Proxy>
	<Location /balancer-manager>
		SetHandler balancer-manager
		Order Deny,Allow
		Allow from all
	</Location>
	ProxyPass /balancer-manager !
	ProxyPass / balancer://nuricluster/
</VirtualHost>"

				result = system('/usr/bin/apt-get -y install apache2')
				result = system('/usr/bin/service apache2 stop') if result == true

				return (result == true)
			end

			def uninstall(params={})
				result = system('/usr/bin/apt-get -y --purge remove apache2')
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
				false
			end

			def set_server_name(params={})
				false
			end

		end
	end
end
