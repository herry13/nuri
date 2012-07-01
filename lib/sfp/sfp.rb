#!/usr/bin/env ruby

require File.dirname(__FILE__) + "/SFPParser"
require File.dirname(__FILE__) + "/SFPLexer"

module Nuri
	module Sfp
		class Main

			def initialize
				String.send(:define_method, "isRef") {
				}
			end

			def processFile(file)
				f = File.open(file, 'rb')
				lexer = SFP::Lexer.new(f)
				tokens = ANTLR3::CommonTokenStream.new(lexer)
				@parser = SFP::Parser.new(tokens)
				@parser.sfp
			end
	
			def process(text)
				lexer = SFP::Lexer.new(text)
				tokens = ANTLR3::CommonTokenStream.new(lexer)
				@parser = SFP::Parser.new(tokens)
				@parser.sfp
			end
	
			def toContext
				context = @parser.context
				return context
			end
	
			def toSas
			end
		end

		class ValueVisitor
			def visit(name, value, ref)
				return if name[0,1] == '_'
				ref = ref.push(name)
				puts ref + ":" + " (" + value.isa.to_s + ")" if value.respond_to?('isa') and value.isa != nil
			end
		end

		class ClassVisitor
			def visit(name, value, ref)
				return if not value.respond_to?('isclass') or not value.isclass?
				puts ref.push(name)
				puts ref + ": " + value.extends
			end
		end
	end
end

### String additional method for handling Reference
String.send(:define_method, "ref?") {
	s = self.to_s
	return (s.length > 0 and s[0,1] == '$')
}

String.send(:define_method, "to_path") {
	return self.to_s.sub(/^\$\./, '') if self.ref?
	return self.to_s
}

String.send(:define_method, "push") { |value|
	return self.to_s + "." + value.to_path if self.ref?
	return self.to_s + value.to_s
}

String.send(:define_method, "pop") {
	# TODO
}

String.send(:define_method, 'isa') {
	return 'string'
}

String.send(:define_method, 'isobject?') {
	return false
}

### Boolean additional methods
TrueClass.send(:define_method, 'isa') {
	return 'boolean'
}

TrueClass.send(:define_method, 'isobject?') {
	return false
}

FalseClass.send(:define_method, 'isa') {
	return 'boolean'
}

FalseClass.send(:define_method, 'isobject?') {
	return false
}

# Nil additional methods
NilClass.send(:define_method, 'isa') { |type|
	@type = type if type == nil
	return @type if defined?(@type)
	return nil
}

### Hash additional methods
Hash.send(:define_method, 'isa') {
	return self['_isa'] if self.has_key?('_isa')
	return nil
}

Hash.send(:define_method, 'isobject?') {
	return (self.has_key?('_context') and self['_context'] == 'object')
}

Hash.send(:define_method, 'isclass?') {
	return (self.has_key?('_context') and self['_context'] == 'class')
}	

Hash.send(:define_method, 'extends?') {
	return self['_extends'] if self.isclass? and self.has_key['_extends']
}

Hash.send(:define_method, "accept") { |visitor|
	self.each_pair { |key,value|
		next if key == '_parent'
		visitor.visit(key, value, self.ref)
		value.accept(visitor) if value.is_a?(Hash)
	}
}

Hash.send(:define_method, "ref") {
	return '$' if not self.has_key?('_parent') or self['_parent'] == nil
	me = (self.has_key?('_self') ? self['_self'] : '')
	return self['_parent'].ref + "." + me
}
