require 'thread'

class Sfp::Module::Package
	include Sfp::Resource

	@@mutex = Mutex.new

	def update_state
		self.reset
		if @model.is_a?(Hash)
			@state['installed'] = Sfp::Module::Package.installed?(@model['package_name'])
			@state['version'] = Sfp::Module::Package.version?(@model['package_name']).to_s
		end
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

	def install(p={})
		Sfp::Module::Package.install(@model['package_name'].to_s.strip)
	end

	def uninstall(p={})
		Sfp::Module::Package.uninstall(@model['package_name'].to_s.strip)
	end
end
