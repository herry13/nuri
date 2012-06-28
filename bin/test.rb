#!/usr/bin/env ruby

puts ("/state1" =~ /^\/state\/.*/) != nil
puts ("/state" =~ /^\/state\/.*/) != nil
puts ("/state/" =~ /^\/state\/.*/) != nil
puts ("/state/hpvm1" =~ /^\/state\/.*/) != nil
