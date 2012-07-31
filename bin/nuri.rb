#!/usr/bin/env ruby

$: << File.expand_path(File.dirname(__FILE__) + "/../lib")
#$: << File.expand_path(File.dirname(__FILE__) + "/..")
#$: << File.expand_path(File.dirname(__FILE__) + "/../modules")

require "nuri/main"

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
