# 01-07-2012
# - collecting classes and variables
# - foreach subclasses, inherits attributes and procedures from superclass
# - foreach objects, inherits attributes and procedures from class

require 'json'

module Nuri
	module Sfp

		def self.null_of(class_ref=nil)
			return { '_context' => 'null', '_isa' => class_ref } if class_ref.is_a?(String) and class_ref != '' and class_ref.isref
			return nil
		end

		# include 'Sas' module to enable processing Sfp into Finite-Domain Representation (FDR)
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
				@root['initial'].accept(VariableCollector.new(@root['initial'], @variables, @types))

				# process goal constraint
				if @root.has_key?('goal') and @root['goal'].isconstraint
					@root['goal'].delete('_parent')
					# set goal value
					@root['goal'].accept(GoalVisitor.new(self))

					# collect all value in goal constraint
					@root['goal'].accept(Nuri::Sfp::ValueCollector.new(@types))
				end

				# process global constraint
				if @root.has_key?('global') and @root['global'].isconstraint
					@root['global'].delete('_parent')

					# collect all value in global constraint
					@root['global'].accept(Nuri::Sfp::ValueCollector.new(@types))

					# TODO
					# 1) - add the global constraint in goal constraint
					#    - generate additional axioms/operators
					# 2) compile using Patrik's approach
				end
				# remove duplicates from type's set of value
				@types.each_value { |type| type.uniq! }

				@root['global'].accept(FormulaNormalizer.new(self)) if
					@root.has_key?('global') and @root['global'].isconstraint

				# process all procedures
				@variables.each_value { |var|
					if var.is_final
						var.init.each { |k,v|
							process_procedure(v, var.init) if v.is_a?(Hash) and v.isprocedure
						}
					end
				}

				# set domain values for each variable
				self.set_variable_values

				self.dump_types
				self.dump_vars
				self.dump_operators

=begin
				# generate operator and axioms for global constraints
				self.process_global_constraints(@root) if @root.has_key?('global')

				self.dump_axioms
=end
			end

			# return the next operator id
			def next_operator_id
				return (@op_id += 1) if defined?(@op_id) != nil
				@op_id = 0
				return @op_id
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

			# process grounded operator (no parameter exists)
			def process_operator(op, object)
				map_cond = process_conditions(op['_conditions'])
				map_eff = process_effects(op['_effects'])

				# combine map_cond & map_eff if any of them has >1 items

				op_id = next_operator_id
				op_name = 'op' + op_id.to_s + '_' + op['_parent'].ref + '.' + op['_self']
				sas_op = Operator.new(op_name, op['_cost'], op_id)
				keys = map_cond.keys.concat(map_eff.keys)
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
					operators.each { |op| process_operator(op, object) }
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
					@types[c] << Nuri::Sfp.null_of(c)
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
				@operators.each_value { |op| puts op.to_s }
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
					value.each { |k,v| result[k] = deep_clone(v) if k != '_parent' }
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
					end
				}
			end

			# return true if global constraint could be applied, otherwise false
			def apply_global_constraint(op)
				return true if not @root.has_key?('global') or not @root['global'].isconstraint

				@root['global'].each { |k,v|
					next if k[0,1] == '_'
					# 1) x = y
					if v['_type'] == 'equals' and op.has_key?(k) and op[k].post != nil
						return false if v['_value'] != op[k].post
						#puts '==>> ' + v['_value'].to_s + ' == ' + op[k].post.to_s
					end

					# 2) x in (y1, y2, y3) := x = y1 | y2 | y3

					# 3) if x1 = y1 then x2 = y2 := not (x1=y1) or x2=y2
				}

				return true
			end

		end

		# Visitor class has 3 attributes
		# - root : Hash instance of root Context
		# - variables: Hash instance that holds all Variable instances
		# - types: Hash instance that holds all types (primitive or non-primitive)
		class Visitor
			def initialize(main) #, root, variables=nil, types=nil)
				@main = main
				@root = main.root
				@vars = main.variables
				@types = main.types
			end
		end

		class FormulaNormalizer < Visitor
			def visit(name, value, obj)
				# TODO
				# 1) not (x=y1), x in (y1, y2, y3) := x=y2 or x=y3
				# 2) if x1=y1 then x2=y2 := not (x1=y1) or (x2=y2)
				# 3) x in (y1, y2, y3) := (x=y1) or (x=y2) or (x=y3)

				return true
			end
		end

		# Visitor that set goal value of each variable
		class GoalVisitor < Visitor
			def set_equals(name, value)
				value['_isa'] = @vars[name].type if value.is_a?(Hash) and value.isnull
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
		class VariableCollector
			def initialize(root, var_bucket, type_bucket)
				@root = root
				@bucket = var_bucket
				@types = type_bucket
			end

			def visit(name, value, obj)
				return false if name[0,1] == '_' or (value.is_a?(Hash) and not (value.isobject or value.isnull))
				isfinal = self.is_final(value)
				isref = (value.is_a?(String) and value.isref)
				value = @root.at?(value) if value.is_a?(String) and value.isref
				type = self.is_a(value)
				var = Variable.new(obj.ref.push(name), type, -1, value, nil, isfinal)
				@bucket[var.name] = var
				if isfinal and value.is_a?(Hash)
					value['_classes'].each { |c| @types[c] << value }
				elsif not isref
					@types[ type ] << value
				end
				return true
			end

			def is_a(value)
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
						if name[0,k.length] == k
							grounded = v + name[k.length, (name.length-k.length)]
							obj[grounded] = value
							obj.delete(name)
							name = grounded
							break
						end
					}
				end
				if value.is_a?(String) and value.isref
					map.each { |k,v|
						if value[0, k.length] == k
							grounded = v + value[k.length, (value.length-k.length)]
							obj[name] = grounded
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
			@@id = 0

			def self.nextId
				@@id += 1
				return @@id
			end

			# @name -- name of variable
			# @type -- type of variable ('string','boolean','number', or fullpath of a class)
			# @layer -- axiom layer ( '-1' if this is not axiom variable, otherwise >0)
			# @init -- initial value
			# @goal -- goal value (desired value)
			attr_accessor :name, :type, :layer, :init, :goal, :is_final

			def initialize(name, type, layer=-1, init=nil, goal=nil, is_final=false)
				@name = name
				@type = type
				@layer = layer
				@init = init
				@goal = goal
				@is_final = is_final
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
			def to_sas
				sas = "begin_variable\n#{@name}\n" + @layer.to_s + "\n" + self.length + "\n"
				self.each { |value| sas += value.to_s + "\n" }
				return sas + "end_variable"
			end
		end

		# A class for Grounded Operator
		class Operator < Hash
			@@id = 0

			# return the next operator #id
			def self.nextId
				@@id += 1
				return @@id
			end

			attr_accessor :id, :name, :cost

			def initialize(name, cost=1, id=nil)
				@id = (id == nil ? Nuri::Sfp::Operator.nextId : id)
				@name = name
				@cost = cost
			end

			def to_s; return @name + ': ' + self.length.to_s ; end

			def to_sas
				# TODO
			end
		end

		# A class for Grounded Axiom
		class Axiom < Hash
			@@id = 0

			def self.nextId
				@@id += 1
				return @@id
			end

			attr_accessor :id, :target

			def initialize
				@id = Nuri::Sfp::Axiom.nextId
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

			def to_s
				return @var.name + ',' +
					(@pre == nil ? '-' : (@pre.is_a?(Hash) ? @pre.tostring : @pre.to_s)) + ',' +
					(@post == nil ? '-' : (@post.is_a?(Hash) ? @post.tostring : @post.to_s))
			end
		end
	end
end
