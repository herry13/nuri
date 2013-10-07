require 'rubygems'
require 'json'

class Sfp::Module::OS
	include Sfp::Resource

	def update_state
		@state['running'] = true
		#@state['auto_upgrade'] = @model['auto_upgrade']

		# get memory info
		if `which free`.strip != ''
			mem = `free`.split("\n")[1].split(" ")
			@state["memory_total"] = mem[1].to_i
			@state["memory_free"] = mem[3].to_i
		else
			@state["memory_total"] = @state["memory_free"] = -1
		end

		# get platform, architecture, kernel version
		@state["type"] = `uname -s`.strip
		@state["version"] = `uname -r`.strip
		@state["arch"] = `uname -p`.strip
		@state["platform"] = (File.exist?('/etc/issue') ? `cat /etc/issue`.strip : '')
	end

	def apply(p={})
		self.upgrade if @model['auto_upgrade']
	end

	def upgrade(p={})
		return !!system('apt-get update; apt-get upgrade -y')
	end

	def stop(p={})
		return !!system('/sbin/shutdown -h now')
	end
end
