require 'rubygems'
require 'json'

module Apache
	class Main
		attr_accessor :state

		def initialize
			@state = JSON['{"apache":{"_isa":"Apache"}}']
		end

		def getOS
			data = `cat /etc/issue`
			return "ubuntu" if ((data =~ /Ubuntu/) != nil)
			return "sl" if ((data =~ /Scientific Linux/) != nil)
			return nil
		end

		def getState
			os = self.getOS()
			if os == 'sl'
				# installed & running
				data = `/bin/rpm -qa httpd` if os == 'sl'
				@state["apache"]["installed"] = ( (data =~ /httpd/) != nil )
				if @state["apache"]["installed"]
					data = `/sbin/service httpd status`
					@state["apache"]["running"] = ( (data =~ /.*running.*/) != nil )
				else
					@state["apache"]["running"] = false
				end
				# port
				data = (File.file?("/etc/httpd/conf/httpd.conf") ? `/bin/grep -e "^Listen " /etc/httpd/conf/httpd.conf` : "")
				if data.length > 0
					data = data.split(' ')
					@state["apache"]["port"] = data[1].to_i
				else
					@state["apache"]["port"] = 80
				end
				# document root
				data = (File.file?("/etc/httpd/conf/httpd.conf") ? `/bin/grep -e "^DocumentRoot " /etc/httpd/conf/httpd.conf` : "")
				if data.length > 0
					data = data.split(' ')[1]
					data.sub!(/"/,'')
					@state["apache"]["document_root"] = data.sub(/"/,'')
				else
					@state["apache"]["document_root"] = ""
				end
			elsif os == 'ubuntu'
				# installed & running
				data = `/usr/bin/dpkg-query -W apache2` if os == 'ubuntu'
				@state["apache"]["instaled"] = ((data =~ /apache2/) != nil)
				if @state["apache"]["installed"]
					data = `/usr/bin/service apache2 status`
					@state["apache"]["running"] = ((data =~ /running/) != nil)
				else
					@state["apache"]["running"] = false
				end
				# port
				data = (File.file?("/etc/apache2/ports.conf") ? `/bin/grep -e "^Listen " /etc/apache2/ports.conf` : "")
				if data.length > 0
					data = data.split(' ')
					@state["apache"]["port"] = data[1].to_i
				else
					@state["apache"]["port"] = 80
				end
				# document root
				data = (File.file?("/etc/apache2/sites-available/default") ? `/bin/grep -e "DocumentRoot " /etc/apache2/sites-available/default` : "")
				if data.length > 0
					data.strip!
					data = data.strip.split(' ')
					@state["apache"]["document_root"] = data[1]
				else
					@state["apache"]["docment_root"] = ""
				end
			end

			return @state
		end
	end
end
