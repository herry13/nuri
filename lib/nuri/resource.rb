module Nuri
	module Resource
		attr_accessor :name, :parent
		attr_reader :children, :state, :is_abstract, :goal

		def register(class_path, name=nil, is_abstract=false)
			@name = name
			@children = Hash.new
			@state = self.create_instance(class_path)
			@goal = {}
			@is_abstract = is_abstract
		end

		def create_instance(class_path)
			return {} if class_path == nil or class_path == ''

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

		def get_state(path=nil)
			return self.get_all_state if path == nil or path.strip == ''

			path.strip!
			first, nextpath = path.split('/', 2)
			if @children[first] != nil
				state = @children[first].get_state
				return self.path_value(state, nextpath)
			else
				return self.path_value(@state, path)
			end

			# not found
			return Nuri::Undefined.new
		end

		def get_all_state
			self.get_self_state
			# get state of children components
			@children.each_pair { |name,mod| @state[name] = mod.get_state }

			return @state
		end

		def get_self_state
			# all components must implement this method
		end

		def get_path_value(state, path)
			return state if path == nil or path == ''
			return Nuri::Undefined.new if not state.is_a?(Hash)
			first, nextpath = path.split('/', 2)
			if state.has_key?(first)
				return self.get_path_value(state[first], nextpath)
			else
				# not found
				return Nuri::Undefined.new
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

	end

	class Root
		include Resource

		def initialize
			register('', 'root')
		end
	end
end
