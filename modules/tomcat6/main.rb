require 'rubygems'
require 'json'
require 'xml'

module Tomcat6
	class Main
		attr_accessor :state

		def initialize
			@state = JSON['{"_isa":"Tomcat6"}']
		end

		# set state of component
		def set
		end

		# get state of component in JSON
		def get
			os = Nuri.platform()
			if os == 'sl'
				# installed & running
				data = `/bin/rpm -qa tomcat6`
				@state["installed"] = ((data =~ /tomcat6/) != nil)
				if @state["installed"]
					data = `/usr/bin/sudo -n /sbin/service tomcat6 status`
					@state["running"] = ((data =~ /running/) != nil)
				else
					@state["running"] = false
				end
			elsif os == 'ubuntu'
				# installed & running
				data = `/usr/bin/dpkg-query -W tomcat6`
				@state["installed"] = ((data =~ /tomcat6/) != nil)
				if @state["installed"]
					data = `/usr/bin/sudo -n /usr/sbin/service tomcat6 status`
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
