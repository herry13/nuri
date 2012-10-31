require 'rubygems'
require 'json'

module Nuri
	module Module
		class Machine
			include Nuri::Resource

			def initialize
				name = Nuri::Util.hostname.strip.sub(/\..*/,'')
				self.load('Machine', name)
			end

			def get_my_state
				# get memory info
				mem = `free`
				mem = mem.split("\n")[1].split(" ")
				@state["memory_total"] = mem[1].to_i
				@state["memory_free"] = mem[3].to_i
	
				# get platform, architecture, kernel version
				@state["os"] = Nuri::Util.os
				@state["platform"] = Nuri::Util.platform
				@state["hostname"] = Nuri::Util.hostname
				@state["domainname"] = Socket.gethostbyname(Socket.gethostname).first
				@state["version"] = `uname -r`.strip
				@state["arch"] = `uname -p`.strip
				@state["cpus"] = `cat /proc/cpuinfo | grep processor | wc -l`.strip.to_i
				@state['running'] = true
			end

			def start
				# TODO
				return false
			end

			def stop
				# TODO
				return false
			end
		end
	end
end