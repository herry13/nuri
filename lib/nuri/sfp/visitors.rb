module Nuri
	module Sfp
		class ParentEliminator
			def visit(name, value, parent)
				value.delete('_parent') if value.is_a?(Hash) and value.has_key?('_parent')
				return true
			end
		end

		class SfpGenerator
			def initialize(root)
				@root = root
			end

			def visit(name, value, parent)
				if value.is_a?(Hash)
					value['_parent'] = parent
					value['_self'] = name
					value['_context'] = 'object' if not value.has_key?('_context') and
							value.has_key?('_isa')
					Nuri::Sfp::Sfplibs.expand_object(value, @root) if value.isobject
				end
				return true
			end
		end
	end
end
