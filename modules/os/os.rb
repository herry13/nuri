require 'rubygems'
require 'json'

class Sfp::Module::OS
	include Sfp::Resource

	def update_state
		@state['running'] = true

		# get memory info
		if `which free`.strip != ''
			mem = `free`.split("\n")[1].split(" ")
			@state["memory_total"] = mem[1].to_i
			@state["memory_free"] = mem[3].to_i
		else
			@state["memory_total"] = @state["memory_free"] = 0
		end

		# get platform, architecture, kernel version
		@state["os"] = `uname -s`.strip
		@state["version"] = `uname -r`.strip
		@state["arch"] = `uname -p`.strip
		@state["platform"] = (File.exist?('/etc/issue') ? `cat /etc/issue`.strip : '')
		@state["cpus"] = (File.exist?('/proc/cpuinfo') ? `cat /proc/cpuinfo | grep processor | wc -l`.strip.to_i : 0)
	end

	def stop
		return !!system('/sbin/shutdown -h now')
	end
end
