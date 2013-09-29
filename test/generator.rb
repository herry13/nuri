#!/usr/bin/env ruby

def generate(number_apps)
	header = 'include "../modules/node/node.sfp"
include "../modules/mockcloud/mockcloud.sfp"
include "../modules/vm/vm.sfp"
include "../modules/apache/apache.sfp"
include "../modules/mysql/mysql.sfp"
include "../modules/wordpresscluster/wordpresscluster.sfp"

proxy isa Node {
	sfpAddress is "localhost"
	cloud isa MockCloud
}
'
	vmlb = 'vmlb isa VM {
	apache isa Apache {
		running is true
		is_load_balancer is true
		lb_members is (%members%)
	}
}'
	vmapp = '%vmapp% isa VM {
	apache isa Apache {
		running is true
	}
	wp_web isa WordpressWeb {
		installed is true
		http is %vmapp%.apache
		database is vmdb.wp_db
	}
}'
	vmdb = 'vmdb isa VM {
	mysql isa Mysql {
		running is true
	}
	wp_db isa WordpressDB {
		installed is true
		mysql is vmdb.mysql
	}
}'
	output = ''
	members = ''
	global = "global {\n"
	1.upto(number_apps) do |i|
		name = "vmapp#{i}"
		output += vmapp.gsub(/%vmapp%/, name) + "\n"
		members += "#{name},"
		global += "\tif vmlb.apache.running is true then #{name}.apache.running is true\n"
		global += "\tif #{name}.apache.running is true then vmdb.mysql.running is true\n"
	end
	global += "}\n"
	output = header +
	         vmlb.sub(/%members%/, members.chop) + "\n" +
	         output + vmdb + "\n" + global
	output
end

if $0 == __FILE__
	if ARGV[0] == 'help'
		puts "Usage: generator.rb [total-app-layer]"
	else
		number_apps = (ARGV.length > 0 ? ARGV[0].to_i : 3)
		puts generate(number_apps)
	end
end
