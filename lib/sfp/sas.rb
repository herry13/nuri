# 01-07-2012
# - collecting classes and variables
# - foreach subclasses, inherits attributes and procedures from superclass
# - foreach objects, inherits attributes and procedures from class

require 'json'

module Nuri
	module Sfp

		def self.null_of(class_ref=nil)
			return nil if not class_ref.is_a?(String) or not class_ref.ref?
			return { '_context' => 'null', '_isa' => class_ref } if class_ref != nil and class_ref != ''
		end

		# include 'Sas' module to enable processing Sfp into Finite-Domain Representation (FDR)
		module Sas
			GLOBAL_OPERATOR = '#global_op'
			GLOBAL_VARIABLE = '#global_var'

			def to_sas
				root = self.to_context
				@variables = Hash.new
				@types = { 'boolean' => [true, false],
					'number' => Array.new,
					'string' => Array.new
				}
				@operators = Hash.new
				@axioms = Array.new

				# foreach subclass, inherits superclass
				root.accept(ClassExpander.new(root))
				# foreach object, inherits class
				root['init'].accept(ObjectExpander.new(root))

				# collect classes
				root.accept(Nuri::Sfp::ClassCollector.new(@types))

				# collect variables
				root['init'].accept(Nuri::Sfp::VariableCollector.new(root, @variables, @types))
				# set goal value
				root['goal'].delete('_parent')
				root['goal'].accept(GoalSetter.new(root, @variables, @types))

				# collect all values
				root.accept(Nuri::Sfp::ValueCollector.new(@types))
				# remove duplicates from type's set of value
				@types.each_value { |type| type.uniq! }

				# set domain values for each variable
				self.setVariableValues

				# generate operator and axioms for global constraints
				self.setGlobalConstraint if root.has_key?('global')

				# search procedures and generate grounded-operators
				#root['init'].accept(Nuri::Sfp::ProcedureVisitor.new(root, @variables, @types))

				self.dump_types
				self.dump_vars
				self.dump_operators

				#root.accept(ParentEliminator.new)
				#puts JSON.pretty_generate(root)
			end

			def setGlobalConstraint
				var = Variable.new(GLOBAL_VARIABLE, 'boolean', -1, true, true, false)
				@variables[var.name] = var
				
				op = Operator.new(GLOBAL_OPERATOR)
				op[var] = Parameter.new(var, true, true)
				@operators[op.name] = op
			end

			# set possible values for each variable
			def setVariableValues
				@variables.each_value { |var|
					var.goal = var.init if var.final # init = goal if this is a final variable
					var << var.init if var.init != nil and not var.init.ref? and not var.init.null?
					var << var.goal if var.goal != nil and not var.goal.ref? and not var.goal.null?
					if not var.final
						# if not a final variable, add all its type's values
						@types[var.type].each { |item| var << item if not item.ref? }
					end
					var.uniq!
				}
			end

			def dump_types
				puts '--- types'
				@types.each_pair { |name,values|
					next if values == nil
					print name + ": "
					values.each { |val|
						if val.null?
							print 'null '
						elsif val.isobject?
							print val.name + " "
						else
							print val.to_s + " "
						end
					}
					puts ''
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
		end

		# remove '_parent' attribute (mainly to avoid cyclic in JSON)
		class ParentEliminator
			def visit(name, value, ref)
				value.delete('_parent') if value.is_a?(Hash) and value.has_key?('_parent')
				return true
			end
		end

		# this exception is thrown if a variable is not exist
		class VariableNotFoundException < Exception
		end

		# generate Visitor class which has 3 attributes
		# - root : Hash instance of root Context
		# - variables: Hash instance that holds all Variable instances
		# - types: Hash instance that holds all types (primitive or non-primitive)
		class Visitor
			def initialize(root, variables=nil, types=nil)
				@root = root
				@vars = variables
				@types = types
			end
		end

		# Visitor that process all procedure contexts
		class ProcedureVisitor < Visitor
			def visit(name, value, ref)
				return if name[0,1] == '_'
				puts 'procedure: ' + ref.push(name) if value.isprocedure?
				# TODO
				return true
			end
		end

		# Visitor that set goal value of each variable
		class GoalSetter < Visitor
			def equals(name, value)
				value['_isa'] = @vars[name].type if value.null?
				@vars[name].goal = value if @vars.has_key?(name)
			end

			def visit(name, value, ref)
				return if name[0,1] == '_'
				raise VariableNotFoundException, name if not @vars.has_key?(name)
				if value.isconstraint?
					self.equals(name, value['_value']) if value['_type'] == 'equals'
				end
				return true
			end
		end

		# visit all subclasses, and foreach subclass call method 'inherits'
		# to copy non-exist attributes and procedures into itself
		class ClassExpander < Visitor
			def visit(name, value, ref)
				return if not value.is_a?(Hash) or not value.isclass? or value.extends? == nil
				parent = @root.at?(value.extends?)
				parent.accept(self) if not parent.expanded?
				value.inherits(parent)
				return true
			end
		end

		# visit all objects, foreach object call method 'inherits'
		# to copy non-exist attributes and procedures into itself
		class ObjectExpander < Visitor
			def visit(name, value, ref)
				return if not value.is_a?(Hash) or not value.isobject? or value.isa? == nil
				parent = @root.at?(value.isa?)
				value.inherits(parent)
				return true
			end
		end

		# superclass of collector class of 'Hash' (based on Visitor pattern)
		class Collector
			def initialize(bucket)
				@bucket = bucket
			end
		end

		# collecting all classes and put them into @bucket
		class ClassCollector < Collector
			def visit(name, value, ref)
				if value.respond_to?('isclass?') and value.isclass?
					varname = ref.push(name)
					@bucket[varname] = Array.new
					@bucket[varname] << Nuri::Sfp.null_of(varname)
				end
			end
		end

		# collecting all variables and put them into @bucket
		class VariableCollector < Collector
			def initialize(root, var_bucket, type_bucket)
				super(var_bucket)
				@root = root
				@types = type_bucket
			end

			def visit(name, value, ref)
				return false if name[0,1] == '_' or not value.isvalue?
				isfinal = (not value.ref? and not value.null? and value.isobject?)
				value = value.resolve(@root['init']) if value.ref?
				var = Variable.new(ref.push(name), value.isa?, -1, value, nil, isfinal)
				@bucket[var.name] = var
				@types[value.isa?].push(value) if value.isa? != nil and not value.ref? and not value.null?
				return true
			end
		end

		# Collects all values (primitive or non-primitive)
		class ValueCollector < Collector
			def visit(name, value, ref)
				@bucket[value.isa?] << value if not 
					((name[0,1] == '_' and name != '_value') or not value.isvalue? or
						value.ref? or value.is_a?(TrueClass) or value.is_a?(FalseClass) or
						value.null?) and value.isa? != nil
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
			attr_accessor :name, :type, :layer, :init, :goal, :final

			def initialize(name, type, layer=-1, init=nil, goal=nil, final=false)
				@name = name
				@type = type
				@layer = layer
				@init = init
				@goal = goal
				@final = final
			end

			def to_s
				s = @name + ', ' + @type 
				s += ', ' + (@init == nil ? '' : (@init.null? ? 'null' : (@init.isobject? ? @init.name.to_s : @init.to_s)))
				s += ', ' + (@goal == nil ? '' : (@goal.null? ? 'null' : (@goal.isobject? ? @goal.name.to_s : @goal.to_s)))
				s += ', ' + (@final ? 'final' : 'notfinal') + "\n"
				s += "["
				self.each { |value| s += (value.null? ? 'null' : (value.isobject? ? value.name.to_s : value.to_s)) + ',' }
				s = s.chop + "]"
				return s
			end

			# return variable representation in SAS+ format
			def to_sas
				sas = "begin_variable\n#{@name}\n" + @layer.to_s + "\n" + self.length + "\n"
				self.each { |value| sas += value.to_s + "\n" }
				return sas + "end_variable"
			end
		end

		class Operator < Hash
			@@id = 0

			def self.nextId; return ++@@id; end

			attr_accessor :id, :name

			def initialize(name)
				@id = Nuri::Sfp::Operator.nextId
				@name = name
			end

			def to_s; return @name + ': ' + self.length.to_s ; end

			def to_sas
				# TODO
			end
		end

		class Axiom < Hash
			@@id = 0

			def self.nextId; return ++@@id; end

			attr_accessor :id

			def initialize
				@id = Nuri::Sfp::Axiom.nextId
			end

			def to_sas
				#TODO
			end
		end

		class Parameter
			attr_accessor :var, :pre, :post

			def initialize(var, pre, post=nil)
				@var = var
				@pre = pre
				@post = post
			end

			def prevail?; return (@post == nil); end

			def effect?; return (@post != nil); end
		end
	end
end
