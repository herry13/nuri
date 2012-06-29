#!/usr/bin/env ruby

require 'rubygems'
require 'mongrel'
require 'json'
require 'pp'
require 'logger'
require 'thread'
require 'uri'
require 'net/http'
require File.dirname(__FILE__) + "/../lib/lib"

module Nuri
	class Main < Mongrel::HttpHandler
		attr_accessor :config

		def initialize
			self.readConfig
			self.loadModules
			@locked = false
			@mutex = Mutex.new
		end
	
		def readConfig
			configFile = '/etc/nuri/config.json'
			configFile = Nuri::Util.rootdir + "/etc/config.json" if not File.file?(configFile)
			@config = JSON.parse(File.read(configFile))
		end

		def loadModules
			# load installed modules
			Nuri::Util.log "Load modules..."
			modules_dir = Nuri::Util.rootdir + "/modules"

			# load module 'Node'
			require modules_dir + "/node/node"
			@root = Nuri::Module::Node.new
			Dir.foreach(modules_dir) { |mod|
				next if mod == 'node'
				path = modules_dir + "/" + mod
				if File.directory?(path) and File.file?(path + "/" + mod + ".rb")
					require path + "/" + mod
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
	
		def start
			@http = Mongrel::HttpServer.new(@config['host'], @config['port'])
			@http.register("/", self)
			Nuri::Util.log "Start server on " + @config['host'] + ":" + @config['port'].to_s +
				" with PID #{Process.pid}"
			@http.run.join
		end
	
		def stop
			@http.graceful_shutdown
			Nuri::Util.log "Nuri is stopped"
		end
	
		def process(req, res)
			if req.params['REQUEST_METHOD'] == 'GET'
				if req.params['REQUEST_URI'] == '/state' or
					(req.params['REQUEST_URI'] =~ /^\/state\/.*/) != nil
					return self.getState(req, res)
				elsif req.params['REQUEST_URI'] == '/goal' or
					(req.params['REQUEST_URI'] =~ /^\/goal\/.*/) != nil
					return self.getGoal(req, res)
				end
			elsif req.params['REQUEST_METHOD'] == 'POST'
				if req.params['REQUEST_URI'] == '/state' or
					(req.params['REQUEST_URI'] =~ /^\/state\/.*/) != nil
					return self.setState(req, res)
				elsif req.params['REQUEST_URI'] == '/goal' or
					(req.params['REQUEST_URI'] =~ /^\/goal\/.*/) != nil
					return self.setGoal(req, res)
				end
			end
			res.start(404) do |head, out| out.write(''); end
		end
	
		def sendError(res, msg='')
			res.start(500) do |head, out| out.write(msg); end
			Nuri::Util.log.error msg
		end
	
		# get state
		def getState(req, res)
			begin
				path = req.params['REQUEST_PATH'].sub(/^\/state\/?/,'')
				data = JSON['{"value":""}']
				state = @root.getState(path)
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
				self.sendError(res, e.to_s)
			end
		end

		def setState(req, res)
			if not self.lock
				res.start(403) do |head,out| out.write(''); end
			else
				begin
					path = req.params['REQUEST_URI'].sub(/^\/state\/?/,'')
					@root.resetGoal
					@root.setGoal(path, (JSON[req.body.read])['value'])
					puts JSON.generate(@root.getGoal) # debug
					res.start(200) do |head,out| out.write(''); end
					# applying the goal state
					self.apply
				rescue Exception => e
					self.sendError(res, e.to_s)
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

		def setGoal(req, res)
			# TODO -- put your BSig execution here
		end

		def getGoal(req, res)
			begin
				goal = JSON.generate(@root.getGoal)
				res.start(200) do |head,out| out.write(goal); end
			rescue Exception => e
				self.sendError(res, e.to_s)
			end
		end
=begin	
		# set state
		def setState(req, res)
			begin
				path = req.params['REQUEST_URI'].sub(/^\/state\/?/,'')
				if @root.setState(path, (JSON[req.body.read])['value'])
					res.start(200) do |head, out| out.write(''); end
				else
					self.sendError(res, 'Cannot set the state!')
				end
			rescue Exception => e
				puts e.backtrace.join("\n")
				self.sendError(res, e.to_s)
			end
		end
=end
	end
end

# create the nuri's server
nuri = Nuri::Main.new
# set as daemon if it's defined in configuration file
if nuri.config['daemon']
	exit if fork
	Process.setsid
	exit if fork
	puts "Nuri is running with PID=" + Process.pid.to_s
end
# start the server
Nuri::Util.log "Start"
nuri.start
