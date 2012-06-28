#!/usr/bin/env ruby

require 'rubygems'
require 'mongrel'
require 'json'
require 'pp'
require 'logger'
require File.dirname(__FILE__) + '/planit.rb'

class Nuri < Mongrel::HttpHandler
	## class variables and methods
	@@rootdir = File.dirname(__FILE__) + "/.."
	@@logger = Logger.new(@@rootdir + "/log/message.log")

	def self.rootdir
		return @@rootdir
	end

	def self.log
		return @@logger
	end

	def self.os
		return (`uname -o`).strip
	end

	def self.platform
		data = `cat /etc/issue`
		return "ubuntu" if ((data =~ /Ubuntu/) != nil)
		return "sl" if ((data =~ /Scientific Linux/) != nil)
		return nil
	end

	## object variables and methods
	@modules = Hash.new()

	def initialize
		@modules = Hash.new()
		self.loadModules
	end

	def loadModules
		# load installed modules
		Nuri.log.info "Load modules..."
		modules_dir = @@rootdir + "/modules"
		Dir.foreach(modules_dir) { |mod|
			modpath = modules_dir + "/" + mod
			if File.directory?(modpath) and File.file?(modpath + "/main.rb")
				require modpath + "/main"
				begin
					m = eval(mod.capitalize + "::Main.new")
					@modules[mod] = m
				rescue Exception => e
					Nuri.log.error "Cannot load module " + mod
				end
			end
		}
		Nuri.log.info "Successfully load " + @modules.length.to_s + " modules"
	end

	def start
		configFile = '/etc/nuri/config.json'
		configFile = @@rootdir + "/etc/config.json" if not File.file?(configFile)
		@config = JSON.parse(File.read(configFile))
		@http = Mongrel::HttpServer.new(@config['host'], @config['port'])
		@http.register("/", self)
		Nuri.log.info "Start server on " + @config['host'] + ":" + @config['port'].to_s +
			" with PID #{Process.pid}"
		@http.run.join
	end

	def stop
		@http.graceful_shutdown
		Nuri.log.info "Nuri is stopped"
	end

	def process(req, res)
		if req.params['REQUEST_METHOD'] == 'GET'
			if req.params['REQUEST_PATH'] == '/state'
				return self.getState(req, res)
			end
		else req.params['REQUEST_METHOD'] == 'POST'
			if req.params['REQUEST_PATH'] == '/state'
				return self.setState(req, res)
			end
		end
		res.start(404) do |head, out| out.write(''); end
	end

	def sendError(res, msg)
		res.start(500) do |head, out| out.write(msg); end
		Nuri.log.error msg
	end

	# get state
	def getState(req, res)
		begin
			data = @modules['node'].getState.clone
			name = @modules['node'].name
			@modules.each { |n,m| data[name][n] = m.getState.clone if n != 'node' }

			res.start(200) do |head, out|
				head["Content-Type"] = "application/json"
				out.write(JSON.generate(data))
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

def loadLibrary
	rootdir = Nuri.rootdir
	Dir.foreach(rootdir + "/lib") { |f|
		require rootdir + "/lib/" + f if File.extname(f) == '.rb'
	}
	Nuri.log.info "Finish loading libraries"
end

loadLibrary()
nuri = Nuri.new
Signal.trap("QUIT") {
	Nuri.log.info "Quit"
	nuri.stop
}
nuri.start
