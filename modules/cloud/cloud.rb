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
				@conn = nil
			end

			def open_connection
				@conn = Fog::Compute.new(:provider => "HP",
				                         :hp_account_id => @account_id,
				                         :hp_auth_uri => @auth_uri,
				                         :hp_tenant_id => @tenant_id,
				                         :hp_secret_key => @secret_key,
				                         :hp_avl_zone => @zone)
			end

			def get_address(params={})
				self.open_connection if @conn.nil?
				servers = @conn.servers
				servers.each { |s| return s.public_ip_address if s.name == params[:name] }
				nil
			end

			def get_info(params={})
				self.open_connection if @conn.nil?
				servers = @conn.servers
				servers.each { |s|
					if s.name == params[:name]
						return { :flavor => s.flavor_id,
						         :id => s.id,
						         :image => s.image_id,
						         :key_name => s.key_name,
									:public_ip_address => s.public_ip_address,
									:private_ip_address => s.private_ip_address }
					end
				}
			end

			def create_vm(params={})
				self.open_connection if @conn.nil?

				# TODO -- fix these codes
				vm = params['vm']
				name = vm['_self']

				# return true if there is a VM with given name
				@conn.servers.each { |s| return true if s.name == name }

				# create VM
				return @conn.servers.create(
					:name => name,
					:flavor_id => vm['flavor_id'],
					:image_id => vm['image_id'],
					:key_name => vm['key_name'],
					:security_groups => ['default'])
			end

			def delete_vm(params={})
				self.open_connection if @conn.nil?
				# TODO -- fix these codes
				vm = params['vm']
				name = vm['_self']

				# delete if VM with given name exists
				@conn.servers.each { |s| return @conn.delete_server(s.id) if s.name == name }
				return true
			end
		end
	end
end
