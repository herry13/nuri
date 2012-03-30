#!/usr/bin/env ruby

module Sfplanner
	module Lang
		class Reference
			attr_accessor :path
			
			def initialize(path='')
				if path == nil
					raise
				end
				@path = path
			end

			def append(str)
				if str.is_a?(String)
					@path = @path + '.' + str
				end
			end

			def get_next
				parts = @path.split('.', 2)
				return parts[1]
			end

			def get_next_reference
				return Reference.new(get_next)
			end

			def get_parent
				parts = @path.reverse.split('.', 2)
				return parts[1].reverse
			end

			def get_first
				parts = @path.split('.', 2)
				return parts[0]
			end

			def get_first_reference
				return Reference.new(get_first)
			end

			def get_last
				parts = @path.split('.')
				return parts[parts.length-1]
			end

			def get_last_reference
				return Reference.new(get_last)
			end

			def clone
				return Reference.new(@path)
			end

			def to_sfp
				return @path
			end

			def to_json
			end

			def to_s
				return @path
			end
		end
	end
end
