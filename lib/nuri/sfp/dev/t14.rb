#!/usr/bin/env ruby

cdir = File.dirname(__FILE__)

$: << File.expand_path(cdir + "/../../../../lib")
$: << File.expand_path(cdir + "/../../../..")

require 'nuri/main'

infile = cdir + '/svcref-1.sfp'
#outfile = cdir + '/svcref-1.sas'

#sfp = Nuri::Sfp::Parser.new
#sfp.parse_file(infile)
#sas = sfp.to_sas
#File.open(outfile, 'w') { |f|
#	f.write(sas)
#}
#puts Nuri::Util.os
#puts Nuri::Util.platform
#puts Nuri::Util.temp_dir

planner = Nuri::Planner::Solver.new
plan = planner.solve_file(infile)
puts (plan != nil ? plan : 'no solution!')
