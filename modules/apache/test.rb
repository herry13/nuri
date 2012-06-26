#!/usr/bin/env ruby

require './main.rb'

class Nuri
	def self.platform
		return "ubuntu"
	end
end

apache = Apache::Main.new
apache.setPort(80)
apache.setDocumentRoot('/var/www')
