#!/usr/bin/env ruby

### String additional method for handling Reference
# return true if this string is a reference, otherwise false
String.send(:define_method, "ref?") {
	s = self.to_s
	return (s.length > 0 and s[0,1] == '$')
}

# remove root from a reference
String.send(:define_method, "no_root") {
	return self.to_s.sub(/^\$\.?/, '') if self.ref?
	return self.to_s
}

# add path to the end of a reference 
String.send(:define_method, "push") { |value|
	return self.to_s + "." + value #if self.ref?
	#return self.to_s + value.to_s
}

# return first element and keep the rest
String.send(:define_method, 'explode') {
	return self.split('.', 2)
}

# return type of this value i.e. 'string'
String.send(:define_method, 'isa?') {
	return 'string' if not self.ref?
	return 'reference'
}

String.send(:define_method, 'resolve') { |root|
	return self if not self.ref?
	return root.at?(self)
}

# return true because String is a value
String.send(:define_method, 'isvalue?') { return true }

String.send(:define_method, 'str') { return self.to_s }

# return false because String is not an object
String.send(:define_method, 'isobject?') { return false }
String.send(:define_method, 'null?') { return false }
String.send(:define_method, 'isconstraint?') { return false }
String.send(:define_method, 'isprocedure?') { return false }

### Boolean additional methods
# return type of TrueClass i.e. 'boolean'
TrueClass.send(:define_method, 'isa?') { return 'boolean' }

# return true because TrueClass is a value
TrueClass.send(:define_method, 'isvalue?') { return true }

TrueClass.send(:define_method, 'str') { return self.to_s }

# return false because TrueClass is not an object
TrueClass.send(:define_method, 'isobject?') { return false }
TrueClass.send(:define_method, 'null?') { return false }
TrueClass.send(:define_method, "ref?") { return false }
TrueClass.send(:define_method, 'isconstraint?') { return false }
TrueClass.send(:define_method, 'isprocedure?') { return false }

# return type of FalseClass i.e. 'boolean'
FalseClass.send(:define_method, 'isa?') { return 'boolean' }

# return true because FalseClass is a value
FalseClass.send(:define_method, 'isvalue?') { return true }

FalseClass.send(:define_method, 'str') { return self.to_s }

# return false because FalseClass is not an object
FalseClass.send(:define_method, 'isobject?') { return false }
FalseClass.send(:define_method, 'null?') { return false }
FalseClass.send(:define_method, "ref?") { return false }
FalseClass.send(:define_method, 'isconstraint?') { return false }
FalseClass.send(:define_method, 'isprocedure?') { return false }

### Numeric additional methods
# return type of Numeric i.e. 'number'
Numeric.send(:define_method, 'isa?') { return 'number' }

# return true because Numeric is a value
Numeric.send(:define_method, 'isvalue?') { return true }

Numeric.send(:define_method, 'str') { return self.to_s }

# return false because Numeric is not an object
Numeric.send(:define_method, 'isobject?') { return false }
Numeric.send(:define_method, 'null?') { return false }
Numeric.send(:define_method, "ref?") { return false }
Numeric.send(:define_method, 'isconstraint?') { return false }
Numeric.send(:define_method, 'isprocedure?') { return false }

##### Hash additional methods
# return type of this context object, otherwise return nil
Hash.send(:define_method, 'isa?') {
	return self['_isa'] if self.has_key?('_isa')
	return nil
}

Hash.send(:define_method, 'str') {
	return self.name if self.isvalue?
	return ''
}

Hash.send(:define_method, "ref?") { return false }

# return true if this context is an object, otherwise false
Hash.send(:define_method, 'isvalue?') {
	return (self.isobject? or self.null?)
}

# return true if this context is an object, otherwise false
Hash.send(:define_method, 'isobject?') {
	return (self.has_key?('_context') and self['_context'] == 'object')
}

# return true if this context is a null value, otherwise false
Hash.send(:define_method, 'null?') {
	return (self.has_key?('_context') and self['_context'] == 'null')
}

Hash.send(:define_method, 'to_null') { |isa|
	return nil if not self.isclass?
	return { '_context' => 'null', '_isa' => self.ref }
}

# return the name of this context if this is an object, otherwise nil
Hash.send(:define_method, 'name') {
	return self['_self'] if self.isobject?
	return nil
}

# return true if this context is a class
Hash.send(:define_method, 'isclass?') {
	return (self.has_key?('_context') and self['_context'] == 'class')
}	

Hash.send(:define_method, 'isconstraint?') {
	return (self.has_key?('_context') and self['_context'] == 'constraint')
}

Hash.send(:define_method, 'isprocedure?') {
	return (self.has_key?('_context') and self['_context'] == 'procedure')
}	

# return the superclass' reference if this context class has a superclass
Hash.send(:define_method, 'extends?') { 
	return self['_extends'] if self.isclass? and self.has_key?('_extends')
	return nil
}

# return a fullpath of reference of this context
Hash.send(:define_method, "ref") {
	return '$' if not self.has_key?('_parent') or self['_parent'] == nil
	me = (self.has_key?('_self') ? self['_self'] : '')
	return self['_parent'].ref + "." + me
}

# accept method as implementation of Visitor pattern
Hash.send(:define_method, "accept") { |visitor|
	self.each_pair { |key,value|
		next if key == '_parent'
		gonext = visitor.visit(key, value, self.ref)
		value.accept(visitor) if value.is_a?(Hash) and gonext == true
	}
}

# resolve a reference, return nil if there's no value with such path
Hash.send(:define_method, "at?") { |addr|
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
}

# return root context of this context
Hash.send(:define_method, "root") {
	return self if not self.has_key?('_parent') or self['_parent'] == nil
	return self['_parent'].root
}

# Return true if this context has been expanded.
# A context can be expanded by calling method 'inherits'
Hash.send(:define_method, 'expanded?') {
	@expanded = false if defined?(@expanded)
	return @expanded
}

# Expand this context by copying attributes and procedures of its superclass
# or its type
Hash.send(:define_method, 'inherits') { |parent|
	if parent != nil
		parent.each_pair { |key,value|
			next if key[0,1] == '_' or self.has_key?(key)
			if value.is_a?(Hash)
				self[key] = value.clone
				self[key]['_parent'] = self
			else
				self[key] = value
			end
		}
	end
	@expanded = true
}

# Key must be a 'String'
# TODO - handle deep clone for an array
Hash.send(:define_method, 'sfp_clone') {
	h = Hash.new
	self.each_pair { |key,value|
		next if key == '_parent'
		if value.is_a?(Hash)
			h[key] = value.sfp_clone
		elsif value.is_a?(TrueClass) or value.is_a?(FalseClass)
			h[key] = value
		else
			h[key] = value.clone
		end
	}
	return h
}
