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

				@variables.each { |key,var| puts var.to_s }
			end

			def setVariablesGoalValue(goal)
				goal.attributes.each { |key,value|
					ref = Sfplanner::Lang::Reference.new(key).strip_prefix_root
					if @variables.has_key?(ref.to_sfp)
						puts "\t>> " + ref.to_s
						@variables[ref.to_sfp].goal = value
						create_axioms(ref, value)
					end
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
						left = get_particles(ref, value)
						left.each { |p| puts ">> " + p.to_s }
					else
						left = get_particles(ref)
						right = get_particles(value)
						left.each { |p| puts ">> " + p.to_s }
						right.each { |p| puts ">>>> " + p.to_s }
					end
				end
			end

			def cross_particles(p1, p2)
				p = Particle.new
				p1.each { |a| p.add(a) }
				p2.each { |a| p.add(a) }
			end

			def get_particles(ref, value=nil)
				bucket = Set.new
				total = ref.total_parts
				names = Array.new(total)
				values = Array.new(total)
				values[total-1] = value
				generate_particles(bucket, ref, names,values, 0, total)
				return bucket
			end

			def generate_particles(bucket, ref, names, values, index, max)
				if index >= max
					particle = Particle.new
					(0..max-1).each { |i|
						particle.add( Atom.new( @variables[names[i]], values[i] ) )
					}
					bucket.add(particle)
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
					generate_particles(bucket, nextref, names, values, index+1, max)
				else
					val = @init.get( Sfplanner::Lang::Reference.new(names[index]) )
					if val.is_a?(Sfplanner::Lang::ContextObject)
						values[index] = val
						generate_particles(bucket, nextref, names, values, index+1, max)
					else
						var = @variables[ names[index] ]
						@types[ var.type ].each { |val|
							values[index] = val
							generate_particles(bucket, nextref, names, values, index+1, max)
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
					#if init_value.is_a?(Sfplanner::Lang::Reference)
					#	type = get_type( root.get(init_value) );
					#else
					#	type = get_type(init_value)
					#end
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

		class Particle < Set
			def combine(particle)
				p = Particle.new
				self.each { |a| p.add(a) }
				particle.each { |b| p.add(b) }
				return p
			end

			def to_s
				s = ''
				self.each { |a| s += a.to_s + ',' }
				return s.chop
			end
		end

		class Atom
			attr_accessor :variable, :value

			def initialize(var, val)
				@variable = var
				@value = val
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
				sas += @values.size + "\n"
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

		class Condition
			attr_accessor :variable, :pre, :post
			
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
