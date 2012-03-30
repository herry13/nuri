#!/usr/bin/env ruby

require 'net/http'

res = Net::HTTP.get_response(URI('http://localhost/class.inc'))
print res.body
