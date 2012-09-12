module Nuri
	module Resource
		attr_accessor :name, :parent
		attr_reader :children, :state, :goal

		def load(class_path, name=nil)
			@name = name
			@children = Hash.new
			@state = self.create_instance(class_path)
			@goal = {}
		end

		def create_instance(class_path)
			return {} if class_path == nil or class_path == ''
			# TODO
			class_path = class_path.to_s if not class_path.is_a?(String)
			class_path = "$.#{class_path}" if not class_path.isref
			root = Nuri::Resource.get_root
			if root != nil
				object = root.at?(class_path)
				if object != nil
					object = Nuri::Sfp.deep_clone(object)
					object['_self'] = @name
					object['_context'] = 'object'
					object['_isa'] = class_path
					object['_classes'] = [class_path]
					object['_classes'] = object['_classes'].concat(object['_super']) if
							object.has_key?('_super')
					object.delete('_super')
					return object
				end
			end
			return {}
		end

		def self.set_root(root)
			@@root = root
		end

		def self.get_root
			return {} if defined?(@@root) == nil
			return @@root
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
			if path == '' or path == nil
				return @state
			else
				value = get(path)
				return value.get_state if value.respond_to?('get_state')
				return value
			end
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

	class Root
		include Resource

		def initialize
			load('', 'root')
		end
	end
end
