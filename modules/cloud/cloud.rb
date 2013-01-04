require 'rubygems'
require 'fog'

module Nuri
	module Module
		class Cloud
			include Nuri::Resource

			def initialize(options={})
				self.register('Cloud', options['_self'], true)

				@name = options['_self']
				@account_id = options['account_id']
				@auth_uri = options['auth_uri']
				@tenant_id = options['tenant_id']
				@secret_key = options['secret_key']
				@zone = options['zone']
				@conn = Fog::Compute.new(:provider => "HP",
				                         :hp_account_id => @account_id,
				                         :hp_auth_uri => @auth_uri,
				                         :hp_tenant_id => @tenant_id,
				                         :hp_secret_key => @secret_key,
				                         :hp_avl_zone => @zone)
			end

			def get_address(params={})
				servers = @conn.servers
				servers.each { |s| return s.public_ip_address if s.name == params[:name] }
			end

		end
	end
end
