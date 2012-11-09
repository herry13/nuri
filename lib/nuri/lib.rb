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

		def load(client=true)
			self.read_config
			self.init_secure_connection
			Nuri::Resource.set_root(self.get_main)
			self.load_modules if client
		end

		def init_secure_connection
			if @config.has_key?('secure') and @config['secure']
				priv_key_file = Nuri::Util.home_dir + '/etc/' + @config['private_key']
				raise Exception, 'Private key is not available: ' + priv_key_file if
					not File.exists?(priv_key_file)
				Nuri::SSL.get_private_key(priv_key_file)
			end
		end

		def set_system_information(system)
			@system = system
		end

		def get_main
			begin
				main = 'include "modules/machine/machine.sfp"' + "\n"
				self.get_modules.each do |mod|
					main += "include \"" + Nuri::Util.home_dir + "/modules/#{mod}/#{mod}.sfp\"\n"
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
	end


	class ExecutionFailedException < Exception
	end
end
