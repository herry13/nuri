class Sfp::Module::AptPackage
	include Sfp::Resource

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
		Sfp::Module::AptPackage.install(@model['package_name'].to_s.strip)
	end

	def uninstall(p={})
		Sfp::Module::AptPackage.uninstall(@model['package_name'].to_s.strip)
	end

	##############################
	#
	# Helper methods
	#
	##############################

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
	def installed?
		Sfp::Module::AptPackage.installed?(@model['package_name'].to_s.strip)
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
end
