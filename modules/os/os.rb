require 'rubygems'
require 'json'
require 'digest/sha1'

class Sfp::Module::OS
	include Sfp::Resource

	def update_state
		@state['running'] = true
		@state['auto_upgrade'] = auto_upgrade?

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
		@state["platform"] = RUBY_PLATFORM
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

	protected
	AutoUpgradeCronFile = "/etc/cron.daily/nuri.module.os"
	DebianAutoUpgradeCronFileContent = "#!/bin/bash\n\napt-get update -y && apt-get upgrade -y"
	def auto_upgrade?
		def apt
			begin
				current = (::File.exist?(AutoUpgradeCronFile) ? Digest::SHA1.hexdigest(::File.read(AutoUpgradeCronFile)) : '')
				desired = Digest::SHA1.hexdigest(DebianAutoUpgradeCronFileContent)
				File.open(AutoUpgradeCronFile, 'w') do |f|
					f.write DebianAutoUpgradeCronFileContent
					FileUtils.chmod 0755, AutoUpgradeCronFile
				end if current != desired
				return true
			rescue Exception => e
				log.error "cannot create cron daily #{e}"
			end
			false
		end

		if @model['auto_upgrade']
			return apt if `which apt-get`.strip != ''
		end
		false
	end
end
