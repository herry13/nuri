require ::File.dirname(__FILE__) + '/../tarpackage/tarpackage.rb'

class Sfp::Module::Hadoop2Master < Sfp::Module::TarPackage
	Services = ['namenode', 'resourcemanager', 'historyserver', 'proxyserver']

	def update_state
		to_model

		super

		@state['running'] = running?
		@state['configured'] = configured?
		@state['pids'] = pids

		start if @state['running']
	end

	def install(p={})
		return false if not super

		### set ownership of home directory
		shell "chown -R #{@model['user']}:#{@model['group']} #{@model['home']}"

		(configure and installed?)
	end

	def uninstall(p={})
		model = OpenStruct.new(@model)
		# remove hadoop user and group, and then delete hadoop's home directory
		shell "sed -i '/^export HADOOP_HOME/d' /root/.bash_profile"
		shell "sed -i '/^#{model.user}/d' /etc/passwd &&
		       sed -i '/^#{model.user}/d' /etc/shadow &&
		       sed -i '/^#{model.group}/d' /etc/group &&
		       rm -rf #{model.home} &&
		       rm -rf /tmp/#{model.user}* &&
		       rm -rf #{model.data_dir}"

		not installed?
	end

	def start(p={})
		model = OpenStruct.new(@model)
		pids = self.pids

		if pids['namenode'] <= 0
			cmd = "#{model.home_dir}/sbin/hadoop-daemon.sh --config #{model.home_dir}/etc/hadoop --script hdfs start namenode"
			log.info `su -c '#{cmd}' #{model.user}`
		end

		if pids['resourcemanager'] <= 0
			cmd = "#{model.home_dir}/sbin/yarn-daemon.sh --config #{model.home_dir}/etc/hadoop start resourcemanager"
			log.info `su -c '#{cmd}' #{model.user}`
		end

		if pids['proxyserver'] <= 0
			cmd = "#{model.home_dir}/sbin/yarn-daemon.sh --config #{model.home_dir}/etc/hadoop start proxyserver"
			log.info `su -c '#{cmd}' #{model.user}`
		end

		sleep 1
		if pids['historyserver'] <= 0
			cmd = "#{model.home_dir}/sbin/mr-jobhistory-daemon.sh --config #{model.home_dir}/etc/hadoop start historyserver"
			log.info `su -c '#{cmd}' #{model.user}`
		end

		pids = self.pids
		if pids['historyserver'] <= 0
			sleep 6
			cmd = "#{model.home_dir}/sbin/mr-jobhistory-daemon.sh --config #{model.home_dir}/etc/hadoop start historyserver"
			log.info `su -c '#{cmd}' #{model.user}`
		end

		running?
	end

	def stop(p={})
		model = OpenStruct.new(@model)
		pids = self.pids

		if pids['historyserver'] > 0
			cmd = "#{model.home_dir}/sbin/mr-jobhistory-daemon.sh --config #{model.home_dir}/etc/hadoop stop historyserver"
			log.info `su -c '#{cmd}' #{model.user}`
		end

		if pids['proxyserver'] > 0
			cmd = "#{model.home_dir}/sbin/yarn-daemon.sh --config #{model.home_dir}/etc/hadoop stop proxyserver"
			log.info `su -c '#{cmd}' #{model.user}`
		end

		if pids['resourcemanager'] > 0
			cmd = "#{model.home_dir}/sbin/yarn-daemon.sh --config #{model.home_dir}/etc/hadoop stop resourcemanager"
			log.info `su -c '#{cmd}' #{model.user}`
		end

		if pids['namenode'] > 0
			cmd = "#{model.home_dir}/sbin/hadoop-daemon.sh --config #{model.home_dir}/etc/hadoop --script hdfs stop namenode"
			log.info `su -c '#{cmd}' #{model.user}`
		end

		not running?
	end

	def configure(p={})
		### generate configuration files
		log.info "copy and process template configuration files: {hadoop,yarn}-env.sh, {core,hdfs,yarn,mapred}-site.xml"
		dir = File.dirname(__FILE__)
		['hadoop-env.sh', 'yarn-env.sh', 'core-site.xml', 'hdfs-site.xml', 'yarn-site.xml', 'mapred-site.xml'].each do |file|
			copy "#{dir}/#{file}", config_dir
			render_file "#{config_dir}/#{file}", map
		end

		### add user and group
		add_user_group

		### create data directory
		create_data_directory
	
		# export hadoop home to root
		log.info "export hadoop home directory to root"
		shell "sed -i '/^export HADOOP_HOME/d' /root/.bashrc"
		shell "echo 'export HADOOP_HOME=#{@model['home']}' >> /root/.bashrc"

		configured?
	end

	protected

	def running?
		status = false
		pids.each { |name,pid|
			log.warn "#{name} is not running!" if pid <= 0
			status = true if pid > 0
		}
		status
	end

	def configured?
		### check data directory
		return false if not ::File.exist?(@model['data_dir'])

		### check configuration files
		dir = File.dirname(__FILE__)
		['hadoop-env.sh', 'yarn-env.sh', 'core-site.xml', 'hdfs-site.xml', 'yarn-site.xml', 'mapred-site.xml'].each do |file|
			target = "#{config_dir}/#{file}"
			source = "#{dir}/#{file}"
			return false if not ::File.exist?(target)
			return false if render(source, map).hash != File.read(target).hash
		end

		true
	end

	def config_dir
		@model['home'] + '/conf'
	end

	def pids
		data = {}
		Services.each { |name|
			data[name] = `ps axf | grep java | grep -v grep | grep hadoop | grep Dproc_#{name}`.to_s.strip.split(' ', 2)[0].to_i
		}
		data
	end

	def map
		{
			'master' => `hostname`.to_s.strip,
			'namenode_name_dir' => @model['data_dir'] + "/namenode_data",
			'datanode_data_dir' => @model['data_dir'] + "/datanode_data",
			'yarn_local_dir' => @model['data_dir'] + "/yarn_local_dir",
			'yarn_log_dir' => @model['data_dir'] + "/yarn_log_dir"
		}
	end

	# TODO -- user "useradd" and "groupadd"
	def add_user_group
		user = @model['user']
		group = @model['group']

		### add group if not exist
		if `grep '^#{group}' /etc/group`.length <= 0
			log.info "adding group #{group}"
			shell "echo '#{group}:x:8000:' >> /etc/group"
		else
			log.info "group #{group} is already exist"
		end

		### add user if not exist
		if `grep '^#{user}' /etc/passwd`.length <= 0
			password = @model['password']
			home = @model['home']

			log.info "adding user #{user}"
			shell "echo '#{user}:x:8000:8000::#{home}:/bin/bash' >> /etc/passwd &&
			       echo '#{user}:#{password}:15958:0:99999:7:::' >> /etc/shadow"
		else
			log.info "user #{user} is already exist"
		end
	end

	def create_data_directory
		data_dir = @model['data_dir']
		return if ::File.exist?(data_dir)

		log.info "create data directory #{data_dir}"

		### create data directory if not exist
		Dir.mkdir(data_dir)

		### create data sub directory
		[map['namenode_name_dir'], map['datanode_data_dir'], map['yarn_local_dir'], map['yarn_log_dir']].each do |dir|
			Dir.mkdir(dir)
		end

		### set ownership
		shell "chown -R #{@model['user']}:#{@model['group']} #{data_dir}"

		### format namenode
		log.info "format namenode space"
		cmd = "#{@model['home']}/bin/hdfs namenode -format #{@model['cluster_name']}"
		log.info `su -c '#{cmd}' #{@model['user']}`
	end
end


class Sfp::Module::Hadoop2Slave < Sfp::Module::TarPackage
	Services = ['datanode', 'nodemanager']

	def update_state
		to_model

		super

		@state['running'] = running?
		@state['configured'] = configured?
		@state['pids'] = pids

		start if @state['running']
	end

	def install(p={})
		return false if not super

		### set ownership of home directory
		shell "chown -R #{@model['user']}:#{@model['group']} #{@model['home']}"

		(configure and installed?)
	end

	def uninstall(p={})
		model = OpenStruct.new(@model)
		# remove hadoop user and group, and then delete hadoop's home directory
		shell "sed -i '/^export HADOOP_HOME/d' /root/.bash_profile"
		shell "sed -i '/^#{model.user}/d' /etc/passwd &&
		       sed -i '/^#{model.user}/d' /etc/shadow &&
		       sed -i '/^#{model.group}/d' /etc/group &&
		       rm -rf #{model.home} &&
		       rm -rf /tmp/#{model.user}* &&
		       rm -rf #{model.data_dir}"

		not installed?
	end

	def start(p={})
		model = OpenStruct.new(@model)
		pids = self.pids

		if pids['datanode'] <= 0
			cmd = "#{model.home_dir}/sbin/hadoop-daemon.sh --config #{model.home_dir}/etc/hadoop --script hdfs start datanode"
			log.info `su -c '#{cmd}' #{model.user}`
		end

		if pids['nodemanager'] <= 0
			cmd = "#{model.home_dir}/sbin/yarn-daemon.sh --config #{model.home_dir}/etc/hadoop start nodemanager"
			log.info `su -c '#{cmd}' #{model.user}`
		end

		running?
	end

	def stop(p={})
		model = OpenStruct.new(@model)
		pids = self.pids

		if pids['datanode'] > 0
			cmd = "#{model.home_dir}/sbin/hadoop-daemon.sh --config #{model.home_dir}/etc/hadoop --script hdfs stop datanode"
			log.info `su -c '#{cmd}' #{model.user}`
		end

		if pids['nodemanager'] > 0
			cmd = "#{model.home_dir}/sbin/yarn-daemon.sh --config #{model.home_dir}/etc/hadoop stop nodemanager"
			log.info `su -c '#{cmd}' #{model.user}`
		end

		not running?
	end

	def configure(p={})
		### generate configuration files
		log.info "copy and process template configuration files: {hadoop,yarn}-env.sh, {core,hdfs,yarn,mapred}-site.xml"
		dir = File.dirname(__FILE__)
		['hadoop-env.sh', 'yarn-env.sh', 'core-site.xml', 'hdfs-site.xml', 'yarn-site.xml', 'mapred-site.xml'].each do |file|
			copy "#{dir}/#{file}", config_dir
			render_file "#{config_dir}/#{file}", map
		end

		### add user and group
		add_user_group

		### create data directory
		create_data_directory
	
		# export hadoop home to root
		log.info "export hadoop home directory to root"
		shell "sed -i '/^export HADOOP_HOME/d' /root/.bashrc"
		shell "echo 'export HADOOP_HOME=#{@model['home']}' >> /root/.bashrc"

		configured?
	end

	protected

	def running?
		status = false
		pids.each { |name,pid|
			log.warn "#{name} is not running!" if pid <= 0
			status = true if pid > 0
		}
		status
	end

	def configured?
		### check data directory
		return false if not ::File.exist?(@model['data_dir'])

		### check configuration files
		dir = File.dirname(__FILE__)
		['hadoop-env.sh', 'yarn-env.sh', 'core-site.xml', 'hdfs-site.xml', 'yarn-site.xml', 'mapred-site.xml'].each do |file|
			target = "#{config_dir}/#{file}"
			source = "#{dir}/#{file}"
			return false if not ::File.exist?(target)
			return false if render(source, map).hash != File.read(target).hash
		end

		true
	end

	def config_dir
		@model['home'] + '/conf'
	end

	def pids
		data = {}
		Services.each { |name|
			data[name] = `ps axf | grep java | grep -v grep | grep hadoop | grep Dproc_#{name}`.to_s.strip.split(' ', 2)[0].to_i
		}
		data
	end

	def map
		{
			'master' => resolve(@model['master'] + '.parent.sfpAddress'),
			'namenode_name_dir' => @model['data_dir'] + "/namenode_data",
			'datanode_data_dir' => @model['data_dir'] + "/datanode_data",
			'yarn_local_dir' => @model['data_dir'] + "/yarn_local_dir",
			'yarn_log_dir' => @model['data_dir'] + "/yarn_log_dir"
		}
	end

	# TODO -- user "useradd" and "groupadd"
	def add_user_group
		user = @model['user']
		group = @model['group']

		### add group if not exist
		if `grep '^#{group}' /etc/group`.length <= 0
			log.info "adding group #{group}"
			shell "echo '#{group}:x:8000:' >> /etc/group"
		else
			log.info "group #{group} is already exist"
		end

		### add user if not exist
		if `grep '^#{user}' /etc/passwd`.length <= 0
			password = @model['password']
			home = @model['home']

			log.info "adding user #{user}"
			shell "echo '#{user}:x:8000:8000::#{home}:/bin/bash' >> /etc/passwd &&
			       echo '#{user}:#{password}:15958:0:99999:7:::' >> /etc/shadow"
		else
			log.info "user #{user} is already exist"
		end
	end

	def create_data_directory
		data_dir = @model['data_dir']
		return if ::File.exist?(data_dir)

		log.info "create data directory #{data_dir}"

		### create data directory if not exist
		Dir.mkdir(data_dir)

		### create data sub directory
		[map['namenode_name_dir'], map['datanode_data_dir'], map['yarn_local_dir'], map['yarn_log_dir']].each do |dir|
			Dir.mkdir(dir)
		end

		### set ownership
		shell "chown -R #{@model['user']}:#{@model['group']} #{data_dir}"
	end
end
