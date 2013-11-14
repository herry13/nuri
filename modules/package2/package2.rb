require 'thread'

class Sfp::Module::Package2
	include Sfp::Resource

	def update_state
		to_model

		@state['installed'] = installed?
		@state['version'] = version?
	end

	##############################
	#
	# Action methods (see Package2.sfp)
	#
	##############################

	@@lock = Mutex.new

	def installed?
		name = @model['name'].to_s.strip
		if name.length > 0
			data = `/usr/bin/dpkg-query -W #{name} 2>/dev/null`.strip.chop.split(' ')
			(data[0].to_s == name)
		else
			false
		end
	end

	def version?
		name = @model['name'].to_s.strip
		if name.length > 0
			data = `/usr/bin/dpkg-query -W #{name} 2>/dev/null`.strip.chop.split(' ')
			(data[0].to_s == name ? data[1] : "")
		else
			""
		end
	end

	def install(p={})
		name = @model['name'].to_s.strip
		if name.length <= 0
			false
		elsif installed?
			true
		else
			shell "dpkg --configure -a; apt-get -y --purge autoremove"
			if shell "apt-get -y install #{name}"
				true
			else
				shell "dpkg --configure -a; apt-get -y update && apt-get -y install #{name}"
			end
		end
	end

	def uninstall(package)
		name = @model['name'].to_s.strip
		if name.length <= 0
			false
		elsif not installed?
			true
		else
			shell "dpkg --configure -a; apt-get -y --purge autoremove"
			shell "apt-get -y --purge remove #{name} && apt-get -y --purge autoremove && apt-get -y --purge autoremove"
		end
	end

=begin
	protected
	def installed?
		Sfp::Module::AptPackage.installed?(@model['package_name'].to_s.strip)
	end

	def version?
		package = @model['package_name'].to_s.strip
		return "" if package.length <= 0
		installed = `apt-cache policy #{package} | grep Installed`.strip.split(' ', 2)[1].to_s.strip
		return "" if installed.length <= 0
		candidate = `apt-cache policy #{package} | grep Candidate`.strip.split(' ', 2)[1].to_s.strip
		return "latest" if candidate == installed
		installed
	end
=end
end
