require 'rubygems'
require 'fog'

module Nuri
	module Module
		class Cloud
			include Nuri::Resource

			attr_accessor :auth_uri

			def initialize(options={})
				name = options['_self'] if options.has_key?('_self')
				name = options[:name] if options.has_key?(:name)

				# registering the component
				self.register('Cloud', options['_self']) #, true)

				@name = options['_self']
				@account_id = options['account_id']
				@auth_uri = options['auth_uri']
				@tenant_id = options['tenant_id']
				@secret_key = options['secret_key']
				@zone = options['zone']
				@conn = nil
			end

			def update_state
				url = URI.parse(@auth_uri)
				@state['running'] = self.is_port_open?(url.host, url.port)
			end

			def open_connection
				return false
			end

			def get_address(params={})
				self.open_connection if @conn.nil?
				servers = @conn.servers
				servers.each { |s|
					if s.name == params[:name] and s.state != "ACTIVE(deleting)"
						return s.public_ip_address
					end
				}
				nil
			end

			def get_info(name)
				self.open_connection if @conn.nil?
				servers = @conn.servers
				servers.each { |s| return s if s.name == name }
				nil
			end

			def is_port_open?(address, port)
				begin
					Timeout::timeout(1) do
						begin
							s = TCPSocket.new(address, port)
							s.close
							return true
						rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
							return false
						end
					end
				rescue Timeout::Error
				end
				return false
			end

			DefaultFlavorID = 100
			DefaultImageID = 75845
			DefaultKeyName = "herrykey"

			def create_vm(params={})
				self.open_connection if @conn.nil?
				name = params['vm']
				name = name[2, name.length-2] if name[0,2] == '$.'

				# return true if there is a VM with given name
				@conn.servers.each { |s| return true if s.name == name }

				# create VM
				new_server = @conn.servers.create(
					:name => name,
					:flavor_id => DefaultFlavorID, #vm['flavor_id'],
					:image_id => DefaultImageID,   #vm['image_id'],
					:key_name => DefaultKeyName,   #vm['key_name'],
					:security_groups => ['default'])
				if not new_server.nil?
					# wait until the new VM "ACTIVE"
					counter = 120
					info = self.get_info(name)
					while info.state != "ACTIVE" and counter > 0
						counter -= 1
						sleep 1
						info = self.get_info(name)
					end

					if info.state != "ACTIVE"
						Nuri::Util.warn "Too long waiting VM to become active #{name}"
						self.delete_vm('vm' => name)
						return false
					end

					address = info.public_ip_address
					# wait until SSH Server is running
					counter = 120
					while not self.is_port_open?(address, 22) and counter > 0
						sleep 1
						counter -= 1
					end

					if not self.is_port_open?(address, 22)
						Nuri::Util.warn "Cannot connect to SSH server of: #{name}"
						self.delete_vm('vm' => name)
						return false
					end

					# install nuri on newly created VM
					dir = File.expand_path(File.dirname(__FILE__))
					pub_key_file = dir + "/herrykey.pem"
					script_file = dir + "/nuri.sh"
					options = "-i #{pub_key_file} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
					remote_command = "'/bin/bash -s' < #{script_file}"
					cmd = "/usr/bin/ssh #{options} ubuntu@#{address} #{remote_command} 1>/dev/null 2>/dev/null"
					succeed = (system(cmd) == true)

					if succeed
						remote_command = "'/usr/bin/sudo nuri/bin/nuri.rb client start'"
						cmd = "timeout 5 /usr/bin/ssh #{options} ubuntu@#{address} #{remote_command} 1>/dev/null 2>/dev/null"
						system(cmd)
						succeed = Nuri::Util.is_nuri_active?(address)
						counter = 30
						while not succeed and counter > 0
							counter -= 1
							sleep 1
							succeed = Nuri::Util.is_nuri_active?(address)
						end
					else
						Nuri::Util.log "Cannot install Nuri on the new VM: #{name}"
						#self.delete_vm('vm' => name)
						return false
					end

					if not succeed
						Nuri::Util.log "Cannot start Nuri on the new VM: #{name}"
						self.delete_vm('vm' => name)
					else
						return true
					end
				else
					Nuri::Util.log "Cannot create VM: #{name}"
				end

				false
			end

			def delete_vm(params={})
				self.open_connection if @conn.nil?
				name = params['vm']
				name = name[2, name.length-2] if name[0,2] == '$.'

				# delete if VM with given name exists
				@conn.servers.each { |s|
					if s.name == name
						@conn.delete_server(s.id)
						# wait until the VM is completely deleted
						counter = 120
						info = self.get_info(name)
						while not info.nil? and counter > 0
							counter -= 1
							sleep 1
							info = self.get_info(name)
						end
						break
					end
				}
				return true
			end
		end
	end
end
