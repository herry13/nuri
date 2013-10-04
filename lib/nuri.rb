# external dependencies
require 'rubygems'
require 'json'
require 'sfplanner'
require 'colorize'
require 'logger'

# define main module
module Nuri
end

# internal dependencies
libdir = File.expand_path(File.dirname(__FILE__))
require libdir + '/nuri/constraint_helper.rb'
require libdir + '/nuri/net_helper.rb'
require libdir + '/nuri/orchestrator.rb'
require libdir + '/nuri/choreographer.rb'
require libdir + '/nuri/server.rb'
require libdir + '/nuri/master.rb'
