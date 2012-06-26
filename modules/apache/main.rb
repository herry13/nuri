require 'rubygems'
require 'json'
require 'augeas'

module Apache
	class Main
		def initialize
			@state = JSON['{"_isa":"Apache"}']
		end

		# set state of this component in JSON -- TODO
		def set(state)
		end

		# get state of this component in JSON
		def get
			os = Nuri.platform
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
					@state["port"] = 0
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
					@state["port"] = 0
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

		def install
			result = system('/usr/bin/apt-get -y install apache2')
			return (result == true)
		end
	
		def uninstall
			result = system('/usr/bin/apt-get -y remove apache2')
			system('/usr/bin/apt-get -y autoremove') if (result == true)
			return (result == true)
		end
	
		def start
			result = system('/usr/bin/service apache2 start')
			return (result == true)
		end
	
		def stop
			result = system('/usr/bin/service apache2 stop')
			return (result == true)
		end
	
		def setPort(p)
			Augeas::open do |aug|
				aug.set("/files/etc/apache2/ports.conf/*[self::directive='NameVirtualHost']/arg", "*:" + p.to_s)
				aug.set("/files/etc/apache2/ports.conf/*[self::directive='Listen']/arg", p.to_s)
				aug.set('/files/etc/apache2/sites-available/default/VirtualHost/arg', "*:" + p.to_s)
				unless aug.save
					raise IOError, "Failed to save changes"
				end
			end
		end
	
		def setDocumentRoot(dir)
			Augeas::open do |aug|
				aug.set("/files/etc/apache2/sites-available/default/VirtualHost/*[self::directive='DocumentRoot']/arg", dir)
				unless aug.save
					raise IOError, "Failed to save changes"
				end
			end
		end
	end
end
