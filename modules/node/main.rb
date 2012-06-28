require 'rubygems'
require 'json'

module Node
	class Main
		attr_accessor :state, :name

		def initialize
			@state = JSON['{}']
			@name = (`uname -n`).strip.sub(/\..*/,'')
			@state[@name] = JSON['{"_isa":"Node"}']
		end

		# set state of this component -- TODO
		def setState(state)
		end

		def getState
			# get memory info
			mem = `free`
			mem = mem.split("\n")[1].split(" ")
			@state[@name]["memory_total"] = mem[1].to_i
			@state[@name]["memory_free"] = mem[3].to_i

			# get platform, architecture, kernel version
			@state[@name]["os"] = Nuri.os
			@state[@name]["platform"] = Nuri.platform()
			@state[@name]["version"] = `uname -r`.strip
			@state[@name]["arch"] = `uname -p`.strip
			@state[@name]["cpus"] = `cat /proc/cpuinfo | grep processor | wc -l`.strip.to_i

			return @state
		end
	end
end
