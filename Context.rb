#!/usr/bin/env ruby

require 'Reference'

module Sfplanner
	module Lang
		CLASS = 1
		OBJECT = 2
		ACTION = 3
		STATE = 4
		CONSTRAINT = 5
		PRECONDITION = 6
		POSTCONDITION = 7
		NULL = 8
		REFERENCE_TYPE = 9

		class Context
			attr_accessor :name, :owner, :super, :attributes, :type
			
			def initialize(name, owner=nil, supertype=nil, type=0)
				@name = name
				@owner = owner
				@supertype = supertype
				@attributes = Hash.new
				@type = type
			end

			def get_reference
				if owner != nil
					return owner.get_reference.append(@name)
				end
				return Sfplanner::Lang::Reference.new(name)
			end

			def set(ref, value)
				@attributes[ref] = value
			end

			def get(ref)
				return @attributes[ref]
			end

			def accept(visitor)
			end

			def clone
			end

			def to_sfp(tab=0)
				ts = tabspace(tab)
				result = @name + (@super != nil ? (type == CLASS ? " extends " : ' as ') + @super.name : "") + " {\n"
				@attributes.each { |key,value|
					if value.is_a?(Context)
						result += ts + case value.type
							when Sfplanner::Lang::STATE then 'state '
							when Sfplanner::Lang::CONSTRAINT then 'constraint '
							when Sfplanner::Lang::ACTION then 'action '
							when Sfplanner::Lang::CLASS then 'class '
							else ''
						end
						result += value.to_sfp(tab+1)
					elsif value.is_a?(String)
						result += ts + key + ' "' + value + "\"\n"
					else
						result += ts + key + " " + value.to_s + "\n"
					end
				}
				result += tabspace(tab-1) + "}\n"
			end

			def tabspace(tab)
				ts = ""
				for i in 1..tab
					ts += "\t"
				end
				return ts
			end

			def to_json
			end

			def to_s
				return @name
			end
		end
	end
end
