#!/usr/bin/ruby

$: << File.expand_path(File.dirname(__FILE__) + "/../../lib")
$: << File.expand_path(File.dirname(__FILE__) + "/../..")

require "nuri/main"

planner = Nuri::Planner::Solver.new
Dir.foreach('.') do |f|
	next if not File.file?(f) or not (f.to_s =~ /.*-p.*\.sfp/)
	plan = planner.solve_file(f.to_s)
	puts f, plan
end
