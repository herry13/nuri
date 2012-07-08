#!/usr/bin/env ruby

require 'Parameter'

module Sfplanner
  module Planner
    
    class Atom
      attr_accessor :variable, :value

      def initialize(var, val)
        @variable = var
        @value = val
      end

      def to_condition
        return Parameter.new(@variable, @value)
      end

      def to_s
        return variable.name + "=" + value.to_s
      end
    end
    
  end
end