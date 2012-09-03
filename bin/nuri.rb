#!/usr/bin/env ruby

$: << File.expand_path(File.dirname(__FILE__) + "/../lib")
$: << File.expand_path(File.dirname(__FILE__) + "/..")

require "nuri/main"

def cli
	return if ARGV.length <= 1

	if ARGV[1] == 'main'
		nuri = Nuri::Main.new
		Nuri::Sfp::Parser.dump(nuri.main)
	elsif ARGV[1] == 'state'
		nuri = Nuri::Main.new
		state = nuri.get_state
		Nuri::Sfp::Parser.dump(state)
	elsif ARGV[1] == 'plan'
		nuri = Nuri::Main.new
		puts nuri.get_plan
	elsif ARGV[1] == 'apply'
		nuri = Nuri::Main.new
		if nuri.lock
			nuri.apply(true)
			nuri.lock(false)
		end
	elsif ARGV[1] == 'planner' and ARGV.length >= 3
		planner = Nuri::Planner::Solver.new
		plan = planner.solve_file(ARGV[2])
		puts (plan != nil ? plan : 'no solution!')
	elsif ARGV[1] == 'sfp' and ARGV.length >= 3
		Nuri::Sfp::Parser.dump( Nuri::Sfp::Parser.file_to_json(ARGV[2]) )
	elsif ARGV[1] == 'sas' and ARGV.length >= 3
		parser = Nuri::Sfp::Parser.new
		parser.parse_file(ARGV[2])
		puts parser.to_sas
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
