#!/usr/bin/env ruby

module_dir = File.join(File.dirname(__FILE__), '../modules')
$LOAD_PATH.unshift( module_dir )

require 'rubygems'
require 'mongrel'
require 'json'

class Daemon < Mongrel::HttpHandler
	attr_accessor :mods

	def initialize
		@mods = Array.new()
	end

	def process(req, res)
		self.getState(req, res)
	end

	def getState(req, res)
		data = ''
		@mods.each { |m|
			data += JSON.generate(m.getState)
		}

		res.start(200) do |head, out|
			head["Content-Type"] = "application/json"
			out.write(data)
		end
	end
end

daemon = Daemon.new

# load installed modules
Dir.foreach(module_dir) { |mod|
	modpath = module_dir + "/" + mod
	if File.directory?(modpath) and File.file?(modpath + "/main.rb")
		require mod + "/main"
		m =  eval(mod.capitalize + "::Main.new")
		daemon.mods << m
	end
}

h = Mongrel::HttpServer.new("0.0.0.0", "8080")
h.register("/", daemon)
h.run.join
