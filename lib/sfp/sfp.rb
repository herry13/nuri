#!/usr/bin/env ruby

require File.dirname(__FILE__) + "/SFPParser"
require File.dirname(__FILE__) + "/SFPLexer"

module Nuri
	class Sfp
		def processFile(file)
			f = File.open(file, 'rb')
			lexer = SFP::Lexer.new(f)
			tokens = ANTLR3::CommonTokenStream.new(lexer)
			@parser = SFP::Parser.new(tokens)
			@parser.sfp
		end

		def process(text)
			lexer = SFP::Lexer.new(text)
			tokens = ANTLR3::CommonTokenStream.new(lexer)
			@parser = SFP::Parser.new(tokens)
			@parser.sfp
		end

		def toContext
			return @parser.context
		end

		def toSas
		end
	end
end
