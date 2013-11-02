# external dependencies
require 'rubygems'
require 'json'
require 'sfplanner'
require 'colorize'
require "coderay"
require 'logger'
require 'yaml'

# define main module
module Nuri
	def self.windows?
		RUBY_PLATFORM.downcase.include?("mswin")
	end

	def self.home
		Dir.home + '/.nuri'
	end

	def self.init
		Dir.mkdir(home) if not File.exist?(home)
		File.open(main, 'w') { |f| f.write('') } if not File.exist?(main)
		File.open(config_file, 'w') { |f| f.write(YAML.dump(default_config)) } if not File.exist?(config_file)
		srcdir = File.dirname(__FILE__) + '/../modules'
		Dir.foreach(srcdir) { |file|
			next if file == '..' or file == '.' or file[0].to_s == '.' or
			        File.exist?("#{home}/#{file}")
			system "ln -sf #{srcdir}/#{file} #{home}/#{file}"
		}
	end

	def self.main
		home + '/main.sfp'
	end

	def self.config
		return default_config if not File.exist?(config_file)
		YAML.load(File.read(config_file))
	end

	def self.config_file
		home + '/config.yaml'
	end

	def self.default_config
		{
			"editor" => "vim"
		}
	end
end

# internal dependencies
libdir = File.expand_path(File.dirname(__FILE__))
require libdir + '/nuri/constraint_helper.rb'
require libdir + '/nuri/net_helper.rb'
require libdir + '/nuri/orchestrator.rb'
require libdir + '/nuri/choreographer.rb'
#require libdir + '/nuri/server.rb'
require libdir + '/nuri/master.rb'
