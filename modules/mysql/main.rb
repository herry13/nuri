module Mysql

	class Main
		attr_accessor :state

		include Util

		def initialize
			@state = JSON['{}']
		end

		def getState
			os = self.getOS()
			if os == 'sl'
				# installed & running
				data = `/bin/rpm -qa mysql-server` if os == 'sl'
				@state["installed"] = ( (data =~ /mysql\-server/) != nil )
				if @state["installed"]
					data = `/sbin/service mysqld status`
					@state["running"] = ( (data =~ /.*running.*/) != nil )
				else
					@state["running"] = false
				end
				# port
				data = (File.file?("/etc/my.cnf") ? `/bin/grep -e "^port" /etc/my.cnf` : "")
				if data.length > 0
					data = data.split('=')
					@state["port"] = data[1].strip.to_i
				else
					@state["port"] = nil
				end
			elsif os == 'ubuntu'
				# installed & running
				data = `/usr/bin/dpkg-query -W mysql-server` if os == 'ubuntu'
				@state["installed"] = ((data =~ /mysql\-server/) != nil)
				if @state["installed"]
					data = `/usr/bin/service mysql status`
					@state["running"] = ((data =~ /running/) != nil)
				else
					@state["running"] = false
				end
				# port
				data = (File.file?("/etc/mysql/my.cnf") ? `/bin/grep -e "^port" /etc/mysql/my.cnf` : "")
				if data.length > 0
					data = data.split('=')
					@state["port"] = data[1].strip.to_i
				else
					@state["port"] = nil
				end
			end
			@state["admin_password"] = ""

			return @state
		end
	end
end
