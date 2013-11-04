require 'ostruct'

class Sfp::Module::HadoopMaster
	include Sfp::Resource

	module Hadoop1
		Services = ['namenode', 'secondarynamenode', 'jobtracker']

		##############################
		#
		# Action methods for Hadoop 1.x (see HadoopMaster.sfp)
		#
		##############################

		def install(p={})
			model = OpenStruct.new(@model)
	
			# add group hadoop
			if `grep '^#{model.user}' /etc/group`.length <= 0
				log.info "adding group #{model.user}"
				shell "echo '#{model.user}:x:8000:' >> /etc/group"
			else
				log.info "group #{model.user} is already exist"
			end
	
			# add user hadoop
			if `grep '^#{model.user}' /etc/passwd`.length <= 0
				log.info "adding user #{model.user}"
				shell "echo '#{model.user}:x:8000:8000::#{model.home_dir}:/bin/bash' >> /etc/passwd &&
				        echo '#{model.user}:#{model.password}:15958:0:99999:7:::' >> /etc/shadow"
			else
				log.info "user #{model.user} is already exist"
			end
	
			# create home_dir
			log.info "create hadoop home directory: #{model.home_dir}"
			shell "mkdir -p #{model.home_dir}" if !::File.exist?(model.home_dir)
			shell "chown -R #{model.user}:#{model.user} #{model.home_dir} && rm -rf #{model.home_dir}/*"
			
			# create scratch_dir
			shell "rm -f #{model.scratch_dir} && mkdir -p #{model.scratch_dir}" if !::File.directory?(model.scratch_dir)
			shell "chown -R #{model.user}:#{model.user} #{model.scratch_dir} && rm -rf #{model.scratch_dir}/*"
	
			# download and extract hadoop binaries
			shell 'apt-get install -y axel'
			downloader = 'axel -q -o' # 'wget -O'
			source = (model.source[-7,7] == '.tar.gz' or model.source[-4,4] == '.tgz' ? model.source : "#{model.source}/hadoop-#{model.version}/hadoop-#{model.version}.tar.gz")
	
			log.info "download and install hadoop binaries"
			file = source.split('/').last.to_s
			basename = (::File.extname(file) == '.gz' ? ::File.basename(file, '.tar.gz') : ::File.basename(file, ::File.extname(file)))
			shell  "cd #{model.home_dir} &&
			        #{downloader} #{file} #{source} &&
			        tar xvzf #{file} && rm -f #{file} &&
			        bash -c 'cd #{model.home_dir}/#{basename} && shopt -s dotglob && mv * .. && cd .. && rm -rf #{basename}'"

			config_dir = "#{model.home_dir}/conf"
	
			map = {
				'user' => model.user,
				'master' => `hostname`.strip,
				'java_home' => model.java_home,
				'tmp_dir' => model.scratch_dir,
				'replication' => model.replication,
			}
	
			# copy and process template configuration files
			log.info "copy and process template configuration files: core-site.xml, hadoop-env.sh, mapred-site.xml"
			dir = File.expand_path(File.dirname(__FILE__)) + '/hadoop1'
			['hadoop-env.sh', 'core-site.xml', 'mapred-site.xml', 'hdfs-site.xml'].each do |file|
				shell "cp -f #{dir}/#{file} #{config_dir}"
				render "#{config_dir}/#{file}", map
			end
			shell "chown -R #{model.user}:#{model.user} #{model.home_dir}"
	
			# create HDFS directory
			if !::File.exist?(model.scratch_dir) && !shell("mkdir -p #{model.scratch_dir}")
				log.info "create scratch directory for HDFS: #{model.scratch_dir}"
				shell "mkdir -p #{model.scratch_dir}"
			end
			shell "chown -R #{model.user}:#{model.user} #{model.scratch_dir}"
	
			# format namenode space
			log.info "format namenode space"
			shell "su -c '#{model.home_dir}/bin/hadoop namenode -format' hadoop"
	
			return false if not installed?
	
			# export hadoop home to root
			log.info "export hadoop home directory to root"
			shell "sed -i '/^export HADOOP_HOME/d' /root/.bashrc"
			shell "echo 'export HADOOP_HOME=#{model.home_dir}' >> /root/.bashrc"
	
			true
		end

		def uninstall(p={})
			model = OpenStruct.new(@model)
			# remove hadoop user and group, and then delete hadoop's home directory
			shell "sed -i '/^export HADOOP_HOME/d' /root/.bash_profile"
			shell "sed -i '/^#{model.user}/d' /etc/passwd &&
   	          sed -i '/^#{model.user}/d' /etc/shadow &&
      	       sed -i '/^#{model.user}/d' /etc/group &&
         	    rm -rf #{model.home_dir} &&
			       rm -rf /tmp/#{model.user}* &&
			       rm -rf #{model.scratch_dir}"
		end

		def start(p={})
			model = OpenStruct.new(@model)
			pids = self.pids
			Sfp::Module::HadoopMaster::Hadoop1::Services.each { |name|
				pid = pids[name]
				if pid <= 0
					cmd = "#{model.home_dir}/bin/hadoop-daemon.sh start #{name}"
					log.info `su -c '#{cmd} && sleep 3' #{model.user}`
				end
			}
			true
		end

		def stop(p={})
			model = OpenStruct.new(@model)
			pids = self.pids
			Sfp::Module::HadoopMaster::Hadoop1::Services.reverse.each { |name|
				pid = pids[name]
				if pid > 0
					cmd = "#{model.home_dir}/bin/hadoop-daemon.sh stop #{name}"
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
		def version
			1
		end

		def get_state
			state = {
				'installed' => installed?,
				'running' => running?,
				'pids' => pids
			}

			# try to restart any stopped daemon
			start if state['running']

			state
		end

		def installed?
			['bin/hadoop', 'conf/hadoop-env.sh', 'conf/core-site.xml', 'conf/mapred-site.xml', 'conf/hdfs-site.xml'].each { |file|
				return false if !::File.exist?("#{@model['home_dir']}/#{file}")
			}
			true
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
			Sfp::Module::HadoopMaster::Hadoop1::Services.each { |name| data[name] = `ps axf | grep java | grep -v grep | grep hadoop | grep Dproc_#{name}`.to_s.strip.split(' ', 2)[0].to_i }
			data
		end
	end

	module Hadoop2
		Services = ['namenode', 'resourcemanager', 'historyserver', 'proxyserver']

		##############################
		#
		# Action methods for Hadoop 2.x (see HadoopMaster.sfp)
		#
		##############################

		def install(p={})
			model = OpenStruct.new(@model)
	
			# add group hadoop
			if `grep '^#{model.user}' /etc/group`.length <= 0
				log.info "adding group #{model.user}"
				shell "echo '#{model.user}:x:8000:' >> /etc/group"
			else
				log.info "group #{model.user} is already exist"
			end
	
			# add user hadoop
			if `grep '^#{model.user}' /etc/passwd`.length <= 0
				log.info "adding user #{model.user}"
				shell "echo '#{model.user}:x:8000:8000::#{model.home_dir}:/bin/bash' >> /etc/passwd &&
				        echo '#{model.user}:#{model.password}:15958:0:99999:7:::' >> /etc/shadow"
			else
				log.info "user #{model.user} is already exist"
			end
	
			# create home_dir
			log.info "create hadoop home directory: #{model.home_dir}"
			shell "mkdir -p #{model.home_dir}" if !::File.exist?(model.home_dir)
			shell "chown -R #{model.user}:#{model.user} #{model.home_dir} && rm -rf #{model.home_dir}/*"
			
			# create scratch_dir
			shell "rm -f #{model.scratch_dir} && mkdir -p #{model.scratch_dir}" if !::File.directory?(model.scratch_dir)
			shell "chown -R #{model.user}:#{model.user} #{model.scratch_dir} && rm -rf #{model.scratch_dir}/*"
	
			# download and extract hadoop binaries
			shell 'apt-get install -y axel'
			downloader = 'axel -q -o'
			source = (model.source[-7,7] == '.tar.gz' or model.source[-4,4] == '.tgz' ? model.source : "#{model.source}/hadoop-#{model.version}/hadoop-#{model.version}.tar.gz")
	
			log.info "download and install hadoop binaries"
			file = source.split('/').last.to_s
			basename = (::File.extname(file) == '.gz' ? ::File.basename(file, '.tar.gz') : ::File.basename(file, ::File.extname(file)))
			shell "cd #{model.home_dir} &&
			       #{downloader} #{file} #{source} &&
			       tar xvzf #{file} && rm -f #{file} &&
			       bash -c 'cd #{model.home_dir}/#{basename} && shopt -s dotglob && mv * .. && cd .. && rm -rf #{basename}'"

			config_dir = "#{model.home_dir}/etc/hadoop"
	
			map = {
				'user' => model.user,
				'master' => `hostname`.strip,
				'java_home' => model.java_home,
				'namenode_name_dir' => model.scratch_dir + "/namenode_data",
				'datanode_data_dir' => model.scratch_dir + "/datanode_data",
				'yarn_local_dir' => model.scratch_dir + "/yarn_local_dir",
				'yarn_log_dir' => model.scratch_dir + "/yarn_log_dir"
			}
	
			log.info "copy and process template configuration files: {hadoop,yarn}-env.sh, {core,hdfs,yarn,mapred}-site.xml"
			dir = File.expand_path(File.dirname(__FILE__)) + '/hadoop2'
			['hadoop-env.sh', 'yarn-env.sh', 'core-site.xml', 'hdfs-site.xml', 'yarn-site.xml', 'mapred-site.xml'].each do |file|
				shell "cp -f #{dir}/#{file} #{config_dir}"
				render "#{config_dir}/#{file}", map
			end
			shell "chown -R #{model.user}:#{model.user} #{model.home_dir}"
	
			[map['namenode_name_dir'], map['datanode_data_dir'], map['yarn_local_dir'], map['yarn_log_dir']].each do |dir|
				shell "mkdir -p #{dir} && chown -R #{model.user}:#{model.user} #{dir}"
			end
	
			# format namenode
			log.info "format namenode space"
			cmd = "#{model.home_dir}/bin/hdfs namenode -format #{model.cluster_name}"
			log.info `su -c '#{cmd}' #{model.user}`
	
			return false if not installed?
	
			# export hadoop home to root
			log.info "export hadoop home directory to root"
			shell "sed -i '/^export HADOOP_HOME/d' /root/.bashrc"
			shell "echo 'export HADOOP_HOME=#{model.home_dir}' >> /root/.bashrc"
	
			true
		end

		def uninstall(p={})
			model = OpenStruct.new(@model)
			# remove hadoop user and group, and then delete hadoop's home directory
			shell "sed -i '/^export HADOOP_HOME/d' /root/.bash_profile"
			shell "sed -i '/^#{model.user}/d' /etc/passwd &&
			       sed -i '/^#{model.user}/d' /etc/shadow &&
			       sed -i '/^#{model.user}/d' /etc/group &&
			       rm -rf #{model.home_dir} &&
			       rm -rf /tmp/#{model.user}* &&
			       rm -rf #{model.scratch_dir}")
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


		##############################
		#
		# Helper methods
		#
		##############################

		protected
		def version
			2
		end

		def get_state
			state = {
				'installed' => installed?,
				'running' => running?,
				'pids' => pids
			}

			# try to restart any stopped daemon
			start if state['running']

			state
		end

		def installed?
			['bin/hadoop', 'etc/hadoop/hadoop-env.sh', 'etc/hadoop/core-site.xml',
          'etc/hadoop/mapred-site.xml', 'etc/hadoop/hdfs-site.xml', 'etc/hadoop/yarn-site.xml'].each { |file|
				return false if !::File.exist?("#{@model['home_dir']}/#{file}")
			}
			true
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
			Sfp::Module::HadoopMaster::Hadoop2::Services.each { |name|
				data[name] = `ps axf | grep java | grep -v grep | grep hadoop | grep Dproc_#{name}`.to_s.strip.split(' ', 2)[0].to_i
			}
			data
		end
	end

	def update_state
		to_model

		if @model['version'] =~ /^1\..+$/ and version != 1
			self.extend(Hadoop1)
		elsif @model['version'] =~ /^2\..+$/ and version != 2
			self.extend(Hadoop2)
		end

		get_state.each { |k,v| @state[k] = v }
	end


	##############################
	#
	# Helper methods
	#
	##############################

	def version
		nil
	end
end