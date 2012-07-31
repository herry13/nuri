#!/usr/bin/env ruby

require './SFPParser'
require './SFPLexer'
require './sfp'

infile = './svcref-1.sfp'

sfp = Nuri::Sfp::Main.new
sfp.parseFile(infile)
#sfp.to_sas
#puts sfp.to_context.inspect
root = sfp.to_context
sfp.dump_json root
