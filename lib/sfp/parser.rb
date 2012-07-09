require 'lib/sfp/ext'
require 'lib/sfp/SFPParser'
require 'lib/sfp/SFPLexer'

module Nuri
	module Sfp
		# main class which processes configuration description in SFP language either
		# in file or as a string
		class Parser
			# Parse SFP file and return its JSON representation
			def self.file_to_json(file)
				sfp = Parser.new
				sfp.parse_file(file)
				return sfp.to_json
			end

			# enable this class to process SFP into FDR (SAS+)
			#include Nuri::Sfp::Sas

			def initialize
			end

			# parse SFP file
			def parse_file(file)
				f = File.open(file, 'rb')
				lexer = SFP::Lexer.new(f)
				tokens = ANTLR3::CommonTokenStream.new(lexer)
				@parser = SFP::Parser.new(tokens)
				@parser.rootdir = Nuri::Util.rootdir
				@parser.sfp
			end

			# parse SFP in a string
			def parse(text)
				lexer = SFP::Lexer.new(text)
				tokens = ANTLR3::CommonTokenStream.new(lexer)
				@parser = SFP::Parser.new(tokens)
				@parser.rootdir = Nuri::Util.rootdir
				@parser.sfp
			end
	
			# return JSON representation of SFP description
			def to_json
				return @parser.to_json
			end
		end

		class ParentEliminator
			def visit(name, value, ref)
				value.delete('_parent') if value.is_a?(Hash) and value.has_key?('_parent')
				return true
			end
		end
	end
end
