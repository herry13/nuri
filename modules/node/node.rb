require 'rubygems'
require 'json'

module Nuri
	module Module
		class Node < Nuri::Resource
			def initialize
				super
				#@name = (`uname -n`).strip.sub(/\..*/,'')
				@state = JSON['{"_isa":"Node"}']
			end
	
			# set state of this component -- TODO
			def setState(state)
			end
	
			def getStateAll
				# get memory info
				mem = `free`
				mem = mem.split("\n")[1].split(" ")
				@state["memory_total"] = mem[1].to_i
				@state["memory_free"] = mem[3].to_i
	
				# get platform, architecture, kernel version
				@state["os"] = Nuri::Util.os
				@state["platform"] = Nuri::Util.platform()
				@state["hostname"] = `uname -n`.strip
				@state["version"] = `uname -r`.strip
				@state["arch"] = `uname -p`.strip
				@state["cpus"] = `cat /proc/cpuinfo | grep processor | wc -l`.strip.to_i

				# get state of other components
				@children.each_pair { |name,mod|
					@state[name] = mod.getState
				}

				return @state
			end

			def getState(path=nil)
				return self.getStateAll if path == nil or path.strip == ''
				path.strip!
				first, nextpath = path.split('/', 2)
				if @children[first] != nil
					state = @children[first].getState
					return self.getPathValue(state, nextpath)
				else
					return self.getPathValue(@state, path)
				end
				# not found
				return Nuri::Undefined.new
			end

			def getPathValue(state, path)
				return state if path == nil or path == ''
				return Nuri::Undefined.new if not state.is_a?(Hash)
				first, nextpath = path.split('/', 2)
				if state.has_key?(first) # defined?(state[first])
					return self.getPathValue(state[first], nextpath)
				else
					# not found
					return Nuri::Undefined.new
				end
			end
		end
	end
end
