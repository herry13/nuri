require 'rubygems'
require 'restfully'
require 'restfully/addons/bonfire'

module Sfp::Module::BonfireHelper
	protected
	def open_connection
		return true if not @session.nil?

		begin
			@session = Restfully::Session.new(
				:configuration_file => @home_dir + '/config.yml',
				:gateway => @model['gateway'],
				:keys => @home_dir + '/bonfire.pem',
				:cache => false,
				:logger => Sfp::Agent.logger
			) if @session.nil?

			@experiment = (@session.root.experiments.find { |e|
				e['name'] == @model['experiment'] && e['status'] == 'running'
			} || false) if @experiment.nil? and !@session.nil?

			@location = @session.root.locations[@model['location'].to_sym] if
				@location.nil? and !@session.nil?

			return (!@session.nil? and !@experiment.nil? and !@location.nil?)
		rescue Exception => e
			Sfp::Agent.logger.warn "Cannot open connection! #{e}\n#{e.backtrace.join("\n")}"
		end
		false
	end

	def running?(vm)
		(vm.reload['state'] == 'ACTIVE' || vm.reload['state'] == 'RUNNING' ||
		 vm.reload['state'] == 'up')
	end

	def create_server(p={})
		open_connection

		name = p[:name]
		session = p[:session]
		experiment = p[:experiment]
		location = p[:location]
		image_name = p[:image]
		wan_name = p[:wan]

		session.logger.info "Launching #{name} in #{location['name']}..."
		server = experiment.computes.find { |vm|
			vm['name'] == name
		} || experiment.computes.submit(
			:name => name,
			:instance_type => "small",
			:disk => [{
				:storage => location.storages.find { |s|
					s['name'] == image_name
				},
				:type => "OS"
			}],
			:nic => [
				{:network => location.networks.find { |n| n['name'] == wan_name }}
			],
			:location => location
		)
		server_ip = server['nic'][0]['ip']
		session.logger.info "#{name} IP=#{server_ip}"
	
		experiment.update(:status => "running")

		tries = 30 # 10 minutes
		until [server].all? { |vm|
			tries <= 0 || (running?(vm) && vm.ssh.accessible?)
		} do
			fail "#{name} has failed" if [server].any? { |vm|
				vm['state'] == "FAILED"
			}
			session.logger.info "#{name} is not ready. Waiting..."
			sleep 20
			tries -= 1
		end
		fail "Cannot create #{name}: too long waiting!" if !running?(server)

		server.ssh do |ssh|
			session.logger.info "Setting hostname..."
			output = ssh.exec! "hostname"
			if output.chop != name
				ssh.exec! "/bin/echo #{name} > /etc/hostname"
				ssh.exec! "/etc/init.d/hostname.sh start"
				ssh.exec! "/bin/sed -i 's/#{name}.*/#{name}/g' /etc/hosts"
				ssh.exec! "/bin/echo '127.0.0.1 #{name}' >> /etc/hosts"
			end
		end

		session.logger.info "VMs are now READY!"
		session.logger.info "*** #{server['name']} IP: #{server['nic'][0]['ip']}"

		server
	end

	def install_agent(server)
		begin
			@session.logger.info "Installing agent to #{server['name']}:#{server['nic'][0]['ip']}"
			server.ssh do |ssh|
				ssh.exec! 'apt-get update; apt-get -y install sudo ruby ruby-dev rubygems libz-dev libaugeas-ruby make gcc libxml2-dev libxslt-dev libreadline-dev'
				ssh.exec! 'gem install sfp sfpagent fog restfully restfully-addons --no-ri --no-rdoc'
				ssh.exec! 'ln -sf /var/lib/gems/1.8/bin/sfpagent /usr/local/bin/sfpagent'
				ssh.exec! 'sfpagent -t ; sfpagent -s'
			end
			return true
		rescue Exception => e
			Sfp::Agent.logger.error "Cannot install the agent. #{e}\n#{e.backtrace.join("\n")}"
		end
		false
	end

	def delete_server(p={})
		open_connection
		name = p[:name]
		session = p[:session]
		experiment = p[:experiment]

		server = experiment.computes.find { |vm|
			vm['name'] == name
		} || (return true)
		session.logger.info "Deleting #{name} ..."
		server.delete
		tries = 30
		until [server].all? { |vm|
			tries > 0 && !running?(vm)
		} do
			session.logger.info "#{name} is not deleted. Waiting..."
			sleep 10
			tries -= 1
		end
		!running?(server)
	end

	def get_servers(p={})
		servers = {}
		p[:experiment].computes.find { |server|
			servers[ server['name'] ] = {
				'running' => running?(server),
				'ip' => server['nic'][0]['ip']
			}
			false
		} if p[:experiment]
		servers
	end


=begin
	def self.install_nuri(p={})
		name = p[:name]
		session = p[:session]
		experiment = p[:experiment]
		master = p[:master]

		def self.install(server, session, master)
			server.ssh do |ssh|
				session.logger.info "Installing Nuri..."
	
				ssh.exec! "timeout 5 service nuri stop"
				ssh.exec! "rm -rf /opt/nuri"
	
				ssh.exec! "mkdir -p /opt/nuri"
				ssh.scp.upload!(NURI_INSTALLER, '/opt/nuri/nuri_installer')
				ssh.exec! "/bin/bash /opt/nuri/nuri_installer -silent #{master}"
	
				session.logger.info "Starting Nuri..."
				cmd = "timeout 10 ssh #{server['nic'][0]['ip']} 'service nuri start' 1>/dev/null 2>/dev/null"
				system(cmd)
				#ssh.exec! "timeout 10 service nuri start"
	
				session.logger.info "Checking Nuri..."
				output = ssh.exec! "service nuri status"
				if (output =~ /.*running.*/)
					session.logger.info "Nuri client is running in #{server['name']}!"
					return true
				else
					session.logger.info "Nuri client is not running in #{server['name']}!"
					return false
				end
			end
		end

		server = experiment.computes.find { |vm|
			vm['name'] == name
		} || (fail "#{name} is not exist!")

		tries = 5
		until tries <= 0 || install(server, session, master) do
			sleep 5
		end

		(tries > 0)
	end
=end

end
