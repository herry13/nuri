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
	nuri = Nuri::Main.new

	return if ARGV.length <= 1
	
	if ARGV[1] == 'current'
		puts JSON.pretty_generate(nuri.get_state)
	elsif ARGV[1] == 'apply'
		if nuri.lock
			nuri.apply(true)
			nuri.lock(false)
		end
	elsif ARGV[1] == 'main'
		cfile = Nuri::Util.rootdir + "/etc/main.sfp"
		#puts JSON.pretty_generate(Nuri::Sfp::Parser.file_to_json(cfile))
		root = Nuri::Sfp::Parser.file_to_json(cfile)
		root.accept(Nuri::Sfp::ParentEliminator.new)
		puts JSON.pretty_generate root
	end
end

if ARGV.length > 0 and ARGV[0] == '-c'
	cli
else
	server
end
