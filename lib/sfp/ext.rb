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
		go_next = visitor.visit(key, value, self.ref)
		value.accept(visitor) if value.is_a?(Hash) and go_next == true
	}
}

# resolve a reference, return nil if there's no value with such path
Hash.send(:define_method, "at") { |addr|
	return nil if not addr.is_a?(String)
	addrs = addr.split('.', 2)
	if addrs[0] == '$'
		return self.root.at(addrs[1])
	elsif self.has_key?(addrs[0])
		if addrs.length == 1 
			return self[addrs[0]]
		else
			return self[addrs[0]].at(addrs[1]) if self[addrs[0]].is_a?(Hash) and addrs[1] != ''
		end
	end
	return nil
}

# return root context of this context
Hash.send(:define_method, "root") {
	return self if not self.has_key?('_parent') or self['_parent'] == nil
	return self['_parent'].root
}

Hash.send(:define_method, "constraint?") {
	return (self.has_key?('_context') and self['_context'] == 'constraint')
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
