require 'nuri/sfp/main'

module Nuri
	module Planner
		Heuristic = 'ff'

		class Solver
			attr_reader :parser

			def initialize
			end
	
			# solve given configuration problem
			# return JSON representation of plan if solution is found, otherwise nil
			def solve(problem)
				@parser = Nuri::Sfp::Parser.new
				@parser.parse(problem)
				return solve_sas(@parser.to_sas)
			end

			def solve_sfp(root)
				@parser = Nuri::Sfp::Parser.new
				@parser.root = root

				return solve_sas(@parser.to_sas)
			end

			def solve_sfp_to_json(root)
				plan = self.solve_sfp(root)
				return sequential_plan_to_json(plan)
			end

			def solve_sfp_to_sfw(root)
				plan = self.solve_sfp(root)
				return sequential_plan_to_sfw(plan)
			end

			def sequential_plan_to_json(seq)
				sfw = self.sequential_plan_to_sfw(seq)
				return nil if sfw['workflow'] == nil
				return JSON.pretty_generate(sfw)
			end

			def sequential_plan_to_sfw(seq)
puts seq
				plan = { 'type'=>'sequential', 'workflow'=>nil, 'version'=>'1', 'total'=>0 }
				return plan if seq == nil
				plan['workflow'] = []
				seq.each do |line|
					op_name = line[1, line.length-2].split(' ')[0]
					operator = @parser.operators[op_name]
					raise Exception, 'Cannot find operator: ' + op_name if operator == nil
					plan['workflow'] << operator.to_sfw
				end
				plan['total'] = plan['workflow'].length
				return plan
			end

			# solve the configuration problem in given file
			# return JSON representation of plan if solution is found, otherwise nil
			def solve_file(file)
				begin
					@parser = Nuri::Sfp::Parser.new
					@parser.parse_file(file)
					return solve_sas(@parser.to_sas)
				rescue Exception => e
					return nil
				end
			end

			private
			def to_partial_order(sas_plan)
				# TODO -- transform total-order plan to partial-order plan
				actions = Array.new
				sas_plan.split("\n").each { |a|
					op_name = a[1,a.length-2].split(' ')[0]
					actions << Action.new(@parser.operators[op_name])
				}
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

				params = case
					when 'lmcut' then '--search "astar(lmcut())"'
					when 'blind' then '--search "astar(blind())"'
					when 'cg' then '--search "lazy_greedy(cg(), preferred=cg())"'
					else '--heuristic "hff=ff()" --search "lazy_greedy(hff, preferred=hff)"'
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
						when 'linux' then "#{planner}/preprocess < #{sas_file} | #{planner}/downward #{params} --plan-file #{plan_file} 1> /dev/null 2> /dev/null"
						when 'macos', 'darwin' then "cd #{tmp_dir}; #{planner}/preprocess < #{sas_file} 1> /dev/null; #{planner}/downward #{params} --plan-file #{plan_file} < #{tmp_dir}/output 1> /dev/null;"
						else nil
					end

					Kernel.system(command)
					plan = (File.exist?(plan_file) ? File.read(plan_file) : nil)
					plan = to_partial_order(plan) if plan != nil

					File.delete(sas_file)
					File.delete(plan_file) if File.exist?(plan_file)
					File.delete('plan_numbers_and_cost') if File.exist?('plan_numbers_and_cost')

					if plan != nil
						plan.each_index do |i|
							plan.delete_at(i) if	(plan[i] =~ /op_[0-9]+\-goal_[0-9]+/) != nil
							plan.delete_at(i) if (plan[i] =~ /op_[0-9]+\-sometime.*/) != nil
							plan.delete_at(i) if (plan[i] =~ /op_[0-9]+\-globalop/) != nil
						end
					end

					return plan
				rescue Exception => exp
					raise Exception, exp.to_s
				ensure
					system 'rm -rf ' + tmp_dir
				end

				nil
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
	end
end
