require 'uri'
require 'net/http'

class Sfp::Module::TarPackage
	include Sfp::Resource

	Signature = '.tarpackage.log'

	def update_state
		@state['installed'] = installed?
		@state['version'] = version?
		@state['source'] = @model['source']
		@state['package_name'] = @model['package_name']
		@state['home'] = (@state['installed'] ? @model['home'] : '')
	end

	##############################
	#
	# Action methods (see TarPackage.sfp)
	#
	##############################

	def install(p={})
		return false if home.length <= 0

		# create home directory if not exist
		shell "mkdir -p #{home}" if !::File.exist?(home)

		file = url.split('/').last.to_s
		dest = "#{home}/#{file}"
		download(url, dest)

		# if downloaded file is not exist, then return false
		if !::File.exist?(dest)
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

		File.open("#{home}/#{Signature}", 'w') { |f| f.write(Time.now.to_s) }

		true
	end

	def uninstall(p={})
		!!shell("rm -rf #{home}") if File.exist?(home)
		true
	end

	##############################
	#
	# Helper methods
	#
	##############################

	protected
	def download(source, destination)
		def use_http_proxy?(uri)
			ENV['no_proxy'].to_s.split(',').each { |pattern|
				pattern.chop! if pattern[-1] == '*'
				return false if uri.hist[0, pattern.length] == pattern
			}
			true
		end

		file = nil
		begin
			uri = URI.parse(source)
			http = nil
			if use_http_proxy?(uri)
				proxy = URI.parse(ENV['http_proxy'])
				http = Net::HTTP::Proxy(proxy.host, proxy.port).new(uri.host, uri.port)
			else
				http = Net::HTTP.new(uri.host, uri.port)
			end
			http.request_get(uri.path) do |response|
				file = ::File.open(destination, 'wb')
				response.read_body do |segment|
					file.write segment
				end
				file.flush
			end
		ensure
			file.close if not file.nil?
		end
	end

	def installed?
		::File.exist?("#{home}/#{Signature}")
	end

	def version?
		if @model['version'].length > 0
			@model['version']
		else
			file_version = home + "/VERSION"
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

	def home
		@model['home'].to_s.strip
	end
end
