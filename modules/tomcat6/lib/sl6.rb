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

			def install
				return (system('/usr/bin/yum -y install tomcat6') == true)
			end

			def uninstall
				return (system('/usr/bin/yum -y remove tomcat6') == true)
			end

			def start
				return (system('/sbin/service tomcat6 start') == true)
			end

			def stop
				return (system('/sbin/service tomcat6 stop') == true)
			end

			def setPort(p)
				configFile = '/etc/tomcat6/server.xml'
				if File.file?(configFile)
					doc = XML::Parser.file(configFile).parse
					nodes = doc.find('/Server/Service/Connector')
					nodes.each do |node|
						attr = node.attributes['port'] = p.to_s
						doc.save(configFile, :indent => true, :encoding => XML::Encoding::UTF_8)
					end
				end
			end
		end
	end
end
