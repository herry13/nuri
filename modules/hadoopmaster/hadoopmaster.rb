class Sfp::Module::HadoopMaster
	include Sfp::Resource

	def update_state
		self.reset
		@state['installed'] = installed?
		@state['running'] = running?
	end

	def install(p={})
		# add group hadoop
		if `grep '^#{@model['user']}' /etc/group`.length <= 0
			Sfp::Agent.logger.info "adding group #{@model['user']}"
			system "echo '#{@model['user']}:x:8000:' >> /etc/group"
		else
			Sfp::Agent.logger.info "group #{@model['user']} is already exist"
		end

		# add user hadoop
		if `grep '^#{@model['user']}' /etc/passwd`.length <= 0
			Sfp::Agent.logger.info "adding user #{@model['user']}"
			system "echo '#{@model['user']}:x:8000:8000::#{@model['home_dir']}:/bin/bash' >> /etc/passwd &&
			        echo '#{@model['user']}:#{@model['password']}:15958:0:99999:7:::' >> /etc/shadow"
		else
			Sfp::Agent.logger.info "user #{@model['user']} is already exist"
		end

		# create home_dir
		Sfp::Agent.logger.info "create hadoop home directory: #{@model['home_dir']}"
		system "mkdir -p #{@model['home_dir']}" if !::File.exist? @model['home_dir']
		system "chown -R hadoop:hadoop #{@model['home_dir']}"

		# download and extract hadoop binaries
		Sfp::Agent.logger.info "download and install hadoop binaries"
		tmp_file = "hadoop.tar.gz"
		system "cd #{@model['home_dir']} &&
              wget -O #{tmp_file} #{model['source_url']}/hadoop-#{@model['version']}.tar.gz &&
              tar xvzf #{tmp_file} && rm -f #{tmp_file} &&
              mv hadoop-#{@model['version']}/* . && rm -rf hadoop-#{@model['version']}"

		# download other files
		Sfp::Agent.logger.info "download and install additional files"
		['hadoop-env.sh', 'core-site.xml', 'mapred-site.xml', 'hdfs-site.xml'].each do |file|
			system "wget -O #{@model['home_dir']}/conf/#{file} #{@model['source_url']}/#{file}"
		end
		system "wget -O #{@model['home_dir']}/bin/masterScript.sh #{@model['source_url']}/masterScript.sh &&
              chmod +x #{@model['home_dir']}/bin/masterScript.sh"
		system "chown -R hadoop:hadoop #{@model['home_dir']}"

		map = {
			'user' => @model['user'],
			'hostname' => 'localhost', #resolve('$.parent.sfpAddress'),
			'java_home' => @model['java_home']
		}
		Sfp::Agent.logger.info "render template configuration files: core-site.xml, hadoop-env.sh, mapred-site.xml"
		renderer = Sfp::TemplateEngine.new(map)
		['core-site.xml', 'hadoop-env.sh', 'mapred-site.xml'].each do |file|
			renderer.render_file("#{@model['home_dir']}/conf/#{file}")
		end

		# format namenode space
		Sfp::Agent.logger.info "format namenode space"
		system "su -c '#{@model['home_dir']}/bin/hadoop namenode -format' hadoop"

		# export hadoop home to root
		Sfp::Agent.logger.info "export hadoop home directory to root"
		system "sed -i '/^export HADOOP_HOME/d' /root/.bashrc"
		system "echo 'export HADOOP_HOME=#{@model['home_dir']}' >> /root/.bashrc"

		if !::File.exist?(@model['scratch_dir']) && !system("mkdir -p #{@model['scratch_dir']}")
			Sfp::Agent.logger.info "create scratch directory: #{@model['scratch_dir']}"
			system "mkdir #{@model['scratch_dir']} && chown -R #{@model['user']}:#{@model['user']} #{@model['scratch_dir']}"
		else
			Sfp::Agent.logger.info "cannot create scratch directory: #{@model['scratch_dir']}"
		end

		true
	end

	def uninstall(p={})
		# remove hadoop user and group, and then delete hadoop's home directory
		system "sed -i '/^export HADOOP_HOME/d' /root/.bash_profile"
		!!system("sed -i '/^#{@model['user']}/d' /etc/passwd &&
                sed -i '/^#{@model['user']}/d' /etc/shadow &&
                sed -i '/^#{@model['user']}/d' /etc/group &&
                rm -rf #{@model['home_dir']} &&
		          rm -rf /tmp/#{@model['user']} &&
		          rm -rf #{@model['scratch_dir']}")
	end

	def start(p={})
	end

	def stop(p={})
	end

	protected
	def installed?
		['conf/hadoop-env.sh', 'conf/core-site.xml', 'conf/mapred-site.xml', 'conf/hdfs-site.xml', 'bin/masterScript.sh'].each { |file|
			return false if !::File.exist?("#{@model['home_dir']}/#{file}")
		}
		true
	end

	def running?
		false
	end
end
