# 01-07-2012
# - collecting classes and variables
# - foreach subclasses, inherits attributes and procedures from superclass
# - foreach objects, inherits attributes and procedures from class

require 'json'

module Nuri
	module Sfp
		# include 'Sas' module to enable processing Sfp into Finite-Domain Representation (FDR)
		module Sas
			def to_sas
				root = self.to_context
				@variables = Hash.new
				@types = { 'boolean' => Array.new,
					'number' => Array.new,
					'string' => Array.new
				}

				# foreach subclass, inherits superclass
				root.accept(ClassExpander.new(root))
				# foreach object, inherits class
				root['current'].accept(ObjectExpander.new(root))

				# collect classes
				root.accept(Nuri::Sfp::ClassCollector.new(@types))

				# collect variables
				root['current'].accept(Nuri::Sfp::VariableCollector.new(root, @variables, @types))
				# set goal value
				root['desired'].delete('_parent')
				root['desired'].accept(GoalSetter.new(root, @variables, @types))
				# remove duplicates from type's set of value
				@types.each_value { |type| type.uniq! }

				root['current'].accept(Nuri::Sfp::ProcedureVisitor.new(root, @variables, @types))

				self.dump_types
				self.dump_vars

				#root.accept(ParentEliminator.new)
				#puts JSON.pretty_generate(root)
			end

			def dump_types
				@types.each_pair { |name,values|
					next if values == nil
					print name + ": "
					values.each { |val|
						print val.to_s + " " if not val.isobject?
						print val.name + " " if val.isobject?
					}
					puts ''
				}
			end

			def dump_vars
				@variables.each_value { |value| puts value.to_s }
			end
		end

		class ParentEliminator
			def visit(name, value, ref)
				value.delete('_parent') if value.is_a?(Hash) and value.has_key?('_parent')
				return true
			end
		end

		class VariableNotFoundException < Exception
		end

		class Visitor
			def initialize(root, variables=nil, types=nil)
				@root = root
				@vars = variables
				@types = types
			end
		end

		class ProcedureVisitor < Visitor
			def visit(name, value, ref)
				return if name[0,1] == '_'
				puts 'procedure: ' + ref.push(name) if value.isprocedure?
				# TODO
				return true
			end
		end

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
				@bucket[ref.push(name)] = Array.new if value.respond_to?('isclass?') and value.isclass?
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
				value = value.resolve(@root['current']) if value.ref?
				var = Variable.new(ref.push(name), value.isa?, -1, value, nil, isfinal)
				@bucket[var.name] = var
				@types[value.isa?].push(value) if not value.ref? and not value.null?
				return true
			end
		end

		class HashToNilSetter
			def initialize(root)
				@root = root
			end

			def visit(name, value, ref)
				return if name[0,1] == '_' or not value.is_a?(Hash) or not value.null?
				val = (nil).isa(@root.at?(ref.push(name)).isa?)
				puts "\t" + ref.push(name) + " is ref-type"
				puts "\t" + @root.at?(ref.push(name)).keys.inspect
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

			# add new possible value, then remove any duplicate
			def push(value)
				super.push(value)
				self.uniq!
			end

			# add new possible value, then remove any duplicate
			def unshift(value)
				super.unshift(value)
				self.uniq!
			end

			def to_s
				s = @name + ', ' + @type 
				s += ', ' + (@init == nil ? '' : (@init.null? ? 'null' : (@init.isobject? ? @init.name.to_s : @init.to_s)))
				s += ', ' + (@goal == nil ? '' : (@goal.null? ? 'null' : (@goal.isobject? ? @goal.name.to_s : @goal.to_s)))
				s += ', ' + (@final ? 'final' : 'notfinal')
				return s
			end

			# return variable representation in SAS+ format
			def to_sas
				sas = "begin_variable\n#{@name}\n" + @layer.to_s + "\n" + self.length + "\n"
				self.each { |value| sas += value.to_s + "\n" }
				return sas + "end_variable"
			end
		end

		class Operator
			attr_accessor :name, :params

			def initialize(name)
				@name = name
				@params = Hash.new
			end
		end
	end
end
