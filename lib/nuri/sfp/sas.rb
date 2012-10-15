# 14-10-2012
# - find and reduce the domain of immutable variables
#
# 12-10-2012
# - support CLASS enumerator
#
# 01-09-2012
# - support IN/NOT-IN SET constraint
# - support ARRAY data-structure, index operator
#
# 29-08-2012
# - support EQUALS, NOT-EQUALS, AND, OR, IF-THEN constraints
#
# 23-08-2012
# - grounding procedure's parameters to produce operator
# - normalize and apply global constraint to all operators
#
# 01-07-2012
# - collecting classes and variables
# - foreach subclasses, inherits attributes and procedures from superclass
# - foreach objects, inherits attributes and procedures from class

module Nuri
	module Sfp

		def self.null_of(class_ref=nil)
			return { '_context' => 'null', '_isa' => class_ref } if class_ref.is_a?(String) and
				class_ref != '' and class_ref.isref
			return nil
		end

		# include 'Sas' module to enable processing Sfp into Finite-Domain Representation (FDR)
		#
		# TODO:
		# - nested reference on right-side statement (value of EQUALS/NOT-EQUALS)
		# - a first-order logic formula
		# - enumeration of values of particular type
		# - SET abstract data-type, membership operators
		module Sas
			GlobalOperator = '_global_op'
			GlobalVariable = '_global_var'

			GlobalConstraintMethod = 2 # 1: proposed method, 2: patrik's

			attr_accessor :root, :variables, :types, :operators, :axioms

			def to_sas
begin
				@arrays = Hash.new

				if @parser_arrays != nil
					@parser_arrays.each do |k,v|
						first, rest = k.explode[1].explode
						next if rest == nil
						@arrays['$.' + rest.to_s] = v
					end
				end

				return nil if @root == nil
				return nil if not @root.has_key?('initial') or not @root.has_key?('goal')

				@variables = Hash.new
				@types = { 'Boolean' => [true, false],
					'Number' => Array.new,
					'String' => Array.new
				}
				@operators = Hash.new
				@axioms = Array.new

				@g_operators = []

				# collect classes
				#self.collect_classes
			
				# unlink 'initial', 'goal', 'global' with root
				@root['initial'].delete('_parent')
				@root['goal'].delete('_parent')
				if @root['goal'].has_key?('always')
					@root['global'] = @root['goal']['always']
					@root['goal'].delete('always')
					@root['global']['_self'] = 'global'
					@root['global']['_type'] = 'and'
				end
				@root['global'].delete('_parent') if @root.has_key?('global')

				if @root['goal'].has_key?('sometime')
					@root['sometime'] = @root['goal']['sometime']
					@root['goal'].delete('sometime')
					@root['sometime']['_type'] = 'or'
					@root['sometime'].delete('_parent')
				end

				if @root['goal'].has_key?('sometime-after')
					@root['sometime-after'] = @root['goal']['sometime-after']
					@root['goal'].delete('sometime')
					@root['sometime-after'].delete('_parent')
				end

				### collect variables ###
				@root['initial'].accept(VariableCollector.new(self))

				### collect values ###
				# collect values from goal constraint
				value_collector = Nuri::Sfp::ValueCollector.new(@types)
				@root['goal'].accept(value_collector) if @root.has_key?('goal') and
						@root['goal'].isconstraint
				# collect values from global constraint
				@root['global'].accept(value_collector) if @root.has_key?('global') and
						@root['global'].isconstraint
				# collect values from sometime constraint
				@root['sometime'].accept(value_collector) if @root.has_key?('sometime')

				# remove duplicates from type's set of value
				@types.each_value { |type| type.uniq! }
				# set domain values for each variable
				self.set_variable_values

				# identify immutable variables
				self.identify_immutable_variables

				### process goal constraint ###
				process_goal(@root['goal']) if @root.has_key?('goal') and
						@root['goal'].isconstraint

#puts 'normalize global constraint...'
				self.process_global_constraint
#puts '...finish'

				### normalize sometime formulae ###
				if @root.has_key?('sometime')
					raise Exception, 'Invalid sometime constraint' if
						not normalize_formula(@root['sometime'])
				end

#puts 'process procedures...'
				### process all procedures
				@variables.each_value { |var|
					if var.is_final
						var.init.each { |k,v|
							process_procedure(v, var.init) if v.is_a?(Hash) and v.isprocedure
						}
					end
				}
				self.reset_operators_name
#puts '...finish'

				### process sometime modalities ###
				self.process_sometime if @root.has_key?('sometime')
				### process sometime-after modalities ###
				self.process_sometime_after if @root.has_key?('sometime-after')

				# detect and merge mutually inclusive operators
				self.search_and_merge_mutually_inclusive_operators

				#self.dump_types
				#self.dump_operators
				#self.dump_vars

				return create_output
rescue Exception => e
	$stderr.puts e.backtrace
	$stderr.puts e
end
			end

			def search_and_merge_mutually_inclusive_operators
				last = @g_operators.length-1
				@g_operators.each_index do |i|
					op1 = @g_operators[i]
#puts '=> ' + op1.name + ' : ' + op1.get_pre_state.inspect
					for j in i+1..last
						op2 = @g_operators[j]
						next if op1.modifier_id != op2.modifier_id or op1.conflict?(op2)
						next if not (op1.supports?(op2) and op2.supports?(op1))
#puts "\t" + op2.name	#+ ' : ' + op1.supports?(op2).to_s + ',' + op2.supports?(op1).to_s
						if op1.supports?(op2) and op2.supports?(op1)
							op = op1.merge(op2)
							op.modifier_id = op1.modifier_id
#puts "\t\t" + op.name + ":\n\t\t" + op.get_pre_state.inspect + "\n\t\t" + op.get_post_state.inspect
							op1 = op
						end
					end
					@operators[op1.name] = op1 if op1 != @g_operators[i]
				end
			end

			# Find immutable variables -- variables that will never be affected with any
			# actions. Then reduce the size of their domain by 1 only i.e. the possible
			# value is only their initial value.
			def identify_immutable_variables
				def is_this(ref)
					ref.length > 7 and (ref[0,7] == '$.this.' or ref[0,7] == '$.self.')
				end

				mutables = {}
				@variables.each_key { |k| mutables[k] = false }
				@variables.each_value do |var|
					next if not var.is_final
					var.init.each do |k1,v1|
						next if k1[0,1] == '_' or not v1.is_a?(Hash) or not v1.isprocedure
						v1['_effects'].each do |k2,v2|
							next if k2[0,1] == '_' or not k2.isref
							if is_this(k2)
								vname = var.name + k2[6..k2.length-1]
								mutables[vname] = true
							else
								# TODO
								#puts v1.keys.inspect
							end
						end
					end
				end
				mutables.each do |vname, is_mutable|
					if @variables[vname].is_final != (not is_mutable)
						@variables[vname].clear
						@variables[vname] << @variables[vname].init
						#puts vname + ': ' + @variables[vname].length.to_s
					end
				end
			end

			def process_global_constraint
				### normalize global constraint formula ###
				if @root.has_key?('global') and @root['global'].isconstraint
					raise Exception, 'Invalid global constraint' if 
							not normalize_formula(@root['global'], true)

					if GlobalConstraintMethod == 1
						# dummy variable
						@global_var = Variable.new(GlobalVariable, 'Boolean', -1, false, true)
						@global_var << true
						@global_var << false
						@variables[@global_var.name] = @global_var
						# dummy operator
						eff = Parameter.new(@global_var, false, true)
						if @root['global']['_type'] == 'and'
							op = Operator.new(GlobalOperator, 0)
							op[eff.var.name] = eff
							@operators[op.name] = op
						else
							index = 0
							@root['global'].each do |name,constraint|
								next if name[0,1] == '_'
								map_cond = and_equals_constraint_to_map(constraint)
								op = Operator.new(GlobalOperator + index.to_s, 0)
								op[eff.var.name] = eff
								map_cond.each do |k,v|
									next if k[0,1] == '_'
									raise VariableNotFoundException, k if not @variables.has_key?(k)
									op[@variables[k].name] = Parameter.new(@variables[k], v)
								end
								@operators[op.name] = op
							end
						end
					end
				end
			end

			def process_sometime
				@root['sometime'].each do |k,v|
					next if k[0,1] == '_'
					# dummy-variable
					var = Variable.new('sometime_' + k, 'Boolean', -1, false, true)
					var << true
					var << false
					@variables[var.name] = var
					# dummy-operator
					op = Operator.new('-sometime_' + k, 0)
					eff = Parameter.new(var, false, true)
					op[eff.var.name] = eff
					map = and_equals_constraint_to_map(v)
					map.each { |k1,v1|
						op[@variables[k1].name] = Parameter.new(@variables[k1], v1, nil)
					}
					@operators[op.name] = op
				end
			end

			def process_sometime_after
				# TODO
				@root['sometime-after'].each do |k,v|
					next if k[0,1] == '_'
					# dummy-variable
					var = Variable.new('sometime_after_' + k, 'Boolean', -1, true, true)
					var << true
					var << false
					@variables[var.name] = var
					# normalize formula
					
					# dummy-operator
					op = Operator.new('-sometime_after_activate_' + k, 0)
					eff = Parameter.new(var, true, false)
					op[eff.var.name] = eff
				end
			end

			def process_goal(goal)
				raise Exception, 'invalid goal constraint' if not normalize_formula(goal)
				if goal['_type'] == 'and'
					map = and_equals_constraint_to_map(goal)
					map.each { |name,value|
						value = @types[@variables[name].type][0] if value.is_a?(Hash) and value.isnull
						value = @root['initial'].at?(value) if value.is_a?(String) and value.isref
						@variables[name].goal = value
					}
				elsif goal['_type'] == 'or'
					count = 0
					var = Variable.new("goal", 'Boolean', -1, false, true)
					var << true
					var << false
					@variables[var.name] = var
					eff = Parameter.new(var, false, true)

					goal.each { |k,g|
						next if k[0,1] == '_'
						op = Operator.new("-goal_#{count}", 0)
						op[var.name] = eff
						map = and_equals_constraint_to_map(g)
						map.each { |k1,v1|
							op[@variables[k1].name] = Parameter.new(@variables[k1], v1, nil)
						}
						@operators[op.name] = op
					}
				end
			end

			def create_output
				# version
				out = "begin_version\n3\nend_version\n"
				# metric
				out += "begin_metric\n1\nend_metric\n"
				# variables
				variable_index = @variables.keys
				variable_index.sort!
				out += "#{variable_index.length}\n"
				variable_index.each { |i|
					@variables[i].id = variable_index.index(i) # set variable's index
					out += @variables[i].to_sas(@root['initial']) + "\n"
				}
				# mutex
				out += "0\n"
				# initial state
				out += "begin_state\n"
				#pre = ( (pre.is_a?(Hash) and pre.isnull) ? 0 : (pre == nil ? -1 : @var.index(pre)) )
				variable_index.each { |i|
					if @variables[i].init.is_a?(Hash) and @variables[i].init.isnull
						out += "0\n"
					else
						out += @variables[i].index(@variables[i].init).to_s + "\n"
					end
				}
				out += "end_state\n"
				# goal
				out += "begin_goal\n"
				count = 0
				goal = ''
				variable_index.each { |i|
					if @variables[i].goal != nil
						goal += variable_index.index(i).to_s + ' ' +
							@variables[i].index(@variables[i].goal).to_s + "\n"
						count += 1
					end
				}
				out += "#{count}\n#{goal}end_goal\n"
				# operators
				out += "#{@operators.length}\n"
				@operators.each_value { |op| out += op.to_sas(@root['initial']) + "\n" }
				# axioms
				out += "0"

				return out
			end

			def reset_operators_name
				Nuri::Sfp::Sas.reset_operator_id
				ops = Hash.new
				@operators.each_value { |op|
					op.id = Nuri::Sfp::Sas.next_operator_id
					@operators.delete(op.name)
					op.update_name
					ops[op.name] = op
				}
				@operators = ops
			end

			def self.reset_operator_id
				@@op_id = -1
			end

			# return the next operator's id
			def self.next_operator_id
				return (@@op_id += 1) if defined?(@@op_id) != nil
				@@op_id = 0
				return @@op_id
			end

			# return the next constraint's id
			def self.next_constraint_id
				return (@@constraint_id += 1) if defined?(@@constraint_id) != nil
				@@constraint_id = 0
				return @@constraint_id
			end

			def self.next_constraint_key
				return 'constraint_' + next_constraint_id.to_s
			end

			# return the next variable's id
			def self.next_variable_id
				return (@@variable_id += 1) if defined?(@@variable_id) != nil
				@@variable_id = 0
				return @@variable_id
			end
		
			# return the next axiom's id
			def self.next_axiom_id
				return (@@axiom_id += 1) if defined?(@@axiom_id) != nil
				@@axiom_id = 0
				return @@axiom_id
			end


			# process the conditions of an operator and return all possible set
			# of conditions
			def process_conditions(cond)
				map = Hash.new
				cond.each { |k,v|
					next if k[0,1] == '_'
					if v['_type'] == 'equals'
						map[k] = v['_value']
					end
				}
				return map
			end

			def and_equals_constraint_to_map(constraint)
				map = Hash.new
				constraint.each { |k,v|
					next if k[0,1] == '_'
					map[k] = v['_value'] if v['_type'] == 'equals'
				}
				return map
			end

			# process the effects of operator and return all possible sets
			# of effects
			def process_effects(eff)
				map = Hash.new
				eff.each { |k,v|
					next if k[0,1] == '_'
					if v['_type'] = 'equals'
						map[k] = v['_value']
					end
				}
				return map
			end

			# process given operator
			def process_operator(op)
				# return if given operator is not valid
				return if not normalize_formula(op['_conditions'])
				# at this step, the conditions formula has been normalized (AND/OR tree)
				# AND conditions
				if op['_conditions']['_type'] == 'and'
					process_grounded_operator(op, op['_conditions'], op['_effects'])
				else
					op['_conditions'].each { |k,v|
						next if k[0,1] == '_'
						process_grounded_operator(op, v, op['_effects'])
					}
				end
			end

			# process grounded operator (no parameter exists)
			def process_grounded_operator(op, conditions, effects)
				map_cond = and_equals_constraint_to_map(conditions)
				map_eff = and_equals_constraint_to_map(effects)
				keys = map_cond.keys.concat(map_eff.keys)

				# combine map_cond & map_eff if any of them has >1 items
				op_id = Nuri::Sfp::Sas.next_operator_id
				sas_op = Operator.new(op.ref, op['_cost'])
				sas_op.params = op['_parameters']

				keys.each { |k|
					return if not @variables.has_key?(k)
					pre = (!map_cond.has_key?(k) ? nil : map_cond[k])
					#pre = @root['initial'].at?(pre) if pre.is_a?(String) and pre.isref
					post = (!map_eff.has_key?(k) ? nil : map_eff[k])
					#post = @root['initial'].at?(post) if post.is_a?(String) and post.isref
					sas_op[@variables[k].name] = Parameter.new(@variables[k], pre, post)
				}

				if GlobalConstraintMethod == 1
					@operators[sas_op.name] = sas_op if apply_global_constraint_method_1(sas_op)
				elsif GlobalConstraintMethod == 2
					@operators[sas_op.name] = sas_op if apply_global_constraint_method_2(sas_op)
				end
			end

			# process all object procedures in order to get
			# grounded SAS-operator
			def process_procedure(procedure, object)
				operators = ground_procedure_parameters(procedure)
				if operators != nil
					operators.each { |op| process_operator(op) }
				end
				# remove the procedure because we don't need it anymore
				object.delete(procedure['_self'])
			end

			# determine all possible sets of parameters' value
			# and create an operator for each set
			def ground_procedure_parameters(procedure)
				params = Hash.new
				procedure.each { |k,v|
					next if k[0,1] == '_'
					# if the specified parameter does not any value, then it's invalid procedure
					return nil if not @types.has_key?( v['_isa'] )
					params[k] = Array.new
					@types[ v['_isa'] ].each { |val|
						params[k] << val if not (val.is_a?(Hash) and val.isnull)
					}
				}
				# combinatorial method for all possible values of parameters
				# using recursive method
				def combinator(bucket, grounder, procedure, names, params, selected, index)
					if index >= names.length
						p = Nuri::Sfp.deep_clone(procedure) # procedure.clone
						# grounding all references
						selected['$.this'] = procedure['_parent'].ref
						selected.each { |k,v| selected[k] = (v.is_a?(Hash) ? v.ref : v) }
						grounder.map = selected
						p['_conditions'].accept(grounder)
						p['_effects'].accept(grounder)
						p['_context'] = 'operator'
						p['_parameters'] = selected.clone
						# remove parameters because it's already grounded
						p.each { |k,v| p.delete(k) if k[0,1] != '_' }
						bucket << p
					else
						params[ names[index] ].each { |val|
							ref = '$.' + names[index]
							selected[ref] = val
							combinator(bucket, grounder, procedure, names, params, selected, index+1)
							selected.delete(ref)
						}
					end
				end
				bucket = Array.new
				grounder = ParameterGrounder.new
				combinator(bucket, grounder, procedure, params.keys, params, Hash.new, 0)
				return bucket
			end

			def dump_types
				puts '--- types'
				@types.each { |name,values|
					next if values == nil
					print name + ": "
					values.each { |val|
						if val.is_a?(Hash)
							print (val.isnull ? 'null ' : val.ref + " ")
						else
							print val.to_s + " "
						end
					}
					puts '| ' + values.length.to_s
				}
			end

			def dump_vars
				puts '--- variables'
				@variables.each_value { |value| puts value.to_s }
			end

			def dump_operators
				puts '--- operators'
				@operators.each_value { |op| puts op.to_s + ' -- ' + op.params.inspect }
			end

			def dump_axioms
				puts '--- axioms'
				@axioms.each { |ax| puts ax.to_s }
			end

			# set possible values for each variable
			def set_variable_values
				@variables.each_value { |var|
					if not var.is_final
						@types[var.type].each { |v| var << v }
						var.uniq!
					else
						var << var.init
					end
				}
			end

			def apply_global_constraint_method_1(operator)
				return true if not @root.has_key?('global') or #@root['global'] == nil or
					not @root['global'].isconstraint
				
				operator[@global_var.name] = Parameter.new(@global_var, true, false)
			end

			# return true if global constraint could be applied, otherwise false
			def apply_global_constraint_method_2(operator)
				return true if not @root.has_key?('global') or #@root['global'] == nil or
					not @root['global'].isconstraint

				# return true if operator's effect is consistent with "left := right"
				def consistent_with_equals(left, right, operator)
					return false if operator.has_key?(left) and operator[left].post != nil and
						operator[left].post != right['_value']
					return true
				end

				# return true if operator's effect is consistent with given 'and' constraint
				def consistent_with_and(constraint, operator)
					constraint.each { |k,v|
						next if k[0,1] == '_'
						return false if not consistent_with_equals(k, v, operator)
					}
					return true
				end

				# global constraint is AND formula
				return consistent_with_and(@root['global'], operator) if
						@root['global']['_type'] == 'and'
				
				# global constraint is OR formula
				total = 0
				satisfied = Array.new
				@root['global'].each { |k,v|
					next if k[0,1] == '_'
					total += 1
					satisfied << k if consistent_with_and(v, operator)
				}
				if satisfied.length < total
					# partial satisfaction or OR formula
					satisfied.each { |key|
						# create an operator for each satisfied sub-formula
						op = operator.clone
						op.modifier_id = key
						map_cond = and_equals_constraint_to_map(@root['global'][key])
						map_cond.each { |k,v|
							next if k[0,1] == '_'
							raise VariableNotFoundException, 'Variable not found: ' + k if
								not @variables.has_key?(k)
							if not op.has_key?(@variables[k].name)
								op[@variables[k].name] = Parameter.new(@variables[k], v, nil)
							else
								#op[@variables[k].name].pre = v
							end
						}
						@operators[op.name] = op
						@g_operators << op
					}
					# the original operator is not required
					return false
				end

				return true
			end

			# normalize the given first-order formula by transforming it into
			# CNF formula
			def normalize_formula(formula, dump=false)
				def create_equals_constraint(value)
					return {'_context'=>'constraint', '_type'=>'equals', '_value'=>value}
				end

				def create_not_equals_constraint(value)
					return {'_context'=>'constraint', '_type'=>'not-equals', '_value'=>value}
				end

				def create_not_constraint(key, parent)
					return {'_context'=>'constraint', '_type'=>'not', '_self'=>key, '_parent'=>parent}
				end

				def create_and_constraint(key, parent)
					return {'_context'=>'constraint', '_type'=>'and', '_self'=>key, '_parent'=>parent}
				end

				def create_or_constraint(key, parent)
					return {'_context'=>'constraint', '_type'=>'or', '_self'=>key, '_parent'=>parent}
				end

				def array_to_or_constraint(arr)
					c = {'_context'=>'constraint', '_type'=>'or'}
					arr.each { |v| c[Nuri::Sfp::Sas.next_constraint_key] = v }
					return c
				end

				# combinatorial method for all possible values of nested reference
				# using recursive method
				def ref_combinator(bucket, parent, names, last_value, last_names=nil,
						index=0, selected=Hash.new)

					return if names[index] == nil
					var_name = parent + '.' + names[index]
					return if not @variables.has_key?(var_name)

					if index >= names.length or (index >= names.length-1 and last_value != nil)
						selected[var_name] = last_value if last_value != nil
						last_names << var_name if last_names != nil
						result = selected.clone
						result['_context'] = 'constraint'
						result['_type'] = 'and'
						bucket << result
					elsif not @variables.has_key?(var_name)
						raise VariableNotFoundException, 'Variable not found: ' + var_name
					else
						@variables[var_name].each { |v|
							next if v.is_a?(Hash) and v.isnull and index < (names.length-1)
							v = v.ref if v.is_a?(Hash) and v.isobject
							selected[var_name] = create_equals_constraint(v)
							ref_combinator(bucket, v, names, last_value, last_names, index+1, selected)
						}
					end
					selected.delete(var_name)
				end

				def break_nested_reference(ref)
					rest, last = ref.pop_ref
					names = [last]
					while rest != '$' and not @variables.has_key?(rest)
						rest, last = rest.pop_ref
						names.unshift(last)
					end
					rest, last = rest.pop_ref
					names.unshift(last)
					return [names, rest]
				end

				def normalize_multiple_right_values(left, right, formula)
					ref = right['_value']
					key1 = Nuri::Sfp::Sas.next_constraint_key
					c_or = create_or_constraint(key1, formula)
					@variables[ref].each do |v|
						key2 = Nuri::Sfp::Sas.next_constraint_key
						c_and = create_and_constraint(key2, c_or)
						value = (v.is_a?(Hash) and v.isobject ? v.ref : v)
						c_and[left] = create_equals_constraint(value)
						c_and[ref] = create_equals_constraint(value) if right['_type'] == 'equals'
						c_and[ref] = create_not_equals_constraint(value) if right['_type'] == 'not-equals'
						c_or[key2] = c_and
					end
					formula.delete(left)
					formula[key1] = c_or
					return key1
				end

				def normalize_nested_right_values(left, right, formula)
					# TODO
#puts 'nested right: ' + left + ' = ' + right['_value']
				end

				def normalize_nested_right_only(left, right, formula)
					value = right['_value']
					return if @variables.has_key?(value) and @variables[value].is_final

					if @variables.has_key?(value)
						normalize_multiple_right_values(left, right, formula)
					else
						normalize_nested_right_values(left, right, formula)
					end
				end

				def normalize_nested_left_right(left, right, formula)
					# TODO
#puts 'nested left-right'
					#names, rest = break_nested_reference(left)
					#bucket1 = Array.new
					#last_names1 = Array.new
					#ref_combinator(bucket1, rest, names, nil, last_names1)

				end

				def normalize_nested_left_only(left, right, formula)
					names, rest = break_nested_reference(left)
					bucket = Array.new
					ref_combinator(bucket, rest, names, right)
					formula.delete(left)
					if bucket.length > 0
						key = Nuri::Sfp::Sas.next_constraint_key
						formula[key] = array_to_or_constraint(bucket)
						to_and_or_graph(formula[key])
						return key
					end
				end

				# transform a first-order formula into AND/OR graph
				def to_and_or_graph(formula)
					keys = formula.keys
					keys.each { |k|
						v = formula[k]
					#formula.each { |k,v|
						next if k[0,1] == '_'
						if k.isref and not @variables.has_key?(k)
							if v.is_a?(Hash) and v.isconstraint
								if (v['_type'] == 'equals' or v['_type'] == 'not-equals') and
										v['_value'].is_a?(String) and v['_value'].isref
									# nested left & right
									normalize_nested_left_right(k, v, formula)
								elsif (v['_type'] == 'or' or v['_type'] == 'and')
									to_and_or_graph(v)
								else
									# nested left only
									normalize_nested_left_only(k, v, formula)
								end
							end
						else
							if v.is_a?(Hash) and v.isconstraint
								if (v['_type'] == 'equals' or v['_type'] == 'not-equals') and
										v['_value'].is_a?(String) and v['_value'].isref 
									# nested right only
									normalize_nested_right_only(k, v, formula)
								elsif (v['_type'] == 'or' or v['_type'] == 'and')
									to_and_or_graph(v)
								end
							end
						end
					}
				end


				# Recursively pull statements that has the same AND/OR operator.
				# Only receive a formula with AND, OR, EQUALS constraints.
				#
				# return false if there is any contradiction of facts, otherwise true
				def flatten_and_or_graph(formula)
					# transform formula into a format:
					#   (x1 and x2) or (y1 and y2 and y3) or z1
					is_and_or_tree = false
					keys = formula.keys
					keys.each { |k|
					#formula.each { |k,v|
						next if k[0,1] == '_'
						v = formula[k]
						if v.is_a?(Hash) and v.isconstraint
							if v['_type'] == 'or' or v['_type'] == 'and'
								if not flatten_and_or_graph(v)
									# remove it because it's not consistent
									formula.delete(k)
									v['_parent'] = nil
								end

								if formula['_type'] == v['_type']
									# pull-out all node's elements
									keys1 = v.keys
									keys1.each { |k1|
									#v.each { |k1,v1|
										next if k1[0,1] == '_'
										v1 = v[k1]
										# check contradiction facts
										if formula.has_key?(k1)
											return false if formula[k1]['_type'] != v1['_type']
											return false if formula[k1]['_value'] != v1['_value']
										else
											formula[k1] = v1
										end
									}
									formula.delete(k)
								end
								is_and_or_tree = true if formula['_type'] == 'and' and v['_type'] == 'or'
							end
						end
					}
					# dot-product the nodes
					def cross_product_and(bucket, names, formula, values=Hash.new, index=0)
						if index >= names.length
							key = Nuri::Sfp::Sas.next_constraint_key
							c = create_and_constraint(key, formula)
							values.each { |k,v| c[k] = v }
							if flatten_and_or_graph(c)
								# add the constraint because it's consistent
								formula[key] = c
							end
						else
							key = names[index]
							val = formula[ key ]
							if val.is_a?(Hash) and val.isconstraint and val['_type'] == 'or'
								val.each { |k,v|
									next if k[0,1] == '_'
									values[k] = v
									cross_product_and(bucket, names, formula, values, index+1)
									values.delete(k)
								}
							else
								values[key] = val
								cross_product_and(bucket, names, formula, values, index+1)
							end
						end
					end
					if is_and_or_tree
						# change it into OR->AND tree
						names = Array.new
						formula.keys.each { |k| names << k if k[0,1] != '_' }
						bucket = Array.new
						cross_product_and(bucket, names, formula)
						names.each { |k| formula.delete(k) }
						formula['_type'] = 'or'
					end

					return true
				end

				# 'var_name' := x, value := p1
				# variable x := p1 | p2 | p3
				# return an array (p2, p3)
				def get_list_not_value_of(var_name, value)
					raise VariableNotFoundException, 'Variable not found: ' + var_name if
						not @variables.has_key?(var_name)
					if value.is_a?(String) and value.isref
						value = @root['initial'].at?(value)
					elsif value.is_a?(Hash) and value.isnull
						value = @variables[var_name][0]
					end
					return (@variables[var_name] - [value])
				end

				# variable x := p1 | p2 | p3
				# then formula  (x not-equals p1) is transformed into
				# formula ( (x equals p2) or (x equals p3) )
				def not_equals_statement_to_or_constraint(formula)
					keys = formula.keys
					keys.each do |k|
						next if k[0,1] == '_'
						v = formula[k]
						if v.is_a?(Hash) and v.isconstraint
							if v['_type'] == 'or' or v['_type'] == 'and'
								not_equals_statement_to_or_constraint(v)
							elsif v['_type'] == 'not-equals'
								key1 = Nuri::Sfp::Sas.next_constraint_key
								c_or = create_or_constraint(key1, formula)
								get_list_not_value_of(k, v['_value']).each do |val1|
									val1 = val1.ref if val1.is_a?(Hash) and val1.isobject
									key2 = Nuri::Sfp::Sas.next_constraint_key
									c_and = create_and_constraint(key2, c_or)
									c_and[k] = create_equals_constraint(val1)
									c_or[key2] = c_and
								end
								formula.delete(k)
								formula[key1] = c_or
							end
						end
					end
				end

				def substitute_template(grounder, template, parent)
					id = Nuri::Sfp::Sas.next_constraint_key
					c_and = Nuri::Sfp.deep_clone(template)
					c_and['_self'] = id
					c_and.accept(grounder)
					parent[id] = c_and
					remove_not_and_iterator_constraint(c_and)
					c_and
				end

				# Remove the following type of constraint in the given formula:
				# - NOT constraints by transforming them into EQUALS, NOT-EQUALS, AND, OR constraints
				# - ARRAY-Iterator constraint by extracting all possible values of given ARRAY
				#
				def remove_not_and_iterator_constraint(formula)
					# TODO: (not (equals) (not-equals) (and) (or))
					if formula.isconstraint and formula['_type'] == 'not'
						formula['_type'] = 'and'
						formula.each { |k,v|
							next if k[0,1] == '_'
							if v.is_a?(Hash) and v.isconstraint
								case v['_type']
								when 'equals'
									v['_type'] = 'not-equals'
								when 'not-equals'
									v['_type'] = 'equals'
								when 'and'
									v['_type'] = 'or'
									v.each { |k1,v1|
										k2 = Nuri::Sfp::Sas.next_constraint_key
										c_not = create_not_constraint(k2, v)
										c_not[k1] = v1
										v1['_parent'] = c_not
										v.delete(k1)
										remove_not_and_iterator_constraint(c_not)
									}
								when 'or'
									v['_type'] = 'and'
									v.each { |k1,v1|
										k2 = Nuri::Sfp::Sas.next_constraint_key
										c_not = create_not_constraint(k2, v)
										c_not[k1] = v1
										v1['_parent'] = c_not
										v.delete(k1)
										remove_not_and_iterator_constraint(c_not)
									}
								else
									raise Exception, 'unknown rules: ' + v['_type']
								end
							end
						}
					elsif formula.isconstraint and formula['_type'] == 'iterator'
						ref = formula['_value']
						var = '$.' + formula['_variable']
						if @arrays.has_key?(ref)
							# substitute ARRAY
							total = @arrays[ref]
							grounder = ParameterGrounder.new(Hash.new)
							for i in 0..(total-1)
								grounder.map.clear
								grounder.map[var] = ref + "[#{i}]"
								substitute_template(grounder, formula['_template'], formula)
							end
						else
							setvalue = @root['initial'].at?(ref)
							if setvalue != nil and setvalue.is_a?(Hash) and setvalue.isset
								# substitute SET
								grounder = ParameterGrounder.new(Hash.new)
								setvalue['_values'].each do |v|
									grounder.map.clear
									grounder.map[var] = v
									substitute_template(grounder, formula['_template'], formula)
								end
							else
								raise Exception, 'Undefined'
							end
						end
						formula['_type'] = 'and'
						formula.delete('_value')
						formula.delete('_variable')
						formula.delete('_template')
					elsif formula.isconstraint and formula['_type'] == 'forall'
						classref = '$.' + formula['_class']
						raise ClassNotFoundException, classref if not @types.has_key?(classref)
						var = '$.' + formula['_variable']
						grounder = ParameterGrounder.new(Hash.new)
						@types[classref].each do |v|
							next if v == nil or (v.is_a?(Hash) and v.isnull)
							grounder.map.clear
							grounder.map[var] = v.ref
							substitute_template(grounder, formula['_template'], formula)
						end
						formula['_type'] = 'and'
						formula.delete('_class')
						formula.delete('_variable')
						formula.delete('_template')
					else
						formula.each { |k,v|
							next if k[0,1] == '_'
							remove_not_and_iterator_constraint(v) if v.is_a?(Hash) and v.isconstraint
						}
					end
				end

### testing methods
				def calculate_depth(formula, depth)
					formula.each { |k,v|
						next if k[0,1] == '_'
						depth = calculate_depth(v, depth+1)
						break
					}
					depth
				end

				def total_element(formula, total=0, total_or=0, total_and=0)
					formula.each { |k,v|
						next if k[0,1] == '_'
						if v['_type'] == 'or'
							total_or += 1
						elsif v['_type'] == 'and'
							total_and += 1
						else
#puts v.inspect if v['_type'] == 'equals'
						end
						total, total_or, total_and = total_element(v, total+1, total_or, total_and)
					}
					[total,total_or,total_and]
				end

				def visit_and_or_graph(formula, map={}, total=0)
					if formula['_type'] == 'and'
						map = map.clone
						is_end = true
						formula.each do |k,v|
							next if k[0,1] == '_'
							if v['_type'] == 'equals'
								# bad branch
								if map.has_key?(k) and map[k] != v['_value']
#puts 'bad branch'
									return
								end
								map[k] = v['_value']
							elsif v['_type'] == 'and' or v['_type'] == 'or'
								is_end = false
							end
						end

						if is_end
							# map is valid conjunction
#puts '--- is end #1'
#puts map.inspect
						else
							formula.each do |k,v|
								next if k[0,1] == '_'
								if v['_type'] == 'and' or v['_type'] == 'or'
									return visit_and_or_graph(v, map, total)
								end
							end
#puts 'not end'
						end

					elsif formula['_type'] == 'or'
						formula.each do |k,v|
							next if k[0,1] == '_'
							if v['_type'] == 'equals'
								# bad branch
								if map.has_key?(k) and map[k] != v['_value']
#puts 'bad branch'
								end
								final_map = map.clone
								final_map[k] = v['_value']
								# map is valid conjunction
#puts '--- is end #2'
#puts final_map.inspect
							elsif v['_type'] == 'and' or v['_type'] == 'or'
								visit_and_or_graph(v, map, total)
							end
						end

					end
					total
				end
### end of testing methods

				remove_not_and_iterator_constraint(formula)
#Nuri::Sfp::Parser.dump(formula) if dump
#puts 'step 1' if dump
				to_and_or_graph(formula)
#puts 'step 2' if dump
#puts total_element(formula) if dump
				not_equals_statement_to_or_constraint(formula)
#puts 'step 3' if dump
#puts visit_and_or_graph(formula) if dump
#Nuri::Sfp::Parser.dump(formula)

				return flatten_and_or_graph(formula)
			end

		end

=begin
		class Node
			def self.generate(constraint)
				case constraint['_type']
				when 'equals'
					NodeEquals.new(constraint['_self'], constraint['_value'])
				when 'not-equals'
					NodeNotEquals.new(constraint['_self'], constraint['_value'])
				when 'or'
				when 'and'
				end
			end
		end

		class NodeEquals < Node
			attr_accessor :var, :value
			def initialize(var, value)
				@var = var
				@value = value
			end
		end

		class NodeNotEquals < Node
			attr_accessor :var, :value
			def initialize(var, value)
				@var = var
				@value = value
			end
		end

		class NodeOr < Node
			attr_accessor :children
			def initialize
				@children = []
			end
		end

		class NodeAnd < Node
			attr_accessor :children
			def initialize
				@children = []
			end
		end
=end

		class VariableNotFoundException < Exception
		end

		class ClassNotFoundException < Exception
		end

		# Visitor class has 3 attributes
		# - root : Hash instance of root Context
		# - variables: Hash instance that holds all Variable instances
		# - types: Hash instance that holds all types (primitive or non-primitive)
		class Visitor
			def initialize(main)
				@main = main
				@root = main.root
				@vars = main.variables
				@types = main.types
			end
		end

		# Visitor that set goal value of each variable
		class GoalVisitor < Visitor
			def set_equals(name, value)
				value = @types[@vars[name].type][0] if value.is_a?(Hash) and value.isnull
				value = @root['initial'].at?(value) if value.is_a?(String) and value.isref
				@vars[name].goal = value
			end

			def visit(name, value, obj)
				return if name[0,1] == '_'
				raise VariableNotFoundException, 'Variable not found: ' + name if
					not @vars.has_key?(name)
				if value.isconstraint
					self.set_equals(name, value['_value']) if value['_type'] == 'equals'
				end
				return true
			end
		end

		# collecting all variables and put them into @bucket
		class VariableCollector < Visitor
			def initialize(main)
				super(main)
				@init = main.root['initial']
			end

			def visit(name, value, parent)
				return false if name[0,1] == '_' or (value.is_a?(Hash) and
						not (value.isobject or value.isnull))

				var_name = parent.ref.push(name)
				isfinal = self.is_final(value)
				isref = (value.is_a?(String) and value.isref)
				value = @init.at?(value) if value.is_a?(String) and value.isref
				type = (isfinal ? self.isa?(value) : self.get_type(name, value, parent))
				var = Variable.new(var_name, type, -1, value, nil, isfinal)
				@vars[var.name] = var
				if isfinal and value.is_a?(Hash)
					value['_classes'].each { |c| add_value(c, value) }
				elsif not isref
					add_value(type, value)
				end
				return true
			end

			def get_type(name, value, parent)
				# TODO -- re-evaluate this method
				type = self.isa?(value)
				return type if type == 'Boolean' or type == 'Number' or type == 'String'

				parent_class = @root.at?( @vars[parent.ref].type )
				return parent_class[name]['_isa']
			end

			def add_value(type, value)
				if not @types.has_key?(type)
					@types[type] = Array.new
					@types[type] << Nuri::Sfp.null_of(type) if @types[type].length <= 0
				end
				@types[type] << value if not (value.is_a?(Hash) and value.isnull)
			end

			def isa?(value)
				return 'Boolean' if value.is_a?(TrueClass) or value.is_a?(FalseClass)
				return 'Number' if value.is_a?(Numeric)
				return 'String' if value.is_a?(String) and not value.isref
				return value['_isa'] if value.is_a?(Hash) and value.has_key?('_isa')
				return nil
			end

			def is_final(value)
				return true if value.is_a?(Hash) and not value.isnull
				return false
			end
		end

		# Collects all values (primitive or non-primitive)
		class ValueCollector
			def initialize(bucket)
				@bucket = bucket
			end

			def visit(name, value, obj)
				if name[0,1] == '_' and name != '_value'
				elsif value.is_a?(String) and not value.isref
					@bucket['String'] << value
				elsif value.is_a?(Numeric)
					@bucket['Number'] << value
				elsif value.is_a?(TrueClass) or value.is_a?(FalseClass)
					@bucket['Boolean'] << value
				elsif value.is_a?(Hash) and value.isobject
					value['_classes'].each { |c| @bucket[c] << value }
				end
				return true
			end
		end

		class ParameterGrounder
			attr_accessor :map

			def initialize(map=nil)
				@map = map
			end

			def visit(name, value, obj)
				return if name[0,1] == '_' and name != '_value' and name != '_template'
				if name[0,1] != '_'
					map.each { |k,v|
						if name == k
							obj[v] = value
							obj.delete(name)
							name = v
							value['_self'] = name if value.is_a?(Hash)
							break
						elsif name.length > k.length and name[k.length,1] == '.' and name[0, k.length] == k
							grounded = v + name[k.length, (name.length-k.length)]
							obj[grounded] = value
							obj.delete(name)
							name = grounded
							value['_self'] = name if value.is_a?(Hash)
							break
						end
					}
				end
				if value.is_a?(String) and value.isref
					map.each { |k,v|
						if value == k
							obj[name] = v
							break
						elsif value.length > k.length and value[k.length,1] == '.' and value[0,k.length] == k
							obj[name] = v + value[k.length, (value.length-k.length)]
							break
						end
					}
				end
				return true
			end
		end

		# SAS Variable is a finite-domain variable
		# It has a finite set of possible values
		class Variable < Array
			# @name -- name of variable
			# @type -- type of variable ('string','boolean','number', or fullpath of a class)
			# @layer -- axiom layer ( '-1' if this is not axiom variable, otherwise >0)
			# @init -- initial value
			# @goal -- goal value (desired value)
			attr_accessor :name, :type, :layer, :init, :goal, :is_final, :id
			attr_reader :is_primitive

			def initialize(name, type, layer=-1, init=nil, goal=nil, is_final=false)
				@name = name
				@type = type
				@layer = layer
				@init = init
				@goal = goal
				@is_final = is_final
				@is_primitive = (type == 'String' or type == 'Number' or type == 'Boolean')
			end

			def to_s
				s = @name + '|' + @type 
				s += '|' + (@init == nil ? '-' : (@init.is_a?(Hash) ? @init.tostring : @init.to_s))
				s += '|' + (@goal == nil ? '-' : (@goal.is_a?(Hash) ? @goal.tostring : @goal.to_s))
				s += '|' + (@is_final ? 'final' : 'notfinal') + "\n"
				s += "\t["
				self.each { |v| s += (v.is_a?(Hash) ? v.tostring : v.to_s) + ',' }
				s = (self.length > 0 ? s.chop : s) + "]"
				return s
			end

			# return variable representation in SAS+ format
			def to_sas(root)
				sas = "begin_variable\nvar_#{@id}#{@name}\n#{@layer}\n#{self.length}\n"
				self.each { |v|
					v = root.at?(v) if v.is_a?(String) and v.isref
					v = '"' + v + '"' if v.is_a?(String)
					sas += (v.is_a?(Hash) ? (v.isnull ? "null\n" : "#{v.ref}\n") : "#{v}\n")
				}
				return sas += "end_variable"
			end
		end

		# A class for Grounded Operator
		class Operator < Hash
			attr_accessor :id, :name, :cost, :params, :modifier_id
			attr_reader :ref

			def initialize(ref, cost=1, id=nil)
				@id = (id == nil ? Nuri::Sfp::Sas.next_operator_id : id)
				@cost = cost
				@ref = ref
				@modifier_id = nil
				self.update_name
			end

			def clone
				op = Operator.new(@ref, @cost)
				op.params = @params
				self.each { |key,param| op[key] = param.clone }
				return op
			end

			def update_name
				@name = 'op_' + @id.to_s + @ref
			end

			# return true if this operator supports given operator's precondition
			# otherwise return false
			def supports?(operator)
				operator.each_value do |p2|
					# precondition is any value or this operator does not effecting variable 'p2'
					next if p2.pre == nil or not self.has_key?(p2.var.name) or
							self[p2.var.name].post == nil
					return true if self[p2.var.name].post == p2.pre
				end
				false
			end

			# return true if this operator requires an effect of given operator
			# otherwise return false
			def requires?(operator)
				self.each_value do |p1|
					next if p1.pre == nil # can be any value
					p2 = operator[p1.var.name]
					if p2 != nil and p2.post != nil and p1.pre == p2.post and p2.pre == nil
						return true
					end
				end
				return false
			end

			def merge(operator)
				cost = (@cost > operator.cost ? @cost : operator.cost)
				names = @name.split('#')
				name = (names.length > 1 ? names[1] : names[0])
				op = Operator.new('#' + name + '|' + operator.name, cost)
				self.each_value { |p| op[p.var.name] = p.clone }
				operator.each_value do |p|
					if not op.has_key?(p.var.name)
						op[p.var.name] = p.clone
					elsif p.post != nil
						op[p.var.name] = p.clone
					end
				end
				return op
			end

			def get_pre_state
				state = {}
				self.each_value { |p| state[p.var.name] = p.pre if p.pre != nil }
				state
			end

			def get_post_state
				state = {}
				self.each_value { |p| state[p.var.name] = p.post if p.post != nil }
				state
			end

			# two operators can be parallel if
			# - their preconditions are non consistent
			# - their effects are not consistent
			# - one's during condition is not consistent with another
			def conflict?(operator)
				self.each_value do |param1|
					next if not operator.has_key?(param1.var.name)
					param2 = operator[param1.var.name]
					return true if param1.pre != nil and param2.pre != nil and param1.pre != param2.pre
					return true if param1.post != nil and param2.post != nil and param1.post != param2.post
					return true if param1.pre != nil and param2.post != nil and param1.pre != param2.post
					return true if param1.post != nil and param2.pre != nil and param1.post != param2.pre
				end
				return false
			end

			def to_s
				return @name + ': ' + self.length.to_s
			end

			def to_sas(root)
				prevail = Array.new
				prepost = Array.new
				self.each_value { |p|
					if p.post == nil
						prevail << p
					else
						prepost << p
					end
				}
				sas = "begin_operator\n#{@name}"
				@params.each { |k,v| sas += " #{k}=#{v}" if k != '$.this' } if @params != nil
				sas += "\n#{prevail.length}\n"
				prevail.each { |p| sas += p.to_sas(root) + "\n" }
				sas += "#{prepost.length}\n"
				prepost.each { |p| sas += p.to_sas(root) + "\n" }
				sas += "#{@cost}\nend_operator"
				return sas
			end

			def to_sfw
				id, name = @name.split('$', 2)
				sfw = { 'name' => '$' + name, 'parameters' => {},
					'conditions' => {}, 'effects' => {} }
				@params.each { |k,v|	sfw['parameters'][k.to_s] = v.to_s if k != '$.this' } if @params != nil
				self.each_value do |param|
					p = param.to_sfw
					sfw['conditions'][ p['name'] ] = p['pre'] if p['pre'] != nil
					sfw['effects'][ p['name'] ] = p['post'] if p['post'] != nil
				end
				return sfw
			end
		end

		# A class for Grounded Axiom
		class Axiom < Hash
			attr_accessor :id, :target

			def initialize
				@id = Nuri::Sfp::Sas.next_axiom_id
			end

			def to_s
				return 'axiom#' + @id.to_s
			end

			def to_sas
				#TODO
			end
		end

		# A class for operator/axiom parameter (prevail or effect condition)
		class Parameter
			attr_accessor :var, :pre, :post

			def initialize(var, pre, post=nil)
				@var = var
				@pre = pre
				@post = post
			end

			def prevail?
				return (@post == nil)
			end

			def effect?
				return (@post != nil)
			end

			def clone
				return Parameter.new(@var, @pre, @post)
			end

			def to_sas(root)
				# resolve the reference
				pre = ( (@pre.is_a?(String) and @pre.isref) ? root.at?(@pre) : @pre )
				post = ( (@post.is_a?(String) and @post.isref) ? root.at?(@post) : @post )
				# calculate the index
				pre = ( (pre.is_a?(Hash) and pre.isnull) ? 0 : (pre == nil ? -1 : @var.index(pre)) )
				post = ( (post.is_a?(Hash) and post.isnull) ? 0 : @var.index(post) )

				return "#{@var.id} #{pre}" if post == nil
				return "0 #{@var.id} #{pre} #{post}"
			end

			def to_s
				return @var.name + ',' +
					(@pre == nil ? '-' : (@pre.is_a?(Hash) ? @pre.tostring : @pre.to_s)) + ',' +
					(@post == nil ? '-' : (@post.is_a?(Hash) ? @post.tostring : @post.to_s))
			end

			def to_sfw
				return {
						'name' => @var.name,
						'pre' => (@pre.is_a?(Hash) ? @pre.tostring : @pre),
						'post' => (@post.is_a?(Hash) ? @post.tostring: @post)
					}
			end
		end
	end
end
