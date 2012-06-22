#!/usr/bin/env ruby

require 'rubygems'
require 'mongrel'
require 'json'
require 'pp'

class Daemon < Mongrel::HttpHandler
	attr_accessor :modules, :config, :http

	def initialize
		@modules = Array.new()
		self.loadModules
	end

	def loadModules
		# load installed modules
		modules_dir = File.join(File.dirname(__FILE__), '../modules')
		Dir.foreach(modules_dir) { |mod|
			modpath = modules_dir + "/" + mod
			if File.directory?(modpath) and File.file?(modpath + "/main.rb")
				require modpath + "/main"
				m =  eval(mod.capitalize + "::Main.new")
				@modules << m
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
		data = ''
		@modules.each { |m|
			data += JSON.generate(m.getState)
		}

		res.start(200) do |head, out|
			head["Content-Type"] = "application/json"
			out.write(data)
		end
	end

	def set(req, res)
		res.start(200) do |head, out|
			head["Content-Type"] = "plain/text"
			out.write('')
		end
	end
end

daemon = Daemon.new
daemon.start
