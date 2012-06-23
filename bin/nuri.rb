#!/usr/bin/env ruby

rootdir = File.dirname(__FILE__) + "/.."

require 'rubygems'
require 'mongrel'
require 'json'
require 'pp'
require rootdir + "/lib/util.rb"

class Daemon < Mongrel::HttpHandler
	attr_accessor :modules, :config, :http

	def initialize
		@modules = Hash.new()
		self.loadModules
	end

	def loadModules
		# load installed modules
		modules_dir = File.join(File.dirname(__FILE__), '../modules')
		Dir.foreach(modules_dir) { |mod|
			modpath = modules_dir + "/" + mod
			if File.directory?(modpath) and File.file?(modpath + "/main.rb")
				require modpath + "/main"
				m = eval(mod.capitalize + "::Main.new")
				@modules[mod] = m
			end
		}
	end

	def start
		@config = JSON.parse(File.read(File.join(File.dirname(__FILE__), '../etc/config.json')))
		@http = Mongrel::HttpServer.new(@config['host'], @config['port'])
		@http.register("/", self)
		puts "Start server on " + @config['host'] + ":" + @config['port'].to_s
		@http.run.join
	end

	def process(req, res)
		if req.params['REQUEST_METHOD'] == 'GET'
			self.get(req, res)
		else req.params['REQUEST_METHOD'] == 'POST'
			self.set(req, res)
		end
	end

	def get(req, res)
		if @modules['node'] != nil
			data = JSON.generate(@modules['node'].getState(@modules))
			res.start(200) do |head, out|
				head["Content-Type"] = "application/json"
				out.write(data)
			end
		else
			res.start(500) do |head, out|
				out.write('')
			end
		end
	end

	def set(req, res)
		res.start(200) do |head, out|
			head["Content-Type"] = "plain/text"
			out.write('')
		end
	end
end

Daemon.new.start
