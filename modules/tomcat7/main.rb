require 'rubygems'
require 'json'
require 'xml'

module Tomcat7
	class Main
		attr_accessor :state

		include Util

		def initialize
			@state = JSON['{"_isa":"Tomcat7"}']
		end

		def getState
			os = self.getPlatform()
			if os == 'sl'
=begin
				# installed & running
				data = `/bin/rpm -qa httpd` if os == 'sl'
				@state["installed"] = ( (data =~ /httpd/) != nil )
				if @state["installed"]
					data = `/sbin/service httpd status`
					@state["running"] = ( (data =~ /.*running.*/) != nil )
				else
					@state["running"] = false
				end
				# port
				data = (File.file?("/etc/httpd/conf/httpd.conf") ? `/bin/grep -e "^Listen " /etc/httpd/conf/httpd.conf` : "")
				if data.length > 0
					data = data.split(' ')
					@state["port"] = data[1].to_i
				else
					@state["port"] = 80
				end
=end

			elsif os == 'ubuntu'
				# installed & running
				data = `/usr/bin/dpkg-query -W tomcat7`
				@state["installed"] = ((data =~ /tomcat7/) != nil)
				if @state["installed"]
					data = `/usr/bin/sudo /usr/bin/service tomcat7 status`
					@state["running"] = ((data =~ /running/) != nil)
				else
					@state["running"] = false
				end
				# port
				doc = XML::Parser.file('/etc/tomcat7/server.xml').parse
				node = doc.find_first('/Server/Service/Connector')
				@state["port"] = (node != nil ? node.attributes['port'].to_i : 8080)
			end

			return @state
		end
	end
end
