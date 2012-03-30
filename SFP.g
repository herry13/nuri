grammar SFP;

options {
	language = Ruby;
	output = AST;
}

@header {
	require 'net/http'
	require 'Context'
	require 'Reference'
}

@members {

	attr_accessor :root, :now

	## put these lines into initialize()
	def init
		@root = Sfplanner::Lang::Context.new("root")
		@now = @root
	end

	def get_string(str)
		return str.text[ 1, str.text.length-2 ]
	end

	def copyXtoY(x, y)
		x.attributes.each { |key,value|
			y.attributes[key] = value
		}
	end
}

sfp
	:	NL* include* header* (state | composite)?
	;

include
	:	'#include' ( include_file | include_url ) NL+
	;

include_file
	:	'file(' STRING ')'
		{
			translator = Sfplanner::Lang::Translator.new
			context = translator.sfpToContext(get_string($STRING))
			context.attributes.each { |key,value|
				@now.set(key, value)
			}
		}
	;
	
include_url
	:	'url(' STRING ')'
		{
			res = Net::HTTP.get_response(URI(get_string($STRING)))
			translator = Sfplanner::Lang::Translator.new
			context = translator.parse(res.body)
			context.attributes.each { |key,value|
				@now.set(key, value)
			}
		}
	;

header
	:	class_definition
	|	action
	;

state
	:	{
			@now.set('init', Sfplanner::Lang::Context.new('init', @now, nil, Sfplanner::Lang::STATE))
			@now = @now.get('init')
		}
		attribute+ constraint*
		{  @now = @now.owner  }
	;

composite
	:	'composite' ID '{' NL* ( attribute | constraint )* '}' NL*
	;

class_definition
	:	'class' ID
		{
			@now.set($ID.text, Sfplanner::Lang::Context.new($ID.text, @now, nil, Sfplanner::Lang::CLASS))
			@now = @now.get($ID.text)
		}
		(extends_class
			{
				@now.super = $extends_class.value
				copyXtoY(@now.super, @now)
			}
		)?
		('{' NL* ( attribute | action )* '}')? NL*
		{  @now = @now.owner  }
	;
	
extends_class returns [ value ]
	: 'extends' path { $value = @root.get($path.text) }
	;

attribute
	:	ID
		(	value { @now.set($ID.text, $value.val) }
		|	{
				@now.set($ID.text, Sfplanner::Lang::Context.new($ID.text, @now, nil, Sfplanner::Lang::OBJECT))
				@now = @now.get($ID.text)
			}
			object
			{	@now = @now.owner  }
		|	reference_type { @now.set($ID.text, $reference_type.value) }
		)
		NL+
	;

object
  : 'as' path
	{
		c = @root.get($path.text)
		copyXtoY(c, @now)
		@now.super = c
	}
	('{' NL* ( object_attribute | state_dependency )* '}')?
  ;

object_attribute
	:	attribute
	|	ID NULL NL+
	;

state_dependency
	:	'when' dep_effect NL* 'then' NL* '{' NL* (dep_condition)+ '}' NL+
	;

dep_effect
	:	reference ( value | NULL )
	;

dep_condition
	:	reference ( value | NULL ) NL+
	;

action
	:	'action' ID
		{
			@now.set($ID.text, Sfplanner::Lang::Context.new($ID.text, @now, nil, Sfplanner::Lang::ACTION))
			@now = @now.get($ID.text)
		}
		parameters? '{' NL* precondition postcondition '}' NL+
		{ @now = @now.owner }
	;

parameters
	:	'(' parameter (',' parameter)* ')'
	;
	
parameter
	:	ID reference_type
	;

precondition
	:	'precondition'
		{
			@now.set('precondition', Sfplanner::Lang::Context.new('precondition', @now, nil, Sfplanner::Lang::PRECONDITION))
			@now = @now.get('precondition')
		}
		'{' NL* constraint_body '}' NL+
		{ @now = @now.owner }
	;

postcondition
	:	'postcondition'
		{
			@now.set('postcondition', Sfplanner::Lang::Context.new('postcondition', @now, nil, Sfplanner::Lang::POSTCONDITION))
			@now = @now.get('postcondition')
		}
		'{' NL* postcondition_body '}' NL+
		{ @now = @now.owner }
	;

constraint
	:	'constraint' ID 
		{
			@now.set($ID.text, Sfplanner::Lang::Context.new($ID.text, @now, nil, Sfplanner::Lang::CONSTRAINT))
			@now = @now.get($ID.text)
		}
	
		'{' NL* constraint_body '}' NL+
		{ @now = @now.owner }
	;

constraint_body
	:	(constraint_statement NL+)*
	;

constraint_statement
	:	reference value { @now.set($reference.text, $value.val) }
	|	reference NULL
	|	reference 'not' value
	|	reference 'in' set
	|	reference binary_comp binary_comp_value
	|	conditional_constraint
	;

binary_comp_value
	:	NUMBER
	|	reference
	;

conditional_constraint
	:	'if' constraint_statement NL* conditional_constraint_then
	;

conditional_constraint_then
	:	'then' constraint_statement
	;

postcondition_body
	:	(mutation_statement NL+)*
	;

mutation_statement
	:	reference value
	|	reference NULL
	|	reference binary_op binary_op_value
	;

binary_op_value
	:	reference
	|	NUMBER
	;

set
	:	'(' ( set_value (',' set_value)* )? ')'
	;

set_value
	:	value
	;

value returns [ val ]
	:	primitive_value { $val = $primitive_value.value }
	|	reference { $val = Sfplanner::Lang::Reference.new($reference.text) }
	|	set
	;

primitive_value returns [ value ]
	:	BOOLEAN { $value = ($BOOLEAN.text == '"true"' ? true : false ) }
	|	NUMBER  { $value = $NUMBER.text.to_i }
	|	STRING  { $value = $STRING.text[ 1, $STRING.text.length-2 ] }
	;

path
	:	ID('.'ID)*
	;

reference
	:	'$'path
	;

reference_type returns [ value ]
	:	'as' '*'path { $value = Sfplanner::Lang::Context.new('null', @now, @root.get($path.text), Sfplanner::Lang::REFERENCE_TYPE) }
	;

binary_op
	:	'+='
	|	'-='
	|	'*='
	|	'/='
	;

binary_comp
	:	'>'
	|	'>='
	|	'<'
	|	'<='
	;

NULL
	:	'null'
	;

BOOLEAN
	:	'true'
	|	'false'
	;

ID  :	('a'..'z'|'A'..'Z') ('a'..'z'|'A'..'Z'|'0'..'9'|'_'|'-')*
    ;

NUMBER
    :   '-'?'0'..'9'+
    |   '-'?('0'..'9')+ '.' ('0'..'9')* EXPONENT?
    |   '-'?'.' ('0'..'9')+ EXPONENT?
    |   '-'?('0'..'9')+ EXPONENT
    ;

COMMENT
    :   '//' ~('\n'|'\r')* {$channel=HIDDEN;}
    |   '/*' ( options {greedy=false;} : . )* '*/' {$channel=HIDDEN;}
    ;

NL	:	'\r'? '\n'
	;

WS  :   ( ' '
        | '\t'
        ) {$channel=HIDDEN;}
    ;

STRING
    :  '"' ( ESC_SEQ | ~('\\'|'"') )* '"'
    ;

fragment
EXPONENT : ('e'|'E') ('+'|'-')? ('0'..'9')+ ;

fragment
HEX_DIGIT : ('0'..'9'|'a'..'f'|'A'..'F') ;

fragment
ESC_SEQ
    :   '\\' ('b'|'t'|'n'|'f'|'r'|'\"'|'\''|'\\')
    |   UNICODE_ESC
    |   OCTAL_ESC
    ;

fragment
OCTAL_ESC
    :   '\\' ('0'..'3') ('0'..'7') ('0'..'7')
    |   '\\' ('0'..'7') ('0'..'7')
    |   '\\' ('0'..'7')
    ;

fragment
UNICODE_ESC
    :   '\\' 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
    ;
