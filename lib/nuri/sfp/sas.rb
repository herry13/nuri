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
			GLOBAL_OPERATOR = '#global_op'
			GLOBAL_VARIABLE = '#global_var'

			attr_accessor :root, :variables, :types, :operators, :axioms

			def to_sas
				return false if @parser == nil

				@root = @parser.root 
				@variables = Hash.new
				@types = { 'Boolean' => [true, false],
					'Number' => Array.new,
					'String' => Array.new
				}
				@operators = Hash.new
				@axioms = Array.new
				
				# collect classes
				self.collect_classes

				# collect variables
				@root['initial'].accept(VariableCollector.new(self)) #@root, @variables, @types))

				# collect values from goal and global constraint
				value_collector = Nuri::Sfp::ValueCollector.new(@types)
				@root['goal'].accept(value_collector) if @root.has_key?('goal') and @root['goal'].isconstraint
				@root['global'].accept(value_collector) if @root.has_key?('global') and @root['global'].isconstraint

				# remove duplicates from type's set of value
				@types.each_value { |type| type.uniq! }
				# set domain values for each variable
				self.set_variable_values

				# process goal constraint
				process_goal(@root['goal']) if @root.has_key?('goal') and @root['goal'].isconstraint

				# normalize global constraint formula
				if @root.has_key?('global') and @root['global'].isconstraint
					raise Exception, 'Invalid global constraint' if not normalize_formula(@root['global'])
				end

				# process all procedures
				@variables.each_value { |var|
					if var.is_final
						var.init.each { |k,v|
							process_procedure(v, var.init) if v.is_a?(Hash) and v.isprocedure
						}
					end
				}
				self.reset_operators_name

				#self.dump_types
				#self.dump_vars
				#self.dump_operators

				return create_output
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
				@operators.each_value { |op|
					op.id = Nuri::Sfp::Sas.next_operator_id
					@operators.delete(op.name)
					op.update_name
					@operators[op.name] = op
				}
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


				@operators[sas_op.name] = sas_op if apply_global_constraint(sas_op)
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
						p = deep_clone(procedure) # procedure.clone
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
							selected[ '$.' + names[index] ] = val
							combinator(bucket, grounder, procedure, names, params, selected, index+1)
						}
					end
				end
				bucket = Array.new
				grounder = ParameterGrounder.new
				combinator(bucket, grounder, procedure, params.keys, params, Hash.new, 0)
				return bucket
			end

			# collect all classes that are used by the objects
			def collect_classes
				@parser.used_classes.each { |c|
					@types[c] = Array.new
					@types[c] << Nuri::Sfp.null_of(c) if @types[c].length <= 0
				}
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

			# deep cloning of given value
			# note: this can only be used on String, Number, Boolean, Hash, Array values
			def deep_clone(value)
				if value.is_a?(Hash)
					result = value.clone
					value.each { |k,v|
						if k != '_parent'
							result[k] = deep_clone(v)
							result[k]['_parent'] = result if result[k].is_a?(Hash) and
								result[k].has_key?('_parent')
						end
					}
					result
				elsif value.is_a?(Array)
					result = value.clone
					result.clear
					result.each { |v| result << deep_clone(v) }
					result
				else
					value
				end
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

			# return true if global constraint could be applied, otherwise false
			def apply_global_constraint(operator)
				return true if not @root.has_key?('global') or not @root['global'].isconstraint

				def satisfy_equals(left, right, operator)
					return false if operator.has_key?(left) and operator[left].post != nil and
						operator[left].post != right['_value']
					return true
				end


				def satisfy_and(constraint, operator)
					constraint.each { |k,v|
						next if k[0,1] == '_'
						# 1) x = y
						return false if not satisfy_equals(k, v, operator)
						# 2) x in (y1, y2, y3) := x = y1 | y2 | y3 -- TODO
						# 3) if x1 = y1 then x2 = y2 := not (x1=y1) or x2=y2 -- TODO
					}
					return true
				end

				# global constraint is AND formula
				return satisfy_and(@root['global'], operator) if @root['global']['_type'] == 'and'
				
				# global constraint is OR formula
				total = 0
				satisfied = Array.new
				@root['global'].each { |k,v|
					next if k[0,1] == '_'
					total += 1
					satisfied << k if satisfy_and(v, operator)
				}
				if satisfied.length < total
					# partial satisfaction or OR formula
					satisfied.each { |key|
						# create an operator for each satisfied sub-formula
						op = operator.clone
						map_cond = and_equals_constraint_to_map(@root['global'][key])
						map_cond.each { |k,v|
							next if k[0,1] == '_'
							raise VariableNotFoundException, k if not @variables.has_key?(k)
							if not op.has_key?(@variables[k].name)
								op[@variables[k].name] = Parameter.new(@variables[k], v, nil)
							else
								#op[@variables[k].name].pre = v
							end
						}
						@operators[op.name] = op
					}
					# the original operator is not required
					return false
				end

				return true
			end

			# normalize the given first-order formula by transforming it into
			# AND/OR clauses
			def normalize_formula(formula)
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
					var_name = parent + '.' + names[index]
					if index >= names.length or (index >= names.length-1 and last_value != nil)
						selected[var_name] = last_value if last_value != nil
						last_names << var_name if last_names != nil
						result = selected.clone
						result['_context'] = 'constraint'
						result['_type'] = 'and'
						bucket << result
					elsif not @variables.has_key?(var_name)
						raise VariableNotFoundException, var_name + ' is not exist!'
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
#puts 'nested-left-only: ' + left
					names, rest = break_nested_reference(left)
					bucket = Array.new
					ref_combinator(bucket, rest, names, right)
					key = Nuri::Sfp::Sas.next_constraint_key
					formula[key] = array_to_or_constraint(bucket)
					formula.delete(left)
					to_and_or_graph(formula[key])
					return key
				end

				# transform a first-order formula into AND/OR graph
				def to_and_or_graph(formula)
					formula.each { |k,v|
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
					formula.each { |k,v|
						next if k[0,1] == '_'
						if v.is_a?(Hash) and v.isconstraint
							if v['_type'] == 'or' or v['_type'] == 'and'
								if not flatten_and_or_graph(v)
									# remove it because it's not consistent
									formula.delete(k)
									v['_parent'] = nil
								end

								if formula['_type'] == v['_type']
									# pull-out all node's elements
									v.each { |k1,v1|
										next if k1[0,1] == '_'
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
					def dot_product_and(bucket, names, formula, values=Hash.new, index=0)
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
									dot_product_and(bucket, names, formula, values, index+1)
									values.delete(k)
								}
							else
								values[key] = val
								dot_product_and(bucket, names, formula, values, index+1)
							end
						end
					end
					if is_and_or_tree
						# change it into OR->AND tree
						names = Array.new
						formula.keys.each { |k| names << k if k[0,1] != '_' }
						bucket = Array.new
						dot_product_and(bucket, names, formula)
						names.each { |k| formula.delete(k) }
						formula['_type'] = 'or'
					end

					return true
				end

				# 'var_name' := x, value := p1
				# variable x := p1 | p2 | p3
				# return an array (p2, p3)
				def get_list_not_value_of(var_name, value)
					raise VariableNotFoundException, var_name + ' cannot be found' if
						not @variables.has_key?(var_name)
					if value.is_a?(String) and value.isref
						value = @root['initial'].at?(value)
					elsif value.is_a?(Hash) and value.isnull
						value = @variables[var_name][0]
					end
					return (@variables[var_name] - [value])
				end

				# variable x := p1 | p2 | p3
				# then formula := x not-equals p1 is transformed into
				# formula := (x equals p2) or (x equals p3)
				def not_equals_statement_to_or_constraint(formula)
					formula.each { |k,v|
						next if k[0,1] == '_'
						if v.is_a?(Hash) and v.isconstraint
							if v['_type'] == 'or' or v['_type'] == 'and'
								not_equals_statement_to_or_constraint(v)
							elsif v['_type'] == 'not-equals'
								key1 = Nuri::Sfp::Sas.next_constraint_key
								c_or = create_or_constraint(key1, formula)
								get_list_not_value_of(k, v['_value']).each { |val1|
									val1 = val1.ref if val1.is_a?(Hash) and val1.isobject
									key2 = Nuri::Sfp::Sas.next_constraint_key
									c_and = create_and_constraint(key2, c_or)
									c_and[k] = create_equals_constraint(val1)
									c_or[key2] = c_and
								}
								formula.delete(k)
								formula[key1] = c_or
							end
						end
					}
				end

				# remove all NOT constraints in the given formula by transforming them
				# into EQUALS, NOT-EQUALS, AND, OR constraints
				def remove_not_constraint(formula)
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
										remove_not_constraint(c_not)
									}
								when 'or'
									v['_type'] = 'and'
									v.each { |k1,v1|
										k2 = Nuri::Sfp::Sas.next_constraint_key
										c_not = create_not_constraint(k2, v)
										c_not[k1] = v1
										v1['_parent'] = c_not
										v.delete(k1)
										remove_not_constraint(c_not)
									}
								else
									raise Exception, 'unknown rules: ' + v['_type']
								end
							end
						}
					else
						formula.each { |k,v|
							next if k[0,1] == '_'
							remove_not_constraint(v) if v.is_a?(Hash) and v.isconstraint
						}
					end
				end

				remove_not_constraint(formula)
				to_and_or_graph(formula)
				not_equals_statement_to_or_constraint(formula)
				return flatten_and_or_graph(formula)
			end

		end

		class VariableNotFoundException < Exception
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
				raise VariableNotFoundException, name if not @vars.has_key?(name)
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

			def visit(name, value, obj)
				return false if name[0,1] == '_' or (value.is_a?(Hash) and not (value.isobject or value.isnull))
				var_name = obj.ref.push(name)
				isfinal = self.is_final(value)
				isref = (value.is_a?(String) and value.isref)
				value = @init.at?(value) if value.is_a?(String) and value.isref
				type = (isfinal ? self.isa?(value) : self.get_type(name, value, obj))
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

			def visit(name, value, obj)
				return if name[0,1] == '_' and name != '_value'
				if name[0,1] != '_'
					map.each { |k,v|
						next if k.length > name.length
						if name[0,k.length] == k
							grounded = v
							grounded += name[k.length, (name.length-k.length)] if name.length > k.length
							obj[grounded] = value
							obj.delete(name)
							name = grounded
							break
						end
					}
				end
				if value.is_a?(String) and value.isref
					map.each { |k,v|
						if value == k
							obj[name] = v
							break
						elsif value.length > k.length and value[0, k.length] == k and value[k.length] == '.'
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
			attr_accessor :id, :name, :cost, :params
			attr_reader :ref

			def initialize(ref, cost=1, id=nil)
				@id = (id == nil ? Nuri::Sfp::Sas.next_operator_id : id)
				@cost = cost
				@ref = ref
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

			def to_s; return @name + ': ' + self.length.to_s ; end

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
		end
	end
end
