class Sfp::Module::WordpressDB
	include Sfp::Resource

	def update_state
		@state['installed'] = false
		root_password = resolve(@model['database'] + '.root_password')
		if db_address.is_a?(String) and root_password.is_a?(String) and doc_root.is_a?(String)
			data = `echo "show databases;" | mysql -u root --password=#{root_password} mysql`.strip.split("\n")
			@state['installed'] = true if data.index(@model['db_name'])
		end

		@state['database'] = @model['database']
		@state['db_name'] = @model['db_name']
		@state['db_user'] = @model['db_user']
		@state['db_password'] = @model['db_password']
	end

	def install(p={})
		root_password = resolve(@model['database'] + '.root_password')

		# install database
		mysql_cmd = "mysql -u root --password=#{root_password}"
		sql1 = "CREATE USER '#{@model['db_user']}'@'%' IDENTIFIED BY '#{@model['db_password']}';"
		return false if not system("echo \"#{sql1}\" | #{mysql_cmd}")
		sql2 = "CREATE DATABASE #{@model['db_name']};"
		return false if not system("echo \"#{sql2}\" | #{mysql_cmd}")
		sql3 = "GRANT ALL PRIVILEGES ON #{@model['db_name']}.* TO '#{@model['db_user']}'@'%';"
		return false if not system("echo \"#{sql3}\" | #{mysql_cmd}")
		sql4 = "FLUSH PRIVILEGES;"
		return false if not system("echo \"#{sql4}\" | #{mysql_cmd}")

		true
	end

	def uninstall(p={})
		root_password = resolve(@model['database'] + '.root_password')

		# uninstall database
		mysql_cmd = "mysql -u root --password=#{root_password}"
		sql1 = "DROP USER '#{@model['db_user']}'@'%';"
		sql2 = "DROP DATABASE #{@model['db_name']};"
		sql3 = "REVOKE ALL PRIVILEGES ON *.* FROM '#{@model['db_user']}'@'%';"
		sql4 = "FLUSH PRIVILEGES;"

		system("echo \"#{sql1} #{sql2} #{sql3} #{sql4}\" | #{mysql_cmd}")

		true
	end
end

class Sfp::Module::WordpressWeb
	include Sfp::Resource

	def update_state
		@state['installed'] = false
		doc_root = resolve(@model['http'] + '.document_root')
		if db_address.is_a?(String) and root_password.is_a?(String) and doc_root.is_a?(String)
			path = "#{doc_root}/#{@model['path']}/wp-config.php".gsub /\/\//, '/'
			@state['installed'] = true if File.exist?(path)
		end

		@state['http'] = @model['http']
		@state['database'] = @model['database']
		@state['path'] = @model['path']
		@state['source_url'] = @model['source_url']
	end

	def install(p={})
		system('apt-get update; apt-get install -y wget') if `which wget`.strip.length <= 0
		return false if `which wget`.strip.length <= 0

		doc_root = resolve(@model['http'] + '.document_root')

		system("wget --output-document='/tmp/wp.tgz' #{@model['source_url']}")
		return false if not File.exist?('/tmp/wp.tgz')
		system("cd /tmp; tar xvzf wp.tgz")

		home_path = "#{doc_root}/#{@model['path']}"
		home_path.gsub! /\/\//, '/'
		wp_config_path = "#{home_path}/wp-config.php"
		wp_config_sample_path = "#{home_path}/wp-config-sample.php"

		File.delete(home_path) if File.file?(home_path)
		Dir.mkdir(home_path, 0755) if not File.directory?(home_path)
		system("cd /tmp; mv -f wordpress/* #{home_path}/; mv -f wordpress/.* #{home_path}/;rmdir wordpress;rm -f wp.tgz")
		return false if not File.exist?(wp_config_sample_path)

		system("cp -f #{wp_config_sample_path} #{wp_config_path}")

		db = resolve(@model['database'])
		system("sed -i 's/.*DB_NAME.*/define(\"DB_NAME\",\"#{db['db_name']}\");/' #{wp_config_path}")
		system("sed -i 's/.*DB_USER.*/define(\"DB_USER\",\"#{db['db_user']}\");/' #{wp_config_path}")
		system("sed -i 's/.*DB_PASSWORD.*/define(\"DB_PASSWORD\",\"#{db['db_password']}\");/' #{wp_config_path}")
		system("sed -i 's/.*DB_HOST.*/define(\"DB_HOST\",\"#{db['db_address']}\");/' #{wp_config_path}")

		system("cd #{home_path}; mv -f index.html index.html.bak")

		true
	end

	def uninstall(p={})
		doc_root = resolve(@model['http'] + '.document_root')
		home_path = "#{doc_root}/#{@model['path']}".gsub /\/\//, '/'

		# delete all files
		if @model['path'] != '/'
			system("rm -rf #{home_path}")
		else
			system("cd #{home_path}; mv -f index.html.bak /tmp; rm -rf *; mv -f /tmp/index.html.bak index.html")
		end

		true
	end
end
