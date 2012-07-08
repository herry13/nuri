#!/usr/bin/env ruby

module Nuri
	module Sfp
		# main class which processes configuration description in SFP language either
		# in file or as a string
		class Main

			# enable this class to process SFP into FDR (SAS+)
			#include Nuri::Sfp::Sas

			def initialize
			end

			# parse SFP file
			def parseFile(file)
				f = File.open(file, 'rb')
				lexer = SFP::Lexer.new(f)
				tokens = ANTLR3::CommonTokenStream.new(lexer)
				@parser = SFP::Parser.new(tokens)
				@parser.sfp
			end

			# parse SFP in a string
			def parse(text)
				lexer = SFP::Lexer.new(text)
				tokens = ANTLR3::CommonTokenStream.new(lexer)
				@parser = SFP::Parser.new(tokens)
				@parser.sfp
			end
	
			# return context representation of SFP description
			def to_context
				return @parser.context
			end
		end
	end
end
