#!/usr/bin/env ruby
#
# SFP.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: SFP.g
# Generated at: 2012-09-03 00:29:41
# 

# ~~~> start load path setup
this_directory = File.expand_path( File.dirname( __FILE__ ) )
$LOAD_PATH.unshift( this_directory ) unless $LOAD_PATH.include?( this_directory )

antlr_load_failed = proc do
  load_path = $LOAD_PATH.map { |dir| '  - ' << dir }.join( $/ )
  raise LoadError, <<-END.strip!
  
Failed to load the ANTLR3 runtime library (version 1.8.11):

Ensure the library has been installed on your system and is available
on the load path. If rubygems is available on your system, this can
be done with the command:
  
  gem install antlr3

Current load path:
#{ load_path }

  END
end

defined?( ANTLR3 ) or begin
  
  # 1: try to load the ruby antlr3 runtime library from the system path
  require 'antlr3'
  
rescue LoadError
  
  # 2: try to load rubygems if it isn't already loaded
  defined?( Gem ) or begin
    require 'rubygems'
  rescue LoadError
    antlr_load_failed.call
  end
  
  # 3: try to activate the antlr3 gem
  begin
    Gem.activate( 'antlr3', '~> 1.8.11' )
  rescue Gem::LoadError
    antlr_load_failed.call
  end
  
  require 'antlr3'
  
end
# <~~~ end load path setup


module SFP
  # TokenData defines all of the token type integer values
  # as constants, which will be included in all 
  # ANTLR-generated recognizers.
  const_defined?( :TokenData ) or TokenData = ANTLR3::TokenScheme.new

  module TokenData

    # define the token constants
    define_tokens( :EXPONENT => 11, :T__29 => 29, :T__28 => 28, :T__27 => 27, 
                   :T__62 => 62, :T__26 => 26, :T__63 => 63, :T__25 => 25, 
                   :T__24 => 24, :T__23 => 23, :T__22 => 22, :T__21 => 21, 
                   :T__20 => 20, :OCTAL_ESC => 17, :T__61 => 61, :ID => 6, 
                   :EOF => -1, :T__60 => 60, :T__55 => 55, :T__19 => 19, 
                   :T__56 => 56, :T__57 => 57, :T__58 => 58, :ESC_SEQ => 14, 
                   :BOOLEAN => 9, :T__51 => 51, :T__52 => 52, :T__18 => 18, 
                   :T__53 => 53, :T__54 => 54, :T__59 => 59, :NL => 4, :COMMENT => 12, 
                   :T__50 => 50, :T__42 => 42, :T__43 => 43, :T__40 => 40, 
                   :T__41 => 41, :T__46 => 46, :T__47 => 47, :T__44 => 44, 
                   :T__45 => 45, :T__48 => 48, :T__49 => 49, :NULL => 8, 
                   :UNICODE_ESC => 16, :NUMBER => 7, :HEX_DIGIT => 15, :MULTILINE_STRING => 10, 
                   :T__30 => 30, :T__31 => 31, :T__32 => 32, :T__33 => 33, 
                   :WS => 13, :T__34 => 34, :T__35 => 35, :T__36 => 36, 
                   :T__37 => 37, :T__38 => 38, :T__39 => 39, :STRING => 5 )
    
  end


  class Lexer < ANTLR3::Lexer
    @grammar_home = SFP
    include TokenData

    
    begin
      generated_using( "SFP.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end
    
    RULE_NAMES   = [ "T__18", "T__19", "T__20", "T__21", "T__22", "T__23", 
                     "T__24", "T__25", "T__26", "T__27", "T__28", "T__29", 
                     "T__30", "T__31", "T__32", "T__33", "T__34", "T__35", 
                     "T__36", "T__37", "T__38", "T__39", "T__40", "T__41", 
                     "T__42", "T__43", "T__44", "T__45", "T__46", "T__47", 
                     "T__48", "T__49", "T__50", "T__51", "T__52", "T__53", 
                     "T__54", "T__55", "T__56", "T__57", "T__58", "T__59", 
                     "T__60", "T__61", "T__62", "T__63", "NULL", "BOOLEAN", 
                     "ID", "NUMBER", "COMMENT", "MULTILINE_STRING", "NL", 
                     "WS", "STRING", "EXPONENT", "HEX_DIGIT", "ESC_SEQ", 
                     "OCTAL_ESC", "UNICODE_ESC" ].freeze
    RULE_METHODS = [ :t__18!, :t__19!, :t__20!, :t__21!, :t__22!, :t__23!, 
                     :t__24!, :t__25!, :t__26!, :t__27!, :t__28!, :t__29!, 
                     :t__30!, :t__31!, :t__32!, :t__33!, :t__34!, :t__35!, 
                     :t__36!, :t__37!, :t__38!, :t__39!, :t__40!, :t__41!, 
                     :t__42!, :t__43!, :t__44!, :t__45!, :t__46!, :t__47!, 
                     :t__48!, :t__49!, :t__50!, :t__51!, :t__52!, :t__53!, 
                     :t__54!, :t__55!, :t__56!, :t__57!, :t__58!, :t__59!, 
                     :t__60!, :t__61!, :t__62!, :t__63!, :null!, :boolean!, 
                     :id!, :number!, :comment!, :multiline_string!, :nl!, 
                     :ws!, :string!, :exponent!, :hex_digit!, :esc_seq!, 
                     :octal_esc!, :unicode_esc! ].freeze

    
    def initialize( input=nil, options = {} )
      super( input, options )

    end
    
    
    # - - - - - - - - - - - lexer rules - - - - - - - - - - - -
    # lexer rule t__18! (T__18)
    # (in SFP.g)
    def t__18!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )

      type = T__18
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 7:9: 'include'
      match( "include" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 1 )

    end

    # lexer rule t__19! (T__19)
    # (in SFP.g)
    def t__19!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )

      type = T__19
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 8:9: 'state'
      match( "state" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 2 )

    end

    # lexer rule t__20! (T__20)
    # (in SFP.g)
    def t__20!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )

      type = T__20
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 9:9: '{'
      match( 0x7b )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 3 )

    end

    # lexer rule t__21! (T__21)
    # (in SFP.g)
    def t__21!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )

      type = T__21
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 10:9: '}'
      match( 0x7d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 4 )

    end

    # lexer rule t__22! (T__22)
    # (in SFP.g)
    def t__22!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )

      type = T__22
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 11:9: 'composite'
      match( "composite" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 5 )

    end

    # lexer rule t__23! (T__23)
    # (in SFP.g)
    def t__23!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )

      type = T__23
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 12:9: 'class'
      match( "class" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 6 )

    end

    # lexer rule t__24! (T__24)
    # (in SFP.g)
    def t__24!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )

      type = T__24
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 13:9: 'extends'
      match( "extends" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 7 )

    end

    # lexer rule t__25! (T__25)
    # (in SFP.g)
    def t__25!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )

      type = T__25
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 14:9: 'isa'
      match( "isa" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 8 )

    end

    # lexer rule t__26! (T__26)
    # (in SFP.g)
    def t__26!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )

      type = T__26
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 15:9: '['
      match( 0x5b )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 9 )

    end

    # lexer rule t__27! (T__27)
    # (in SFP.g)
    def t__27!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )

      type = T__27
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 16:9: ']'
      match( 0x5d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 10 )

    end

    # lexer rule t__28! (T__28)
    # (in SFP.g)
    def t__28!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )

      type = T__28
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 17:9: 'if'
      match( "if" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 11 )

    end

    # lexer rule t__29! (T__29)
    # (in SFP.g)
    def t__29!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )

      type = T__29
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 18:9: 'then'
      match( "then" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 12 )

    end

    # lexer rule t__30! (T__30)
    # (in SFP.g)
    def t__30!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )

      type = T__30
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 19:9: 'or'
      match( "or" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 13 )

    end

    # lexer rule t__31! (T__31)
    # (in SFP.g)
    def t__31!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )

      type = T__31
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 20:9: 'operator'
      match( "operator" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 14 )

    end

    # lexer rule t__32! (T__32)
    # (in SFP.g)
    def t__32!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )

      type = T__32
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 21:9: 'cost'
      match( "cost" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 15 )

    end

    # lexer rule t__33! (T__33)
    # (in SFP.g)
    def t__33!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )

      type = T__33
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 22:9: 'conditions'
      match( "conditions" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 16 )

    end

    # lexer rule t__34! (T__34)
    # (in SFP.g)
    def t__34!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )

      type = T__34
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 23:9: 'effects'
      match( "effects" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 17 )

    end

    # lexer rule t__35! (T__35)
    # (in SFP.g)
    def t__35!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )

      type = T__35
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 24:9: 'procedure'
      match( "procedure" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 18 )

    end

    # lexer rule t__36! (T__36)
    # (in SFP.g)
    def t__36!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )

      type = T__36
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 25:9: '('
      match( 0x28 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 19 )

    end

    # lexer rule t__37! (T__37)
    # (in SFP.g)
    def t__37!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )

      type = T__37
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 26:9: ','
      match( 0x2c )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 20 )

    end

    # lexer rule t__38! (T__38)
    # (in SFP.g)
    def t__38!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )

      type = T__38
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 27:9: ')'
      match( 0x29 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 21 )

    end

    # lexer rule t__39! (T__39)
    # (in SFP.g)
    def t__39!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )

      type = T__39
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 28:9: 'areall'
      match( "areall" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 22 )

    end

    # lexer rule t__40! (T__40)
    # (in SFP.g)
    def t__40!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )

      type = T__40
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 29:9: 'constraint'
      match( "constraint" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 23 )

    end

    # lexer rule t__41! (T__41)
    # (in SFP.g)
    def t__41!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )

      type = T__41
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 30:9: 'foreach'
      match( "foreach" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 24 )

    end

    # lexer rule t__42! (T__42)
    # (in SFP.g)
    def t__42!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )

      type = T__42
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 31:9: 'as'
      match( "as" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 25 )

    end

    # lexer rule t__43! (T__43)
    # (in SFP.g)
    def t__43!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )

      type = T__43
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 32:9: 'is'
      match( "is" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 26 )

    end

    # lexer rule t__44! (T__44)
    # (in SFP.g)
    def t__44!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )

      type = T__44
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 33:9: 'in'
      match( "in" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 27 )

    end

    # lexer rule t__45! (T__45)
    # (in SFP.g)
    def t__45!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )

      type = T__45
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 34:9: 'isnt'
      match( "isnt" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 28 )

    end

    # lexer rule t__46! (T__46)
    # (in SFP.g)
    def t__46!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )

      type = T__46
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 35:9: 'not'
      match( "not" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 29 )

    end

    # lexer rule t__47! (T__47)
    # (in SFP.g)
    def t__47!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )

      type = T__47
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 36:9: 'total('
      match( "total(" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 30 )

    end

    # lexer rule t__48! (T__48)
    # (in SFP.g)
    def t__48!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )

      type = T__48
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 37:9: 'new'
      match( "new" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 31 )

    end

    # lexer rule t__49! (T__49)
    # (in SFP.g)
    def t__49!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )

      type = T__49
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 38:9: 'delete'
      match( "delete" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 32 )

    end

    # lexer rule t__50! (T__50)
    # (in SFP.g)
    def t__50!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )

      type = T__50
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 39:9: 'add('
      match( "add(" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 33 )

    end

    # lexer rule t__51! (T__51)
    # (in SFP.g)
    def t__51!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )

      type = T__51
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 40:9: 'remove('
      match( "remove(" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 34 )

    end

    # lexer rule t__52! (T__52)
    # (in SFP.g)
    def t__52!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )

      type = T__52
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 41:9: '.'
      match( 0x2e )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 35 )

    end

    # lexer rule t__53! (T__53)
    # (in SFP.g)
    def t__53!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )

      type = T__53
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 42:9: 'isref'
      match( "isref" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 36 )

    end

    # lexer rule t__54! (T__54)
    # (in SFP.g)
    def t__54!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )

      type = T__54
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 43:9: '='
      match( 0x3d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 37 )

    end

    # lexer rule t__55! (T__55)
    # (in SFP.g)
    def t__55!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )

      type = T__55
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 44:9: '!='
      match( "!=" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 38 )

    end

    # lexer rule t__56! (T__56)
    # (in SFP.g)
    def t__56!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )

      type = T__56
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 45:9: '+='
      match( "+=" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 39 )

    end

    # lexer rule t__57! (T__57)
    # (in SFP.g)
    def t__57!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )

      type = T__57
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 46:9: '-='
      match( "-=" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 40 )

    end

    # lexer rule t__58! (T__58)
    # (in SFP.g)
    def t__58!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )

      type = T__58
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 47:9: '*='
      match( "*=" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 41 )

    end

    # lexer rule t__59! (T__59)
    # (in SFP.g)
    def t__59!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )

      type = T__59
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 48:9: '/='
      match( "/=" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 42 )

    end

    # lexer rule t__60! (T__60)
    # (in SFP.g)
    def t__60!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )

      type = T__60
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 49:9: '>'
      match( 0x3e )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 43 )

    end

    # lexer rule t__61! (T__61)
    # (in SFP.g)
    def t__61!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )

      type = T__61
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 50:9: '>='
      match( ">=" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 44 )

    end

    # lexer rule t__62! (T__62)
    # (in SFP.g)
    def t__62!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )

      type = T__62
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 51:9: '<'
      match( 0x3c )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 45 )

    end

    # lexer rule t__63! (T__63)
    # (in SFP.g)
    def t__63!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )

      type = T__63
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 52:9: '<='
      match( "<=" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 46 )

    end

    # lexer rule null! (NULL)
    # (in SFP.g)
    def null!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 47 )

      type = NULL
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 664:2: ( 'null' | 'nil' )
      alt_1 = 2
      look_1_0 = @input.peek( 1 )

      if ( look_1_0 == 0x6e )
        look_1_1 = @input.peek( 2 )

        if ( look_1_1 == 0x75 )
          alt_1 = 1
        elsif ( look_1_1 == 0x69 )
          alt_1 = 2
        else
          raise NoViableAlternative( "", 1, 1 )
        end
      else
        raise NoViableAlternative( "", 1, 0 )
      end
      case alt_1
      when 1
        # at line 664:4: 'null'
        match( "null" )

      when 2
        # at line 665:4: 'nil'
        match( "nil" )

      end
      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 47 )

    end

    # lexer rule boolean! (BOOLEAN)
    # (in SFP.g)
    def boolean!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 48 )

      type = BOOLEAN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 669:2: ( 'true' | 'false' | 'off' | 'on' | 'yes' | 'no' )
      alt_2 = 6
      case look_2 = @input.peek( 1 )
      when 0x74 then alt_2 = 1
      when 0x66 then alt_2 = 2
      when 0x6f then look_2_3 = @input.peek( 2 )

      if ( look_2_3 == 0x66 )
        alt_2 = 3
      elsif ( look_2_3 == 0x6e )
        alt_2 = 4
      else
        raise NoViableAlternative( "", 2, 3 )
      end
      when 0x79 then alt_2 = 5
      when 0x6e then alt_2 = 6
      else
        raise NoViableAlternative( "", 2, 0 )
      end
      case alt_2
      when 1
        # at line 669:4: 'true'
        match( "true" )

      when 2
        # at line 670:4: 'false'
        match( "false" )

      when 3
        # at line 671:4: 'off'
        match( "off" )

      when 4
        # at line 672:4: 'on'
        match( "on" )

      when 5
        # at line 673:4: 'yes'
        match( "yes" )

      when 6
        # at line 674:4: 'no'
        match( "no" )

      end
      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 48 )

    end

    # lexer rule id! (ID)
    # (in SFP.g)
    def id!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 49 )

      type = ID
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 677:6: ( 'a' .. 'z' | 'A' .. 'Z' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' | '-' )*
      if @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek( 1 ).between?( 0x61, 0x7a )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end


      # at line 677:26: ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' | '-' )*
      while true # decision 3
        alt_3 = 2
        look_3_0 = @input.peek( 1 )

        if ( look_3_0 == 0x2d || look_3_0.between?( 0x30, 0x39 ) || look_3_0.between?( 0x41, 0x5a ) || look_3_0 == 0x5f || look_3_0.between?( 0x61, 0x7a ) )
          alt_3 = 1

        end
        case alt_3
        when 1
          # at line 
          if @input.peek(1) == 0x2d || @input.peek( 1 ).between?( 0x30, 0x39 ) || @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek(1) == 0x5f || @input.peek( 1 ).between?( 0x61, 0x7a )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse
          end



        else
          break # out of loop for decision 3
        end
      end # loop for decision 3

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 49 )

    end

    # lexer rule number! (NUMBER)
    # (in SFP.g)
    def number!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 50 )

      type = NUMBER
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 681:2: ( ( '-' )? ( '0' .. '9' )+ | ( '-' )? ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )? | ( '-' )? '.' ( '0' .. '9' )+ ( EXPONENT )? | ( '-' )? ( '0' .. '9' )+ EXPONENT )
      alt_15 = 4
      alt_15 = @dfa15.predict( @input )
      case alt_15
      when 1
        # at line 681:4: ( '-' )? ( '0' .. '9' )+
        # at line 681:4: ( '-' )?
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0 == 0x2d )
          alt_4 = 1
        end
        case alt_4
        when 1
          # at line 681:4: '-'
          match( 0x2d )

        end
        # at file 681:8: ( '0' .. '9' )+
        match_count_5 = 0
        while true
          alt_5 = 2
          look_5_0 = @input.peek( 1 )

          if ( look_5_0.between?( 0x30, 0x39 ) )
            alt_5 = 1

          end
          case alt_5
          when 1
            # at line 681:9: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            match_count_5 > 0 and break
            eee = EarlyExit(5)


            raise eee
          end
          match_count_5 += 1
        end


      when 2
        # at line 682:4: ( '-' )? ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )?
        # at line 682:4: ( '-' )?
        alt_6 = 2
        look_6_0 = @input.peek( 1 )

        if ( look_6_0 == 0x2d )
          alt_6 = 1
        end
        case alt_6
        when 1
          # at line 682:4: '-'
          match( 0x2d )

        end
        # at file 682:8: ( '0' .. '9' )+
        match_count_7 = 0
        while true
          alt_7 = 2
          look_7_0 = @input.peek( 1 )

          if ( look_7_0.between?( 0x30, 0x39 ) )
            alt_7 = 1

          end
          case alt_7
          when 1
            # at line 682:9: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            match_count_7 > 0 and break
            eee = EarlyExit(7)


            raise eee
          end
          match_count_7 += 1
        end

        match( 0x2e )
        # at line 682:22: ( '0' .. '9' )*
        while true # decision 8
          alt_8 = 2
          look_8_0 = @input.peek( 1 )

          if ( look_8_0.between?( 0x30, 0x39 ) )
            alt_8 = 1

          end
          case alt_8
          when 1
            # at line 682:23: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            break # out of loop for decision 8
          end
        end # loop for decision 8
        # at line 682:34: ( EXPONENT )?
        alt_9 = 2
        look_9_0 = @input.peek( 1 )

        if ( look_9_0 == 0x45 || look_9_0 == 0x65 )
          alt_9 = 1
        end
        case alt_9
        when 1
          # at line 682:34: EXPONENT
          exponent!

        end

      when 3
        # at line 683:4: ( '-' )? '.' ( '0' .. '9' )+ ( EXPONENT )?
        # at line 683:4: ( '-' )?
        alt_10 = 2
        look_10_0 = @input.peek( 1 )

        if ( look_10_0 == 0x2d )
          alt_10 = 1
        end
        case alt_10
        when 1
          # at line 683:4: '-'
          match( 0x2d )

        end
        match( 0x2e )
        # at file 683:11: ( '0' .. '9' )+
        match_count_11 = 0
        while true
          alt_11 = 2
          look_11_0 = @input.peek( 1 )

          if ( look_11_0.between?( 0x30, 0x39 ) )
            alt_11 = 1

          end
          case alt_11
          when 1
            # at line 683:12: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            match_count_11 > 0 and break
            eee = EarlyExit(11)


            raise eee
          end
          match_count_11 += 1
        end

        # at line 683:23: ( EXPONENT )?
        alt_12 = 2
        look_12_0 = @input.peek( 1 )

        if ( look_12_0 == 0x45 || look_12_0 == 0x65 )
          alt_12 = 1
        end
        case alt_12
        when 1
          # at line 683:23: EXPONENT
          exponent!

        end

      when 4
        # at line 684:4: ( '-' )? ( '0' .. '9' )+ EXPONENT
        # at line 684:4: ( '-' )?
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0 == 0x2d )
          alt_13 = 1
        end
        case alt_13
        when 1
          # at line 684:4: '-'
          match( 0x2d )

        end
        # at file 684:8: ( '0' .. '9' )+
        match_count_14 = 0
        while true
          alt_14 = 2
          look_14_0 = @input.peek( 1 )

          if ( look_14_0.between?( 0x30, 0x39 ) )
            alt_14 = 1

          end
          case alt_14
          when 1
            # at line 684:9: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            match_count_14 > 0 and break
            eee = EarlyExit(14)


            raise eee
          end
          match_count_14 += 1
        end

        exponent!

      end
      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 50 )

    end

    # lexer rule comment! (COMMENT)
    # (in SFP.g)
    def comment!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 51 )

      type = COMMENT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 688:2: ( '//' (~ ( '\\n' | '\\r' ) )* | '#' (~ ( '\\n' | '\\r' ) )* | '/*' ( options {greedy=false; } : . )* '*/' )
      alt_19 = 3
      look_19_0 = @input.peek( 1 )

      if ( look_19_0 == 0x2f )
        look_19_1 = @input.peek( 2 )

        if ( look_19_1 == 0x2f )
          alt_19 = 1
        elsif ( look_19_1 == 0x2a )
          alt_19 = 3
        else
          raise NoViableAlternative( "", 19, 1 )
        end
      elsif ( look_19_0 == 0x23 )
        alt_19 = 2
      else
        raise NoViableAlternative( "", 19, 0 )
      end
      case alt_19
      when 1
        # at line 688:4: '//' (~ ( '\\n' | '\\r' ) )*
        match( "//" )
        # at line 688:9: (~ ( '\\n' | '\\r' ) )*
        while true # decision 16
          alt_16 = 2
          look_16_0 = @input.peek( 1 )

          if ( look_16_0.between?( 0x0, 0x9 ) || look_16_0.between?( 0xb, 0xc ) || look_16_0.between?( 0xe, 0xffff ) )
            alt_16 = 1

          end
          case alt_16
          when 1
            # at line 688:9: ~ ( '\\n' | '\\r' )
            if @input.peek( 1 ).between?( 0x0, 0x9 ) || @input.peek( 1 ).between?( 0xb, 0xc ) || @input.peek( 1 ).between?( 0xe, 0xff )
              @input.consume
            else
              mse = MismatchedSet( nil )
              recover mse
              raise mse
            end



          else
            break # out of loop for decision 16
          end
        end # loop for decision 16
        # --> action
        channel=HIDDEN;
        # <-- action

      when 2
        # at line 689:4: '#' (~ ( '\\n' | '\\r' ) )*
        match( 0x23 )
        # at line 689:8: (~ ( '\\n' | '\\r' ) )*
        while true # decision 17
          alt_17 = 2
          look_17_0 = @input.peek( 1 )

          if ( look_17_0.between?( 0x0, 0x9 ) || look_17_0.between?( 0xb, 0xc ) || look_17_0.between?( 0xe, 0xffff ) )
            alt_17 = 1

          end
          case alt_17
          when 1
            # at line 689:8: ~ ( '\\n' | '\\r' )
            if @input.peek( 1 ).between?( 0x0, 0x9 ) || @input.peek( 1 ).between?( 0xb, 0xc ) || @input.peek( 1 ).between?( 0xe, 0xff )
              @input.consume
            else
              mse = MismatchedSet( nil )
              recover mse
              raise mse
            end



          else
            break # out of loop for decision 17
          end
        end # loop for decision 17
        # --> action
        channel=HIDDEN;
        # <-- action

      when 3
        # at line 690:4: '/*' ( options {greedy=false; } : . )* '*/'
        match( "/*" )
        # at line 690:9: ( options {greedy=false; } : . )*
        while true # decision 18
          alt_18 = 2
          look_18_0 = @input.peek( 1 )

          if ( look_18_0 == 0x2a )
            look_18_1 = @input.peek( 2 )

            if ( look_18_1 == 0x2f )
              alt_18 = 2
            elsif ( look_18_1.between?( 0x0, 0x2e ) || look_18_1.between?( 0x30, 0xffff ) )
              alt_18 = 1

            end
          elsif ( look_18_0.between?( 0x0, 0x29 ) || look_18_0.between?( 0x2b, 0xffff ) )
            alt_18 = 1

          end
          case alt_18
          when 1
            # at line 690:37: .
            match_any

          else
            break # out of loop for decision 18
          end
        end # loop for decision 18
        match( "*/" )
        # --> action
        channel=HIDDEN;
        # <-- action

      end
      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 51 )

    end

    # lexer rule multiline_string! (MULTILINE_STRING)
    # (in SFP.g)
    def multiline_string!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 52 )

      type = MULTILINE_STRING
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 694:4: 'r\"' ( options {greedy=false; } : . )* '\"'
      match( "r\"" )
      # at line 694:9: ( options {greedy=false; } : . )*
      while true # decision 20
        alt_20 = 2
        look_20_0 = @input.peek( 1 )

        if ( look_20_0 == 0x22 )
          alt_20 = 2
        elsif ( look_20_0.between?( 0x0, 0x21 ) || look_20_0.between?( 0x23, 0xffff ) )
          alt_20 = 1

        end
        case alt_20
        when 1
          # at line 694:37: .
          match_any

        else
          break # out of loop for decision 20
        end
      end # loop for decision 20
      match( 0x22 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 52 )

    end

    # lexer rule nl! (NL)
    # (in SFP.g)
    def nl!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 53 )

      type = NL
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 697:6: ( '\\r' )? '\\n'
      # at line 697:6: ( '\\r' )?
      alt_21 = 2
      look_21_0 = @input.peek( 1 )

      if ( look_21_0 == 0xd )
        alt_21 = 1
      end
      case alt_21
      when 1
        # at line 697:6: '\\r'
        match( 0xd )

      end
      match( 0xa )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 53 )

    end

    # lexer rule ws! (WS)
    # (in SFP.g)
    def ws!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 54 )

      type = WS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 700:8: ( ' ' | '\\t' )
      if @input.peek(1) == 0x9 || @input.peek(1) == 0x20
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end


      # --> action
      channel=HIDDEN;
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 54 )

    end

    # lexer rule string! (STRING)
    # (in SFP.g)
    def string!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 55 )

      type = STRING
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 704:5: '\"' ( ESC_SEQ | ~ ( '\\\\' | '\"' ) )* '\"'
      match( 0x22 )
      # at line 704:9: ( ESC_SEQ | ~ ( '\\\\' | '\"' ) )*
      while true # decision 22
        alt_22 = 3
        look_22_0 = @input.peek( 1 )

        if ( look_22_0 == 0x5c )
          alt_22 = 1
        elsif ( look_22_0.between?( 0x0, 0x21 ) || look_22_0.between?( 0x23, 0x5b ) || look_22_0.between?( 0x5d, 0xffff ) )
          alt_22 = 2

        end
        case alt_22
        when 1
          # at line 704:11: ESC_SEQ
          esc_seq!

        when 2
          # at line 704:21: ~ ( '\\\\' | '\"' )
          if @input.peek( 1 ).between?( 0x0, 0x21 ) || @input.peek( 1 ).between?( 0x23, 0x5b ) || @input.peek( 1 ).between?( 0x5d, 0xff )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse
          end



        else
          break # out of loop for decision 22
        end
      end # loop for decision 22
      match( 0x22 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 55 )

    end

    # lexer rule exponent! (EXPONENT)
    # (in SFP.g)
    def exponent!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 56 )

      
      # - - - - main rule block - - - -
      # at line 708:12: ( 'e' | 'E' ) ( '+' | '-' )? ( '0' .. '9' )+
      if @input.peek(1) == 0x45 || @input.peek(1) == 0x65
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end


      # at line 708:22: ( '+' | '-' )?
      alt_23 = 2
      look_23_0 = @input.peek( 1 )

      if ( look_23_0 == 0x2b || look_23_0 == 0x2d )
        alt_23 = 1
      end
      case alt_23
      when 1
        # at line 
        if @input.peek(1) == 0x2b || @input.peek(1) == 0x2d
          @input.consume
        else
          mse = MismatchedSet( nil )
          recover mse
          raise mse
        end



      end
      # at file 708:33: ( '0' .. '9' )+
      match_count_24 = 0
      while true
        alt_24 = 2
        look_24_0 = @input.peek( 1 )

        if ( look_24_0.between?( 0x30, 0x39 ) )
          alt_24 = 1

        end
        case alt_24
        when 1
          # at line 708:34: '0' .. '9'
          match_range( 0x30, 0x39 )

        else
          match_count_24 > 0 and break
          eee = EarlyExit(24)


          raise eee
        end
        match_count_24 += 1
      end


    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 56 )

    end

    # lexer rule hex_digit! (HEX_DIGIT)
    # (in SFP.g)
    def hex_digit!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 57 )

      
      # - - - - main rule block - - - -
      # at line 711:13: ( '0' .. '9' | 'a' .. 'f' | 'A' .. 'F' )
      if @input.peek( 1 ).between?( 0x30, 0x39 ) || @input.peek( 1 ).between?( 0x41, 0x46 ) || @input.peek( 1 ).between?( 0x61, 0x66 )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end



    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 57 )

    end

    # lexer rule esc_seq! (ESC_SEQ)
    # (in SFP.g)
    def esc_seq!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 58 )

      
      # - - - - main rule block - - - -
      # at line 715:2: ( '\\\\' ( 'b' | 't' | 'n' | 'f' | 'r' | '\\\"' | '\\'' | '\\\\' ) | UNICODE_ESC | OCTAL_ESC )
      alt_25 = 3
      look_25_0 = @input.peek( 1 )

      if ( look_25_0 == 0x5c )
        case look_25 = @input.peek( 2 )
        when 0x22, 0x27, 0x5c, 0x62, 0x66, 0x6e, 0x72, 0x74 then alt_25 = 1
        when 0x75 then alt_25 = 2
        when 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37 then alt_25 = 3
        else
          raise NoViableAlternative( "", 25, 1 )
        end
      else
        raise NoViableAlternative( "", 25, 0 )
      end
      case alt_25
      when 1
        # at line 715:6: '\\\\' ( 'b' | 't' | 'n' | 'f' | 'r' | '\\\"' | '\\'' | '\\\\' )
        match( 0x5c )
        if @input.peek(1) == 0x22 || @input.peek(1) == 0x27 || @input.peek(1) == 0x5c || @input.peek(1) == 0x62 || @input.peek(1) == 0x66 || @input.peek(1) == 0x6e || @input.peek(1) == 0x72 || @input.peek(1) == 0x74
          @input.consume
        else
          mse = MismatchedSet( nil )
          recover mse
          raise mse
        end



      when 2
        # at line 716:6: UNICODE_ESC
        unicode_esc!

      when 3
        # at line 717:6: OCTAL_ESC
        octal_esc!

      end
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 58 )

    end

    # lexer rule octal_esc! (OCTAL_ESC)
    # (in SFP.g)
    def octal_esc!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 59 )

      
      # - - - - main rule block - - - -
      # at line 722:2: ( '\\\\' ( '0' .. '3' ) ( '0' .. '7' ) ( '0' .. '7' ) | '\\\\' ( '0' .. '7' ) ( '0' .. '7' ) | '\\\\' ( '0' .. '7' ) )
      alt_26 = 3
      look_26_0 = @input.peek( 1 )

      if ( look_26_0 == 0x5c )
        look_26_1 = @input.peek( 2 )

        if ( look_26_1.between?( 0x30, 0x33 ) )
          look_26_2 = @input.peek( 3 )

          if ( look_26_2.between?( 0x30, 0x37 ) )
            look_26_4 = @input.peek( 4 )

            if ( look_26_4.between?( 0x30, 0x37 ) )
              alt_26 = 1
            else
              alt_26 = 2
            end
          else
            alt_26 = 3
          end
        elsif ( look_26_1.between?( 0x34, 0x37 ) )
          look_26_3 = @input.peek( 3 )

          if ( look_26_3.between?( 0x30, 0x37 ) )
            alt_26 = 2
          else
            alt_26 = 3
          end
        else
          raise NoViableAlternative( "", 26, 1 )
        end
      else
        raise NoViableAlternative( "", 26, 0 )
      end
      case alt_26
      when 1
        # at line 722:6: '\\\\' ( '0' .. '3' ) ( '0' .. '7' ) ( '0' .. '7' )
        match( 0x5c )
        # at line 722:11: ( '0' .. '3' )
        # at line 722:12: '0' .. '3'
        match_range( 0x30, 0x33 )

        # at line 722:22: ( '0' .. '7' )
        # at line 722:23: '0' .. '7'
        match_range( 0x30, 0x37 )

        # at line 722:33: ( '0' .. '7' )
        # at line 722:34: '0' .. '7'
        match_range( 0x30, 0x37 )


      when 2
        # at line 723:6: '\\\\' ( '0' .. '7' ) ( '0' .. '7' )
        match( 0x5c )
        # at line 723:11: ( '0' .. '7' )
        # at line 723:12: '0' .. '7'
        match_range( 0x30, 0x37 )

        # at line 723:22: ( '0' .. '7' )
        # at line 723:23: '0' .. '7'
        match_range( 0x30, 0x37 )


      when 3
        # at line 724:6: '\\\\' ( '0' .. '7' )
        match( 0x5c )
        # at line 724:11: ( '0' .. '7' )
        # at line 724:12: '0' .. '7'
        match_range( 0x30, 0x37 )


      end
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 59 )

    end

    # lexer rule unicode_esc! (UNICODE_ESC)
    # (in SFP.g)
    def unicode_esc!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 60 )

      
      # - - - - main rule block - - - -
      # at line 729:6: '\\\\' 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
      match( 0x5c )
      match( 0x75 )
      hex_digit!
      hex_digit!
      hex_digit!
      hex_digit!

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 60 )

    end

    # main rule used to study the input at the current position,
    # and choose the proper lexer rule to call in order to
    # fetch the next token
    # 
    # usually, you don't make direct calls to this method,
    # but instead use the next_token method, which will
    # build and emit the actual next token
    def token!
      # at line 1:8: ( T__18 | T__19 | T__20 | T__21 | T__22 | T__23 | T__24 | T__25 | T__26 | T__27 | T__28 | T__29 | T__30 | T__31 | T__32 | T__33 | T__34 | T__35 | T__36 | T__37 | T__38 | T__39 | T__40 | T__41 | T__42 | T__43 | T__44 | T__45 | T__46 | T__47 | T__48 | T__49 | T__50 | T__51 | T__52 | T__53 | T__54 | T__55 | T__56 | T__57 | T__58 | T__59 | T__60 | T__61 | T__62 | T__63 | NULL | BOOLEAN | ID | NUMBER | COMMENT | MULTILINE_STRING | NL | WS | STRING )
      alt_27 = 55
      alt_27 = @dfa27.predict( @input )
      case alt_27
      when 1
        # at line 1:10: T__18
        t__18!

      when 2
        # at line 1:16: T__19
        t__19!

      when 3
        # at line 1:22: T__20
        t__20!

      when 4
        # at line 1:28: T__21
        t__21!

      when 5
        # at line 1:34: T__22
        t__22!

      when 6
        # at line 1:40: T__23
        t__23!

      when 7
        # at line 1:46: T__24
        t__24!

      when 8
        # at line 1:52: T__25
        t__25!

      when 9
        # at line 1:58: T__26
        t__26!

      when 10
        # at line 1:64: T__27
        t__27!

      when 11
        # at line 1:70: T__28
        t__28!

      when 12
        # at line 1:76: T__29
        t__29!

      when 13
        # at line 1:82: T__30
        t__30!

      when 14
        # at line 1:88: T__31
        t__31!

      when 15
        # at line 1:94: T__32
        t__32!

      when 16
        # at line 1:100: T__33
        t__33!

      when 17
        # at line 1:106: T__34
        t__34!

      when 18
        # at line 1:112: T__35
        t__35!

      when 19
        # at line 1:118: T__36
        t__36!

      when 20
        # at line 1:124: T__37
        t__37!

      when 21
        # at line 1:130: T__38
        t__38!

      when 22
        # at line 1:136: T__39
        t__39!

      when 23
        # at line 1:142: T__40
        t__40!

      when 24
        # at line 1:148: T__41
        t__41!

      when 25
        # at line 1:154: T__42
        t__42!

      when 26
        # at line 1:160: T__43
        t__43!

      when 27
        # at line 1:166: T__44
        t__44!

      when 28
        # at line 1:172: T__45
        t__45!

      when 29
        # at line 1:178: T__46
        t__46!

      when 30
        # at line 1:184: T__47
        t__47!

      when 31
        # at line 1:190: T__48
        t__48!

      when 32
        # at line 1:196: T__49
        t__49!

      when 33
        # at line 1:202: T__50
        t__50!

      when 34
        # at line 1:208: T__51
        t__51!

      when 35
        # at line 1:214: T__52
        t__52!

      when 36
        # at line 1:220: T__53
        t__53!

      when 37
        # at line 1:226: T__54
        t__54!

      when 38
        # at line 1:232: T__55
        t__55!

      when 39
        # at line 1:238: T__56
        t__56!

      when 40
        # at line 1:244: T__57
        t__57!

      when 41
        # at line 1:250: T__58
        t__58!

      when 42
        # at line 1:256: T__59
        t__59!

      when 43
        # at line 1:262: T__60
        t__60!

      when 44
        # at line 1:268: T__61
        t__61!

      when 45
        # at line 1:274: T__62
        t__62!

      when 46
        # at line 1:280: T__63
        t__63!

      when 47
        # at line 1:286: NULL
        null!

      when 48
        # at line 1:291: BOOLEAN
        boolean!

      when 49
        # at line 1:299: ID
        id!

      when 50
        # at line 1:302: NUMBER
        number!

      when 51
        # at line 1:309: COMMENT
        comment!

      when 52
        # at line 1:317: MULTILINE_STRING
        multiline_string!

      when 53
        # at line 1:334: NL
        nl!

      when 54
        # at line 1:337: WS
        ws!

      when 55
        # at line 1:340: STRING
        string!

      end
    end

    
    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA15 < ANTLR3::DFA
      EOT = unpack( 2, -1, 1, 4, 4, -1 )
      EOF = unpack( 7, -1 )
      MIN = unpack( 1, 45, 2, 46, 4, -1 )
      MAX = unpack( 2, 57, 1, 101, 4, -1 )
      ACCEPT = unpack( 3, -1, 1, 3, 1, 1, 1, 2, 1, 4 )
      SPECIAL = unpack( 7, -1 )
      TRANSITION = [
        unpack( 1, 1, 1, 3, 1, -1, 10, 2 ),
        unpack( 1, 3, 1, -1, 10, 2 ),
        unpack( 1, 5, 1, -1, 10, 2, 11, -1, 1, 6, 31, -1, 1, 6 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 15
      

      def description
        <<-'__dfa_description__'.strip!
          680:1: NUMBER : ( ( '-' )? ( '0' .. '9' )+ | ( '-' )? ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )? | ( '-' )? '.' ( '0' .. '9' )+ ( EXPONENT )? | ( '-' )? ( '0' .. '9' )+ EXPONENT );
        __dfa_description__
      end
    end
    class DFA27 < ANTLR3::DFA
      EOT = unpack( 1, -1, 2, 30, 2, -1, 2, 30, 2, -1, 3, 30, 3, -1, 5, 
                    30, 1, 64, 6, -1, 1, 68, 1, 70, 1, 30, 6, -1, 1, 73, 
                    1, 77, 1, 78, 8, 30, 1, 89, 2, 30, 1, 92, 2, 30, 1, 
                    95, 3, 30, 1, 92, 5, 30, 8, -1, 2, 30, 1, -1, 1, 107, 
                    2, 30, 2, -1, 10, 30, 1, -1, 1, 30, 1, 92, 1, -1, 2, 
                    30, 1, -1, 3, 30, 1, 127, 1, 128, 1, 30, 1, 130, 2, 
                    30, 1, 92, 1, 30, 1, -1, 1, 134, 3, 30, 1, 138, 5, 30, 
                    1, 144, 1, 30, 1, 92, 3, 30, 1, -1, 2, 30, 2, -1, 1, 
                    130, 1, -1, 3, 30, 1, -1, 1, 154, 1, 155, 1, 30, 1, 
                    -1, 2, 30, 1, 159, 2, 30, 1, -1, 5, 30, 1, 92, 3, 30, 
                    2, -1, 3, 30, 1, -1, 2, 30, 1, -1, 2, 30, 1, 177, 1, 
                    30, 1, 179, 1, 30, 1, 181, 3, 30, 1, 185, 1, 186, 2, 
                    30, 1, -1, 1, 189, 3, -1, 3, 30, 2, -1, 1, 193, 1, 30, 
                    1, -1, 1, 195, 2, 30, 1, -1, 1, 198, 1, -1, 1, 199, 
                    1, 200, 3, -1 )
      EOF = unpack( 201, -1 )
      MIN = unpack( 1, 9, 1, 102, 1, 116, 2, -1, 1, 108, 1, 102, 2, -1, 
                    1, 104, 1, 102, 1, 114, 3, -1, 1, 100, 1, 97, 2, 101, 
                    1, 34, 1, 48, 3, -1, 1, 46, 1, -1, 1, 42, 2, 61, 1, 
                    101, 6, -1, 3, 45, 1, 97, 1, 109, 1, 97, 1, 116, 1, 
                    102, 1, 101, 1, 116, 1, 117, 1, 45, 1, 101, 1, 102, 
                    1, 45, 1, 111, 1, 101, 1, 45, 1, 100, 1, 114, 1, 108, 
                    1, 45, 1, 119, 3, 108, 1, 109, 8, -1, 1, 115, 1, 108, 
                    1, -1, 1, 45, 1, 116, 1, 101, 2, -1, 1, 116, 1, 112, 
                    1, 116, 1, 100, 1, 115, 2, 101, 1, 110, 1, 97, 1, 101, 
                    1, -1, 1, 114, 1, 45, 1, -1, 1, 99, 1, 97, 1, -1, 1, 
                    40, 1, 101, 1, 115, 2, 45, 1, 108, 1, 45, 1, 101, 1, 
                    111, 1, 45, 1, 117, 1, -1, 1, 45, 1, 102, 1, 101, 1, 
                    111, 1, 45, 1, 105, 1, 116, 1, 115, 1, 110, 1, 99, 1, 
                    45, 1, 108, 1, 45, 1, 97, 1, 101, 1, 108, 1, -1, 1, 
                    97, 1, 101, 2, -1, 1, 45, 1, -1, 1, 116, 1, 118, 1, 
                    100, 1, -1, 2, 45, 1, 115, 1, -1, 1, 116, 1, 114, 1, 
                    45, 1, 100, 1, 116, 1, -1, 1, 40, 1, 116, 1, 100, 1, 
                    108, 1, 99, 1, 45, 3, 101, 2, -1, 2, 105, 1, 97, 1, 
                    -1, 2, 115, 1, -1, 1, 111, 1, 117, 1, 45, 1, 104, 1, 
                    45, 1, 40, 1, 45, 1, 116, 1, 111, 1, 105, 2, 45, 2, 
                    114, 1, -1, 1, 45, 3, -1, 1, 101, 2, 110, 2, -1, 1, 
                    45, 1, 101, 1, -1, 1, 45, 1, 115, 1, 116, 1, -1, 1, 
                    45, 1, -1, 2, 45, 3, -1 )
      MAX = unpack( 1, 125, 1, 115, 1, 116, 2, -1, 1, 111, 1, 120, 2, -1, 
                    3, 114, 3, -1, 1, 115, 1, 111, 1, 117, 2, 101, 1, 57, 
                    3, -1, 1, 61, 1, -1, 3, 61, 1, 101, 6, -1, 3, 122, 1, 
                    97, 1, 115, 1, 97, 1, 116, 1, 102, 1, 101, 1, 116, 1, 
                    117, 1, 122, 1, 101, 1, 102, 1, 122, 1, 111, 1, 101, 
                    1, 122, 1, 100, 1, 114, 1, 108, 1, 122, 1, 119, 3, 108, 
                    1, 109, 8, -1, 1, 115, 1, 108, 1, -1, 1, 122, 1, 116, 
                    1, 101, 2, -1, 1, 116, 1, 112, 1, 116, 2, 115, 2, 101, 
                    1, 110, 1, 97, 1, 101, 1, -1, 1, 114, 1, 122, 1, -1, 
                    1, 99, 1, 97, 1, -1, 1, 40, 1, 101, 1, 115, 2, 122, 
                    1, 108, 1, 122, 1, 101, 1, 111, 1, 122, 1, 117, 1, -1, 
                    1, 122, 1, 102, 1, 101, 1, 111, 1, 122, 1, 105, 1, 116, 
                    1, 115, 1, 110, 1, 99, 1, 122, 1, 108, 1, 122, 1, 97, 
                    1, 101, 1, 108, 1, -1, 1, 97, 1, 101, 2, -1, 1, 122, 
                    1, -1, 1, 116, 1, 118, 1, 100, 1, -1, 2, 122, 1, 115, 
                    1, -1, 1, 116, 1, 114, 1, 122, 1, 100, 1, 116, 1, -1, 
                    1, 40, 1, 116, 1, 100, 1, 108, 1, 99, 1, 122, 3, 101, 
                    2, -1, 2, 105, 1, 97, 1, -1, 2, 115, 1, -1, 1, 111, 
                    1, 117, 1, 122, 1, 104, 1, 122, 1, 40, 1, 122, 1, 116, 
                    1, 111, 1, 105, 2, 122, 2, 114, 1, -1, 1, 122, 3, -1, 
                    1, 101, 2, 110, 2, -1, 1, 122, 1, 101, 1, -1, 1, 122, 
                    1, 115, 1, 116, 1, -1, 1, 122, 1, -1, 2, 122, 3, -1 )
      ACCEPT = unpack( 3, -1, 1, 3, 1, 4, 2, -1, 1, 9, 1, 10, 3, -1, 1, 
                       19, 1, 20, 1, 21, 6, -1, 1, 37, 1, 38, 1, 39, 1, 
                       -1, 1, 41, 4, -1, 1, 49, 1, 50, 1, 51, 1, 53, 1, 
                       54, 1, 55, 27, -1, 1, 52, 1, 35, 1, 40, 1, 42, 1, 
                       44, 1, 43, 1, 46, 1, 45, 2, -1, 1, 27, 3, -1, 1, 
                       26, 1, 11, 10, -1, 1, 13, 2, -1, 1, 48, 2, -1, 1, 
                       25, 11, -1, 1, 8, 16, -1, 1, 33, 2, -1, 1, 29, 1, 
                       31, 1, -1, 1, 47, 3, -1, 1, 28, 3, -1, 1, 15, 5, 
                       -1, 1, 12, 9, -1, 1, 36, 1, 2, 3, -1, 1, 6, 2, -1, 
                       1, 30, 14, -1, 1, 22, 1, -1, 1, 32, 1, 34, 1, 1, 
                       3, -1, 1, 7, 1, 17, 2, -1, 1, 24, 3, -1, 1, 14, 1, 
                       -1, 1, 5, 2, -1, 1, 18, 1, 16, 1, 23 )
      SPECIAL = unpack( 201, -1 )
      TRANSITION = [
        unpack( 1, 34, 1, 33, 2, -1, 1, 33, 18, -1, 1, 34, 1, 22, 1, 35, 
                1, 32, 4, -1, 1, 12, 1, 14, 1, 25, 1, 23, 1, 13, 1, 24, 
                1, 20, 1, 26, 10, 31, 2, -1, 1, 28, 1, 21, 1, 27, 2, -1, 
                26, 30, 1, 7, 1, -1, 1, 8, 3, -1, 1, 15, 1, 30, 1, 5, 1, 
                18, 1, 6, 1, 16, 2, 30, 1, 1, 4, 30, 1, 17, 1, 10, 1, 11, 
                1, 30, 1, 19, 1, 2, 1, 9, 4, 30, 1, 29, 1, 30, 1, 3, 1, 
                -1, 1, 4 ),
        unpack( 1, 38, 7, -1, 1, 36, 4, -1, 1, 37 ),
        unpack( 1, 39 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 41, 2, -1, 1, 40 ),
        unpack( 1, 43, 17, -1, 1, 42 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 44, 6, -1, 1, 45, 2, -1, 1, 46 ),
        unpack( 1, 49, 7, -1, 1, 50, 1, -1, 1, 48, 1, -1, 1, 47 ),
        unpack( 1, 51 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 54, 13, -1, 1, 52, 1, 53 ),
        unpack( 1, 56, 13, -1, 1, 55 ),
        unpack( 1, 58, 3, -1, 1, 60, 5, -1, 1, 57, 5, -1, 1, 59 ),
        unpack( 1, 61 ),
        unpack( 1, 63, 66, -1, 1, 62 ),
        unpack( 10, 31 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 31, 1, -1, 10, 31, 3, -1, 1, 65 ),
        unpack(  ),
        unpack( 1, 32, 4, -1, 1, 32, 13, -1, 1, 66 ),
        unpack( 1, 67 ),
        unpack( 1, 69 ),
        unpack( 1, 71 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 2, 30, 1, 72, 23, 30 ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 1, 74, 12, 30, 1, 75, 3, 30, 1, 76, 8, 30 ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack( 1, 79 ),
        unpack( 1, 80, 1, 82, 4, -1, 1, 81 ),
        unpack( 1, 83 ),
        unpack( 1, 84 ),
        unpack( 1, 85 ),
        unpack( 1, 86 ),
        unpack( 1, 87 ),
        unpack( 1, 88 ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack( 1, 90 ),
        unpack( 1, 91 ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack( 1, 93 ),
        unpack( 1, 94 ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack( 1, 96 ),
        unpack( 1, 97 ),
        unpack( 1, 98 ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 19, 30, 1, 99, 6, 30 ),
        unpack( 1, 100 ),
        unpack( 1, 101 ),
        unpack( 1, 102 ),
        unpack( 1, 103 ),
        unpack( 1, 104 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 105 ),
        unpack( 1, 106 ),
        unpack(  ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack( 1, 108 ),
        unpack( 1, 109 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 110 ),
        unpack( 1, 111 ),
        unpack( 1, 112 ),
        unpack( 1, 113, 14, -1, 1, 114 ),
        unpack( 1, 115 ),
        unpack( 1, 116 ),
        unpack( 1, 117 ),
        unpack( 1, 118 ),
        unpack( 1, 119 ),
        unpack( 1, 120 ),
        unpack(  ),
        unpack( 1, 121 ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack(  ),
        unpack( 1, 122 ),
        unpack( 1, 123 ),
        unpack(  ),
        unpack( 1, 124 ),
        unpack( 1, 125 ),
        unpack( 1, 126 ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack( 1, 129 ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack( 1, 131 ),
        unpack( 1, 132 ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack( 1, 133 ),
        unpack(  ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack( 1, 135 ),
        unpack( 1, 136 ),
        unpack( 1, 137 ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack( 1, 139 ),
        unpack( 1, 140 ),
        unpack( 1, 141 ),
        unpack( 1, 142 ),
        unpack( 1, 143 ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack( 1, 145 ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack( 1, 146 ),
        unpack( 1, 147 ),
        unpack( 1, 148 ),
        unpack(  ),
        unpack( 1, 149 ),
        unpack( 1, 150 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack(  ),
        unpack( 1, 151 ),
        unpack( 1, 152 ),
        unpack( 1, 153 ),
        unpack(  ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack( 1, 156 ),
        unpack(  ),
        unpack( 1, 157 ),
        unpack( 1, 158 ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack( 1, 160 ),
        unpack( 1, 161 ),
        unpack(  ),
        unpack( 1, 162 ),
        unpack( 1, 163 ),
        unpack( 1, 164 ),
        unpack( 1, 165 ),
        unpack( 1, 166 ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack( 1, 167 ),
        unpack( 1, 168 ),
        unpack( 1, 169 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 170 ),
        unpack( 1, 171 ),
        unpack( 1, 172 ),
        unpack(  ),
        unpack( 1, 173 ),
        unpack( 1, 174 ),
        unpack(  ),
        unpack( 1, 175 ),
        unpack( 1, 176 ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack( 1, 178 ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack( 1, 180 ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack( 1, 182 ),
        unpack( 1, 183 ),
        unpack( 1, 184 ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack( 1, 187 ),
        unpack( 1, 188 ),
        unpack(  ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 190 ),
        unpack( 1, 191 ),
        unpack( 1, 192 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack( 1, 194 ),
        unpack(  ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack( 1, 196 ),
        unpack( 1, 197 ),
        unpack(  ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack(  ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack( 1, 30, 2, -1, 10, 30, 7, -1, 26, 30, 4, -1, 1, 30, 1, -1, 
                 26, 30 ),
        unpack(  ),
        unpack(  ),
        unpack(  )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 27
      

      def description
        <<-'__dfa_description__'.strip!
          1:1: Tokens : ( T__18 | T__19 | T__20 | T__21 | T__22 | T__23 | T__24 | T__25 | T__26 | T__27 | T__28 | T__29 | T__30 | T__31 | T__32 | T__33 | T__34 | T__35 | T__36 | T__37 | T__38 | T__39 | T__40 | T__41 | T__42 | T__43 | T__44 | T__45 | T__46 | T__47 | T__48 | T__49 | T__50 | T__51 | T__52 | T__53 | T__54 | T__55 | T__56 | T__57 | T__58 | T__59 | T__60 | T__61 | T__62 | T__63 | NULL | BOOLEAN | ID | NUMBER | COMMENT | MULTILINE_STRING | NL | WS | STRING );
        __dfa_description__
      end
    end

    
    private
    
    def initialize_dfas
      super rescue nil
      @dfa15 = DFA15.new( self, 15 )
      @dfa27 = DFA27.new( self, 27 )

    end
  end # class Lexer < ANTLR3::Lexer

  at_exit { Lexer.main( ARGV ) } if __FILE__ == $0
end

