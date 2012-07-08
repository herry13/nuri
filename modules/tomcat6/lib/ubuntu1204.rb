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
	
			# get state of component in JSON
			def get_state
				# installed & running
				data = `/usr/bin/dpkg-query -W tomcat6`
				@state["installed"] = ((data =~ /tomcat6/) != nil)
				if @state["installed"]
					@state["version"] = data.split(' ')[1]
					data = `/usr/bin/sudo -n /usr/sbin/service tomcat6 status`
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
				return (system('/usr/bin/apt-get -y install tomcat6') == true)
			end
		
			def uninstall
				result = system('/usr/bin/apt-get -y purge tomcat6')
				if result == true
					system('/usr/bin/apt-get -y autoremove')
					system("/usr/bin/dpkg -l | /bin/grep ^rc | /usr/bin/cut -d' ' -f3| /usr/bin/xargs /usr/bin/apt-get -y purge")
				end
				return (result == true)
			end
		
			def start
				return (system('/usr/bin/service tomcat6 start') == true)
			end
		
			def stop
				return (system('/usr/bin/service tomcat6 stop') == true)
			end
		
			def set_port(p)
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
