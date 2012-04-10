#!/usr/bin/env ruby

require 'SFPParser'
require 'SFPLexer'
require 'Translator'
require 'Reference'
require 'ContextToSAS'

#sfpfile = 'problem.sfp'
#sfpfile = 'problem3.sfp'
#sfpfile = 'problem4.sfp'
#sfpfile = 'class.inc'
sfpfile = 'usecase11.sfp'

translator = Sfplanner::Lang::Translator.new
context = translator.sfpToContext(sfpfile)
puts context.to_sfp

csas = Sfplanner::Planner::ContextToSAS.new(context)
puts csas.sas

ref = Sfplanner::Lang::Reference.new('$init.machine1.parent.machine2.hasService')
#puts context.get(ref)
