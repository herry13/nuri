#!/usr/bin/env ruby

$: << File.expand_path(File.dirname(__FILE__) + "/../lib")
$: << File.expand_path(File.dirname(__FILE__) + "/..")

require "nuri/planner/main"
require "nuri/main"

def cli
	def print_help
		puts "Usage: nuri.rb -c <options>

options:
  main             print the content of 'main.sfp'
  state            print the current state of this node
  pull             pull and print the current state of all managed nodes
  plan             generate a workflow to achieve the goal state
  apply            apply a workflow to achieve the goal state
  planner <file>   solve an SFp planning problem in <file> and print the solution
  sas <file>       generate SAS+ representation of the SFp planning problem in <file>
  json <file>      generate JSON representation of the SFp planning problem in <file>

"
	end
	if ARGV.length <= 1
		print_help
		return
	end

	if ARGV[1] == 'main'
		puts Nuri::Sfp.to_pretty_json(Nuri::Util.get_main)
	elsif ARGV[1] == 'state'
		client = Nuri::Client::Daemon.new
		state = client.get_state(ARGV[2])
		puts Nuri::Sfp.to_pretty_json(state) if state != nil
	elsif ARGV[1] == 'pull'
for i in 1..1000
		master = Nuri::Master::Daemon.new
		state = master.get_state
puts state.inspect
puts "Cycle ##{i}"
end
		#puts Nuri::Sfp.to_pretty_json(state) if state != nil
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
	elsif ARGV[1] == 'json' and ARGV.length >= 3
		Nuri::Sfp::Parser.dump( Nuri::Sfp::Parser.file_to_sfp(ARGV[2]) )
	#elsif ARGV[1] == 'json' and ARGV.length >= 3
	#	parser = Nuri::Sfp::Parser.new
	#	parser.parse_file(ARGV[2])
	#	puts parser.to_json
	elsif ARGV[1] == 'sas' and ARGV.length >= 3
		parser = Nuri::Sfp::Parser.new
		parser.parse_file(ARGV[2])
		puts parser.to_sas
	else
		print_help
	end
end

def server
=begin
	Nuri::Util.log 'Start Nuri...'
	# create Nuri server
	nuri = Nuri::Main.new
	# set as daemon if it's defined in configuration file
	if nuri.config != nil and nuri.config.has_key?('daemon') and nuri.config['daemon']
		exit if fork
		Process.setsid
		exit if fork
		puts "Nuri is running with PID=" + Process.pid.to_s
	end
	# start Nuri server
	nuri.start
=end
	Nuri::Client.start
end

if ARGV.length > 0 and ARGV[0] == '-c'
	cli
else
	server
end
