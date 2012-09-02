#!/usr/bin/env ruby

class Nuri
	def self.platform
		return "sl"
	end
end

require './main.rb'

mysql = Mysql::Main.new
mysql.install
mysql.start
#mysql.stop
#mysql.uninstall
puts mysql.setPort(3306).to_s
mysql.setRootPassword("mysql")
