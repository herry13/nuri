# define main module
module Nuri
	def self.windows?
		platform.include?("mswin")
	end

	def self.platform
		RUBY_PLATFORM.downcase
	end

	def self.home
		Dir.home + '/.nuri'
	end

	def self.init
		### create home directory
		Dir.mkdir(home) if not File.exist?(home)

		### create main configuration file
		File.open(main, 'w') { |f| f.write('') } if not File.exist?(main)

		### create default configuration if it's not exist
		File.open(config_file, 'w') { |f| f.write(YAML.dump(default_config)) } if not File.exist?(config_file)

		### create link to built-in modules directory
		modules_dir = "#{home}/modules"
		system "ln -sf #{File.expand_path(File.dirname(__FILE__) + '/../modules')} #{modules_dir}" if not File.exist?(modules_dir)
	end

	def self.main
		home + '/main.sfp'
	end

	def self.config
		return default_config if not File.exist?(config_file)
		YAML.load(File.read(config_file))
	end

	def self.config_file
		home + '/config.yml'
	end

	def self.default_config
		{
			"editor" => "vim"
		}
	end
end

# external dependencies
require 'rubygems'
require 'json'
require 'sfplanner'
require 'colorize'
require "coderay"
require 'logger'
require 'yaml'

# internal dependencies
libdir = File.dirname(__FILE__) << '/nuri'
['constraint_helper.rb', 'helper.rb', 'orchestrator.rb',
 'choreographer.rb', 'master.rb', 'console.rb'].each do |file|
	require "#{libdir}/#{file}"
end
