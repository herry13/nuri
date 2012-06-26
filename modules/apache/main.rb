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
			platform = Nuri.platform
			if platform == 'ubuntu'
				result = system('/usr/bin/apt-get -y install apache2')
				return (result == true)
			elsif platform == 'sl'
			end
			return false
		end
	
		def uninstall
			platform = Nuri.platform
			if platform == 'ubuntu'
				result = system('/usr/bin/apt-get -y remove apache2')
				system('/usr/bin/apt-get -y autoremove') if (result == true)
				return (result == true)
			elsif platform == 'sl'
			end
			return false
		end
	
		def start
			platform = Nuri.platform
			if platform == 'ubuntu'
				result = system('/usr/bin/service apache2 start')
				return (result == true)
			elsif platform == 'sl'
			end
			return false
		end
	
		def stop
			platform = Nuri.platform
			if platform == 'ubuntu'
				result = system('/usr/bin/service apache2 stop')
				return (result == true)
			elsif platform == 'sl'
			end
			return false
		end
	
		def setPort(p)
			platform = Nuri.platform
			if platform == 'ubuntu'
				Augeas::open do |aug|
					aug.set("/files/etc/apache2/ports.conf/*[self::directive='NameVirtualHost']/arg", "*:" + p.to_s)
					aug.set("/files/etc/apache2/ports.conf/*[self::directive='Listen']/arg", p.to_s)
					aug.set('/files/etc/apache2/sites-available/default/VirtualHost/arg', "*:" + p.to_s)
					return true if aug.save
				end
			elsif platform == 'sl'
				Augeas::open do |aug|
					aug.set("/files/etc/httpd/conf/httpd.conf/*[self::directive='Listen']/arg", p.to_s)
					return true if aug.save
				end
			end
			return false
		end
	
		def setDocumentRoot(dir)
			platform = Nuri.platform
			if platform == 'ubuntu'
				Augeas::open do |aug|
					aug.set("/files/etc/apache2/sites-available/default/VirtualHost/*[self::directive='DocumentRoot']/arg", dir)
					return true if aug.save
				end
			elsif platform == 'sl'
				Augeas::open do |aug|
					aug.set("/files/etc/httpd/conf/httpd.conf/*[self::directive='DocumentRoot']/arg", "\"" + dir + "\"")
					aug.set("/files/etc/httpd/conf/httpd.conf/Directory/arg", "\"" + dir + "\"")
					return true if aug.save
				end
			end
			return false
		end
	end
end
