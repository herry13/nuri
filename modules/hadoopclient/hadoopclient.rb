require 'ostruct'

class Sfp::Module::HadoopClient
	include Sfp::Resource

	Services = ['datanode', 'tasktracker']

	def update_state
		self.reset
		@state['installed'] = installed?
		@state['running'] = running?
		@state['pids'] = pids

		# try to restart any stopped daemon
		start if @state['running']
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
		system "mkdir -p #{model.home_dir}" if !::File.exist? model.home_dir
		system "chown -R #{model.user}:#{model.user} #{model.home_dir}"

		system 'apt-get install -y axel'
		downloader = 'axel -q -o' #'wget -O'

		# download and extract hadoop binaries
		log.info "download and install hadoop binaries"
		file = model.source.split('/').last.to_s
		basename = (::File.extname(file) == '.gz' ? ::File.basename(file, '.tar.gz') : ::File.basename(file, ::File.extname(file)))
		system "cd #{model.home_dir} &&
		        #{downloader} #{file} #{model.source} &&
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
		dir = File.expand_path(File.dirname(__FILE__))
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

	protected
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
		Services.each { |name| data[name] = `ps axf | grep java | grep -v grep | grep Dproc_#{name}`.to_s.strip.split(' ', 2)[0].to_i }
		data
	end
end
