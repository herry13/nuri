require 'rubygems'
require 'json'

module Nuri
	module Module
		class Machine
			include Nuri::Resource

			def initialize
				name = Nuri::Util.hostname.strip.sub(/\..*/,'')
				self.register('Machine', name)
			end

			def update_state
				# get memory info
				mem = `free`
				mem = mem.split("\n")[1].split(" ")
				@state["memory_total"] = mem[1].to_i
				@state["memory_free"] = mem[3].to_i
	
				# get platform, architecture, kernel version
				@state["os"] = Nuri::Util.os
				@state["platform"] = Nuri::Util.platform
				@state["hostname"] = Nuri::Util.hostname
				
				system_info = Nuri::Util.get_system_information
				if system_info.has_key?(@name) and system_info[@name].to_s.length > 0
					@state['address'] = system_info[@name]
				else
					@state['address'] = ''
				end
				@state["domainname"] = Nuri::Util.domainname
				@state["ip_addr"] = Nuri::Util.local_ip
				@state["version"] = `uname -r`.strip
				@state["arch"] = `uname -p`.strip
				@state["cpus"] = `cat /proc/cpuinfo | grep processor | wc -l`.strip.to_i
				@state['running'] = true

				# Nuri's version
				remote = `/usr/bin/git rev-parse origin`.chop
				@state['nuri_latest'] = (remote == Nuri::Util.nuri_version)
			end

			def start
				# TODO
				return false
			end

			def stop
				# TODO
				return false
			end

			def upgrade_nuri(params)
				cmd = "cd " + Nuri::Util.home_dir + ";" + "/usr/bin/git pull; 2> /dev/null"
				result = system(cmd)
				return (result == true)
			end
		end
	end
end
