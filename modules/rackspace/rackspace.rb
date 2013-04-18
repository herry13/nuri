require 'rubygems'
require 'fog'
require 'sshkey'

module Nuri
	module Module
		class Rackspace
			include Nuri::Resource

			attr_accessor :auth_uri

			def initialize(options={})
				# registering the component
				self.register('Cloud', 'rackspace')
			end

			def update_state
				self.reset
				config = self.read_config
				# set cloud name
				@state['description'] = (config.has_key?('description') ? config['description'] : '')

				# check running status
				if not config['auth_url'].nil?
					begin
						url = URI.parse(config['auth_url'])
						@state['running'] = self.is_port_open?(url.host, url.port)
					rescue Exception => exp
						Nuri::Util.log "#{@name} update state error: " + exp.to_s
					end
				end

				@state['vms'] = {}
				self.get_vms.each_key { |name| @state['vms'][name] = true }
			end

			def open_connection
				begin
					config = self.read_config
					@conn = Fog::Compute.new({
						:provider => 'Rackspace',
						:rackspace_api_key => config['api_key'],
						:rackspace_username => config['username'],
						:rackspace_auth_url => config['auth_url'],
						:rackspace_endpoint => config['endpoint_url'],
						:version => :v2,
					})
				rescue Exception => exp
					Nuri::Util.warn "Cannot open connection to cloud's end point: #{@name}"
					@conn = nil
					return false
				end
				return true
			end

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
			def create_vm(params={})
				begin
					self.open_connection if @conn.nil?
					return false if @conn.nil?

					# get VM's name	
					name = params['vm']
					name = name[2, name.length-2] if name[0,2] == '$.'
	
					# return true if there is a VM with given name
					@conn.servers.each { |s| return true if s.name == name }
	
					config = self.read_config
					flavor_id = config['default_flavor_id']
					image_id = config['default_image_id']
					key_name = config['default_key_name']
					key_path = File.expand_path("~/.ssh/#{key_name}")
					username = config['default_username']
	
					ssh_key = SSHKey.new(File.read(key_path), :comment => "")
	
					# create VM
					Nuri::Util.log "vm[#{name}]: creating"
					new_server = @conn.servers.bootstrap({
						:name => name,
						:flavor_id => flavor_id,
						:image_id => image_id,
						:public_key => ssh_key.ssh_public_key,
						:private_key => ssh_key.private_key,
					})
					#:metadata => {'name' => name},
					if not new_server.nil?
						Nuri::Util.log "vm[#{name}]: waiting to be ready"
						new_server.wait_for { ready? }
	
						Nuri::Util.log "vm[#{name}]: it is ready now"
	
						# wait until the new VM "ACTIVE"
						counter = 120
						info = self.get_info(name)
						while info.state != "ACTIVE" and counter > 0
							counter -= 1
							sleep 1
							info = self.get_info(name)
						end
	
						if info.state != "ACTIVE"
							Nuri::Util.error "vm[#{name}]: too long waiting VM to become active."
							self.delete_vm('vm' => name)
							return false
						end
						Nuri::Util.log "vm[#{name}]: active"
	
						address = info.public_ip_address
						# wait until SSH Server is running
						counter = 120
						while not self.is_port_open?(address, 22) and counter > 0
							sleep 1
							counter -= 1
						end
						Nuri::Util.log "vm[#{name}]: ip=#{address}"
	
						if not self.is_port_open?(address, 22)
							Nuri::Util.error "Cannot connect to SSH server of: #{name}"
							self.delete_vm('vm' => name)
							return false
						end
						Nuri::Util.log "vm[#{name}]: ssh-server is running"
	
						# get self-address
						my_address = self.get_state("$.#{Nuri::Util.whoami?}.address").to_s
						cloud = "#{Nuri::Util.whoami?}.#{@name}"
						
						# create a list of trusted nodes
						config = self.read_config
						trusted = '\"' + config['master'] + '\"'
						trusted += ', \"' + my_address + '\"' if my_address.length > 0
	
						Nuri::Util.log "vm[#{name}]: installing nuri client"
						# install nuri on newly created VM
						dir = Nuri::Util.home_dir + "/modules/#{@name}"
						#pub_key_file = dir + "/" + key_name + ".pem"
						key_file = key_path
						script_file = dir + "/nuri.sh"
						options = "-i #{key_file} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
						remote_command = "'/bin/bash -s \"#{trusted}\" \"#{cloud}\"' < #{script_file}"
						cmd = "/usr/bin/ssh #{options} #{username}@#{address} #{remote_command} 1>/dev/null 2>/dev/null"
	
						if Nuri::Helper::Command.exec(cmd)
							remote_command = "'/usr/bin/sudo nuri/bin/nuri client start'"
							cmd = "timeout 5 /usr/bin/ssh #{options} #{username}@#{address} #{remote_command} 1>/dev/null 2>/dev/null"
							Nuri::Helper::Command.exec(cmd)
							succeed = Nuri::Util.is_nuri_active?(address)
							counter = 30
							while not succeed and counter > 0
								counter -= 1
								sleep 1
								succeed = Nuri::Util.is_nuri_active?(address)
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
								succeed = false
							end
	
						else
							Nuri::Util.error "Cannot install Nuri on the new VM: #{name}"
							succeed = false
						end
	
						if not succeed
							Nuri::Util.error "Cannot start Nuri on the new VM: #{name}"
							self.delete_vm('vm' => name)
						else
							return true
						end
					else
						Nuri::Util.error "Cannot create VM: #{name}"
						self.delete_vm('vm' => name)
					end
	
				rescue Exception => exp
					Nuri::Util.error "Cannot create VM: #{name}"
					self.delete_vm('vm' => name)
				end

				false
			end

			# SFP method
			def delete_vm(params={})
				self.open_connection if @conn.nil?
				return false if @conn.nil?

				name = params['vm']
				name = name[2, name.length-2] if name[0,2] == '$.'

				server = nil
				@conn.servers.each { |s|
					if s.name == name
						server = s
						break
					end
				}

				# delete if VM with given name exists
				if not server.nil?
					@conn.delete_server(server.id)
					begin
						server.wait_for { not ready? }
					rescue
					end
=begin
					# wait until the VM is completely deleted
					counter = 120
					info = self.get_info(name)
					while not info.nil? and counter > 0
						counter -= 1
						sleep 1
						info = self.get_info(name)
					end
					break
=end
				end

				# update system information
				system = Nuri::Util.get_system_information
				system[name] = nil
				Nuri::Util.set_system_information(system)
				# broadcast system information
				Nuri::Util.broadcast_system_information

				return true
			end
		end
	end
end