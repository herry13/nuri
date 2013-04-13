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
- total-constraint
- ARRAY abstract data-type, index operator

TODO:
- ARRAY enumerator operator
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
		(state | composite | constraint | goal_constraint)*
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
		{
			if @now.has_key?($ID.text) and @now[$ID.text].is_a?(Hash) and
					@now[$ID.text].isset and $value.type == 'Set'
				$value.val.each { |v| @now[$ID.text]['_values'].push(v) }
			else
				@now[$ID.text] = $value.val
			end
		}
	|	ID reference_type NL+
		{	@now[$ID.text] = $reference_type.val	}
	|	ID set_type NL+
		{	@now[$ID.text] = $set_type.val	}
	|	ID probability_op set_value NL+
		{ 	
			@conformant = true
			@now[$ID.text] = { '_self' => $ID.text,
				'_context' => 'either',
				'_parent' => @now,
				'_values' => $set_value.val
			}
		}
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
			@now['_is_array'] = false
		}
		('isa' path('[' NUMBER { @now['_is_array'] = true } ']')?
		{
			@now['_isa'] = self.to_ref($path.text)
			self.expand_object(@now)
		}
		)?
		object_body?
		{
			if @now['_is_array']
				@now.delete('_is_array')
				obj = self.goto_parent()
				total = $NUMBER.to_s.to_i
				@arrays[obj.ref] = total
				for i in 0..(total-1)
					id = obj['_self'] + "[#{i}]"
					@now[id] = deep_clone(obj)
					@now[id]['_self'] = id
					@now[id]['_classes'] = obj['_classes']
					#puts 'is_array: ' + $ID.text + '[' + i.to_s + ']'
				end
				@now.delete(obj['_self'])
			else
				self.goto_parent()
			end
		}
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
				'_condition' => { '_context' => 'constraint' },
				'_effect' => { '_context' => 'mutation' }
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
			@now['_condition']['_parent'] = @now
			@now = @now['_condition']
		}
		op_statement*
		'}' NL+
		{	self.goto_parent()	}
	;

op_effects
	:	'effects' '{' NL*
		{
			@now['_effect']['_parent'] = @now
			@now = @now['_effect']
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
				'_condition' => { '_context' => 'constraint', '_type' => 'and' },
				'_effect' => { '_context' => 'mutation', '_type' => 'and' }
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
	:	'(' parameter (',' NL* parameter)* ')'
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
	|	ID 'isset' path
		{
			@now[$ID.text] = { '_context' => 'set',
				'_isa' => self.to_ref($path.text),
				'_values' => []
			}
		}
	;

conditions
	:	'conditions'
		{
			@now['_condition']['_parent'] = @now
			@now = @now['_condition']
		}
		'{' NL* constraint_body '}' NL+

		{	self.goto_parent()	}
	;

effects
	:	'effects'
		{
			@now['_effect']['_parent'] = @now
			@now = @now['_effect']
		}
		'{' NL* 
		mutation_body 
		'}' NL+
		{	self.goto_parent()	}
	;

goal_constraint
	:	'goal' 'constraint'? NL*
		{
			@now['goal'] = { '_self' => 'goal',
				'_context' => 'constraint',
				'_type' => 'and',
				'_parent' => @now
			}
			@now = @now['goal']
		}
		'{' NL* goal_body* '}' NL+
		{	self.goto_parent()	}
	;

goal_body
	:	(
			(	constraint_statement
				{
					@now[$constraint_statement.key] = $constraint_statement.val
				}
			|	constraint_namespace
			|	constraint_iterator
			|	constraint_class_quantification
			)
		NL+)
	|	'always' NL*
		{
			@now['always'] = self.create_constraint('always', 'and') if
				not @now.has_key?('always')
			@now = @now['always']
		}
		'{' NL* constraint_body '}' NL+
		{	self.goto_parent()	}
	|	'sometime' NL*
		{
			@now['sometime'] = self.create_constraint('sometime', 'or') if
				not @now.has_key?('sometime')
			@now = @now['sometime']
			id = self.next_id.to_s
			@now[id] = self.create_constraint(id, 'and')
			@now = @now[id]
		}
		'{' NL* constraint_body '}' NL+
		{	self.goto_parent()	}
		{	self.goto_parent()	}
	|	'within' NUMBER NL*
		{
			id = self.next_id.to_s
			@now[id] = self.create_constraint(id, 'within')
			@now = @now[id]
			@now['deadline'] = $NUMBER.text.to_s.to_i
		}
		'{' NL* constraint_body '}' NL+
		{	self.goto_parent()	}
	|	'after' NL*
		{
			@now['sometime-after'] = self.create_constraint('sometime-after', 'or') if
				not @now.has_key?('sometime-after')
			@now = @now['sometime-after']

			id = self.next_id.to_s
			@now[id] = self.create_constraint(id, 'sometime-after')
			@now = @now[id]
			@now['after'] = self.create_constraint('after')
			@now['deadline'] = -1
			@now = @now['after']
		}
		'{' NL* constraint_body '}' NL*
		{	self.goto_parent()	}
		(	'then'
			| 'within' NUMBER
				{ @now['deadline'] = $NUMBER.text.to_s.to_i }
		) NL*
		{
			@now['then'] = self.create_constraint('then')
			@now = @now['then']
		}
		'{' NL* constraint_body '}' NL+
		{	self.goto_parent()	}
		{	self.goto_parent()	}
		{	self.goto_parent()	}
	|	'before' NL*
		{
			id = self.next_id.to_s
			@now[id] = self.create_constraint(id, 'sometime-before')
			@now = @now[id]
			@now['before'] = self.create_constraint('before')
			@now = @now['before']
		}
		'{' NL* constraint_body '}' NL*
		{	self.goto_parent()	}
		'then' NL*
		{
			@now['then'] = self.create_constraint('then')
			@now = @now['then']
		}
		'{' NL* constraint_body '}' NL+
		{	self.goto_parent()	}
		{	self.goto_parent()	}
	;

nested_constraint
	:	'{' NL* constraint_body '}'
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
			|	constraint_class_quantification
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
	:	'foreach' '(' path 'as' ID ')' NL* '{' NL+
		{
			id = self.next_id.to_s
			@now[id] = { '_parent' => @now,
				'_context' => 'constraint',
				'_type' => 'iterator',
				'_self' => id,
				'_value' => '$.' + $path.text,
				'_variable' => $ID.text
			}
			@now = @now[id]
			
			id = '_template'
			@now[id] = { '_parent' => @now,
				'_context' => 'constraint',
				'_type' => 'and',
				'_self' => id,
			}
			@now = @now[id]
		}
		(constraint_statement
		{
			@now[$constraint_statement.key] = $constraint_statement.val
		}
		NL+)*
		'}'
		{
			self.goto_parent()
			self.goto_parent()
		}
	;

quantification_keyword
	:	'forall'
	|	'exist'
	|	'forsome'
	;

constraint_class_quantification
	:	quantification_keyword '(' path 'as' ID ')'
		{
			id = self.next_id.to_s
			@now[id] = { '_parent' => @now,
				'_context' => 'constraint',
				'_type' => $quantification_keyword.text,
				'_self' => id,
				'_class' => $path.text,
				'_variable' => $ID.text
			}
			@now = @now[id]

			id = '_template'
			@now[id] = { '_parent' => @now,
				'_context' => 'constraint',
				'_type' => 'and',
				'_self' => id
			}
			@now = @now[id]
		}
		(	(	binary_comp
				{	@now['_count_operator'] = $binary_comp.text	}
			|	'='
				{	@now['_count_operator'] = '='	}
			)
			NUMBER
			{	@now['_count_value'] = $NUMBER.text.to_i	}
		)?
		NL* '{' NL+
		(	constraint_statement
			{	@now[$constraint_statement.key] = $constraint_statement.val	}
			NL+
		|	constraint_different NL+
		|	constraint_iterator NL+
		)* '}'
		{	self.goto_parent()	}
		{	self.goto_parent()	}
	;

constraint_different
	:	':different' '(' path ')'
		{
			id = self.next_id.to_s
			@now[id] = { '_parent' => @now,
				'_context' => 'constraint',
				'_type' => 'different',
				'_self' => id,
				'_path' => $path.text
			}
		}
	;

constraint_statement returns [key, val]
	:	reference
		{
			$key = $reference.val
			$val = { '_context' => 'constraint', '_type' => 'equals', '_value' => true }
		}
	|	'not' reference
		{
			$key = $reference.val
			$val = { '_context' => 'constraint', '_type' => 'equals', '_value' => false }
		}
	|	reference equals_op value
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
			c_or = { '_context' => 'constraint', '_type' => 'or', '_parent' => @now }
			$set_value.val.each { |v|
				id = self.next_id.to_s
				item = { '_context' => 'constraint', '_type' => 'and', '_parent' => c_or }
				item[$reference.val] = { '_context' => 'constraint', '_type' => 'equals', '_value' => v }
				c_or[id] = item
			}
			$key = self.next_id.to_s
			$val = c_or
		}
	|	reference ('isnot'|'isnt'|'not') 'in' set_value
		{
			c_and = { '_context'=>'constraint', '_type'=>'and', '_parent'=>@now }
			$set_value.val.each { |v|
				id = self.next_id.to_s
				item = { '_context'=>'constraint', '_type'=>'and'}
				item[$reference.val] = { '_context'=>'constraint', '_type'=>'not-equals', '_value'=>v }
				c_and[id] = item
			}
			$key = self.next_id.to_s
			$val = c_and

			#$key = $reference.val
			#$val = { '_context' => 'constraint', '_type' => 'not-in', '_value' => $set_value.val }
		}
	|	reference 'has' value
		{
			c_has = { '_context' => 'constraint',
				'_type' => 'has',
				'_parent' => @now,
				'_owner' => $reference.val,
				'_value' => $value.val
			}
		}
	|	reference binary_comp comp_value
		{
			$key = $reference.val
			$val = { '_context' => 'constraint', '_type' => $binary_comp.text, '_value' => $comp_value.val }
		}
	|	total_constraint
	;

total_constraint
	:	'total(' total_statement ')' binary_comp NUMBER
	;

total_statement
	:	reference equals_op value
	;

comp_value returns [val]
	:	NUMBER
		{	$val = $NUMBER.text.to_i	}
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
		conditional_constraint_if_part
		conditional_constraint_then_part
		{	$val = self.goto_parent()	}
	;

conditional_constraint_if_part
	:	constraint_statement NL*
		{
			id = self.next_id
			@now[id] = { '_parent' => @now,
				'_context' => 'constraint',
				'_type' => 'not'
			}
			@now[id][$constraint_statement.key] = $constraint_statement.val
		}
	|	'{'
		{
			id = self.next_id
			@now[id] = self.create_constraint(id, 'not')
			@now = @now[id]
		}
		NL+ constraint_body
		'}' NL*
		{	self.goto_parent() }
	;

conditional_constraint_then_part
	:	'then' constraint_statement
		{
			id = self.next_id
			@now[id] = { '_parent' => @now,
				'_context' => 'constraint',
				'_type' => 'and'
			}
			@now[id][$constraint_statement.key] = $constraint_statement.val
		}
	|	'then'
		{
			id = self.next_id
			@now[id] = { '_parent' => @now,
				'_context' => 'constraint',
				'_type' => 'and'
			}
			@now = @now[id]
		}
		'{' NL+ constraint_body '}'
		{	self.goto_parent()	}
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
				'_value' => $NUMBER.text.to_i
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
		(set_item (',' NL* set_item)*)?
		{	$val = @set	}
		')'
	;

set_item
	:	value
		{	@set.push($value.val)	}
	;

value returns [val, type]
	:	primitive_value
		{
			$val = $primitive_value.val
			$type = $primitive_value.type
		}
	|	reference
		{
			$val = $reference.val
			$type = 'Reference'
		}
	|	set_value
		{
			$val = $set_value.val
			$type = 'Set'
		}
	;

primitive_value returns [val, type]
	:	BOOLEAN
		{
			if $BOOLEAN.text == 'true' or $BOOLEAN.text == 'on' or $BOOLEAN.text == 'yes'
				$val = true
			else  # 'false', 'no', 'off'
				$val = false
			end
			$type = 'Boolean'
		}
	|	NUMBER
		{
			$val = $NUMBER.text.to_i
			$type = 'Number'
		}
	|	STRING
		{
			$val = $STRING.text[1,$STRING.text.length-2]
			$type = 'String'
		}
	|	MULTILINE_STRING
		{
			$val = $MULTILINE_STRING.text[2, $MULTILINE_STRING.text.length-2]
			$type = 'String'
		}
	;

path
	:	ID('.'ID)*
	;

path_with_index
	:	id_ref('.'id_ref)*
	;

id_ref
	:	ID('[' NUMBER ']')?
	;

reference returns [val]
	:	path_with_index
		{	$val = self.to_ref($path_with_index.text)	}
	;

reference_type returns [val]
	:	'isref' path
		{
			$val = { '_context' => 'null',
				'_isa' => self.to_ref($path.text)
			}
		}
	;

set_type returns [val]
	:	'isset' path
		{
			$val = { '_context' => 'set',
				'_isa' => self.to_ref($path.text),
				'_values' => []
			}
		}
	;

probability_op
	:	'either'
	;

equals_op
	:	'='
	|	'is'
	;

not_equals_op
	:	'!='
	|	'isnt'
	|	'isnot'
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
	|	'nil'
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
	;

/*NUMBER
	:	'-'?('0'..'9')+
	|	'-'?('0'..'9')+'.'('0'..'9')* EXPONENT?
	|	'-'?'.'('0'..'9')+ EXPONENT?
	|	'-'?('0'..'9')+ EXPONENT
	;*/

COMMENT
	:	'//' ~('\n'|'\r')* {$channel=HIDDEN;}
	|	'#' ~('\n'|'\r')* {$channel=HIDDEN;}
	|	'/*' ( options {greedy=false;} : . )* '*/' {$channel=HIDDEN;}
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
