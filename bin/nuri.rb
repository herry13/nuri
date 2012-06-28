#!/usr/bin/env ruby

require 'rubygems'
require 'mongrel'
require 'json'
require 'pp'
require 'logger'
require File.dirname(__FILE__) + "/../lib/lib"

module Nuri
	class Main < Mongrel::HttpHandler
		def initialize
			self.readConfig
			self.loadModules
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
				if req.params['REQUEST_PATH'] == '/state' or
					(req.params['REQUEST_PATH'] =~ /^\/state\/.*/) != nil
					return self.getState(req, res)
				end
			else req.params['REQUEST_METHOD'] == 'POST'
				if req.params['REQUEST_PATH'] == '/state' or
					(req.params['REQUEST_PATH'] =~ /^\/state\/.*/) != nil
					return self.setState(req, res)
				end
			end
			res.start(404) do |head, out| out.write(''); end
		end
	
		def sendError(res, msg)
			res.start(500) do |head, out| out.write(msg); end
			Nuri::Util.log.error msg
		end
	
		# get state
		def getState(req, res)
			begin
				path = req.params['REQUEST_PATH'].sub(/^\/state\/?/,'')
				data = JSON['{"state":""}']
				state = @root.getState(path)
				if state.is_a?(Nuri::Undefined)
					res.start(404) do |head, out| out.write(''); end
				else
					res.start(200) do |head, out|
						head["Content-Type"] = "application/json"
						data['state'] = state
						out.write(JSON.generate(data))
					end
				end
			rescue Exception => e
				self.sendError(res, e.to_s)
			end
		end
	
		# set state
		def setState(req, res)
			begin
				data = ''
				res.start(200) do |head, out|
					head["Content-Type"] = "application/json"
					out.write(data)
				end
			rescue Exception => e
				self.sendError(res, e.to_s)
			end
		end
	end
end

nuri = Nuri::Main.new
Signal.trap("QUIT") {
	Nuri::Util.log "Quit"
	nuri.stop
}
Nuri::Util.log "Start"
nuri.start
