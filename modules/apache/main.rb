require 'rubygems'
require 'json'

module Apache
	class Main
		def getState
			data = JSON '{"apache": {"_isa": "Apache"}}'
			return data
		end
	end
end
