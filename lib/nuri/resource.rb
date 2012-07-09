require 'rubygems'
require 'json'

module Nuri
	class Resource
		attr_accessor :name, :parent, :children, :state, :goal

		def initialize
			@children = Hash.new
			@state = JSON['{}']
			@goal = JSON['{}']
		end

		def get_goal
			@children.each_pair { |name, mod| @goal[name] = mod.get_goal }
			return @goal
		end

		def set_goal(state)
			state.each { |s| puts s[0] }
		end
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

		def reset_goal
			@goal = JSON['{}']
			@children.each_value { |mod| mod.reset_goal }
		end
	end
end
