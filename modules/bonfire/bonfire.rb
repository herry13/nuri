#!/usr/bin/env ruby

require 'rubygems'
require 'restfully'
require 'restfully/addons/bonfire'

require File.expand_path(File.dirname(__FILE__) + '/helper')

module Nuri
module Module

class Bonfire
	CONFIG_FILE = File.expand_path(File.dirname(__FILE__) + '/config.yml')
	SSH_KEY = "~/.ssh/id_rsa"
	GATEWAY = "ssh.bonfire.grid5000.fr"
	EXPERIMENT = "autocloud"
	LOCATION = "uk-epcc"
	IMAGE_NAME = "BonFIRE Debian Squeeze 10G v5"
	WAN_NAME = "BonFIRE WAN"
	NURI_MASTER_ADDR = "master"

	include Nuri::Resource

	def initialize(options={})
		self.register("Bonfire", "bonfire")
		@session = @experiment = @location = nil
	end

	def update_state
		self.reset

		@state['running'] = open_connection
		@state['vms'] = {}
		self.get_vms.each_key { |name| @state['vms'][name] = true }
	end

	def open_connection
		return true if !@session.nil? and !@experiment.nil? and
			!@location.nil?

		return false if !File.exists?(CONFIG_FILE)

		begin
			logger = Logger.new(STDOUT)
			logger.level = Logger::INFO

			@session = Restfully::Session.new(
				:configuration_file => CONFIG_FILE,
				:gateway => GATEWAY,
				:keys => [SSH_KEY],
				:cache => false,
				:logger => logger,
			)

			@experiment = @session.root.experiments.find { |e|
				e['name'] == EXPERIMENT && e['status'] == "running"
			} || (fail "Experiment #{EXPERIMENT} is not exist!")
			@experiment.update(:status => 'running')

			@location = @session.root.locations[:"#{LOCATION}"]
			fail "Can't select the uk-epcc location" if @location.nil?

		rescue Exception => e
			@session = @experiment = @location = nil
			@session.logger.warn "#{e}"
			@session.logger.warn "#{e.backtrace}"
			return false
		end
		true
	end

	def get_vm_address(p={})
		return nil if !open_connection
		server = @experiment.computes.find { |vm|
			vm['name'] == p['name'].to_s
		}
		server['nic'][0]['ip'] if server
		nil
	end

	def get_vms(p={})
		return {} if !open_connection
		vms = {}
		@experiment.computes.find { |vm|
			vms[ vm['name'] ] = vm['nic'][0]['ip']
			false
		}
		vms
	end

	def create_vm(p={})
		return false if !open_connection

		name = p['vm']
		name = name[2, name.length-2] if name[0,2] == '$.'

		begin
			Nuri::Module::BonfireHelper.create_server({
				:name => name,
				:session => @session,
				:experiment => @experiment,
				:location => @location,
				:image => IMAGE_NAME,
				:wan => WAN_NAME,
			})
			Nuri::Module::BonfireHelper.install_nuri({
				:name => name,
				:session => @session,
				:experiment => @experiment,
				:master => NURI_MASTER_ADDR,
			})
		rescue Exception => e
			self.delete_vm(p)
			return false
		end
		true
	end

	def delete_vm(p={})
		return false if !open_connection

		name = p['vm']
		name = name[2, name.length-2] if name[0,2] == '$.'

		begin
			return Nuri::Module::BonfireHelper.delete_server({
				:name => name,
				:session => @session,
				:experiment => @experiment,
			})
		rescue Exception => e
		end
		return false
	end
end

end
end

# Test Unit
#b = Nuri::Module::Bonfire.new
#puts b.get_vms
#b.create_vm({'vm' => 'vm1'})
#b.delete_vm({'vm' => 'master'})
