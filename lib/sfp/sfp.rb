#!/usr/bin/env ruby

require File.dirname(__FILE__) + "/SFPParser"
require File.dirname(__FILE__) + "/SFPLexer"
require File.dirname(__FILE__) + "/sas"

module Nuri
	module Sfp
		# main class which processes configuration description in SFP language either
		# in file or as a string
		class Main

			# enable this class to process SFP into FDR (SAS+)
			include Nuri::Sfp::Sas

			def initialize
			end

			# parse SFP file
			def parseFile(file)
				f = File.open(file, 'rb')
				lexer = SFP::Lexer.new(f)
				tokens = ANTLR3::CommonTokenStream.new(lexer)
				@parser = SFP::Parser.new(tokens)
				@parser.sfp
			end

			# parse SFP in a string
			def parse(text)
				lexer = SFP::Lexer.new(text)
				tokens = ANTLR3::CommonTokenStream.new(lexer)
				@parser = SFP::Parser.new(tokens)
				@parser.sfp
			end
	
			# return context representation of SFP description
			def to_context
				return @parser.context
			end
		end
	end
end

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
	return self.to_s + "." + value if self.ref?
	return self.to_s + value.to_s
}

# return first element and keep the rest
String.send(:define_method, "pop") {
	# TODO
}

# return type of this value i.e. 'string'
String.send(:define_method, 'isa?') {
	return 'string' if not self.ref?
	return 'reference'
}

# return true because String is a value
String.send(:define_method, 'isvalue?') { return true }

# return false because String is not an object
String.send(:define_method, 'isobject?') { return false }

### Boolean additional methods
# return type of TrueClass i.e. 'boolean'
TrueClass.send(:define_method, 'isa?') { return 'boolean' }

# return true because TrueClass is a value
TrueClass.send(:define_method, 'isvalue?') { return true }

# return false because TrueClass is not an object
TrueClass.send(:define_method, 'isobject?') { return false }

# return type of FalseClass i.e. 'boolean'
FalseClass.send(:define_method, 'isa?') { return 'boolean' }

# return true because FalseClass is a value
FalseClass.send(:define_method, 'isvalue?') { return true }

# return false because FalseClass is not an object
FalseClass.send(:define_method, 'isobject?') { return false }

### Numeric additional methods
# return type of Numeric i.e. 'number'
Numeric.send(:define_method, 'isa?') { return 'number' }

# return true because Numeric is a value
Numeric.send(:define_method, 'isvalue?') { return true }

# return false because Numeric is not an object
Numeric.send(:define_method, 'isobject?') { return false }

# Nil additional methods
# return type of Nil
NilClass.send(:define_method, 'isa?') { #|type|
#	@type = type if type == nil
	return @isa if defined?(@isa)
	return nil
}

# return true because Nil is a value
NilClass.send(:define_method, 'isvalue?') { return true }

# return false because Nil is not an object
NilClass.send(:define_method, 'isobject?') { return false }

### Hash additional methods
# return type of this context object, otherwise return nil
Hash.send(:define_method, 'isa?') {
	return self['_isa'] if self.has_key?('_isa')
	return nil
}

# return true if this context is an object, otherwise false
Hash.send(:define_method, 'isvalue?') {
	#return (self.isobject?)
	return (self.isobject? or self.null?)
}

# return true if this context is an object, otherwise false
Hash.send(:define_method, 'isobject?') {
	return (self.has_key?('_context') and self['_context'] == 'object')
}

# return true if this context in a reference, otherwise false
Hash.send(:define_method, 'null?') {
	return (self.has_key?('_context') and self['_context'] == 'reference' and
		self.has_key?('_value') and self['_value'] == nil)
}

# return a fullpath reference if this context is an object, otherwise nil
Hash.send(:define_method, 'name') {
	return self.ref if self.isobject?
	return nil
}

# return true if this context is a class
Hash.send(:define_method, 'isclass?') {
	return (self.has_key?('_context') and self['_context'] == 'class')
}	

# return the superclass' reference if this context class has a superclass
Hash.send(:define_method, 'extends?') {
	return self['_extends'] if self.isclass? and self.has_key?('_extends')
	return nil
}

# accept method as implementation of Visitor pattern
Hash.send(:define_method, "accept") { |visitor|
	self.each_pair { |key,value|
		next if key == '_parent'
		visitor.visit(key, value, self.ref)
		value.accept(visitor) if value.is_a?(Hash)
	}
}

# return a fullpath of reference of this context
Hash.send(:define_method, "ref") {
	return '$' if not self.has_key?('_parent') or self['_parent'] == nil
	me = (self.has_key?('_self') ? self['_self'] : '')
	return self['_parent'].ref + "." + me
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
	parent.each_pair { |key,value|
		next if key[0,1] == '_' or self.has_key?(key)
puts "\tcopy: " + key
		if value.is_a?(Hash)
			self[key] = value.clone
			self[key]['_parent'] = self
		else
			self[key] = value
		end
	}
	@expanded = true
}
