#!/usr/bin/env ruby

class Nuri
	def self.platform
		return "ubuntu"
	end
end

require './main.rb'

tomcat = Tomcat6::Main.new
#tomcat.install
#tomcat.uninstall
#tomcat.start
#tomcat.stop
tomcat.setPort(8080)
