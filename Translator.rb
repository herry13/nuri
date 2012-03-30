#!/usr/bin/env ruby

require 'SFPParser'
require 'SFPLexer'

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
