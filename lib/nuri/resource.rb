module Nuri
	module Resource
		attr_accessor :name, :parent
		attr_reader :children, :state, :is_abstract, :goal, :class_path

		def register(class_path, name=nil, is_abstract=false)
			@name = name
			@children = Hash.new
			@class_path = class_path.to_s
			self.reset
			@goal = {}
			@is_abstract = is_abstract
		end

		def reset
			@state = {}
			return if @class_path == nil or @class_path == ''

			@class_path = "$.#{@class_path}" if not @class_path.isref
			root = Nuri::Resource.get_root
			if root != nil
				object = root.at?(@class_path)
				if object != nil
					object = Nuri::Sfp.deep_clone(object)
					object['_self'] = @name
					object['_context'] = 'object'
					object['_isa'] = @class_path
					object['_classes'] = [@class_path]
					object['_classes'] = object['_classes'].concat(object['_super']) if
							object.has_key?('_super')
					object.delete('_super')
					@state = object
					@state.accept(Nuri::Sfp::SetModifier.new)
				end
			end
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

		def set(key,value)
			@state[key] = value
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

=begin
		def get_state(path=nil)
			return self.get_all_state if path == nil or path.strip == ''

			path.strip!
			first, nextpath = path.split('/', 2)
puts first + ' -- ' + nextpath
			if first == 'parent'
puts 'parent: ' + @parent.class.name
				return @parent.get_state(path) if @parent != nil
			elsif @children[first] != nil
				state = @children[first].get_state
				return self.get_path_value(state, nextpath)
			else
				return self.get_path_value(@state, path)
			end

			# not found
			return Nuri::Undefined.new(path)
		end

		def get_path_value(state, path)
			return state if path == nil or path == ''
			return Nuri::Undefined.new if not state.is_a?(Hash)
			first, nextpath = path.split('/', 2)
			if state.has_key?(first)
				return self.get_path_value(state[first], nextpath)
			else
				# not found
				return Nuri::Undefined.new(path)
			end
		end
=end

		def get_state(path=nil)
			return self.get_all_state if path == nil or path.strip == ''

			path.strip!
			value = get_path_state(path)
			return value if value != nil

			return Nuri::Undefined.new(path)
		end

		def get_path_state(path=nil)
			if path == nil or path == ''
				self.update_state
				return @state
			end

			first, rest = path.split('.', 2)
			if first == '$' or first == 'root'
				return self.root.get_path_state(rest)

			elsif first == 'parent'
				return @parent.get_path_state(rest) if @parent != nil

			elsif first == 'this' or first == 'self'
				return self.get_path_state(rest)

			elsif @children.has_key?(first) # sub-module
				return @children[first].get_path_state(rest)

			else
				self.update_state
				if @state.has_key?(first)
					if rest == nil or rest == ''
						return @state[first]
					elsif @state[first].is_a?(Hash)
						return @state[first].at?(rest)
					elsif @state[first].is_a?(String) and @state[first].isref
						new_path = @state[first] + '.' + rest
						return self.get_path_state(new_path)
					else
						puts 'not found: ' + path
					end
				else
					system = Nuri::Util.get_system_information
					if system.has_key?(first)
						return get_remote_path_state(system[first], path)
					end
				end
			end

			return nil
		end

		def get_remote_path_state(address, path)
			url = URI.parse('http://' + address + ':' + Nuri::Port.to_s + '/state/' + path)

			begin
				req = Net::HTTP::Get.new(url.path)
				res = Net::HTTP.start(url.host, url.port) { |http| http.request(req) }
				if res.code == '200'
					json = JSON.parse(res.body)
					return json['value'] if json.is_a?(Hash) and json.has_key?('value')
				end
			rescue Exception => e	
				Nuri::Util.log 'Cannot send system information to ' + address + ' -- ' + e.to_s
			end
			nil
		end

		def get_all_state
			self.update_state
			# get state of children components
			@children.each_pair { |name,mod| @state[name] = mod.get_state }

			return @state
		end

		# all components must implement this method which is called to update the current
		# state of each component
		def update_state; end

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
			value = self.get_value(ref)
			if value.is_a?(String) and value.isref
				value = get_value(value)
			end
			value
		end

		def get_value(ref)
			return self if ref == nil or ref == ''
			first, rest = ref.to_s.explode
			if first == '$'
				return self.root.get(rest)
			elsif first == 'root'
				return self.root.get(rest)
			elsif first == 'parent'
				return @parent.get(rest) if @parent != nil
			elsif first == 'this' or first == 'self'
				return self.get(rest)
			elsif @children.has_key?(first) # sub-module
				return @children[first].get(rest)
			elsif @state.has_key?(first)
				if rest == nil
					return @state[first]
				elsif @state[first].is_a?(Hash)
					return @state[first].at?(rest)
				elsif @state[first].is_a?(String) and @state[first].isref
					return self.get( @state[first] + '.' + rest )
				end
			else
				puts 'not found: ' + ref
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

	class Node
		include Resource

		def initialize(name)
			register('', name)
		end
	end
end
