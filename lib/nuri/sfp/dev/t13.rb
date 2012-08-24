#!/usr/bin/env ruby

cdir = File.dirname(__FILE__)

$: << File.expand_path(cdir + "/../../..")

require 'nuri/sfp/main'

infile = cdir + '/svcref-1.sfp'
outfile = cdir + '/svcref-1.sas'

sfp = Nuri::Sfp::Parser.new
sfp.parse_file(infile)
sas = sfp.to_sas
File.open(outfile, 'w') { |f|
	f.write(sas)
}
