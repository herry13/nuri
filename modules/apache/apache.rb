require 'augeas' # require package libaugeas-ruby (Ubuntu)

require File.expand_path(File.dirname(__FILE__)) + '/../service/service.rb'

class Sfp::Module::Apache < Sfp::Module::Service
	include Sfp::Resource

	ConfigFile = '/etc/apache2/sites-available/default'
	SitesEnabledDir = '/etc/apache2/sites-enabled'
	LoadBalancerConfigFile = '/etc/apache2/sites-enabled/load_balancer'
	InstallingLockFile = '/tmp/sfp_apache_installing.lock'
	NotRunningLockFile = '/tmp/sfp_apache_not_running.lock'

	def update_state
		# Call method 'update_state' of Sfp::Module::Service (superclass)
		self.class.superclass.instance_method(:update_state).bind(self).call

		@state['php_module'] = Sfp::Module::Package.installed?('libapache2-mod-php5')
		@state['php_mysql_module'] = Sfp::Module::Package.installed?('php5-mysql')

		if File.exist?(InstallingLockFile)
			@state['installed'] = @state['running'] = false
			@state['version'] = ''
		else
			@state['installed'] = Sfp::Module::Package.installed?('apache2')
			@state['running'] = (File.exist?(NotRunningLockFile) ? false : Sfp::Module::Service.running?('apache2'))
			@state['version'] = Sfp::Module::Package.version?('apache2').to_s
		end

		# port
		data = (File.file?("/etc/apache2/ports.conf") ? `/bin/grep -e "^Listen " /etc/apache2/ports.conf` : "")
		@state['port'] = (data.length > 0 ?	@state["port"] = data.split(' ')[1].to_i : 80)

		# document root
		data = (File.file?(ConfigFile) ? `/bin/grep -e "DocumentRoot " #{ConfigFile}` : "")
		@state['document_root'] = (data.length > 0 ? data.strip.split(' ')[1] : '/var/www')

		# server_name
		data = (File.file?(ConfigFile) ? `/bin/grep -e "ServerName " #{ConfigFile}` : "")
		@state['server_name'] = (data.length > 0 ? data.strip.split(' ')[1] : '')

		# is_load_balancer
		@state['is_load_balancer'] = File.exists?(LoadBalancerConfigFile)

		# lb_members
		members = []
		if @state['is_load_balancer']
			data =`grep "BalancerMember" #{LoadBalancerConfigFile} 2>/dev/null`.chop
			agents = Sfp::Agent.get_agents
			data.split("\n").each do |line|
				member = line.strip.split(' ')
				next if member[1] == nil
				_, address = member[1].split('http://', 2)
				agents.each { |k,v|
					if v['sfpAddress'] == address
						members << '$.' + k
						break
					end
				}
			end
			members.sort!
		end
		@state['lb_members'] = members

		# lb_method
		if @state['is_load_balancer']
			data = `grep 'ProxySet' #{LoadBalancerConfigFile} | grep 'lbmethod'`.strip.split("=")
			@state['lb_method'] = data[1].to_s
		else
			@state['lb_method'] = ''
		end
	end

	def install(p={})
		begin
			File.open(InstallingLockFile, 'w') { |f| f.write(' ') }
			#return (self.class.superclass.instance_method(:install).bind(self).call and
			#	self.stop)
			return (Sfp::Module::Package.install(@model['package_name']) and self.stop)
		rescue Exception => e
			Sfp::Agent.logger.error "#{e}\n#{e.backtrace.join("\n")}"
		ensure
			File.delete(InstallingLockFile) if File.exist?(InstallingLockFile)
		end
		false
	end

	def uninstall(p={})
		begin
			#if self.class.superclass.instance_method(:uninstall).bind(self).call
			if Sfp::Module::Package.uninstall(@model['package_name'])
				system('/bin/rm -rf /etc/apache2') if File.directory?('/etc/apache2')
				return true
			end
		rescue Exception => e
			Sfp::Agent.logger.error "#{e}\n#{e.backtrace.join("\n")}"
		end
		false
	end

	def set_port(p={})
		return false if p['target'].nil?
		port = p['target']
		Augeas::open do |aug|
			aug.set("/files/etc/apache2/ports.conf/*[self::directive='NameVirtualHost']/arg",
				"*:#{port}")
			aug.set("/files/etc/apache2/ports.conf/*[self::directive='Listen']/arg", port.to_s)
			aug.set('/files/etc/apache2/sites-available/default/VirtualHost/arg', "*:#{port}")
			return true if aug.save
		end
		false
	end

	def set_document_root(p={})
		return false if not p.has_key?('target')
		Augeas::open do |aug|
			aug.set("/files/etc/apache2/sites-available/default/VirtualHost/*[self::directive='DocumentRoot']/arg", p['target'].to_s)
			return true if aug.save
		end
		false
	end

	def set_server_name(p={})
		return false if not p.has_key?('target')
		server_name = p['target'].to_s
		data = File.read(ConfigFile)
		output = ""
		data.split("\n").each do |line|
			tuple = line.strip.split(' ')
			if tuple[0] == 'ServerName'
				# skip
			elsif tuple[0] == 'DocumentRoot'
				output += "#{line} \n"
				output += "ServerName #{server_name}\n"
			elsif line.strip != ''
				output += "#{line} \n"
			end
		end
		File.open(ConfigFile, 'w') { |f| f.write(output) }
		true
	end

	def install_php_mysql_module(p={})
		begin
			#self.init2 if @php_mysql_package.nil?
			File.open(NotRunningLockFile, 'w') { |f| f.write(' ') }
			return self.stop if Sfp::Module::Package.install('libapache2-mod-php5')
			#return self.stop if @php_mysql_package.install
		rescue Exception => e
			Sfp::Agent.logger.error e.to_s + "\n" + e.backtrace.join("\n")
		ensure
			File.delete(NotRunningLockFile) if File.exist?(NotRunningLockFile)
		end
		false
	end

	def uninstall_php_mysql_module(p={})
		begin
			#self.init2 if @php_mysql_package.nil?
			File.open(NotRunningLockFile, 'w') { |f| f.write(' ') }
			return self.stop if Sfp::Module::Package.uninstall('libapache2-mod-php5')
			#return self.stop if @php_mysql_package.uninstall
		rescue Exception => e
			Sfp::Agent.logger.error e.to_s + "\n" + e.backtrace.join("\n")
		ensure
			File.delete(NotRunningLockFile) if File.exist?(NotRunningLockFile)
		end
		false
	end

	def install_php_module(p={})
		begin
			#self.init2 if @php_package.nil?
			File.open(NotRunningLockFile, 'w') { |f| f.write(' ') }
			return self.stop if Sfp::Module::Package.install('php5-mysql')
			#return self.stop if @php_package.install
		rescue Exception => e
			Sfp::Agent.logger.error e.to_s + "\n" + e.backtrace.join("\n")
		ensure
			File.delete(NotRunningLockFile) if File.exist?(NotRunningLockFile)
		end
		false
	end

	def uninstall_php_module(p={})
		begin
			#self.init2 if @php_package.nil?
			File.open(NotRunningLockFile, 'w') { |f| f.write(' ') }
			return self.stop if Sfp::Module::Package.uninstall('php5-mysql')
			#return self.stop if @php_package.uninstall
		rescue Exception => e
			Sfp::Agent.logger.error e.to_s + "\n" + e.backtrace.join("\n")
		ensure
			File.delete(NotRunningLockFile) if File.exist?(NotRunningLockFile)
		end
		false
	end

	###
	# Load Balancer methods
	###
	def enable_load_balancer(p={})
		begin
			File.open(InstallingLockFile, 'w') { |f| f.write(' ') }
			template_file = File.expand_path(File.dirname(__FILE__)) + "/load_balancer"
			exec_seq 'a2enmod proxy',
				'a2enmod proxy_balancer',
				'a2enmod proxy_http',
				'a2enmod status',
				"rm -rf #{SitesEnabledDir}/*",
				"cp -f #{template_file} #{LoadBalancerConfigFile}",
				"sudo service #{@model['service_name']} stop"
			return true
		rescue Exception => e
			Sfp::Agent.logger.error "#{e}\n#{e.backtrace.join("\n")}"
		ensure
			File.delete(InstallingLockFile) if File.exist?(InstallingLockFile)
		end
		false
	end

	def disable_load_balancer(p={})
		begin
			File.open(InstallingLockFile, 'w') { |f| f.write(' ') }
			exec_seq  'a2dismod proxy_balancer',
				'a2dismod proxy_http',
				'a2dismod proxy',
				'a2dismod status',
				"rm -f #{LoadBalancerConfigFile}",
				"ln -sf #{ConfigFile} #{SitesEnabledDir}/default",
				"sudo service #{@model['service_name']} stop"
			return true
		rescue Exception => e
			Sfp::Agent.logger.error "#{e}\n#{e.backtrace.join("\n")}"
		ensure
			File.delete(InstallingLockFile) if File.exist?(InstallingLockFile)
		end
		false
	end

	def set_lb_method(p={})
		return false if ['byrequests', 'bytraffic', 'bybusyness'].index(p['target']).nil?
		return !!system("sed -i -e 's/^\\s*ProxySet.*lbmethod=.*/ProxySet lbmethod=#{p['target']}/' #{LoadBalancerConfigFile}")
	end

	def set_lb_members(p={})
		agents = Sfp::Agent.get_agents
		lbmembers = p['members'].map { |m| m.sub! /^\$\./, '' }
		return false if (lbmembers - agents.keys).length > 0
		members = reverses = ''
		lbmembers.each do |m|
			members += "\n\tBalancerMember http://#{agents[m]['sfpAddress']}"
			reverses += "\n\tProxyPassReverse / http://#{agents[m]['sfpAddress']}"
		end
		output = ''
		File.read(LoadBalancerConfigFile).each_line do |line|
			head, _ = line.strip.split(' ', 2)
			next if head == 'BalancerMember' or head == 'ProxyPassReverse'
			output += "#{line}"
			output += "#{members}\n" if head == 'ProxySet'
			output += "#{reverses}\n" if head == '</Location>'
		end
		File.open(LoadBalancerConfigFile, 'w') { |f| f.write(output); f.flush }
		true
	end

=begin
	protected
	def init2
		@php_package = Sfp::Module::Package.new
		@php_package.init({'package_name' => 'libapache2-mod-php5'}, {'package_name' => 'libapache2-mod-php5'})

		@php_mysql_package = Sfp::Module::Package.new
		@php_mysql_package.init({'package_name' => 'php5-mysql'}, {'package_name' => 'php5-mysql'})
	end
=end

end
