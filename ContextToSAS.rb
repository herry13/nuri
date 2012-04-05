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

				@init = @root.remove('init')
				@goal = @init.remove('goal')
				@global = @init.remove('global')
				@final = @init.remove('final')

				# 2) populate variables
				populateVariables
			end

			def populateVariables
				visitor = VariableCollector.new
				@init.accept(visitor)
			end

			def get_variable(name)
				if @variables.has_key?(name)
					return @variables[name]
				end
				@variables[name] = new_variable(name)
				return @variables[name]
			end

			def new_variable(name, type=nil, layer=-1)
				var = Variable.new(@var_id, name, type, layer)
				@var_id += 1
				return var
			end
		end

		class VariableCollector < Sfplanner::Lang::ContextVisitor
			def visit(ref, value)
				if value.is_a?(Sfplanner::Lang::ContextAction)
				else
					puts ref.to_sfp + " := " + value.to_s + " :: " + value.class.to_s
					if value.is_a?(Sfplanner::Lang::Context)
						value.accept(self)
					elsif value.is_a?(Sfplanner::Lang::Reference)
					else
					end
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

			def initialize(id, name, type=nil, layer=-1)
				@id = id
				@name = name
				@type = type
				@layer = layer
				@values = Array.new
				@init = nil
				@goal = nil
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