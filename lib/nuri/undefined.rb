module Nuri
	class Undefined
		attr_accessor :path

		def initialize(path=nil)
			@path = path
		end

		def to_s
			if @path == nil
				"Undefined"
			else
				"Undefined path: " + @path
			end
		end
	end
end
