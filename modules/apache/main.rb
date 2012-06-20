require 'rubygems'
require 'json'

module Apache
	class Main
		attr_accessor :state

		def initialize
			@state = JSON['{"apache":{"_isa":"Apache"}}']
		end

		def getState
			data = `/usr/bin/sudo /bin/rpm -qa httpd`
			@state["apache"]["installed"] = ( (data =~ /httpd/) != nil )
			if @state["apache"]["installed"]
				data = `/usr/bin/sudo /sbin/service httpd status`
				@state["apache"]["running"] = ( (data =~ /.*running.*/) != nil )
			else
				@state["apache"]["running"] = false
			end

			data = `/usr/bin/sudo /bin/grep -e "^Listen " /etc/httpd/conf/httpd.conf`
			if data.length > 0
				data = data.split(' ')
				@state["apache"]["port"] = data[1].to_i
			else
				@state["apache"]["port"] = 80
			end

			data = `/usr/bin/sudo /bin/grep -e "^DocumentRoot " /etc/httpd/conf/httpd.conf`
			if data.length > 0
				data = data.split(' ')
				@state["apache"]["document_root"] = data[0].sub(/"/, '')
			else
				@state["apache"]["document_root"] = ""
			end

			return @state
		end
	end
end
