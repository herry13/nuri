require 'rubygems'
require 'json'
require 'xml'

module Nuri
	module Module
		class Tomcat6 < Nuri::Resource
			def initialize
				super
				@state['_isa'] = 'Tomcat6'
			end
	
			# set state of component
			def setState
			end
	
			# get state of component in JSON
			def getState
				# installed & running
				data = `/bin/rpm -qa tomcat6`
				@state["installed"] = ((data =~ /tomcat6/) != nil)
				if @state["installed"]
					@state["version"] = data.sub(/tomcat6\-/,'').strip
					data = `/usr/bin/sudo -n /sbin/service tomcat6 status`
					@state["running"] = ((data =~ /running/) != nil)
				else
					@state["version"] = ""
					@state["running"] = false
				end
				# port
				configFile = '/etc/tomcat6/server.xml'
				if File.file?(configFile)
					doc = XML::Parser.file(configFile).parse
					node = doc.find_first('/Server/Service/Connector')
					@state["port"] = (node != nil ? node.attributes['port'].to_i : 0)
				else
					@state["port"] = 0
				end
	
				return @state
			end
		end
	end
end
