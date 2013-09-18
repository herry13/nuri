#!/usr/bin/env ruby

gen = "./generator.rb"
nuri = "../bin/nuri -u -h -n -p -l -m"

6.upto(8) do |i|
	logfile = "mocktest.log.#{i}"
	system("#{gen} #{i} > mocktest.sfp")
	system("#{nuri} mocktest.sfp 1>#{logfile} 2>#{logfile}")
end
