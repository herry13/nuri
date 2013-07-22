require 'augeas'

require File.expand_path(File.dirname(__FILE__)) + '/../service/service.rb'

class Sfp::Module::Mysql < Sfp::Module::Service
	include Sfp::Resource

	def update_state
		# call superclass update_state method
		self.class.superclass.instance_method(:update_state).bind(self).call

		# port
		data = (File.file?("/etc/mysql/my.cnf") ? `/bin/grep -e "^port" /etc/mysql/my.cnf` : "")
		@state['port'] = (data.length > 0 ? data.split('=')[1].strip.to_i : 3306)

		# root password
		if File.file?('/etc/mysql/nuri.cnf')
			@state["root_password"] = `cat /etc/mysql/nuri.cnf 2>/dev/null`.to_s.sub(/\n$/,'')
		else
			@state['root_password'] = 'mysql'
		end

		# can be accessed from outside?
		if @state['installed']
			data = `grep '^bind-address' /etc/mysql/my.cnf 2>/dev/null`
			@state['public'] = (data.length <= 0)
		else
			@state['public'] = false
		end
	end

	def exec_seq(*commands)
		commands.each { |c| raise Exception, "Cannot execute: #{c}" if !system(c) }
	end

	def install(params={})
		begin
			exec_seq 'echo mysql-server mysql-server/root_password select mysql | debconf-set-selections',
				'echo mysql-server mysql-server/root_password_again select mysql | debconf-set-selections',
				'apt-get -y --purge autoremove',
				'apt-get -y update',
				"apt-get -y install #{@model['package_name']}",
				'echo "\n[mysqld]\nmax_connect_errors = 10000" >> /etc/mysql/my.cnf',
				'service mysql stop',
				'/bin/echo mysql > /etc/mysql/nuri.cnf',
				'/bin/chmod 0400 /etc/mysql/nuri.cnf'
			return true
		rescue Exception => e
			Sfp::Agent.logger.error "#{e}\n#{e.backtrace.join("\n")}"
		end
		false
	end
	
	def uninstall(params={})
		system('/bin/rm -f /etc/mysql/nuri.cnf') if File.exist?('/etc/mysql/nuri.cnf')
		result = self.class.superclass.instance_method(:uninstall).bind(self).call
		if result == false
			system('apt-get remove -y mysql*; apt-get autoremove -y; apt-get autoremove -y')
		end
		system('/bin/rm -rf /etc/mysql') if File.exist?('/etc/mysql')
		return result
		false
	end
	
	def set_port(params={})
		p = params['target']
		Augeas::open do |aug|
			paths = aug.match("/files/etc/mysql/my.cnf/*/port")
			paths.each { |path|
				aug.set(path, p.to_s)
			}
			return aug.save
		end
		false
	end

	def set_public(params={})
		if params['pub']
			cmd = '/bin/sed -i "s/^bind\-address/#bind\-address/g" /etc/mysql/my.cnf'
		else
			cmd = '/bin/sed -i "s/^#bind\-address/bind\-address/g" /etc/mysql/my.cnf'
		end
		return false if not system(cmd)
		if Sfp::Module::Service.running?(@model['service_name'])
			return (self.stop and self.start)
		end
		true
	end
	
	def set_root_password(params={})
		passwd = params['passwd'].to_s
		system('/bin/chmod 0600 /etc/mysql/nuri.cnf')
		oldpass = `cat /etc/mysql/nuri.cnf`.to_s.sub(/\n$/,'').sub(/"/,'\"')
		passwd.sub!(/"/,'\"')
		return (system("mysqladmin -u root -p\"#{oldpass}\" password \"#{passwd}\"") and
			system("/bin/echo \"#{passwd}\" > /etc/mysql/nuri.cnf") and
			system('/bin/chmod 0400 /etc/mysql/nuri.cnf'))
	end

	def set_service_name(p={})
		true
	end

	def set_package_name(p={})
		true
	end
end
