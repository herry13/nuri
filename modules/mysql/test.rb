#!/usr/bin/env ruby

class Nuri
	def self.platform
		return "ubuntu"
	end
end

require './main.rb'

mysql = Mysql::Main.new
#mysql.install
#mysql.uninstall
puts mysql.setPort(3308).to_s
