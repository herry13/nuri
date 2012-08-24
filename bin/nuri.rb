#!/usr/bin/env ruby

$: << File.expand_path(File.dirname(__FILE__) + "/../lib")
$: << File.expand_path(File.dirname(__FILE__) + "/..")

require "nuri/main"

def cli
	return if ARGV.length <= 1

	if ARGV[1] == 'main'
		mainfile = Nuri::Util.rootdir + '/etc/main.sfp'
		root = Nuri::Sfp::Parser.file_to_json(mainfile)
		Nuri::Sfp::Parser.dump(root)
	elsif ARGV[1] == 'current'
		nuri = Nuri::Main.new
		state = nuri.get_state
		Nuri::Sfp::Parser.dump(state)
	elsif ARGV[1] == 'apply'
		nuri = Nuri::Main.new
		if nuri.lock
			nuri.apply(true)
			nuri.lock(false)
		end
	end
end

def server
	Nuri::Util.log 'Start Nuri...'
	# create Nuri server
	nuri = Nuri::Main.new
	# set as daemon if it's defined in configuration file
	if nuri.config.has_key?('daemon') and nuri.config['daemon']
		exit if fork
		Process.setsid
		exit if fork
		puts "Nuri is running with PID=" + Process.pid.to_s
	end
	# start Nuri server
	nuri.start
end

if ARGV.length > 0 and ARGV[0] == '-c'
	cli
else
	server
end
