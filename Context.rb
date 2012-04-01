#!/usr/bin/env ruby

require 'Reference'

module Sfplanner
	module Lang
		class Context
			attr_accessor :name, :owner, :supertype, :attributes
			
			def initialize(name, owner=nil, supertype=nil)
				@name = name
				@owner = owner
				@supertype = supertype
				@attributes = Hash.new
			end

			def get_reference
				if owner != nil
					return owner.get_reference.append(@name)
				end
				return Sfplanner::Lang::Reference.new(name)
			end

			def has(key)
				return @attributes.has_key(key)
			end

			def set(ref, value)
				if ref.is_a?(String)
					@attributes[ref] = value
				end
			end

			def get(ref)
				if ref.is_a?(Reference)
					
					if ref.path == nil or ref.path.length <= 0
						return self
					end

					first = ref.get_first
					if first == 'parent'
						return @owner.get(ref.get_next_reference)
					elsif first == 'root'
						return get_root.get(ref.get_next_reference)
					else
						value = get(first)
						if value.is_a?(Context)
							return value.get(ref.get_next_reference)
						end
						ref = ref.get_next_reference
						if ref.path == nil or ref.path.length <= 0
							return value
						end
					end
				else
					return @attributes[ref]
				end
			end

			def get_root
				if @owner == nil
					return self
				end
				return @owner.get_root
			end

			def accept(visitor)
			end

			def clone
				c = Context.new(@name, nil, @supertype)
				@attributes.each { |key,value|
					c.attributes[key] = value
				}
				return c
			end

			def attr_to_sfp(tab=0)
				ts = tabspace(tab)
				result = ''
				@attributes.each { |key,value|
					if value.is_a?(ContextReferenceType) or value.is_a?(ContextNull) or value.is_a?(ContextIn) or value.is_a?(ContextSet) or value.is_a?(ContextKeyword)
						result += ts + key + ' ' + value.to_sfp + "\n"
					elsif value.is_a?(Context)
						result += value.to_sfp(tab)
					elsif value.is_a?(String)
						result += ts + key + ' "' + value + "\"\n"
					else
						result += ts + key + ' ' + value.to_s + "\n"
					end
				}
				return result
			end


			def to_sfp(tab=0)
				ts = tabspace(tab)
				result = ts + @name + " {\n"
				result += attr_to_sfp(tab+1)
				result += ts + "}\n"
				return result
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

		class ContextState<Context
			def to_sfp(tab=0)
				ts = tabspace( (tab > 0 ? tab-1 : tab) )
				result = ''
				result += attr_to_sfp(tab)
				return result
			end
		end

		class ContextClass<Context
			def to_sfp(tab=0)
				ts = tabspace(tab)
				result = ts + 'class ' + @name + (@supertype != nil ? ' extends ' + @supertype.name : '') + " {\n"
				result += attr_to_sfp(tab+1)
				result += ts + "}\n"
				return result
			end

			def new_object(name='', owner=nil)
				obj = ContextObject.new(name, owner, self)
				@attributes.each { |key,value|
					if value.is_a?(ContextReferenceType)
						obj.attributes[key] = ContextNull.new(value.name, obj, value.supertype)
					else
						obj.attributes[key] = value
					end
				}
				return obj
			end
		end

		class ContextObject<Context
			def to_sfp(tab=0)
				ts = tabspace(tab)
				result = ts + @name + ' as ' + @supertype.to_s + " {\n"
				result += attr_to_sfp(tab+1)
				result += ts + "}\n"
				return result
			end
		end

		class ContextSet<Context
			def initialize(owner=nil, supertype=nil)
				@name = 'set'
				@owner = owner
				@supertype = supertype
				@attributes = Array.new
			end

			def add(value)
				@attributes.push(value)
				@attributes.uniq!
			end

			def to_sfp(tab=0)
				ts = tabspace(tab)
				result = ts + '('
				@attributes.each { |value|
					if value.is_a?(Context) or value.is_a?(Reference)
						result += value.to_sfp + ','
					else
						result += value + ','
					end
				}
				return (result.length > 1 ? result.chop : result) + ')'
			end
		end

		class ContextKeyword<Context
		end

		class ContextIn<ContextKeyword
			def initialize(owner=nil, value=nil)
				@name = 'in'
				@owner = owner
				@attributes = value
			end

			def to_sfp
				return 'in ' + @attributes.to_sfp
			end
		end

		class ContextNot<ContextKeyword
			def initialize(owner=nil, value=nil)
				@name = 'not'
				@owner = owner
				@attributes = value
			end

			def to_sfp
				return 'not ' + @attributes.to_sfp
			end
		end

		class ContextGreater<ContextKeyword
			def initialize(owner=nil, value=nil)
				@name = 'greater'
				@owner = owner
				@attributes = value
			end

			def to_sfp
				return '> ' + (@attributes.is_a?(Context) ? @attributes.to_sfp : @attributes.to_s)
			end
		end

		class ContextGreaterEquals<ContextKeyword
			def initialize(owner=nil, value=nil)
				@name = 'greater_equal'
				@owner = owner
				@attributes = value
			end

			def to_sfp
				return '>= ' + (@attributes.is_a?(Context) ? @attributes.to_sfp : @attributes.to_s)
			end
		end

		class ContextLess<ContextKeyword
			def initialize(owner=nil, value=nil)
				@name = 'less'
				@owner = owner
				@attributes = value
			end

			def to_sfp
				return '< ' + (@attributes.is_a?(Context) ? @attributes.to_sfp : @attributes.to_s)
			end
		end

		class ContextLessEquals<ContextKeyword
			def initialize(owner=nil, value=nil)
				@name = 'less_equal'
				@owner = owner
				@attributes = value
			end

			def to_sfp
				return '<= ' + (@attributes.is_a?(Context) ? @attributes.to_sfp : @attributes.to_s)
			end
		end

		class ContextAdd<ContextKeyword
			def initialize(owner=nil, value=nil)
				@name = 'add'
				@owner = owner
				@attributes = value
			end

			def to_sfp
				return '+= ' + @attributes.to_s
			end
		end

		class ContextSubstract<ContextKeyword
			def initialize(owner=nil, value=nil)
				@name = 'substract'
				@owner = owner
				@attributes = value
			end

			def to_sfp
				return '-= ' + @attributes.to_s
			end
		end

		class ContextMultiply<ContextKeyword
			def initialize(owner=nil, value=nil)
				@name = 'multiply'
				@owner = owner
				@attributes = value
			end

			def to_sfp
				return '*= ' + @attributes.to_s
			end
		end

		class ContextDivide<ContextKeyword
			def initialize(owner=nil, value=nil)
				@name = 'divide'
				@owner = owner
				@attributes = value
			end

			def to_sfp
				return '/= ' + @attributes.to_s
			end
		end

		class ContextConditional<Context
			attr_accessor :if_clause, :if_key, :then_key

			def initialize(owner=nil)
				@name = 'if_then'
				@owner = owner
				@attributes = Hash.new
			end

			def set(key, value)
				if @if_clause
					@if_key = key
				else
					@then_key = key
				end
				@attributes[key] = value
			end

			def to_sfp(tab=0)
				ts = tabspace(tab)
				result = ts + 'if ' + @if_key + ' '
				result += (@attributes[@if_key].is_a?(Context) ? @attributes[@if_key].to_sfp : @attributes[@if_key].to_s)
				result += ' then ' + @then_key + ' '
				result += (@attributes[@then_key].is_a?(Context) ? @attributes[@then_key].to_sfp : @attributes[@then_key].to_s) + "\n"
				return result
			end
		end

		class ContextAction<Context
			def to_sfp(tab=0)
				ts = tabspace(tab)
				result = ts + 'action ' + @name
				params = ''
				@attributes.each { |key,value|
					if value.is_a?(ContextReferenceType)
						params += key + ' as *' + value.supertype.name + ','
					end
				}
				if params.length > 0
					result += ' (' + params.chop + ')'
				end
				result += " {\n" + @attributes['precondition'].to_sfp(tab+1)
				result += @attributes['postcondition'].to_sfp(tab+1)
				result += ts + "}\n"
				return result
			end
		end

		class ContextConstraint<Context
			def to_sfp(tab=0)
				ts = tabspace(tab)
				result = ts + (owner.is_a?(ContextAction) ? '' : 'constraint ') + @name + " {\n"
				result += attr_to_sfp(tab+1)
				result += ts + "}\n"
				return result
			end
		end

		class ContextMutation<Context
		end

		class ContextNull<Context
			def to_sfp(tab=0)
				return 'null'
			end
		end

		class ContextReferenceType<Context
			def to_sfp(tab=0)
				return 'as *' + @supertype.name
			end
		end
	end
end
