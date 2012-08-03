#!/usr/bin/env ruby
#
# SFP.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: SFP.g
# Generated at: 2012-06-25 03:41:10
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
    define_tokens( :INTEGER => 6, :EXPONENT => 7, :T__25 => 25, :T__24 => 24, 
                   :T__23 => 23, :T__22 => 22, :T__21 => 21, :UNICODE_ESC => 14, 
                   :T__20 => 20, :OCTAL_ESC => 15, :HEX_DIGIT => 13, :FLOAT => 8, 
                   :ID => 4, :EOF => -1, :T__19 => 19, :BOOLEAN => 5, :T__16 => 16, 
                   :ESC_SEQ => 11, :WS => 10, :T__18 => 18, :T__17 => 17, 
                   :COMMENT => 9, :STRING => 12 )
    
  end


  class Lexer < ANTLR3::Lexer
    @grammar_home = SFP
    include TokenData

    
    begin
      generated_using( "SFP.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end
    
    RULE_NAMES   = [ "T__16", "T__17", "T__18", "T__19", "T__20", "T__21", 
                     "T__22", "T__23", "T__24", "T__25", "BOOLEAN", "ID", 
                     "INTEGER", "FLOAT", "COMMENT", "WS", "STRING", "EXPONENT", 
                     "HEX_DIGIT", "ESC_SEQ", "OCTAL_ESC", "UNICODE_ESC" ].freeze
    RULE_METHODS = [ :t__16!, :t__17!, :t__18!, :t__19!, :t__20!, :t__21!, 
                     :t__22!, :t__23!, :t__24!, :t__25!, :boolean!, :id!, 
                     :integer!, :float!, :comment!, :ws!, :string!, :exponent!, 
                     :hex_digit!, :esc_seq!, :octal_esc!, :unicode_esc! ].freeze

    
    def initialize( input=nil, options = {} )
      super( input, options )

    end
    
    
    # - - - - - - - - - - - lexer rules - - - - - - - - - - - -
    # lexer rule t__16! (T__16)
    # (in SFP.g)
    def t__16!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )

      type = T__16
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 7:9: 'class'
      match( "class" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 1 )

    end

    # lexer rule t__17! (T__17)
    # (in SFP.g)
    def t__17!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )

      type = T__17
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 8:9: ':'
      match( 0x3a )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 2 )

    end

    # lexer rule t__18! (T__18)
    # (in SFP.g)
    def t__18!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )

      type = T__18
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 9:9: '\\t'
      match( 0x9 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 3 )

    end

    # lexer rule t__19! (T__19)
    # (in SFP.g)
    def t__19!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )

      type = T__19
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 10:9: 'isa'
      match( "isa" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 4 )

    end

    # lexer rule t__20! (T__20)
    # (in SFP.g)
    def t__20!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )

      type = T__20
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 11:9: 'isref'
      match( "isref" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 5 )

    end

    # lexer rule t__21! (T__21)
    # (in SFP.g)
    def t__21!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )

      type = T__21
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 12:9: 'is'
      match( "is" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 6 )

    end

    # lexer rule t__22! (T__22)
    # (in SFP.g)
    def t__22!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )

      type = T__22
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 13:9: '='
      match( 0x3d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 7 )

    end

    # lexer rule t__23! (T__23)
    # (in SFP.g)
    def t__23!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )

      type = T__23
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 14:9: '.'
      match( 0x2e )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 8 )

    end

    # lexer rule t__24! (T__24)
    # (in SFP.g)
    def t__24!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )

      type = T__24
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 15:9: '\\r'
      match( 0xd )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 9 )

    end

    # lexer rule t__25! (T__25)
    # (in SFP.g)
    def t__25!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )

      type = T__25
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 16:9: '\\n'
      match( 0xa )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 10 )

    end

    # lexer rule boolean! (BOOLEAN)
    # (in SFP.g)
    def boolean!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )

      type = BOOLEAN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 71:2: ( 'true' | 'false' )
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
        # at line 71:4: 'true'
        match( "true" )

      when 2
        # at line 72:4: 'false'
        match( "false" )

      end
      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 11 )

    end

    # lexer rule id! (ID)
    # (in SFP.g)
    def id!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )

      type = ID
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 75:7: ( 'a' .. 'z' | 'A' .. 'Z' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' | '-' )*
      if @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek( 1 ).between?( 0x61, 0x7a )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end


      # at line 75:27: ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' | '-' )*
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
      # trace_out( __method__, 12 )

    end

    # lexer rule integer! (INTEGER)
    # (in SFP.g)
    def integer!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )

      type = INTEGER
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 79:9: ( '-' )? ( '0' .. '9' )+
      # at line 79:9: ( '-' )?
      alt_3 = 2
      look_3_0 = @input.peek( 1 )

      if ( look_3_0 == 0x2d )
        alt_3 = 1
      end
      case alt_3
      when 1
        # at line 79:9: '-'
        match( 0x2d )

      end
      # at file 79:13: ( '0' .. '9' )+
      match_count_4 = 0
      while true
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0.between?( 0x30, 0x39 ) )
          alt_4 = 1

        end
        case alt_4
        when 1
          # at line 79:13: '0' .. '9'
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
      # trace_out( __method__, 13 )

    end

    # lexer rule float! (FLOAT)
    # (in SFP.g)
    def float!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )

      type = FLOAT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 83:5: ( ( '-' )? ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )? | ( '-' )? '.' ( '0' .. '9' )+ ( EXPONENT )? | ( '-' )? ( '0' .. '9' )+ EXPONENT )
      alt_14 = 3
      alt_14 = @dfa14.predict( @input )
      case alt_14
      when 1
        # at line 83:9: ( '-' )? ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )?
        # at line 83:9: ( '-' )?
        alt_5 = 2
        look_5_0 = @input.peek( 1 )

        if ( look_5_0 == 0x2d )
          alt_5 = 1
        end
        case alt_5
        when 1
          # at line 83:9: '-'
          match( 0x2d )

        end
        # at file 83:13: ( '0' .. '9' )+
        match_count_6 = 0
        while true
          alt_6 = 2
          look_6_0 = @input.peek( 1 )

          if ( look_6_0.between?( 0x30, 0x39 ) )
            alt_6 = 1

          end
          case alt_6
          when 1
            # at line 83:14: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            match_count_6 > 0 and break
            eee = EarlyExit(6)


            raise eee
          end
          match_count_6 += 1
        end

        match( 0x2e )
        # at line 83:29: ( '0' .. '9' )*
        while true # decision 7
          alt_7 = 2
          look_7_0 = @input.peek( 1 )

          if ( look_7_0.between?( 0x30, 0x39 ) )
            alt_7 = 1

          end
          case alt_7
          when 1
            # at line 83:30: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            break # out of loop for decision 7
          end
        end # loop for decision 7
        # at line 83:41: ( EXPONENT )?
        alt_8 = 2
        look_8_0 = @input.peek( 1 )

        if ( look_8_0 == 0x45 || look_8_0 == 0x65 )
          alt_8 = 1
        end
        case alt_8
        when 1
          # at line 83:41: EXPONENT
          exponent!

        end

      when 2
        # at line 84:9: ( '-' )? '.' ( '0' .. '9' )+ ( EXPONENT )?
        # at line 84:9: ( '-' )?
        alt_9 = 2
        look_9_0 = @input.peek( 1 )

        if ( look_9_0 == 0x2d )
          alt_9 = 1
        end
        case alt_9
        when 1
          # at line 84:9: '-'
          match( 0x2d )

        end
        match( 0x2e )
        # at file 84:17: ( '0' .. '9' )+
        match_count_10 = 0
        while true
          alt_10 = 2
          look_10_0 = @input.peek( 1 )

          if ( look_10_0.between?( 0x30, 0x39 ) )
            alt_10 = 1

          end
          case alt_10
          when 1
            # at line 84:18: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            match_count_10 > 0 and break
            eee = EarlyExit(10)


            raise eee
          end
          match_count_10 += 1
        end

        # at line 84:29: ( EXPONENT )?
        alt_11 = 2
        look_11_0 = @input.peek( 1 )

        if ( look_11_0 == 0x45 || look_11_0 == 0x65 )
          alt_11 = 1
        end
        case alt_11
        when 1
          # at line 84:29: EXPONENT
          exponent!

        end

      when 3
        # at line 85:9: ( '-' )? ( '0' .. '9' )+ EXPONENT
        # at line 85:9: ( '-' )?
        alt_12 = 2
        look_12_0 = @input.peek( 1 )

        if ( look_12_0 == 0x2d )
          alt_12 = 1
        end
        case alt_12
        when 1
          # at line 85:9: '-'
          match( 0x2d )

        end
        # at file 85:13: ( '0' .. '9' )+
        match_count_13 = 0
        while true
          alt_13 = 2
          look_13_0 = @input.peek( 1 )

          if ( look_13_0.between?( 0x30, 0x39 ) )
            alt_13 = 1

          end
          case alt_13
          when 1
            # at line 85:14: '0' .. '9'
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
      # trace_out( __method__, 14 )

    end

    # lexer rule comment! (COMMENT)
    # (in SFP.g)
    def comment!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )

      type = COMMENT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 89:5: ( '//' (~ ( '\\n' | '\\r' ) )* | '/*' ( options {greedy=false; } : . )* '*/' )
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
        # at line 89:9: '//' (~ ( '\\n' | '\\r' ) )*
        match( "//" )
        # at line 89:14: (~ ( '\\n' | '\\r' ) )*
        while true # decision 15
          alt_15 = 2
          look_15_0 = @input.peek( 1 )

          if ( look_15_0.between?( 0x0, 0x9 ) || look_15_0.between?( 0xb, 0xc ) || look_15_0.between?( 0xe, 0xffff ) )
            alt_15 = 1

          end
          case alt_15
          when 1
            # at line 89:14: ~ ( '\\n' | '\\r' )
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
        # at line 90:9: '/*' ( options {greedy=false; } : . )* '*/'
        match( "/*" )
        # at line 90:14: ( options {greedy=false; } : . )*
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
            # at line 90:42: .
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
      # trace_out( __method__, 15 )

    end

    # lexer rule ws! (WS)
    # (in SFP.g)
    def ws!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )

      type = WS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 97:9: ( ' ' | '\\t' )
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
      # trace_out( __method__, 16 )

    end

    # lexer rule string! (STRING)
    # (in SFP.g)
    def string!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )

      type = STRING
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 103:8: '\"' ( ESC_SEQ | ~ ( '\\\\' | '\"' ) )* '\"'
      match( 0x22 )
      # at line 103:12: ( ESC_SEQ | ~ ( '\\\\' | '\"' ) )*
      while true # decision 18
        alt_18 = 3
        look_18_0 = @input.peek( 1 )

        if ( look_18_0 == 0x5c )
          alt_18 = 1
        elsif ( look_18_0.between?( 0x0, 0x21 ) || look_18_0.between?( 0x23, 0x5b ) || look_18_0.between?( 0x5d, 0xffff ) )
          alt_18 = 2

        end
        case alt_18
        when 1
          # at line 103:14: ESC_SEQ
          esc_seq!

        when 2
          # at line 103:24: ~ ( '\\\\' | '\"' )
          if @input.peek( 1 ).between?( 0x0, 0x21 ) || @input.peek( 1 ).between?( 0x23, 0x5b ) || @input.peek( 1 ).between?( 0x5d, 0xff )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse
          end



        else
          break # out of loop for decision 18
        end
      end # loop for decision 18
      match( 0x22 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 17 )

    end

    # lexer rule exponent! (EXPONENT)
    # (in SFP.g)
    def exponent!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )

      
      # - - - - main rule block - - - -
      # at line 107:12: ( 'e' | 'E' ) ( '+' | '-' )? ( '0' .. '9' )+
      if @input.peek(1) == 0x45 || @input.peek(1) == 0x65
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end


      # at line 107:22: ( '+' | '-' )?
      alt_19 = 2
      look_19_0 = @input.peek( 1 )

      if ( look_19_0 == 0x2b || look_19_0 == 0x2d )
        alt_19 = 1
      end
      case alt_19
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
      # at file 107:33: ( '0' .. '9' )+
      match_count_20 = 0
      while true
        alt_20 = 2
        look_20_0 = @input.peek( 1 )

        if ( look_20_0.between?( 0x30, 0x39 ) )
          alt_20 = 1

        end
        case alt_20
        when 1
          # at line 107:34: '0' .. '9'
          match_range( 0x30, 0x39 )

        else
          match_count_20 > 0 and break
          eee = EarlyExit(20)


          raise eee
        end
        match_count_20 += 1
      end


    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 18 )

    end

    # lexer rule hex_digit! (HEX_DIGIT)
    # (in SFP.g)
    def hex_digit!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )

      
      # - - - - main rule block - - - -
      # at line 110:13: ( '0' .. '9' | 'a' .. 'f' | 'A' .. 'F' )
      if @input.peek( 1 ).between?( 0x30, 0x39 ) || @input.peek( 1 ).between?( 0x41, 0x46 ) || @input.peek( 1 ).between?( 0x61, 0x66 )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end



    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 19 )

    end

    # lexer rule esc_seq! (ESC_SEQ)
    # (in SFP.g)
    def esc_seq!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )

      
      # - - - - main rule block - - - -
      # at line 114:5: ( '\\\\' ( 'b' | 't' | 'n' | 'f' | 'r' | '\\\"' | '\\'' | '\\\\' ) | UNICODE_ESC | OCTAL_ESC )
      alt_21 = 3
      look_21_0 = @input.peek( 1 )

      if ( look_21_0 == 0x5c )
        case look_21 = @input.peek( 2 )
        when 0x22, 0x27, 0x5c, 0x62, 0x66, 0x6e, 0x72, 0x74 then alt_21 = 1
        when 0x75 then alt_21 = 2
        when 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37 then alt_21 = 3
        else
          raise NoViableAlternative( "", 21, 1 )
        end
      else
        raise NoViableAlternative( "", 21, 0 )
      end
      case alt_21
      when 1
        # at line 114:9: '\\\\' ( 'b' | 't' | 'n' | 'f' | 'r' | '\\\"' | '\\'' | '\\\\' )
        match( 0x5c )
        if @input.peek(1) == 0x22 || @input.peek(1) == 0x27 || @input.peek(1) == 0x5c || @input.peek(1) == 0x62 || @input.peek(1) == 0x66 || @input.peek(1) == 0x6e || @input.peek(1) == 0x72 || @input.peek(1) == 0x74
          @input.consume
        else
          mse = MismatchedSet( nil )
          recover mse
          raise mse
        end



      when 2
        # at line 115:9: UNICODE_ESC
        unicode_esc!

      when 3
        # at line 116:9: OCTAL_ESC
        octal_esc!

      end
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 20 )

    end

    # lexer rule octal_esc! (OCTAL_ESC)
    # (in SFP.g)
    def octal_esc!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )

      
      # - - - - main rule block - - - -
      # at line 121:5: ( '\\\\' ( '0' .. '3' ) ( '0' .. '7' ) ( '0' .. '7' ) | '\\\\' ( '0' .. '7' ) ( '0' .. '7' ) | '\\\\' ( '0' .. '7' ) )
      alt_22 = 3
      look_22_0 = @input.peek( 1 )

      if ( look_22_0 == 0x5c )
        look_22_1 = @input.peek( 2 )

        if ( look_22_1.between?( 0x30, 0x33 ) )
          look_22_2 = @input.peek( 3 )

          if ( look_22_2.between?( 0x30, 0x37 ) )
            look_22_4 = @input.peek( 4 )

            if ( look_22_4.between?( 0x30, 0x37 ) )
              alt_22 = 1
            else
              alt_22 = 2
            end
          else
            alt_22 = 3
          end
        elsif ( look_22_1.between?( 0x34, 0x37 ) )
          look_22_3 = @input.peek( 3 )

          if ( look_22_3.between?( 0x30, 0x37 ) )
            alt_22 = 2
          else
            alt_22 = 3
          end
        else
          raise NoViableAlternative( "", 22, 1 )
        end
      else
        raise NoViableAlternative( "", 22, 0 )
      end
      case alt_22
      when 1
        # at line 121:9: '\\\\' ( '0' .. '3' ) ( '0' .. '7' ) ( '0' .. '7' )
        match( 0x5c )
        # at line 121:14: ( '0' .. '3' )
        # at line 121:15: '0' .. '3'
        match_range( 0x30, 0x33 )

        # at line 121:25: ( '0' .. '7' )
        # at line 121:26: '0' .. '7'
        match_range( 0x30, 0x37 )

        # at line 121:36: ( '0' .. '7' )
        # at line 121:37: '0' .. '7'
        match_range( 0x30, 0x37 )


      when 2
        # at line 122:9: '\\\\' ( '0' .. '7' ) ( '0' .. '7' )
        match( 0x5c )
        # at line 122:14: ( '0' .. '7' )
        # at line 122:15: '0' .. '7'
        match_range( 0x30, 0x37 )

        # at line 122:25: ( '0' .. '7' )
        # at line 122:26: '0' .. '7'
        match_range( 0x30, 0x37 )


      when 3
        # at line 123:9: '\\\\' ( '0' .. '7' )
        match( 0x5c )
        # at line 123:14: ( '0' .. '7' )
        # at line 123:15: '0' .. '7'
        match_range( 0x30, 0x37 )


      end
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 21 )

    end

    # lexer rule unicode_esc! (UNICODE_ESC)
    # (in SFP.g)
    def unicode_esc!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )

      
      # - - - - main rule block - - - -
      # at line 128:9: '\\\\' 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
      match( 0x5c )
      match( 0x75 )
      hex_digit!
      hex_digit!
      hex_digit!
      hex_digit!

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 22 )

    end

    # main rule used to study the input at the current position,
    # and choose the proper lexer rule to call in order to
    # fetch the next token
    # 
    # usually, you don't make direct calls to this method,
    # but instead use the next_token method, which will
    # build and emit the actual next token
    def token!
      # at line 1:8: ( T__16 | T__17 | T__18 | T__19 | T__20 | T__21 | T__22 | T__23 | T__24 | T__25 | BOOLEAN | ID | INTEGER | FLOAT | COMMENT | WS | STRING )
      alt_23 = 17
      alt_23 = @dfa23.predict( @input )
      case alt_23
      when 1
        # at line 1:10: T__16
        t__16!

      when 2
        # at line 1:16: T__17
        t__17!

      when 3
        # at line 1:22: T__18
        t__18!

      when 4
        # at line 1:28: T__19
        t__19!

      when 5
        # at line 1:34: T__20
        t__20!

      when 6
        # at line 1:40: T__21
        t__21!

      when 7
        # at line 1:46: T__22
        t__22!

      when 8
        # at line 1:52: T__23
        t__23!

      when 9
        # at line 1:58: T__24
        t__24!

      when 10
        # at line 1:64: T__25
        t__25!

      when 11
        # at line 1:70: BOOLEAN
        boolean!

      when 12
        # at line 1:78: ID
        id!

      when 13
        # at line 1:81: INTEGER
        integer!

      when 14
        # at line 1:89: FLOAT
        float!

      when 15
        # at line 1:95: COMMENT
        comment!

      when 16
        # at line 1:103: WS
        ws!

      when 17
        # at line 1:106: STRING
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
          82:1: FLOAT : ( ( '-' )? ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )? | ( '-' )? '.' ( '0' .. '9' )+ ( EXPONENT )? | ( '-' )? ( '0' .. '9' )+ EXPONENT );
        __dfa_description__
      end
    end
    class DFA23 < ANTLR3::DFA
      EOT = unpack( 1, -1, 1, 11, 2, -1, 1, 11, 1, -1, 1, 20, 2, -1, 2, 
                    11, 2, -1, 1, 24, 3, -1, 1, 11, 1, -1, 1, 28, 2, -1, 
                    2, 11, 1, -1, 1, 11, 1, 32, 1, 11, 1, -1, 3, 11, 1, 
                    -1, 1, 11, 1, 38, 1, 11, 1, 40, 1, 41, 1, -1, 1, 38, 
                    2, -1 )
      EOF = unpack( 42, -1 )
      MIN = unpack( 1, 9, 1, 108, 2, -1, 1, 115, 1, -1, 1, 48, 2, -1, 1, 
                    114, 1, 97, 1, -1, 2, 46, 3, -1, 1, 97, 1, -1, 1, 45, 
                    2, -1, 1, 117, 1, 108, 1, -1, 1, 115, 1, 45, 1, 101, 
                    1, -1, 1, 101, 2, 115, 1, -1, 1, 102, 1, 45, 1, 101, 
                    2, 45, 1, -1, 1, 45, 2, -1 )
      MAX = unpack( 1, 122, 1, 108, 2, -1, 1, 115, 1, -1, 1, 57, 2, -1, 
                    1, 114, 1, 97, 1, -1, 1, 57, 1, 101, 3, -1, 1, 97, 1, 
                    -1, 1, 122, 2, -1, 1, 117, 1, 108, 1, -1, 1, 115, 1, 
                    122, 1, 101, 1, -1, 1, 101, 2, 115, 1, -1, 1, 102, 1, 
                    122, 1, 101, 2, 122, 1, -1, 1, 122, 2, -1 )
      ACCEPT = unpack( 2, -1, 1, 2, 1, 3, 1, -1, 1, 7, 1, -1, 1, 9, 1, 10, 
                       2, -1, 1, 12, 2, -1, 1, 15, 1, 16, 1, 17, 1, -1, 
                       1, 3, 1, -1, 1, 8, 1, 14, 2, -1, 1, 13, 3, -1, 1, 
                       6, 3, -1, 1, 4, 5, -1, 1, 11, 1, -1, 1, 1, 1, 5 )
      SPECIAL = unpack( 42, -1 )
      TRANSITION = [
        unpack( 1, 3, 1, 8, 2, -1, 1, 7, 18, -1, 1, 15, 1, -1, 1, 16, 10, 
                -1, 1, 12, 1, 6, 1, 14, 10, 13, 1, 2, 2, -1, 1, 5, 3, -1, 
                26, 11, 6, -1, 2, 11, 1, 1, 2, 11, 1, 10, 2, 11, 1, 4, 10, 
                11, 1, 9, 6, 11 ),
        unpack( 1, 17 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 19 ),
        unpack(  ),
        unpack( 10, 21 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 22 ),
        unpack( 1, 23 ),
        unpack(  ),
        unpack( 1, 21, 1, -1, 10, 13 ),
        unpack( 1, 21, 1, -1, 10, 13, 11, -1, 1, 21, 31, -1, 1, 21 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 25 ),
        unpack(  ),
        unpack( 1, 11, 2, -1, 10, 11, 7, -1, 26, 11, 4, -1, 1, 11, 1, -1, 
                 1, 26, 16, 11, 1, 27, 8, 11 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 29 ),
        unpack( 1, 30 ),
        unpack(  ),
        unpack( 1, 31 ),
        unpack( 1, 11, 2, -1, 10, 11, 7, -1, 26, 11, 4, -1, 1, 11, 1, -1, 
                 26, 11 ),
        unpack( 1, 33 ),
        unpack(  ),
        unpack( 1, 34 ),
        unpack( 1, 35 ),
        unpack( 1, 36 ),
        unpack(  ),
        unpack( 1, 37 ),
        unpack( 1, 11, 2, -1, 10, 11, 7, -1, 26, 11, 4, -1, 1, 11, 1, -1, 
                 26, 11 ),
        unpack( 1, 39 ),
        unpack( 1, 11, 2, -1, 10, 11, 7, -1, 26, 11, 4, -1, 1, 11, 1, -1, 
                 26, 11 ),
        unpack( 1, 11, 2, -1, 10, 11, 7, -1, 26, 11, 4, -1, 1, 11, 1, -1, 
                 26, 11 ),
        unpack(  ),
        unpack( 1, 11, 2, -1, 10, 11, 7, -1, 26, 11, 4, -1, 1, 11, 1, -1, 
                 26, 11 ),
        unpack(  ),
        unpack(  )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 23
      

      def description
        <<-'__dfa_description__'.strip!
          1:1: Tokens : ( T__16 | T__17 | T__18 | T__19 | T__20 | T__21 | T__22 | T__23 | T__24 | T__25 | BOOLEAN | ID | INTEGER | FLOAT | COMMENT | WS | STRING );
        __dfa_description__
      end
    end

    
    private
    
    def initialize_dfas
      super rescue nil
      @dfa14 = DFA14.new( self, 14 )
      @dfa23 = DFA23.new( self, 23 )

    end
  end # class Lexer < ANTLR3::Lexer

  at_exit { Lexer.main( ARGV ) } if __FILE__ == $0
end

