#!/usr/bin/env ruby

require 'SFPParser'
require 'SFPLexer'

sfp = 'test1.sfp'
f = File.open(sfp, 'rb')
lexer = SFP::Lexer.new(f)
tokens = ANTLR3::CommonTokenStream.new(lexer)
parser = SFP::Parser.new(tokens)
parser.data = ""
parser.sfp
puts parser.data

=begin
module Sfplanner
	module Lang
		class Translator
			def sfpToContext(filepath)
				file = File.open(filepath, "rb")
				return parse(file.read)
			end

			def parse(sfp)
				lexer = SFP::Lexer.new(sfp);
				tokens = ANTLR3::CommonTokenStream.new(lexer)
				parser = SFP::Parser.new(tokens)
				parser.init
				parser.sfp
				return parser.root
			end
		end
	end
end
=end
