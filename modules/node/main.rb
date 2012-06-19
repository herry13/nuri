require 'rubygems'
require 'json'

module Node
	class Main
		attr_accessor :state

		def initialize
			@state = JSON['{}']
			data = `/bin/hostname`
			data = '"' + data.strip + '"'
			@state[data] = JSON['{"_isa":"Node"}']
		end

		def getState
			return @state
		end
	end
end
