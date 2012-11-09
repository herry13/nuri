require 'rubygems'
require 'json'
require 'augeas'

module Nuri
	module Module
		class Apachelb < Apache

			include Nuri::Resource

			def initialize
				self.register('Apachelb', 'apachelb')
			end
	
			# get state of this component in JSON
			def get_self_state
				# TODO
	
				return @state
			end
	
			def install(params={})
				# TODO

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

				false
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
