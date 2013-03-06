#!/usr/bin/env ruby

libdir = File.expand_path(File.dirname(__FILE__))
require "#{libdir}/main"
require "#{libdir}/sas"

module Nuri
	module Planner
		Heuristic = 'mixed' # lmcut, cg, cea, ff, mixed ([cg|cea|ff]=>lmcut)
		Debugging = false

		class Solver
			# The timeout for the solver in seconds (default 600s/5mins)
			@@timeout = 60
			# The maximum memory that can be consumed by the solver
			@@max_memory = 2048000 # (in K) -- default ~2GB

			def self.timeout; @@timeout; end
			def self.max_memory; @@max_memory; end

			# Set the search timeout in seconds
			def self.set_timeout(timeout); @@timeout = timeout; end

			# Set the maximum memory that can be consumed by the solver
			def self.set_max_memory(memory); @@max_memory = memory; end

			attr_accessor :debug
			attr_reader :parser

			def initialize
				@debug = Debugging
			end
	
			# solve given configuration problem
			# return a plan either in JSON or SFW format, or nil if there is no solution
			def solve(problem, json=false, parallel=false)
				@parser = Nuri::Sfp::Parser.new
				@parser.parse(problem)
				return self.solve_classical_task({:json => json, :parallel => parallel})
			end

			# solve given configuration problem in SFP data structure
			# return a plan either in JSON or SFW format, or nil if there is no solution
			def solve_sfp(root, json=false, parallel=false)
				@parser = Nuri::Sfp::Parser.new
				@parser.root = root
				return self.solve_classical_task({:json => json, :parallel => parallel})
			end

			# solve the configuration problem in given file
			# return a plan either in JSON or SFW format, or nil if there is no solution
			def solve_file(file, json=false, parallel=false, sas=false)
				@parser = Nuri::Sfp::Parser.new
				@parser.parse_file(file)
				if @parser.conformant
					# solve conformant planning task
					return self.solve_conformant_task({:json => json})
				else
					return self.solve_classical_task({:json => json,
						:parallel => parallel, :sas => sas})
				end
			end

			def to_bsig(json=false, parallel=true)
				bsig = (parallel ? self.to_parallel_bsig : self.to_sequential_bsig)
				return (json ? JSON.pretty_generate(bsig) : bsig)
			end

			def final_state(json=false)
				return nil if @plan.nil?
				state = @sas_task.final_state
				return (json ? JSON.pretty_generate(state) : state)
			end

			protected
			def solve_conformant_task(params={})
				# TODO
				# 1) generate all possible initial states
				#    remove states that do not satisfy the global constraint
				def get_possible_partial_initial_states(init)
					def combinators(variables, var_values, index=0, result={}, bucket=[])
						if index >= variables.length
							# collect
							bucket << result.clone
						else
							var = variables[index]
							var_values[var].each do |value|
								result[var] = value
								combinators(variables, var_values, index+1, result, bucket)
							end
						end
						bucket
					end
					# collect variables with non-deterministic value
					collector = Nuri::Sfp::ConformantVariables.new
					init.accept(collector)
					vars = collector.var_values.keys
					combinators(vars, collector.var_values)
				end

				# 2) for each initial states, generate a plan (if possible)
				#    for given goal state
				def get_possible_plans(partial_inits)
					# TODO
				end

				# 3) merge the plans into one
				def merge_plans(plans)
					# TODO
				end

				partial_inits = get_possible_partial_initial_states(@parser.root['initial'])
				plans = get_possible_plans(partial_inits)
				merged_plan = merge_plans(plans)
			end

			def solve_classical_task(params={})
				@plan, @sas_task = self.solve_sas(@parser.to_sas)
				return @plan if params[:sas]
				plan = (params[:parallel] ? self.get_parallel_plan : self.get_sequential_plan)
				return (params[:json] ? JSON.pretty_generate(plan) : plan)
			end

			def bsig_template
				return {'version' => 1, 'operators' => [], 'id' => Time.now.getutc.to_i, 'goal' => []}
			end

			def to_sequential_bsig
				bsig = self.bsig_template
				return bsig if @plan.length <= 0
				plan = self.get_sequential_plan
				bsig['operators'] = workflow = plan['workflow']
				(workflow.length-1).downto(1) do |i|
					op = workflow[i]
					prev_op = workflow[i-1]
					prev_op['effect'].each { |k,v| op['condition'][k] = v }
				end
				bsig['goal'], _ = self.bsig_goal_operator(workflow)
				return bsig
			end

			def to_parallel_bsig
				return nil if @plan.nil?
				bsig = self.bsig_template
				return bsig if @plan.length <= 0
				plan = self.get_parallel_plan
				# foreach operator's predecessors, add its effects to operator's conditions
				bsig['operators'] = workflow = plan['workflow']
				workflow.each do |op|
					op['predecessors'].each do |pred|
						pred_op = workflow[pred]
						pred_op['effect'].each { |k,v| op['condition'][k] = v }
					end
				end
				bsig['goal'], bsig['goal_operator'] = self.bsig_goal_operator(workflow)
				return bsig
			end

			def bsig_goal_operator(workflow)
				goal_op = {}
				goal = {}
				@sas_task.final_state.each do |g|
					variable, value = @parser.variable_name_and_value(g[:id], g[:value])
					# search a supporting operator
					(workflow.length-1).downto(0) do |i|
						if workflow[i]['effect'].has_key?(variable)
							if workflow[i]['effect'][variable] == value
								goal_op[variable] = workflow[i]['name']
								goal[variable] = value
								break
							else
								Nuri::Util.debug "#{variable}=#{value} is not changing"
								Nuri::Util.debug value.inspect + ' == ' + workflow[i]['effect'][variable].inspect
							end
						end
					end
				end
				return goal, goal_op
			end

			def get_sequential_plan
				json = { 'type'=>'sequential', 'workflow'=>nil, 'version'=>'1', 'total'=>0 }
				return json if @plan == nil
				json['workflow'] = []
				@plan.each do |line|
					op_name = line[1, line.length-2].split(' ')[0]
					operator = @parser.operators[op_name]
					raise Exception, 'Cannot find operator: ' + op_name if operator == nil
					json['workflow'] << operator.to_sfw
				end
				json['total'] = json['workflow'].length
				return json
			end

			def get_parallel_plan
				json = {'type'=>'parallel', 'workflow'=>nil, 'init'=>nil, 'version'=>'1', 'total'=>0}
				return json if @plan == nil
				json['workflow'], json['init'], json['total'] = @sas_task.get_partial_order_workflow(@parser)
				return json
			end

			def extract_sas_plan(sas_plan)
				actions = Array.new
				sas_plan.split("\n").each do |sas_operator|
					op_name = sas_operator[1,sas_operator.length-2].split(' ')[0]
					actions << Action.new(@parser.operators[op_name])
				end
			end

			def solve_sas(sas)
				return nil if sas == nil

				tmp_dir = '/tmp/nuri_' + (rand * 100000).to_i.abs.to_s
				begin
					Dir.mkdir(tmp_dir) if not File.exist?(tmp_dir)
					sas_file = tmp_dir + '/problem.sas'
					plan_file = tmp_dir + '/out.plan'
					File.open(sas_file, 'w') do |f|
						f.write(sas)
						f.flush
					end

					if Heuristic == 'mixed'
						mixed = MixedHeuristic.new(tmp_dir, sas_file, plan_file)
						mixed.solve
					else
						command = Nuri::Planner.command(tmp_dir, sas_file, plan_file, Heuristic)
						Kernel.system(command)
					end
					plan = (File.exist?(plan_file) ? File.read(plan_file) : nil)

					if plan != nil
						plan = extract_sas_plan(plan)
						sas_task = Nuri::Sas::Task.new(sas_file)
						sas_task.sas_plan = plan

						tmp = []
						goal_op = nil
						plan.each do |op|
							_, name, _ = op.split('-', 3)
							goal_op = op if name == 'goal'
							next if name == 'goal' or name == 'globalop' or name == 'sometime'
							tmp.push(op)
						end
						sas_task.goal_operator_name = goal_op
						plan = tmp
					end

					return plan, sas_task
				rescue Exception => exp
					raise exp
				ensure
					File.delete('plan_numbers_and_cost') if File.exist?('plan_numbers_and_cost')
					#system 'rm -rf ' + tmp_dir
				end

				return nil, nil
			end
		end

		def self.path
			os = `uname -s`.downcase.strip
			dir = File.expand_path(File.dirname(__FILE__))
			planner = case os
				when 'linux' then "#{dir}/solver/linux"
				when 'macos', 'darwin' then "#{dir}/solver/macos"
				else nil
			end
			raise UnsupportedPlatformException, os + ' is not supported' if planner == nil
			planner
		end

		# Return the solver parameters based on given heuristic mode.
		# Default value: FF
		def self.parameters(heuristic='ff')
			return case heuristic
				when 'lmcut' then '--search "astar(lmcut())"'
				when 'blind' then '--search "astar(blind())"'
				when 'cg' then '--search "lazy_greedy(cg(cost_type=2))"'
				when 'cea' then '--search "lazy_greedy(cea(cost_type=2))"'
				when 'mad' then '--search "lazy_greedy(mad())"'
				else '--search "lazy_greedy(ff(cost_type=0))"'
			end
		end

		# Return a command to run the planner:
		# - within given working directory "dir"
		# - problem in SAS+ format, available in"sas_file"
		# - solution will be saved in "plan_file"
		def self.command(dir, sas_file, plan_file, heuristic='ff', debug=false)
			planner = Nuri::Planner.path
			params = Nuri::Planner.parameters(heuristic)
			timeout = Nuri::Planner::Solver.timeout

			os = `uname -s`.downcase.strip
			command = case os
				when 'linux' then
					"cd #{dir}; " +
					"#{planner}/preprocess < #{sas_file} 2>/dev/null 1>/dev/null; " +
					"timeout #{timeout} nice #{planner}/downward #{params} " +
					"--plan-file #{plan_file} < output"
				when 'macos', 'darwin' then
					"cd #{dir}; #{planner}/preprocess < #{sas_file} 1> /dev/null; " +
					"#{planner}/downward #{params} " +
					"--plan-file #{plan_file} < #{dir}/output 1> /dev/null;"
				else nil
			end

			if not debug and os == 'linux'
				command = "ulimit -Sv #{Nuri::Planner::Solver.max_memory}; " +
				          "#{command} 1> /dev/null 2>/dev/null"
			end
			command
		end

		# Combination between two heuristic to obtain a suboptimal plan.
		# 1) solve the problem with CG/CEA/FF, that will produce (usually) a non-optimal plan
		# 2) remove actions which are not selected by previous step
		# 3) solve the problem with LMCUT using A*-search to obtain a sub-optimal plan
		class MixedHeuristic
			def initialize(dir, sas_file, plan_file)
				@dir = dir
				@sas_file = sas_file
				@plan_file = plan_file
			end

			def solve
				# 1) solve with FF
				planner1 = ::Nuri::Planner.command(@dir, @sas_file, @plan_file, 'cg')
				Kernel.system(planner1)
				# 1b) if not found, try CEA
				if not File.exist?(@plan_file)
					planner2 = ::Nuri::Planner.command(@dir, @sas_file, @plan_file, 'ff')
					Kernel.system(planner2)
				end
				# 1c) if not found, try CG
				if not File.exists?(@plan_file)
					planner3 = ::Nuri::Planner.command(@dir, @sas_file, @plan_file, 'cea')
					Kernel.system(planner3)
					return false if not File.exist?(@plan_file)
				end

				# 2) remove unselected operators
				new_sas = @sas_file + '.2'
				new_plan = @plan_file + '.2'
				self.filter_operators(@sas_file, @plan_file, new_sas)

				# 3) generate the final plan with LMCUT
				lmcut = ::Nuri::Planner.command(@dir, new_sas, new_plan, 'lmcut')
				Kernel.system(lmcut)

				# LMCUT cannot find the sub-optimized plan
				File.delete(@plan_file)
				File.rename(new_plan, @plan_file) if File.exist?(new_plan)

				true
			end

			def filter_operators(sas, plan, new_sas)
				# generate the selected actions
				selected = []
				File.read(plan).each_line do |line|
					line.strip!
					line = line[1, line.length-2]
					selected << line.split(' ', 2)[0]
				end

				# remove unselected operators
				output = ""
				operator = nil
				id = nil
				total_op = false
				counter = 0
				File.read(sas).each_line do |line|
					if line =~ /^end_goal/
						total_op = true
					elsif total_op
						output += "__TOTAL_OPERATOR__\n"
						total_op = false
						next
					end

					if line =~ /^begin_operator/
						operator = ""
						id = nil
					elsif line =~ /^end_operator/
						if not selected.index(id).nil?
							output += "begin_operator\n#{operator}end_operator\n"
							counter += 1
						end
						operator = nil
						id = nil
					elsif operator.nil?
						output += line
					else
						id = line.split(' ', 2)[0] if id.nil?
						operator += line
					end
				end

				# replace total operator
				output.sub!(/__TOTAL_OPERATOR__/, counter.to_s)

				# save filtered problem
				File.open(new_sas, 'w') { |f| f.write(output) }
			end
		end

		class Action
			attr_accessor :operator, :predecessor

			def initialize(operator)
				@operator = operator
				@predecessor = Array.new
			end
		end
	
		class UnsupportedPlatformException < Exception
		end

		class NoSolutionException < Exception
		end
	end
end

if $0 == __FILE__
	begin
		if ARGV.length > 1 and ARGV[0] == '-p'
			sfp = Nuri::Sfp::Parser.to_sfp(File.read(ARGV[1]))
			puts Nuri::Sfp::to_pretty_json(sfp)
		elsif ARGV.length > 0
			solver = Nuri::Planner::Solver.new
			puts solver.solve_file(ARGV[0], true)
		else
			puts "Usage: planner.rb <planning-task>\n\n"
		end
	rescue Exception => exp
		puts exp.to_s
		puts exp.backtrace
	end
end
