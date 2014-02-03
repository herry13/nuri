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

class Sfp::Module::HPCloud
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

log.info conn.addresses.inspect
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

		### populate VM parameters
		vm_model = resolve_model(params['vm'])
		flavor = (vm_model['flavor'].to_s.length > 0 ? vm_model['flavor'].to_s : @model['vm_flavor'])
		image = (vm_model['image'].to_s.length > 0 ? vm_model['image'].to_s : @model['vm_image'])
		security_group = (vm_model['security_group'].to_s.length > 0 ? vm_model['security_group'].to_s : @model['vm_security_group'])
		ssh_user = (vm_model['ssh_user'].to_s.length > 0 ? vm_model['ssh_user'].to_s : @model['vm_ssh_user'])
		ssh_key_name = (vm_model['ssh_key_name'].to_s.length > 0 ? vm_model['ssh_key_name'].to_s : @model['vm_ssh_key_name'])
		ssh_key_file = self.ssh_key_file(ssh_key_name)

		### get network
		networks = vm_model['networks'].keys.select! { |k| k[0] != '_' }
		networks = Array(@model['vm_network']) if networks.length <= 0 and @model['vm_network'].strip.length > 0
		avail_nets = get_networks
		networks.map! { |net| {'net_id' => nets[net]['id'] } }

		### check SSH key file
		if ssh_key_file.nil?
			log.info "SSH key file '#{ssh_key_file}' is not available! #{ssh_key_name} - Creating VM #{name} [Failed]"
			return false
		end
		log.info "#{name}:VM - ssh user: #{ssh_user}, key file: #{ssh_key_file}"

		### if not exist, then create the VM
		created = false
		begin
			### submit create VM request
			spec = {
				:name => name,
				:flavor_id => flavor,
				:image_id => image,
				:key_name => ssh_key_name,
				:security_groups => [security_group],
				:metadata => {'name' => name},
			}
			spec['nics'] = networks if networks.length > 0
			log.info "#{name}:VM - spec=#{JSON.generate(spec)}"

			vm = @conn.servers.create(spec)
			log.info "#{name}:VM - spec has been submitted"

			### set SSH config
			vm.username = ssh_user
			vm.private_key_path = ssh_key_file

			### wait until VM is ready
			vm.wait_for { ready? }
			raise Exception "#{name}:VM is never ready (timeout)" if not vm.ready?
			log.info "#{name}:VM is ready"

			vms = get_vms
			if vms.has_key?(name)
				vm.ssh_ip_address = vms[name]['ip'] if vm.public_ip_address.to_s.length <= 0

				### wait until SSH is enabled
				vm.wait_for { sshable? }
				raise Exception "#{name}:VM is never sshable (timeout)" if not vm.sshable?
				log.info "#{name}:VM is sshable at #{vm.ssh_ip_address}"

				### install sfpagent
				created = install_agent(vm, name)
			end

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


	def get_flavors(params={})
		return {} if not running?
		flavors = {}
		begin
			@conn.flavors.each { |f| flavors[f.name] = f.id }
		rescue Exception => exp
			log.error exp.to_s
		end
		log.info YAML.dump(flavors)
		flavors
	end

	def get_images(params={})
		return {} if not running?
		images = {}
		begin
			@conn.images.each { |im| images[im.name] = im.id }
		rescue Exception => exp
			log.error exp.to_s
		end
		log.info YAML.dump(images)
		images
	end

	def get_key_pairs(params={})
		key_pairs = {}
		if running?
			begin
				@conn.key_pairs.each { |key| key_pairs[key.name] = key.public_key }
			rescue Exception => exp
				log.error exp.to_s
			end
		end
		log.info YAML.dump(key_pairs)
		key_pairs
	end

	##############################
	#
	# Helper methods
	#
	##############################

	protected
	def config_file
		return Dir.home + '/.hpcloud' if ::File.exist?(Dir.home + '/.hpcloud')
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
			credentials = {
				:provider => "HP",
				:version => :v2,
				:hp_tenant_id => config['tenant_id'],
				:hp_access_key => config['access_key'],
				:hp_secret_key => config['secret_key'],
				:hp_auth_uri => @model['auth_uri'],
				:hp_avl_zone => @model['zone']
			}
			@conn = Fog::Compute.new(credentials)
			@network = Fog::Network.new(credentials)
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
			vms[s.name] = {
				'running' => s.ready?,
				'ip' => s.public_ip_address
			}
			if s.public_ip_address.to_s.length <= 0
				s.addresses.each do |name,network|
					if network.length > 0
						vms[s.name]['ip'] = network.first['addr']
						break
					end
				end
			end
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

	def install_agent(vm, name)
		log.info "Installing agent in VM #{name} [WAIT]"

		result = vm.ssh(['sudo apt-get update',
		                 'sudo apt-get -y install sudo ruby1.9.1 ruby1.9.1-dev libz-dev libaugeas-ruby1.9.1 make gcc libxml2-dev libxslt-dev libreadline-dev',
		                 'sudo gem install sfp sfpagent fog --no-ri --no-rdoc && sudo sfpagent -s'])

		if result
			Net::SSH.start(vm.public_ip_address, vm.username, :keys => [vm.private_key_path]) do |ssh|
				log.info ssh.exec!('sudo sfpagent -s')
				result = (ssh.exec!('sudo sfpagent -a') =~ /Agent is running/)
			end
		end

		if !result
			log.error "Installing agent in VM #{name} [Failed]"
		else
			log.info "Installing agent in VM #{name} [OK]"
		end

		result
	end
end

