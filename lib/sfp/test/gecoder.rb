#!/usr/bin/env ruby

require 'rubygems'
require 'gecoder'

include Gecode::Mixin

x = int_var
(x * 5).must == 25
branch_on x

solve!
puts x.value
