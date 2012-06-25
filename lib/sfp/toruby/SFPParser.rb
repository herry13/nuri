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

# - - - - - - begin action @parser::header - - - - - -
# SFP.g





# - - - - - - end action @parser::header - - - - - - -


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
                   :ID => 4, :EOF => -1, :T__19 => 19, :ESC_SEQ => 11, :WS => 10, 
                   :T__16 => 16, :BOOLEAN => 5, :T__18 => 18, :T__17 => 17, 
                   :COMMENT => 9, :STRING => 12 )

    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "ID", "BOOLEAN", "INTEGER", "EXPONENT", "FLOAT", "COMMENT", 
                    "WS", "ESC_SEQ", "STRING", "HEX_DIGIT", "UNICODE_ESC", 
                    "OCTAL_ESC", "'class'", "':'", "'\\t'", "'isa'", "'isref'", 
                    "'is'", "'='", "'.'", "'\\r'", "'\\n'" )
    
  end


  class Parser < ANTLR3::Parser
    @grammar_home = SFP
    include ANTLR3::ASTBuilder

    RULE_METHODS = [ :sfp, :class_def, :class_attr, :equals_op, :value, 
                     :reference, :nl ].freeze


    include TokenData

    begin
      generated_using( "SFP.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end

    def initialize( input, options = {} )
      super( input, options )


    end

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

    # - - - - - - - - - - - - Rules - - - - - - - - - - - - -
    SfpReturnValue = define_return_scope 

    # 
    # parser rule sfp
    # 
    # (in SFP.g)
    # 40:1: sfp : class_def ;
    # 
    def sfp
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )
      return_value = SfpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      class_def1 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 40:7: class_def
        # --> action
         self.init 
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_class_def_IN_sfp_47 )
        class_def1 = class_def
        @state.following.pop
        @adaptor.add_child( root_0, class_def1.tree )
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 1 )

      end
      
      return return_value
    end

    ClassDefReturnValue = define_return_scope 

    # 
    # parser rule class_def
    # 
    # (in SFP.g)
    # 44:1: class_def : 'class' ID ( ( ':' nl ) ( '\\t' class_attr )+ )? ( nl )+ ;
    # 
    def class_def
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )
      return_value = ClassDefReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal2 = nil
      __ID3__ = nil
      char_literal4 = nil
      char_literal6 = nil
      nl5 = nil
      class_attr7 = nil
      nl8 = nil

      tree_for_string_literal2 = nil
      tree_for_ID3 = nil
      tree_for_char_literal4 = nil
      tree_for_char_literal6 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 45:4: 'class' ID ( ( ':' nl ) ( '\\t' class_attr )+ )? ( nl )+
        string_literal2 = match( T__16, TOKENS_FOLLOWING_T__16_IN_class_def_58 )

        tree_for_string_literal2 = @adaptor.create_with_payload( string_literal2 )
        @adaptor.add_child( root_0, tree_for_string_literal2 )

        __ID3__ = match( ID, TOKENS_FOLLOWING_ID_IN_class_def_60 )

        tree_for_ID3 = @adaptor.create_with_payload( __ID3__ )
        @adaptor.add_child( root_0, tree_for_ID3 )

        # --> action
         @data += "class " + __ID3__.text +
        			"\n	extend Accessor"
        # <-- action
        # at line 46:25: ( ( ':' nl ) ( '\\t' class_attr )+ )?
        alt_2 = 2
        look_2_0 = @input.peek( 1 )

        if ( look_2_0 == T__17 )
          alt_2 = 1
        end
        case alt_2
        when 1
          # at line 46:26: ( ':' nl ) ( '\\t' class_attr )+
          # at line 46:26: ( ':' nl )
          # at line 46:27: ':' nl
          char_literal4 = match( T__17, TOKENS_FOLLOWING_T__17_IN_class_def_64 )

          tree_for_char_literal4 = @adaptor.create_with_payload( char_literal4 )
          @adaptor.add_child( root_0, tree_for_char_literal4 )

          @state.following.push( TOKENS_FOLLOWING_nl_IN_class_def_66 )
          nl5 = nl
          @state.following.pop
          @adaptor.add_child( root_0, nl5.tree )

          # at file 46:34: ( '\\t' class_attr )+
          match_count_1 = 0
          while true
            alt_1 = 2
            look_1_0 = @input.peek( 1 )

            if ( look_1_0 == T__18 )
              alt_1 = 1

            end
            case alt_1
            when 1
              # at line 46:35: '\\t' class_attr
              char_literal6 = match( T__18, TOKENS_FOLLOWING_T__18_IN_class_def_69 )

              tree_for_char_literal6 = @adaptor.create_with_payload( char_literal6 )
              @adaptor.add_child( root_0, tree_for_char_literal6 )

              @state.following.push( TOKENS_FOLLOWING_class_attr_IN_class_def_70 )
              class_attr7 = class_attr
              @state.following.pop
              @adaptor.add_child( root_0, class_attr7.tree )

            else
              match_count_1 > 0 and break
              eee = EarlyExit(1)


              raise eee
            end
            match_count_1 += 1
          end


        end
        # at file 47:3: ( nl )+
        match_count_3 = 0
        while true
          alt_3 = 2
          look_3_0 = @input.peek( 1 )

          if ( look_3_0.between?( T__24, T__25 ) )
            alt_3 = 1

          end
          case alt_3
          when 1
            # at line 47:3: nl
            @state.following.push( TOKENS_FOLLOWING_nl_IN_class_def_78 )
            nl8 = nl
            @state.following.pop
            @adaptor.add_child( root_0, nl8.tree )

          else
            match_count_3 > 0 and break
            eee = EarlyExit(3)


            raise eee
          end
          match_count_3 += 1
        end

        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 2 )

      end
      
      return return_value
    end

    ClassAttrReturnValue = define_return_scope 

    # 
    # parser rule class_attr
    # 
    # (in SFP.g)
    # 50:1: class_attr : ( ID equals_op value nl | ID 'isa' reference nl | ID 'isref' reference nl );
    # 
    def class_attr
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )
      return_value = ClassAttrReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID9__ = nil
      __ID13__ = nil
      string_literal14 = nil
      __ID17__ = nil
      string_literal18 = nil
      equals_op10 = nil
      value11 = nil
      nl12 = nil
      reference15 = nil
      nl16 = nil
      reference19 = nil
      nl20 = nil

      tree_for_ID9 = nil
      tree_for_ID13 = nil
      tree_for_string_literal14 = nil
      tree_for_ID17 = nil
      tree_for_string_literal18 = nil

      begin
        # at line 51:2: ( ID equals_op value nl | ID 'isa' reference nl | ID 'isref' reference nl )
        alt_4 = 3
        look_4_0 = @input.peek( 1 )

        if ( look_4_0 == ID )
          case look_4 = @input.peek( 2 )
          when T__19 then alt_4 = 2
          when T__20 then alt_4 = 3
          when T__21, T__22 then alt_4 = 1
          else
            raise NoViableAlternative( "", 4, 1 )
          end
        else
          raise NoViableAlternative( "", 4, 0 )
        end
        case alt_4
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 51:4: ID equals_op value nl
          __ID9__ = match( ID, TOKENS_FOLLOWING_ID_IN_class_attr_90 )

          tree_for_ID9 = @adaptor.create_with_payload( __ID9__ )
          @adaptor.add_child( root_0, tree_for_ID9 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_class_attr_92 )
          equals_op10 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op10.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_class_attr_94 )
          value11 = value
          @state.following.pop
          @adaptor.add_child( root_0, value11.tree )
          @state.following.push( TOKENS_FOLLOWING_nl_IN_class_attr_96 )
          nl12 = nl
          @state.following.pop
          @adaptor.add_child( root_0, nl12.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 52:4: ID 'isa' reference nl
          __ID13__ = match( ID, TOKENS_FOLLOWING_ID_IN_class_attr_101 )

          tree_for_ID13 = @adaptor.create_with_payload( __ID13__ )
          @adaptor.add_child( root_0, tree_for_ID13 )

          string_literal14 = match( T__19, TOKENS_FOLLOWING_T__19_IN_class_attr_103 )

          tree_for_string_literal14 = @adaptor.create_with_payload( string_literal14 )
          @adaptor.add_child( root_0, tree_for_string_literal14 )

          @state.following.push( TOKENS_FOLLOWING_reference_IN_class_attr_105 )
          reference15 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference15.tree )
          @state.following.push( TOKENS_FOLLOWING_nl_IN_class_attr_107 )
          nl16 = nl
          @state.following.pop
          @adaptor.add_child( root_0, nl16.tree )

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 53:4: ID 'isref' reference nl
          __ID17__ = match( ID, TOKENS_FOLLOWING_ID_IN_class_attr_112 )

          tree_for_ID17 = @adaptor.create_with_payload( __ID17__ )
          @adaptor.add_child( root_0, tree_for_ID17 )

          string_literal18 = match( T__20, TOKENS_FOLLOWING_T__20_IN_class_attr_114 )

          tree_for_string_literal18 = @adaptor.create_with_payload( string_literal18 )
          @adaptor.add_child( root_0, tree_for_string_literal18 )

          @state.following.push( TOKENS_FOLLOWING_reference_IN_class_attr_116 )
          reference19 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference19.tree )
          @state.following.push( TOKENS_FOLLOWING_nl_IN_class_attr_118 )
          nl20 = nl
          @state.following.pop
          @adaptor.add_child( root_0, nl20.tree )

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 3 )

      end
      
      return return_value
    end

    EqualsOpReturnValue = define_return_scope 

    # 
    # parser rule equals_op
    # 
    # (in SFP.g)
    # 56:1: equals_op : ( 'is' | '=' );
    # 
    def equals_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )
      return_value = EqualsOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set21 = nil

      tree_for_set21 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set21 = @input.look
        if @input.peek( 1 ).between?( T__21, T__22 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set21 ) )
          @state.error_recovery = false
        else
          mse = MismatchedSet( nil )
          raise mse
        end


        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 4 )

      end
      
      return return_value
    end

    ValueReturnValue = define_return_scope 

    # 
    # parser rule value
    # 
    # (in SFP.g)
    # 61:1: value : ( BOOLEAN | reference );
    # 
    def value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )
      return_value = ValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __BOOLEAN22__ = nil
      reference23 = nil

      tree_for_BOOLEAN22 = nil

      begin
        # at line 62:2: ( BOOLEAN | reference )
        alt_5 = 2
        look_5_0 = @input.peek( 1 )

        if ( look_5_0 == BOOLEAN )
          alt_5 = 1
        elsif ( look_5_0 == ID )
          alt_5 = 2
        else
          raise NoViableAlternative( "", 5, 0 )
        end
        case alt_5
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 62:4: BOOLEAN
          __BOOLEAN22__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_value_145 )

          tree_for_BOOLEAN22 = @adaptor.create_with_payload( __BOOLEAN22__ )
          @adaptor.add_child( root_0, tree_for_BOOLEAN22 )


        when 2
          root_0 = @adaptor.create_flat_list


          # at line 63:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_value_150 )
          reference23 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference23.tree )

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 5 )

      end
      
      return return_value
    end

    ReferenceReturnValue = define_return_scope 

    # 
    # parser rule reference
    # 
    # (in SFP.g)
    # 66:1: reference : ID ( '.' ID )* ;
    # 
    def reference
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )
      return_value = ReferenceReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID24__ = nil
      char_literal25 = nil
      __ID26__ = nil

      tree_for_ID24 = nil
      tree_for_char_literal25 = nil
      tree_for_ID26 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 67:4: ID ( '.' ID )*
        __ID24__ = match( ID, TOKENS_FOLLOWING_ID_IN_reference_161 )

        tree_for_ID24 = @adaptor.create_with_payload( __ID24__ )
        @adaptor.add_child( root_0, tree_for_ID24 )

        # at line 67:6: ( '.' ID )*
        while true # decision 6
          alt_6 = 2
          look_6_0 = @input.peek( 1 )

          if ( look_6_0 == T__23 )
            alt_6 = 1

          end
          case alt_6
          when 1
            # at line 67:7: '.' ID
            char_literal25 = match( T__23, TOKENS_FOLLOWING_T__23_IN_reference_163 )

            tree_for_char_literal25 = @adaptor.create_with_payload( char_literal25 )
            @adaptor.add_child( root_0, tree_for_char_literal25 )

            __ID26__ = match( ID, TOKENS_FOLLOWING_ID_IN_reference_164 )

            tree_for_ID26 = @adaptor.create_with_payload( __ID26__ )
            @adaptor.add_child( root_0, tree_for_ID26 )


          else
            break # out of loop for decision 6
          end
        end # loop for decision 6
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 6 )

      end
      
      return return_value
    end

    NlReturnValue = define_return_scope 

    # 
    # parser rule nl
    # 
    # (in SFP.g)
    # 94:1: nl : ( '\\r' )? '\\n' ;
    # 
    def nl
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )
      return_value = NlReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal27 = nil
      char_literal28 = nil

      tree_for_char_literal27 = nil
      tree_for_char_literal28 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 94:6: ( '\\r' )? '\\n'
        # at line 94:6: ( '\\r' )?
        alt_7 = 2
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == T__24 )
          alt_7 = 1
        end
        case alt_7
        when 1
          # at line 94:6: '\\r'
          char_literal27 = match( T__24, TOKENS_FOLLOWING_T__24_IN_nl_394 )

          tree_for_char_literal27 = @adaptor.create_with_payload( char_literal27 )
          @adaptor.add_child( root_0, tree_for_char_literal27 )


        end
        char_literal28 = match( T__25, TOKENS_FOLLOWING_T__25_IN_nl_397 )

        tree_for_char_literal28 = @adaptor.create_with_payload( char_literal28 )
        @adaptor.add_child( root_0, tree_for_char_literal28 )

        # --> action
         @data += "\n" 
        # <-- action
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 7 )

      end
      
      return return_value
    end



    TOKENS_FOLLOWING_class_def_IN_sfp_47 = Set[ 1 ]
    TOKENS_FOLLOWING_T__16_IN_class_def_58 = Set[ 4 ]
    TOKENS_FOLLOWING_ID_IN_class_def_60 = Set[ 17, 24, 25 ]
    TOKENS_FOLLOWING_T__17_IN_class_def_64 = Set[ 17, 24, 25 ]
    TOKENS_FOLLOWING_nl_IN_class_def_66 = Set[ 18 ]
    TOKENS_FOLLOWING_T__18_IN_class_def_69 = Set[ 4 ]
    TOKENS_FOLLOWING_class_attr_IN_class_def_70 = Set[ 17, 18, 24, 25 ]
    TOKENS_FOLLOWING_nl_IN_class_def_78 = Set[ 1, 17, 24, 25 ]
    TOKENS_FOLLOWING_ID_IN_class_attr_90 = Set[ 21, 22 ]
    TOKENS_FOLLOWING_equals_op_IN_class_attr_92 = Set[ 4, 5 ]
    TOKENS_FOLLOWING_value_IN_class_attr_94 = Set[ 17, 24, 25 ]
    TOKENS_FOLLOWING_nl_IN_class_attr_96 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_class_attr_101 = Set[ 19 ]
    TOKENS_FOLLOWING_T__19_IN_class_attr_103 = Set[ 4, 5 ]
    TOKENS_FOLLOWING_reference_IN_class_attr_105 = Set[ 17, 24, 25 ]
    TOKENS_FOLLOWING_nl_IN_class_attr_107 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_class_attr_112 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_class_attr_114 = Set[ 4, 5 ]
    TOKENS_FOLLOWING_reference_IN_class_attr_116 = Set[ 17, 24, 25 ]
    TOKENS_FOLLOWING_nl_IN_class_attr_118 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_value_145 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_value_150 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_reference_161 = Set[ 1, 23 ]
    TOKENS_FOLLOWING_T__23_IN_reference_163 = Set[ 4 ]
    TOKENS_FOLLOWING_ID_IN_reference_164 = Set[ 1, 23 ]
    TOKENS_FOLLOWING_T__24_IN_nl_394 = Set[ 25 ]
    TOKENS_FOLLOWING_T__25_IN_nl_397 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end

