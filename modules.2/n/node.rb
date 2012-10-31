require 'rubygems'
require 'json'

module Nuri
	module Module
		class Node
			include Nuri::Resource

			def initialize
				name = Nuri::Util.hostname.strip.sub(/\..*/,'')
				self.load('Node', name)
			end
	
			def get_state(path=nil)
				return self.get_all_state if path == nil or path.strip == ''
				path.strip!
				first, nextpath = path.split('/', 2)
				if @children[first] != nil
					state = @children[first].get_state
					return self.path_value(state, nextpath)
				else
					return self.path_value(@state, path)
				end
				# not found
				return Nuri::Undefined.new
			end

			def path_value(state, path)
				return state if path == nil or path == ''
				return Nuri::Undefined.new if not state.is_a?(Hash)
				first, nextpath = path.split('/', 2)
				if state.has_key?(first)
					return self.path_value(state[first], nextpath)
				else
					# not found
					return Nuri::Undefined.new
				end
			end

			def get_all_state
				# get memory info
				mem = `free`
				mem = mem.split("\n")[1].split(" ")
				@state["memory_total"] = mem[1].to_i
				@state["memory_free"] = mem[3].to_i
	
				# get platform, architecture, kernel version
				@state["os"] = Nuri::Util.os
				@state["platform"] = Nuri::Util.platform
				@state["hostname"] = Nuri::Util.hostname #`uname -n`.strip
				@state["domainname"] = Socket.gethostbyname(Socket.gethostname).first
				@state["version"] = `uname -r`.strip
				@state["arch"] = `uname -p`.strip
				@state["cpus"] = `cat /proc/cpuinfo | grep processor | wc -l`.strip.to_i

				# get state of other components
				@children.each_pair { |name,mod|
					@state[name] = mod.get_state
				}

				return @state
			end
		end
	end
end
