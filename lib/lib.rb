require 'rubygems'
require 'json'
require 'logger'

module Nuri
	class Undefined
	end

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

	class Util
		@@rootdir = File.dirname(__FILE__) + "/.."
		@@logger = Logger.new(@@rootdir + "/log/message.log")
		@@os = nil
		@@platform = nil

		def self.rootdir
			return @@rootdir
		end

		def self.log(msg=nil)
			if msg != nil
				@@logger.info msg
			end
			return @@logger
		end

		def self.os
			@@os = (`uname -o`).strip if @@os == nil
			return @@os
		end

		def self.platform
			return @@platform if @@platform != nil
			if (self.os =~ /Linux/) != nil
				data = `cat /etc/issue`
				@@platform = "ubuntu" if (data =~ /Ubuntu/) != nil
				@@platform = "sl" if (data =~ /Scientific Linux/) != nil
			end
			return @@platform
		end
	end
end
