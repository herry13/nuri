grammar SFP;

options {
	language = Ruby;
	output = AST;
}

@header {


}

@members {
	attr_accessor :data

	def init
		@data = 'module Accessor
	def attr(name, val=nil)
		if val == nil
			code = "def #{name} (s=nil)
				@#{name} = s || @#{name}
			end"
		elsif val.class == String
			code = "def #{name} (s=nil)
				@#{name} = s || @#{name} || '#{val}'
			end"
		else
			code = "def #{name} (s=nil)
				@#{name} = s || @#{name} || #{val}
			end"
		end
		class_eval code
	end
end

'
	end
}

sfp	:	{ self.init }
		class_def
	;

class_def
	:	'class' ID{ @data += "class " + $ID.text +
			"\n	extend Accessor"}((':' nl)('\t'class_attr)+)?
		nl+
	;

class_attr
	:	ID equals_op value nl
	|	ID 'isa' reference nl
	|	ID 'isref' reference nl
	;

equals_op
	:	'is'
	|	'='
	;

value
	:	BOOLEAN
	|	reference
	;

reference
	:	ID('.'ID)*
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

/*NL	:	'\r'? '\n' { @data += "\n" }*/
nl	:	'\r'? '\n' { @data += "\n" }
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
