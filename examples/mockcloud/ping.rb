#!/usr/bin/env ruby

require 'net/http'
require 'thread'

len = 120

def ping(address, port=1314)
	print "print #{address} "
	url = "http://#{address}:#{port}/sfpstate"
	uri = URI.parse(url)
	http = Net::HTTP.new(uri.host, uri.port)
	http.open_timeout = 2
	http.read_timeout = 5
	begin
		req = Net::HTTP::Get.new(uri.path)
		http.start
		http.request(req) { |res|
			puts "[#{res.code}] [OK]"
		}
	rescue Exception => e
		puts "[Failed] #{e}" #\n#{e.backtrace.join("\n")}"
	end
end

ping('hadoopmaster')
finished = []
(1..len).each do |i|
#	Thread.new {
		host = "hadoopslave#{i}"
		ping(host)
		finished << host
#	}
end

until finished.length >= len do
	sleep 1
end
