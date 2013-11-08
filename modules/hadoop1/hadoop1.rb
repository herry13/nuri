require 'ostruct'

class Sfp::Module::Hadoop1Common
	include Sfp::Resource

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
		shell "rm -f #{model.data_dir} && mkdir -p #{model.data_dir}" if not ::File.directory?(model.data_dir)
		shell "chown -R #{model.user}:#{model.user} #{model.data_dir} && rm -rf #{model.data_dir}/*"

		# download and extract hadoop binaries
		log.info "download and install hadoop binaries"
		source = (model.source[-7,7] == '.tar.gz' or model.source[-4,4] == '.tgz' ? model.source : "#{model.source}/hadoop-#{model.version}/hadoop-#{model.version}.tar.gz")

		file = source.split('/').last.to_s
		basename = (::File.extname(file) == '.gz' ? ::File.basename(file, '.tar.gz') : ::File.basename(file, ::File.extname(file)))
		download source, "#{model.home}/#{file}"
		return false if not ::File.exist?(file)
		shell "cd #{model.home} &&
		       tar xvzf #{file} && rm -f #{file} &&
		       bash -c 'cd #{model.home}/#{basename} && shopt -s dotglob && mv * .. && cd .. && rm -rf #{basename}'"

		# copy and process template configuration files
		log.info "copy and process template configuration files: core-site.xml, hadoop-env.sh, mapred-site.xml"
		dir = File.expand_path(File.dirname(__FILE__))
		['hadoop-env.sh', 'core-site.xml', 'mapred-site.xml', 'hdfs-site.xml'].each do |file|
			copy "#{dir}/#{file}", config_dir
			render_file "#{config_dir}/#{file}", map
		end
		shell "chown -R #{model.user}:#{model.user} #{model.home}"

		# export hadoop home to root
		log.info "export hadoop home directory to root"
		shell "sed -i '/^export HADOOP_HOME/d' /root/.bashrc"
		shell "echo 'export HADOOP_HOME=#{model.home}' >> /root/.bashrc"

		installed?
	end

	def uninstall(p={})
		# remove hadoop user and group, and then delete hadoop's home directory
		shell "sed -i '/^export HADOOP_HOME/d' /root/.bash_profile"
		shell "rm -rf #{@model['home']} &&
		       rm -rf /tmp/#{@model['user']}*"

		not installed?
	end

	def start(p={})
		pids = self.pids
		services.each { |name|
			pid = pids[name]
			if pid <= 0
				cmd = "#{@model['home']}/bin/hadoop-daemon.sh start #{name}"
				log.info `su -c '#{cmd} && sleep 3' #{@model['user']}`
			end
		}

		running?
	end

	def stop(p={})
		pids = self.pids
		services.reverse.each { |name|
			pid = pids[name]
			if pid > 0
				cmd = "#{@model['home']}/bin/hadoop-daemon.sh stop #{name}"
				log.info `su -c '#{cmd}' #{@model['user']}`
			end
		}

		self.pids.each { |name,pid|
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

	def config_dir
		@model['home'] + '/conf'
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
		services.each { |name|
			data[name] = `ps axf | grep java | grep -v grep | grep hadoop | grep Dproc_#{name}`.to_s.strip.split(' ', 2)[0].to_i
		}
		data
	end
end

class Sfp::Module::Hadoop1Master < Sfp::Module::Hadoop1Common

	##############################
	#
	# Action methods (see Hadoop1.sfp)
	#
	##############################

	def install(p={})
		new_data_dir = ::File.directory?(@model['data_dir'])

		super

		if new_data_dir
			# format namenode space
			log.info "format namenode space"
			shell "su -c '#{@model['home']}/bin/hadoop namenode -format' hadoop"
		end

		installed?
	end

	def uninstall(p={})
		super

		shell "rm -rf #{model.data_dir}"

		not installed?
	end

	##############################
	#
	# Helper methods
	#
	##############################

	protected

	def services
		['namenode', 'secondarynamenode', 'jobtracker']
	end


	def map
		{
			'user' => @model['user'],
			'master' => `hostname`.strip,
			'java_home' => java_home,
			'tmp_dir' => @model['data_dir'],
			'replication' => @model['replication'],
		}
	end

	def installed?
		['bin/hadoop', 'conf/hadoop-env.sh', 'conf/core-site.xml', 'conf/mapred-site.xml', 'conf/hdfs-site.xml'].each { |file|
			return false if !::File.exist?("#{@model['home']}/#{file}")
		}
		true
	end
end



class Sfp::Module::Hadoop1Slave < Sfp::Module::Hadoop1Common

	##############################
	#
	# Helper methods
	#
	##############################

	def services
		['datanode', 'tasktracker']
	end

	def map
		{
			'user' => @model['user'],
			'master' => resolve(@model['master'] + '.parent.sfpAddress'),
			'java_home' => java_home,
			'replication' => resolve(@model['master'] + '.replication')
		}
	end

	def installed?
		['bin/hadoop', 'conf/hadoop-env.sh', 'conf/core-site.xml', 'conf/mapred-site.xml', 'conf/hdfs-site.xml'].each { |file|
			return false if !::File.exist?("#{@model['home']}/#{file}")
		}
		true
	end
end
