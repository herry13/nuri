require 'rubygems'
require 'thread'
require 'json'
require 'fog'
require 'yaml'

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
		ssh_key_name = (vm_model['ssh_key_name'].to_s.length > 0 ? vm_model['ssh_key_name'].to_s : @model['vm_ssh_key_name'])
		ssh_key_file = self.ssh_key_file(ssh_key_name)

		### check SSH key file
		if ssh_key_file.nil?
			log.info "SSH key file '#{ssh_key_file}' is not available! #{ssh_key_name} - Creating VM #{name} [Failed]"
			return false
		end

		### if not exist, then create the VM
		created = false
		begin
			### submit create VM request
			vm = @conn.servers.create({
				:name => name,
				:flavor_id => flavor,
				:image_id => image,
				:key_name => ssh_key_name,
				:security_groups => [security_group],
				:metadata => {'name' => name},
			})

			### set SSH config
			vm.username = 'ubuntu'
			vm.private_key_path = ssh_key_file

			### wait until SSH is enabled
			vm.wait_for { ready? and sshable? }

			### install sfpagent
			created = (vm.ready? and vm.sshable? and install_agent(vm, name, ssh_key_file))

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
			@conn = Fog::Compute.new({
				:provider => "HP",
				:hp_tenant_id => config['tenant_id'],
				:hp_access_key => config['access_key'],
				:hp_secret_key => config['secret_key'],
				:hp_auth_uri => @model['auth_uri'],
				:hp_avl_zone => @model['zone']
			})
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
			vms[s.name] = {}
			vms[s.name]['running'] = s.ready?
			vms[s.name]['ip'] = s.public_ip_address
		}
		vms
	end

	def install_agent(vm, name, ssh_key_file=nil)
		log.info "Installing agent in VM #{name} [WAIT]"

		result = vm.ssh(['sudo apt-get update',
		                 'sudo apt-get -y install sudo ruby1.9.1 ruby1.9.1-dev libz-dev libaugeas-ruby1.9.1 make gcc libxml2-dev libxslt-dev libreadline-dev',
		                 'sudo gem install sfp sfpagent fog --no-ri --no-rdoc && sudo sfpagent -s'])
		vm.ssh('sudo /usr/local/bin/sfpagent -s')

		if !result
			log.error "Installing agent in VM #{name} [Failed]"
		else
			log.info "Installing agent in VM #{name} [OK]"
		end

		result
	end
end

