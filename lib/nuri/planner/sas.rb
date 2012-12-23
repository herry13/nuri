module Nuri
	module Sas
		class Task
			attr_reader :variables, :mutexes, :operators, :axioms, :init, :goal
			attr_reader :global_variable, :global_operators
			attr_accessor :sas_plan

			GlobalVariable = 'global'
			GlobalOperator = 'globalop'
			GoalOperator = 'goal'

			def initialize(sas_file)
				f = File.new(sas_file, "r")
				### read version
				f.gets
				@version = f.gets.to_i
				f.gets
				### read metrix
				f.gets
				@metric = f.gets.to_i
				f.gets
				### read variables
				@variables = []
				total_variables = f.gets.to_i
				for i in 1..total_variables
					variable = Variable.new(:io => f, :index => i-1)
					@global_variable = variable if @global_variable.nil? and variable.is_global
					@variables << variable
				end
				### skip mutex
				total_mutex = f.gets.to_i
				@mutexes = []
				# TODO -- parse mutex
				total_mutex = 0
				begin line = f.gets; line.chop!; end until line == "begin_state"
				### read state
				@init = State.new
				for i in 0..(total_variables-1)
					@variables[i].init = @init[i] = f.gets.to_i
				end
				f.gets # end_state
				### read goal
				@goal = Goal.new(:io => f, :variables => @variables)
				### read operators
				@operators = []
				@global_operators = []
				total_operators = f.gets.to_i
				for i in 1..total_operators
					operator = Operator.new(:io => f, :variables => @variables)
					@operators << operator if not operator.is_global
					@global_operators << operator if operator.is_global
				end
				### read axiom
				@axioms = []
				total_axioms = f.gets.to_i
				for i in 1..total_axioms
					axiom = Axiom.new(:io => f, :variables => @variables)
					@axioms << axiom
				end
			end

			# Write the planning task to given IO object.
			# @param - io: an IO object
			def write_io(io)
				io.puts('begin_version', @version, 'end_version')
				io.puts('begin_metric', @metric, 'end_metric')
				io.puts(@variables.length)
				@variables.each { |variable| variable.write_io(io) }
				io.puts(@mutexes.length)
				@mutexes.each { |mutex| mutex.write_io(io) }
				@init.write_io(io)
				@goal.write_io(io)
				io.puts(@operators.length + @global_operators.length)
				@operators.each { |operator| operator.write_io(io) }
				@global_operators.each { |operator| operator.write_io(io) }
				io.puts(@axioms.length)
				@axioms.each { |axiom| axiom.write_io(io) }
			end

			# Return the partial-order workflow in JSON
			# @param - parser: Nuri::Sfp::Parser object
			# @return: workflow, initial operators' indexes, length
			def get_partial_order_workflow(parser)
				plan = self.to_partial_order
				return nil, nil, nil if plan.nil? # no-valid plan

				sfw = []
				init = []
				name_index = {}
				distance = plan.length
				plan.each_index do |i|
					op_name = plan[i].name.split(' ')[0]
					operator = parser.operators[op_name]
					raise Exception, 'Cannot find operator: ' + op_name if operator.nil?
					op_sfw = operator.to_sfw
					#op_sfw['id'] = i
					op_sfw['distance'] = distance
					op_sfw['successors'] = []
					op_sfw['predecessors'] = []
					sfw << op_sfw
					name_index[op_name] = i
					init << i if plan[i].predecessors.length <= 0
					distance -= 1
				end
				plan.each_index do |i|
					plan[i].predecessors.each do |op|
						op_name = op.name.split(' ')[0]
						j = name_index[op_name]
						sfw[j]['successors'] << i
						sfw[i]['predecessors'] << j
					end
				end
				return sfw, init, sfw.length
			end

			def final_state
				state = @init.clone
				self.collect_operators.each { |op| state.apply!(op) }
				final = []
				for i in 0..(state.length-1)
					final <<  {:id => i, :value => state[i]} if state[i] != @init[i]
				end
				return final
			end

			protected
			def self.is_global_variable?(variable_name)
				return variable_name.split('_')[2] == GlobalVariable
			end

			def self.is_global_operator?(operator_name)
				return (operator_name.split('-')[1] == GlobalOperator)
			end

			def self.is_goal_operator?(operator_name)
				return (operator_name.split('-')[1] == GoalOperator)
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
				if @global_operators.length <= 0
					return self.plan_without_trajectory_to_partial_order
				else
					return self.plan_with_trajectory_to_partial_order
				end
			end

			def collect_operators
				plan = []
				selected_operator = nil
				# get the operators
				@sas_plan.each do |name|
					if Task::is_global_operator?(name)
						if selected_operator != nil
							selected_operator.global_op = find_global_operator(name[1, name.length-2])
							raise Exception, 'not found: ' + name if selected_operator.global_op.nil?
						end
						selected_operator = nil
					elsif Task::is_goal_operator?(name)
						# TODO -- handle "goal-verifier" action for handling "sometime" constraint
					else
						selected_operator = find_operator(name[1, name.length-2])
						raise Exception, 'not found: ' + name if selected_operator.nil?
						plan << selected_operator
					end
				end
				# remove global variable from plan's operators
				plan.each { |op| op.remove_global_variable(@global_variable) }

				return plan
			end

			def set_predecessors(plan)
				(plan.length-1).downto(0) do |i|
					plan[i].prevails.each do |p|
						(i-1).downto(0) do |j|
							if plan[j].support_assignment?(p[:var], p[:prevail])
								plan[i].predecessors << plan[j]
								break
							end
						end
					end
					plan[i].pre_posts.each do |p|
						next if p[:pre] < 0
						(i-1).downto(0) do |j|
							if plan[j].support_assignment?(p[:var], p[:pre])
								plan[i].predecessors << plan[j]
								break
							end
						end
					end
				end
			end

			def remove_transitive_predecessors2(plan)
				# remove duplicates in predecessors list
				@operators.each { |op| op.predecessors.uniq! }

				# remove "transitive" directed-edge
				plan.each do |op1|
					valid_predecessors = []
					while op1.predecessors.length > 0
						op2 = op1.predecessors.pop
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
			end

			def remove_transitive_predecessors(plan)
				# foreach operator, remove duplicates in predecessors list
				@operators.each { |op| op.predecessors.uniq! }

				# remove "transitive" predecessor link
				plan.each do |op|
					valid_predecessors = []
					op.predecessors.each do |pred_op|
						valid_predecessors << pred_op if not op.has_transitive_predecessors?(pred_op)
					end
					op.predecessors = valid_predecessors
				end
			end

			def add_adversary_predecessors(plan)
				# search primary operators (the last operators that provide the goal)
				primary_ops = []
				@goal.each do |var|
					(plan.length-1).downto(0) do |i|
						if plan[i].support_assignment?(var, var.goal)
							primary_ops << [var, var.goal, i, plan[i]]
							break;
						end
					end
				end
				# search adversary operators (all operators that threat the goal)
				primary_ops.each do |variable, value, last_index, operator|
					(last_index-1).downto(0) do |j|
						next if operator == plan[j]
						operator.predecessors << plan[j] if plan[j].threat_assignment?(variable, value)
					end
				end
				#self.dump_predecessors(plan)
			end

			# given a state, find the first applicable "global" operator
			def is_state_satisfy_global?(state)
				@global_operators.each { |op| return op if state.applicable?(op) }
				return nil
			end

			def plan_with_trajectory_to_partial_order
begin
				# get the operators
				plan = collect_operators

				# supporting operators
				set_predecessors(plan)

				# adversary predecessors
				add_adversary_predecessors(plan)

				# fill-in blank-precondition (pre := -1) by simulating the plan
				states = simulate_plan(plan)

				# generate the stage-workflow
				stages, states = to_stage_workflow(plan, states)
				#puts '==> failed' if stages.nil?
				return nil if stages.nil?

				# generate the partial-order workflow
				if not stages.nil?
					to_partial_order_workflow(stages, states)
				end

				#stages.each { |stage|
				#	puts "-- stage -- "
				#	stage.each { |op| puts op.name }
				#}

				remove_transitive_predecessors(plan)

				return plan

rescue Exception => e
	$stderr.puts e.to_s
	$stderr.puts e.backtrace
end
				return nil
			end

			def set_global(state, valid=true)
				if valid
					state[@global_variable.index] = (@init[@global_variable.index] == 0 ? 1 : 0)
				else
					state[@global_variable.index] = @init[@global_variable.index]
				end
			end

			def to_partial_order_workflow(stages, states)
				# splitting -- add required predecessor-links between operators of two stages
				(stages.length-1).downto(1) do |i|
					current_stage = stages[i]
					prev_stage = stages[i-1]
					prev_prev_state = states[i-1]
					current_stage.each do |op1|
						prev_stage.each do |op2|
							if op1.predecessors.index(op2).nil?
								new_state = prev_prev_state.clone
								# generate the next state if "op2" is not included
								prev_stage.each { |op3| new_state.apply!(op3) if op3 != op2 }
								self.set_global(new_state, false)
								if self.is_state_satisfy_global?(new_state).nil?
									op1.predecessors << op2
								else
									new_state.apply!(op1)
									self.set_global(new_state, false)
									if self.is_state_satisfy_global?(new_state).nil?
										op1.predecessors << op2
									else
										#puts op2.name + " || " + op1.name
									end
								end
							end
						end

						has_predecessor = false
						prev_stage.each { |op2|
							has_predecessor = (not op1.predecessors.index(op2).nil?)
							break if has_predecessor
						}
						if not has_predecessor
							promotion = false
							if prev_prev_state.applicable?(op1) and not prev_stage.threaten?(op1)
								new_state = prev_prev_state.apply(op1)
								self.set_global(new_state, false)
								promotion = (not self.is_state_satisfy_global?(new_state).nil?)
							end

							if promotion
								prev_stage << op1
							else
								prev_stage.each { |op2| op1.predecessors << op2 }
							end
						end
					end
				end

				# promotion
			end

			def to_stage_workflow(plan, states)
begin
				current_state = states[states.length-1].clone
				operators = plan.reverse
				counter = 0
				stages = []
				states = []

				while not current_state.equals?(@init) and operators.length > 0 and counter < plan.length
					selected_ops, current_state = search_supporting_operators(current_state, operators)
					if selected_ops.length > 0
						stages << selected_ops
						selected_ops.each { |op| operators.delete(op) }
						states << current_state
					end
					counter += 1
				end

				return nil, nil if not current_state.equals?(@init)
				return stages.reverse, states.reverse
rescue Exception => e
	$stderr.puts e.to_s
	$stderr.puts e.backtrace
end
			end

			def search_supporting_operators(state, operators) #, selected_operators)
				selected_operators = OperatorLayer.new
				not_candidates = OperatorLayer.new
				candidates = OperatorLayer.new
				operators.each do |op|
					if state.applicable_reverse?(op) and
						   not candidates.threat?(op) and
						   not candidates.threat_reverse?(op) and
							not candidates.require?(op)
						candidates << op
					else
						not_candidates << op
					end
				end

				result_state = state.clone
				candidates.each do |op|
					if not_candidates.require?(op)
						not_candidates << op
					else
						new_state = state.apply_reverse(op)
						self.set_global(new_state, false)
						if not self.is_state_satisfy_global?(new_state).nil?
							new_result_state = result_state.apply_reverse(op)
							self.set_global(new_result_state, false)
							if not self.is_state_satisfy_global?(new_result_state).nil?
								result_state = new_result_state
								selected_operators << op
							end
						end
					end
				end
				return selected_operators, result_state
			end


			def simulate_plan(plan)
				state = @init.clone
				self.set_global(state, true)
				states = [state.clone]
				plan.each do |op|
					op.pre_posts.each { |p| p[:pre] = state[p[:var].index] if p[:pre] < 0 }
					state.apply!(op)
					state.apply!(op.global_op)
					states.push(state.clone)
				end
				return states
			end

			# Return the partial-order plan from a total-order plan kept in @sas_plan
			# with an assumption that the planning task does not have trajectory constraints
			#
			# @return - a partial-order plan
			def plan_without_trajectory_to_partial_order
				# get the operators
				plan = collect_operators

				# supporting operators
				set_predecessors(plan)
				#self.dump_predecessors(plan)

				# add adversary predecessors
				add_adversary_predecessors(plan)

				# remove transitive predecessors
				remove_transitive_predecessors(plan)

				return plan
			end

			def dump_predecessors(plan)
				puts "=== predecessors ==="
				plan.each { |op|
					puts op.name
					op.predecessors.each { |op2| puts "\t" + op2.name }
				}
			end

			# Test if the given state contains goal or not
			# @param - state: the state to be tested
			# @return True if the given state contains goal, otherwise False
			def at_goal?(state, details=false)
				# TODO -- test it
				if not details
					@goal.each { |var| return false if state[var.index] != var.goal }
					return true
				else
					valid = true
					@goal.each do |var|
						if state[var.index] != var.goal
							#puts var.name + ': ' + state[var.index].to_s + ' - ' + var.goal.to_s
							valid = false
						end
					end
					return valid
				end
			end
		end

		class OperatorLayer < Array
			def applied_to(state)
				self.each { |op| return false if not state.apply!(op) }
				return true
			end

			def applied_reverse_to(state)
				self.each { |op| state.apply_reverse!(op) }
			end

			def threaten?(operator)
				self.each { |op| return true if operator.threat?(op) }
				return false
			end

			def threat?(operator)
				self.each { |op| return true if op.threat?(operator) }
				return false
			end

			def threat_reverse?(operator)
				self.each { |op| return true if op.threat_reverse?(operator) }
				return false
			end

			def support?(operator)
				self.each { |op| return true if op.support?(operator) }
				return false
			end

			# an operator is required iff there's a casual to any operator in this layer
			def require?(operator)
				self.each { |op| return true if not op.predecessors.index(operator).nil? }
				return false
			end
		end

		class Operator
			attr_reader :name, :prevails, :pre_posts, :cost, :is_global
			attr_accessor :predecessors # all-operators that preceed 'self'
			attr_accessor :global_op
			attr_accessor :sfw_operator

			def initialize(params={})
				if params.has_key?(:io)
					self.read_io(params[:io], params[:variables])
				else
					self.read_parameters(params)
				end
				@predecessors = []
				@is_global = Task.is_global_operator?(@name)
			end

			def has_transitive_predecessors?(operator)
				@predecessors.each do |pre_op|
					return true if pre_op != operator and
					               pre_op.has_predecessor?(operator)
				end
				return false
			end

			def has_predecessor?(operator)
				if not @predecessors.index(operator).nil?
					return true
				else
					@predecessors.each { |op| return true if op.has_predecessor?(operator) }
				end
				return false
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

			def support_assignment?(variable, value)
				return true if value < 0
				@pre_posts.each do |p|
					return true if p[:var] == variable and p[:post] == value
				end
				return false
			end

			def threat_assignment?(variable, value)
				return false if value < 0
				@pre_posts.each do |p|
					return true if p[:var] == variable and p[:post] != value
				end
				return false
			end

			def threat_prevails?(prevails)
				return false if prevails.length <= 0 or pre_posts.length <= 0
				prevails.each do |p1|
					@pre_posts.each do |p2|
						if p1[:var] == p2[:var]
							#begin puts p1[:var].name + '>>' + p1[:prevail].to_s + ' ' + p2[:post].to_s; return true; end if p1[:prevail] != p2[:post]
							return true if p1[:prevail] != p2[:post]
						end
					end
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
				@pre_posts.each do |p1|
					operator.prevails.each { |p2|
						if p1[:var] == p2[:var] and p1[:post] != p2[:prevail]
							#puts "\t" + self.name + " -- " + operator.name
							#puts "\t" + p1[:var].name + " p1:" + p1[:post].to_s + " p2:" + p2[:prevail].to_s
							return true
						end
					}
					operator.pre_posts.each { |p2| return true if p1[:var] == p2[:var] and p1[:post] != p2[:post] }
				end
				return false
			end

			def threat_reverse?(operator)
				@pre_posts.each do |p1|
					operator.prevails.each { |p2|
						return true if p1[:var] == p2[:var] and p1[:pre] != p2[:prevail]
					}
					operator.pre_posts.each { |p2|
						return true if p1[:var] == p2[:var] and p1[:pre] != p2[:pre]
					}
				end
				return false
			end

			def remove_global_variable(var)
				@pre_posts.delete_if { |p| p[:var] == var }
			end

			def write_io(io)
				io.puts('begin_operator', @name, @prevails.length.to_s)
				@prevails.each { |p| io.puts(p[:var].index.to_s + ' ' + p[:prevail].to_s) }
				io.puts(@pre_posts.length.to_s)
				@pre_posts.each { |p| io.puts('0 ' + p[:var].index.to_s + ' ' + p[:pre].to_s + ' ' + p[:post].to_s) }
				io.puts(@cost, 'end_operator')
			end

			def dump
				puts @name
				@prevails.each { |p| print p[:var].index.to_s + '=' + p[:prevail].to_s + ";" }
				puts '' if @prevails.length > 0
				@pre_posts.each { |p| print p[:var].index.to_s + '=' + p[:pre].to_s + ',' + p[:post].to_s + ';' }
				puts ''
				#puts @cost
			end

			protected
			def read_io(io, variables)
				io.gets # begin_operator
				@name = io.gets.chop
				@prevails = []
				for j in 1..io.gets.to_i
					tuple = io.gets.split(' ')
					@prevails << { :var => variables[tuple[0].to_i],
					               :prevail => tuple[1].to_i }
				end
				@pre_posts = []
				for j in 1..io.gets.to_i
					tuple = io.gets.split(' ')
					@pre_posts << { :var => variables[tuple[1].to_i],
					                :pre => tuple[2].to_i,
					                :post => tuple[3].to_i }
				end
				@cost = io.gets.to_i
				io.gets # end_operator
			end

			def read_parameters(params) #name, prevails, pre_posts, cost, is_global=false)
				@name = params[:name]
				@prevails = params[:prevails]
				@pre_posts = params[:pre_posts]
				@cost = params[:cost]
			end
		end

		class Axiom < Operator
			def initialize(params={})
				if params.has_key?(:io)
					self.read_io(params[:io], params[:variables])
				else
					self.read_parameters(params)
				end
				@predecessors = []
				@is_global = false
			end

			def write_io(io)
				io.puts('begin_rule', @prevails.length)
				@prevails.each { |p| io.puts(p[:var].index.to_s + ' ' + p[:prevail].to_s) }
				@pre_posts.each { |p| io.puts(p[:var].index.to_s + ' ' + p[:pre].to_s + ' ' + p[:post].to_s) }
				io.puts('end_rule')
			end

			protected
			def read_io(io, variables)
				io.gets # begin_rule
				@name = :axiom
				prevails = []
				for j in 1..io.gets.to_i
					tuple = io.gets.split(' ')
					prevails << { :var => variables[tuple[0].to_i],
					              :prevail => tuple[1].to_i }
				end
				pre_posts = []
				tuple = io.gets.split(' ')
				pre_posts << { :var => variables[tuple[0].to_i],
				               :pre => tuple[1].to_i,
				               :post => tuple[2].to_i }
				io.gets # end_rule
			end

			def read_parameters(params) #name, prevails, pre_posts)
				@name = params[:name]
				@prevails = params[:prevails]
				@pre_posts = params[:pre_posts]
				@cost = 0
			end
		end

		class State < Array
			def write_io(io)
				io.puts('begin_state')
				for i in 0..(self.length-1)
					io.puts(self[i])
				end
				io.puts('end_state')
			end

			def apply_reverse!(operator, do_check=false)
				return false if do_check and not self.applicable_reverse?(operator)
				operator.pre_posts.each { |p| return false if p[:pre] < 0 }
				operator.pre_posts.each { |p| self[p[:var].index] = p[:pre] }
				return true
			end

			def apply_reverse(operator, do_check=false)
				return nil if do_check and not self.applicable_reverse?(operator)
				state = self.clone
				state.apply_reverse!(operator)
				return state
			end

			def apply!(operator, do_check=false)
				return false if do_check and not self.applicable?(operator)
				operator.pre_posts.each { |p| self[p[:var].index] = p[:post] }
				return true
			end

			def apply(operator, do_check=false)
				return nil if do_check and not self.applicable?(operator)
				state = self.clone
				state.apply!(operator)
				return state
			end

			def applicable_reverse?(operator)
				operator.prevails.each { |p| return false if self[p[:var].index] != p[:prevail] }
				operator.pre_posts.each { |p| return false if self[p[:var].index] != p[:post] }
				return true
			end

			def applicable?(operator)
				operator.prevails.each { |p| return false if self[p[:var].index] != p[:prevail] }
				operator.pre_posts.each { |p| return false if p[:pre] >= 0 and self[p[:var].index] != p[:pre] }
				return true
			end

			def clone
				state = State.new
				for i in 0..(self.length-1)
					state[i] = self[i]
				end
				return state
			end

			def satisfy?(goal)
				goal.each { |var| return false if self[var.index].to_i != var.goal.to_i }
				return true
			end

			def equals?(state)
				return false if state.length != self.length
				for i in 0..(self.length-1)
					return false if self[i] != state[i]
				end
				return true
			end

			def dump
				for i in 0..(self.length-1)
					print i.to_s + '=' + self[i].to_s + ','
				end
				puts ''
			end
		end

		class Goal < Array
			def initialize(params={})
				if params.has_key?(:io)
					self.read_io(params[:io], params[:variables])
				end
			end

			def write_io(io)
				io.puts('begin_goal')
				io.puts(self.length)
				self.each { |var| io.puts(var.index.to_s + ' ' + var.goal.to_s) }
				io.puts('end_goal')
			end

			def dump
				self.each { |var| print var.index.to_s + '=' + var.goal.to_s + ',' }
				puts ''
			end

			protected
			def read_io(io, variables)
				io.gets # begin_goal
				total = io.gets.to_i
				for i in 1..total
					tuple = io.gets.split(' ')
					variable = variables[tuple[0].to_i]
					variable.goal = tuple[1].to_i
					self << variable
				end
				io.gets # end_goal
			end
		end

		class Prevail
			attr_accessor :var, :prevail
		end

		class PrePost
			attr_accessor :var, :pre, :post
		end

		class Variable
			attr_accessor :init, :goal
			attr_reader :name, :axiom_layer, :length, :is_global, :index

			def initialize(params={})
				if params.has_key?(:io)
					self.read_io(params[:io])
				else
					self.read_parameters(params)
				end
				@is_global = Task::is_global_variable?(@name)
				@index = params[:index]
			end

			def write_io(io)
				io.puts('begin_variable')
				io.puts(@name)
				io.puts(@axiom_layer.to_s)
				io.puts(@length.to_s)
				for i in 0..(@length-1)
					io.puts(i)
				end
				io.puts('end_variable')
			end

			protected
			def read_io(io)
				io.gets # begin_variable
				@name = io.gets.chop
				@axiom_layer = io.gets.to_i
				@length = io.gets.to_i
				for j in 1..@length
					io.gets
				end
				io.gets # end_variable
			end

			def read_parameters(params)
				@name = params[:name]
				@axiom_layer = params[:axiom_layer]
				@length = params[:length]
				@init = @goal = -1
				@is_global = false
			end
		end

	end
end

if __FILE__ == $0
	sas = Nuri::Sas::Task.new($1)
end
