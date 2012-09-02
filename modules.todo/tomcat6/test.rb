#!/usr/bin/env ruby

require File.dirname(__FILE__) + "/../../lib/lib"
require File.dirname(__FILE__) + '/tomcat6.rb'

tomcat = Nuri::Module::Tomcat6.new
#tomcat.install
#tomcat.start

tomcat.stop
tomcat.uninstall

#tomcat.stop
#tomcat.setPort(8080)
#tomcat.start
