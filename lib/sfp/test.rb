#!/usr/bin/env ruby

require './SFPParser'
require './SFPLexer'
require './sfp'

infile = '../../modules/node/node.sfp'
#infile = '../../modules/apache/apache.sfp'
#infile = '../../modules/mysql/mysql.sfp'
#infile = '../../modules/tomcat6/tomcat6.sfp'
#infile = '../../modules/network/network.sfp'
infile = './svcref-0.sfp'

sfp = Nuri::Sfp.new
sfp.processFile(infile)
puts sfp.toContext.inspect

#f = File.new(infile)
#sfp.process(f.read)
#puts sfp.toContext.inspect
