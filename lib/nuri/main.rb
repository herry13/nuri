#!/usr/bin/env ruby

require 'rubygems'
require 'mongrel'
require 'json'
require 'pp'
require 'logger'
require 'thread'
require 'uri'
require 'net/http'
require 'lib/nuri/util'
require 'lib/nuri/resource'
require 'lib/nuri/undefined'
require 'modules/node/node'
require 'lib/sfp/sfp'

module Nuri
	class Main < Mongrel::HttpHandler
		attr_accessor :config

		def initialize
			self.read_config
			self.load_modules
			@locked = false
			@mutex = Mutex.new
		end
	
		# Reads configuration file in '/etc/nuri/config.json'. If it does not
		# exist then it tries to read '<HOME>/etc/config.json'.
		def read_config
			cfile = '/etc/nuri/config.sfp'
			cfile = Nuri::Util.rootdir + "/etc/config.sfp" if not File.file?(cfile)
			@config = Nuri::Sfp::Parser.file_to_json(cfile)['nuri']
		end

		# Load all installed modules.
		def load_modules
			# load installed modules
			Nuri::Util.log "Load modules..."
			modules_dir = Nuri::Util.rootdir + "/modules"

			# load module 'Node'
			@root = Nuri::Module::Node.new
			Dir.foreach(modules_dir) { |mod|
				next if mod == 'node'
				path = modules_dir + "/" + mod
				if File.directory?(path) and File.file?(path + "/" + mod + ".rb")
					require 'modules/' + mod + '/' + mod
					begin
						m = eval("Nuri::Module::" + mod.capitalize + ".new")
						m.name = mod if m.name == nil
						@root.children[m.name] = m
						Nuri::Util.log "Successfully load module " + mod
					rescue Exception => e
						Nuri::Util.log.error "Cannot load module " + mod + " -- " + e.to_s
					end
				end
			}
		end

		# Start nuri service.
		def start
			@http = Mongrel::HttpServer.new(@config.at('host'), @config.at('port').to_i)
			@http.register("/", self)
			Nuri::Util.log "Start server on " + @config.at('host') + ":" +
				@config.at('port').to_i.to_s + " with PID #{Process.pid}"
			@http.run.join
		end
	
		# Stop nuri service.
		def stop
			@http.graceful_shutdown
			Nuri::Util.log "Nuri is stopped"
		end
	
		def process(req, res)
			if req.params['REQUEST_METHOD'] == 'GET'
				if req.params['REQUEST_URI'] == '/state' or
					(req.params['REQUEST_URI'] =~ /^\/state\/.*/) != nil
					return self.http_get_state(req, res)
				elsif req.params['REQUEST_URI'] == '/goal' or
					(req.params['REQUEST_URI'] =~ /^\/goal\/.*/) != nil
					return self.get_goal(req, res)
				end
			elsif req.params['REQUEST_METHOD'] == 'POST'
				if req.params['REQUEST_URI'] == '/state' or
					(req.params['REQUEST_URI'] =~ /^\/state\/.*/) != nil
					return self.set_state(req, res)
				elsif req.params['REQUEST_URI'] == '/goal' or
					(req.params['REQUEST_URI'] =~ /^\/goal\/.*/) != nil
					return self.set_goal(req, res)
				end
			end
			res.start(404) do |head, out| out.write(''); end
		end
	
		def send_error(res, msg='')
			res.start(500) do |head, out| out.write(msg); end
			Nuri::Util.log.error msg
		end
	
		# get state
		def http_get_state(req, res)
			begin
				path = req.params['REQUEST_PATH'].sub(/^\/state\/?/,'')
				data = JSON['{"value":""}']
				state = self.get_state(path)
				if state.is_a?(Nuri::Undefined)
					res.start(404) do |head, out| out.write(''); end
				else
					res.start(200) do |head, out|
						head["Content-Type"] = "application/json"
						data['value'] = state
						out.write(JSON.generate(data))
					end
				end
			rescue Exception => e
				self.send_error(res, e.to_s)
			end
		end

		def get_state(path='')
			return @root.get_state(path)
		end

		def set_state(req, res)
			if not self.lock
				res.start(403) do |head,out| out.write(''); end
			else
				begin
					path = req.params['REQUEST_URI'].sub(/^\/state\/?/,'')
					@root.reset_goal
					@root.set_goal(path, (JSON[req.body.read])['value'])
					puts JSON.generate(@root.get_goal) # debug
					res.start(200) do |head,out| out.write(''); end
					# applying the goal state
					self.apply
				rescue Exception => e
					self.send_error(res, e.to_s)
				end
			end
		end

		def lock(locked=true)
			@mutex.synchronize {
				return false if @locked and locked
				@locked = locked
				return true
			}
		end

		# apply the goal state
		def apply
			Thread.new() {
				puts 'Implement changes.'
				sleep 5
				# TODO -- put planning stuffs here
				self.lock(false)
				puts 'The changes has been applied'
				res.start(200) do |head,out| out.write(''); end
			}
		end

		def set_goal(req, res)
			# TODO -- put your BSig execution here
		end

		def get_goal(req, res)
			begin
				goal = JSON.generate(@root.get_goal)
				res.start(200) do |head,out| out.write(goal); end
			rescue Exception => e
				self.send_error(res, e.to_s)
			end
		end
	end
end
