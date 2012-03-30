#!/usr/bin/env ruby

require 'SFPParser'
require 'SFPLexer'
require 'Translator'
require 'Reference'

sfpfile = 'problem2.sfp'

translator = Sfplanner::Lang::Translator.new
context = translator.sfpToContext(sfpfile)
puts context.to_sfp(1)
