#!/usr/bin/env ruby

require './main.rb'

apache = Apache::Main.new
apache.setPort(80)
apache.setDocumentRoot('/var/www')
