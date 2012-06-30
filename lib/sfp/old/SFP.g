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

	@anonymous_id
	@missing_reftype

	# this method should be called first before starting the parser
	def init
		@root = Sfplanner::Lang::Context.new("root")
		@now = @root
		@missing_reftype = Hash.new
		@anonymous_id = 0
	end

	def next_anonymous_id
		@anonymous_id += 1
		return @anonymous_id
	end

	def get_string(str)
		return str.text[ 1, str.text.length-2 ]
	end

	def copyXtoY(x, y, is_object=false)
		x.attributes.each { |key,value|
			#y.attributes[key] = (value.is_a?(Sfplanner::Lang::Context) ? value.clone : value)
			y.attributes[key] = value
			if y.attributes[key].is_a?(Sfplanner::Lang::ContextReferenceType) and is_object #y.is_a?(ContextObject)
				y.attributes[key] = Sfplanner::Lang::ContextNull(key, y, y.attributes[key].supertype)
			end
		}
	end

	def resolve_missing_reftype
		@missing_reftype.each { |ref,value|
			value.supertype = @root.get(ref)
		}
	end
}

sfp
	:	NL* include* header* (state | composite)?
		{ resolve_missing_reftype }
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
			@now.set('init', Sfplanner::Lang::ContextState.new('init', @now))
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
			@now.set($ID.text, Sfplanner::Lang::ContextClass.new($ID.text, @now))
			@now = @now.get($ID.text)
		}
		(extends_class
			{
				@now.supertype = $extends_class.value
				copyXtoY(@now.supertype, @now)
			}
		)?
		('{' NL* ( attribute | action )* '}')? NL*
		{  @now = @now.owner  }
	;
	
extends_class returns [ value ]
	:	'extends' path
		{
			c = @root.get($path.text)
			if c == nil
				raise 'undefined super class "' + $path.text + '"'
			else
				$value = @root.get($path.text)
			end
		}
	;

attribute
	:	ID
		(	value { @now.set($ID.text, $value.val) }
		|	reference_type { @now.set($ID.text, $reference_type.value) }
		)
		NL+
	|	object_def NL+
	;

object_def
  : ID 'as' path
	{
		c = @root.get($path.text)
		if c.is_a?(Sfplanner::Lang::ContextClass)
			@now.set($ID.text, c.new_object($ID.text, @now))
			@now = @now.get($ID.text)
		elsif c.is_a?(Sfplanner::Lang::ContextObject)
			c = c.clone
			c.name = $ID.text
			c.owner = @now
			@now.set($ID.text, c)
			@now = c
		else
			raise 'undefined super class "' + $path.text + '"'
		end
	}
	('{' NL* ( object_attribute | state_dependency )* '}')?
	{	@now = @now.owner  }
  ;

object_attribute
	:	attribute
	|	ID NULL { @now.set($ID.text, Sfplanner::Lang::ContextNull.new('null', @now)) } NL+
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
			@now.set($ID.text, Sfplanner::Lang::ContextAction.new($ID.text, @now))
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
		{
			@now.set($ID.text, $reference_type.value)
		}
	;

precondition
	:	'precondition'
		{
			@now.set('precondition', Sfplanner::Lang::ContextConstraint.new('precondition', @now))
			@now = @now.get('precondition')
		}
		'{' NL* constraint_body '}' NL+
		{ @now = @now.owner }
	;

postcondition
	:	'postcondition'
		{
			@now.set('postcondition', Sfplanner::Lang::ContextMutation.new('postcondition', @now))
			@now = @now.get('postcondition')
		}
		'{' NL* postcondition_body '}' NL+
		{ @now = @now.owner }
	;

constraint
	:	'constraint' ID 
		{
			@now.set($ID.text, Sfplanner::Lang::ContextConstraint.new($ID.text, @now))
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
	|	reference NULL  { @now.set($reference.text, Sfplanner::Lang::ContextNull.new('null', @now)) }
	|	reference 'not' value { @now.set($reference.text, Sfplanner::Lang::ContextNot.new(@now, $value.val)) }
	|	reference 'in' set_value { @now.set($reference.text, Sfplanner::Lang::ContextIn.new(@now, $set_value.val)) }
	|	conditional_constraint
	|	reference '<' comp_value
			{ @now.set($reference.text, Sfplanner::Lang::ContextLess.new(@now, $comp_value.value)) }
	|	reference '<=' comp_value
			{ @now.set($reference.text, Sfplanner::Lang::ContextLessEquals.new(@now, $comp_value.value)) }
	|	reference '>=' comp_value
			{ @now.set($reference.text, Sfplanner::Lang::ContextGreaterEquals.new(@now, $comp_value.value)) }
	|	reference '>' comp_value
			{ @now.set($reference.text, Sfplanner::Lang::ContextGreater.new(@now, $comp_value.value)) }
	;

comp_value returns [ value ]
	:	INTEGER   { $value = $INTEGER.text.to_i }
	|	reference { $value = Sfplanner::Lang::Reference.new($reference.text) }
	;

conditional_constraint
	:	'if'
		{
			id = next_anonymous_id.to_s
			@now.set(id, Sfplanner::Lang::ContextConditional.new(@now))
			@now = @now.get(id)
			@now.if_clause = true
		}
		constraint_statement NL* conditional_constraint_then
		{	@now = @now.owner  }
	;

conditional_constraint_then
	:	'then' { @now.if_clause = false } constraint_statement
	;

postcondition_body
	:	(mutation_statement NL+)*
	;

mutation_statement
	:	reference value { @now.set($reference.text, $value.val) }
	|	reference NULL  { @now.set($reference.text, Sfplanner::Lang::ContextNull.new('null')) }
	|	reference '+=' formula_value
			{ @now.set($reference.text, Sfplanner::Lang::ContextBinaryAdd.new(@now, $formula_value.value)) }
	|	reference '-=' formula_value
			{ @now.set($reference.text, Sfplanner::Lang::ContextBinarySubstract.new(@now, $formula_value.value)) }
	|	reference '*=' formula_value
			{ @now.set($reference.text, Sfplanner::Lang::ContextBinaryMultiply.new(@now, $formula_value.value)) }
	|	reference '/=' formula_value
			{ @now.set($reference.text, Sfplanner::Lang::ContextBinaryDivide.new(@now, $formula_value.value)) }
	|	reference formula
			{ @now.set($reference.text, $formula.value) }
	;

formula_value returns [ value ]
	:	INTEGER   { $value = $INTEGER.text.to_i }
	|	reference { $value = Sfplanner::Lang::Reference.new($reference.text) }
	;

formula returns [ value ]
	:	'('
		{
			$value = Sfplanner::Lang::ContextFormula.new(@now)
			@now = $value
		}
		formula_value { @now.add( formula_value.value ) }
		formula_item+
		{	@now = @now.owner  }
		')'
	;

formula_item
	:	formula_op formula_value
		{
			case $formula_op.text
			when '+'
				@now.add( Sfplanner::Lang::ContextAdd(@now, $formula_value.value) )
			when '-'
				@now.add( Sfplanner::Lang::ContextSubstract(@now, $formula_value.value) )
			when '*'
				@now.add( Sfplanner::Lang::ContextMultiply(@now, $formula_value.value) )
			when '/'
				@now.add( Sfplanner::Lang::ContextDivide(@now, $formula_value.value) )
			end
		}
	;

formula_op
	:	'+' | '-' | '*' | '/'
	;

set_value returns [ val ]
	:	{
			$val = Sfplanner::Lang::ContextSet.new(@now)
			@now = $val
		}
		'(' ( set_item (',' set_item)* )? ')'
		{	@now = @now.owner  }
	;

set_item
	:	value { @now.add($value.val) }
	;

value returns [ val ]
	:	primitive_value { $val = $primitive_value.value }
	|	reference { $val = Sfplanner::Lang::Reference.new($reference.text) }
	|	set_value { $val = $set_value.val }
	;

primitive_value returns [ value ]
	:	BOOLEAN { $value = ($BOOLEAN.text == 'true' ? true : false ) }
	|	INTEGER { $value = $INTEGER.text.to_i }
	|	FLOAT   { $value = $FLOAT.text.to_f }
	|	STRING  { $value = $STRING.text[ 1, $STRING.text.length-2 ] }
	;

path
	:	ID('.'ID)*
	;

reference
	:	'$'path
	;

reference_type returns [ value ]
	:	'as' '*'path
		{
			$value = Sfplanner::Lang::ContextReferenceType.new('null', @now, @root.get($path.text))
			if $value.supertype == nil
				@missing_reftype[$path.text] = $value
				#raise 'error undefine class "' + $path.text + '"'
			end
			#puts $path.text + " :: " + @root.get($path.text).to_s
		}
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

INTEGER
    :   '-'?'0'..'9'+
	;

FLOAT
    :   '-'?('0'..'9')+ '.' ('0'..'9')* EXPONENT?
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
