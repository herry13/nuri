#!/usr/bin/env macruby

require './SFPParser'
require './SFPLexer'
require './sfp'

infile = '../../modules/node/node.sfp'
#infile = '../../modules/apache/apache.sfp'
#infile = '../../modules/mysql/mysql.sfp'
#infile = '../../modules/tomcat6/tomcat6.sfp'
#infile = '../../modules/network/network.sfp'
infile = './svcref-0.sfp'

sfp = Nuri::Sfp::Main.new
sfp.parseFile(infile)
#root = sfp.to_context
#puts root.inspect
sfp.to_sas

#visitor = Nuri::Sfp::VariableVisitor.new
#root.accept(visitor)
#visitor = Nuri::Sfp::ClassVisitor.new
#root.accept(visitor)

#f = File.new(infile)
#sfp.process(f.read)
#puts sfp.toContext.inspect
