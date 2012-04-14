#!/usr/bin/env ruby

require 'Context'
require 'Reference'

module Sfplanner
	module Planner
		class ContextToSAS
			attr_accessor :sas, :root, :variables, :types, :var_id, :use_cost
			attr_accessor :init, :goal, :global, :final, :types, :variables, :actions

			def initialize(context)
				@root = context
				@variables = Hash.new
				@types = Hash.new
				@var_id = 0
				@use_cost = false

				@types = Hash.new
				@variables = Hash.new
				@actions = Hash.new

				processContext
				generate_sas
			end

			def generate_sas #TODO
				@sas = version_to_sas +
					metric_to_sas +
					variables_to_sas +
					mutex_to_sas +
					initial_to_sas +
					goal_to_sas +
					operators_to_sas +
					axioms_to_sas
			end

			def version_to_sas
				return "begin_version\n3\nend_version\n"
			end

			def metric_to_sas
				return "begin_metric\n" + (@use_cost ? '1' : '0') + "\nend_metric\n"
			end

			def variables_to_sas #TODO
				sas = ''
				@variables.each { |name,var|
					sas += var.to_sas
				}
				return sas
			end

			def mutex_to_sas
				return "0\n"
			end

			def initial_to_sas #TODO
				sas = ''
				return sas
			end

			def goal_to_sas #TODO
				sas = ''
				return sas
			end

			def operators_to_sas #TODO
				sas = ''
				return sas
			end

			def axioms_to_sas #TODO
				sas = ''
				return sas
			end

			# a method to translator Context into SAS+
			def processContext
				# TODO

				# 1) populate type values
				populateTypeValues

				# 2) extract init, goal, global, final from root
				@init = @root.remove('init')
				@goal = @init.remove('goal')
				@global = @init.remove('global')
				@final = @init.remove('final')

				# 3) populate variables
				populateVariables

				# 4) for each variable, set its goal value
				setVariablesGoalValue(@goal)
				setVariablesGoalValue(@global)

				puts "\n>> variables:"
				@variables.each { |key,var| puts var.to_s }
			end

			def setVariablesGoalValue(goal)
				goal.attributes.each { |key,value|
					ref = Sfplanner::Lang::Reference.new(key).strip_prefix_root
					
					if value.is_a?(Sfplanner::Lang::Reference)
						if @variables.has_key?(ref.to_sfp)
						else
						end
					else # the value is not a reference
						if @variables.has_key?(ref.to_sfp)
							@variables[ref.to_sfp].goal = value
						else
							create_axioms(ref, value)
						end
					end
					
					#create_axioms(ref, value)
					puts '<<-- ' + ref.to_s + " := " + value.to_s + "\n"

=begin					
					if @variables.has_key?(ref.to_sfp)
						if value.is_a?(Sfplanner::Lang::Reference)
							value = @init.get(value ,false)
						end
						#@variables[ref.to_sfp].goal = value
						axioms = create_axioms(ref, value)
					else
						puts "undefined: " + ref.to_sfp
					end
=end
				}
			end

			def create_axioms(ref, value=nil)
				# TODO
				# - $x = (non)primitive value
				# - $x = $reference
				# - $x = not (non)primitive value
				# - $x = not $reference
				# - $x in Set
				# - $x not in Set
				if value != nil
					if not value.is_a?(Sfplanner::Lang::Reference)
						left = get_molecules(ref, value)
						left.each { |p| puts ">> " + p.to_s }
						
					else
						left = get_molecules(ref)
						right = get_molecules(value)
						
						left.each { |p| puts ">> " + p.to_s }
						right.each { |p| puts ">>>> " + p.to_s }
					end
				end
			end
=begin
			def cross_molecules(p1, p2)
				p = Molecule.new
				p1.each { |a| p.add(a) }
				p2.each { |a| p.add(a) }
			end
=end
			def get_molecules(ref, value=nil)
				bucket = Set.new
				total = ref.total_parts
				names = Array.new(total)
				values = Array.new(total)
				values[total-1] = value
				generate_molecules(bucket, ref, names,values, 0, total)
				return bucket
			end

			def generate_molecules(bucket, ref, names, values, index, max)
				if index >= max
					molecule = Molecule.new
					(0..max-1).each { |i|
						molecule.add( Atom.new( @variables[names[i]], values[i] ) )
					}
					bucket.add(molecule)
					return
				end
				names[index] = ref.get_first
				if index > 0
					names[index] = values[index-1].get_reference.
						append(names[index]).strip_prefix_root.path
				end
				names[index] = Sfplanner::Lang::PREFIX + names[index]

				nextref = ref.get_next_reference
				if values[index] != nil
					generate_molecules(bucket, nextref, names, values, index+1, max)
				else
					val = @init.get( Sfplanner::Lang::Reference.new(names[index]) )
					if val.is_a?(Sfplanner::Lang::ContextObject)
						values[index] = val
						generate_molecules(bucket, nextref, names, values, index+1, max)
					else
						var = @variables[ names[index] ]
						var.values.each { |val|
							values[index] = val
							generate_molecules(bucket, nextref, names, values, index+1, max)
						}
					end
				end
			end

			def populateTypeValues
				visitor = TypeValueCollector.new(self, @root)
				@root.accept(visitor)
				if @types.has_key?(Sfplanner::Lang::TYPE_BOOLEAN)
					add_type_value(Sfplanner::Lang::TYPE_BOOLEAN, true)
					add_type_value(Sfplanner::Lang::TYPE_BOOLEAN, false)
				end
				@types.each { |key,type|
					print key.to_s + ": "
					msg = ''
					type.each { |val| msg += val.to_s + "," }
					puts msg.chop
				}
			end

			def populateVariables
				visitor = VariableCollector.new(self, @init)
				@init.accept(visitor)
				@variables.each { |name,var|
					value = @init.get(Sfplanner::Lang::Reference.new(name))
					if value.is_a?(Sfplanner::Lang::Reference)
						var.values = @types[var.type]
					else
						var.values = Array[value]
					end
				}
			end

			def get_variable(name)
				if @variables.has_key?(name)
					return @variables[name]
				end
				return nil
			end

			def new_variable(name, init=nil, goal=nil, type=nil, layer=-1)
				var = Variable.new(@var_id, name, init, goal, type, layer)
				@var_id += 1
				return var
			end

			def register_variable(root, ref, init, goal=nil)
				if get_variable(ref.to_s) == nil
					if init.is_a?(Sfplanner::Lang::Reference)
						init = root.get( init, false )
					end
					type = get_type( init )
					var = new_variable(ref.to_sfp, init, goal, type)
					@variables[var.name] = var
				end
			end

			def add_type_value(type, value)
				if not @types.has_key?(type)
					@types[type] = Set.new
				end
				@types[type].add(value)
			end

			def get_type(value)
				if value.is_a?(Sfplanner::Lang::ContextObject)
					return (value.supertype == nil ? Sfplanner::Lang::TYPE_OBJECT : value.supertype)
				elsif value.is_a?(String)
					return Sfplanner::Lang::TYPE_STRING
				elsif value.is_a?(Integer)
					return Sfplanner::Lang::TYPE_INTEGER
				elsif value.is_a?(Float)
					return Sfplanner::Lang::TYPE_FLOAT
				elsif value.is_a?(TrueClass) or value.is_a?(FalseClass)
					return Sfplanner::Lang::TYPE_BOOLEAN
				end
			end
		end

		class Molecule < Set
			def to_axiom(variable, preValue, postValue)
				@variable = variable
				effect = Condition.new(variable, preValue, postValue)
				axiom = Axiom.new(effect)
				self.each { |atom|
					axiom.conditions.push( atom.to_condition )
				}
			end
		
			def combine(molecule)
				p = Molecule.new
				self.each { |a| p.add(a) }
				molecule.each { |b| p.add(b) }
				return p
			end

			def to_s
				s = ''
				self.each { |a| s += a.to_s + ',' }
				return s.chop
			end
		end

		class Axiom
			attr_accessor :conditions, :effect

			def initialize(effect=nil)
				@conditions = Array.new
				@effect = effect
			end

			def to_sas
				sas = "begin_rule\n"
				@conditions.each { |param|
					sas += param.to_sas + "\n"
				}
				sas += @effect.to_sas + "\n"
				sas += "end_rule\n"
				return sas
			end
		end

		class Atom
			attr_accessor :variable, :value

			def initialize(var, val)
				@variable = var
				@value = val
			end

			def to_condition
				return Condition.new(@variable, @value)
			end

			def to_s
				return variable.name + "=" + value.to_s
			end
		end

		class Collector < Sfplanner::Lang::ContextVisitor
			attr_accessor :translator, :root

			def initialize(translator, root)
				@translator = translator
				@root = root;
			end
		end

		class TypeValueCollector < Collector
			def visit(ref, value)

				if value.is_a?(Sfplanner::Lang::ContextObject) or
					value.is_a?(String) or
					value.is_a?(Float) or
					value.is_a?(Integer) or
					value.is_a?(TrueClass) or
					value.is_a?(FalseClass)

					type = translator.get_type(value)
					translator.add_type_value(type, value)
				end

				if value.is_a?(Sfplanner::Lang::Context)
					value.accept(self)
				end
			end
		end

		class VariableCollector < Collector
			def visit(ref, value)
				if value.is_a?(Sfplanner::Lang::ContextAction) or
					value.is_a?(Sfplanner::Lang::ContextConstraint)
				else
					if value.is_a?(Sfplanner::Lang::Context)
						value.accept(self)
					end

					translator.register_variable(@root, ref.strip_prefix_root, value)
				end
			end
		end

		class Type
			attr_accessor :name, :values

			def initialize(name)
				@name = name
				@values = Array.new
			end

			def add(value)
				@values.push(value)
				@values.uniq
			end
		end

		class Variable
			attr_accessor :id, :name, :type, :layer, :values, :init, :goal

			def initialize(id, name, init=nil, goal=nil, type=nil, layer=-1)
				@id = id
				@name = name
				@type = type
				@layer = layer
				@values = Array.new
				@init = init
				@goal = goal
			end

			def add(value)
				@values.push(value)
				@values.uniq
			end

			def remove(value)
				@values.delete(value)
			end

			def index(value)
				return @values.index(value)
			end

			def to_sas
				sas = "begin_variable\n"
				sas += @name + "\n"
				sas += @layer.to_s + "\n"
				sas += @values.size.to_s + "\n"
				@values.each { |value|
					sas += value.to_s + "\n"
				}
				sas += "end_variable\n"
				return sas
			end

			def to_s
				return name + "@" +
					#(init.is_a?(Sfplanner::Lang::Reference) ? '*' : '') +
					type.to_s +
					"(" + init.to_s + "," + goal.to_s + ")"
			end
		end

		class Operator
			attr_accessor :name, :conditions, :cost

			def initialize(name, cost=0)
				@conditions = Array.new
				@name = name
				@cost = cost
			end

			def to_sas
				sas = "begin_operator\n"
				sas += @name + "\n"
				count_prevail = 0
				count_cond = 0
				prevail = ''
				cond = ''
				@conditions.each { |param|
					if param.is_prevail?
						count_prevail += 1
						prevail += param.to_sas + "\n"
					else
						count_cond += 1
						cond += param.to_sas + "\n"
					end
				}
				sas += count_prevail.to_s + "\n" + prevail
				sas += count_cond.to_s + "\n" + cond
				sas += @cost.to_s + "\n"
				sas += "end_operator\n"
			end
		end

		class Condition
			attr_accessor :variable, :pre, :post
			
			def initialize(variable, preValue, postValue=nil)
				@variable = variable
				@pre = preValue
				@post = postValue
			end
			
			def is_prevail?
				return ( @post == nil )
			end

			def to_sas
				if @post != nil
					return '0 ' + @variable.id.to_s + ' ' + @variable.index(@pre).to_s + ' ' + @variable.index(@post).to_s
				end
				return @variable.id.to_s + ' ' + @variable.index(@pre).to_s
			end
		end

		class Mutex
		end
	end
end
