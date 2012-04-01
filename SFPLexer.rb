#!/usr/bin/env ruby
#
# SFP.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: SFP.g
# Generated at: 2012-04-01 04:11:24
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
                   :T__26 => 26, :T__25 => 25, :T__24 => 24, :T__23 => 23, 
                   :T__22 => 22, :T__21 => 21, :T__20 => 20, :OCTAL_ESC => 17, 
                   :FLOAT => 10, :ID => 6, :EOF => -1, :T__19 => 19, :ESC_SEQ => 14, 
                   :BOOLEAN => 9, :T__18 => 18, :NL => 4, :COMMENT => 12, 
                   :T__42 => 42, :INTEGER => 8, :T__43 => 43, :T__40 => 40, 
                   :T__41 => 41, :T__46 => 46, :T__47 => 47, :T__44 => 44, 
                   :T__45 => 45, :T__48 => 48, :T__49 => 49, :UNICODE_ESC => 16, 
                   :NULL => 7, :HEX_DIGIT => 15, :T__30 => 30, :T__31 => 31, 
                   :T__32 => 32, :WS => 13, :T__33 => 33, :T__34 => 34, 
                   :T__35 => 35, :T__36 => 36, :T__37 => 37, :T__38 => 38, 
                   :T__39 => 39, :STRING => 5 )
    
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
                     "T__48", "T__49", "NULL", "BOOLEAN", "ID", "INTEGER", 
                     "FLOAT", "COMMENT", "NL", "WS", "STRING", "EXPONENT", 
                     "HEX_DIGIT", "ESC_SEQ", "OCTAL_ESC", "UNICODE_ESC" ].freeze
    RULE_METHODS = [ :t__18!, :t__19!, :t__20!, :t__21!, :t__22!, :t__23!, 
                     :t__24!, :t__25!, :t__26!, :t__27!, :t__28!, :t__29!, 
                     :t__30!, :t__31!, :t__32!, :t__33!, :t__34!, :t__35!, 
                     :t__36!, :t__37!, :t__38!, :t__39!, :t__40!, :t__41!, 
                     :t__42!, :t__43!, :t__44!, :t__45!, :t__46!, :t__47!, 
                     :t__48!, :t__49!, :null!, :boolean!, :id!, :integer!, 
                     :float!, :comment!, :nl!, :ws!, :string!, :exponent!, 
                     :hex_digit!, :esc_seq!, :octal_esc!, :unicode_esc! ].freeze

    
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
      # at line 7:9: '#include'
      match( "#include" )

      
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
      # at line 8:9: 'file('
      match( "file(" )

      
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
      # at line 9:9: ')'
      match( 0x29 )

      
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
      # at line 10:9: 'url('
      match( "url(" )

      
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
      # at line 12:9: '{'
      match( 0x7b )

      
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
      # at line 13:9: '}'
      match( 0x7d )

      
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
      # at line 14:9: 'class'
      match( "class" )

      
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
      # at line 15:9: 'extends'
      match( "extends" )

      
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
      # at line 16:9: 'as'
      match( "as" )

      
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
      # at line 17:9: 'when'
      match( "when" )

      
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
      # at line 19:9: 'action'
      match( "action" )

      
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
      # at line 20:9: '('
      match( 0x28 )

      
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
      # at line 21:9: ','
      match( 0x2c )

      
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
      # at line 22:9: 'precondition'
      match( "precondition" )

      
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
      # at line 23:9: 'postcondition'
      match( "postcondition" )

      
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
      # at line 24:9: 'constraint'
      match( "constraint" )

      
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
      # at line 25:9: 'not'
      match( "not" )

      
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
      # at line 26:9: 'in'
      match( "in" )

      
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
      # at line 27:9: '<'
      match( 0x3c )

      
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
      # at line 28:9: '<='
      match( "<=" )

      
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
      # at line 29:9: '>='
      match( ">=" )

      
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
      # at line 30:9: '>'
      match( 0x3e )

      
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
      # at line 31:9: 'if'
      match( "if" )

      
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
      # at line 32:9: '+='
      match( "+=" )

      
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
      # at line 33:9: '-='
      match( "-=" )

      
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
      # at line 34:9: '*='
      match( "*=" )

      
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
      # at line 35:9: '/='
      match( "/=" )

      
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
      # at line 36:9: '.'
      match( 0x2e )

      
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
      # at line 37:9: '$'
      match( 0x24 )

      
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
      # at line 38:9: '*'
      match( 0x2a )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 32 )

    end

    # lexer rule null! (NULL)
    # (in SFP.g)
    def null!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )

      type = NULL
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 355:4: 'null'
      match( "null" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 33 )

    end

    # lexer rule boolean! (BOOLEAN)
    # (in SFP.g)
    def boolean!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )

      type = BOOLEAN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 359:2: ( 'true' | 'false' )
      alt_1 = 2
      look_1_0 = @input.peek( 1 )

      if ( look_1_0 == 0x74 )
        alt_1 = 1
      elsif ( look_1_0 == 0x66 )
        alt_1 = 2
      else
        raise NoViableAlternative( "", 1, 0 )
      end
      case alt_1
      when 1
        # at line 359:4: 'true'
        match( "true" )

      when 2
        # at line 360:4: 'false'
        match( "false" )

      end
      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 34 )

    end

    # lexer rule id! (ID)
    # (in SFP.g)
    def id!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )

      type = ID
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 363:7: ( 'a' .. 'z' | 'A' .. 'Z' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' | '-' )*
      if @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek( 1 ).between?( 0x61, 0x7a )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end


      # at line 363:27: ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' | '-' )*
      while true # decision 2
        alt_2 = 2
        look_2_0 = @input.peek( 1 )

        if ( look_2_0 == 0x2d || look_2_0.between?( 0x30, 0x39 ) || look_2_0.between?( 0x41, 0x5a ) || look_2_0 == 0x5f || look_2_0.between?( 0x61, 0x7a ) )
          alt_2 = 1

        end
        case alt_2
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
          break # out of loop for decision 2
        end
      end # loop for decision 2

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 35 )

    end

    # lexer rule integer! (INTEGER)
    # (in SFP.g)
    def integer!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )

      type = INTEGER
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 367:9: ( '-' )? ( '0' .. '9' )+
      # at line 367:9: ( '-' )?
      alt_3 = 2
      look_3_0 = @input.peek( 1 )

      if ( look_3_0 == 0x2d )
        alt_3 = 1
      end
      case alt_3
      when 1
        # at line 367:9: '-'
        match( 0x2d )

      end
      # at file 367:13: ( '0' .. '9' )+
      match_count_4 = 0
      while true
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0.between?( 0x30, 0x39 ) )
          alt_4 = 1

        end
        case alt_4
        when 1
          # at line 367:13: '0' .. '9'
          match_range( 0x30, 0x39 )

        else
          match_count_4 > 0 and break
          eee = EarlyExit(4)


          raise eee
        end
        match_count_4 += 1
      end


      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 36 )

    end

    # lexer rule float! (FLOAT)
    # (in SFP.g)
    def float!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )

      type = FLOAT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 371:5: ( ( '-' )? ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )? | ( '-' )? '.' ( '0' .. '9' )+ ( EXPONENT )? | ( '-' )? ( '0' .. '9' )+ EXPONENT )
      alt_14 = 3
      alt_14 = @dfa14.predict( @input )
      case alt_14
      when 1
        # at line 371:9: ( '-' )? ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )?
        # at line 371:9: ( '-' )?
        alt_5 = 2
        look_5_0 = @input.peek( 1 )

        if ( look_5_0 == 0x2d )
          alt_5 = 1
        end
        case alt_5
        when 1
          # at line 371:9: '-'
          match( 0x2d )

        end
        # at file 371:13: ( '0' .. '9' )+
        match_count_6 = 0
        while true
          alt_6 = 2
          look_6_0 = @input.peek( 1 )

          if ( look_6_0.between?( 0x30, 0x39 ) )
            alt_6 = 1

          end
          case alt_6
          when 1
            # at line 371:14: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            match_count_6 > 0 and break
            eee = EarlyExit(6)


            raise eee
          end
          match_count_6 += 1
        end

        match( 0x2e )
        # at line 371:29: ( '0' .. '9' )*
        while true # decision 7
          alt_7 = 2
          look_7_0 = @input.peek( 1 )

          if ( look_7_0.between?( 0x30, 0x39 ) )
            alt_7 = 1

          end
          case alt_7
          when 1
            # at line 371:30: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            break # out of loop for decision 7
          end
        end # loop for decision 7
        # at line 371:41: ( EXPONENT )?
        alt_8 = 2
        look_8_0 = @input.peek( 1 )

        if ( look_8_0 == 0x45 || look_8_0 == 0x65 )
          alt_8 = 1
        end
        case alt_8
        when 1
          # at line 371:41: EXPONENT
          exponent!

        end

      when 2
        # at line 372:9: ( '-' )? '.' ( '0' .. '9' )+ ( EXPONENT )?
        # at line 372:9: ( '-' )?
        alt_9 = 2
        look_9_0 = @input.peek( 1 )

        if ( look_9_0 == 0x2d )
          alt_9 = 1
        end
        case alt_9
        when 1
          # at line 372:9: '-'
          match( 0x2d )

        end
        match( 0x2e )
        # at file 372:17: ( '0' .. '9' )+
        match_count_10 = 0
        while true
          alt_10 = 2
          look_10_0 = @input.peek( 1 )

          if ( look_10_0.between?( 0x30, 0x39 ) )
            alt_10 = 1

          end
          case alt_10
          when 1
            # at line 372:18: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            match_count_10 > 0 and break
            eee = EarlyExit(10)


            raise eee
          end
          match_count_10 += 1
        end

        # at line 372:29: ( EXPONENT )?
        alt_11 = 2
        look_11_0 = @input.peek( 1 )

        if ( look_11_0 == 0x45 || look_11_0 == 0x65 )
          alt_11 = 1
        end
        case alt_11
        when 1
          # at line 372:29: EXPONENT
          exponent!

        end

      when 3
        # at line 373:9: ( '-' )? ( '0' .. '9' )+ EXPONENT
        # at line 373:9: ( '-' )?
        alt_12 = 2
        look_12_0 = @input.peek( 1 )

        if ( look_12_0 == 0x2d )
          alt_12 = 1
        end
        case alt_12
        when 1
          # at line 373:9: '-'
          match( 0x2d )

        end
        # at file 373:13: ( '0' .. '9' )+
        match_count_13 = 0
        while true
          alt_13 = 2
          look_13_0 = @input.peek( 1 )

          if ( look_13_0.between?( 0x30, 0x39 ) )
            alt_13 = 1

          end
          case alt_13
          when 1
            # at line 373:14: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            match_count_13 > 0 and break
            eee = EarlyExit(13)


            raise eee
          end
          match_count_13 += 1
        end

        exponent!

      end
      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 37 )

    end

    # lexer rule comment! (COMMENT)
    # (in SFP.g)
    def comment!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )

      type = COMMENT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 377:5: ( '//' (~ ( '\\n' | '\\r' ) )* | '/*' ( options {greedy=false; } : . )* '*/' )
      alt_17 = 2
      look_17_0 = @input.peek( 1 )

      if ( look_17_0 == 0x2f )
        look_17_1 = @input.peek( 2 )

        if ( look_17_1 == 0x2f )
          alt_17 = 1
        elsif ( look_17_1 == 0x2a )
          alt_17 = 2
        else
          raise NoViableAlternative( "", 17, 1 )
        end
      else
        raise NoViableAlternative( "", 17, 0 )
      end
      case alt_17
      when 1
        # at line 377:9: '//' (~ ( '\\n' | '\\r' ) )*
        match( "//" )
        # at line 377:14: (~ ( '\\n' | '\\r' ) )*
        while true # decision 15
          alt_15 = 2
          look_15_0 = @input.peek( 1 )

          if ( look_15_0.between?( 0x0, 0x9 ) || look_15_0.between?( 0xb, 0xc ) || look_15_0.between?( 0xe, 0xffff ) )
            alt_15 = 1

          end
          case alt_15
          when 1
            # at line 377:14: ~ ( '\\n' | '\\r' )
            if @input.peek( 1 ).between?( 0x0, 0x9 ) || @input.peek( 1 ).between?( 0xb, 0xc ) || @input.peek( 1 ).between?( 0xe, 0xff )
              @input.consume
            else
              mse = MismatchedSet( nil )
              recover mse
              raise mse
            end



          else
            break # out of loop for decision 15
          end
        end # loop for decision 15
        # --> action
        channel=HIDDEN;
        # <-- action

      when 2
        # at line 378:9: '/*' ( options {greedy=false; } : . )* '*/'
        match( "/*" )
        # at line 378:14: ( options {greedy=false; } : . )*
        while true # decision 16
          alt_16 = 2
          look_16_0 = @input.peek( 1 )

          if ( look_16_0 == 0x2a )
            look_16_1 = @input.peek( 2 )

            if ( look_16_1 == 0x2f )
              alt_16 = 2
            elsif ( look_16_1.between?( 0x0, 0x2e ) || look_16_1.between?( 0x30, 0xffff ) )
              alt_16 = 1

            end
          elsif ( look_16_0.between?( 0x0, 0x29 ) || look_16_0.between?( 0x2b, 0xffff ) )
            alt_16 = 1

          end
          case alt_16
          when 1
            # at line 378:42: .
            match_any

          else
            break # out of loop for decision 16
          end
        end # loop for decision 16
        match( "*/" )
        # --> action
        channel=HIDDEN;
        # <-- action

      end
      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 38 )

    end

    # lexer rule nl! (NL)
    # (in SFP.g)
    def nl!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )

      type = NL
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 381:6: ( '\\r' )? '\\n'
      # at line 381:6: ( '\\r' )?
      alt_18 = 2
      look_18_0 = @input.peek( 1 )

      if ( look_18_0 == 0xd )
        alt_18 = 1
      end
      case alt_18
      when 1
        # at line 381:6: '\\r'
        match( 0xd )

      end
      match( 0xa )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 39 )

    end

    # lexer rule ws! (WS)
    # (in SFP.g)
    def ws!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )

      type = WS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 384:9: ( ' ' | '\\t' )
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
      # trace_out( __method__, 40 )

    end

    # lexer rule string! (STRING)
    # (in SFP.g)
    def string!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )

      type = STRING
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 390:8: '\"' ( ESC_SEQ | ~ ( '\\\\' | '\"' ) )* '\"'
      match( 0x22 )
      # at line 390:12: ( ESC_SEQ | ~ ( '\\\\' | '\"' ) )*
      while true # decision 19
        alt_19 = 3
        look_19_0 = @input.peek( 1 )

        if ( look_19_0 == 0x5c )
          alt_19 = 1
        elsif ( look_19_0.between?( 0x0, 0x21 ) || look_19_0.between?( 0x23, 0x5b ) || look_19_0.between?( 0x5d, 0xffff ) )
          alt_19 = 2

        end
        case alt_19
        when 1
          # at line 390:14: ESC_SEQ
          esc_seq!

        when 2
          # at line 390:24: ~ ( '\\\\' | '\"' )
          if @input.peek( 1 ).between?( 0x0, 0x21 ) || @input.peek( 1 ).between?( 0x23, 0x5b ) || @input.peek( 1 ).between?( 0x5d, 0xff )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse
          end



        else
          break # out of loop for decision 19
        end
      end # loop for decision 19
      match( 0x22 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 41 )

    end

    # lexer rule exponent! (EXPONENT)
    # (in SFP.g)
    def exponent!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )

      
      # - - - - main rule block - - - -
      # at line 394:12: ( 'e' | 'E' ) ( '+' | '-' )? ( '0' .. '9' )+
      if @input.peek(1) == 0x45 || @input.peek(1) == 0x65
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end


      # at line 394:22: ( '+' | '-' )?
      alt_20 = 2
      look_20_0 = @input.peek( 1 )

      if ( look_20_0 == 0x2b || look_20_0 == 0x2d )
        alt_20 = 1
      end
      case alt_20
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
      # at file 394:33: ( '0' .. '9' )+
      match_count_21 = 0
      while true
        alt_21 = 2
        look_21_0 = @input.peek( 1 )

        if ( look_21_0.between?( 0x30, 0x39 ) )
          alt_21 = 1

        end
        case alt_21
        when 1
          # at line 394:34: '0' .. '9'
          match_range( 0x30, 0x39 )

        else
          match_count_21 > 0 and break
          eee = EarlyExit(21)


          raise eee
        end
        match_count_21 += 1
      end


    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 42 )

    end

    # lexer rule hex_digit! (HEX_DIGIT)
    # (in SFP.g)
    def hex_digit!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )

      
      # - - - - main rule block - - - -
      # at line 397:13: ( '0' .. '9' | 'a' .. 'f' | 'A' .. 'F' )
      if @input.peek( 1 ).between?( 0x30, 0x39 ) || @input.peek( 1 ).between?( 0x41, 0x46 ) || @input.peek( 1 ).between?( 0x61, 0x66 )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end



    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 43 )

    end

    # lexer rule esc_seq! (ESC_SEQ)
    # (in SFP.g)
    def esc_seq!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )

      
      # - - - - main rule block - - - -
      # at line 401:5: ( '\\\\' ( 'b' | 't' | 'n' | 'f' | 'r' | '\\\"' | '\\'' | '\\\\' ) | UNICODE_ESC | OCTAL_ESC )
      alt_22 = 3
      look_22_0 = @input.peek( 1 )

      if ( look_22_0 == 0x5c )
        case look_22 = @input.peek( 2 )
        when 0x22, 0x27, 0x5c, 0x62, 0x66, 0x6e, 0x72, 0x74 then alt_22 = 1
        when 0x75 then alt_22 = 2
        when 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37 then alt_22 = 3
        else
          raise NoViableAlternative( "", 22, 1 )
        end
      else
        raise NoViableAlternative( "", 22, 0 )
      end
      case alt_22
      when 1
        # at line 401:9: '\\\\' ( 'b' | 't' | 'n' | 'f' | 'r' | '\\\"' | '\\'' | '\\\\' )
        match( 0x5c )
        if @input.peek(1) == 0x22 || @input.peek(1) == 0x27 || @input.peek(1) == 0x5c || @input.peek(1) == 0x62 || @input.peek(1) == 0x66 || @input.peek(1) == 0x6e || @input.peek(1) == 0x72 || @input.peek(1) == 0x74
          @input.consume
        else
          mse = MismatchedSet( nil )
          recover mse
          raise mse
        end



      when 2
        # at line 402:9: UNICODE_ESC
        unicode_esc!

      when 3
        # at line 403:9: OCTAL_ESC
        octal_esc!

      end
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 44 )

    end

    # lexer rule octal_esc! (OCTAL_ESC)
    # (in SFP.g)
    def octal_esc!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )

      
      # - - - - main rule block - - - -
      # at line 408:5: ( '\\\\' ( '0' .. '3' ) ( '0' .. '7' ) ( '0' .. '7' ) | '\\\\' ( '0' .. '7' ) ( '0' .. '7' ) | '\\\\' ( '0' .. '7' ) )
      alt_23 = 3
      look_23_0 = @input.peek( 1 )

      if ( look_23_0 == 0x5c )
        look_23_1 = @input.peek( 2 )

        if ( look_23_1.between?( 0x30, 0x33 ) )
          look_23_2 = @input.peek( 3 )

          if ( look_23_2.between?( 0x30, 0x37 ) )
            look_23_4 = @input.peek( 4 )

            if ( look_23_4.between?( 0x30, 0x37 ) )
              alt_23 = 1
            else
              alt_23 = 2
            end
          else
            alt_23 = 3
          end
        elsif ( look_23_1.between?( 0x34, 0x37 ) )
          look_23_3 = @input.peek( 3 )

          if ( look_23_3.between?( 0x30, 0x37 ) )
            alt_23 = 2
          else
            alt_23 = 3
          end
        else
          raise NoViableAlternative( "", 23, 1 )
        end
      else
        raise NoViableAlternative( "", 23, 0 )
      end
      case alt_23
      when 1
        # at line 408:9: '\\\\' ( '0' .. '3' ) ( '0' .. '7' ) ( '0' .. '7' )
        match( 0x5c )
        # at line 408:14: ( '0' .. '3' )
        # at line 408:15: '0' .. '3'
        match_range( 0x30, 0x33 )

        # at line 408:25: ( '0' .. '7' )
        # at line 408:26: '0' .. '7'
        match_range( 0x30, 0x37 )

        # at line 408:36: ( '0' .. '7' )
        # at line 408:37: '0' .. '7'
        match_range( 0x30, 0x37 )


      when 2
        # at line 409:9: '\\\\' ( '0' .. '7' ) ( '0' .. '7' )
        match( 0x5c )
        # at line 409:14: ( '0' .. '7' )
        # at line 409:15: '0' .. '7'
        match_range( 0x30, 0x37 )

        # at line 409:25: ( '0' .. '7' )
        # at line 409:26: '0' .. '7'
        match_range( 0x30, 0x37 )


      when 3
        # at line 410:9: '\\\\' ( '0' .. '7' )
        match( 0x5c )
        # at line 410:14: ( '0' .. '7' )
        # at line 410:15: '0' .. '7'
        match_range( 0x30, 0x37 )


      end
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 45 )

    end

    # lexer rule unicode_esc! (UNICODE_ESC)
    # (in SFP.g)
    def unicode_esc!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )

      
      # - - - - main rule block - - - -
      # at line 415:9: '\\\\' 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
      match( 0x5c )
      match( 0x75 )
      hex_digit!
      hex_digit!
      hex_digit!
      hex_digit!

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 46 )

    end

    # main rule used to study the input at the current position,
    # and choose the proper lexer rule to call in order to
    # fetch the next token
    # 
    # usually, you don't make direct calls to this method,
    # but instead use the next_token method, which will
    # build and emit the actual next token
    def token!
      # at line 1:8: ( T__18 | T__19 | T__20 | T__21 | T__22 | T__23 | T__24 | T__25 | T__26 | T__27 | T__28 | T__29 | T__30 | T__31 | T__32 | T__33 | T__34 | T__35 | T__36 | T__37 | T__38 | T__39 | T__40 | T__41 | T__42 | T__43 | T__44 | T__45 | T__46 | T__47 | T__48 | T__49 | NULL | BOOLEAN | ID | INTEGER | FLOAT | COMMENT | NL | WS | STRING )
      alt_24 = 41
      alt_24 = @dfa24.predict( @input )
      case alt_24
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
        # at line 1:202: NULL
        null!

      when 34
        # at line 1:207: BOOLEAN
        boolean!

      when 35
        # at line 1:215: ID
        id!

      when 36
        # at line 1:218: INTEGER
        integer!

      when 37
        # at line 1:226: FLOAT
        float!

      when 38
        # at line 1:232: COMMENT
        comment!

      when 39
        # at line 1:240: NL
        nl!

      when 40
        # at line 1:243: WS
        ws!

      when 41
        # at line 1:246: STRING
        string!

      end
    end

    
    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA14 < ANTLR3::DFA
      EOT = unpack( 6, -1 )
      EOF = unpack( 6, -1 )
      MIN = unpack( 1, 45, 2, 46, 3, -1 )
      MAX = unpack( 2, 57, 1, 101, 3, -1 )
      ACCEPT = unpack( 3, -1, 1, 2, 1, 1, 1, 3 )
      SPECIAL = unpack( 6, -1 )
      TRANSITION = [
        unpack( 1, 1, 1, 3, 1, -1, 10, 2 ),
        unpack( 1, 3, 1, -1, 10, 2 ),
        unpack( 1, 4, 1, -1, 10, 2, 11, -1, 1, 5, 31, -1, 1, 5 ),
        unpack(  ),
        unpack(  ),
        unpack(  )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 14
      

      def description
        <<-'__dfa_description__'.strip!
          370:1: FLOAT : ( ( '-' )? ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )? | ( '-' )? '.' ( '0' .. '9' )+ ( EXPONENT )? | ( '-' )? ( '0' .. '9' )+ EXPONENT );
        __dfa_description__
      end
    end
    class DFA24 < ANTLR3::DFA
      EOT = unpack( 2, -1, 1, 25, 1, -1, 2, 25, 2, -1, 4, 25, 2, -1, 3, 
                    25, 1, 48, 1, 50, 2, -1, 1, 54, 1, -1, 1, 57, 2, -1, 
                    1, 58, 3, -1, 6, 25, 1, 66, 8, 25, 1, 75, 1, 76, 12, 
                    -1, 7, 25, 1, -1, 6, 25, 1, 90, 1, 25, 2, -1, 2, 25, 
                    1, -1, 5, 25, 1, 99, 1, 100, 1, 101, 2, 25, 1, -1, 1, 
                    104, 1, -1, 1, 101, 2, 25, 1, 107, 2, 25, 3, -1, 2, 
                    25, 1, -1, 2, 25, 1, -1, 1, 25, 1, 115, 4, 25, 1, 120, 
                    1, -1, 4, 25, 1, -1, 2, 25, 1, 127, 3, 25, 1, -1, 1, 
                    131, 2, 25, 1, -1, 2, 25, 1, 136, 1, 25, 1, -1, 1, 138, 
                    1, -1 )
      EOF = unpack( 139, -1 )
      MIN = unpack( 1, 9, 1, -1, 1, 97, 1, -1, 1, 114, 1, 108, 2, -1, 1, 
                    120, 1, 99, 2, 104, 2, -1, 2, 111, 1, 102, 2, 61, 1, 
                    -1, 1, 46, 1, 61, 1, 42, 1, 48, 2, -1, 1, 46, 3, -1, 
                    3, 108, 1, 109, 1, 97, 1, 116, 1, 45, 1, 116, 2, 101, 
                    1, 117, 1, 101, 1, 115, 1, 116, 1, 108, 2, 45, 12, -1, 
                    1, 101, 1, 115, 1, 40, 1, 112, 2, 115, 1, 101, 1, -1, 
                    1, 105, 2, 110, 1, 101, 1, 99, 1, 116, 1, 45, 1, 108, 
                    2, -1, 1, 40, 1, 101, 1, -1, 1, 111, 1, 116, 1, 115, 
                    1, 110, 1, 111, 3, 45, 1, 111, 1, 99, 1, -1, 1, 45, 
                    1, -1, 1, 45, 1, 115, 1, 114, 1, 45, 1, 100, 1, 110, 
                    3, -1, 1, 110, 1, 111, 1, -1, 1, 105, 1, 97, 1, -1, 
                    1, 115, 1, 45, 1, 100, 1, 110, 1, 116, 1, 105, 1, 45, 
                    1, -1, 1, 105, 1, 100, 1, 101, 1, 110, 1, -1, 1, 116, 
                    1, 105, 1, 45, 1, 116, 1, 105, 1, 116, 1, -1, 1, 45, 
                    1, 111, 1, 105, 1, -1, 1, 110, 1, 111, 1, 45, 1, 110, 
                    1, -1, 1, 45, 1, -1 )
      MAX = unpack( 1, 125, 1, -1, 1, 105, 1, -1, 1, 114, 1, 111, 2, -1, 
                    1, 120, 1, 115, 1, 104, 1, 114, 2, -1, 1, 114, 1, 117, 
                    1, 110, 2, 61, 1, -1, 3, 61, 1, 57, 2, -1, 1, 101, 3, 
                    -1, 3, 108, 1, 110, 1, 97, 1, 116, 1, 122, 1, 116, 2, 
                    101, 1, 117, 1, 101, 1, 115, 1, 116, 1, 108, 2, 122, 
                    12, -1, 1, 101, 1, 115, 1, 40, 1, 112, 2, 115, 1, 101, 
                    1, -1, 1, 105, 2, 110, 1, 101, 1, 99, 1, 116, 1, 122, 
                    1, 108, 2, -1, 1, 40, 1, 101, 1, -1, 1, 111, 1, 116, 
                    1, 115, 1, 110, 1, 111, 3, 122, 1, 111, 1, 99, 1, -1, 
                    1, 122, 1, -1, 1, 122, 1, 115, 1, 114, 1, 122, 1, 100, 
                    1, 110, 3, -1, 1, 110, 1, 111, 1, -1, 1, 105, 1, 97, 
                    1, -1, 1, 115, 1, 122, 1, 100, 1, 110, 1, 116, 1, 105, 
                    1, 122, 1, -1, 1, 105, 1, 100, 1, 101, 1, 110, 1, -1, 
                    1, 116, 1, 105, 1, 122, 1, 116, 1, 105, 1, 116, 1, -1, 
                    1, 122, 1, 111, 1, 105, 1, -1, 1, 110, 1, 111, 1, 122, 
                    1, 110, 1, -1, 1, 122, 1, -1 )
      ACCEPT = unpack( 1, -1, 1, 1, 1, -1, 1, 3, 2, -1, 1, 6, 1, 7, 4, -1, 
                       1, 14, 1, 15, 5, -1, 1, 26, 4, -1, 1, 31, 1, 35, 
                       1, -1, 1, 39, 1, 40, 1, 41, 17, -1, 1, 22, 1, 21, 
                       1, 23, 1, 24, 1, 27, 1, 37, 1, 28, 1, 32, 1, 29, 
                       1, 38, 1, 30, 1, 36, 7, -1, 1, 10, 8, -1, 1, 20, 
                       1, 25, 2, -1, 1, 4, 10, -1, 1, 19, 1, -1, 1, 2, 6, 
                       -1, 1, 11, 1, 12, 1, 34, 2, -1, 1, 33, 2, -1, 1, 
                       8, 7, -1, 1, 13, 4, -1, 1, 9, 6, -1, 1, 5, 3, -1, 
                       1, 18, 4, -1, 1, 16, 1, -1, 1, 17 )
      SPECIAL = unpack( 139, -1 )
      TRANSITION = [
        unpack( 1, 28, 1, 27, 2, -1, 1, 27, 18, -1, 1, 28, 1, -1, 1, 29, 
                1, 1, 1, 24, 3, -1, 1, 12, 1, 3, 1, 21, 1, 19, 1, 13, 1, 
                20, 1, 23, 1, 22, 10, 26, 2, -1, 1, 17, 1, -1, 1, 18, 2, 
                -1, 26, 25, 6, -1, 1, 9, 1, 25, 1, 5, 1, 25, 1, 8, 1, 2, 
                2, 25, 1, 16, 4, 25, 1, 15, 1, 25, 1, 14, 3, 25, 1, 11, 
                1, 4, 1, 25, 1, 10, 3, 25, 1, 6, 1, -1, 1, 7 ),
        unpack(  ),
        unpack( 1, 31, 7, -1, 1, 30 ),
        unpack(  ),
        unpack( 1, 32 ),
        unpack( 1, 34, 2, -1, 1, 33 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 35 ),
        unpack( 1, 37, 15, -1, 1, 36 ),
        unpack( 1, 38 ),
        unpack( 1, 39, 9, -1, 1, 40 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 42, 2, -1, 1, 41 ),
        unpack( 1, 43, 5, -1, 1, 44 ),
        unpack( 1, 46, 7, -1, 1, 45 ),
        unpack( 1, 47 ),
        unpack( 1, 49 ),
        unpack(  ),
        unpack( 1, 52, 1, -1, 10, 26, 3, -1, 1, 51 ),
        unpack( 1, 53 ),
        unpack( 1, 56, 4, -1, 1, 56, 13, -1, 1, 55 ),
        unpack( 10, 52 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 52, 1, -1, 10, 26, 11, -1, 1, 52, 31, -1, 1, 52 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 59 ),
        unpack( 1, 60 ),
        unpack( 1, 61 ),
        unpack( 1, 62, 1, 63 ),
        unpack( 1, 64 ),
        unpack( 1, 65 ),
        unpack( 1, 25, 2, -1, 10, 25, 7, -1, 26, 25, 4, -1, 1, 25, 1, -1, 
                 26, 25 ),
        unpack( 1, 67 ),
        unpack( 1, 68 ),
        unpack( 1, 69 ),
        unpack( 1, 70 ),
        unpack( 1, 71 ),
        unpack( 1, 72 ),
        unpack( 1, 73 ),
        unpack( 1, 74 ),
        unpack( 1, 25, 2, -1, 10, 25, 7, -1, 26, 25, 4, -1, 1, 25, 1, -1, 
                 26, 25 ),
        unpack( 1, 25, 2, -1, 10, 25, 7, -1, 26, 25, 4, -1, 1, 25, 1, -1, 
                 26, 25 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 77 ),
        unpack( 1, 78 ),
        unpack( 1, 79 ),
        unpack( 1, 80 ),
        unpack( 1, 81 ),
        unpack( 1, 82 ),
        unpack( 1, 83 ),
        unpack(  ),
        unpack( 1, 84 ),
        unpack( 1, 85 ),
        unpack( 1, 86 ),
        unpack( 1, 87 ),
        unpack( 1, 88 ),
        unpack( 1, 89 ),
        unpack( 1, 25, 2, -1, 10, 25, 7, -1, 26, 25, 4, -1, 1, 25, 1, -1, 
                 26, 25 ),
        unpack( 1, 91 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 92 ),
        unpack( 1, 93 ),
        unpack(  ),
        unpack( 1, 94 ),
        unpack( 1, 95 ),
        unpack( 1, 96 ),
        unpack( 1, 97 ),
        unpack( 1, 98 ),
        unpack( 1, 25, 2, -1, 10, 25, 7, -1, 26, 25, 4, -1, 1, 25, 1, -1, 
                 26, 25 ),
        unpack( 1, 25, 2, -1, 10, 25, 7, -1, 26, 25, 4, -1, 1, 25, 1, -1, 
                 26, 25 ),
        unpack( 1, 25, 2, -1, 10, 25, 7, -1, 26, 25, 4, -1, 1, 25, 1, -1, 
                 26, 25 ),
        unpack( 1, 102 ),
        unpack( 1, 103 ),
        unpack(  ),
        unpack( 1, 25, 2, -1, 10, 25, 7, -1, 26, 25, 4, -1, 1, 25, 1, -1, 
                 26, 25 ),
        unpack(  ),
        unpack( 1, 25, 2, -1, 10, 25, 7, -1, 26, 25, 4, -1, 1, 25, 1, -1, 
                 26, 25 ),
        unpack( 1, 105 ),
        unpack( 1, 106 ),
        unpack( 1, 25, 2, -1, 10, 25, 7, -1, 26, 25, 4, -1, 1, 25, 1, -1, 
                 26, 25 ),
        unpack( 1, 108 ),
        unpack( 1, 109 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 110 ),
        unpack( 1, 111 ),
        unpack(  ),
        unpack( 1, 112 ),
        unpack( 1, 113 ),
        unpack(  ),
        unpack( 1, 114 ),
        unpack( 1, 25, 2, -1, 10, 25, 7, -1, 26, 25, 4, -1, 1, 25, 1, -1, 
                 26, 25 ),
        unpack( 1, 116 ),
        unpack( 1, 117 ),
        unpack( 1, 118 ),
        unpack( 1, 119 ),
        unpack( 1, 25, 2, -1, 10, 25, 7, -1, 26, 25, 4, -1, 1, 25, 1, -1, 
                 26, 25 ),
        unpack(  ),
        unpack( 1, 121 ),
        unpack( 1, 122 ),
        unpack( 1, 123 ),
        unpack( 1, 124 ),
        unpack(  ),
        unpack( 1, 125 ),
        unpack( 1, 126 ),
        unpack( 1, 25, 2, -1, 10, 25, 7, -1, 26, 25, 4, -1, 1, 25, 1, -1, 
                 26, 25 ),
        unpack( 1, 128 ),
        unpack( 1, 129 ),
        unpack( 1, 130 ),
        unpack(  ),
        unpack( 1, 25, 2, -1, 10, 25, 7, -1, 26, 25, 4, -1, 1, 25, 1, -1, 
                 26, 25 ),
        unpack( 1, 132 ),
        unpack( 1, 133 ),
        unpack(  ),
        unpack( 1, 134 ),
        unpack( 1, 135 ),
        unpack( 1, 25, 2, -1, 10, 25, 7, -1, 26, 25, 4, -1, 1, 25, 1, -1, 
                 26, 25 ),
        unpack( 1, 137 ),
        unpack(  ),
        unpack( 1, 25, 2, -1, 10, 25, 7, -1, 26, 25, 4, -1, 1, 25, 1, -1, 
                 26, 25 ),
        unpack(  )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 24
      

      def description
        <<-'__dfa_description__'.strip!
          1:1: Tokens : ( T__18 | T__19 | T__20 | T__21 | T__22 | T__23 | T__24 | T__25 | T__26 | T__27 | T__28 | T__29 | T__30 | T__31 | T__32 | T__33 | T__34 | T__35 | T__36 | T__37 | T__38 | T__39 | T__40 | T__41 | T__42 | T__43 | T__44 | T__45 | T__46 | T__47 | T__48 | T__49 | NULL | BOOLEAN | ID | INTEGER | FLOAT | COMMENT | NL | WS | STRING );
        __dfa_description__
      end
    end

    
    private
    
    def initialize_dfas
      super rescue nil
      @dfa14 = DFA14.new( self, 14 )
      @dfa24 = DFA24.new( self, 24 )

    end
  end # class Lexer < ANTLR3::Lexer

  at_exit { Lexer.main( ARGV ) } if __FILE__ == $0
end

