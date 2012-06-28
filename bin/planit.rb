require 'thread'

class Planit
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
