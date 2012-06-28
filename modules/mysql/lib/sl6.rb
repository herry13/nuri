require 'rubygems'
require 'json'
require 'augeas'

module Mysql
	class Main
		attr_accessor :state

		def initialize
			@state = JSON['{}']
		end

		# set state of this component -- TODO
		def setState(state)
		end

		# get state of this component in JSON
		def getState
			# installed & running
			data = `/bin/rpm -qa mysql-server`
			@state["installed"] = ( (data =~ /mysql\-server/) != nil )
			if @state["installed"]
				@state["version"] = data.sub(/mysql\-server\-/,'').strip
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
			@state["root_password"] = ""

			return @state
		end


		def install # need to save the password
			result = system('/usr/bin/yum -y install mysql-server')
			if result == true
				system('/bin/chmod 0600 /etc/nuri.cnf') if File.file?('/var/lib/nuri/mysql')
				system('/bin/touch /etc/nuri.cnf')
				system('/bin/chmod 0400 /etc/nuri.cnf')
			end
			return (result == true)
		end

		def uninstall
			result = system('/usr/bin/yum -y remove mysql-server')
			if result == true and File.file?('/etc/nuri.cnf')
				system('/bin/chmod 0600 /etc/nuri.cnf')
				system('/bin/rm -f /etc/nuri.cnf')
				system('/bin/rm -rf /var/lib/mysql')
			end
			return (result == true)
		end

		def start
			return (system('/sbin/service mysqld start') == true)
		end

		def stop
			return (system('/sbin/service mysqld stop') == true)
		end

		def setPort(p)
			Augeas::open do |aug|
				paths = aug.match("/files/etc/my.cnf/*")
				paths.each { |path|
					aug.set(path + "/port", p.to_s)
				}
				return aug.save
			end
		end

		def setRootPassword(passwd)
			system('/bin/chmod 0600 /etc/nuri.cnf')
			oldpass = `/bin/cat /etc/nuri.cnf`
			oldpass = "-p\"" + oldpass.sub(/\n$/,'').sub(/"/,'\"') + "\"" if oldpass != ''
			passwd.sub!(/"/,'\"')
			return (system("mysqladmin -u root #{oldpass} password \"#{passwd}\"") == true and
				system("/bin/echo \"#{passwd}\" > /etc/nuri.cnf") == true and
				system('/bin/chmod 0400 /etc/nuri.cnf'))
		end
	end
end
