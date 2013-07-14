# external dependencies
require 'rubygems'
require 'json'
require 'sfplanner'
require 'colorize'

# define main module
module Nuri
end

# internal dependencies
libdir = File.expand_path(File.dirname(__FILE__))
require libdir + '/nuri/net_helper.rb'
require libdir + '/nuri/master.rb'
