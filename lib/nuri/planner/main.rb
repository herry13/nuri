module Nuri
	module Planner
		class Solver
			def initialize
			end
	
			# solve given configuration problem
			# return JSON representation of plan if solution is found, otherwise nil
			def solve(problem)
				parser = Nuri::Sfp::Parser.new
				parser.parse(problem)
				return solve_sas(parser.to_sas)
			end
	
			# solve the configuration problem in given file
			# return JSON representation of plan if solution is found, otherwise nil
			def solve_file(file)
				parser = Nuri::Sfp::Parser.new
				parser.parse_file(file)
				return solve_sas(parser.to_sas)
			end

			private
			def solve_sas(sas)
				os = Nuri::Util.os
				dir = Nuri::Util.temp_dir + '/nuri_' + (rand * 100000).to_i.abs.to_s
				sas_file = dir + '/problem.sas'
				plan_file = dir + '/out.plan'
				cmd = ''
				case os
					when 'linux'
						planner = File.dirname(__FILE__) + '/linux/planner'
						cmd = planner + ' ' + sas_file + ' ' + plan_file + ' &> /dev/null'
					when 'macos'
						planner = File.dirname(__FILE__) + '/macos/planner'
						cmd = planner + ' ' + sas_file + ' ' + plan_file + ' &> /dev/null'
					else
						raise UnsupportedPlatformException, 'Platform ' + os + ' is not supported'
				end

				begin
					# create temporary directory
					Dir.mkdir(dir) if not File.exist?(dir)
					# dump SAS+ problem
					File.open(sas_file, 'w') { |f|
						f.write(sas)
					}
					system cmd
					plan = File.read(plan_file) if File.exist?(plan_file)
					File.delete(sas_file)
					File.delete(plan_file) if File.exist?(plan_file)
					Dir.delete(dir)
					return plan
				rescue Exception => exp
					puts 'Planner error: ' + exp.to_s
					system 'rm -rf ' + dir
				end
				return nil
			end
		end
	
		class UnsupportedPlatformException < Exception
		end
	end
end
