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

		def getGoal
			@children.each_pair { |name, mod| @goal[name] = mod.getGoal }
			return @goal
		end

		def setGoal(path, value)
			if path == nil or path == '' or path == '/'
				value.each_pair { |key,val|
					if @children.has_key?(key)
						@children[key].setGoal('/', val)
					else
						@goal[key] = val
					end
				}
			else
				first, nextpath = path.split('/', 2)
				if @children.has_key?(first)
					@children[first].setGoal(nextpath, value)
				elsif nextpath == nil or nextpath == ''
					@goal[first] = value
				else
					raise Exception
				end
			end
		end

		def resetGoal
			@goal = JSON['{}']
			@children.each_value { |mod| mod.resetGoal }
		end
	end
end
