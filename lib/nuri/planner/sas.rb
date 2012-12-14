module Nuri
	module Sas
		class Task
			attr_reader :variables, :operators, :axioms, :init, :goal
			attr_reader :global_variable, :global_operators
			attr_accessor :sas_plan

			GlobalVariable = 'global'
			GlobalOperator = 'globalop'

			def initialize(sas_file)
				f = File.new(sas_file, "r")
				begin line = f.gets; line.chop!; end until line == "end_metric"
				### read variables
				@variables = []
				total_variables = f.gets.to_i
				for i in 1..total_variables
					f.gets # begin_variable
					name = f.gets.chop
					axiom_layer = f.gets.to_i
					length = f.gets.to_i
					for j in 1..length
						f.gets
					end
					f.gets # end_variable
					is_global = (@global_variable == nil and name.split('_')[2] == GlobalVariable)
					variable = Variable.new(@variables.length, name, axiom_layer, length, is_global)
					@global_variable = variable if variable.is_global
					@variables << variable
				end
				### skip mutex
				begin line = f.gets; line.chop!; end until line == "begin_state"
				### read state
				@init = State.new
				for i in 0..(total_variables-1)
					@variables[i].init = @init[i] = f.gets.to_i
				end
				f.gets # end_state
				### read goal
				f.gets # begin_goal
				@goal = []
				total_goal = f.gets.to_i
				for i in 1..total_goal
					tuple = f.gets.split(' ')
					var = @variables[tuple[0].to_i]
					var.goal = tuple[1].to_i
					@goal << var
				end
				f.gets # end_goal
				### read operators
				@operators = []
				@global_operators = []
				total_operators = f.gets.to_i
				for i in 1..total_operators
					f.gets # begin_operator
					name = f.gets.chop
					prevails = []
					for j in 1..f.gets.to_i
						tuple = f.gets.split(' ')
						prevails << { :var => @variables[tuple[0].to_i],
						              :prevail => tuple[1].to_i }
					end
					pre_posts = []
					for j in 1..f.gets.to_i
						tuple = f.gets.split(' ')
						pre_posts << { :var => @variables[tuple[1].to_i],
						               :pre => tuple[2].to_i,
						               :post => tuple[3].to_i }
					end
					cost = f.gets.to_i
					f.gets # end_operator
					is_global = Task::is_global_operator(name) # (name.split('-')[1] == GlobalOperator)
					operator = Operator.new(name, prevails, pre_posts, cost, is_global)
					@operators << operator if not operator.is_global
					@global_operators << operator if operator.is_global
				end
				### read axiom
				@axioms = []
				total_axioms = f.gets.to_i
				for i in 1..total_axioms
					f.gets # begin_rule
					prevails = []
					for j in 1..f.gets.to_i
						tuple = f.gets.split(' ')
						prevails << { :var => @variables[tuple[0].to_i],
						              :prevail => tuple[1].to_i }
					end
					pre_posts = []
					tuple = f.gets.split(' ')
					pre_posts << { :var => @variables[tuple[0].to_i],
					               :pre => tuple[1].to_i,
					               :post => tuple[2].to_i }
					@operators << Operator.new(:axiom, prevails, pre_posts, 0)
					f.gets # end_rule
				end
			end

			def self.is_global_operator(name)
				return (name.split('-')[1] == GlobalOperator)
			end

			def find_operator(name)
				@operators.each { |op| return op if op.name == name }
				return nil
			end

			def find_global_operator(name)
				@global_operators.each { |op| return op if op.name == name }
				return nil
			end

			def to_partial_order
				#puts "sas_plan: " + @sas_plan.inspect
				# get the operators
				plan = []
				selected_operator = nil
				@sas_plan.each do |name|
					if Task::is_global_operator(name)
						if selected_operator != nil
							selected_operator.global_op = find_global_operator(name[1, name.length-2])
							raise Exception, 'not found: ' + name if selected_operator.global_op == nil
						end
						selected_operator = nil
					else
						selected_operator = find_operator(name[1, name.length-2])
						raise Exception, 'not found: ' + name if selected_operator == nil
						plan << selected_operator
					end
				end

				# remove global variable from plan's operators
				plan.each { |op| op.remove_global_variable(@global_variable) }

				# supporting operators
				(plan.length-1).downto(0) do |i|
					plan[i].prevails.each do |p|
						(i-1).downto(0) do |j|
							if plan[j].support_variable?(p[:var], p[:prevail])
								plan[i].predecessors << plan[j]
								#puts plan[j].name + " => " + plan[i].name
								break
							end
						end
					end
					plan[i].pre_posts.each do |p|
						next if p[:pre] < 0
						(i-1).downto(0) do |j|
							if plan[j].support_variable?(p[:var], p[:pre])
								plan[i].predecessors << plan[j]
								#puts plan[j].name + " => " + plan[i].name
								break
							end
						end
					end
				end
				self.dump_predecessors(plan)

				# search primary operators (the last operators that provide the goal)
				primary_ops = []
				@goal.each do |var|
					(plan.length-1).downto(0) do |i|
						if plan[i].support_variable?(var, var.goal)
							primary_ops << [var, var.goal, i, plan[i]]
							break;
						end
					end
				end
				# search adversary operators (all operators that threat the goal)
				primary_ops.each do |variable, value, last_index, operator|
					(last_index-1).downto(0) do |j|
						next if operator == plan[j]
						operator.predecessors << plan[j] if plan[j].threat_variable?(variable, value)
					end
					#puts 'prim: ' + operator.name
				end
				self.dump_predecessors(plan)

				# global state (always) is a DNF formula
				# two operators can be in parallel iff:
				# 1) both are mutually exclusive
				# 2) both support the same part of DNF-formula
				(plan.length-1).downto(0) do |i|
					(i-1).downto(0) do |j|
						if not self.parallel?(plan[i], plan[j])
							plan[i].predecessors << plan[j]
							puts plan[i].name + " not-parallel " + plan[j].name
						end
					end
				end
				self.dump_predecessors(plan)
			
				# remove duplicates in predecessors list
				@operators.each { |op| op.predecessors.uniq! }

				# remove "transitive" directed-edge (p => q means that operator p preceeds q)
				plan.each do |op1|
					valid_predecessors = []
					while op1.predecessors.length > 0
						op2 = op1.predecessors.shift
						valid = true
						op1.predecessors.each do |op3|
							if op3.predecessors.index(op2) != nil
								valid = false
								break
							end
						end
						valid_predecessors << op2 if valid
					end
					op1.predecessors = valid_predecessors
				end
				self.dump_predecessors(plan)

				return plan
			end

			def parallel?(op1, op2)
				return false if not op1.mutex?(op2)
=begin
				pre_posts = []
				op1.pre_posts.each { |p| pre_posts << [p[:var], p[:post]] }
				op2.pre_posts.each { |p| pre_posts << [p[:var], p[:post]] }
				@global_operators.each do |op|
					threat = false
					op.prevails.each do |p|
						if op1.threat_variable?(p[:var], p[:prevail]) or
								op2.threat_variable?(p[:var], p[:prevail])
							threat = true
							break
						end
					end
					if not threat
						puts op1.name + "||" + op2.name + " << " + op.name
						return true
					end
				end
=end
				puts op1.name + ": " + op1.global_op.name + " -- " + op2.name + ": " + op2.global_op.name
				return true
			end

			def get_partial_order_workflow(parser)
				plan = self.to_partial_order
				sfw = []
				init = []
				name_index = {}
				plan.each_index do |i|
					op_name = plan[i].name.split(' ')[0]
					operator = parser.operators[op_name]
					raise Exception, 'Cannot find operator: ' + op_name if operator == nil
					op_sfw = operator.to_sfw
					op_sfw['successor'] = []
					sfw << op_sfw
					name_index[op_name] = i
					init << i if plan[i].predecessors.length <= 0
				end
				plan.each_index do |i|
					plan[i].predecessors.each do |op|
						op_name = op.name.split(' ')[0]
						j = name_index[op_name]
						sfw[j]['successor'] << i
					end
				end
				#return sfw, init, sfw.length
				return [], [], 0
			end

			def dump_predecessors(plan)
				puts "=== predecessors ==="
				plan.each { |op|
					puts op.name
					op.predecessors.each { |op2| puts "\t" + op2.name }
				}
			end

			def at_goal?(state)
				# TODO -- test it
				@goal.each { |var| return false if state[var.index] != var.goal }
				return true
			end
		end

		class Operator
			attr_reader :name, :prevails, :pre_posts, :cost
			attr_reader :is_global
			attr_accessor :predecessors # all-operators that preceed 'self'
			attr_accessor :global_op
			attr_accessor :sfw_operator

			def initialize(name, prevails, pre_posts, cost, is_global=false)
				@name = name
				@prevails = prevails
				@pre_posts = pre_posts
				@cost = cost
				@is_global = is_global
				@predecessors = []
			end

			def support?(operator)
				# TODO -- test it
				@pre_posts.each do |p1|
					operator.prevails.each { |p2|
						return true if p1[:var] == p2[:var] and
						               p1[:post] == p2[:prevail]
					}
					operator.pre_posts.each { |p2|
						return true if p2[:pre] >= 0 and
               	               p1[:var] == p2[:var] and
					                  p1[:post] == p2[:pre]
					}
				end
				return false
			end

			def support_variable?(variable, value)
				return true if value < 0
				@pre_posts.each do |p|
					return true if p[:var] == variable and p[:post] == value
				end
				return false
			end

			def threat_variable?(variable, value)
				return false if value < 0
				@pre_posts.each do |p|
					return true if p[:var] == variable and p[:post] != value
				end
				return false
			end

			def mutex?(operator)
				# TODO -- test it
				@prevails.each do |p1|
					operator.pre_posts.each { |p2| return false if p1[:var] == p2[:var] }
				end
				@pre_posts.each do |p1|
					operator.prevails.each { |p2| return false if p1[:var] == p2[:var] }
					operator.pre_posts.each { |p2| return false if p1[:var] == p2[:var] and p1[:post] != p2[:post] }
				end
				return true
			end

			def threat?(operator)
				# TODO -- test it
				@pre_posts.each do |p1|
					operator.prevails.each { |p2|
						if p1[:var] == p2[:var] and p1[:post] != p2[:prevail]
							puts "\t" + self.name + " -- " + operator.name
							puts "\t" + p1[:var].name + " p1:" + p1[:post].to_s + " p2:" + p2[:prevail].to_s
							return true
						end
					}
					operator.pre_posts.each { |p2| return true if p1[:var] == p2[:var] and p1[:post] != p2[:post] }
				end
				return false
			end

			def remove_global_variable(var)
				@pre_posts.delete_if { |p| p[:var] == var }
			end
		end

		class Axiom < Operator
			def initialize(name, prevails, pre_posts)
				@name = name
				@prevails = prevails
				@pre_posts = pre_posts
				@cost = 0
			end
		end

		class State < Array
			def apply(operator, do_check=false)
				# TODO -- test it
				return false if do_check and not self.applicable?(operator)
				operator.each { |p| self[p[:var].index] = p[:post] }
				return true
			end

			def applicable?(operator)
				# TODO -- test it
				operator.prevails.each { |p| return false if self[p[:var].index] != p[:prevail] }
				operator.pre_posts.each { |p| return false if p[:pre] >= 0 and self[p[:var].index] != p[:pre] }
				return true
			end

			def clone
				# TODO -- test it
				state = State.new
				for i in 0..(self.length-1)
					state[i] = self[i]
				end
				return state
			end
		end

		class Variable
			attr_accessor :init, :goal
			attr_reader :index, :name, :axiom_layer, :length, :is_global

			def initialize(index, name, axiom_layer, length, is_global)
				@index = index
				@name = name
				@axiom_layer = axiom_layer
				@length = length
				@init = @value = @goal = -1
				@is_global = is_global
			end
		end


	end
end

#Nuri::Sas::Task.new(ARGV[0])
