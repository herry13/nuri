module Nuri
	# An object of this class will be returned as the value of a non-exist variable
	class Undefined
		attr_accessor :path
		def initialize(path=nil); @path = path; end
		def to_s; (@path.nil? ? "<sfp::undefined>" : "<sfp::undefined[#{@path}]>"); end
	end

	class Unknown
		attr_accessor :path
		def initialize(path=nil); @path = path; end
		def to_s; (@path.nil? ? "<sfp::unknown>" : "<sfp::unknown[#{@path}]>"); end
	end
end

# return a fullpath of reference of this context
Hash.send(:define_method, "ref") {
	return '$' if not self.has_key?('_parent') or self['_parent'] == nil
	me = (self.has_key?('_self') ? self['_self'] : '')
	return self['_parent'].ref + "." + me
}

# accept method as implementation of Visitor pattern
Hash.send(:define_method, "accept") { |visitor|
	keys = self.keys
	keys.each do |key|
		next if key == '_parent' or not self.has_key?(key)
		value = self[key]
		go_next = visitor.visit(key, value, self)
		value.accept(visitor) if value.is_a?(Hash) and go_next == true
	end

#	self.each_pair { |key,value|
#		next if key == '_parent'
#		go_next = visitor.visit(key, value, self)
#puts value.class.to_s + ' >> ' + visitor.class.to_s
#		value.accept(visitor) if value.is_a?(Hash) and go_next == true
#	}
}

# resolve a reference, return nil if there's no value with given address
Hash.send(:define_method, "at?") { |addr|
	#return nil if not addr.is_a?(String)
	#return Nuri::Undefined.new if not addr.is_a?(String)
	return Nuri::Unknown.new if not addr.is_a?(String)
	addrs = addr.split('.', 2)

	if addrs[0] == '$'
		return self.root.at?(addrs[1])
	elsif addrs[0] == 'root'
		return self.root.at?(addrs[1])
	elsif addrs[0] == 'this' or addrs[0] == 'self'
		return self.at?(addrs[1])
	elsif addrs[0] == 'parent'
		return nil if not self.has_key?('_parent')
		return self['_parent'] if addrs[1].nil?
		return self['_parent'].at?(addrs[1])
	elsif self.has_key?(addrs[0])
		if addrs.length == 1 
			return self[addrs[0]]
		else
			return self[addrs[0]].at?(addrs[1]) if self[addrs[0]].is_a?(Hash) and addrs[1] != ''
		end
	end

	#return nil
	#return Nuri::Undefined.new
	return Nuri::Unknown.new
}

Hash.send(:define_method, "type?") { |name|
	return nil if not self.has_key?(name)
	value = self[name]
	if value != nil
		return '$.Boolean' if value.is_a?(TrueClass) or value.is_a?(FalseClass)
		return '$.Integer' if value.is_a?(Numeric)
		return '$.String' if value.is_a?(String) and not value.isref
		return value['_isa'] if value.isobject or value.isnull
		return "(#{value['_isa']})" if value.is_a?(Hash) and value.isset and value.has_key?('_isa')
	end

	return nil
}

# return root context of this context
Hash.send(:define_method, "root") {
	return self if not self.has_key?('_parent') or self['_parent'] == nil
	return self['_parent'].root
}

# return true if this context is a constraint, otherwise false
Hash.send(:define_method, "isconstraint") {
	return (self.has_key?('_context') and self['_context'] == 'constraint')
}

Hash.send(:define_method, "isset") {
	return (self.has_key?('_context') and self['_context'] == 'set')
}

Hash.send(:define_method, "isprocedure") {
	return (self.has_key?('_context') and self['_context'] == 'procedure')
}

# return true if this context is a class, otherwise false
Hash.send(:define_method, "isclass") {
	return (self.has_key?('_context') and self['_context'] == 'class')
}

# return superclass' reference if this context is a sub-class, otherwise nil
Hash.send(:define_method, "extends") {
	return self['_extends'] if self.isclass and self.has_key?('_extends')
	return nil
}

# return true if this class has been expanded, otherwise false
Hash.send(:define_method, "expanded") {
	@expanded = false if not defined?(@expanded)
	return @expanded
}

# copy attributes and procedures from superclass to itself
Hash.send(:define_method, 'inherits') { |parent|
	return if not parent.is_a?(Hash)
	parent.each_pair { |key,value|
		next if key[0,1] == '_' or self.has_key?(key)
		if value.is_a?(Hash)
			self[key] = Nuri::Sfp.deep_clone(value)
			self[key]['_parent'] = self
		else
			self[key] = value
		end
	}
	@expanded = true
}

# return true if this context is an object, otherwise false
Hash.send(:define_method, 'isobject') {
	return (self.has_key?('_context') and self['_context'] == 'object')
}

Hash.send(:define_method, 'isa') {
	return nil if not self.isobject or not self.has_key?('_isa')
	return self['_isa']
}

Hash.send(:define_method, 'isvalue') {
	return self.isobject
}

Hash.send(:define_method, 'isnull') {
	return (self.has_key?('_context') and self['_context'] == 'null')
}

Hash.send(:define_method, 'iseither') {
	return (self['_context'] == 'either')
}

Hash.send(:define_method, 'tostring') {
	return 'null' if self.isnull
	return self.ref
}

# add path to the end of a reference 
String.send(:define_method, "push") { |value|
	return self.to_s + "." + value
}

# return first element and keep the rest
String.send(:define_method, 'explode') {
	return self.split('.', 2)
}

# return an array of [ parent, last_element]
String.send(:define_method, 'pop_ref') {
	return self.extract
}

# return an array of [ parent, last_element ]
String.send(:define_method, 'extract') {
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
	return true if (s.length > 0 and s[0,1] == '$')
	return false
}

#String.send(:define_method, 'as_ref') { |val|
#	@isa_ref = val
#}

# return the parent of this path
# e.g.: if self == 'a.b.c.d', it will return 'a.b.c'
String.send(:define_method, 'to_top') {
	return self if self == '$'
	parts = self.split('.')
	return self[0, self.length - parts[parts.length-1].length - 1]
}
