grammar SFP;

options {
	language = Ruby;
	output = AST;
}

@headers {
}

@members {
}

sfp
	:	NL* include* header* (state_section | composite | constraint)*
	;

include
	:	'include' include_file NL+
	;

include_file
	:	'file' STRING
	;
	
header
	:	class_definition
	|	procedure
	;

state_section
	:	ID 'state'
		'{' NL* attribute* '}' NL*
	;

composite
	:	'composite' ID
		'{' NL* ( attribute | constraint )* '}' NL*
	;

class_definition
	:	'class' ID
		(extends_class
		)?
		('{' NL* ( attribute | procedure )* '}')? NL*
	;
	
extends_class returns [val]
	:	'extends' path
	;

attribute
	:	ID equals_op value NL+
	|	ID reference_type NL+
	|	object_def NL+
	;

object_def
	:	ID
		('isa' path
		)?
		object_body?
	;

object_body
	:	'{' NL* ( object_attribute | state_dependency )* '}'
	;

object_attribute
	:	attribute
	|	ID equals_op NULL NL+
	;

state_dependency
	:	'if'
		dep_effect NL* 'then' NL* '{'
		NL* constraint_body 
		'}'
		( NL* 'or' NL* '{'
		NL* constraint_body
		'}')*
		NL+
	;

dep_effect
	:	reference equals_op 
		( value
		| NULL 
		)
	;

procedure
	:	'procedure' ID
		parameters? '{' NL* 
		(	'cost' equals_op NUMBER
			NL+
		)?
		conditions? effects '}' NL+
	;

parameters
	:	'(' parameter (',' parameter)* ')'
	;
	
parameter
	:	ID reference_type
	|	ID 'areall' path
	;

conditions
	:	'conditions'
		'{' NL* constraint_body '}' NL+
	;

effects
	:	'effects'
		'{' NL* 
		mutation_body 
		'}' NL+
	;

constraint
	:	ID 'constraint'
		'{' NL* constraint_body '}' NL+
	;

constraint_body
	:	(
			(constraint_statement
			|	constraint_namespace
			|	constraint_iterator
			)
		NL+)*
	;

constraint_namespace
	:	path NL* '{' NL* (constraint_statement
		NL+)* '}'
	;

constraint_iterator
	:	'foreach' path 'as' ID NL* '{' NL+
		(constraint_statement
		NL+)*
		'}'
	;

constraint_statement returns [key, val]
	:	reference equals_op value
	|	reference equals_op NULL
	|	reference not_equals_op value
	|	reference not_equals_op NULL
	|	reference 'is'? 'in' set_value
	|	reference ('isnt'|'not') 'in' set_value
	|	conditional_constraint
	|	reference binary_comp comp_value
	;

comp_value returns [val]
	:	NUMBER
	|	reference
	;

conditional_constraint
	:	'if'
		constraint_statement NL*
		conditional_constraint_then
	;

conditional_constraint_then
	:	'then' constraint_statement
	;

mutation_body
	:	(
			(	mutation_statement
			|	mutation_iterator
			)
		NL+)* 
	;

mutation_iterator
	:	'foreach' ID NL* '{' NL+
		(mutation_statement
		NL+)*
		'}'
	;

mutation_statement returns [key, val]
	:	reference equals_op value
	|	reference equals_op NULL
	|	reference binary_op NUMBER
	|	reference 'is' 'new' path
		object_body?
	|	'delete' path
	|	reference 'add(' value ')'
	|	reference 'remove(' value ')'
	;

set_value returns [val]
	:	'('
		set_item (',' set_item)*
		')'
	;

set_item
	:	value
	;

value returns [val]
	:	primitive_value
	|	reference
	|	set_value
	;

primitive_value returns [val]
	:	BOOLEAN
	|	NUMBER
	|	STRING
	|	MULTILINE_STRING
	;

path
	:	ID('.'ID)*
	;

reference returns [val]
	:	path
	;

reference_type returns [val]
	:	'isref' path
	;

equals_op
	:	'='
	|	'is'
	;

not_equals_op
	:	'!='
	|	'isnt'
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
	|	'off'
	|	'on'
	|	'yes'
	|	'no'
	;

ID	:	('a'..'z'|'A'..'Z') ('a'..'z'|'A'..'Z'|'0'..'9'|'_'|'-')*
	;

NUMBER
	:	'-'?('0'..'9')+
	|	'-'?('0'..'9')+'.'('0'..'9')* EXPONENT?
	|	'-'?'.'('0'..'9')+ EXPONENT?
	|	'-'?('0'..'9')+ EXPONENT
	;

COMMENT
	:   '//' ~('\n'|'\r')* {$channel=HIDDEN;}
	|   '/*' ( options {greedy=false;} : . )* '*/' {$channel=HIDDEN;}
	;

MULTILINE_STRING
	:	'r"' ( options {greedy=false;} : .)* '"'
	;

NL	:	'\r'? '\n'
	;

WS	:   ( ' ' | '\t' ) {$channel=HIDDEN;}
	;

STRING
	:  '"' ( ESC_SEQ | ~('\\'|'"') )* '"'
	;

fragment
EXPONENT	: ('e'|'E') ('+'|'-')? ('0'..'9')+ ;

fragment
HEX_DIGIT	: ('0'..'9'|'a'..'f'|'A'..'F') ;

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

