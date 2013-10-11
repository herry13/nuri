class Sfp::Module::Package
	include Sfp::Resource

	def update_state
		self.reset

		case @model['type']
		when 'tgz'
			extend TgzPackage
		else
			extend AptPackage
		end

		@state['installed'] = installed?
		@state['version'] = version?

		#@state['installed'] = Sfp::Module::Package.installed?(@model['package_name'])
		#@state['version'] = Sfp::Module::Package.version?(@model['package_name']).to_s
	end

	def self.installed?(package)
		package = package.to_s.strip
		return false if package.length <= 0
		data = `/usr/bin/dpkg-query -W #{package} 2> /dev/null`.strip.chop.split(' ')
		return true if data[0].to_s == package
		false
	end

	def self.version?(package)
		package = package.to_s.strip
		return nil if package.length <= 0
		data = `/usr/bin/dpkg-query -W #{package} 2> /dev/null`.strip.chop.split(' ')
		return data[1] if data[0].to_s == package
		nil
	end

	def self.install(package)
		return false if not package.is_a?(String) or package.length <= 0
		return true if Sfp::Module::Package.installed?(package)
		system("dpkg --configure -a")
		system("apt-get -y --purge autoremove")
		return true if system("apt-get -y install #{package}")
		system("dpkg --configure -a")
		system("apt-get -y update")
		!!system("apt-get -y install #{package}")
	end

	def self.uninstall(package)
		return false if not package.is_a?(String) or package.length <= 0
		return true if not Sfp::Module::Package.installed?(package)
		system("dpkg --configure -a")
		system("apt-get -y --purge autoremove")
		return (!!system("sudo apt-get -y --purge remove #{package}") and
			!!system("sudo apt-get -y --purge autoremove") and
			!!system("sudo apt-get -y --purge autoremove"))
	end

	protected
	module AptPackage
		def installed?
			package = @model['package_name'].to_s.strip
			return false if package.length <= 0
			data = `/usr/bin/dpkg-query -W #{package} 2> /dev/null`.strip.chop.split(' ')
			return true if data[0].to_s == package
			false
		end
	
		def version?
			package = @model['package_name'].to_s.strip
			return nil if package.length <= 0
			installed = `apt-cache policy #{package} | grep Installed`.strip.split(' ', 2)[1].to_s.strip
			return "" if installed.length <= 0
			candidate = `apt-cache policy #{package} | grep Candidate`.strip.split(' ', 2)[1].to_s.strip
			return "latest" if candidate == installed
			installed
		end
	
		def install(p={})
			package = @model['package_name'].to_s.strip
			return false if package.length <= 0
			return true if installed?
			system("dpkg --configure -a && apt-get -y --purge autoremove")
			return true if system("apt-get -y install #{package}")
			!!system("dpkg --configure -a && apt-get -y update && apt-get -y install #{package}")
		end
	
		def uninstall(p={})
			package = @model['package_name'].to_s.strip
			return false if package.length <= 0
			return true if not installed?
			system "dpkg --configure -a && apt-get -y --purge autoremove"
			!!system("sudo apt-get -y --purge remove #{package} &&
			          sudo apt-get -y --purge autoremove &&
			          sudo apt-get -y --purge autoremove")
		end
	end

	module TgzPackage
		def installed?
			::File.exist?(@model['destination'])
		end

		def version?
			file_version = @model['destination'].to_s + "/VERSION"
			(::File.exist?(file_version) ? File.read(file_version).strip : '')
		end

		def install(p={})
			src = @model['source']
			dest = @model['destination']
			system("mkdir -p #{dest}") if !::File.exist?(dest)
			system "cd #{dest} && wget #{src}"
			file = src.split('/').last.to_s
			return false if !::File.exist?("#{@model['destination']}/#{file}")
			system "cd #{dest} && tar xvzf #{file}"
			system "rm -f #{dest}/#{file}"
			basename = (::File.extname(file) == '.gz' ? ::File.basename(file, '.tar.gz') : ::File.basename(file, ::File.extname(file)))
			system "bash -c 'cd #{dest}/#{basename} && shopt -s dotglob && mv * .. && cd .. && rm -rf #{basename}'"
			true
		end

		def uninstall(p={})
			!!system("rm -rf #{@model['destination']}") if File.exist?(@model['destination'])
			true
		end
	end

=begin
	def install(p={})
		Sfp::Module::Package.install(@model['package_name'].to_s.strip)
	end

	def uninstall(p={})
		Sfp::Module::Package.uninstall(@model['package_name'].to_s.strip)
	end
=end
end
