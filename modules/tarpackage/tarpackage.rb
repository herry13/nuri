class Sfp::Module::TarPackage
	include Sfp::Resource

	Signature = '.tarpackage.log'

	def update_state
		self.reset

		@state['installed'] = installed?
		@state['version'] = version?
	end

	##############################
	#
	# Action methods (see TarPackage.sfp)
	#
	##############################

	def install(p={})
		src = url
		dest = target
		return false if dest.length <= 0

		# create destination directory if not exist
		system "mkdir -p #{dest}" if !::File.exist?(dest)

		# install axel if it's not available
		system "apt-get install axel" if `which axel`.strip.length <= 0

		# download the file
		system "cd #{dest} && axel -q #{src}"

		file = src.split('/').last.to_s
		# if downloaded file is not exist, then return false
		return false if !::File.exist?("#{@model['destination']}/#{file}")

		# extract tar file, and then delete it
		system "cd #{dest} && tar xvzf #{file}"
		system "rm -f #{dest}/#{file}"

		basename = (::File.extname(file) == '.gz' ? ::File.basename(file, '.tar.gz') : ::File.basename(file, ::File.extname(file)))
		system "bash -c 'cd #{dest}/#{basename} && shopt -s dotglob && mv -f * .. && cd .. && rm -rf #{basename}'"

		File.open("#{dest}/#{Signature}", 'w') { |f| f.write(Time.now.to_s) }

		true
	end

	def uninstall(p={})
		!!system("rm -rf #{@model['destination']}") if File.exist?(@model['destination'])
		true
	end

	##############################
	#
	# Helper methods
	#
	##############################

	protected
	def installed?
		::File.exist?("#{@model['destination']}/#{Signature}")
	end

	def version?
		if @model['version'].length > 0
			@model['version']
		else
			file_version = @model['destination'].to_s + "/VERSION"
			(::File.exist?(file_version) ? File.read(file_version).strip : '')
		end
	end

	def url
		name = @model['package_name'].to_s.strip
		version = @model['version'].to_s.strip
		src = @model['source'].to_s.strip

		if name.length > 0 and version.length > 0
			"#{src}/#{name}-#{version}/#{name}-#{version}.tar.gz"
		else
			src
		end
	end

	def target
		@model['destination'].to_s.strip
	end
end
