#!/usr/bin/env ruby

require File.dirname(__FILE__) + "/SFPParser"
require File.dirname(__FILE__) + "/SFPLexer"

module Nuri
	class Sfp
		def loadFile(file)
			f = File.open(file, 'rb')
			lexer = SFP::Lexer.new(f)
			tokens = ANTLR3::CommonTokenStream.new(lexer)
			@parser = SFP::Parser.new(tokens)
			@parser.sfp
		end

		def load(text)
		end

		def toContext
			return @parser.context
		end

		def toSas
		end
	end
end
