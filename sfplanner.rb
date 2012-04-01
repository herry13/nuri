#!/usr/bin/env ruby

require 'SFPParser'
require 'SFPLexer'
require 'Translator'
require 'Reference'

#sfpfile = 'problem.sfp'
sfpfile = 'problem3.sfp'
#sfpfile = 'problem4.sfp'
#sfpfile = 'class.inc'

translator = Sfplanner::Lang::Translator.new
context = translator.sfpToContext(sfpfile)
puts context.to_sfp

ref = Sfplanner::Lang::Reference.new('$init.machine1.parent.machine2.hasService')
#puts context.get(ref)