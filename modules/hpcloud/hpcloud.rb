require 'rubygems'
require 'thread'
require 'json'
require 'fog'
require 'yaml'

class Sfp::Module::HPCloud
	include Sfp::Resource

	def initialize
		@conn = nil
	end

	def update_state
		to_model
		begin
			@state['vms'] = get_vms
			@state['running'] = true
		rescue Exception => exp
			@state['vms'] = {}
			@state['running'] = false

			Sfp::Agent.logger.info "#{exp}\n#{exp.backtrace.join("\n")}"
		end
	end

	def create_vm(p={})
		helper_create_vm(p)
	end

	def delete_vm(p={})
		helper_delete_vm(p)
	end

	protected
	def open_connection
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
			Sfp::Agent.logger.error "#{exp}\n" + exp.backtrace.join("\n")
			@conn = nil
		end
		return !!@conn
	end

	def read_config
		config_file = ::File.expand_path(::File.dirname(__FILE__)) + "/config.yml"
		return {} if not ::File.exist?(config_file)
		return YAML.load_file(config_file)
	end

	def get_info(name)
		return nil if not self.open_connection
		vms = @conn.vms
		vms.each { |s| return s if s.name == name }
		nil
	end

	def get_vms
		return {} if not self.open_connection
		vms = {}
		@conn.servers.each { |s|
			vms[s.name] = {}
			vms[s.name]['running'] = s.ready?
			vms[s.name]['ip'] = s.public_ip_address
		}
		vms
	end

	# Sleep time in waiting a task to be finished - default: 5s
	SleepTime = 5
	# Number of tries in waiting a task to be finished - default: 120 (10 minutes)
	Tries = 600 / SleepTime

	def helper_delete_vm(params={})
		return false if not self.open_connection

		name = params['vm'].sub(/^\$\./, '')
		vms = get_vms
		return true if !vms.has_key?(name)

		# delete if VM with given name exists
		@conn.servers.each { |s|
			if s.name == name
				@conn.delete_server(s.id)
				break
			end
		}

		# wait until the VM is completely deleted
		tries = Tries
		deleted = false
		while not deleted and tries > 0
			begin
				vms = self.get_vms
				deleted = !vms.has_key?(name)
				break if deleted
			rescue
			end
			Sfp::Agent.logger.info "VM:#{name} has been deleted."
			tries -= 1
			sleep SleepTime
		end

		deleted
	end

	def helper_create_vm(params={})
		return false if not self.open_connection

		name = params['vm'].sub(/^\$\./, '')
		Sfp::Agent.logger.info "Creating VM #{name} [WAIT]"

		vms = get_vms
		if vms.has_key?(name)
			Sfp::Agent.logger.info "Creating VM #{name} [OK]"
			return true
		end

		created = false
		begin
			vm = @conn.servers.create({
				:name => name,
				:flavor_id => @model['flavor_id'],
				:image_id => @model['image_id'],
				:key_name => @model['key_name'],
				:security_groups => [@model['security_group']],
				:metadata => {'name' => name},
			})
			vm.username = 'ubuntu'
			vm.private_key_path = File.join(File.dirname(__FILE__), 'hpcloud.pem')

			vm.wait_for { ready? and sshable? }

			created = (vm.ready? and vm.sshable? and helper_install_agent(vm, name))

		rescue Exception => exp
			Sfp::Agent.logger.info "#{exp}\n#{exp.backtrace.join("\n")}"
		end

		Sfp::Agent.logger.info "Creating VM #{name} " + (created ? "[OK]" : "[FAILED]")
		helper_delete_vm(params) if not created

		created
	end

	def helper_install_agent(vm, name)
		Sfp::Agent.logger.info "Installing agent in VM #{name} [WAIT]"
		result = vm.ssh(['sudo apt-get update',
		                 'sudo apt-get -y install sudo ruby1.9.1 ruby1.9.1-dev libz-dev libaugeas-ruby1.9.1 make gcc libxml2-dev libxslt-dev libreadline-dev',
		                 'sudo gem install sfp sfpagent fog restfully restfully-addons --no-ri --no-rdoc',
		                 'sudo sfpagent -t',
		                 'sudo sfpagent -s'])
		Sfp::Agent.logger.info "Installing agent in VM #{name} " + (result ? "[OK]" : "[FAILED]")
		result
	end
end

