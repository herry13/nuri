#!/usr/bin/env ruby

# RubyGem libraries
require 'rubygems'
require 'logger'
require 'json'
# Nuri libraries
require 'nuri/util'
require 'nuri/resource'
require 'nuri/undefined'
require 'nuri/sfp/main'
require 'nuri/planner/main'
require 'nuri/ssl'
# Nuri modules
require 'modules/machine/machine'

module Nuri
	module Config
		attr_reader :config, :root, :system

		MainComponent = '$.Machine'
		DefaultReadTimeout = 1800 # 30 mins

		def load(client=true)
			self.read_config if client
			Nuri::Resource.set_root(self.get_main)
			self.load_modules if client
		end

		def set_system_information(system)
			@system = system
		end

		def get_main
			begin
				Dir.chdir(Nuri::Util.home_dir)

				main = "include \"#{Nuri::Util.home_dir}/modules/machine/machine.sfp\"\n"
				self.get_modules.each do |mod|
					main += "include \"#{Nuri::Util.home_dir}/modules/#{mod}/#{mod}.sfp\"\n"
				end
				
				# if 'main.sfp' is in 'etc' directory, then load it
				mainfile = "/etc/nuri/main.sfp"
				mainfile = Nuri::Util.home_dir + "/etc/main.sfp" if not File.exist?(mainfile)
				main += "\n" + File.read(mainfile) if File.exist?(mainfile)

				return Nuri::Sfp::Parser.to_sfp(main)

			rescue Exception => exp
				Nuri::Util.log.error "Cannot load main description" + " -- " + exp.to_s
			rescue StandardError => stderr
				Nuri::Util.log.error "Cannot load main description"
			end
			nil
		end

		# Reads configuration file in '/etc/nuri/config.sfp'. If it does not
		# exist then it tries to read '<HOME>/etc/config.sfp'.
		def read_config
			begin
				Nuri::Util.log 'Read configuration file...'
				cfile = '/etc/nuri/nuri.sfp'
				cfile = Nuri::Util.home_dir + "/etc/nuri.sfp" if not File.file?(cfile)
				@config = Nuri::Sfp::Parser.file_to_sfp(cfile)['nuri']

				@read_timeout = (@config.has_key?('read_timeout') ?
				                 @config['read_timeout'].to_i : DefaultReadTimeout)

				Nuri::Util.log 'Successfully load configuration file ' + cfile
			rescue Exception => exp
				Nuri::Util.log.error "Cannot load configuration file " + cfile + ' -- ' + exp.to_s
				$stderr.puts 'Cannot load configuration file ' + cfile
				exit
			rescue StandardError => stderr
				Nuri::Util.log.error "Cannot load configuration file " + cfile
				$stderr.puts 'Cannot load configuration file ' + cfile
				exit
			end
		end

		def get_modules
			modules_dir = Nuri::Util.home_dir + "/modules"
			modules = Array.new
			Dir.foreach(modules_dir) do |mod|
				next if mod == 'machine' or  mod[0,1] == '.'
				path = modules_dir + "/" + mod
				modules << mod if File.directory?(path) and
						File.file?(path + "/" + mod + ".sfp") and
						File.file?(path + "/" + mod + ".rb")
			end
			return modules
		end

		# Load all installed modules.
		def load_modules
			# load installed modules
			Nuri::Util.log "Load modules..."
			modules_dir = Nuri::Util.home_dir + "/modules"

			# create dummy root
			@root = Nuri::Root.new

			# load module "Machine"
			machine = Nuri::Module::Machine.new
			@root.add(machine)

			# load other modules and put them as machine's children
			self.get_modules.each do |mod|
				begin
					require 'modules/' + mod + '/' + mod
					m = eval("Nuri::Module::" + mod.capitalize + ".new")
					m.name = mod if m.name == nil or m.name == ''
					machine.add(m) if not m.is_abstract
					Nuri::Util.log "Successfully load module " + mod
				rescue Exception => exp
					Nuri::Util.log.error "Cannot load module " + mod + " -- " + exp.to_s
				end
			end
		end

		def get_node(path, root)
			while path != '$'
				path = path.to_top
				n = root.at?(path)
				return n if n != nil and n['_classes'].rindex(MainComponent) != nil
			end
		end

		def domainname?(path)
			part1, part2, _ = path.split('.', 3) # HACK!
			node_name = (part1 == '$' ? part2 : part1)
			system = Nuri::Util.get_system_information
			return (system.has_key?(node_name) ? system[node_name] : nil)
		end

		# @return true if given path is local, otherwise false
		def local?(path)
			domainname = self.domainname?(path)
			return (domainname == Nuri::Util.domainname)
		end

		# Request data with GET method
		def get_data(address, port, path, timeout=@read_timeout)
			url = URI.parse('http://' + address + ':' + port.to_s + path)
			req = Net::HTTP::Get.new(url.path)
			res = Net::HTTP.start(url.host, url.port) { |http| http.read_timeout = timeout; http.request(req) }
			return res.code, res.body
		end

		# Send data with POST method to a remote address in JSON format
		def post_data(address, port, path, data, timeout=@read_timeout)
			url = URI.parse('http://' + address + ':' + port.to_s + path)
			data = "json=" + JSON.generate(data)
			req = Net::HTTP::Post.new(url.path)
			res = Net::HTTP.start(url.host, url.port) { |http| http.read_timeout = timeout; http.request(req, data) }
			return res.code, res.body
		end

		# Send data with PUT method to a remote address in JSON format
		def put_data(address, port, path, data, timeout=@read_timeout)
			url = URI.parse('http://' + address + ':' + port.to_s + path)
			req = Net::HTTP::Put.new(url.path)
			res = Net::HTTP.start(url.host, url.port) { |http| http.read_timeout = timeout; http.request(req, data) }
			return res.code, res.body
		end

	end

	class ExecutionFailedException < Exception
	end
end
