#!/usr/bin/env ruby

require 'rubygems'
require 'restfully'
require 'restfully/addons/bonfire'

module Nuri

module Module

module BonfireHelper
	NURI_INSTALLER = "agent-installer.sh"

	def self.running?(vm)
		(vm.reload['state'] == 'ACTIVE' || vm.reload['state'] == 'RUNNING' ||
		vm.reload['state'] == 'up')
	end

	def self.create_server(p={})
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
			tries > 0 && running?(vm) && vm.ssh.accessible?
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

	def self.delete_server(p={})
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
		running?(server)
	end

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
end

end

end
