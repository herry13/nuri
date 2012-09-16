#!/usr/bin/env ruby

$: << File.expand_path(File.dirname(__FILE__) + "/../lib")
$: << File.expand_path(File.dirname(__FILE__) + "/..")

require "nuri/main"

sfp1 = Nuri::Sfp::Parser.file_to_json('../etc/nuri.sfp')
Nuri::Sfp::Parser.dump(sfp1)

sfp1 = Nuri::Sfp::Parser.file_to_json('../etc/nuri.sfp')
Nuri::Sfp::Parser.dump(sfp1)

sfp2 = Nuri::Sfp::Parser.file_to_json('../etc/main.sfp')
Nuri::Sfp::Parser.dump(sfp2)
