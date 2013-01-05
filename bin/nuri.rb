#!/usr/bin/env ruby

$: << File.expand_path(File.dirname(__FILE__) + "/../lib")
$: << File.expand_path(File.dirname(__FILE__) + "/..")

require "nuri/planner/main"
require "nuri/main"

Version = '0.2.0'

def console
	def print_help
		puts 'Usage: nuri.rb console <command>

commands:
  main              print the content of "main.sfp"
  state [details]   print the current state of this node
  pull [details]    pull and print the current state of all managed nodes
  plan              auto-generate a workflow to achieve the goal state;
                    user can also execute the workflow in order to achieve
                    the goal state
  update-system     push system information to all managed nodes
  bsig              generate a Behavioural Signature (BSig) model;
                    deploy the BSig model to managed nodes
  status            print the status of the Behavioural Signature model
  reset             delete existing BSig model; stop BSig execution agent;
                    delete existing system information

'
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
		parallel = (ARGV[2] == 'par')
		plan = Nuri::Master.plan(parallel)

	elsif ARGV[1] == 'bsig'
		#bsig = Nuri::Master.get_bsig
		#puts (bsig == nil ? 'no solution' : JSON.pretty_generate(bsig))
		Nuri::Master.bsig

	elsif ARGV[1] == 'apply-bsig'
		puts 'Applying BSig model...'
		puts (Nuri::Master.apply_bsig(true) ? 'OK' : 'Failed')

	elsif ARGV[1] == 'start-bsig'
		puts 'Start BSig executor...'
		puts (Nuri::Master.start_bsig ? 'OK' : 'Failed')

	elsif ARGV[1] == 'status-bsig' or ARGV[1] == 'status'
		puts 'Checking BSig status...'
		Nuri::Master.status_bsig

	elsif ARGV[1] == 'json'
		Nuri::Master.debug_json

	elsif ARGV[1] == 'sas'
		Nuri::Master.debug_sas

	elsif ARGV[1] == 'sfp'
		Nuri::Master.debug_sfp

	elsif ARGV[1] == 'apply'
		debug = (ARGV[2] == 'debug')
		puts 'Generating and executing the workflow...'
		result = Nuri::Master.apply(debug)
		puts (result ? 'OK' : 'Failed')

	elsif ARGV[1] == 'exec' and ARGV.length >= 3
		result = Nuri::Master.exec(ARGV[2])

	elsif ARGV[1] == 'update-system'
		Nuri::Master.update_system

	elsif ARGV[1] == 'reset'
		Nuri::Master.reset

	else
		print_help
	end
end

def planner
	def print_help
		puts "Usage: nuri.rb planner [option] <file>

options:
  <none>    solve an SFp planning problem in <file> and print the solution
  sas       print SAS+ representation of the SFp planning problem in <file>
  json      print JSON representation of the SFp planning problem in <file>
  seq       print the sequential workflow in JSON
  par       print the parallel workflow in JSON
  bsig      print the BSig model of the SFp planning problem in <file>

"
	end

	begin
		if ARGV.length == 2
			planner = Nuri::Planner::Solver.new
			plan = planner.solve_file(ARGV[1], false, false, true)
			puts (plan != nil ? plan : 'There is no solution.')
	
		elsif ARGV.length >= 3
			if ARGV[1] == 'seq'
				planner = Nuri::Planner::Solver.new
				plan = planner.solve_file(ARGV[2], true)
				puts (plan != nil ? plan : 'There is no solution.')
	
			elsif ARGV[1] == 'par'
				planner = Nuri::Planner::Solver.new
				plan = planner.solve_file(ARGV[2], true, true)
				puts (plan != nil ? plan : 'There is no solution.')
	
			elsif ARGV[1] == 'json'
				Nuri::Sfp::Parser.dump( Nuri::Sfp::Parser.file_to_sfp(ARGV[2]) )
	
			elsif ARGV[1] == 'sas'
				parser = Nuri::Sfp::Parser.new
				parser.parse_file(ARGV[2])
				puts parser.to_sas

			elsif ARGV[1] == 'bsig'
				planner = Nuri::Planner::Solver.new
				plan = planner.solve_file(ARGV[2])
				bsig = (plan.nil? ? nil : planner.to_bsig(true))
				puts (bsig.nil? ? 'There is no solution.' : bsig)

			end
	
		else
			print_help
		end
	rescue Exception => e
		$stderr.puts e.to_s
		$stderr.puts e.backtrace
	end
end

def client
	def print_help
		puts "Usage: nuri.rb client <command>

commands:
  start     start the Nuri client daemon
  stop      stop the Nuri client daemon
  debug     start the Nuri client but not as a daemon
  reset     clear all caches e.g. BSig model

"
	end

	if ARGV[1] == 'start'
		Nuri::Util.log 'Start Nuri client daemon...'
		Nuri::Client.start(true)

	elsif ARGV[1] == 'stop'
		Nuri::Util.log 'Stop Nuri client daemon...'
		Nuri::Client.stop

	elsif ARGV[1] == 'debug'
		Nuri::Util.log 'Start Nuri client in debugging mode...'
		Nuri::Util.set_debug(true)
		Nuri::Client.start

   elsif ARGV[1] == 'reset'
		Nuri::Util.log 'Reset Nuri client...'
		Nuri::Client.reset

	else
		print_help

	end
end

def master
	Nuri::Util.log 'Start Nuri Master...'
	Nuri::Master.start
end

if __FILE__ == $0
	if ARGV[0] == 'console'
		console
	elsif ARGV[0] == 'planner'
		planner
	elsif ARGV[0] == 'master'
		master
	elsif ARGV[0] == 'version'
		puts "Nuri #{Version} (c) 2012 Herry\n\n"
	elsif ARGV[0] == 'client'
		client
	#elsif ARGV.length <= 0
	#	client
	else
		puts "Usage: nuri.rb [mode]

modes:
  console     managing clients through command line
  planner     solve planning problem in SFP language
  client      send command to Nuri client
  version     print version

"
	end
end
