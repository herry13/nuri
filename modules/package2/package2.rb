require 'thread'

class Sfp::Module::Package2
	include Sfp::Resource

	def update_state
		provider = @model['provider'].strip
		if provider != self.provider
			case provider
			when 'apt'
				self.extend(AptPackage)
			when 'tar'
				self.extend(TarPackage)
			else
				self.extend(GenericPackage)
			end
		end

		get_state
	end

	def provider
		nil
	end

	module GenericPackage
		def provider
			nil
		end

		def get_state
		end

		def install(p={})
			false
		end

		def uninstall(p={})
			false
		end
	end

	module TarPackage
		def provider
			'tar'
		end

		def get_state
			to_model
			@state['installed'] = installed?
			@state['version'] = version?
			@state['home'] = (@state['installed'] ? @model['home'] : '')
		end

		def install(p={})
			home = @model['home'].strip
			return false if home.length <= 0
	
			# create home directory if not exist
			shell "rm -rf #{home} && mkdir -p #{home}" if not ::File.directory?(home)
			if not ::File.directory?(home)
				log.info "Target directory #{home} cannot be created."
				return false
			end

			file = url.split('/').last
			dest = "#{home}/#{file}"
			download(url, dest)
	
			# if downloaded file is not exist, then return false
			if not ::File.exist?(dest)
				log.error "Failed to download file from #{url}"
				return false
			end
	
			# extract tar file, and then delete it
			shell "cd #{home} && tar xvzf #{file} && rm -f #{file}"
	
			basename = case ::File.extname(file)
			when '.gz'
				::File.basename(file, '.tar.gz')
			when '.tgz'
				::File.basename(file, '.tgz')
			else
				file
			end
	
			shell "bash -c 'cd #{home}/#{basename} && shopt -s dotglob && mv -f * .. && cd .. && rm -rf #{basename}'"
	
			File.open("#{home}/#{signature}", 'w') { |f| f.write(Time.now.to_s) }

			if not ::File.exist?(version_file)
				File.open(version_file, 'w') { |f| f.write(@model['version']) }
			end

			installed?
		end

		def uninstall(p={})
			shell "rm -rf #{@model['home']}" if ::File.exist?(@model['home'])
			not installed?
		end

		def installed?
			::File.file?("#{@model['home']}/#{signature}")
		end

		def version?
			if ::File.file?(version_file)
				File.read(version_file).strip
			else
				''
			end
		end

		def version_file
			"#{@model['home']}/VERSION"
		end

		def signature
			".nuri.package"
		end

		def url
			"#{@model['source']}/#{@model['name']}-#{@model['version']}.tar.gz"
		end
	end

	module AptPackage
		def provider
			'apt'
		end

		def get_state
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
	
		def installed?(p={})
			name = (p.has_key?(:name) ? p[:name] : @model['name'].to_s.strip)
			if name.length > 0
				data = `/usr/bin/dpkg-query -W #{name} 2>/dev/null`.strip.chop.split(' ')
				(data[0].to_s == name)
			else
				false
			end
		end
	
		def version?(p={})
			name = (p.has_key?(:name) ? p[:name] : @model['name'].to_s.strip)
			if name.length > 0
				data = `/usr/bin/dpkg-query -W #{name} 2>/dev/null`.strip.chop.split(' ')
				(data[0].to_s == name ? data[1] : "")
			else
				""
			end
		end
	
		def install(p={})
			return false if not repo_installed?
	
			name = @model['name'].to_s.strip
			if name.length <= 0
				false
			elsif installed?
				true
			else
				shell "dpkg --configure -a; apt-get -y --purge autoremove"
				if not shell "apt-get -y install #{name}"
					shell "dpkg --configure -a; apt-get -y update && apt-get -y install #{name}"
				end
				installed?
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
				not installed?
			end
		end
	
		##############################
		#
		# Helper methods
		#
		##############################
	
		def repo_installed?
			if @model['provider'] == 'apt'
				case @model['source'].strip
				when 'default', ''
					true
				else
					apt_repo_installed?
				end
			else
				true
			end
		end
	
		def apt_repo_installed?
			type, _ = @model['source'].split(':')
			if type == 'ppa'
				repos = `/bin/bash #{File.dirname(__FILE__)}/apt-repo-list.sh`.strip.split("\n")
				if not repos.include?(@model['source'])
					log.info "Missing APT repository: #{@model['source']}"
					if not installed?({:name => 'python-software-properties'})
						shell "apt-get install -y python-software-properties"
					end
					log.info "Adding APT repository: #{@model['source']}"
					shell "add-apt-repository #{model['source']} && apt-get update"
				else
					false
				end
			else
				false
			end
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
