#Sfp.require 'fog'
require 'fog'
require 'yaml'

module Sfp::Module::HPCloudHelper
	protected
	def open_connection
		return true if not @conn.nil?
		begin
			config = self.read_config
			@conn = Fog::Compute.new({
				:provider => "HP",
				:hp_access_key => config['access_key'],
				:hp_secret_key => config['secret_key'],
				:hp_auth_uri => @model['auth_uri'],
				:hp_tenant_id => config['tenant_id'],
				:hp_avl_zone => @model['zone']
			})
		rescue Exception => exp
			Sfp::Agent.logger.error "#{exp}\n" + exp.backtrace.join("\n")
			@conn = nil
		end
		return !!@conn
	end

	def read_config
		config_file = ::File.expand_path(::File.dirname(__FILE__)) + "/config.sfp"
		return {} if not ::File.exist?(config_file)
		return YAML.load_file(config_file)
	end

	def get_info(name)
		return nil if not self.open_connection
		servers = @conn.servers
		servers.each { |s| return s if s.name == name }
		nil
	end

	def get_servers
		return {} if not self.open_connection
		servers = {}
		@conn.servers.each { |k,s|
			servers[k] = {}
			servers[k]['running'] = s.ready?
			servers[k]['ip'] = s.public_ip_address
		}
		servers
	end

	def helper_delete_vm(params={})
		return false if not self.open_connection

		name = params['vm'].sub(/^\$\./, '')

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
		true
	end
end

=begin
			def get_vm_address(params={})
				return self.get_address(:name => params['name'])
			end

			def get_address(params={})
				name = params[:name].to_s
				if name.length > 0
					self.open_connection if @conn.nil?
					return nil if @conn.nil?
					servers = @conn.servers
					servers.each { |s|
						if s.name == params[:name] and s.state == 'ACTIVE'
							return s.public_ip_address
						end
					}
				end
				nil
			end

			def get_vms(params={})
				data = {}
				self.open_connection if @conn.nil?
				return data if @conn.nil?
				servers = @conn.servers
				servers.each { |s| data[s.name] = s.public_ip_address }
				data
			end

			def get_info(name)
				self.open_connection if @conn.nil?
				return nil if @conn.nil?
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

			def save_config(config)
				config_file = Nuri::Util.home_dir + "/modules/#{@name}/config.sfp"
				File.open(ConfigFile, 'w') { |f| f.write(JSON.generate(config)) }
			end

			def read_config
				config_file = Nuri::Util.home_dir + "/modules/#{@name}/config.sfp"
				return {} if not File.exist?(config_file)
				return Nuri::Sfp::Parser.parse_file(config_file)['config']
			end

			# SFP method
			def set_account(params={})
				config = self.read_config
				params.each { |k,v| config[k] = v }
				self.save_config(config)
				return true
			end
			def set_account_id(params={}); self.set_account(params); end
			def set_auth_uri(params={}); self.set_account(params); end
			def set_tenant_id(params={}); self.set_account(params); end
			def set_secret_key(params={}); self.set_account(params); end
			def set_zone(params={}); self.set_account(params); end

			# SFP method
			def create_vm_small_ubuntu_quantal(params={})
				name = params['vm']
				name = name[2, name.length-2] if name[0,2] == '$.'
				return create_vm_with_flavor_and_image_ids({
					:name => name,
					:flavor_id => "101",
					:image_id => "75839",
				})
			end

			# SFP method
			def delete_vm(params={})
				self.open_connection if @conn.nil?
				return false if @conn.nil?

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

				# update system information
				system = Nuri::Util.get_system_information
				system[name] = nil
				Nuri::Util.set_system_information(system)
				# broadcast system information
				Nuri::Util.broadcast_system_information

				return [true, JSON.generate({"update_system" => true})]
			end

			# SFP method
			def create_vm(params={})
				name = params['vm']
				name = name[2, name.length-2] if name[0,2] == '$.'
	
				config = self.read_config
				return create_vm_with_flavor_and_image_ids({
					:name => name,
					:flavor_id => config['default_flavor_id'],
					:image_id => config['default_image_id'],
					:ssh_key_name => config['default_ssh_key_name'],
					:ssh_username => config['default_ssh_username'],
					:master_node => config['master_node'],
				})
			end

			private
			def create_vm_with_flavor_and_image_ids(params={})
				self.open_connection if @conn.nil?
				return false if @conn.nil?

				name = params[:name]
				image_id = params[:image_id]
				flavor_id = params[:flavor_id]

				# return true if there is a VM with given name
				@conn.servers.each { |s| return true if s.name == name }

				key_name = params[:ssh_key_name]
				username = params[:ssh_username]

				success = false

				# create VM
				Nuri::Util.log "vm[#{name}]: creating"
				server = @conn.servers.create({
					:name => name,
					:flavor_id => flavor_id,
					:image_id => image_id,
					:key_name => key_name,
					:security_groups => ['default'],
					:metadata => {'name' => name},
				})

				begin
					Nuri::Util.log "vm[#{name}]: waiting to be ready"
					server.wait_for { ready? }

					info = self.get_info(name)
					if info.state != "ACTIVE"
						Nuri::Util.error "vm[#{name}]: too long waiting VM to become active."
						break
					end
					Nuri::Util.log "vm[#{name}]: active"

					address = info.public_ip_address
					# wait until SSH Server is running
					counter = 120
					while not self.is_port_open?(address, 22) and counter > 0
						sleep 1
						counter -= 1
						info = self.get_info(name)
						address = info.public_ip_address
					end
					Nuri::Util.log "vm[#{name}]: ip=#{address}"

					if not self.is_port_open?(address, 22)
						Nuri::Util.error "Cannot connect to SSH server of: #{name}"
						break
					end
					Nuri::Util.log "vm[#{name}]: ssh-server is running"

					# get self-address
					my_address = self.get_state("$.#{Nuri::Util.whoami?}.address").to_s
					cloud = "#{Nuri::Util.whoami?}.#{@name}"
					
					# create a list of trusted nodes
					config = self.read_config
					trusted = '\"' + params[:master_node] + '\"'
					trusted += ', \"' + my_address + '\"' if my_address.length > 0

					Nuri::Util.log "vm[#{name}]: installing nuri client"
					# install nuri on newly created VM
					dir = Nuri::Util.home_dir + "/modules/#{@name}"
					pub_key_file = File.expand_path(dir + "/#{key_name}.pem")
					script_file = File.expand_path(dir + "/nuri.sh")
					options = "-i #{pub_key_file} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
					remote_command = "'/bin/bash -s \"#{trusted}\" \"#{cloud}\"' < #{script_file}"
					cmd = "/usr/bin/ssh #{options} #{username}@#{address} #{remote_command} 1>/dev/null 2>/dev/null"

					if Nuri::Helper::Command.exec(cmd)
						remote_command = "'/usr/bin/sudo nuri/bin/nuri client start'"
						cmd = "timeout 5 /usr/bin/ssh #{options} #{username}@#{address} #{remote_command} 1>/dev/null 2>/dev/null"
						Nuri::Helper::Command.exec(cmd)

						counter = 30
						while not Nuri::Util.is_nuri_active?(address) and counter > 0
							counter -= 1
							sleep 1
						end
						if not Nuri::Util.is_nuri_active?(address)
							Nuri::Util.error "Cannot start Nuri on the new VM: #{name}"
							break
						end
						Nuri::Util.log "vm[#{name}]: nuri client is active"

						# update system information
						# - include the new VM's address into local system information
						system = Nuri::Util.get_system_information
						system[name] = address
						Nuri::Util.set_system_information(system)
						# broadcast system information
						Nuri::Util.broadcast_system_information

						# send and active the BSig model to the new VM
						bsig_helper = Nuri::BSig::VMHelper.new
						if not bsig_helper.send_bsig(name, address) or
						   not bsig_helper.activate_bsig(name, address)
							Nuri::Util.error "Cannot send and activate BSig model of VM: #{name},#{address}"
							break
						end

					else
						Nuri::Util.error "Cannot install Nuri on the new VM: #{name}"
						break
					end

					success = true
				end while false

				if not success
					Nuri::Util.error "Failed creating VM: #{name}"
					self.delete_vm('vm' => name)
				end

				return [success, JSON.generate({"update_system" => true})]
			end

		end
	end
end

=end