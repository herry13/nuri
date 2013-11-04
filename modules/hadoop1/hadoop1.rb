require 'ostruct'

class Sfp::Module::Hadoop1Master
	include Sfp::Resource

	Services = ['namenode', 'secondarynamenode', 'jobtracker']

	def update_state
		to_model

		@state['installed'] = installed?
		@state['running'] = running?
		@state['pids'] = pids

		# try to restart any stopped daemon
		start if @state['running']
	end

	##############################
	#
	# Action methods (see Hadoop1.sfp)
	#
	##############################

	def install(p={})
		model = OpenStruct.new(@model)

		if java_home.length <= 0
			### install JRE
			shell "apt-get install -y default-jre"
		end

		# add group hadoop
		if `grep '^#{model.group}' /etc/group`.length <= 0
			log.info "adding group #{model.group}"
			shell "echo '#{model.group}:x:8000:' >> /etc/group"
		else
			log.info "group #{model.group} is already exist"
		end

		# add user hadoop
		if `grep '^#{model.user}' /etc/passwd`.length <= 0
			log.info "adding user #{model.user}"
			shell "echo '#{model.user}:x:8000:8000::#{model.home}:/bin/bash' >> /etc/passwd &&
			        echo '#{model.user}:#{model.password}:15958:0:99999:7:::' >> /etc/shadow"
		else
			log.info "user #{model.user} is already exist"
		end

		# create home
		log.info "create hadoop home directory: #{model.home}"
		shell "mkdir -p #{model.home}" if !::File.exist?(model.home)
		shell "chown -R #{model.user}:#{model.user} #{model.home} && rm -rf #{model.home}/*"
		
		# create data_dir
		shell "rm -f #{model.data_dir} && mkdir -p #{model.data_dir}" if !::File.directory?(model.data_dir)
		shell "chown -R #{model.user}:#{model.user} #{model.data_dir} && rm -rf #{model.data_dir}/*"

		# download and extract hadoop binaries
		shell 'apt-get install -y axel'
		downloader = 'axel -q -o' # 'wget -O'
		source = (model.source[-7,7] == '.tar.gz' or model.source[-4,4] == '.tgz' ? model.source : "#{model.source}/hadoop-#{model.version}/hadoop-#{model.version}.tar.gz")

		log.info "download and install hadoop binaries"
		file = source.split('/').last.to_s
		basename = (::File.extname(file) == '.gz' ? ::File.basename(file, '.tar.gz') : ::File.basename(file, ::File.extname(file)))
		shell  "cd #{model.home} &&
		        #{downloader} #{file} #{source} &&
		        tar xvzf #{file} && rm -f #{file} &&
		        bash -c 'cd #{model.home}/#{basename} && shopt -s dotglob && mv * .. && cd .. && rm -rf #{basename}'"

		config_dir = "#{model.home}/conf"

		map = {
			'user' => model.user,
			'master' => `hostname`.strip,
			'java_home' => java_home,
			'tmp_dir' => model.data_dir,
			'replication' => model.replication,
		}

		# copy and process template configuration files
		log.info "copy and process template configuration files: core-site.xml, hadoop-env.sh, mapred-site.xml"
		dir = File.expand_path(File.dirname(__FILE__))
		['hadoop-env.sh', 'core-site.xml', 'mapred-site.xml', 'hdfs-site.xml'].each do |file|
			shell "cp -f #{dir}/#{file} #{config_dir}"
			render_file "#{config_dir}/#{file}", map
		end
		shell "chown -R #{model.user}:#{model.user} #{model.home}"

		# create HDFS directory
		if !::File.exist?(model.data_dir) && !shell("mkdir -p #{model.data_dir}")
			log.info "create scratch directory for HDFS: #{model.data_dir}"
			shell "mkdir -p #{model.data_dir}"
		end
		shell "chown -R #{model.user}:#{model.user} #{model.data_dir}"

		# format namenode space
		log.info "format namenode space"
		shell "su -c '#{model.home}/bin/hadoop namenode -format' hadoop"

		return false if not installed?

		# export hadoop home to root
		log.info "export hadoop home directory to root"
		shell "sed -i '/^export HADOOP_HOME/d' /root/.bashrc"
		shell "echo 'export HADOOP_HOME=#{model.home}' >> /root/.bashrc"

		true
	end

	def uninstall(p={})
		model = OpenStruct.new(@model)
		# remove hadoop user and group, and then delete hadoop's home directory
		shell "sed -i '/^export HADOOP_HOME/d' /root/.bash_profile"
		shell "sed -i '/^#{model.user}/d' /etc/passwd &&
		       sed -i '/^#{model.user}/d' /etc/shadow &&
		       sed -i '/^#{model.user}/d' /etc/group &&
		       rm -rf #{model.home} &&
		       rm -rf /tmp/#{model.user}* &&
		       rm -rf #{model.data_dir}"
	end

	def start(p={})
		model = OpenStruct.new(@model)
		pids = self.pids
		Services.each { |name|
			pid = pids[name]
			if pid <= 0
				cmd = "#{model.home}/bin/hadoop-daemon.sh start #{name}"
				log.info `su -c '#{cmd} && sleep 3' #{model.user}`
			end
		}
		true
	end

	def stop(p={})
		model = OpenStruct.new(@model)
		pids = self.pids
		Services.reverse.each { |name|
			pid = pids[name]
			if pid > 0
				cmd = "#{model.home}/bin/hadoop-daemon.sh stop #{name}"
				log.info `su -c '#{cmd}' #{model.user}`
			end
		}
		true
	end


	##############################
	#
	# Helper methods
	#
	##############################

	protected
	def installed?
		['bin/hadoop', 'conf/hadoop-env.sh', 'conf/core-site.xml', 'conf/mapred-site.xml', 'conf/hdfs-site.xml'].each { |file|
			return false if !::File.exist?("#{@model['home']}/#{file}")
		}
		true
	end

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
			log.warn "#{name} is not running!" if pid <= 0
			status = true if pid > 0
		}
		status
	end

	def pids
		data = {}
		Services.each { |name|
			data[name] = `ps axf | grep java | grep -v grep | grep hadoop | grep Dproc_#{name}`.to_s.strip.split(' ', 2)[0].to_i
		}
		data
	end
end



class Sfp::Module::Hadoop1Slave
	include Sfp::Resource

	Services = ['datanode', 'tasktracker']

	def update_state
		to_model

		@state['installed'] = installed?
		@state['running'] = running?
		@state['pids'] = pids
	
		# try to restart any stopped daemon
		start if @state['running']
	end

	##############################
	#
	# Action methods (see Hadoop1.sfp)
	#
	##############################

	def install(p={})
		model = OpenStruct.new(@model)

		if java_home.length <= 0
			### install JRE
			shell "apt-get install -y default-jre"
		end

		# add group hadoop
		if `grep '^#{model.group}' /etc/group`.length <= 0
			log.info "adding group #{model.group}"
			shell "echo '#{model.group}:x:8000:' >> /etc/group"
		else
			log.info "group #{model.group} is already exist"
		end

		# add user hadoop
		if `grep '^#{model.user}' /etc/passwd`.length <= 0
			log.info "adding user #{model.user}"
			shell "echo '#{model.user}:x:8000:8000::#{model.home}:/bin/bash' >> /etc/passwd &&
			        echo '#{model.user}:#{model.password}:15958:0:99999:7:::' >> /etc/shadow"
		else
			log.info "user #{model.user} is already exist"
		end

		# create home
		log.info "create hadoop home directory: #{model.home}"
		shell "mkdir -p #{model.home}" if !::File.exist?(model.home)
		shell "chown -R #{model.user}:#{model.user} #{model.home} && rm -rf #{model.home}/*"
		
		# create data_dir
		shell "rm -f #{model.data_dir} && mkdir -p #{model.data_dir}" if !::File.directory?(model.data_dir)
		shell "chown -R #{model.user}:#{model.user} #{model.data_dir} && rm -rf #{model.data_dir}/*"

		# download and extract hadoop binaries
		system 'apt-get install -y axel'
		downloader = 'axel -q -o' # 'wget -O'
		source = (model.source[-7,7] == '.tar.gz' or model.source[-4,4] == '.tgz' ? model.source : "#{model.source}/hadoop-#{model.version}/hadoop-#{model.version}.tar.gz")

		log.info "download and install hadoop binaries"
		file = source.split('/').last.to_s
		basename = (::File.extname(file) == '.gz' ? ::File.basename(file, '.tar.gz') : ::File.basename(file, ::File.extname(file)))
		shell  "cd #{model.home} &&
		        #{downloader} #{file} #{source} &&
		        tar xvzf #{file} && rm -f #{file} &&
		        bash -c 'cd #{model.home}/#{basename} && shopt -s dotglob && mv * .. && cd .. && rm -rf #{basename}'"

		map = {
			'user' => model.user,
			'master' => resolve(model.master + '.parent.sfpAddress'),
			'java_home' => java_home,
			'replication' => resolve(model.master + '.replication')
		}

		# copy and process template configuration files
		log.info "copy and process template configuration files: core-site.xml, hadoop-env.sh, mapred-site.xml"
		dir = File.expand_path(File.dirname(__FILE__))
		['hadoop-env.sh', 'core-site.xml', 'mapred-site.xml', 'hdfs-site.xml'].each do |file|
			copy "#{dir}/#{file}", "#{model.home}/conf/"
			render_file "#{model.home}/conf/#{file}", map
		end
		shell "chown -R #{model.user}:#{model.user} #{model.home}"

		# export hadoop home to root
		log.info "export hadoop home directory to root"
		shell "sed -i '/^export HADOOP_HOME/d' /root/.bashrc"
		shell "echo 'export HADOOP_HOME=#{model.home}' >> /root/.bashrc"

		installed?
	end

	def uninstall(p={})
		model = OpenStruct.new(@model)
		# remove hadoop user and group, and then delete hadoop's home directory
		shell "sed -i '/^export HADOOP_HOME/d' /root/.bash_profile"
		shell "sed -i '/^#{model.user}/d' /etc/passwd &&
		       sed -i '/^#{model.user}/d' /etc/shadow &&
		       sed -i '/^#{model.user}/d' /etc/group &&
		       rm -rf #{model.home} &&
		       rm -rf /tmp/#{model.user}*"

		not installed?
	end

	def start(p={})
		model = OpenStruct.new(@model)
		pids.each { |name,pid|
			if pid <= 0
				cmd = "#{model.home}/bin/hadoop-daemon.sh start #{name}"
				log.info `su -c '#{cmd} && sleep 3' #{model.user}`
			end
		}

		running?
	end

	def stop(p={})
		model = OpenStruct.new(@model)
		pids.each { |name,pid|
			if pid > 0
				cmd = "#{model.home}/bin/hadoop-daemon.sh stop #{name}"
				log.info `su -c '#{cmd}' #{model.user}`
			end
		}

		pids.each { |name,pid|
			begin
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

	def installed?
		['bin/hadoop', 'conf/hadoop-env.sh', 'conf/core-site.xml', 'conf/mapred-site.xml', 'conf/hdfs-site.xml'].each { |file|
			return false if !::File.exist?("#{@model['home']}/#{file}")
		}
		true
	end

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
			log.warn "#{name} is not running!" if pid <= 0
			status = true if pid > 0
		}
		status
	end

	def pids
		data = {}
		Services.each { |name|
			data[name] = `ps axf | grep java | grep -v grep | grep hadoop | grep Dproc_#{name}`.to_s.strip.split(' ', 2)[0].to_i
		}
		data
	end
end
