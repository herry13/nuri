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
			# installed & running
			data = `/bin/rpm -qa httpd`
			@state["installed"] = ( (data =~ /httpd/) != nil )
			if @state["installed"]
				@state["version"] = data.sub(/httpd\-/,'').strip
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

			return @state
		end

		def install
			return false
		end
	
		def uninstall
			return false
		end
	
		def start
			return false
		end
	
		def stop
			return false
		end
	
		def setPort(p)
			Augeas::open do |aug|
				aug.set("/files/etc/httpd/conf/httpd.conf/*[self::directive='Listen']/arg", p.to_s)
				return true if aug.save
			end
			return false
		end
	
		def setDocumentRoot(dir)
			Augeas::open do |aug|
				aug.set("/files/etc/httpd/conf/httpd.conf/*[self::directive='DocumentRoot']/arg", "\"" + dir + "\"")
				aug.set("/files/etc/httpd/conf/httpd.conf/Directory/arg", "\"" + dir + "\"")
				return true if aug.save
			end
			return false
		end
	end
end
