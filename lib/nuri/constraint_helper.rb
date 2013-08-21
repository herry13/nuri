module Sfp::Helper::Constraint
	def self.equals(value)
		{ '_context' => 'constraint', '_type' => 'equals', '_value' => value }
	end

	def self.and(name)
		{ '_context' => 'constraint', '_type' => 'and', '_self' => name }
	end
end
