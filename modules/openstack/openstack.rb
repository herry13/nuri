require 'rubygems'
require 'thread'
require 'json'
require 'fog'
require 'yaml'
require 'net/ssh'

##############################
#
# Order of config file for credentials:
# 1) <HOME_DIRECTORY>/.hpcloud
# 2) <MODULE_DIRECTORY>/config.yml
#
#
# Order of SSH key file
# 1) <HOME_DIRECTORY>/.ssh/<KEY_PAIR_NAME>.pem
# 2) <HOME_DIRECTORY>/.ssh/<KEY_PAIR_NAME>
# 3) <MODULE_DIRECTORY>/<KEY_PAIR_NAME>.pem
# 4) <MODULE_DIRECTORY>/<KEY_PAIR_NAME>
# 5) <MODULE_DIRECTORY>/hpcloud.pem
#
##############################

class Sfp::Module::OpenStack
	include Sfp::Resource

	### Sleep time in waiting a task to be finished - default: 5s
	SleepTime = 5

	### Number of tries in waiting a task to be finished - default: 120 (10 minutes)
	Tries = 600 / SleepTime

	def initialize
		@conn = nil
	end

	def update_state
		to_model

		@state['running'] = running?
		@state['vms'] = get_vms

	end

	##############################
	#
	# Action methods (see hpcloud.sfp and cloud.sfp)
	#
	##############################

	def create_vm(params={})
		return false if not self.running?

		### determine VM's name
		name = params['vm'].sub(/^\$\./, '')

		log.info "Creating VM #{name} [WAIT]"

		### check if VM is already exist
		if get_vms.has_key?(name)
			log.info "VM #{name} is already exist - Creating VM #{name} [OK]"
			return true
		end

		### get VM model from cache
		vm_model = resolve_model(params['vm'])

		### determine VM parameters
		flavor =  (vm_model['flavor'].to_s.length > 0 ? vm_model['flavor'].to_s : @model['vm_flavor'])
		image = (vm_model['image'].to_s.length > 0 ? vm_model['image'].to_s : @model['vm_image'])
		security_group = (vm_model['security_group'].to_s.length > 0 ? vm_model['security_group'].to_s : @model['vm_security_group'])
		ssh_key_name = (vm_model['ssh_key_name'].to_s.length > 0 ? vm_model['ssh_key_name'].to_s : @model['vm_ssh_key_name'])
		ssh_key_file = self.ssh_key_file(ssh_key_name)
		ssh_user = (vm_model['ssh_user'].to_s.length > 0 ? vm_model['ssh_user'].to_s : @model['vm_ssh_user'].to_s)

		### set network
		networks = vm_model['networks'].keys.select! { |k| k[0] != '_' }
		networks = Array(@model['vm_network']) if networks.length <= 0 and @model['vm_network'].strip.length > 0
		nets = get_networks
		networks.map! { |net| {'net_id' => nets[net]['id']} }

		### check SSH key file
		if ssh_key_file.nil?
			log.info "SSH key file '#{ssh_key_file}' is not available! #{ssh_key_name} - Creating VM #{name} [Failed]"
			return false
		end
		log.info "#{name}:VM - SSH user: #{ssh_user}, SSH key file: #{ssh_key_file}"

		spec = {
				:name => name,
				:flavor_ref => flavor,
				:image_ref => image,
				:key_name => ssh_key_name,
				:security_groups => [security_group],
				:metadata => {'name' => name},
			}
		spec['nics'] = networks if networks.length > 0

		log.info "#{name}:VM - #{spec.inspect}"

		### if not exist, then create the VM
		created = false
		begin
			### submit create VM request
			vm = @conn.servers.create(spec)
			log.info "#{name}:VM - spec has been submitted"

			### set SSH config
			vm.username = ssh_user # 'ubuntu'
			vm.private_key_path = ssh_key_file

			log.info "#{name}:VM - ready [Wait]"
			### wait until SSH is enabled
			vm.wait_for { ready? }
			log.info "#{name}:VM - ready [OK]"

			log.info "#{name}:VM - sshable [Wait]"
			### wait until SSH is sshable
			ip = nil
			vm.wait_for {
				#vm.sshable? ### this does not work (fog's bug?)
				ip = vm.addresses['default'].first['addr'].to_s if
					vm.addresses['default'].is_a?(Array) and vm.addresses['default'].length > 0
				if ip.length > 0
					port = 22
					begin
						Timeout::timeout(1) do
						begin
							s = TCPSocket.new(ip, port)
							s.close
							true
							rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
								false
							end
						end
					rescue Timeout::Error
						false
					end
				else
					false
				end
			}
			log.info "#{name}:VM - sshable, ip: #{ip} [OK]"

			### install sfpagent
			created = install_agent(vm, name, ssh_key_file, ssh_user, ip)

		rescue Exception => exp
			log.info "#{exp}\n#{exp.backtrace.join("\n")}"
		end

		if not created
			log.error "Creating VM #{name} [Failed]"

			### delete if any error occured
			delete_vm(params)
		else
			log.info "Creating VM #{name} [OK]"
		end

		created
	end

	def delete_vm(params={})
		return false if not self.running?

		### determine VM's name
		name = params['vm'].sub(/^\$\./, '')

		### check if VM is not exist
		return true if !get_vms.has_key?(name)

		### delete if VM with given name exists
		@conn.servers.each { |s|
			if s.name == name
				@conn.delete_server(s.id)
				break
			end
		}

		### wait until the VM is completely deleted
		tries = Tries
		deleted = false
		while not deleted and tries > 0
			begin
				deleted = !get_vms.has_key?(name)
				break if deleted
			rescue
			end
			log.info "VM:#{name} has been deleted."
			tries -= 1
			sleep SleepTime
		end

		deleted
	end

	def is_port_open?(ip, port)
		begin
			Timeout::timeout(1) do
				begin
					s = TCPSocket.new(ip, port)
					s.close
					true
				rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
					false
				end
			end
		rescue Timeout::Error
			false
		end
	end

	##############################
	#
	# Helper methods
	#
	##############################

	protected
	def config_file
		return Dir.home + '/.openstack' if ::File.exist?(Dir.home + '/.openstack')
		::File.dirname(__FILE__) + '/config.yml'
	end

	def read_config
		return {} if not ::File.exist?(config_file)
		return YAML.load_file(config_file)
	end

	def ssh_key_file(key_name)
		file = Dir.home + '/.ssh/' + key_name + '.pem'
		return file if ::File.exist?(file)

		file = Dir.home + '/.ssh/' + key_name
		return file if ::File.exist?(file)

		file = File.dirname(__FILE__) + '/' + key_name + '.pem'
		return file if ::File.exist?(file)

		file = File.dirname(__FILE__) + '/' + key_name
		return file if ::File.exist?(file)

		file = File.dirname(__FILE__) + '/hpcloud.pem'
		return file if ::File.exist?(file)

		nil
	end

	def running?
		return true if not @conn.nil?
		begin
			config = self.read_config
			credential = {
				:provider           => :openstack,
				:openstack_username => config['username'],
				:openstack_api_key  => config['password'],
				:openstack_auth_url => @model['auth_uri'],
				:openstack_tenant   => config['tenant_id'],
			}
			@conn = Fog::Compute.new(credential)
			@network = Fog::Network.new(credential)

		rescue Exception => exp
			log.error "#{exp}\n#{exp.backtrace.join("\n")}"
			@conn = nil
		end
		return !!@conn
	end

	def get_vms
		return {} if not running?
		vms = {}
		@conn.servers.each { |s|
			spec = {
				'running' => s.ready?,
				'ip' => s.public_ip_address.to_s,
			}
			spec['ip'] = s.addresses['default'].first['addr'] if
				spec['ip'].length <= 0 and s.addresses['default'].is_a?(Array) and s.addresses['default'].length > 0
			vms[s.name] = spec
		}
		vms
	end

	def get_networks
		nets = {}
		@network.networks.each do |net|
			nets[net.name] = {
				'status' => net.status.downcase,
				'id' => net.id
			}
		end
		nets
	end	

	def install_agent(vm, name, ssh_key_file=nil, ssh_user="ubuntu", ip=nil)
		ip = vm.public_ip_address if ip.nil?

		log.info "Installing agent on #{name}:VM, ip=#{ip} [Wait]"

		begin
			Net::SSH.start(ip, ssh_user, :keys => [ssh_key_file]) do |ssh|
				if ssh.exec!('which sfpagent').strip.length <= 0
					### install sfpagent
					ssh.exec! 'apt-get update && ' +
						'apt-get -y install sudo ruby1.9.1 ruby1.9.1-dev libz-dev libaugeas-ruby1.9.1 && ' +
						'gem install sfp sfpagent net-ssh --no-ri --no-rdoc'
					ssh.exec! 'sfpagent -t'
				end
				ssh.exec! 'sfpagent -s'
				ssh.exec! "echo '#{path}' > /var/sfpagent/vm.in_cloud"

				if ssh.exec!("hostname").strip != name
					ssh.exec! "/bin/echo '#{name}' > /etc/hostname"
					ssh.exec! "service hostname start; service hostname.sh start"
					ssh.exec! "/bin/sed -i 's/#{name}.*/#{name}/g' /etc/hosts"
					ssh.exec! "/bin/echo '#{ip} #{name}' >> /etc/hosts"
				end
			end
			log.info "Installing agent on #{name}:VM, ip=#{ip} [OK]"
			true
		rescue Exception => exp
			log.error "Installing agent on #{name}:VM, ip=#{ip} [Failed] - #{exp}\n#{exp.backtrace.join("\n")}"
			false
		end
	end
end

