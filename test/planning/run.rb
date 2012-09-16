#!/usr/bin/ruby

$: << File.expand_path(File.dirname(__FILE__) + "/../../lib")

require "nuri/planner/main"

def solve
	planner = Nuri::Planner::Solver.new
	counter = 0
	begin
		Dir.foreach('.') do |f|
			next if not File.file?(f) or not (f.to_s =~ /.*-p.*\.sfp/)
			plan = planner.solve_file(f.to_s)
			puts f + ': ' + (plan != nil).to_s
		end
		puts "=== cylce #" + counter.to_s
		counter += 1
		sleep(2)
	end while true
end

t1 = Thread.new {
	solve()
}
t2 = Thread.new {
	solve()
}
t1.join
t2.join
