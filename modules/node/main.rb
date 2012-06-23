require 'rubygems'
require 'json'

module Node
	class Main
		attr_accessor :state, :name

		include Util

		def initialize
			@state = JSON['{}']
			if name == nil
				data = `/bin/hostname`
				@name = data.strip!
			end
			@name = '"' + @name + '"' if ((@name =~ /\./) != nil)
			@state[@name] = JSON['{"_isa":"Node"}']
		end

		def getState(modules)
			@state[@name]["os"] = self.getOS()
			modules.each { |name,mod| @state[@name][name] = mod.getState if name != 'node' }
	
			# get memory info
			mem = `free`
			mem = mem.split("\n")[1].split(" ")
			@state[@name]["memory_total"] = mem[1].to_i
			@state[@name]["memory_free"] = mem[3].to_i

			# get platform, architecture, kernel version
			@state[@name]["os"] = self.getOS()
			@state[@name]["platform"] = self.getPlatform()
			@state[@name]["release"] = `uname -r`.strip
			@state[@name]["arch"] = `uname -p`.strip
			@state[@name]["cpus"] = `cat /proc/cpuinfo | grep processor | wc -l`.strip.to_i

			return @state
		end
	end
end
