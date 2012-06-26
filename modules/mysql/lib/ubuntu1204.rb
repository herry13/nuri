module Mysql
	class Main
		attr_accessor :state

		def initialize
			@state = JSON['{}']
		end

		# set state of this component -- TODO
		def set(state)
		end

		# get state of this component in JSON
		def get
			# installed & running
			data = `/usr/bin/dpkg-query -W mysql-server`
			@state["installed"] = ((data =~ /mysql\-server/) != nil)
			if @state["installed"]
				@state["version"] = data.split(' ')[1]
				data = `/usr/bin/service mysql status`
				@state["running"] = ((data =~ /running/) != nil)
			else
				@state["version"] = ""
				@state["running"] = false
			end
			# port
			data = (File.file?("/etc/mysql/my.cnf") ? `/bin/grep -e "^port" /etc/mysql/my.cnf` : "")
			if data.length > 0
				data = data.split('=')
				@state["port"] = data[1].strip.to_i
			else
				@state["port"] = 0
			end
			@state["admin_password"] = ""

			return @state
		end
	end
end
