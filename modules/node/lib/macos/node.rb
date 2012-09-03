require 'rubygems'
require 'json'

module Nuri
	module Module
		class Node
			include Nuri::Resource

			def initialize
				self.load
				@name = Nuri::Util.hostname.strip.sub(/\..*/,'')
				@state = self.create_object('Node')
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
				data = Hash.new
				`vm_stat`.split("\n").each do |line|
					next if line[0,5] != 'Pages'
					label, size = line.split(':')
					data[label] = (size.to_i * 4096) / 1024
				end
				@state["memory_total"] = data['Pages active'] + data['Pages inactive'] +
					data['Pages wired down'] + data['Pages free']
				@state["memory_free"] = data['Pages free']
	
				# get platform, architecture, kernel version
				@state["os"] = Nuri::Util.os
				@state["platform"] = Nuri::Util.platform
				@state["hostname"] = Nuri::Util.hostname
				@state["version"] = `uname -r`.strip
				@state["arch"] = `uname -p`.strip
				@state["cpus"] = `sysctl -n machdep.cpu.brand_string`.strip

				# get state of other components
				@children.each_pair { |name,mod|
					@state[name] = mod.get_state
				}

				#return { @name => @state }
				return @state
			end
		end
	end
end
