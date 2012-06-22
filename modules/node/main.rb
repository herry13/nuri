require 'rubygems'
require 'json'

module Node
	class Main
		attr_accessor :state, :name

		def initialize
			@state = JSON['{}']
			data = `/bin/hostname`
			@name = data.strip!
			@name = '"' + @name + '"' if ((@name =~ /\./) != nil)
			@state[@name] = JSON['{"_isa":"Node"}']
		end

		def getOS
			if File.file?("/etc/issue")
				data = `/bin/cat /etc/issue`
				return "ubuntu" if (data =~ /Ubuntu/) != nil
				return "sl" if (data =~ /Scientific Linux/) != nil
			end
			return "unknown"
		end

		def getState(modules)
			@state[@name]["os"] = self.getOS()
			modules.each { |name,mod| @state[@name][name] = mod.getState if name != 'node' }
			return @state
		end
	end
end
