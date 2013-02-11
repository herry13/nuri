#!/usr/bin/env ruby

# RubyGem libraries
require 'rubygems'
require 'logger'
require 'json'
require 'uri'
# Nuri libraries
require 'nuri/util'
require 'nuri/resource'
require 'nuri/undefined'
require 'nuri/sfp/main'
require 'nuri/planner/main'
require 'nuri/ssl'
# Nuri modules
require 'modules/machine/machine'
require 'modules/vm/vm'

module Nuri
	module Config
		attr_reader :config, :root, :system

		AbstractModules = ['machine', 'vm', 'cloud']
		MainComponent = '$.Machine'
		DefaultReadTimeout = 1800 # 30 mins

		def load(client=true)
			self.read_config if client
			Nuri::Resource.set_root(self.get_main)
			self.load_modules #if client
		end

		def set_system_information(system)
			@system = system
		end

		def get_main
			begin
				mainfile = "/etc/nuri/main.sfp"
				mainfile = Nuri::Util.home_dir + "/etc/main.sfp" if not File.exist?(mainfile)
				return self.parse_main_file(mainfile)
			rescue Exception => exp
				Nuri::Util.error "Cannot load main description" + " -- " + exp.to_s
				Nuri::Util.error exp.backtrace.to_s
			rescue StandardError => stderr
				Nuri::Util.error "Cannot load main description"
			end
			nil
		end

		def parse_main_file(mainfile)
			Dir.chdir(Nuri::Util.home_dir)
			main = "include \"#{Nuri::Util.home_dir}/modules/machine/machine.sfp\"\n"
			self.get_modules.each do |mod|
				main += "include \"#{Nuri::Util.home_dir}/modules/#{mod}/#{mod}.sfp\"\n"
			end
			main += "\n" + File.read(mainfile) if File.exist?(mainfile)
			return Nuri::Sfp::Parser.to_sfp(main)
		end

		# Reads configuration file in '/etc/nuri/nuri.sfp'. If it does not
		# exist then it tries to read '<HOME>/etc/nuri.sfp'.
		def read_config
			begin
				Nuri::Util.log 'Read configuration file...'
				cfile = '/etc/nuri/nuri.sfp'
				cfile = Nuri::Util.home_dir + "/etc/nuri.sfp" if not File.file?(cfile)
				@config = Nuri::Sfp::Parser.file_to_sfp(cfile)['nuri']

				# Set the read timeout
				@read_timeout = (@config.has_key?('read_timeout') ?
				                 @config['read_timeout'].to_i : DefaultReadTimeout)

				# Set the timeout of the solver to solve a task
				if @config.has_key?('solver_timeout')
					Nuri::Planner::Solver.set_timeout(@config['solver_timeout'].to_i)
				end

				# Set the max-memory that can be consumed by the solver (in K)
				if @config.has_key?('solver_max_memory')
					Nuri::Planner::Solver.set_max_memory(@config['solver_max_memory'].to_i)
				end

				Nuri::Util.log 'Successfully load configuration file ' + cfile
			rescue Exception => exp
				Nuri::Util.error "Cannot load configuration file " + cfile + ' -- ' + exp.to_s
				$stderr.puts 'Cannot load configuration file ' + cfile
				exit
			rescue StandardError => stderr
				Nuri::Util.error "Cannot load configuration file " + cfile
				$stderr.puts 'Cannot load configuration file ' + cfile
				exit
			end
		end

		def get_non_abstract_modules
			modules = self.get_modules
			modules_dir = Nuri::Util.home_dir + "/modules"
			modules.delete_if do |mod|
				ruby = "#{modules_dir}/#{mod}/#{mod}.rb"
				manifest = "#{modules_dir}/#{mod}/main.mf"
				not (File.exist?(ruby) and File.exist?(manifest))
			end
			return modules
		end

		def get_modules
			modules_dir = Nuri::Util.home_dir + "/modules"
			modules = Array.new
			Dir.foreach(modules_dir) do |mod|
				next if mod[0,1] == '.'
				path = modules_dir + "/" + mod
				modules << mod if File.directory?(path) and
						File.file?(path + "/" + mod + ".sfp")
			end
			return modules
		end

		# Load all installed modules. A module can only be loaded iff
		# it has three required files:
		# - manifest file: main.mf
		# - sfp file: <module-name>.sfp
		# - ruby file: <module-name>.rb
		def load_modules
			# load installed modules
			Nuri::Util.log "Load modules..."
			modules_dir = Nuri::Util.home_dir + "/modules"

			# create dummy root
			@root = Nuri::Root.new

			# load module "Machine"
			if not @config.nil? and @config['virtual_machine'] != true
				machine = Nuri::Module::Machine.new
			else
				machine = Nuri::Module::VM.new
			end
			@root.add(machine)

			excluded = ((not @config.nil? and @config.is_a?(Hash) and @config.has_key?('excluded_modules')) ?
				@config['excluded_modules'] : [])
			# load other modules and put them as machine's children
			self.get_non_abstract_modules.each do |mod|
				next if not excluded.index(mod).nil?

				begin
					manifest_file = "#{modules_dir}/#{mod}/main.mf"
					sfp_file = "#{modules_dir}/#{mod}/#{mod}.sfp"
					ruby_file = "#{modules_dir}/#{mod}/#{mod}.rb"
					next if not File.exist?(manifest_file) or
					        not File.exist?(sfp_file) or
					        not File.exist?(ruby_file)

					# read module manifest file (main.mf)
					manifest = self.parse_module_manifest(manifest_file)
					next if manifest['main-class'].to_s.strip == ''

					# load the module based on information in the manifest file
					require 'modules/' + mod + '/' + mod
					m = eval("#{manifest['main-class']}.new")
					m.name = mod if m.name == nil or m.name == ''
					machine.add(m) if not m.is_abstract
					Nuri::Util.log "Successfully loaded module " + mod
				rescue Exception => exp
					Nuri::Util.error "Cannot load module " + mod + " -- " + exp.to_s
				end
			end
		end

		def parse_module_manifest(manifest_path)
			manifest = {}
			ckey = nil
			cvalue = ''
			File.open(manifest_path).each { |line|
				key, value = line.chomp.split(':', 2)
				if not key.nil? and not value.nil?
					manifest[ckey] = cvalue.strip if not ckey.nil?
					ckey = key
					cvalue = value
				else not key.nil? and value.nil?
					cvalue += value
				end
			}
			manifest[ckey] = cvalue.strip if not ckey.nil?
			return manifest
		end

		def address?(path)
			part1, part2, _ = path.split('.', 3) # HACK!
			node_name = (part1 == '$' ? part2 : part1)
			system = Nuri::Util.get_system_information
			return (system.has_key?(node_name) ? system[node_name] : nil)
		end

		# @return true if given path is local, otherwise false
		def local?(path)
			address = self.address?(path)
			return (address == Nuri::Util.domainname or address == Nuri::Util.local_ip)
		end
	end

	module Net
		# Request data with GET method
		def get_data(address, port, path, timeout=@read_timeout)
			address = address.to_s
			port = port.to_s
			path = path.to_s
			raise Exception, 'Invalid parameters' if address.length <= 0 or port.length <= 0 or path.length <= 0
			url = URI.parse('http://' + address.to_s + ':' + port.to_s + path.to_s)
			req = Net::HTTP::Get.new(url.path)
			res = Net::HTTP.start(url.host, url.port) { |http| http.read_timeout = timeout; http.request(req) }
			return res.code, res.body
		end

		# Send data with POST method to a remote address in JSON format
		def post_data(address, port, path, data=nil, timeout=@read_timeout)
			address = address.to_s
			port = port.to_s
			path = path.to_s
			raise Exception, 'Invalid parameters' if address.length <= 0 or port.length <= 0 or path.length <= 0

			url = URI.parse('http://' + address.to_s + ':' + port.to_s + path.to_s)
			req = Net::HTTP::Post.new(url.path)
			if URI.respond_to?('encode_www_form')
				data = (data.nil? ? '' : URI.encode_www_form('json' => JSON.generate(data)))
				res = Net::HTTP.start(url.host, url.port) { |http| http.read_timeout = timeout; http.request(req, data) }
			else
				data = (data.nil? ? '' : {'json' => JSON.generate(data)})
				req.set_form_data(data)
				res = Net::HTTP.start(url.host, url.port) { |http| http.read_timeout = timeout; http.request(req) }
			end
			return res.code, res.body
		end

		# Send data with PUT method to a remote address in JSON format
		def put_data(address, port, path, data=nil, timeout=@read_timeout)
			address = address.to_s
			port = port.to_s
			path = path.to_s
			raise Exception, 'Invalid parameters' if address.length <= 0 or port.length <= 0 or path.length <= 0

			url = URI.parse('http://' + address.to_s + ':' + port.to_s + path.to_s)
			req = Net::HTTP::Put.new(url.path)
			if URI.respond_to?('encode_www_form')
				data = (data.nil? ? '' : URI.encode_www_form('json' => JSON.generate(data)))
				res = Net::HTTP.start(url.host, url.port) { |http| http.read_timeout = timeout; http.request(req, data) }
			else
				data = (data.nil? ? '' : {'json' => JSON.generate(data)})
				req.set_form_data(data)
				res = Net::HTTP.start(url.host, url.port) { |http| http.read_timeout = timeout; http.request(req) }
			end
			return res.code, res.body
		end

	end

	class ExecutionFailedException < Exception
	end
end
