# external dependencies
require 'rubygems'
require 'json'

# internal dependencies
libdir = File.expand_path(File.dirname(__FILE__))

require libdir + '/ext'
require libdir + '/SFPlibs'
require libdir + '/SFPParser'
require libdir + '/SFPLexer'

require libdir + '/visitors'
require libdir + '/sas_translator'
require libdir + '/parser'

=begin
if $0 == __FILE__
	if ARGV.length > 0
		parser = Nuri::Sfp::Parser.new
		parser.parse_file(ARGV[0])
	else
		puts "Usage: parser.rb <sfp-file>\n\n"
	end
end
=end
