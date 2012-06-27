#!/usr/bin/env ruby

class Nuri
	def self.platform
		return "sl"
	end
end

require './main.rb'

apache = Apache::Main.new
#puts apache.install.to_s
#puts apache.uninstall.to_s
puts apache.setPort(80).to_s
puts apache.stop.to_s
puts apache.start.to_s
