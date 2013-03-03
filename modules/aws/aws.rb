require 'rubygems'
require 'fog'
require 'sshkey'

module Nuri
	module Module
		class AWS
			include Nuri::Resource

			attr_accessor :auth_uri

			def initialize(options={})
				# registering the component
				self.register('Cloud', 'aws')
			end

			def update_state
				self.reset
				config = self.read_config
				# set cloud name
				@state['description'] = (config.has_key?('description') ? config['description'] : '')

				# check running status
				@state['running'] = self.open_connection

				@state['vms'] = {}
				self.get_vms.each_key { |name| @state['vms'][name] = true }
			end

			def open_connection
				begin
					config = self.read_config
					@conn = Fog::Compute.new({
						:provider => 'AWS',
						:aws_access_key_id => config['access_key_id'],
						:aws_secret_access_key => config['secret_access_key'],
						:region => config['region'],
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
					server = get_vm_by_name(name)
					return server.public_ip_address if not server.nil?
				end
				nil
			end

			def get_vms(params={})
				data = {}
				self.open_connection if @conn.nil?
				return data if @conn.nil?
				@conn.servers.each { |s|
					next if not s.ready?
					data[s.tags['Name']] = s.public_ip_address
				}
				data
			end

			def get_info(name)
				self.open_connection if @conn.nil?
				return nil if @conn.nil?
				return get_vm_by_name(name)
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
	
puts 'test1'
					# return true if there is a VM with given name
					@conn.servers.each { |s| return true if s.ready? and s.tags['Name'] == name }
puts 'test2'
	
					config = self.read_config
					flavor_id = config['default_flavor_id']
					image_id = config['default_image_id']
					key_name = config['default_key_name']
					username = config['default_username']
	
					# create VM
					Nuri::Util.log "vm[#{name}]: creating"
					new_server = @conn.servers.create({
						:name => name,
						:flavor_id => flavor_id,
						:image_id => image_id,
						:key_name => key_name,
						:tags => {"Name" => name},
					})

					Nuri::Util.log "vm[#{name}]: waiting to be ready"
					new_server.wait_for { ready? }
	
					Nuri::Util.log "vm[#{name}]: active"
					info = self.get_info(name)	
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
					if my_address != config['master'] and my_address.length > 0
						trusted += ', \"' + my_address + '\"'
					end

					Nuri::Util.log "vm[#{name}]: installing nuri client"
					# install nuri on newly created VM
					dir = Nuri::Util.home_dir + "/modules/#{@name}"
					key_file = File.expand_path("~/.ssh/#{key_name}")
					script_file = dir + "/nuri.sh"
					options = "-i #{key_file} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
					remote_command = "'/usr/bin/sudo /bin/bash -s \"#{trusted}\" \"#{cloud}\" \"#{name}\"' < #{script_file}"
					ssh_cmd = "/usr/bin/ssh #{options} #{username}@#{address}"
					cmd = "#{ssh_cmd} #{remote_command} 1>/dev/null 2>/dev/null"

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
						Nuri::Util.error "Failed to install/start Nuri on the new VM: #{name}"
						#self.delete_vm('vm' => name)
					else
						return true
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

				server = get_vm_by_name(name)

				# delete if VM with given name exists
				if not server.nil?
					server.destroy
					server.wait_for { not server.ready? }
				end

				# update system information
				system = Nuri::Util.get_system_information
				system[name] = nil
				Nuri::Util.set_system_information(system)
				# broadcast system information
				Nuri::Util.broadcast_system_information

				return true
			end

			protected
			def get_vm_by_name(name)
				self.open_connection if @conn.nil?
				if not @conn.nil?
					@conn.servers.each { |s| return s if s.ready? and s.tags['Name'] == name }
				end
				nil
			end
		end
	end
end
