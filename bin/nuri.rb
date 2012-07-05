#!/usr/bin/env ruby

require 'rubygems'
require File.dirname(__FILE__) + "/../lib/lib"

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
