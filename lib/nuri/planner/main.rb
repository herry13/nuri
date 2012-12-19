require 'nuri/sfp/main'
require 'nuri/planner/sas'

module Nuri
	module Planner
		Heuristic = 'ff' # lmcut, cg, cea, ff, blind
		Debugging = false

		class Solver
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
				@plan, @sas_task = self.solve_sas(@parser.to_sas)
				plan = (parallel ? self.get_parallel_plan : self.get_sequential_plan)
				return (json ? JSON.pretty_generate(plan) : plan)
			end

			# solve given configuration problem in SFP data structure
			# return a plan either in JSON or SFW format, or nil if there is no solution
			def solve_sfp(root, json=false, parallel=false)
				@parser = Nuri::Sfp::Parser.new
				@parser.root = root
				@plan, @sas_task = self.solve_sas(@parser.to_sas)
				plan = (parallel ? self.get_parallel_plan : self.get_sequential_plan)
				return (json ? JSON.pretty_generate(plan) : plan)
			end

			# solve the configuration problem in given file
			# return a plan either in JSON or SFW format, or nil if there is no solution
			def solve_file(file, json=false, parallel=false, sas=false)
				@parser = Nuri::Sfp::Parser.new
				@parser.parse_file(file)
				@plan, @sas_task = self.solve_sas(@parser.to_sas)
				return @plan if sas
				plan = (parallel ? self.get_parallel_plan : self.get_sequential_plan)
				return (json ? JSON.pretty_generate(plan) : plan)
			end

			def to_bsig(json=false, parallel=true)
				bsig = (parallel ? self.to_parallel_bsig : self.to_sequential_bsig)
				return (json ? JSON.pretty_generate(bsig) : bsig)
			end

			protected
			def bsig_template
				return {'version' => 1, 'bsig' => [], 'id' => Time.now.getutc.to_i}
			end

			def to_sequential_bsig
				bsig = self.bsig_template
				return bsig if @plan.length <= 0
				plan = self.get_sequential_plan
				workflow = plan['workflow']
				(workflow.length-1).downto(1) do |i|
					op = workflow[i]
					prev_op = workflow[i-1]
					prev_op['effect'].each { |k,v| op['condition'][k] = v }
				end
				bsig['bsig'] = workflow
				return bsig
			end

			def to_parallel_bsig
				bsig = self.bsig_template
				return bsig if @plan.length <= 0
				plan = self.get_parallel_plan
				# foreach operator's predecessors, add its effects to operator's conditions
				workflow = plan['workflow']
				workflow.each do |op|
					op['predecessors'].each do |pred|
						pred_op = workflow[pred]
						pred_op['effect'].each { |k,v| op['condition'][k] = v }
					end
				end
				bsig['bsig'] = workflow
				return bsig
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

				os = `uname -s`.downcase.strip
				planner = case os
					when 'linux' then File.dirname(__FILE__) + '/linux'
					when 'macos', 'darwin' then File.dirname(__FILE__) + '/macos'
					else nil
				end
				raise UnsupportedPlatformException, os + ' is not supported' if planner == nil

				params = case Heuristic
					when 'lmcut' then '--search "astar(lmcut())"'
					when 'blind' then '--search "astar(blind())"'
					when 'cg' then '--search "lazy_greedy(cg(cost_type=2))"'
					when 'cea' then '--search "lazy_greedy(cea(cost_type=2))"'
					else '--search "lazy_greedy(ff(cost_type=0))"'
				end

				begin
					begin
						tmp_dir = '/tmp/nuri_' + (rand * 100000).to_i.abs.to_s
					end while File.exist?(tmp_dir)
					Dir.mkdir(tmp_dir)
					sas_file = tmp_dir + '/problem.sas'
					plan_file = tmp_dir + '/out.plan'
					File.open(sas_file, 'w') do |f|
						f.write(sas)
						f.flush
					end

					command = case os
						when 'linux' then "#{planner}/preprocess < #{sas_file} | #{planner}/downward #{params} --plan-file #{plan_file}"
						when 'macos', 'darwin' then "cd #{tmp_dir}; #{planner}/preprocess < #{sas_file} 1> /dev/null; #{planner}/downward #{params} --plan-file #{plan_file} < #{tmp_dir}/output 1> /dev/null;"
						else nil
					end

					command = "#{command} 1> /dev/null 2>/dev/null" if not debug and os == 'linux'

					Kernel.system(command)
					plan = (File.exist?(plan_file) ? File.read(plan_file) : nil)

					if plan != nil
						plan = extract_sas_plan(plan)
						sas_task = Nuri::Sas::Task.new(sas_file)
						sas_task.sas_plan = plan

						tmp = []
						plan.each do |p|
							_, name, _ = p.split('-', 3)
							next if name == 'goal' or name == 'globalop' or name == 'sometime'
							tmp.push(p)
						end
						plan = tmp
					end

					return plan, sas_task
				rescue Exception => exp
					raise Exception, exp.to_s
				ensure
					File.delete('plan_numbers_and_cost') if File.exist?('plan_numbers_and_cost')
					system 'rm -rf ' + tmp_dir
				end

				return nil, nil
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
