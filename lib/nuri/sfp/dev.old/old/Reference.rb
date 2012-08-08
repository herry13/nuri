#!/usr/bin/env ruby

module Sfplanner
	module Lang
			PREFIX = '$'
			ROOT = "root"
			PARENT = "parent"
	
		class Reference
			attr_accessor :path
			
			def initialize(path='')
				if path == nil
					path = ''
				else
					@path = path.sub(/^\$/, '')
				end
			end

			def total_parts
				parts = path.split('.')
				return parts.length
			end

			def strip_prefix_root
				path = @path.sub(/^\$?root\.?/, '')
				return Reference.new(path)
			end

			def append(val)
				if val.is_a?(String)
					ref = self.clone
					ref.path = @path + '.' + val
					return ref
				elsif val.is_a?(Reference)
					ref = self.clone
					ref.path = @path + '.' + val.path
					return ref
				end
				return nil
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
				return '$' + @path
			end

			def to_json
			end

			def to_s
				return to_sfp
			end
		end
	end
end
