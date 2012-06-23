require 'rubygems'
require 'json'

module Apache
	class Main
		attr_accessor :state

		include Util

		def initialize
			@state = JSON['{"_isa":"Apache"}']
		end

		def getState
			os = self.getPlatform()
			if os == 'sl'
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
				# document root
				data = (File.file?("/etc/httpd/conf/httpd.conf") ? `/bin/grep -e "^DocumentRoot " /etc/httpd/conf/httpd.conf` : "")
				if data.length > 0
					data = data.split(' ')
					data = data[1].sub(/"/,'')
					@state["document_root"] = data.sub(/"/,'')
				else
					@state["document_root"] = ""
				end
			elsif os == 'ubuntu'
				# installed & running
				data = `/usr/bin/dpkg-query -W apache2` if os == 'ubuntu'
				@state["installed"] = ((data =~ /apache2/) != nil)
				if @state["installed"]
					data = `/usr/bin/service apache2 status`
					@state["running"] = ((data =~ /running/) != nil)
				else
					@state["running"] = false
				end
				# port
				data = (File.file?("/etc/apache2/ports.conf") ? `/bin/grep -e "^Listen " /etc/apache2/ports.conf` : "")
				if data.length > 0
					data = data.split(' ')
					@state["port"] = data[1].to_i
				else
					@state["port"] = 80
				end
				# document root
				data = (File.file?("/etc/apache2/sites-available/default") ? `/bin/grep -e "DocumentRoot " /etc/apache2/sites-available/default` : "")
				if data.length > 0
					data.strip!
					data = data.strip.split(' ')
					@state["document_root"] = data[1]
				else
					@state["docment_root"] = ""
				end
			end

			return @state
		end
	end
end
