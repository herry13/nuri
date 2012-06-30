#!/usr/bin/env ruby

require './SFPParser'
require './SFPLexer'

def test(sfp)
	f = File.open(sfp, 'rb')
	lexer = SFP::Lexer.new(f)
	tokens = ANTLR3::CommonTokenStream.new(lexer)
	parser = SFP::Parser.new(tokens)
	parser.sfp
end
test('../../modules/node/node.sfp')
test('../../modules/apache/apache.sfp')
test('../../modules/mysql/mysql.sfp')
test('../../modules/tomcat6/tomcat6.sfp')
test('../../modules/network/network.sfp')
