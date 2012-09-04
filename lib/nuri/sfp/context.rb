class Context < Hash
	def initialize(map=nil)
		map.each { |k,v| self[k] = v } if map.is_a?(Hash)
	end

	def ref
		return '$' if not self.has_key?('_parent') or self['_parent'] == nil
		me = (self.has_key?('_self') ? self['_self'] : '')
		return self['_parent'].ref + "." + me
	end

	# accept method as implementation of Visitor pattern
	def accept(visitor)
		self.each_pair do |key,value|
			next if key == '_parent'
			go_next = visitor.visit(key, value, self)
			value.accept(visitor) if value.is_a?(Hash) and go_next == true
		end
	end

	# resolve a reference, return nil if there's no value with given address
	def at?(addr)
		return nil if not addr.is_a?(String)
		addrs = addr.split('.', 2)
		if addrs[0] == '$'
			return self.root.at?(addrs[1])
		elsif self.has_key?(addrs[0])
			if addrs.length == 1 
				return self[addrs[0]]
			else
				return self[addrs[0]].at?(addrs[1]) if self[addrs[0]].is_a?(Hash) and addrs[1] != ''
			end
		end
		return nil
	end

	# return root context of this context
	def root
		return self if not self.has_key?('_parent') or self['_parent'] == nil
		return self['_parent'].root
	end

	# return true if this context is a constraint, otherwise false
	def isconstraint
		return (self.has_key?('_context') and self['_context'] == 'constraint')
	end

	def isprocedure
		return (self.has_key?('_context') and self['_context'] == 'procedure')
	end

	# return true if this context is a class, otherwise false
	def isclass
		return (self.has_key?('_context') and self['_context'] == 'class')
	end

	# return superclass' reference if this context is a sub-class, otherwise nil
	def extends
		return self['_extends'] if self.isclass and self.has_key?('_extends')
		return nil
	end

	# return true if this class has been expanded, otherwise false
	def expanded
		@expanded = false if not defined?(@expanded)
		return @expanded
	end

	# copy attributes and procedures from superclass to itself
	def inherits(parent)
		parent.each_pair do |key,value|
			next if key[0,1] == '_' or self.has_key?(key)
			if value.is_a?(Hash)
				self[key] = Nuri::Sfp.deep_clone(value) #value.clone
				self[key]['_parent'] = self
			else
				self[key] = value
			end
		end
		@expanded = true
	end

	# return true if this context is an object, otherwise false
	def isobject
		return (self.has_key?('_context') and self['_context'] == 'object')
	end

	def isa
		return nil if not self.isobject or not self.has_key?('_isa')
		return self['_isa']
	end

	def isvalue
		return self.isobject
	end

	def isnull
		return (self.has_key?('_context') and self['_context'] == 'null')
	end

	def tostring
		return 'null' if self.isnull
		return self.ref
	end
end


# add path to the end of a reference 
String.send(:define_method, "push") { |value|
	return self.to_s + "." + value
}

# return first element and keep the rest
String.send(:define_method, 'explode') {
	return self.split('.', 2)
}

String.send(:define_method, 'pop_ref') {
	return self if not self.isref
	parts = self.split('.')
	return self if parts.length <= 1
	last = parts[ parts.length - 1 ]
	len = self.length - last.length - 1
	return [self[0, len], last]
}

# return true if this string is a reference, otherwise false
String.send(:define_method, 'isref') {
	s = self.to_s
	return (s.length > 0 and s[0,1] == '$')
}
