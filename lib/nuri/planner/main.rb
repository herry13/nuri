module Nuri
	module Planner
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
				@parser = Nuri::Sfp::Parser.new(root)
				return solve_sas(@parser.to_sas)
			end

			# solve the configuration problem in given file
			# return JSON representation of plan if solution is found, otherwise nil
			def solve_file(file)
				begin
					@parser = Nuri::Sfp::Parser.new
					@parser.parse_file(file)
					return solve_sas(@parser.to_sas)
				rescue Exception => e
					$stderr.puts e.to_s
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
				os = Nuri::Util.os
				dir = Nuri::Util.temp_dir + '/nuri_' + (rand * 100000).to_i.abs.to_s
				sas_file = dir + '/problem.sas'
				plan_file = dir + '/out.plan'
				cmd = ''
				case os
					when 'linux'
						planner = File.dirname(__FILE__) + '/linux/planner'
						cmd = planner + ' ' + sas_file + ' ' + plan_file
					when 'macos'
						planner = File.dirname(__FILE__) + '/macos/planner'
						cmd = planner + ' ' + sas_file + ' ' + plan_file
					else
						raise UnsupportedPlatformException, 'Platform ' + os + ' is not supported'
				end

				begin
					# create temporary directory
					Dir.mkdir(dir) if not File.exist?(dir)
					# dump SAS+ problem
					File.open(sas_file, 'w') do |f|
						f.write(sas)
					end
					Kernel.system(cmd)
					plan = File.read(plan_file) if File.exist?(plan_file)
					plan = to_partial_order(plan) if plan != nil

					File.delete(sas_file)
					File.delete(plan_file) if File.exist?(plan_file)
					Dir.delete(dir)

					return plan
				rescue Exception => exp
					$stderr.puts 'Planner error: ' + exp.to_s
					system 'rm -rf ' + dir
				end
				return nil
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
