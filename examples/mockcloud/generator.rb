#!/usr/bin/env ruby

require 'erb'
require 'ostruct'

class ErbBinding < OpenStruct
	def render(template)
		ERB.new(template).result(binding)
	end
end

if ARGV.length <= 0
	puts "Usage: generator.rb <template-file> [key=value]*"
else
	template = File.read(ARGV.shift)
	data = {}
	ARGV.each do |arg|
		key, value = arg.split('=')
		data[key] = value
	end
	puts ErbBinding.new(data).render(template)
end
