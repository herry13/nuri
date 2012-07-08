#!/usr/bin/env ruby

$: << File.expand_path(File.dirname(__FILE__) + "/..")

require "lib/nuri/main"
require 'json'

def server
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
end

def cli
	return if ARGV.length <= 1
	if ARGV[1] == 'current'
		nuri = Nuri::Main.new
		puts JSON.pretty_generate(nuri.get_state)
	end
end

if ARGV.length > 0 and ARGV[0] == '-c'
	cli
else
	server
end
