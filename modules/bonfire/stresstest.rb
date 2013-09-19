#!/usr/bin/env ruby

require 'logger'
require 'thread'

module Sfp
	module Module
	end

	module Resource
		attr_reader :state, :model
		def init(model={})
			@state = {}
			@model = model
		end
		def reset
		end
	end
	Agent = Object.new
	def Agent.set_logger(logger)
		@logger = logger
	end
	def Agent.logger
		@logger
	end
end

require File.expand_path('../../../lib/nuri.rb', __FILE__)
require File.expand_path('../bonfire.rb', __FILE__)

def test(p={})
	log = Logger.new(STDOUT)
	log.level = Logger::INFO
	log.info "Site: #{p[:site]}"
	log.info "Total VMs: #{p[:totalvms]}"

	lock = Mutex.new

	model = { 'location' => p[:site],
	          'experiment' => p[:experiment],
	          'gateway' => "ssh.bonfire.grid5000.fr",
	          'image_name' => "BonFIRE Debian Squeeze 10G v5",
	          'wan_name' => "BonFIRE WAN" }

	Sfp::Agent.set_logger log
	bonfire = Sfp::Module::Bonfire.new
	bonfire.init(model)
	bonfire.update_state

	if not bonfire.state['running']
		log.info "site #{p[:site]} is not running!"
		exit! 1
	end

	log.info "Delete VMs (except master) [Wait]"
	total = 0
	bonfire.state['vms'].each { |name,data|
		next if name == 'master'
		lock.synchronize { total += 1 }
		Thread.new {
			log.info "Deleting #{name}: " + (bonfire.delete_vm('vm' => name) ? "[OK]" : "[Failed]")
			lock.synchronize { total -= 1 }
		}
	}

	loop do
		sleep 5
		break if total <= 0
	end

	bonfire.update_state
	if bonfire.state['vms'].length > 1
		log.info "Delete VMs (except master) [Failed]"
		exit! 1
	end

	total = 0
	1.upto(p[:totalvms]) do |i|
		lock.synchronize { total += 1 }
		Thread.new {
			name = "vm#{i}"
			lock.synchronize { total -= 1 }
		}
	end
end

if $0 == __FILE__
	if ARGV.length < 3
		puts 'Usage: stresstest.rb <bonfire-site> <experiment> <total-vms>'
	else
		test(:site => ARGV[0], :experiment => ARGV[1], :totalvms => ARGV[2].to_i)
	end
end
