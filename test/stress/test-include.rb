#!/usr/bin/env ruby

$: << File.expand_path(File.dirname(__FILE__) + "/../lib")
$: << File.expand_path(File.dirname(__FILE__) + "/..")

require 'nuri/main'

infile = 'system.sfp'
#infile = 'test.sfp'
sfp = Nuri::Sfp::Parser.file_to_json(infile)
Nuri::Sfp::Parser.dump(sfp)

sfp = Nuri::Sfp::Parser.file_to_json(infile)
Nuri::Sfp::Parser.dump(sfp)
#sfp = Nuri::Sfp::Parser.new
#sfp.parse_file(infile)
#sas = sfp.to_sas
#File.open(outfile, 'w') { |f|
#	f.write(sas)
#}
