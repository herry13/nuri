#!/usr/bin/env ruby

cdir = File.dirname(__FILE__)

$: << File.expand_path(cdir + "/../../..")

require 'nuri/sfp/main'

infile = cdir + '/svcref-0.sfp'

sfp = Nuri::Sfp::Parser.new
sfp.parse_file(infile)
sfp.to_sas
sfp.dump
