require 'thread'

module Planit
	class Context
		attr_accessor :name, :module, :children, :parent

		def initialize(name, mod, parent=nil)
			@name = name
			@module = mod
			@children = Hash.new
			@parent = parent
		end

		def getState(path)
			return nil if path == nil
			first, rest = path.split('/', 2)
			# TODO
		end
	end

	class Master
		@lock = Mutex.new
		@queuePath = Array.new
		@queueValue = Array.new
	
		def push(path, value)
			@lock.synchronize {
				@queuePath.push(path)
				@queueValue.push(value)
			}
		end
	
		def pop
			@lock.synchronize {
				path = @queuePath.pop
				value = @queueValue.pop
				return path, value
			}
		end
	
		def achieve(state)
		end
	end
end
