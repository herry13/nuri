#!/usr/bin/env ruby

$: << File.expand_path(File.dirname(__FILE__) + "/../lib")
$: << File.expand_path(File.dirname(__FILE__) + "/..")

require "nuri/planner/main"
require "nuri/main"

def cli
	def print_help
		puts "Usage: nuri.rb -c <options>

options:
  main                 print the content of 'main.sfp'
  state [details]      print the current state of this node
  pull [details]       pull and print the current state of all managed nodes
  plan                 generate a workflow to achieve the goal state
  apply                apply a workflow to achieve the goal state

"
	end
	if ARGV.length <= 1
		print_help
		return
	end

	if ARGV[1] == 'main'
		client = Nuri::Client::Daemon.new
		main = client.get_main
		puts Nuri::Sfp.to_pretty_json(main) if main != nil

	elsif ARGV[1] == 'state'
		client = Nuri::Client::Daemon.new
		state = client.get_state
		state = {} if state == nil
		state.accept(Nuri::Sfp::PrettyStateGenerator.new) if
				ARGV.length < 3 or ARGV[2] != 'details'
		puts Nuri::Sfp.to_pretty_json(state) if state != nil

	elsif ARGV[1] == 'pull'
		state = Nuri::Master.pull
		if state != nil
			state.accept(Nuri::Sfp::PrettyStateGenerator.new) if ARGV[2] != 'details'
			puts Nuri::Sfp.to_pretty_json(state)
		end

	elsif ARGV[1] == 'plan'
		plan = Nuri::Master.plan
		puts (plan == nil || plan['workflow'] == nil ? 'no solution' : plan)

	elsif ARGV[1] == 'json'
		plan = Nuri::Master.debug_json

	elsif ARGV[1] == 'sas'
		plan = Nuri::Master.debug_sas

	elsif ARGV[1] == 'apply'
		result = Nuri::Master.apply
		puts 'Succeed: ' + result.to_s
	else
		print_help
	end
end

def planner
	def print_help
		puts "Usage: nuri.rb -p [option] <file>

options:
  [no-option]      solve an SFp planning problem in <file> and print the solution
  sas              generate SAS+ representation of the SFp planning problem in <file>
  json             generate JSON representation of the SFp planning problem in <file>

"
	end

	if ARGV.length <= 2 #ARGV[1] == 'planner' and ARGV.length >= 3
		planner = Nuri::Planner::Solver.new
		plan = planner.solve_file(ARGV[2])
		puts (plan != nil ? plan : 'no solution!')

	elsif ARGV[1] == 'json' and ARGV.length >= 3
		Nuri::Sfp::Parser.dump( Nuri::Sfp::Parser.file_to_sfp(ARGV[2]) )

	elsif ARGV[1] == 'sas' and ARGV.length >= 3
		parser = Nuri::Sfp::Parser.new
		parser.parse_file(ARGV[2])
		puts parser.to_sas

	else
		print_help
	end
end

def client
	Nuri::Util.log 'Start Nuri Client...'
	# set as daemon if it's defined in configuration file
	#if nuri.config != nil and nuri.config.has_key?('daemon') and nuri.config['daemon']
	#	exit if fork
	#	Process.setsid
	#	exit if fork
	#	puts "Nuri is running with PID=" + Process.pid.to_s
	#end

	# start Nuri Client
	Nuri::Client.start
end

def master
	Nuri::Util.log 'Start Nuri Master...'
	Nuri::Master.start
end

if ARGV.length > 0 and ARGV[0] == '-c'
	cli
elsif ARGV.length > 0 and ARGV[0] == '-p'
	planner
elsif ARGV.length > 0 and ARGV[0] == '-m'
	master
else
	client
end
