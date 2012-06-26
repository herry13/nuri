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
			data = `/bin/rpm -qa mysql-server`
			@state["installed"] = ( (data =~ /mysql\-server/) != nil )
			if @state["installed"]
				@state["version"] = data.sub(/mysql\-server\-/,'')
				data = `/sbin/service mysqld status`
				@state["running"] = ( (data =~ /.*running.*/) != nil )
			else
				@state["version"] = ""
				@state["running"] = false
			end
			# port
			data = (File.file?("/etc/my.cnf") ? `/bin/grep -e "^port" /etc/my.cnf` : "")
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
