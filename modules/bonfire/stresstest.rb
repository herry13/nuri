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

def do_test(p={})
	log = (p[:logger] ? p[:logger] : Logger.new(STDOUT))
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
		return
	end

	log.info "Creating #{p[:totalvms]} VMs [Wait]"
	start_time = Time.now
	total = 0
	1.upto(p[:totalvms]) do |i|
		lock.synchronize { total += 1 }
		Thread.new {
			begin
				name = "vm#{i}"
				status = bonfire.create_server({
					:name => name,
					:image => model['image_name'],
					:wan => model['wan_name']
				})
				#status = bonfire.create_vm('vm' => name)
				log.info "Creating #{name}: " + (status ? "[OK]" : "[Failed]")
			rescue Exception => exp
				log.error "#{exp}\n#{exp.backtrace.join("\n")}"
				log.info "Creating #{name}: [Failed]"
			end
			lock.synchronize { total -= 1 }
		}
	end

	loop do
		sleep 1
		break if total <= 0
	end
	end_time = Time.now

	log.info "Creating #{p[:totalvms]} VMs [OK]"
	log.info "time=#{end_time-start_time} site=#{p[:site]} vms=#{p[:totalvms]}"

	loop do
		sleep 30 if p[:totalvms] > 0
	
		# Deleting VMs
		start_time = Time.new
		log.info "Deleting VMs (except master) [Wait]"
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
			sleep 1
			break if total <= 0
		end
		end_time = Time.new
	
		bonfire.update_state
		if bonfire.state['vms'].length > 1
			log.info "Deleting VMs (except master) [Failed]"
		else
			log.info "Deleting VMs (except master): #{end_time - start_time} [OK]"
			break
		end
	end
end

if $0 == __FILE__
	if ARGV[0] == 'daemon'
		sites = ['fr-inria'] #, 'uk-epcc'] #, 'uk-hplabs']
		experiment = 'autocloud'
		total_vms = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
		repeat = 10
		logger = Logger.new('output.log')
	
		Process.daemon
		1.upto(repeat) do |id|
			total_vms.each do |vms|
				sites.each do |site|
					logger.info "Experiment=#{id} vms=#{vms} site=#{site}"
					do_test(:site => site, :experiment => experiment, :totalvms => vms, :logger => logger)
				end
			end
		end

	else
		if ARGV.length < 3
			puts 'Usage: stresstest.rb <bonfire-site> <experiment> <total-vms>'
		else
			do_test(:site => ARGV[0], :experiment => ARGV[1], :totalvms => ARGV[2].to_i)
		end
	end
end
