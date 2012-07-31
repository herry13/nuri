#!/usr/bin/env ruby

require './SFPParser'
require './SFPLexer'
require './sfp'

infile = './svcref-0.sfp'
#infile = './cloud.sfp'

sfp = Nuri::Sfp::Main.new
sfp.parseFile(infile)
#root = sfp.to_context
#puts root.inspect
sfp.to_sas
