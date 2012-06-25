require 'rubygems'
require 'json'
require 'xml'

module Tomcat6
	class Main
		attr_accessor :state

		include Util

		def initialize
			@state = JSON['{"_isa":"Tomcat6"}']
		end

		def getState
			os = self.getPlatform()
			if os == 'sl'
				# installed & running
				data = `/bin/rpm -qa tomcat6`
				@state["installed"] = ((data =~ /tomcat6/) != nil)
				if @state["installed"]
					data = `/usr/bin/sudo /sbin/service tomcat6 status`
					@state["running"] = ((data =~ /running/) != nil)
				else
					@state["running"] = false
				end
			elsif os == 'ubuntu'
				# installed & running
				data = `/usr/bin/dpkg-query -W tomcat6`
				@state["installed"] = ((data =~ /tomcat6/) != nil)
				if @state["installed"]
					data = `/usr/bin/sudo /usr/sbin/service tomcat6 status`
					@state["running"] = ((data =~ /running/) != nil)
				else
					@state["running"] = false
				end
			end
			# port
			doc = XML::Parser.file('/etc/tomcat6/server.xml').parse
			node = doc.find_first('/Server/Service/Connector')
			@state["port"] = (node != nil ? node.attributes['port'].to_i : 8080)

			return @state
		end
	end
end
