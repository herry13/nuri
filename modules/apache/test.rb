#!/usr/bin/env ruby

require File.dirname(__FILE__) + "/../../lib/lib"
require './main.rb'

apache = Nuri::Module::Apache.new
#puts apache.install.to_s
#puts apache.uninstall.to_s
#puts apache.setPort(80).to_s
#puts apache.stop.to_s
#puts apache.start.to_s

puts JSON.generate(apache.getState)
