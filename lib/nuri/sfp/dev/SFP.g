grammar SFP;

options {
	language = Ruby;
	output = AST;
}

@headers {
=begin
Depends:
- SFPlibs.rb
- ext.rb

Features:
- reference
- object namespace
- SET abstract data-type and membership operators (in, not in, add, remove)
- numeric comparators (>, >=, <, <=) and mutation operators (+, -, *, /)
- new object
- procedure's cost
- constraint/mutation iterator for Set of values or objects of particular class
- Set of all-objects of particular class as procedure's parameter
- include file
- constraint namespace

TODO:
- ARRAY abstract data-type, enumerator operator, index operator
- provenance
- state-dependency (supports multiple conditions using 'or' keyword)
=end

}

@members {
	include Nuri::Sfp::Sfplibs
}

sfp 
	:	{	self.init	}
		NL* include* header*
		{	self.expand_classes	}
		(state | composite | constraint)*
	;

include
	:	'include' include_file NL+
	;

include_file
	:	STRING
		{ self.process_file($STRING.text[1,$STRING.text.length-2]) }
	;
	
header
	:	class_definition
	|	procedure
	;

state
	:	ID ('state')?
		{
			@now[$ID.text] = { '_self' => $ID.text,
				'_context' => 'state',
				'_parent' => @now
			}
			@now = @now[$ID.text]
		}
		'{' NL*
		attribute*
		'}' NL*
		{	self.goto_parent(true)	}
	;

composite
	:	'composite' ID
		{
			@now[$ID.text] = { '_self' => $ID.text,
				'_context' => 'composite',
				'_parent' => @now
			}
			@now = @now[$ID.text]
		}
		'{' NL* ( attribute | constraint )* '}' NL*
		{	self.goto_parent(true)	}
	;

class_definition
	:	'class' ID
		{
			@now[$ID.text] = { '_self' => $ID.text,
				'_context' => 'class',
				'_parent' => @now
			}
			@now = @now[$ID.text]
		}
		(extends_class
		{
			@now['_extends'] = $extends_class.val
		}
		)?
		('{' NL* ( attribute | procedure )* '}')? NL*
		{	self.goto_parent()	}
	;
	
extends_class returns [val]
	:	'extends' path
		{
			$val = self.to_ref($path.text)
			@unexpanded_classes.push(@now)
		}
	;

attribute
	:	ID equals_op value NL+
		{	@now[$ID.text] = $value.val	}
	|	ID reference_type NL+
		{	@now[$ID.text] = $reference_type.val	}
	|	object_def NL+
	;

object_def
	:	ID
		{
			@now[$ID.text] = {	'_self' => $ID.text,
				'_context' => 'object',
				'_parent' => @now,
				'_isa' => '$.Object'
			}
			@now = @now[$ID.text]
		}
		('isa' path
		{
			@now['_isa'] = self.to_ref($path.text)
			self.expand_object(@now)
		}
		)?
		object_body?
		{	self.goto_parent();	}
	;

object_body
	:	'{' NL* ( object_attribute | state_dependency | operator )* '}'
	;

object_attribute
	:	attribute
	|	ID equals_op NULL NL+
		{	@now[$ID.text] = self.null_value	}
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

operator
	:	'operator' ID '{' NL*
		{
			@now[$ID.text] = { '_self' => $ID.text,
				'_context' => 'operator',
				'_parent' => @now,
				'_cost' => 1,
				'_conditions' => { '_context' => 'constraint' },
				'_effects' => { '_context' => 'mutation' }
			}
			@now = @now[$ID.text]
		}
		(	'cost' equals_op NUMBER NL+
			{	@now['_cost'] = $NUMBER.text.to_i	}
		)?
		/*op_param**/
		op_conditions? op_effects
		'}' NL+
		{	self.goto_parent()	}
	;

op_param
	:	ID equals_op reference NL+
		{	@now[$ID.text] = $reference.val	}
	;

op_conditions
	:	'conditions' '{' NL*
		{
			@now['_conditions']['_parent'] = @now
			@now = @now['_conditions']
		}
		op_statement*
		'}' NL+
		{	self.goto_parent()	}
	;

op_effects
	:	'effects' '{' NL*
		{
			@now['_effects']['_parent'] = @now
			@now = @now['_effects']
		}
		op_statement*
		'}' NL+
		{	self.goto_parent()	}
	;

op_statement
	:	reference equals_op value NL+
		{	@now[$reference.val] = $value.val	}
	;

procedure
	:	'procedure' ID
		{
			@now[$ID.text] = { '_self' => $ID.text,
				'_context' => 'procedure',
				'_parent' => @now,
				'_cost' => 1,
				'_conditions' => { '_context' => 'constraint', '_type' => 'and' },
				'_effects' => { '_context' => 'mutation', '_type' => 'and' }
			}
			@now = @now[$ID.text]
		}
		parameters? '{' NL* 
		(	'cost' equals_op NUMBER
			{	@now['_cost'] = $NUMBER.text.to_i	}
			NL+
		)?
		conditions? effects '}' NL+
		{	self.goto_parent()	}
	;

parameters
	:	'(' parameter (',' parameter)* ')'
	;
	
parameter
	:	ID reference_type
		{	@now[$ID.text] = $reference_type.val	}
	|	ID 'areall' path
		{
			@now[$ID.text] = { '_context' => 'all',
				'_isa' => self.to_ref($path.text),
				'_value' => nil
			}
		}
	;

conditions
	:	'conditions'
		{
			@now['_conditions']['_parent'] = @now
			@now = @now['_conditions']
		}
		'{' NL* constraint_body '}' NL+

		{	self.goto_parent()	}
	;

effects
	:	'effects'
		{
			@now['_effects']['_parent'] = @now
			@now = @now['_effects']
		}
		'{' NL* 
		mutation_body 
		'}' NL+
		{	self.goto_parent()	}
	;

constraint
	:	ID 'constraint'
		{
			@now[$ID.text] = { '_self' => $ID.text,
				'_context' => 'constraint',
				'_type' => 'and',
				'_parent' => @now
			}
			@now = @now[$ID.text]
		}
		'{' NL* constraint_body '}' NL+
		{	self.goto_parent()	}
	;

constraint_body
	:	(
			(	constraint_statement
				{
					@now[$constraint_statement.key] = $constraint_statement.val
				}
			|	constraint_namespace
			|	constraint_iterator
			)
		NL+)*
	;

constraint_namespace
	:	path NL* '{' NL* (constraint_statement
		{
			key = self.to_ref($path.text + '.' + $constraint_statement.key[2,$constraint_statement.key.length])
			@now[key] = $constraint_statement.val
		}
		NL+)* '}'
	;

constraint_iterator
	:	'foreach' path 'as' ID NL* '{' NL+
		{
			id = self.to_ref($path.text)
			@now[id] = { '_parent' => @now,
				'_context' => 'iterator',
				'_self' => id,
				'_variable' => $ID.text
			}
			@now = @now[id]
		}
		(constraint_statement
		{
			@now[$constraint_statement.key] = $constraint_statement.val
		}
		NL+)*
		'}'
		{	self.goto_parent()	}
	;

constraint_statement returns [key, val]
	:	reference equals_op value
		{
			$key = $reference.val
			$val = { '_context' => 'constraint', '_type' => 'equals', '_value' => $value.val }
		}
	|	reference equals_op NULL
		{
			$key = $reference.val
			$val = { '_context' => 'constraint', '_type' => 'equals', '_value' => self.null_value }
		}
	|	reference not_equals_op value
		{
			$key = $reference.val
			$val = { '_context' => 'constraint', '_type' => 'not-equals', '_value' => $value.val }
		}
	|	reference not_equals_op NULL
		{
			$key = $reference.val
			$val = { '_context' => 'constraint', '_type' => 'not-equals', '_value' => self.null_value }
		}
	|	conditional_constraint
		{
			$key = $conditional_constraint.key
			$val = $conditional_constraint.val
		}
	|	reference 'is'? 'in' set_value
		{
			$key = $reference.val
			$val = { '_context' => 'constraint', '_type' => 'in', '_value' => $set_value.val }
		}
	|	reference ('isnt'|'not') 'in' set_value
		{
			$key = $reference.val
			$val = { '_context' => 'constraint', '_type' => 'not-in', '_value' => $set_value.val }
		}
	|	reference binary_comp comp_value
		{
			$key = $reference.val
			$val = { '_context' => 'constraint', '_type' => $binary_comp.text, '_value' => $comp_value.val }
		}
	;

comp_value returns [val]
	:	NUMBER
		{	$val = $NUMBER.text.to_f	}
	|	reference
		{	$val = $reference.val	}
	;

conditional_constraint returns [key, val]
	:	'if'
		{
			$key = id = self.next_id.to_s
			@now[id] = { '_parent' => @now,
				'_context' => 'constraint',
				'_type' => 'or'
			}
			@now = @now[id]
		}
		constraint_statement NL*
		{
			id = self.next_id
			@now[id] = { '_parent' => @now,
				'_context' => 'constraint',
				'_type' => 'not'
			}
			@now[id][$constraint_statement.key] = $constraint_statement.val
		}
		conditional_constraint_then
		{	$val = self.goto_parent()	}
	;

conditional_constraint_then
	:	'then' constraint_statement
		{
			id = self.next_id
			@now[id] = { '_parent' => @now,
				'_context' => 'constraint',
				'_type' => 'and'
			}
			@now[id][$constraint_statement.key] = $constraint_statement.val
		}
	;

mutation_body
	:	(
			(	mutation_statement
				{	@now[$mutation_statement.key] = $mutation_statement.val	}
			|	mutation_iterator
			)
		NL+)* 
	;

mutation_iterator
	:	'foreach' path 'as' ID NL* '{' NL+
		{
			id = self.to_ref($path.text)
			@now[id] = { '_parent' => @now,
				'_context' => 'iterator',
				'_self' => id,
				'_variable' => $ID.text
			}
			@now = @now[id]
		}
		(mutation_statement
		{	@now[$mutation_statement.key] = $mutation_statement.val	}
		NL+)*
		'}'
		{	self.goto_parent()	}
	;

mutation_statement returns [key, val]
	:	reference equals_op value
		{
			$key = $reference.val
			$val = { '_context' => 'mutation',
				'_type' => 'equals',
				'_value' => $value.val
			}
		}
	|	reference equals_op NULL
		{
			$key = $reference.val
			$val = { '_context' => 'mutation',
				'_type' => 'equals',
				'_value' => self.null_value
			}
		}
	|	reference binary_op NUMBER
		{
			$key = $reference.val
			$val = { '_context' => 'mutation',
				'_type' => $binary_op.text,
				'_value' => $NUMBER.text.to_f
			}
		}
	|	reference 'is' 'new' path
		{
			id = '_' + self.next_id
			@now[id] = { '_self' => id,
				'_context' => 'object',
				'_isa' => self.to_ref($path.text),
				'_parent' => @now
			}
			@now = @now[id]
		}
		object_body?
		{
			n = self.goto_parent()
			@now.delete(n['_self'])
			$key = $reference.val
			$val = n
		}
	|	'delete' path
		{
			id = '_' + self.next_id
			@now[id] = { '_self' => id,
				'_context' => 'mutation',
				'_type' => 'delete',
				'_value' => self.to_ref($path.text)
			}
		}
	|	reference 'add(' value ')'
		{
			$key = $reference.val
			$val = { '_context' => 'mutation',
				'_type' => 'add',
				'_value' => $value.val
			}
		}
	|	reference 'remove(' value ')'
		{
			$key = $reference.val
			$val = { '_context' => 'mutation',
				'_type' => 'remove',
				'_value' => $value.val
			}
		}
	;

set_value returns [val]
	:	'('
		{	@set = Array.new	}
		set_item (',' set_item)*
		{	$val = @set	}
		')'
	;

set_item
	:	value
		{	@set.push($value.val)	}
	;

value returns [val]
	:	primitive_value
		{	$val = $primitive_value.val	}
	|	reference
		{	$val = $reference.val	}
	|	set_value
		{	$val = $set_value.val	}
	;

primitive_value returns [val]
	:	BOOLEAN
		{
			if $BOOLEAN.text == 'true' or $BOOLEAN.text == 'on' or $BOOLEAN.text == 'yes'
				$val = true
			else  # 'false', 'no', 'off'
				$val = false
			end
		}
	|	NUMBER
		{	$val = $NUMBER.text.to_f	}
	|	STRING
		{	$val = $STRING.text[1,$STRING.text.length-2]	}
	|	MULTILINE_STRING
		{	$val = $MULTILINE_STRING.text[2, $MULTILINE_STRING.text.length-2]	}
	;

path
	:	ID('.'ID)*
	;

reference returns [val]
	:	path
		{	$val = self.to_ref($path.text)	}
	;

reference_type returns [val]
	:	'isref' path
		{
			$val = { '_context' => 'null',
				'_isa' => self.to_ref($path.text)
			}
		}
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

