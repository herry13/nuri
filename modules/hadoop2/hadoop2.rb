require ::File.dirname(__FILE__) + '/../tarpackage/tarpackage.rb'

module Sfp::Module::Hadoop2Common
	def update_state
		to_model

		super

		@state['running'] = running?
		@state['configured'] = configured?
		@state['pids'] = pids
		@state['java_home'] = java_home

		start if @state['running']
	end

	##############################
	#
	# Action methods (see Hadoop.sfp)
	#
	##############################

	def uninstall(p={})
		model = OpenStruct.new(@model)
		# remove hadoop user and group, and then delete hadoop's home directory
		shell "sed -i '/^export HADOOP_HOME/d' /root/.bash_profile"
		shell "rm -rf #{model.home} &&
		       rm -rf /tmp/#{model.user}* &&
		       rm -rf #{model.data_dir}"

		not installed?
	end

	def configure(p={})
		### configure Java runtime
		if java_home.length <= 0
			log.info "JRE is not available - installing default-jre..."
			shell "apt-get install -y default-jre"
		end

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

		### set ownership of home directory
		log.info "set ownership of home directory"
		shell "chown -R #{@model['user']}:#{@model['group']} #{@model['home']}"

		configured?
	end


	##############################
	#
	# Helper methods
	#
	##############################

	def resolve_link(link)
		begin
			link = ::File.readlink(link)
			link = resolve_link(link)
		rescue
			link
		end
	end

	def java_home
		return @model['java_home'] if @model['java_home'].to_s.strip.length > 0
		java = resolve_link(`which java`.strip)
		return '' if java.length <= 0
		::File.expand_path(java + '/../../')
	end

	def running?
		status = false
		pids.each { |name,pid|
			log.info "#{name} is not running!" if pid <= 0
			status = true if pid > 0
		}
		status
	end

	def configured?
		return true if not installed?

		return false if Etc.getpwuid(File.stat(@model['home']).uid).name != @model['user']

		return false if java_home.length <= 0

		### check data directory
		return false if not ::File.exist?(@model['data_dir'])

		### check configuration files
		dir = File.dirname(__FILE__)
		map = self.map
		['hadoop-env.sh', 'yarn-env.sh', 'core-site.xml', 'hdfs-site.xml', 'yarn-site.xml', 'mapred-site.xml'].each do |file|
			target = "#{config_dir}/#{file}"
			source = "#{dir}/#{file}"
			if not ::File.exist?(target)
				log.warn "File #{target} is not exist!"
				return false 
			end
			if render(::File.read(source), map).hash != File.read(target).hash
				log.warn "File #{target} is not comply!"
				return false
			end
		end

		true
	end

	def config_dir
		@model['home'] + '/etc/hadoop'
	end

	def common_map
		{
			'java_home' => java_home,
			'dfs_namenode_name_dir' => @model['data_dir'] + "/namenode_data",
			'dfs_namenode_hosts' => '',
			'dfs_blocksize' => 268435456,
			'dfs_namenode_handler_count' => 10,
			'dfs_datanode_data_dir' => @model['data_dir'] + "/datanode_data",
			'mapreduce_framework_name' => 'yarn',
			'mapreduce_map_memory_mb' => 1536,
			'mapreduce_map_java_opts' => '-Xmx1024M',
			'mapreduce_reduce_memory_mb' => 3072,
			'mapreduce_reduce_java_opts' => '-Xmx2560M',
			'mapreduce_task_io_sort_mb' => 512,
			'mapreduce_task_io_sort_factor' => 100,
			'mapreduce_reduce_shuffle_parallelcopies' => 50,
			'yarn_acl_enable' => false,
			'yarn_admin_acl' => '*',
			'yarn_log_aggregation_enable' => false,
			'yarn_resourcemanager_scheduler_class' => 'org.apache.hadoop.yarn.server.resourcemanager.scheduler.capacity.CapacityScheduler',
			'yarn_scheduler_minimum_allocation_mb' => 256,
			'yarn_scheduler_maximum_allocation_mb' => 1024,
			'yarn_nodemanager_resource_memory_mb' => 512,
			'yarn_nodemanager_vmem_pmem_ratio' => 2,
			'yarn_nodemanager_log_retain_seconds' => 10800,
			'yarn_nodemanager_aux_services' => 'mapreduce_shuffle',
			'yarn_log_aggregation_retain_seconds' => -1,
			'yarn_log_aggregation_retain_check_interval_seconds' => -1,
			'yarn_nodemanager_local_dirs' => @model['data_dir'] + "/yarn_local_dir",
			'yarn_nodemanager_log_dirs' => @model['data_dir'] + "/yarn_log_dir",
			'io_file_buffer_size' => 131072,
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

	def common_create_data_directory
		data_dir = @model['data_dir']
		return if ::File.exist?(data_dir)

		log.info "create data directory #{data_dir}"

		### create data directory if not exist
		Dir.mkdir(data_dir)

		### create data sub directory
		map = self.map
		[map['dfs_namenode_name_dir'], map['dfs_datanode_data_dir'], map['yarn_nodemanager_local_dirs'], map['yarn_nodemanager_log_dirs']].each do |dir|
			log.info "create directory #{dir}"
			Dir.mkdir(dir)
		end

		### set ownership
		shell "chown -R #{@model['user']}:#{@model['group']} #{data_dir}"
	end
end

class Sfp::Module::Hadoop2Master < Sfp::Module::TarPackage
	include ::Sfp::Module::Hadoop2Common

	Services = ['namenode', 'resourcemanager', 'historyserver', 'proxyserver']

	##############################
	#
	# Action methods (see TarPackage.sfp)
	#
	##############################

	def start(p={})
		model = OpenStruct.new(@model)
		pids = self.pids

		if pids['namenode'] <= 0
			cmd = "#{model.home}/sbin/hadoop-daemon.sh --config #{model.home}/etc/hadoop --script hdfs start namenode"
			log.info `su -c '#{cmd}' #{model.user}`
		end

		if pids['resourcemanager'] <= 0
			cmd = "#{model.home}/sbin/yarn-daemon.sh --config #{model.home}/etc/hadoop start resourcemanager"
			log.info `su -c '#{cmd}' #{model.user}`
		end

		if pids['proxyserver'] <= 0
			cmd = "#{model.home}/sbin/yarn-daemon.sh --config #{model.home}/etc/hadoop start proxyserver"
			log.info `su -c '#{cmd}' #{model.user}`
		end

		### wait until namenode is running
		n = 0
		until self.pids['namenode'] > 0 or n > 10
			n += 1
			sleep 1
		end

		if pids['historyserver'] <= 0
			cmd = "#{model.home}/sbin/mr-jobhistory-daemon.sh --config #{model.home}/etc/hadoop start historyserver"
			log.info `su -c '#{cmd}' #{model.user}`
		end

		running?
	end

	def stop(p={})
		model = OpenStruct.new(@model)
		pids = self.pids

		if pids['historyserver'] > 0
			cmd = "#{model.home}/sbin/mr-jobhistory-daemon.sh --config #{model.home}/etc/hadoop stop historyserver"
			log.info `su -c '#{cmd}' #{model.user}`
		end

		if pids['proxyserver'] > 0
			cmd = "#{model.home}/sbin/yarn-daemon.sh --config #{model.home}/etc/hadoop stop proxyserver"
			log.info `su -c '#{cmd}' #{model.user}`
		end

		if pids['resourcemanager'] > 0
			cmd = "#{model.home}/sbin/yarn-daemon.sh --config #{model.home}/etc/hadoop stop resourcemanager"
			log.info `su -c '#{cmd}' #{model.user}`
		end

		if pids['namenode'] > 0
			cmd = "#{model.home}/sbin/hadoop-daemon.sh --config #{model.home}/etc/hadoop --script hdfs stop namenode"
			log.info `su -c '#{cmd}' #{model.user}`
		end

		sleep 1
		pids.each { |service,pid|
			next if pid <= 0
			begin
				log.info "Killing #{service}"
				Process.kill 9, pid
			rescue
			end
		}

		not running?
	end

	##############################
	#
	# Helper methods
	#
	##############################

	def pids
		data = {}
		Services.each { |name|
			data[name] = `ps axf | grep java | grep -v grep | grep hadoop | grep Dproc_#{name}`.to_s.strip.split(' ', 2)[0].to_i
		}
		data
	end

	def map
		map = common_map
		map['master'] = `hostname`.to_s.strip
		map
	end

	def create_data_directory
		return if ::File.exist?(@model['data_dir'])

		common_create_data_directory

		### format namenode
		log.info "format namenode space"
		cmd = "#{@model['home']}/bin/hdfs namenode -format #{@model['cluster_name']}"
		log.info `su -c '#{cmd}' #{@model['user']}`
	end
end

class Sfp::Module::Hadoop2Slave < Sfp::Module::TarPackage
	include ::Sfp::Module::Hadoop2Common

	Services = ['datanode', 'nodemanager']

	##############################
	#
	# Action methods (see TarPackage.sfp)
	#
	##############################

	def start(p={})
		model = OpenStruct.new(@model)
		pids = self.pids

		if pids['datanode'] <= 0
			cmd = "#{model.home}/sbin/hadoop-daemon.sh --config #{model.home}/etc/hadoop --script hdfs start datanode"
			log.info `su -c '#{cmd}' #{model.user}`
		end

		if pids['nodemanager'] <= 0
			cmd = "#{model.home}/sbin/yarn-daemon.sh --config #{model.home}/etc/hadoop start nodemanager"
			log.info `su -c '#{cmd}' #{model.user}`
		end

		running?
	end

	def stop(p={})
		model = OpenStruct.new(@model)
		pids = self.pids

		if pids['datanode'] > 0
			cmd = "#{model.home}/sbin/hadoop-daemon.sh --config #{model.home}/etc/hadoop --script hdfs stop datanode"
			log.info `su -c '#{cmd}' #{model.user}`
		end

		if pids['nodemanager'] > 0
			cmd = "#{model.home}/sbin/yarn-daemon.sh --config #{model.home}/etc/hadoop stop nodemanager"
			log.info `su -c '#{cmd}' #{model.user}`
		end

		pids.each { |service,pid|
			next if pid <= 0
			log.info "Killing #{server}"
			Process.kill 9, pid
		}

		not running?
	end

	##############################
	#
	# Helper methods
	#
	##############################

	def pids
		data = {}
		Services.each { |name|
			data[name] = `ps axf | grep java | grep -v grep | grep hadoop | grep Dproc_#{name}`.to_s.strip.split(' ', 2)[0].to_i
		}
		data
	end

	def map
		map = common_map
		map['master'] = resolve(@model['master'] + '.parent.sfpAddress')
		map
	end

	def create_data_directory
		common_create_data_directory
	end
end
