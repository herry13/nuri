module Nuri
	class Resource
		attr_accessor :name, :parent
		attr_reader :children, :state, :goal

		def initialize(name=nil, parent=nil)
			@name = name
			@parent = parent
			@children = Hash.new
			@state = JSON['{}']
			@goal = JSON['{}']
		end

		def add(mod)
			@children[mod.name] = mod
			mod.parent = self
		end

		def remove_by_name(name)
			return if not @children.has_key?(name) or @children[name] == nil
			@children[name].parent = nil
			@children.delete(name)
		end

		def ref
			return '$' if @parent == nil
			return @parent.ref + '.' + @name
		end

		def root
			return self if @parent == nil
			return @parent.root
		end

		def to_s
			return @name
		end

		def set_goal(ref, value)
			return false if ref == nil or ref == ''
			first, rest = ref.to_s.explode
			if first == '$'
				return false if rest == nil
				self.root.set_goal(rest, value)
			elsif @children.has_key?(first)
				return false if rest == nil # modules are static
				@children[first].set_goal(rest, value)
			#elsif @state.has_key?(first)
			else
				if rest == nil
					@goal[first] = value
				else
					return false if not @state[first].is_a?(Hash)
					@goal[first].set(rest, value)
				end
			end

			return true
		end

		def get_state(path='')
			@state = Hash.new
			@children.each_value { |m| @state[m.name] = m.get_state }
			return @state
		end

		def get_goal
			goals = @goal.clone
			@children.each_pair { |name, mod| goals[name] = mod.get_goal }
			return goals
		end

		def reset_goal
			@goal = {}
			@children.each_value { |mod| mod.reset_goal }
		end

		protected
		def get(ref)
			return self if ref == nil or ref == ''
			first, rest = ref.to_s.explode
			if first == '$'
				return self.root.get(rest)
			elsif @children.has_key?(first) # sub-module
				return @children[first].get(rest)
			elsif @state.has_key?(first)
				if rest == nil
					return @state[first]
				elsif @state[first].is_a?(Hash)
					return @state[first].at(rest)
				end
			end
			return nil
		end

		#def set_goal(goals)
			#goals.each { |g|
			#	ref, value = g
			#	puts ref + ": " + self.get(ref).to_s
			#	puts self.set(ref, value)
			#}
		#end
=begin
		def set_goal(path, value)
			if path == nil or path == '' or path == '/'
				value.each_pair { |key,val|
					if @children.has_key?(key)
						@children[key].set_goal('/', val)
					else
						@goal[key] = val
					end
				}
			else
				first, nextpath = path.split('/', 2)
				if @children.has_key?(first)
					@children[first].set_goal(nextpath, value)
				elsif nextpath == nil or nextpath == ''
					@goal[first] = value
				else
					raise Exception
				end
			end
		end
=end
	end
end
