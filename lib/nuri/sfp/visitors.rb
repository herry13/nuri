require 'nuri/sfp/ext'

module Nuri
	module Sfp
		class ParentEliminator
			def visit(name, value, ref)
				value.delete('_parent') if value.is_a?(Hash) and value.has_key?('_parent')
				return true
			end
		end
	end
end
