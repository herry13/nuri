# 01-07-2012
# - collecting classes and variables
# - foreach subclasses, inherits attributes and procedures from superclass
# - foreach objects, inherits attributes and procedures from class

module Nuri
	module Sfp
		# include 'Sas' module to enable processing Sfp into Finite-Domain Representation (FDR)
		module Sas
			def to_sas
				root = self.to_context
				@variables = Hash.new
				@types = { 'boolean' => Array.new,
					'number' => Array.new,
					'string' => Array.new,
					'reference' => Array.new
				}
				# collect classes
				root.accept(Nuri::Sfp::ClassCollector.new(@types))
				# collect variables
				root['current'].accept(Nuri::Sfp::VariableCollector.new(@variables, @types))

				# debugging
				puts @variables.keys.inspect #debug
				dump_types #debug
				puts root['current'].at?('$.a').name #debug
				puts root['current'].at?('a').name #debug
				
				# foreach subclass, inherits superclass
				root.accept(ClassExpander.new(root))
				# foreach object, inherits class
				root['current'].accept(ObjectExpander.new(root))
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
		end

		# visit all subclasses, and foreach subclass call method 'inherits'
		# to copy non-exist attributes and procedures into itself
		class ClassExpander
			def initialize(root)
				@root = root
			end

			def visit(name, value, ref)
				return if not value.is_a?(Hash) or not value.isclass? or value.extends? == nil
				parent = @root.at?(value.extends?)
				parent.accept(self) if not parent.expanded?
				value.inherits(parent)
			end
		end

		# visit all objects, foreach object call method 'inherits'
		# to copy non-exist attributes and procedures into itself
		class ObjectExpander
			def initialize(root)
				@root = root
			end

			def visit(name, value, ref)
				return if not value.is_a?(Hash) or not value.isobject? or value.isa? == nil
				parent = @root.at?(value.isa?)
				value.inherits(parent)
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
			def initialize(var_bucket, type_bucket)
				super(var_bucket)
				@types = type_bucket
			end

			def visit(name, value, ref)
				return if name[0,1] == '_' or not value.isvalue?
				var = Variable.new(ref.push(name), value.isa?, -1, value)
				@bucket[var.name] = var
				@types[value.isa?].push(value) if value.isa? != nil
			end
		end

		# SAS variable
		# Each variable is a finite-domain which means it has a finite set of possible values
		class Variable < Array
			# @name -- name of variable
			# @type -- type of variable ('string','boolean','number', or fullpath of a class)
			# @layer -- axiom layer ( '-1' if this is not axiom variable, otherwise >0)
			# @init -- initial value
			# @goal -- goal value (desired value)
			attr_accessor :name, :type, :layer, :init, :goal

			def initialize(name, type, layer=-1, init=nil, goal=nil)
				@name = name
				@type = type
				@layer = layer
				@init = init
				@goal = goal
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
				return @name
			end

			# return variable representation in SAS+ format
			def to_sas
				sas = "begin_variable\n#{@name}\n" + @layer.to_s + "\n" + self.length + "\n"
				self.each { |value| sas += value.to_s + "\n" }
				return sas + "end_variable"
			end
		end
	end
end
