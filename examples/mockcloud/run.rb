#!/usr/bin/env ruby

gen = "./generator.rb"
nuri = "../bin/nuri -u -h -n -p -l -m"
logdir = "mocktest"

Dir.mkdir(logdir) if not File.exist?(logdir)

1.upto(6) do |i|
	logfile = "#{logdir}/mocktest.log.#{i}"
	sfpfile = "mocktest-#{i}.sfp"
	system("#{gen} #{i} > #{sfpfile}")
	print "Processing #{sfpfile}..."
	system("#{nuri} #{sfpfile} 1>#{logfile} 2>#{logfile}")
	system("mv #{sfpfile} #{logdir}")
	puts "[OK]"
end
