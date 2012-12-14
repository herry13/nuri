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
			# return an SAS plan if solution is found, otherwise nil
			def solve(problem)
				@parser = Nuri::Sfp::Parser.new
				@parser.parse(problem)
				@plan, @sas_task = solve_sas(@parser.to_sas)
				return @plan
			end

			def solve_sfp(root)
				@parser = Nuri::Sfp::Parser.new
				@parser.root = root
				@plan, @sas_task = solve_sas(@parser.to_sas)
				return @plan
			end

			def solve_sfp_to_json(root, options={:parallel=>false})
				sfw = solve_sfp_to_sfw(root, options)
				return nil if sfw == nil or sfw['workflow'] == nil
				return JSON.pretty_generate(sfw)
			end

			def solve_sfp_to_bsig(root, options={:parallel=>true})
				sfw = solve_sfp_to_sfw(root, options)
				# TODO -- remove parameters from each action
				return JSON.pretty_generate(sfw)
			end

			def solve_sfp_to_sfw(root, options={:parallel=>false})
				plan = self.solve_sfp(root)
				if options[:parallel]
					return parallel_plan_to_sfw
				else
					return sequential_plan_to_sfw
				end
			end

			# solve the configuration problem in given file
			# return JSON representation of plan if solution is found, otherwise nil
			def solve_file(file)
				begin
					@parser = Nuri::Sfp::Parser.new
					@parser.parse_file(file)
					@plan, @sas_task = solve_sas(@parser.to_sas)
					return @plan
				rescue Exception => e
					Nuri::Util.log e.to_s
				end
				nil
			end

			def solve_file_to_sfw(file, options={:parallel=>false})
				self.solve_file(file)
				return nil if @plan == nil
				return parallel_plan_to_sfw if options[:parallel]
				return sequential_plan_to_sfw
			end

			private
			def sequential_plan_to_sfw
				sfw = { 'type'=>'sequential', 'workflow'=>nil, 'version'=>'1', 'total'=>0 }
				return sfw if @plan == nil
				sfw['workflow'] = []
				@plan.each do |line|
					op_name = line[1, line.length-2].split(' ')[0]
					operator = @parser.operators[op_name]
					raise Exception, 'Cannot find operator: ' + op_name if operator == nil
					sfw['workflow'] << operator.to_sfw
				end
				sfw['total'] = sfw['workflow'].length
				return sfw
			end

			def parallel_plan_to_sfw
				sfw = {'type'=>'parallel', 'workflow'=>nil, 'init'=>nil, 'version'=>'1', 'total'=>0}
				return sfw if @plan == nil
				sfw['workflow'], sfw['init'], sfw['total'] = @sas_task.get_partial_order_workflow(@parser)
				return sfw
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
