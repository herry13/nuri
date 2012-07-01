grammar SFP;

options {
	language = Ruby;
	output = AST;
}

@headers {
=begin
Features:
- reference
- object namespace
- set membership operators (in, not in, add, remove)
- numeric comparators (>, >=, <, <=) and mutation operators (+, -, *, /)
- new object
- procedure's cost
- constraint/mutation iterator for Set of values or objects of particular class
- Set of all-objects of particular class as procedure's parameter
- include file

TODO:
- provenance
- state-dependency (supports multiple conditions using 'or' keyword)
=end

	require File.dirname(__FILE__) + "/sfp"

}

@members {
	def nextId
		++@id
		return "c" + @id.to_s
	end

	def toRef(path)
		return "$." + path
	end

	def context
		return @root
	end

	def processFile(file)
		# TODO
		@sfp.processFile(file)
		@sfp.toContext.each_pair { |key,val|
			if val['_context'] == 'class' or val['_context'] == 'state' or
				val['_context'] == 'composite' or val['_context'] == 'constraint'
				@root[key] = val
			end	
		}
	end

	def gotoParent(remove_parent=false)
		n = @now
		@now = @now['_parent']
		n.delete('_parent') if remove_parent
		return n
	end
}

sfp 
	:	{
			@root = Hash.new
			@now = @root
			@id = 0
			@sfp = Nuri::Sfp::Main.new
		}
		NL* include* header* (state_section | composite | constraint)*
	;

include
	:	'include' include_file NL+
	;

include_file
	:	STRING
		{ self.processFile($STRING.text[1,$STRING.text.length-2]) }
	;
	
header
	:	class_definition
	|	procedure
	;

state_section
	:	ID 'state'
		{
			@now[$ID.text] = { '_self' => $ID.text,
				'_context' => 'state',
				'_parent' => @now
			}
			@now = @now[$ID.text]
		}
		'{' NL* attribute* '}' NL*
		{	self.gotoParent(true)	}
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
		{	self.gotoParent(true)	}
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
		{	self.gotoParent()	}
	;
	
extends_class returns [val]
	:	'extends' path
		{	$val = self.toRef($path.text)	}
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
				'_parent' => @now
			}
			@now = @now[$ID.text]
		}
		('isa' path
		{
			@now['_isa'] = self.toRef($path.text)
		}
		)?
		object_body?
		{	self.gotoParent();	}
	;

object_body
	:	'{' NL* ( object_attribute | state_dependency )* '}'
	;

object_attribute
	:	attribute
	|	ID equals_op NULL NL+
		{	@now[$ID.text] = nil	}
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
		{
			@now[$ID.text] = { '_self' => $ID.text,
				'_context' => 'procedure',
				'_parent' => @now,
				'_conditions' => { '_context' => 'constraint' },
				'_effects' => { '_context' => 'mutation' }
			}
			@now = @now[$ID.text]
		}
		parameters? '{' NL* 
		(	'cost' equals_op NUMBER
			{	@now['_cost'] = $NUMBER.text.to_i	}
			NL+
		)?
		conditions? effects '}' NL+
		{	self.gotoParent()	}
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
				'_isa' => self.toRef($path.text),
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
		{	self.gotoParent()	}
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
		{	self.gotoParent()	}
	;

constraint
	:	ID 'constraint'
		{
			@now[$ID.text] = { '_self' => $ID.text,
				'_context' => 'constraint',
				'_parent' => @now
			}
			@now = @now[$ID.text]
		}
		'{' NL* constraint_body '}' NL+
		{	self.gotoParent()	}
	;

constraint_body
	:	(
			(	constraint_statement
				{	@now[$constraint_statement.key] = $constraint_statement.val	}
			|	constraint_namespace
			|	constraint_iterator
			)
		NL+)*
	;

constraint_namespace
	:	path NL* '{' NL* (constraint_statement
		{
			key = self.toRef($path.text + '.' + $constraint_statement.key[2,$constraint_statement.key.length])
			@now[key] = $constraint_statement.val
		}
		NL+)* '}'
	;

constraint_iterator
	:	'foreach' path 'as' ID NL* '{' NL+
		{
			id = self.toRef($path.text)
			@now[id] = { '_parent' => @now,
				'_context' => 'iterator',
				'_self' => id,
				'_var' => $ID.text
			}
			@now = @now[id]
		}
		(constraint_statement
		{
			@now[$constraint_statement.key] = $constraint_statement.val
		}
		NL+)*
		'}'
		{	self.gotoParent()	}
	;

constraint_statement returns [key, val]
	:	reference equals_op value
		{
			$key = $reference.val
			$val = { '_context' => 'equals', '_value' => $value.val }
		}
	|	reference equals_op NULL
		{
			$key = $reference.val
			$val = { '_context' => 'equals', '_value' => nil }
		}
	|	reference not_equals_op value
		{
			$key = $reference.val
			$val = { '_context' => 'not-equals', '_value' => $value.val }
		}
	|	reference not_equals_op NULL
		{
			$key = $reference.val
			$val = { '_context' => 'not-equals', '_value' => nil }
		}
	|	reference 'is'? 'in' set_value
		{
			$key = $reference.val
			$val = { '_context' => 'in', '_value' => $set_value.val }
		}
	|	reference ('isnt'|'not') 'in' set_value
		{
			$key = $reference.val
			$val = { '_context' => 'not-in', '_value' => $set_value.val }
		}
	|	conditional_constraint
	|	reference binary_comp comp_value
		{
			$key = $reference.val
			$val = { '_context' => $binary_comp.text, '_value' => $comp_value.val }
		}
	;

comp_value returns [val]
	:	NUMBER
		{	$val = $NUMBER.text.to_f	}
	|	reference
		{	$val = $reference.val	}
	;

conditional_constraint
	:	'if'
		{
			id = self.nextId
			@now[id] = { '_parent' => @now,
				'_context' => 'ifthen',
				'_if' => nil,
				'_then' => nil
			}
			@now = @now[id]
		}
		constraint_statement NL*
		{
			@now['_if'] = { '_left' => $constraint_statement.key,
				'_right' => $constraint_statement.val
			}
		}
		conditional_constraint_then
		{	self.gotoParent()	}
	;

conditional_constraint_then
	:	'then' constraint_statement
		{
			@now['_then'] = { '_left' => $constraint_statement.key,
				'_right' => $constraint_statement.val
			}
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
			id = self.toRef($path.text)
			@now[id] = { '_parent' => @now,
				'_context' => 'iterator',
				'_self' => id,
				'_var' => $ID.text
			}
			@now = @now[id]
		}
		(mutation_statement
		{	@now[$mutation_statement.key] = $mutation_statement.val	}
		NL+)*
		'}'
		{	self.gotoParent()	}
	;

mutation_statement returns [key, val]
	:	reference equals_op value
		{
			$key = $reference.val
			$val = { '_context' => 'equals',
				'_value' => $value.val
			}
		}
	|	reference equals_op NULL
		{
			$key = $reference.val
			$val = { '_context' => 'equals',
				'_value' => nil
			}
		}
	|	reference binary_op NUMBER
		{
			$key = $reference.val
			$val = { '_context' => $binary_op.text,
				'_value' => $NUMBER.text.to_f
			}
		}
	|	reference 'is' 'new' path
		{
			id = '_' + self.nextId
			@now[id] = { '_self' => id,
				'_context' => 'object',
				'_isa' => self.toRef($path.text),
				'_parent' => @now
			}
			@now = @now[id]
		}
		object_body?
		{
			n = self.gotoParent()
			@now.delete(n['_self'])
			$key = $reference.val
			$val = n
		}
	|	'delete' path
		{
			id = '_' + self.nextId
			@now[id] = { '_self' => id,
				'_context' => 'delete',
				'_value' => self.toRef($path.text)
			}
		}
	|	reference 'add(' value ')'
		{
			$key = $reference.val
			$val = { '_context' => 'add',
				'_value' => $value.val
			}
		}
	|	reference 'remove(' value ')'
		{
			$key = $reference.val
			$val = { '_context' => 'remove',
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
		{	$val = self.toRef($path.text)	}
	;

reference_type returns [val]
	:	'isref' path
		{
			$val = { '_context' => 'reference',
				'_isa' => self.toRef($path.text),
				'_value' => nil
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

