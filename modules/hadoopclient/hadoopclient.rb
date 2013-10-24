require 'ostruct'

class Sfp::Module::HadoopClient
	include Sfp::Resource

	module Hadoop1
		Services = ['datanode', 'tasktracker']

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
			start if @state['running']

			state
		end

		def install(p={})
			model = OpenStruct.new(@model)
	
			# add group hadoop
			if `grep '^#{model.user}' /etc/group`.length <= 0
				log.info "adding group #{model.user}"
				system "echo '#{model.user}:x:8000:' >> /etc/group"
			else
				log.info "group #{model.user} is already exist"
			end
	
			# add user hadoop
			if `grep '^#{model.user}' /etc/passwd`.length <= 0
				log.info "adding user #{model.user}"
				system "echo '#{model.user}:x:8000:8000::#{model.home_dir}:/bin/bash' >> /etc/passwd &&
				        echo '#{model.user}:#{model.password}:15958:0:99999:7:::' >> /etc/shadow"
			else
				log.info "user #{model.user} is already exist"
			end
	
			# create home_dir
			log.info "create hadoop home directory: #{model.home_dir}"
			system "mkdir -p #{model.home_dir}" if !::File.exist?(model.home_dir)
			system "chown -R #{model.user}:#{model.user} #{model.home_dir} && rm -rf #{model.home_dir}/*"
			
			# create scratch_dir
			system "rm -f #{model.scratch_dir} && mkdir -p #{model.scratch_dir}" if !::File.directory?(model.scratch_dir)
			system "chown -R #{model.user}:#{model.user} #{model.scratch_dir} && rm -rf #{model.scratch_dir}/*"
	
			# download and extract hadoop binaries
			system 'apt-get install -y axel'
			downloader = 'axel -q -o' # 'wget -O'
			source = (model.source[-7,7] == '.tar.gz' or model.source[-4,4] == '.tgz' ? model.source : "#{model.source}/hadoop-#{model.version}/hadoop-#{model.version}.tar.gz")
	
			log.info "download and install hadoop binaries"
			file = source.split('/').last.to_s
			basename = (::File.extname(file) == '.gz' ? ::File.basename(file, '.tar.gz') : ::File.basename(file, ::File.extname(file)))
			system "cd #{model.home_dir} &&
			        #{downloader} #{file} #{source} &&
			        tar xvzf #{file} && rm -f #{file} &&
			        bash -c 'cd #{model.home_dir}/#{basename} && shopt -s dotglob && mv * .. && cd .. && rm -rf #{basename}'"

			map = {
				'user' => model.user,
				'master' => resolve(model.master + '.parent.sfpAddress'),
				'java_home' => model.java_home,
				'replication' => resolve(model.master + '.replication')
			}
			renderer = Sfp::TemplateEngine.new(map)
	
			# copy and process template configuration files
			log.info "copy and process template configuration files: core-site.xml, hadoop-env.sh, mapred-site.xml"
			dir = File.expand_path(File.dirname(__FILE__)) + '/config-1.x'
			['hadoop-env.sh', 'core-site.xml', 'mapred-site.xml', 'hdfs-site.xml'].each do |file|
				system "cp -f #{dir}/#{file} #{model.home_dir}/conf/"
				renderer.render_file("#{model.home_dir}/conf/#{file}")
			end
			system "chown -R #{model.user}:#{model.user} #{model.home_dir}"
	
			# export hadoop home to root
			log.info "export hadoop home directory to root"
			system "sed -i '/^export HADOOP_HOME/d' /root/.bashrc"
			system "echo 'export HADOOP_HOME=#{model.home_dir}' >> /root/.bashrc"
	
			installed?
		end

		def uninstall(p={})
			model = OpenStruct.new(@model)
			# remove hadoop user and group, and then delete hadoop's home directory
			system "sed -i '/^export HADOOP_HOME/d' /root/.bash_profile"
			!!system("sed -i '/^#{model.user}/d' /etc/passwd &&
   	             sed -i '/^#{model.user}/d' /etc/shadow &&
      	          sed -i '/^#{model.user}/d' /etc/group &&
   	             rm -rf #{model.home_dir} &&
			          rm -rf /tmp/#{model.user}*")
		end

		def start(p={})
			model = OpenStruct.new(@model)
			pids.each { |name,pid|
				if pid <= 0
					cmd = "#{model.home_dir}/bin/hadoop-daemon.sh start #{name}"
					log.info `su -c '#{cmd} && sleep 3' #{model.user}`
				end
			}
			true
		end

		def stop(p={})
			model = OpenStruct.new(@model)
			pids.each { |name,pid|
				if pid > 0
					cmd = "#{model.home_dir}/bin/hadoop-daemon.sh stop #{name}"
					log.info `su -c '#{cmd}' #{model.user}`
				end
			}
			true
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
			Sfp::Module::HadoopClient::Services.each { |name|
				data[name] = `ps axf | grep java | grep -v grep | grep hadoop | grep Dproc_#{name}`.to_s.strip.split(' ', 2)[0].to_i
			}
			data
		end
	end

	module Hadoop2
		Services = ['datanode', 'nodemanager']

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
			start if @state['running']

			state
		end

		def install(p={})
			model = OpenStruct.new(@model)
	
			# add group hadoop
			if `grep '^#{model.user}' /etc/group`.length <= 0
				log.info "adding group #{model.user}"
				system "echo '#{model.user}:x:8000:' >> /etc/group"
			else
				log.info "group #{model.user} is already exist"
			end
	
			# add user hadoop
			if `grep '^#{model.user}' /etc/passwd`.length <= 0
				log.info "adding user #{model.user}"
				system "echo '#{model.user}:x:8000:8000::#{model.home_dir}:/bin/bash' >> /etc/passwd &&
				        echo '#{model.user}:#{model.password}:15958:0:99999:7:::' >> /etc/shadow"
			else
				log.info "user #{model.user} is already exist"
			end
	
			# create home_dir
			log.info "create hadoop home directory: #{model.home_dir}"
			system "mkdir -p #{model.home_dir}" if !::File.exist?(model.home_dir)
			system "chown -R #{model.user}:#{model.user} #{model.home_dir} && rm -rf #{model.home_dir}/*"
			
			# create scratch_dir
			system "rm -f #{model.scratch_dir} && mkdir -p #{model.scratch_dir}" if !::File.directory?(model.scratch_dir)
			system "chown -R #{model.user}:#{model.user} #{model.scratch_dir} && rm -rf #{model.scratch_dir}/*"
	
			# download and extract hadoop binaries
			system 'apt-get install -y axel'
			downloader = 'axel -q -o' # 'wget -O'
			source = (model.source[-7,7] == '.tar.gz' or model.source[-4,4] == '.tgz' ? model.source : "#{model.source}/hadoop-#{model.version}/hadoop-#{model.version}.tar.gz")
	
			log.info "download and install hadoop binaries"
			file = source.split('/').last.to_s
			basename = (::File.extname(file) == '.gz' ? ::File.basename(file, '.tar.gz') : ::File.basename(file, ::File.extname(file)))
			system "cd #{model.home_dir} &&
			        #{downloader} #{file} #{source} &&
			        tar xvzf #{file} && rm -f #{file} &&
			        bash -c 'cd #{model.home_dir}/#{basename} && shopt -s dotglob && mv * .. && cd .. && rm -rf #{basename}'"

			config_dir = "#{model.home_dir}/etc/hadoop"
	
			map = {
				'user' => model.user,
				'master' => resolve(model.master + '.parent.sfpAddress'),
				'java_home' => model.java_home,
				'namenode_name_dir' => model.scratch_dir + "/namenode_data",
				'datanode_data_dir' => model.scratch_dir + "/datanode_data",
				'yarn_local_dir' => model.scratch_dir + "/yarn_local_dir",
				'yarn_log_dir' => model.scratch_dir + "/yarn_log_dir"
			}
			renderer = Sfp::TemplateEngine.new(map)
	
			log.info "copy and process template configuration files: {hadoop,yarn}-env.sh, {core,hdfs,yarn,mapred}-site.xml"
			dir = File.expand_path(File.dirname(__FILE__)) + '/config-2.x'
			['hadoop-env.sh', 'yarn-env.sh', 'core-site.xml', 'hdfs-site.xml', 'yarn-site.xml', 'mapred-site.xml'].each do |file|
				system "cp -f #{dir}/#{file} #{config_dir}"
				renderer.render_file("#{config_dir}/#{file}")
			end
			system "chown -R #{model.user}:#{model.user} #{model.home_dir}"
	
			[map['namenode_name_dir'], map['namenode_name_dir'], map['namenode_name_dir'], map['namenode_name_dir']].each do |dir|
				system "mkdir -p #{dir} && chown -R #{model.user}:#{model.user} #{dir}"
			end
	
			installed?
		end

		def uninstall(p={})
			model = OpenStruct.new(@model)
			# remove hadoop user and group, and then delete hadoop's home directory
			system "sed -i '/^export HADOOP_HOME/d' /root/.bash_profile"
			!!system("sed -i '/^#{model.user}/d' /etc/passwd &&
   	             sed -i '/^#{model.user}/d' /etc/shadow &&
      	          sed -i '/^#{model.user}/d' /etc/group &&
         	       rm -rf #{model.home_dir} &&
		      	    rm -rf /tmp/#{model.user}* &&
		         	 rm -rf #{model.scratch_dir}")
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

	def version
		nil
	end

	def update_state
		self.reset

		if @model['version'] =~ /^1\..+$/ and version != 1
			self.extend(Hadoop1)
		elsif @model['version'] =~ /^2\..+$/ and version != 2
			self.extend(Hadoop2)
		end

		get_state.each { |k,v| @state[k] = v }
	end
end
