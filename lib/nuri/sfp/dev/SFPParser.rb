#!/usr/bin/env ruby
#
# SFP.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: SFP.g
# Generated at: 2012-08-16 18:24:15
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
                   :ID => 6, :T__60 => 60, :EOF => -1, :T__55 => 55, :T__19 => 19, 
                   :T__56 => 56, :T__57 => 57, :T__58 => 58, :ESC_SEQ => 14, 
                   :BOOLEAN => 9, :T__51 => 51, :T__52 => 52, :T__18 => 18, 
                   :T__53 => 53, :T__54 => 54, :T__59 => 59, :NL => 4, :COMMENT => 12, 
                   :T__50 => 50, :T__42 => 42, :T__43 => 43, :T__40 => 40, 
                   :T__41 => 41, :T__46 => 46, :T__47 => 47, :T__44 => 44, 
                   :T__45 => 45, :T__48 => 48, :T__49 => 49, :UNICODE_ESC => 16, 
                   :NULL => 7, :NUMBER => 8, :HEX_DIGIT => 15, :MULTILINE_STRING => 10, 
                   :T__30 => 30, :T__31 => 31, :T__32 => 32, :WS => 13, 
                   :T__33 => 33, :T__34 => 34, :T__35 => 35, :T__36 => 36, 
                   :T__37 => 37, :T__38 => 38, :T__39 => 39, :STRING => 5 )

    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "NL", "STRING", "ID", "NULL", "NUMBER", "BOOLEAN", "MULTILINE_STRING", 
                    "EXPONENT", "COMMENT", "WS", "ESC_SEQ", "HEX_DIGIT", 
                    "UNICODE_ESC", "OCTAL_ESC", "'include'", "'state'", 
                    "'{'", "'}'", "'composite'", "'class'", "'extends'", 
                    "'isa'", "'if'", "'then'", "'or'", "'operator'", "'cost'", 
                    "'conditions'", "'effects'", "'procedure'", "'('", "','", 
                    "')'", "'areall'", "'constraint'", "'foreach'", "'as'", 
                    "'is'", "'in'", "'isnt'", "'not'", "'new'", "'delete'", 
                    "'add('", "'remove('", "'.'", "'isref'", "'='", "'!='", 
                    "'+='", "'-='", "'*='", "'/='", "'>'", "'>='", "'<'", 
                    "'<='" )
    
  end


  class Parser < ANTLR3::Parser
    @grammar_home = SFP
    include ANTLR3::ASTBuilder

    RULE_METHODS = [ :sfp, :include, :include_file, :header, :state, :composite, 
                     :class_definition, :extends_class, :attribute, :object_def, 
                     :object_body, :object_attribute, :state_dependency, 
                     :dep_effect, :operator, :op_param, :op_conditions, 
                     :op_effects, :op_statement, :procedure, :parameters, 
                     :parameter, :conditions, :effects, :constraint, :constraint_body, 
                     :constraint_namespace, :constraint_iterator, :constraint_statement, 
                     :comp_value, :conditional_constraint, :conditional_constraint_then, 
                     :mutation_body, :mutation_iterator, :mutation_statement, 
                     :set_value, :set_item, :value, :primitive_value, :path, 
                     :reference, :reference_type, :equals_op, :not_equals_op, 
                     :binary_op, :binary_comp ].freeze


    include TokenData

    begin
      generated_using( "SFP.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end

    def initialize( input, options = {} )
      super( input, options )


    end

    	include Nuri::Sfp::Sfplibs

    # - - - - - - - - - - - - Rules - - - - - - - - - - - - -
    SfpReturnValue = define_return_scope 

    # 
    # parser rule sfp
    # 
    # (in SFP.g)
    # 37:1: sfp : ( NL )* ( include )* ( header )* ( state | composite | constraint )* ;
    # 
    def sfp
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )
      return_value = SfpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL1__ = nil
      include2 = nil
      header3 = nil
      state4 = nil
      composite5 = nil
      constraint6 = nil

      tree_for_NL1 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 38:4: ( NL )* ( include )* ( header )* ( state | composite | constraint )*
        # --> action
        	self.init	
        # <-- action
        # at line 39:3: ( NL )*
        while true # decision 1
          alt_1 = 2
          look_1_0 = @input.peek( 1 )

          if ( look_1_0 == NL )
            alt_1 = 1

          end
          case alt_1
          when 1
            # at line 39:3: NL
            __NL1__ = match( NL, TOKENS_FOLLOWING_NL_IN_sfp_49 )

            tree_for_NL1 = @adaptor.create_with_payload( __NL1__ )
            @adaptor.add_child( root_0, tree_for_NL1 )


          else
            break # out of loop for decision 1
          end
        end # loop for decision 1
        # at line 39:7: ( include )*
        while true # decision 2
          alt_2 = 2
          look_2_0 = @input.peek( 1 )

          if ( look_2_0 == T__18 )
            alt_2 = 1

          end
          case alt_2
          when 1
            # at line 39:7: include
            @state.following.push( TOKENS_FOLLOWING_include_IN_sfp_52 )
            include2 = include
            @state.following.pop
            @adaptor.add_child( root_0, include2.tree )

          else
            break # out of loop for decision 2
          end
        end # loop for decision 2
        # at line 39:16: ( header )*
        while true # decision 3
          alt_3 = 2
          look_3_0 = @input.peek( 1 )

          if ( look_3_0 == T__23 || look_3_0 == T__33 )
            alt_3 = 1

          end
          case alt_3
          when 1
            # at line 39:16: header
            @state.following.push( TOKENS_FOLLOWING_header_IN_sfp_55 )
            header3 = header
            @state.following.pop
            @adaptor.add_child( root_0, header3.tree )

          else
            break # out of loop for decision 3
          end
        end # loop for decision 3
        # --> action
        	self.expand_classes	
        # <-- action
        # at line 41:3: ( state | composite | constraint )*
        while true # decision 4
          alt_4 = 4
          look_4_0 = @input.peek( 1 )

          if ( look_4_0 == ID )
            look_4_2 = @input.peek( 2 )

            if ( look_4_2 == T__38 )
              alt_4 = 3
            elsif ( look_4_2.between?( T__19, T__20 ) )
              alt_4 = 1

            end
          elsif ( look_4_0 == T__22 )
            alt_4 = 2

          end
          case alt_4
          when 1
            # at line 41:4: state
            @state.following.push( TOKENS_FOLLOWING_state_IN_sfp_65 )
            state4 = state
            @state.following.pop
            @adaptor.add_child( root_0, state4.tree )

          when 2
            # at line 41:12: composite
            @state.following.push( TOKENS_FOLLOWING_composite_IN_sfp_69 )
            composite5 = composite
            @state.following.pop
            @adaptor.add_child( root_0, composite5.tree )

          when 3
            # at line 41:24: constraint
            @state.following.push( TOKENS_FOLLOWING_constraint_IN_sfp_73 )
            constraint6 = constraint
            @state.following.pop
            @adaptor.add_child( root_0, constraint6.tree )

          else
            break # out of loop for decision 4
          end
        end # loop for decision 4
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

    IncludeReturnValue = define_return_scope 

    # 
    # parser rule include
    # 
    # (in SFP.g)
    # 44:1: include : 'include' include_file ( NL )+ ;
    # 
    def include
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )
      return_value = IncludeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal7 = nil
      __NL9__ = nil
      include_file8 = nil

      tree_for_string_literal7 = nil
      tree_for_NL9 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 45:4: 'include' include_file ( NL )+
        string_literal7 = match( T__18, TOKENS_FOLLOWING_T__18_IN_include_86 )

        tree_for_string_literal7 = @adaptor.create_with_payload( string_literal7 )
        @adaptor.add_child( root_0, tree_for_string_literal7 )

        @state.following.push( TOKENS_FOLLOWING_include_file_IN_include_88 )
        include_file8 = include_file
        @state.following.pop
        @adaptor.add_child( root_0, include_file8.tree )
        # at file 45:27: ( NL )+
        match_count_5 = 0
        while true
          alt_5 = 2
          look_5_0 = @input.peek( 1 )

          if ( look_5_0 == NL )
            alt_5 = 1

          end
          case alt_5
          when 1
            # at line 45:27: NL
            __NL9__ = match( NL, TOKENS_FOLLOWING_NL_IN_include_90 )

            tree_for_NL9 = @adaptor.create_with_payload( __NL9__ )
            @adaptor.add_child( root_0, tree_for_NL9 )


          else
            match_count_5 > 0 and break
            eee = EarlyExit(5)


            raise eee
          end
          match_count_5 += 1
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

    IncludeFileReturnValue = define_return_scope 

    # 
    # parser rule include_file
    # 
    # (in SFP.g)
    # 48:1: include_file : STRING ;
    # 
    def include_file
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )
      return_value = IncludeFileReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __STRING10__ = nil

      tree_for_STRING10 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 49:4: STRING
        __STRING10__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_include_file_102 )

        tree_for_STRING10 = @adaptor.create_with_payload( __STRING10__ )
        @adaptor.add_child( root_0, tree_for_STRING10 )

        # --> action
         self.process_file(__STRING10__.text[1,__STRING10__.text.length-2]) 
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
        # trace_out( __method__, 3 )

      end
      
      return return_value
    end

    HeaderReturnValue = define_return_scope 

    # 
    # parser rule header
    # 
    # (in SFP.g)
    # 53:1: header : ( class_definition | procedure );
    # 
    def header
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )
      return_value = HeaderReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      class_definition11 = nil
      procedure12 = nil


      begin
        # at line 54:2: ( class_definition | procedure )
        alt_6 = 2
        look_6_0 = @input.peek( 1 )

        if ( look_6_0 == T__23 )
          alt_6 = 1
        elsif ( look_6_0 == T__33 )
          alt_6 = 2
        else
          raise NoViableAlternative( "", 6, 0 )
        end
        case alt_6
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 54:4: class_definition
          @state.following.push( TOKENS_FOLLOWING_class_definition_IN_header_118 )
          class_definition11 = class_definition
          @state.following.pop
          @adaptor.add_child( root_0, class_definition11.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 55:4: procedure
          @state.following.push( TOKENS_FOLLOWING_procedure_IN_header_123 )
          procedure12 = procedure
          @state.following.pop
          @adaptor.add_child( root_0, procedure12.tree )

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
        # trace_out( __method__, 4 )

      end
      
      return return_value
    end

    StateReturnValue = define_return_scope 

    # 
    # parser rule state
    # 
    # (in SFP.g)
    # 58:1: state : ID ( 'state' )? '{' ( NL )* ( attribute )* '}' ( NL )* ;
    # 
    def state
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )
      return_value = StateReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID13__ = nil
      string_literal14 = nil
      char_literal15 = nil
      __NL16__ = nil
      char_literal18 = nil
      __NL19__ = nil
      attribute17 = nil

      tree_for_ID13 = nil
      tree_for_string_literal14 = nil
      tree_for_char_literal15 = nil
      tree_for_NL16 = nil
      tree_for_char_literal18 = nil
      tree_for_NL19 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 59:4: ID ( 'state' )? '{' ( NL )* ( attribute )* '}' ( NL )*
        __ID13__ = match( ID, TOKENS_FOLLOWING_ID_IN_state_134 )

        tree_for_ID13 = @adaptor.create_with_payload( __ID13__ )
        @adaptor.add_child( root_0, tree_for_ID13 )

        # at line 59:7: ( 'state' )?
        alt_7 = 2
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == T__19 )
          alt_7 = 1
        end
        case alt_7
        when 1
          # at line 59:8: 'state'
          string_literal14 = match( T__19, TOKENS_FOLLOWING_T__19_IN_state_137 )

          tree_for_string_literal14 = @adaptor.create_with_payload( string_literal14 )
          @adaptor.add_child( root_0, tree_for_string_literal14 )


        end
        # --> action

        			@now[__ID13__.text] = { '_self' => __ID13__.text,
        				'_context' => 'state',
        				'_parent' => @now
        			}
        			@now = @now[__ID13__.text]
        		
        # <-- action
        char_literal15 = match( T__20, TOKENS_FOLLOWING_T__20_IN_state_147 )

        tree_for_char_literal15 = @adaptor.create_with_payload( char_literal15 )
        @adaptor.add_child( root_0, tree_for_char_literal15 )

        # at line 67:7: ( NL )*
        while true # decision 8
          alt_8 = 2
          look_8_0 = @input.peek( 1 )

          if ( look_8_0 == NL )
            alt_8 = 1

          end
          case alt_8
          when 1
            # at line 67:7: NL
            __NL16__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_149 )

            tree_for_NL16 = @adaptor.create_with_payload( __NL16__ )
            @adaptor.add_child( root_0, tree_for_NL16 )


          else
            break # out of loop for decision 8
          end
        end # loop for decision 8
        # at line 68:3: ( attribute )*
        while true # decision 9
          alt_9 = 2
          look_9_0 = @input.peek( 1 )

          if ( look_9_0 == ID )
            alt_9 = 1

          end
          case alt_9
          when 1
            # at line 68:3: attribute
            @state.following.push( TOKENS_FOLLOWING_attribute_IN_state_154 )
            attribute17 = attribute
            @state.following.pop
            @adaptor.add_child( root_0, attribute17.tree )

          else
            break # out of loop for decision 9
          end
        end # loop for decision 9
        char_literal18 = match( T__21, TOKENS_FOLLOWING_T__21_IN_state_159 )

        tree_for_char_literal18 = @adaptor.create_with_payload( char_literal18 )
        @adaptor.add_child( root_0, tree_for_char_literal18 )

        # at line 69:7: ( NL )*
        while true # decision 10
          alt_10 = 2
          look_10_0 = @input.peek( 1 )

          if ( look_10_0 == NL )
            alt_10 = 1

          end
          case alt_10
          when 1
            # at line 69:7: NL
            __NL19__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_161 )

            tree_for_NL19 = @adaptor.create_with_payload( __NL19__ )
            @adaptor.add_child( root_0, tree_for_NL19 )


          else
            break # out of loop for decision 10
          end
        end # loop for decision 10
        # --> action
        	self.goto_parent(true)	
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
        # trace_out( __method__, 5 )

      end
      
      return return_value
    end

    CompositeReturnValue = define_return_scope 

    # 
    # parser rule composite
    # 
    # (in SFP.g)
    # 73:1: composite : 'composite' ID '{' ( NL )* ( attribute | constraint )* '}' ( NL )* ;
    # 
    def composite
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )
      return_value = CompositeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal20 = nil
      __ID21__ = nil
      char_literal22 = nil
      __NL23__ = nil
      char_literal26 = nil
      __NL27__ = nil
      attribute24 = nil
      constraint25 = nil

      tree_for_string_literal20 = nil
      tree_for_ID21 = nil
      tree_for_char_literal22 = nil
      tree_for_NL23 = nil
      tree_for_char_literal26 = nil
      tree_for_NL27 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 74:4: 'composite' ID '{' ( NL )* ( attribute | constraint )* '}' ( NL )*
        string_literal20 = match( T__22, TOKENS_FOLLOWING_T__22_IN_composite_177 )

        tree_for_string_literal20 = @adaptor.create_with_payload( string_literal20 )
        @adaptor.add_child( root_0, tree_for_string_literal20 )

        __ID21__ = match( ID, TOKENS_FOLLOWING_ID_IN_composite_179 )

        tree_for_ID21 = @adaptor.create_with_payload( __ID21__ )
        @adaptor.add_child( root_0, tree_for_ID21 )

        # --> action

        			@now[__ID21__.text] = { '_self' => __ID21__.text,
        				'_context' => 'composite',
        				'_parent' => @now
        			}
        			@now = @now[__ID21__.text]
        		
        # <-- action
        char_literal22 = match( T__20, TOKENS_FOLLOWING_T__20_IN_composite_187 )

        tree_for_char_literal22 = @adaptor.create_with_payload( char_literal22 )
        @adaptor.add_child( root_0, tree_for_char_literal22 )

        # at line 82:7: ( NL )*
        while true # decision 11
          alt_11 = 2
          look_11_0 = @input.peek( 1 )

          if ( look_11_0 == NL )
            alt_11 = 1

          end
          case alt_11
          when 1
            # at line 82:7: NL
            __NL23__ = match( NL, TOKENS_FOLLOWING_NL_IN_composite_189 )

            tree_for_NL23 = @adaptor.create_with_payload( __NL23__ )
            @adaptor.add_child( root_0, tree_for_NL23 )


          else
            break # out of loop for decision 11
          end
        end # loop for decision 11
        # at line 82:11: ( attribute | constraint )*
        while true # decision 12
          alt_12 = 3
          look_12_0 = @input.peek( 1 )

          if ( look_12_0 == ID )
            look_12_2 = @input.peek( 2 )

            if ( look_12_2 == T__38 )
              alt_12 = 2
            elsif ( look_12_2 == NL || look_12_2 == T__20 || look_12_2 == T__25 || look_12_2 == T__41 || look_12_2.between?( T__50, T__51 ) )
              alt_12 = 1

            end

          end
          case alt_12
          when 1
            # at line 82:13: attribute
            @state.following.push( TOKENS_FOLLOWING_attribute_IN_composite_194 )
            attribute24 = attribute
            @state.following.pop
            @adaptor.add_child( root_0, attribute24.tree )

          when 2
            # at line 82:25: constraint
            @state.following.push( TOKENS_FOLLOWING_constraint_IN_composite_198 )
            constraint25 = constraint
            @state.following.pop
            @adaptor.add_child( root_0, constraint25.tree )

          else
            break # out of loop for decision 12
          end
        end # loop for decision 12
        char_literal26 = match( T__21, TOKENS_FOLLOWING_T__21_IN_composite_203 )

        tree_for_char_literal26 = @adaptor.create_with_payload( char_literal26 )
        @adaptor.add_child( root_0, tree_for_char_literal26 )

        # at line 82:43: ( NL )*
        while true # decision 13
          alt_13 = 2
          look_13_0 = @input.peek( 1 )

          if ( look_13_0 == NL )
            alt_13 = 1

          end
          case alt_13
          when 1
            # at line 82:43: NL
            __NL27__ = match( NL, TOKENS_FOLLOWING_NL_IN_composite_205 )

            tree_for_NL27 = @adaptor.create_with_payload( __NL27__ )
            @adaptor.add_child( root_0, tree_for_NL27 )


          else
            break # out of loop for decision 13
          end
        end # loop for decision 13
        # --> action
        	self.goto_parent(true)	
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
        # trace_out( __method__, 6 )

      end
      
      return return_value
    end

    ClassDefinitionReturnValue = define_return_scope 

    # 
    # parser rule class_definition
    # 
    # (in SFP.g)
    # 86:1: class_definition : 'class' ID ( extends_class )? ( '{' ( NL )* ( attribute | procedure )* '}' )? ( NL )* ;
    # 
    def class_definition
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )
      return_value = ClassDefinitionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal28 = nil
      __ID29__ = nil
      char_literal31 = nil
      __NL32__ = nil
      char_literal35 = nil
      __NL36__ = nil
      extends_class30 = nil
      attribute33 = nil
      procedure34 = nil

      tree_for_string_literal28 = nil
      tree_for_ID29 = nil
      tree_for_char_literal31 = nil
      tree_for_NL32 = nil
      tree_for_char_literal35 = nil
      tree_for_NL36 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 87:4: 'class' ID ( extends_class )? ( '{' ( NL )* ( attribute | procedure )* '}' )? ( NL )*
        string_literal28 = match( T__23, TOKENS_FOLLOWING_T__23_IN_class_definition_221 )

        tree_for_string_literal28 = @adaptor.create_with_payload( string_literal28 )
        @adaptor.add_child( root_0, tree_for_string_literal28 )

        __ID29__ = match( ID, TOKENS_FOLLOWING_ID_IN_class_definition_223 )

        tree_for_ID29 = @adaptor.create_with_payload( __ID29__ )
        @adaptor.add_child( root_0, tree_for_ID29 )

        # --> action

        			@now[__ID29__.text] = { '_self' => __ID29__.text,
        				'_context' => 'class',
        				'_parent' => @now
        			}
        			@now = @now[__ID29__.text]
        		
        # <-- action
        # at line 95:3: ( extends_class )?
        alt_14 = 2
        look_14_0 = @input.peek( 1 )

        if ( look_14_0 == T__24 )
          alt_14 = 1
        end
        case alt_14
        when 1
          # at line 95:4: extends_class
          @state.following.push( TOKENS_FOLLOWING_extends_class_IN_class_definition_232 )
          extends_class30 = extends_class
          @state.following.pop
          @adaptor.add_child( root_0, extends_class30.tree )
          # --> action

          			@now['_extends'] = ( extends_class30.nil? ? nil : extends_class30.val )
          		
          # <-- action

        end
        # at line 100:3: ( '{' ( NL )* ( attribute | procedure )* '}' )?
        alt_17 = 2
        look_17_0 = @input.peek( 1 )

        if ( look_17_0 == T__20 )
          alt_17 = 1
        end
        case alt_17
        when 1
          # at line 100:4: '{' ( NL )* ( attribute | procedure )* '}'
          char_literal31 = match( T__20, TOKENS_FOLLOWING_T__20_IN_class_definition_246 )

          tree_for_char_literal31 = @adaptor.create_with_payload( char_literal31 )
          @adaptor.add_child( root_0, tree_for_char_literal31 )

          # at line 100:8: ( NL )*
          while true # decision 15
            alt_15 = 2
            look_15_0 = @input.peek( 1 )

            if ( look_15_0 == NL )
              alt_15 = 1

            end
            case alt_15
            when 1
              # at line 100:8: NL
              __NL32__ = match( NL, TOKENS_FOLLOWING_NL_IN_class_definition_248 )

              tree_for_NL32 = @adaptor.create_with_payload( __NL32__ )
              @adaptor.add_child( root_0, tree_for_NL32 )


            else
              break # out of loop for decision 15
            end
          end # loop for decision 15
          # at line 100:12: ( attribute | procedure )*
          while true # decision 16
            alt_16 = 3
            look_16_0 = @input.peek( 1 )

            if ( look_16_0 == ID )
              alt_16 = 1
            elsif ( look_16_0 == T__33 )
              alt_16 = 2

            end
            case alt_16
            when 1
              # at line 100:14: attribute
              @state.following.push( TOKENS_FOLLOWING_attribute_IN_class_definition_253 )
              attribute33 = attribute
              @state.following.pop
              @adaptor.add_child( root_0, attribute33.tree )

            when 2
              # at line 100:26: procedure
              @state.following.push( TOKENS_FOLLOWING_procedure_IN_class_definition_257 )
              procedure34 = procedure
              @state.following.pop
              @adaptor.add_child( root_0, procedure34.tree )

            else
              break # out of loop for decision 16
            end
          end # loop for decision 16
          char_literal35 = match( T__21, TOKENS_FOLLOWING_T__21_IN_class_definition_262 )

          tree_for_char_literal35 = @adaptor.create_with_payload( char_literal35 )
          @adaptor.add_child( root_0, tree_for_char_literal35 )


        end
        # at line 100:45: ( NL )*
        while true # decision 18
          alt_18 = 2
          look_18_0 = @input.peek( 1 )

          if ( look_18_0 == NL )
            alt_18 = 1

          end
          case alt_18
          when 1
            # at line 100:45: NL
            __NL36__ = match( NL, TOKENS_FOLLOWING_NL_IN_class_definition_266 )

            tree_for_NL36 = @adaptor.create_with_payload( __NL36__ )
            @adaptor.add_child( root_0, tree_for_NL36 )


          else
            break # out of loop for decision 18
          end
        end # loop for decision 18
        # --> action
        	self.goto_parent()	
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

    ExtendsClassReturnValue = define_return_scope :val

    # 
    # parser rule extends_class
    # 
    # (in SFP.g)
    # 104:1: extends_class returns [val] : 'extends' path ;
    # 
    def extends_class
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )
      return_value = ExtendsClassReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal37 = nil
      path38 = nil

      tree_for_string_literal37 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 105:4: 'extends' path
        string_literal37 = match( T__24, TOKENS_FOLLOWING_T__24_IN_extends_class_287 )

        tree_for_string_literal37 = @adaptor.create_with_payload( string_literal37 )
        @adaptor.add_child( root_0, tree_for_string_literal37 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_extends_class_289 )
        path38 = path
        @state.following.pop
        @adaptor.add_child( root_0, path38.tree )
        # --> action

        			return_value.val = self.to_ref(( path38 && @input.to_s( path38.start, path38.stop ) ))
        			@unexpanded_classes.push(@now)
        		
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
        # trace_out( __method__, 8 )

      end
      
      return return_value
    end

    AttributeReturnValue = define_return_scope 

    # 
    # parser rule attribute
    # 
    # (in SFP.g)
    # 112:1: attribute : ( ID equals_op value ( NL )+ | ID reference_type ( NL )+ | object_def ( NL )+ );
    # 
    def attribute
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )
      return_value = AttributeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID39__ = nil
      __NL42__ = nil
      __ID43__ = nil
      __NL45__ = nil
      __NL47__ = nil
      equals_op40 = nil
      value41 = nil
      reference_type44 = nil
      object_def46 = nil

      tree_for_ID39 = nil
      tree_for_NL42 = nil
      tree_for_ID43 = nil
      tree_for_NL45 = nil
      tree_for_NL47 = nil

      begin
        # at line 113:2: ( ID equals_op value ( NL )+ | ID reference_type ( NL )+ | object_def ( NL )+ )
        alt_22 = 3
        look_22_0 = @input.peek( 1 )

        if ( look_22_0 == ID )
          case look_22 = @input.peek( 2 )
          when T__41, T__51 then alt_22 = 1
          when T__50 then alt_22 = 2
          when NL, T__20, T__25 then alt_22 = 3
          else
            raise NoViableAlternative( "", 22, 1 )
          end
        else
          raise NoViableAlternative( "", 22, 0 )
        end
        case alt_22
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 113:4: ID equals_op value ( NL )+
          __ID39__ = match( ID, TOKENS_FOLLOWING_ID_IN_attribute_304 )

          tree_for_ID39 = @adaptor.create_with_payload( __ID39__ )
          @adaptor.add_child( root_0, tree_for_ID39 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_attribute_306 )
          equals_op40 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op40.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_attribute_308 )
          value41 = value
          @state.following.pop
          @adaptor.add_child( root_0, value41.tree )
          # at file 113:23: ( NL )+
          match_count_19 = 0
          while true
            alt_19 = 2
            look_19_0 = @input.peek( 1 )

            if ( look_19_0 == NL )
              alt_19 = 1

            end
            case alt_19
            when 1
              # at line 113:23: NL
              __NL42__ = match( NL, TOKENS_FOLLOWING_NL_IN_attribute_310 )

              tree_for_NL42 = @adaptor.create_with_payload( __NL42__ )
              @adaptor.add_child( root_0, tree_for_NL42 )


            else
              match_count_19 > 0 and break
              eee = EarlyExit(19)


              raise eee
            end
            match_count_19 += 1
          end

          # --> action
          	@now[__ID39__.text] = ( value41.nil? ? nil : value41.val )	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 115:4: ID reference_type ( NL )+
          __ID43__ = match( ID, TOKENS_FOLLOWING_ID_IN_attribute_320 )

          tree_for_ID43 = @adaptor.create_with_payload( __ID43__ )
          @adaptor.add_child( root_0, tree_for_ID43 )

          @state.following.push( TOKENS_FOLLOWING_reference_type_IN_attribute_322 )
          reference_type44 = reference_type
          @state.following.pop
          @adaptor.add_child( root_0, reference_type44.tree )
          # at file 115:22: ( NL )+
          match_count_20 = 0
          while true
            alt_20 = 2
            look_20_0 = @input.peek( 1 )

            if ( look_20_0 == NL )
              alt_20 = 1

            end
            case alt_20
            when 1
              # at line 115:22: NL
              __NL45__ = match( NL, TOKENS_FOLLOWING_NL_IN_attribute_324 )

              tree_for_NL45 = @adaptor.create_with_payload( __NL45__ )
              @adaptor.add_child( root_0, tree_for_NL45 )


            else
              match_count_20 > 0 and break
              eee = EarlyExit(20)


              raise eee
            end
            match_count_20 += 1
          end

          # --> action
          	@now[__ID43__.text] = ( reference_type44.nil? ? nil : reference_type44.val )	
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 117:4: object_def ( NL )+
          @state.following.push( TOKENS_FOLLOWING_object_def_IN_attribute_334 )
          object_def46 = object_def
          @state.following.pop
          @adaptor.add_child( root_0, object_def46.tree )
          # at file 117:15: ( NL )+
          match_count_21 = 0
          while true
            alt_21 = 2
            look_21_0 = @input.peek( 1 )

            if ( look_21_0 == NL )
              alt_21 = 1

            end
            case alt_21
            when 1
              # at line 117:15: NL
              __NL47__ = match( NL, TOKENS_FOLLOWING_NL_IN_attribute_336 )

              tree_for_NL47 = @adaptor.create_with_payload( __NL47__ )
              @adaptor.add_child( root_0, tree_for_NL47 )


            else
              match_count_21 > 0 and break
              eee = EarlyExit(21)


              raise eee
            end
            match_count_21 += 1
          end


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
        # trace_out( __method__, 9 )

      end
      
      return return_value
    end

    ObjectDefReturnValue = define_return_scope 

    # 
    # parser rule object_def
    # 
    # (in SFP.g)
    # 120:1: object_def : ID ( 'isa' path )? ( object_body )? ;
    # 
    def object_def
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )
      return_value = ObjectDefReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID48__ = nil
      string_literal49 = nil
      path50 = nil
      object_body51 = nil

      tree_for_ID48 = nil
      tree_for_string_literal49 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 121:4: ID ( 'isa' path )? ( object_body )?
        __ID48__ = match( ID, TOKENS_FOLLOWING_ID_IN_object_def_348 )

        tree_for_ID48 = @adaptor.create_with_payload( __ID48__ )
        @adaptor.add_child( root_0, tree_for_ID48 )

        # --> action

        			@now[__ID48__.text] = {	'_self' => __ID48__.text,
        				'_context' => 'object',
        				'_parent' => @now,
        				'_isa' => '$.Object'
        			}
        			@now = @now[__ID48__.text]
        		
        # <-- action
        # at line 130:3: ( 'isa' path )?
        alt_23 = 2
        look_23_0 = @input.peek( 1 )

        if ( look_23_0 == T__25 )
          alt_23 = 1
        end
        case alt_23
        when 1
          # at line 130:4: 'isa' path
          string_literal49 = match( T__25, TOKENS_FOLLOWING_T__25_IN_object_def_357 )

          tree_for_string_literal49 = @adaptor.create_with_payload( string_literal49 )
          @adaptor.add_child( root_0, tree_for_string_literal49 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_object_def_359 )
          path50 = path
          @state.following.pop
          @adaptor.add_child( root_0, path50.tree )
          # --> action

          			@now['_isa'] = self.to_ref(( path50 && @input.to_s( path50.start, path50.stop ) ))
          			self.expand_object(@now)
          		
          # <-- action

        end
        # at line 136:3: ( object_body )?
        alt_24 = 2
        look_24_0 = @input.peek( 1 )

        if ( look_24_0 == T__20 )
          alt_24 = 1
        end
        case alt_24
        when 1
          # at line 136:3: object_body
          @state.following.push( TOKENS_FOLLOWING_object_body_IN_object_def_372 )
          object_body51 = object_body
          @state.following.pop
          @adaptor.add_child( root_0, object_body51.tree )

        end
        # --> action
        	self.goto_parent();	
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
        # trace_out( __method__, 10 )

      end
      
      return return_value
    end

    ObjectBodyReturnValue = define_return_scope 

    # 
    # parser rule object_body
    # 
    # (in SFP.g)
    # 140:1: object_body : '{' ( NL )* ( object_attribute | state_dependency | operator )* '}' ;
    # 
    def object_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )
      return_value = ObjectBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal52 = nil
      __NL53__ = nil
      char_literal57 = nil
      object_attribute54 = nil
      state_dependency55 = nil
      operator56 = nil

      tree_for_char_literal52 = nil
      tree_for_NL53 = nil
      tree_for_char_literal57 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 141:4: '{' ( NL )* ( object_attribute | state_dependency | operator )* '}'
        char_literal52 = match( T__20, TOKENS_FOLLOWING_T__20_IN_object_body_388 )

        tree_for_char_literal52 = @adaptor.create_with_payload( char_literal52 )
        @adaptor.add_child( root_0, tree_for_char_literal52 )

        # at line 141:8: ( NL )*
        while true # decision 25
          alt_25 = 2
          look_25_0 = @input.peek( 1 )

          if ( look_25_0 == NL )
            alt_25 = 1

          end
          case alt_25
          when 1
            # at line 141:8: NL
            __NL53__ = match( NL, TOKENS_FOLLOWING_NL_IN_object_body_390 )

            tree_for_NL53 = @adaptor.create_with_payload( __NL53__ )
            @adaptor.add_child( root_0, tree_for_NL53 )


          else
            break # out of loop for decision 25
          end
        end # loop for decision 25
        # at line 141:12: ( object_attribute | state_dependency | operator )*
        while true # decision 26
          alt_26 = 4
          case look_26 = @input.peek( 1 )
          when ID then alt_26 = 1
          when T__26 then alt_26 = 2
          when T__29 then alt_26 = 3
          end
          case alt_26
          when 1
            # at line 141:14: object_attribute
            @state.following.push( TOKENS_FOLLOWING_object_attribute_IN_object_body_395 )
            object_attribute54 = object_attribute
            @state.following.pop
            @adaptor.add_child( root_0, object_attribute54.tree )

          when 2
            # at line 141:33: state_dependency
            @state.following.push( TOKENS_FOLLOWING_state_dependency_IN_object_body_399 )
            state_dependency55 = state_dependency
            @state.following.pop
            @adaptor.add_child( root_0, state_dependency55.tree )

          when 3
            # at line 141:52: operator
            @state.following.push( TOKENS_FOLLOWING_operator_IN_object_body_403 )
            operator56 = operator
            @state.following.pop
            @adaptor.add_child( root_0, operator56.tree )

          else
            break # out of loop for decision 26
          end
        end # loop for decision 26
        char_literal57 = match( T__21, TOKENS_FOLLOWING_T__21_IN_object_body_408 )

        tree_for_char_literal57 = @adaptor.create_with_payload( char_literal57 )
        @adaptor.add_child( root_0, tree_for_char_literal57 )

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
        # trace_out( __method__, 11 )

      end
      
      return return_value
    end

    ObjectAttributeReturnValue = define_return_scope 

    # 
    # parser rule object_attribute
    # 
    # (in SFP.g)
    # 144:1: object_attribute : ( attribute | ID equals_op NULL ( NL )+ );
    # 
    def object_attribute
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )
      return_value = ObjectAttributeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID59__ = nil
      __NULL61__ = nil
      __NL62__ = nil
      attribute58 = nil
      equals_op60 = nil

      tree_for_ID59 = nil
      tree_for_NULL61 = nil
      tree_for_NL62 = nil

      begin
        # at line 145:2: ( attribute | ID equals_op NULL ( NL )+ )
        alt_28 = 2
        look_28_0 = @input.peek( 1 )

        if ( look_28_0 == ID )
          look_28_1 = @input.peek( 2 )

          if ( look_28_1 == T__41 || look_28_1 == T__51 )
            look_28_2 = @input.peek( 3 )

            if ( look_28_2.between?( STRING, ID ) || look_28_2.between?( NUMBER, MULTILINE_STRING ) || look_28_2 == T__34 )
              alt_28 = 1
            elsif ( look_28_2 == NULL )
              alt_28 = 2
            else
              raise NoViableAlternative( "", 28, 2 )
            end
          elsif ( look_28_1 == NL || look_28_1 == T__20 || look_28_1 == T__25 || look_28_1 == T__50 )
            alt_28 = 1
          else
            raise NoViableAlternative( "", 28, 1 )
          end
        else
          raise NoViableAlternative( "", 28, 0 )
        end
        case alt_28
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 145:4: attribute
          @state.following.push( TOKENS_FOLLOWING_attribute_IN_object_attribute_419 )
          attribute58 = attribute
          @state.following.pop
          @adaptor.add_child( root_0, attribute58.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 146:4: ID equals_op NULL ( NL )+
          __ID59__ = match( ID, TOKENS_FOLLOWING_ID_IN_object_attribute_424 )

          tree_for_ID59 = @adaptor.create_with_payload( __ID59__ )
          @adaptor.add_child( root_0, tree_for_ID59 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_object_attribute_426 )
          equals_op60 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op60.tree )
          __NULL61__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_object_attribute_428 )

          tree_for_NULL61 = @adaptor.create_with_payload( __NULL61__ )
          @adaptor.add_child( root_0, tree_for_NULL61 )

          # at file 146:22: ( NL )+
          match_count_27 = 0
          while true
            alt_27 = 2
            look_27_0 = @input.peek( 1 )

            if ( look_27_0 == NL )
              alt_27 = 1

            end
            case alt_27
            when 1
              # at line 146:22: NL
              __NL62__ = match( NL, TOKENS_FOLLOWING_NL_IN_object_attribute_430 )

              tree_for_NL62 = @adaptor.create_with_payload( __NL62__ )
              @adaptor.add_child( root_0, tree_for_NL62 )


            else
              match_count_27 > 0 and break
              eee = EarlyExit(27)


              raise eee
            end
            match_count_27 += 1
          end

          # --> action
          	@now[__ID59__.text] = self.null_value	
          # <-- action

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
        # trace_out( __method__, 12 )

      end
      
      return return_value
    end

    StateDependencyReturnValue = define_return_scope 

    # 
    # parser rule state_dependency
    # 
    # (in SFP.g)
    # 150:1: state_dependency : 'if' dep_effect ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )* ( NL )+ ;
    # 
    def state_dependency
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )
      return_value = StateDependencyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal63 = nil
      __NL65__ = nil
      string_literal66 = nil
      __NL67__ = nil
      char_literal68 = nil
      __NL69__ = nil
      char_literal71 = nil
      __NL72__ = nil
      string_literal73 = nil
      __NL74__ = nil
      char_literal75 = nil
      __NL76__ = nil
      char_literal78 = nil
      __NL79__ = nil
      dep_effect64 = nil
      constraint_body70 = nil
      constraint_body77 = nil

      tree_for_string_literal63 = nil
      tree_for_NL65 = nil
      tree_for_string_literal66 = nil
      tree_for_NL67 = nil
      tree_for_char_literal68 = nil
      tree_for_NL69 = nil
      tree_for_char_literal71 = nil
      tree_for_NL72 = nil
      tree_for_string_literal73 = nil
      tree_for_NL74 = nil
      tree_for_char_literal75 = nil
      tree_for_NL76 = nil
      tree_for_char_literal78 = nil
      tree_for_NL79 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 151:4: 'if' dep_effect ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )* ( NL )+
        string_literal63 = match( T__26, TOKENS_FOLLOWING_T__26_IN_state_dependency_446 )

        tree_for_string_literal63 = @adaptor.create_with_payload( string_literal63 )
        @adaptor.add_child( root_0, tree_for_string_literal63 )

        @state.following.push( TOKENS_FOLLOWING_dep_effect_IN_state_dependency_450 )
        dep_effect64 = dep_effect
        @state.following.pop
        @adaptor.add_child( root_0, dep_effect64.tree )
        # at line 152:14: ( NL )*
        while true # decision 29
          alt_29 = 2
          look_29_0 = @input.peek( 1 )

          if ( look_29_0 == NL )
            alt_29 = 1

          end
          case alt_29
          when 1
            # at line 152:14: NL
            __NL65__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_452 )

            tree_for_NL65 = @adaptor.create_with_payload( __NL65__ )
            @adaptor.add_child( root_0, tree_for_NL65 )


          else
            break # out of loop for decision 29
          end
        end # loop for decision 29
        string_literal66 = match( T__27, TOKENS_FOLLOWING_T__27_IN_state_dependency_455 )

        tree_for_string_literal66 = @adaptor.create_with_payload( string_literal66 )
        @adaptor.add_child( root_0, tree_for_string_literal66 )

        # at line 152:25: ( NL )*
        while true # decision 30
          alt_30 = 2
          look_30_0 = @input.peek( 1 )

          if ( look_30_0 == NL )
            alt_30 = 1

          end
          case alt_30
          when 1
            # at line 152:25: NL
            __NL67__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_457 )

            tree_for_NL67 = @adaptor.create_with_payload( __NL67__ )
            @adaptor.add_child( root_0, tree_for_NL67 )


          else
            break # out of loop for decision 30
          end
        end # loop for decision 30
        char_literal68 = match( T__20, TOKENS_FOLLOWING_T__20_IN_state_dependency_460 )

        tree_for_char_literal68 = @adaptor.create_with_payload( char_literal68 )
        @adaptor.add_child( root_0, tree_for_char_literal68 )

        # at line 153:3: ( NL )*
        while true # decision 31
          alt_31 = 2
          look_31_0 = @input.peek( 1 )

          if ( look_31_0 == NL )
            alt_31 = 1

          end
          case alt_31
          when 1
            # at line 153:3: NL
            __NL69__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_464 )

            tree_for_NL69 = @adaptor.create_with_payload( __NL69__ )
            @adaptor.add_child( root_0, tree_for_NL69 )


          else
            break # out of loop for decision 31
          end
        end # loop for decision 31
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_state_dependency_467 )
        constraint_body70 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body70.tree )
        char_literal71 = match( T__21, TOKENS_FOLLOWING_T__21_IN_state_dependency_472 )

        tree_for_char_literal71 = @adaptor.create_with_payload( char_literal71 )
        @adaptor.add_child( root_0, tree_for_char_literal71 )

        # at line 155:3: ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )*
        while true # decision 35
          alt_35 = 2
          alt_35 = @dfa35.predict( @input )
          case alt_35
          when 1
            # at line 155:5: ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}'
            # at line 155:5: ( NL )*
            while true # decision 32
              alt_32 = 2
              look_32_0 = @input.peek( 1 )

              if ( look_32_0 == NL )
                alt_32 = 1

              end
              case alt_32
              when 1
                # at line 155:5: NL
                __NL72__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_478 )

                tree_for_NL72 = @adaptor.create_with_payload( __NL72__ )
                @adaptor.add_child( root_0, tree_for_NL72 )


              else
                break # out of loop for decision 32
              end
            end # loop for decision 32
            string_literal73 = match( T__28, TOKENS_FOLLOWING_T__28_IN_state_dependency_481 )

            tree_for_string_literal73 = @adaptor.create_with_payload( string_literal73 )
            @adaptor.add_child( root_0, tree_for_string_literal73 )

            # at line 155:14: ( NL )*
            while true # decision 33
              alt_33 = 2
              look_33_0 = @input.peek( 1 )

              if ( look_33_0 == NL )
                alt_33 = 1

              end
              case alt_33
              when 1
                # at line 155:14: NL
                __NL74__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_483 )

                tree_for_NL74 = @adaptor.create_with_payload( __NL74__ )
                @adaptor.add_child( root_0, tree_for_NL74 )


              else
                break # out of loop for decision 33
              end
            end # loop for decision 33
            char_literal75 = match( T__20, TOKENS_FOLLOWING_T__20_IN_state_dependency_486 )

            tree_for_char_literal75 = @adaptor.create_with_payload( char_literal75 )
            @adaptor.add_child( root_0, tree_for_char_literal75 )

            # at line 156:3: ( NL )*
            while true # decision 34
              alt_34 = 2
              look_34_0 = @input.peek( 1 )

              if ( look_34_0 == NL )
                alt_34 = 1

              end
              case alt_34
              when 1
                # at line 156:3: NL
                __NL76__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_490 )

                tree_for_NL76 = @adaptor.create_with_payload( __NL76__ )
                @adaptor.add_child( root_0, tree_for_NL76 )


              else
                break # out of loop for decision 34
              end
            end # loop for decision 34
            @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_state_dependency_493 )
            constraint_body77 = constraint_body
            @state.following.pop
            @adaptor.add_child( root_0, constraint_body77.tree )
            char_literal78 = match( T__21, TOKENS_FOLLOWING_T__21_IN_state_dependency_497 )

            tree_for_char_literal78 = @adaptor.create_with_payload( char_literal78 )
            @adaptor.add_child( root_0, tree_for_char_literal78 )


          else
            break # out of loop for decision 35
          end
        end # loop for decision 35
        # at file 158:3: ( NL )+
        match_count_36 = 0
        while true
          alt_36 = 2
          look_36_0 = @input.peek( 1 )

          if ( look_36_0 == NL )
            alt_36 = 1

          end
          case alt_36
          when 1
            # at line 158:3: NL
            __NL79__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_503 )

            tree_for_NL79 = @adaptor.create_with_payload( __NL79__ )
            @adaptor.add_child( root_0, tree_for_NL79 )


          else
            match_count_36 > 0 and break
            eee = EarlyExit(36)


            raise eee
          end
          match_count_36 += 1
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
        # trace_out( __method__, 13 )

      end
      
      return return_value
    end

    DepEffectReturnValue = define_return_scope 

    # 
    # parser rule dep_effect
    # 
    # (in SFP.g)
    # 161:1: dep_effect : reference equals_op ( value | NULL ) ;
    # 
    def dep_effect
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )
      return_value = DepEffectReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL83__ = nil
      reference80 = nil
      equals_op81 = nil
      value82 = nil

      tree_for_NULL83 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 162:4: reference equals_op ( value | NULL )
        @state.following.push( TOKENS_FOLLOWING_reference_IN_dep_effect_515 )
        reference80 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference80.tree )
        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_dep_effect_517 )
        equals_op81 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op81.tree )
        # at line 163:3: ( value | NULL )
        alt_37 = 2
        look_37_0 = @input.peek( 1 )

        if ( look_37_0.between?( STRING, ID ) || look_37_0.between?( NUMBER, MULTILINE_STRING ) || look_37_0 == T__34 )
          alt_37 = 1
        elsif ( look_37_0 == NULL )
          alt_37 = 2
        else
          raise NoViableAlternative( "", 37, 0 )
        end
        case alt_37
        when 1
          # at line 163:5: value
          @state.following.push( TOKENS_FOLLOWING_value_IN_dep_effect_524 )
          value82 = value
          @state.following.pop
          @adaptor.add_child( root_0, value82.tree )

        when 2
          # at line 164:5: NULL
          __NULL83__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_dep_effect_530 )

          tree_for_NULL83 = @adaptor.create_with_payload( __NULL83__ )
          @adaptor.add_child( root_0, tree_for_NULL83 )


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
        # trace_out( __method__, 14 )

      end
      
      return return_value
    end

    OperatorReturnValue = define_return_scope 

    # 
    # parser rule operator
    # 
    # (in SFP.g)
    # 168:1: operator : 'operator' ID '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( op_conditions )? op_effects '}' ( NL )+ ;
    # 
    def operator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )
      return_value = OperatorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal84 = nil
      __ID85__ = nil
      char_literal86 = nil
      __NL87__ = nil
      string_literal88 = nil
      __NUMBER90__ = nil
      __NL91__ = nil
      char_literal94 = nil
      __NL95__ = nil
      equals_op89 = nil
      op_conditions92 = nil
      op_effects93 = nil

      tree_for_string_literal84 = nil
      tree_for_ID85 = nil
      tree_for_char_literal86 = nil
      tree_for_NL87 = nil
      tree_for_string_literal88 = nil
      tree_for_NUMBER90 = nil
      tree_for_NL91 = nil
      tree_for_char_literal94 = nil
      tree_for_NL95 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 169:4: 'operator' ID '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( op_conditions )? op_effects '}' ( NL )+
        string_literal84 = match( T__29, TOKENS_FOLLOWING_T__29_IN_operator_546 )

        tree_for_string_literal84 = @adaptor.create_with_payload( string_literal84 )
        @adaptor.add_child( root_0, tree_for_string_literal84 )

        __ID85__ = match( ID, TOKENS_FOLLOWING_ID_IN_operator_548 )

        tree_for_ID85 = @adaptor.create_with_payload( __ID85__ )
        @adaptor.add_child( root_0, tree_for_ID85 )

        char_literal86 = match( T__20, TOKENS_FOLLOWING_T__20_IN_operator_550 )

        tree_for_char_literal86 = @adaptor.create_with_payload( char_literal86 )
        @adaptor.add_child( root_0, tree_for_char_literal86 )

        # at line 169:22: ( NL )*
        while true # decision 38
          alt_38 = 2
          look_38_0 = @input.peek( 1 )

          if ( look_38_0 == NL )
            alt_38 = 1

          end
          case alt_38
          when 1
            # at line 169:22: NL
            __NL87__ = match( NL, TOKENS_FOLLOWING_NL_IN_operator_552 )

            tree_for_NL87 = @adaptor.create_with_payload( __NL87__ )
            @adaptor.add_child( root_0, tree_for_NL87 )


          else
            break # out of loop for decision 38
          end
        end # loop for decision 38
        # --> action

        			@now[__ID85__.text] = { '_self' => __ID85__.text,
        				'_context' => 'operator',
        				'_parent' => @now,
        				'_cost' => 1,
        				'_conditions' => { '_context' => 'constraint' },
        				'_effects' => { '_context' => 'mutation' }
        			}
        			@now = @now[__ID85__.text]
        		
        # <-- action
        # at line 180:3: ( 'cost' equals_op NUMBER ( NL )+ )?
        alt_40 = 2
        look_40_0 = @input.peek( 1 )

        if ( look_40_0 == T__30 )
          alt_40 = 1
        end
        case alt_40
        when 1
          # at line 180:5: 'cost' equals_op NUMBER ( NL )+
          string_literal88 = match( T__30, TOKENS_FOLLOWING_T__30_IN_operator_563 )

          tree_for_string_literal88 = @adaptor.create_with_payload( string_literal88 )
          @adaptor.add_child( root_0, tree_for_string_literal88 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_operator_565 )
          equals_op89 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op89.tree )
          __NUMBER90__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_operator_567 )

          tree_for_NUMBER90 = @adaptor.create_with_payload( __NUMBER90__ )
          @adaptor.add_child( root_0, tree_for_NUMBER90 )

          # at file 180:29: ( NL )+
          match_count_39 = 0
          while true
            alt_39 = 2
            look_39_0 = @input.peek( 1 )

            if ( look_39_0 == NL )
              alt_39 = 1

            end
            case alt_39
            when 1
              # at line 180:29: NL
              __NL91__ = match( NL, TOKENS_FOLLOWING_NL_IN_operator_569 )

              tree_for_NL91 = @adaptor.create_with_payload( __NL91__ )
              @adaptor.add_child( root_0, tree_for_NL91 )


            else
              match_count_39 > 0 and break
              eee = EarlyExit(39)


              raise eee
            end
            match_count_39 += 1
          end

          # --> action
          	@now['_cost'] = __NUMBER90__.text.to_i	
          # <-- action

        end
        # at line 184:3: ( op_conditions )?
        alt_41 = 2
        look_41_0 = @input.peek( 1 )

        if ( look_41_0 == T__31 )
          alt_41 = 1
        end
        case alt_41
        when 1
          # at line 184:3: op_conditions
          @state.following.push( TOKENS_FOLLOWING_op_conditions_IN_operator_588 )
          op_conditions92 = op_conditions
          @state.following.pop
          @adaptor.add_child( root_0, op_conditions92.tree )

        end
        @state.following.push( TOKENS_FOLLOWING_op_effects_IN_operator_591 )
        op_effects93 = op_effects
        @state.following.pop
        @adaptor.add_child( root_0, op_effects93.tree )
        char_literal94 = match( T__21, TOKENS_FOLLOWING_T__21_IN_operator_595 )

        tree_for_char_literal94 = @adaptor.create_with_payload( char_literal94 )
        @adaptor.add_child( root_0, tree_for_char_literal94 )

        # at file 185:7: ( NL )+
        match_count_42 = 0
        while true
          alt_42 = 2
          look_42_0 = @input.peek( 1 )

          if ( look_42_0 == NL )
            alt_42 = 1

          end
          case alt_42
          when 1
            # at line 185:7: NL
            __NL95__ = match( NL, TOKENS_FOLLOWING_NL_IN_operator_597 )

            tree_for_NL95 = @adaptor.create_with_payload( __NL95__ )
            @adaptor.add_child( root_0, tree_for_NL95 )


          else
            match_count_42 > 0 and break
            eee = EarlyExit(42)


            raise eee
          end
          match_count_42 += 1
        end

        # --> action
        	self.goto_parent()	
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
        # trace_out( __method__, 15 )

      end
      
      return return_value
    end

    OpParamReturnValue = define_return_scope 

    # 
    # parser rule op_param
    # 
    # (in SFP.g)
    # 189:1: op_param : ID equals_op reference ( NL )+ ;
    # 
    def op_param
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )
      return_value = OpParamReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID96__ = nil
      __NL99__ = nil
      equals_op97 = nil
      reference98 = nil

      tree_for_ID96 = nil
      tree_for_NL99 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 190:4: ID equals_op reference ( NL )+
        __ID96__ = match( ID, TOKENS_FOLLOWING_ID_IN_op_param_613 )

        tree_for_ID96 = @adaptor.create_with_payload( __ID96__ )
        @adaptor.add_child( root_0, tree_for_ID96 )

        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_op_param_615 )
        equals_op97 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op97.tree )
        @state.following.push( TOKENS_FOLLOWING_reference_IN_op_param_617 )
        reference98 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference98.tree )
        # at file 190:27: ( NL )+
        match_count_43 = 0
        while true
          alt_43 = 2
          look_43_0 = @input.peek( 1 )

          if ( look_43_0 == NL )
            alt_43 = 1

          end
          case alt_43
          when 1
            # at line 190:27: NL
            __NL99__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_param_619 )

            tree_for_NL99 = @adaptor.create_with_payload( __NL99__ )
            @adaptor.add_child( root_0, tree_for_NL99 )


          else
            match_count_43 > 0 and break
            eee = EarlyExit(43)


            raise eee
          end
          match_count_43 += 1
        end

        # --> action
        	@now[__ID96__.text] = ( reference98.nil? ? nil : reference98.val )	
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
        # trace_out( __method__, 16 )

      end
      
      return return_value
    end

    OpConditionsReturnValue = define_return_scope 

    # 
    # parser rule op_conditions
    # 
    # (in SFP.g)
    # 194:1: op_conditions : 'conditions' '{' ( NL )* ( op_statement )* '}' ( NL )+ ;
    # 
    def op_conditions
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      return_value = OpConditionsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal100 = nil
      char_literal101 = nil
      __NL102__ = nil
      char_literal104 = nil
      __NL105__ = nil
      op_statement103 = nil

      tree_for_string_literal100 = nil
      tree_for_char_literal101 = nil
      tree_for_NL102 = nil
      tree_for_char_literal104 = nil
      tree_for_NL105 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 195:4: 'conditions' '{' ( NL )* ( op_statement )* '}' ( NL )+
        string_literal100 = match( T__31, TOKENS_FOLLOWING_T__31_IN_op_conditions_635 )

        tree_for_string_literal100 = @adaptor.create_with_payload( string_literal100 )
        @adaptor.add_child( root_0, tree_for_string_literal100 )

        char_literal101 = match( T__20, TOKENS_FOLLOWING_T__20_IN_op_conditions_637 )

        tree_for_char_literal101 = @adaptor.create_with_payload( char_literal101 )
        @adaptor.add_child( root_0, tree_for_char_literal101 )

        # at line 195:21: ( NL )*
        while true # decision 44
          alt_44 = 2
          look_44_0 = @input.peek( 1 )

          if ( look_44_0 == NL )
            alt_44 = 1

          end
          case alt_44
          when 1
            # at line 195:21: NL
            __NL102__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_conditions_639 )

            tree_for_NL102 = @adaptor.create_with_payload( __NL102__ )
            @adaptor.add_child( root_0, tree_for_NL102 )


          else
            break # out of loop for decision 44
          end
        end # loop for decision 44
        # --> action

        			@now['_conditions']['_parent'] = @now
        			@now = @now['_conditions']
        		
        # <-- action
        # at line 200:3: ( op_statement )*
        while true # decision 45
          alt_45 = 2
          look_45_0 = @input.peek( 1 )

          if ( look_45_0 == ID )
            alt_45 = 1

          end
          case alt_45
          when 1
            # at line 200:3: op_statement
            @state.following.push( TOKENS_FOLLOWING_op_statement_IN_op_conditions_648 )
            op_statement103 = op_statement
            @state.following.pop
            @adaptor.add_child( root_0, op_statement103.tree )

          else
            break # out of loop for decision 45
          end
        end # loop for decision 45
        char_literal104 = match( T__21, TOKENS_FOLLOWING_T__21_IN_op_conditions_653 )

        tree_for_char_literal104 = @adaptor.create_with_payload( char_literal104 )
        @adaptor.add_child( root_0, tree_for_char_literal104 )

        # at file 201:7: ( NL )+
        match_count_46 = 0
        while true
          alt_46 = 2
          look_46_0 = @input.peek( 1 )

          if ( look_46_0 == NL )
            alt_46 = 1

          end
          case alt_46
          when 1
            # at line 201:7: NL
            __NL105__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_conditions_655 )

            tree_for_NL105 = @adaptor.create_with_payload( __NL105__ )
            @adaptor.add_child( root_0, tree_for_NL105 )


          else
            match_count_46 > 0 and break
            eee = EarlyExit(46)


            raise eee
          end
          match_count_46 += 1
        end

        # --> action
        	self.goto_parent()	
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
        # trace_out( __method__, 17 )

      end
      
      return return_value
    end

    OpEffectsReturnValue = define_return_scope 

    # 
    # parser rule op_effects
    # 
    # (in SFP.g)
    # 205:1: op_effects : 'effects' '{' ( NL )* ( op_statement )* '}' ( NL )+ ;
    # 
    def op_effects
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      return_value = OpEffectsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal106 = nil
      char_literal107 = nil
      __NL108__ = nil
      char_literal110 = nil
      __NL111__ = nil
      op_statement109 = nil

      tree_for_string_literal106 = nil
      tree_for_char_literal107 = nil
      tree_for_NL108 = nil
      tree_for_char_literal110 = nil
      tree_for_NL111 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 206:4: 'effects' '{' ( NL )* ( op_statement )* '}' ( NL )+
        string_literal106 = match( T__32, TOKENS_FOLLOWING_T__32_IN_op_effects_671 )

        tree_for_string_literal106 = @adaptor.create_with_payload( string_literal106 )
        @adaptor.add_child( root_0, tree_for_string_literal106 )

        char_literal107 = match( T__20, TOKENS_FOLLOWING_T__20_IN_op_effects_673 )

        tree_for_char_literal107 = @adaptor.create_with_payload( char_literal107 )
        @adaptor.add_child( root_0, tree_for_char_literal107 )

        # at line 206:18: ( NL )*
        while true # decision 47
          alt_47 = 2
          look_47_0 = @input.peek( 1 )

          if ( look_47_0 == NL )
            alt_47 = 1

          end
          case alt_47
          when 1
            # at line 206:18: NL
            __NL108__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_effects_675 )

            tree_for_NL108 = @adaptor.create_with_payload( __NL108__ )
            @adaptor.add_child( root_0, tree_for_NL108 )


          else
            break # out of loop for decision 47
          end
        end # loop for decision 47
        # --> action

        			@now['_effects']['_parent'] = @now
        			@now = @now['_effects']
        		
        # <-- action
        # at line 211:3: ( op_statement )*
        while true # decision 48
          alt_48 = 2
          look_48_0 = @input.peek( 1 )

          if ( look_48_0 == ID )
            alt_48 = 1

          end
          case alt_48
          when 1
            # at line 211:3: op_statement
            @state.following.push( TOKENS_FOLLOWING_op_statement_IN_op_effects_684 )
            op_statement109 = op_statement
            @state.following.pop
            @adaptor.add_child( root_0, op_statement109.tree )

          else
            break # out of loop for decision 48
          end
        end # loop for decision 48
        char_literal110 = match( T__21, TOKENS_FOLLOWING_T__21_IN_op_effects_689 )

        tree_for_char_literal110 = @adaptor.create_with_payload( char_literal110 )
        @adaptor.add_child( root_0, tree_for_char_literal110 )

        # at file 212:7: ( NL )+
        match_count_49 = 0
        while true
          alt_49 = 2
          look_49_0 = @input.peek( 1 )

          if ( look_49_0 == NL )
            alt_49 = 1

          end
          case alt_49
          when 1
            # at line 212:7: NL
            __NL111__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_effects_691 )

            tree_for_NL111 = @adaptor.create_with_payload( __NL111__ )
            @adaptor.add_child( root_0, tree_for_NL111 )


          else
            match_count_49 > 0 and break
            eee = EarlyExit(49)


            raise eee
          end
          match_count_49 += 1
        end

        # --> action
        	self.goto_parent()	
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
        # trace_out( __method__, 18 )

      end
      
      return return_value
    end

    OpStatementReturnValue = define_return_scope 

    # 
    # parser rule op_statement
    # 
    # (in SFP.g)
    # 216:1: op_statement : reference equals_op value ( NL )+ ;
    # 
    def op_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      return_value = OpStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL115__ = nil
      reference112 = nil
      equals_op113 = nil
      value114 = nil

      tree_for_NL115 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 217:4: reference equals_op value ( NL )+
        @state.following.push( TOKENS_FOLLOWING_reference_IN_op_statement_707 )
        reference112 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference112.tree )
        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_op_statement_709 )
        equals_op113 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op113.tree )
        @state.following.push( TOKENS_FOLLOWING_value_IN_op_statement_711 )
        value114 = value
        @state.following.pop
        @adaptor.add_child( root_0, value114.tree )
        # at file 217:30: ( NL )+
        match_count_50 = 0
        while true
          alt_50 = 2
          look_50_0 = @input.peek( 1 )

          if ( look_50_0 == NL )
            alt_50 = 1

          end
          case alt_50
          when 1
            # at line 217:30: NL
            __NL115__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_statement_713 )

            tree_for_NL115 = @adaptor.create_with_payload( __NL115__ )
            @adaptor.add_child( root_0, tree_for_NL115 )


          else
            match_count_50 > 0 and break
            eee = EarlyExit(50)


            raise eee
          end
          match_count_50 += 1
        end

        # --> action
        	@now[( reference112.nil? ? nil : reference112.val )] = ( value114.nil? ? nil : value114.val )	
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
        # trace_out( __method__, 19 )

      end
      
      return return_value
    end

    ProcedureReturnValue = define_return_scope 

    # 
    # parser rule procedure
    # 
    # (in SFP.g)
    # 221:1: procedure : 'procedure' ID ( parameters )? '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( conditions )? effects '}' ( NL )+ ;
    # 
    def procedure
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = ProcedureReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal116 = nil
      __ID117__ = nil
      char_literal119 = nil
      __NL120__ = nil
      string_literal121 = nil
      __NUMBER123__ = nil
      __NL124__ = nil
      char_literal127 = nil
      __NL128__ = nil
      parameters118 = nil
      equals_op122 = nil
      conditions125 = nil
      effects126 = nil

      tree_for_string_literal116 = nil
      tree_for_ID117 = nil
      tree_for_char_literal119 = nil
      tree_for_NL120 = nil
      tree_for_string_literal121 = nil
      tree_for_NUMBER123 = nil
      tree_for_NL124 = nil
      tree_for_char_literal127 = nil
      tree_for_NL128 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 222:4: 'procedure' ID ( parameters )? '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( conditions )? effects '}' ( NL )+
        string_literal116 = match( T__33, TOKENS_FOLLOWING_T__33_IN_procedure_729 )

        tree_for_string_literal116 = @adaptor.create_with_payload( string_literal116 )
        @adaptor.add_child( root_0, tree_for_string_literal116 )

        __ID117__ = match( ID, TOKENS_FOLLOWING_ID_IN_procedure_731 )

        tree_for_ID117 = @adaptor.create_with_payload( __ID117__ )
        @adaptor.add_child( root_0, tree_for_ID117 )

        # --> action

        			@now[__ID117__.text] = { '_self' => __ID117__.text,
        				'_context' => 'procedure',
        				'_parent' => @now,
        				'_cost' => 1,
        				'_conditions' => { '_context' => 'constraint', '_type' => 'and' },
        				'_effects' => { '_context' => 'mutation', '_type' => 'and' }
        			}
        			@now = @now[__ID117__.text]
        		
        # <-- action
        # at line 233:3: ( parameters )?
        alt_51 = 2
        look_51_0 = @input.peek( 1 )

        if ( look_51_0 == T__34 )
          alt_51 = 1
        end
        case alt_51
        when 1
          # at line 233:3: parameters
          @state.following.push( TOKENS_FOLLOWING_parameters_IN_procedure_739 )
          parameters118 = parameters
          @state.following.pop
          @adaptor.add_child( root_0, parameters118.tree )

        end
        char_literal119 = match( T__20, TOKENS_FOLLOWING_T__20_IN_procedure_742 )

        tree_for_char_literal119 = @adaptor.create_with_payload( char_literal119 )
        @adaptor.add_child( root_0, tree_for_char_literal119 )

        # at line 233:19: ( NL )*
        while true # decision 52
          alt_52 = 2
          look_52_0 = @input.peek( 1 )

          if ( look_52_0 == NL )
            alt_52 = 1

          end
          case alt_52
          when 1
            # at line 233:19: NL
            __NL120__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_744 )

            tree_for_NL120 = @adaptor.create_with_payload( __NL120__ )
            @adaptor.add_child( root_0, tree_for_NL120 )


          else
            break # out of loop for decision 52
          end
        end # loop for decision 52
        # at line 234:3: ( 'cost' equals_op NUMBER ( NL )+ )?
        alt_54 = 2
        look_54_0 = @input.peek( 1 )

        if ( look_54_0 == T__30 )
          alt_54 = 1
        end
        case alt_54
        when 1
          # at line 234:5: 'cost' equals_op NUMBER ( NL )+
          string_literal121 = match( T__30, TOKENS_FOLLOWING_T__30_IN_procedure_752 )

          tree_for_string_literal121 = @adaptor.create_with_payload( string_literal121 )
          @adaptor.add_child( root_0, tree_for_string_literal121 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_procedure_754 )
          equals_op122 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op122.tree )
          __NUMBER123__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_procedure_756 )

          tree_for_NUMBER123 = @adaptor.create_with_payload( __NUMBER123__ )
          @adaptor.add_child( root_0, tree_for_NUMBER123 )

          # --> action
          	@now['_cost'] = __NUMBER123__.text.to_i	
          # <-- action
          # at file 236:4: ( NL )+
          match_count_53 = 0
          while true
            alt_53 = 2
            look_53_0 = @input.peek( 1 )

            if ( look_53_0 == NL )
              alt_53 = 1

            end
            case alt_53
            when 1
              # at line 236:4: NL
              __NL124__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_766 )

              tree_for_NL124 = @adaptor.create_with_payload( __NL124__ )
              @adaptor.add_child( root_0, tree_for_NL124 )


            else
              match_count_53 > 0 and break
              eee = EarlyExit(53)


              raise eee
            end
            match_count_53 += 1
          end


        end
        # at line 238:3: ( conditions )?
        alt_55 = 2
        look_55_0 = @input.peek( 1 )

        if ( look_55_0 == T__31 )
          alt_55 = 1
        end
        case alt_55
        when 1
          # at line 238:3: conditions
          @state.following.push( TOKENS_FOLLOWING_conditions_IN_procedure_776 )
          conditions125 = conditions
          @state.following.pop
          @adaptor.add_child( root_0, conditions125.tree )

        end
        @state.following.push( TOKENS_FOLLOWING_effects_IN_procedure_779 )
        effects126 = effects
        @state.following.pop
        @adaptor.add_child( root_0, effects126.tree )
        char_literal127 = match( T__21, TOKENS_FOLLOWING_T__21_IN_procedure_781 )

        tree_for_char_literal127 = @adaptor.create_with_payload( char_literal127 )
        @adaptor.add_child( root_0, tree_for_char_literal127 )

        # at file 238:27: ( NL )+
        match_count_56 = 0
        while true
          alt_56 = 2
          look_56_0 = @input.peek( 1 )

          if ( look_56_0 == NL )
            alt_56 = 1

          end
          case alt_56
          when 1
            # at line 238:27: NL
            __NL128__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_783 )

            tree_for_NL128 = @adaptor.create_with_payload( __NL128__ )
            @adaptor.add_child( root_0, tree_for_NL128 )


          else
            match_count_56 > 0 and break
            eee = EarlyExit(56)


            raise eee
          end
          match_count_56 += 1
        end

        # --> action
        	self.goto_parent()	
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
        # trace_out( __method__, 20 )

      end
      
      return return_value
    end

    ParametersReturnValue = define_return_scope 

    # 
    # parser rule parameters
    # 
    # (in SFP.g)
    # 242:1: parameters : '(' parameter ( ',' parameter )* ')' ;
    # 
    def parameters
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = ParametersReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal129 = nil
      char_literal131 = nil
      char_literal133 = nil
      parameter130 = nil
      parameter132 = nil

      tree_for_char_literal129 = nil
      tree_for_char_literal131 = nil
      tree_for_char_literal133 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 243:4: '(' parameter ( ',' parameter )* ')'
        char_literal129 = match( T__34, TOKENS_FOLLOWING_T__34_IN_parameters_799 )

        tree_for_char_literal129 = @adaptor.create_with_payload( char_literal129 )
        @adaptor.add_child( root_0, tree_for_char_literal129 )

        @state.following.push( TOKENS_FOLLOWING_parameter_IN_parameters_801 )
        parameter130 = parameter
        @state.following.pop
        @adaptor.add_child( root_0, parameter130.tree )
        # at line 243:18: ( ',' parameter )*
        while true # decision 57
          alt_57 = 2
          look_57_0 = @input.peek( 1 )

          if ( look_57_0 == T__35 )
            alt_57 = 1

          end
          case alt_57
          when 1
            # at line 243:19: ',' parameter
            char_literal131 = match( T__35, TOKENS_FOLLOWING_T__35_IN_parameters_804 )

            tree_for_char_literal131 = @adaptor.create_with_payload( char_literal131 )
            @adaptor.add_child( root_0, tree_for_char_literal131 )

            @state.following.push( TOKENS_FOLLOWING_parameter_IN_parameters_806 )
            parameter132 = parameter
            @state.following.pop
            @adaptor.add_child( root_0, parameter132.tree )

          else
            break # out of loop for decision 57
          end
        end # loop for decision 57
        char_literal133 = match( T__36, TOKENS_FOLLOWING_T__36_IN_parameters_810 )

        tree_for_char_literal133 = @adaptor.create_with_payload( char_literal133 )
        @adaptor.add_child( root_0, tree_for_char_literal133 )

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
        # trace_out( __method__, 21 )

      end
      
      return return_value
    end

    ParameterReturnValue = define_return_scope 

    # 
    # parser rule parameter
    # 
    # (in SFP.g)
    # 246:1: parameter : ( ID reference_type | ID 'areall' path );
    # 
    def parameter
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = ParameterReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID134__ = nil
      __ID136__ = nil
      string_literal137 = nil
      reference_type135 = nil
      path138 = nil

      tree_for_ID134 = nil
      tree_for_ID136 = nil
      tree_for_string_literal137 = nil

      begin
        # at line 247:2: ( ID reference_type | ID 'areall' path )
        alt_58 = 2
        look_58_0 = @input.peek( 1 )

        if ( look_58_0 == ID )
          look_58_1 = @input.peek( 2 )

          if ( look_58_1 == T__37 )
            alt_58 = 2
          elsif ( look_58_1 == T__50 )
            alt_58 = 1
          else
            raise NoViableAlternative( "", 58, 1 )
          end
        else
          raise NoViableAlternative( "", 58, 0 )
        end
        case alt_58
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 247:4: ID reference_type
          __ID134__ = match( ID, TOKENS_FOLLOWING_ID_IN_parameter_822 )

          tree_for_ID134 = @adaptor.create_with_payload( __ID134__ )
          @adaptor.add_child( root_0, tree_for_ID134 )

          @state.following.push( TOKENS_FOLLOWING_reference_type_IN_parameter_824 )
          reference_type135 = reference_type
          @state.following.pop
          @adaptor.add_child( root_0, reference_type135.tree )
          # --> action
          	@now[__ID134__.text] = ( reference_type135.nil? ? nil : reference_type135.val )	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 249:4: ID 'areall' path
          __ID136__ = match( ID, TOKENS_FOLLOWING_ID_IN_parameter_833 )

          tree_for_ID136 = @adaptor.create_with_payload( __ID136__ )
          @adaptor.add_child( root_0, tree_for_ID136 )

          string_literal137 = match( T__37, TOKENS_FOLLOWING_T__37_IN_parameter_835 )

          tree_for_string_literal137 = @adaptor.create_with_payload( string_literal137 )
          @adaptor.add_child( root_0, tree_for_string_literal137 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_parameter_837 )
          path138 = path
          @state.following.pop
          @adaptor.add_child( root_0, path138.tree )
          # --> action

          			@now[__ID136__.text] = { '_context' => 'all',
          				'_isa' => self.to_ref(( path138 && @input.to_s( path138.start, path138.stop ) )),
          				'_value' => nil
          			}
          		
          # <-- action

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
        # trace_out( __method__, 22 )

      end
      
      return return_value
    end

    ConditionsReturnValue = define_return_scope 

    # 
    # parser rule conditions
    # 
    # (in SFP.g)
    # 258:1: conditions : 'conditions' '{' ( NL )* constraint_body '}' ( NL )+ ;
    # 
    def conditions
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
      return_value = ConditionsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal139 = nil
      char_literal140 = nil
      __NL141__ = nil
      char_literal143 = nil
      __NL144__ = nil
      constraint_body142 = nil

      tree_for_string_literal139 = nil
      tree_for_char_literal140 = nil
      tree_for_NL141 = nil
      tree_for_char_literal143 = nil
      tree_for_NL144 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 259:4: 'conditions' '{' ( NL )* constraint_body '}' ( NL )+
        string_literal139 = match( T__31, TOKENS_FOLLOWING_T__31_IN_conditions_852 )

        tree_for_string_literal139 = @adaptor.create_with_payload( string_literal139 )
        @adaptor.add_child( root_0, tree_for_string_literal139 )

        # --> action

        			@now['_conditions']['_parent'] = @now
        			@now = @now['_conditions']
        		
        # <-- action
        char_literal140 = match( T__20, TOKENS_FOLLOWING_T__20_IN_conditions_860 )

        tree_for_char_literal140 = @adaptor.create_with_payload( char_literal140 )
        @adaptor.add_child( root_0, tree_for_char_literal140 )

        # at line 264:7: ( NL )*
        while true # decision 59
          alt_59 = 2
          look_59_0 = @input.peek( 1 )

          if ( look_59_0 == NL )
            alt_59 = 1

          end
          case alt_59
          when 1
            # at line 264:7: NL
            __NL141__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditions_862 )

            tree_for_NL141 = @adaptor.create_with_payload( __NL141__ )
            @adaptor.add_child( root_0, tree_for_NL141 )


          else
            break # out of loop for decision 59
          end
        end # loop for decision 59
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_conditions_865 )
        constraint_body142 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body142.tree )
        char_literal143 = match( T__21, TOKENS_FOLLOWING_T__21_IN_conditions_867 )

        tree_for_char_literal143 = @adaptor.create_with_payload( char_literal143 )
        @adaptor.add_child( root_0, tree_for_char_literal143 )

        # at file 264:31: ( NL )+
        match_count_60 = 0
        while true
          alt_60 = 2
          look_60_0 = @input.peek( 1 )

          if ( look_60_0 == NL )
            alt_60 = 1

          end
          case alt_60
          when 1
            # at line 264:31: NL
            __NL144__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditions_869 )

            tree_for_NL144 = @adaptor.create_with_payload( __NL144__ )
            @adaptor.add_child( root_0, tree_for_NL144 )


          else
            match_count_60 > 0 and break
            eee = EarlyExit(60)


            raise eee
          end
          match_count_60 += 1
        end

        # --> action
        	self.goto_parent()	
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
        # trace_out( __method__, 23 )

      end
      
      return return_value
    end

    EffectsReturnValue = define_return_scope 

    # 
    # parser rule effects
    # 
    # (in SFP.g)
    # 269:1: effects : 'effects' '{' ( NL )* mutation_body '}' ( NL )+ ;
    # 
    def effects
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = EffectsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal145 = nil
      char_literal146 = nil
      __NL147__ = nil
      char_literal149 = nil
      __NL150__ = nil
      mutation_body148 = nil

      tree_for_string_literal145 = nil
      tree_for_char_literal146 = nil
      tree_for_NL147 = nil
      tree_for_char_literal149 = nil
      tree_for_NL150 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 270:4: 'effects' '{' ( NL )* mutation_body '}' ( NL )+
        string_literal145 = match( T__32, TOKENS_FOLLOWING_T__32_IN_effects_886 )

        tree_for_string_literal145 = @adaptor.create_with_payload( string_literal145 )
        @adaptor.add_child( root_0, tree_for_string_literal145 )

        # --> action

        			@now['_effects']['_parent'] = @now
        			@now = @now['_effects']
        		
        # <-- action
        char_literal146 = match( T__20, TOKENS_FOLLOWING_T__20_IN_effects_894 )

        tree_for_char_literal146 = @adaptor.create_with_payload( char_literal146 )
        @adaptor.add_child( root_0, tree_for_char_literal146 )

        # at line 275:7: ( NL )*
        while true # decision 61
          alt_61 = 2
          look_61_0 = @input.peek( 1 )

          if ( look_61_0 == NL )
            alt_61 = 1

          end
          case alt_61
          when 1
            # at line 275:7: NL
            __NL147__ = match( NL, TOKENS_FOLLOWING_NL_IN_effects_896 )

            tree_for_NL147 = @adaptor.create_with_payload( __NL147__ )
            @adaptor.add_child( root_0, tree_for_NL147 )


          else
            break # out of loop for decision 61
          end
        end # loop for decision 61
        @state.following.push( TOKENS_FOLLOWING_mutation_body_IN_effects_902 )
        mutation_body148 = mutation_body
        @state.following.pop
        @adaptor.add_child( root_0, mutation_body148.tree )
        char_literal149 = match( T__21, TOKENS_FOLLOWING_T__21_IN_effects_907 )

        tree_for_char_literal149 = @adaptor.create_with_payload( char_literal149 )
        @adaptor.add_child( root_0, tree_for_char_literal149 )

        # at file 277:7: ( NL )+
        match_count_62 = 0
        while true
          alt_62 = 2
          look_62_0 = @input.peek( 1 )

          if ( look_62_0 == NL )
            alt_62 = 1

          end
          case alt_62
          when 1
            # at line 277:7: NL
            __NL150__ = match( NL, TOKENS_FOLLOWING_NL_IN_effects_909 )

            tree_for_NL150 = @adaptor.create_with_payload( __NL150__ )
            @adaptor.add_child( root_0, tree_for_NL150 )


          else
            match_count_62 > 0 and break
            eee = EarlyExit(62)


            raise eee
          end
          match_count_62 += 1
        end

        # --> action
        	self.goto_parent()	
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
        # trace_out( __method__, 24 )

      end
      
      return return_value
    end

    ConstraintReturnValue = define_return_scope 

    # 
    # parser rule constraint
    # 
    # (in SFP.g)
    # 281:1: constraint : ID 'constraint' '{' ( NL )* constraint_body '}' ( NL )+ ;
    # 
    def constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = ConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID151__ = nil
      string_literal152 = nil
      char_literal153 = nil
      __NL154__ = nil
      char_literal156 = nil
      __NL157__ = nil
      constraint_body155 = nil

      tree_for_ID151 = nil
      tree_for_string_literal152 = nil
      tree_for_char_literal153 = nil
      tree_for_NL154 = nil
      tree_for_char_literal156 = nil
      tree_for_NL157 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 282:4: ID 'constraint' '{' ( NL )* constraint_body '}' ( NL )+
        __ID151__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_925 )

        tree_for_ID151 = @adaptor.create_with_payload( __ID151__ )
        @adaptor.add_child( root_0, tree_for_ID151 )

        string_literal152 = match( T__38, TOKENS_FOLLOWING_T__38_IN_constraint_927 )

        tree_for_string_literal152 = @adaptor.create_with_payload( string_literal152 )
        @adaptor.add_child( root_0, tree_for_string_literal152 )

        # --> action

        			@now[__ID151__.text] = { '_self' => __ID151__.text,
        				'_context' => 'constraint',
        				'_type' => 'and',
        				'_parent' => @now
        			}
        			@now = @now[__ID151__.text]
        		
        # <-- action
        char_literal153 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_935 )

        tree_for_char_literal153 = @adaptor.create_with_payload( char_literal153 )
        @adaptor.add_child( root_0, tree_for_char_literal153 )

        # at line 291:7: ( NL )*
        while true # decision 63
          alt_63 = 2
          look_63_0 = @input.peek( 1 )

          if ( look_63_0 == NL )
            alt_63 = 1

          end
          case alt_63
          when 1
            # at line 291:7: NL
            __NL154__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_937 )

            tree_for_NL154 = @adaptor.create_with_payload( __NL154__ )
            @adaptor.add_child( root_0, tree_for_NL154 )


          else
            break # out of loop for decision 63
          end
        end # loop for decision 63
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_constraint_940 )
        constraint_body155 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body155.tree )
        char_literal156 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_942 )

        tree_for_char_literal156 = @adaptor.create_with_payload( char_literal156 )
        @adaptor.add_child( root_0, tree_for_char_literal156 )

        # at file 291:31: ( NL )+
        match_count_64 = 0
        while true
          alt_64 = 2
          look_64_0 = @input.peek( 1 )

          if ( look_64_0 == NL )
            alt_64 = 1

          end
          case alt_64
          when 1
            # at line 291:31: NL
            __NL157__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_944 )

            tree_for_NL157 = @adaptor.create_with_payload( __NL157__ )
            @adaptor.add_child( root_0, tree_for_NL157 )


          else
            match_count_64 > 0 and break
            eee = EarlyExit(64)


            raise eee
          end
          match_count_64 += 1
        end

        # --> action
        	self.goto_parent()	
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
        # trace_out( __method__, 25 )

      end
      
      return return_value
    end

    ConstraintBodyReturnValue = define_return_scope 

    # 
    # parser rule constraint_body
    # 
    # (in SFP.g)
    # 295:1: constraint_body : ( ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+ )* ;
    # 
    def constraint_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = ConstraintBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL161__ = nil
      constraint_statement158 = nil
      constraint_namespace159 = nil
      constraint_iterator160 = nil

      tree_for_NL161 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 296:4: ( ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+ )*
        # at line 296:4: ( ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+ )*
        while true # decision 67
          alt_67 = 2
          look_67_0 = @input.peek( 1 )

          if ( look_67_0 == ID || look_67_0 == T__26 || look_67_0 == T__39 )
            alt_67 = 1

          end
          case alt_67
          when 1
            # at line 297:4: ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+
            # at line 297:4: ( constraint_statement | constraint_namespace | constraint_iterator )
            alt_65 = 3
            alt_65 = @dfa65.predict( @input )
            case alt_65
            when 1
              # at line 297:6: constraint_statement
              @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_967 )
              constraint_statement158 = constraint_statement
              @state.following.pop
              @adaptor.add_child( root_0, constraint_statement158.tree )
              # --> action
              	@now[( constraint_statement158.nil? ? nil : constraint_statement158.key )] = ( constraint_statement158.nil? ? nil : constraint_statement158.val )	
              # <-- action

            when 2
              # at line 299:6: constraint_namespace
              @state.following.push( TOKENS_FOLLOWING_constraint_namespace_IN_constraint_body_980 )
              constraint_namespace159 = constraint_namespace
              @state.following.pop
              @adaptor.add_child( root_0, constraint_namespace159.tree )

            when 3
              # at line 300:6: constraint_iterator
              @state.following.push( TOKENS_FOLLOWING_constraint_iterator_IN_constraint_body_987 )
              constraint_iterator160 = constraint_iterator
              @state.following.pop
              @adaptor.add_child( root_0, constraint_iterator160.tree )

            end
            # at file 302:3: ( NL )+
            match_count_66 = 0
            while true
              alt_66 = 2
              look_66_0 = @input.peek( 1 )

              if ( look_66_0 == NL )
                alt_66 = 1

              end
              case alt_66
              when 1
                # at line 302:3: NL
                __NL161__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_body_996 )

                tree_for_NL161 = @adaptor.create_with_payload( __NL161__ )
                @adaptor.add_child( root_0, tree_for_NL161 )


              else
                match_count_66 > 0 and break
                eee = EarlyExit(66)


                raise eee
              end
              match_count_66 += 1
            end


          else
            break # out of loop for decision 67
          end
        end # loop for decision 67
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
        # trace_out( __method__, 26 )

      end
      
      return return_value
    end

    ConstraintNamespaceReturnValue = define_return_scope 

    # 
    # parser rule constraint_namespace
    # 
    # (in SFP.g)
    # 305:1: constraint_namespace : path ( NL )* '{' ( NL )* ( constraint_statement ( NL )+ )* '}' ;
    # 
    def constraint_namespace
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = ConstraintNamespaceReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL163__ = nil
      char_literal164 = nil
      __NL165__ = nil
      __NL167__ = nil
      char_literal168 = nil
      path162 = nil
      constraint_statement166 = nil

      tree_for_NL163 = nil
      tree_for_char_literal164 = nil
      tree_for_NL165 = nil
      tree_for_NL167 = nil
      tree_for_char_literal168 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 306:4: path ( NL )* '{' ( NL )* ( constraint_statement ( NL )+ )* '}'
        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_namespace_1010 )
        path162 = path
        @state.following.pop
        @adaptor.add_child( root_0, path162.tree )
        # at line 306:9: ( NL )*
        while true # decision 68
          alt_68 = 2
          look_68_0 = @input.peek( 1 )

          if ( look_68_0 == NL )
            alt_68 = 1

          end
          case alt_68
          when 1
            # at line 306:9: NL
            __NL163__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1012 )

            tree_for_NL163 = @adaptor.create_with_payload( __NL163__ )
            @adaptor.add_child( root_0, tree_for_NL163 )


          else
            break # out of loop for decision 68
          end
        end # loop for decision 68
        char_literal164 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_namespace_1015 )

        tree_for_char_literal164 = @adaptor.create_with_payload( char_literal164 )
        @adaptor.add_child( root_0, tree_for_char_literal164 )

        # at line 306:17: ( NL )*
        while true # decision 69
          alt_69 = 2
          look_69_0 = @input.peek( 1 )

          if ( look_69_0 == NL )
            alt_69 = 1

          end
          case alt_69
          when 1
            # at line 306:17: NL
            __NL165__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1017 )

            tree_for_NL165 = @adaptor.create_with_payload( __NL165__ )
            @adaptor.add_child( root_0, tree_for_NL165 )


          else
            break # out of loop for decision 69
          end
        end # loop for decision 69
        # at line 306:21: ( constraint_statement ( NL )+ )*
        while true # decision 71
          alt_71 = 2
          look_71_0 = @input.peek( 1 )

          if ( look_71_0 == ID || look_71_0 == T__26 )
            alt_71 = 1

          end
          case alt_71
          when 1
            # at line 306:22: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_namespace_1021 )
            constraint_statement166 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement166.tree )
            # --> action

            			key = self.to_ref(( path162 && @input.to_s( path162.start, path162.stop ) ) + '.' + ( constraint_statement166.nil? ? nil : constraint_statement166.key )[2,( constraint_statement166.nil? ? nil : constraint_statement166.key ).length])
            			@now[key] = ( constraint_statement166.nil? ? nil : constraint_statement166.val )
            		
            # <-- action
            # at file 311:3: ( NL )+
            match_count_70 = 0
            while true
              alt_70 = 2
              look_70_0 = @input.peek( 1 )

              if ( look_70_0 == NL )
                alt_70 = 1

              end
              case alt_70
              when 1
                # at line 311:3: NL
                __NL167__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1029 )

                tree_for_NL167 = @adaptor.create_with_payload( __NL167__ )
                @adaptor.add_child( root_0, tree_for_NL167 )


              else
                match_count_70 > 0 and break
                eee = EarlyExit(70)


                raise eee
              end
              match_count_70 += 1
            end


          else
            break # out of loop for decision 71
          end
        end # loop for decision 71
        char_literal168 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_namespace_1034 )

        tree_for_char_literal168 = @adaptor.create_with_payload( char_literal168 )
        @adaptor.add_child( root_0, tree_for_char_literal168 )

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
        # trace_out( __method__, 27 )

      end
      
      return return_value
    end

    ConstraintIteratorReturnValue = define_return_scope 

    # 
    # parser rule constraint_iterator
    # 
    # (in SFP.g)
    # 314:1: constraint_iterator : 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ )* '}' ;
    # 
    def constraint_iterator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = ConstraintIteratorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal169 = nil
      string_literal171 = nil
      __ID172__ = nil
      __NL173__ = nil
      char_literal174 = nil
      __NL175__ = nil
      __NL177__ = nil
      char_literal178 = nil
      path170 = nil
      constraint_statement176 = nil

      tree_for_string_literal169 = nil
      tree_for_string_literal171 = nil
      tree_for_ID172 = nil
      tree_for_NL173 = nil
      tree_for_char_literal174 = nil
      tree_for_NL175 = nil
      tree_for_NL177 = nil
      tree_for_char_literal178 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 315:4: 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ )* '}'
        string_literal169 = match( T__39, TOKENS_FOLLOWING_T__39_IN_constraint_iterator_1045 )

        tree_for_string_literal169 = @adaptor.create_with_payload( string_literal169 )
        @adaptor.add_child( root_0, tree_for_string_literal169 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_iterator_1047 )
        path170 = path
        @state.following.pop
        @adaptor.add_child( root_0, path170.tree )
        string_literal171 = match( T__40, TOKENS_FOLLOWING_T__40_IN_constraint_iterator_1049 )

        tree_for_string_literal171 = @adaptor.create_with_payload( string_literal171 )
        @adaptor.add_child( root_0, tree_for_string_literal171 )

        __ID172__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_iterator_1051 )

        tree_for_ID172 = @adaptor.create_with_payload( __ID172__ )
        @adaptor.add_child( root_0, tree_for_ID172 )

        # at line 315:27: ( NL )*
        while true # decision 72
          alt_72 = 2
          look_72_0 = @input.peek( 1 )

          if ( look_72_0 == NL )
            alt_72 = 1

          end
          case alt_72
          when 1
            # at line 315:27: NL
            __NL173__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1053 )

            tree_for_NL173 = @adaptor.create_with_payload( __NL173__ )
            @adaptor.add_child( root_0, tree_for_NL173 )


          else
            break # out of loop for decision 72
          end
        end # loop for decision 72
        char_literal174 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_iterator_1056 )

        tree_for_char_literal174 = @adaptor.create_with_payload( char_literal174 )
        @adaptor.add_child( root_0, tree_for_char_literal174 )

        # at file 315:35: ( NL )+
        match_count_73 = 0
        while true
          alt_73 = 2
          look_73_0 = @input.peek( 1 )

          if ( look_73_0 == NL )
            alt_73 = 1

          end
          case alt_73
          when 1
            # at line 315:35: NL
            __NL175__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1058 )

            tree_for_NL175 = @adaptor.create_with_payload( __NL175__ )
            @adaptor.add_child( root_0, tree_for_NL175 )


          else
            match_count_73 > 0 and break
            eee = EarlyExit(73)


            raise eee
          end
          match_count_73 += 1
        end

        # --> action

        			id = self.to_ref(( path170 && @input.to_s( path170.start, path170.stop ) ))
        			@now[id] = { '_parent' => @now,
        				'_context' => 'iterator',
        				'_self' => id,
        				'_variable' => __ID172__.text
        			}
        			@now = @now[id]
        		
        # <-- action
        # at line 325:3: ( constraint_statement ( NL )+ )*
        while true # decision 75
          alt_75 = 2
          look_75_0 = @input.peek( 1 )

          if ( look_75_0 == ID || look_75_0 == T__26 )
            alt_75 = 1

          end
          case alt_75
          when 1
            # at line 325:4: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_iterator_1068 )
            constraint_statement176 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement176.tree )
            # --> action

            			@now[( constraint_statement176.nil? ? nil : constraint_statement176.key )] = ( constraint_statement176.nil? ? nil : constraint_statement176.val )
            		
            # <-- action
            # at file 329:3: ( NL )+
            match_count_74 = 0
            while true
              alt_74 = 2
              look_74_0 = @input.peek( 1 )

              if ( look_74_0 == NL )
                alt_74 = 1

              end
              case alt_74
              when 1
                # at line 329:3: NL
                __NL177__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1076 )

                tree_for_NL177 = @adaptor.create_with_payload( __NL177__ )
                @adaptor.add_child( root_0, tree_for_NL177 )


              else
                match_count_74 > 0 and break
                eee = EarlyExit(74)


                raise eee
              end
              match_count_74 += 1
            end


          else
            break # out of loop for decision 75
          end
        end # loop for decision 75
        char_literal178 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_iterator_1083 )

        tree_for_char_literal178 = @adaptor.create_with_payload( char_literal178 )
        @adaptor.add_child( root_0, tree_for_char_literal178 )

        # --> action
        	self.goto_parent()	
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
        # trace_out( __method__, 28 )

      end
      
      return return_value
    end

    ConstraintStatementReturnValue = define_return_scope :key, :val

    # 
    # parser rule constraint_statement
    # 
    # (in SFP.g)
    # 334:1: constraint_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | conditional_constraint | reference binary_comp comp_value );
    # 
    def constraint_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = ConstraintStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL184__ = nil
      __NULL190__ = nil
      string_literal192 = nil
      string_literal193 = nil
      set196 = nil
      string_literal197 = nil
      reference179 = nil
      equals_op180 = nil
      value181 = nil
      reference182 = nil
      equals_op183 = nil
      reference185 = nil
      not_equals_op186 = nil
      value187 = nil
      reference188 = nil
      not_equals_op189 = nil
      reference191 = nil
      set_value194 = nil
      reference195 = nil
      set_value198 = nil
      conditional_constraint199 = nil
      reference200 = nil
      binary_comp201 = nil
      comp_value202 = nil

      tree_for_NULL184 = nil
      tree_for_NULL190 = nil
      tree_for_string_literal192 = nil
      tree_for_string_literal193 = nil
      tree_for_set196 = nil
      tree_for_string_literal197 = nil

      begin
        # at line 335:2: ( reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | conditional_constraint | reference binary_comp comp_value )
        alt_77 = 8
        alt_77 = @dfa77.predict( @input )
        case alt_77
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 335:4: reference equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1102 )
          reference179 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference179.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1104 )
          equals_op180 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op180.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_1106 )
          value181 = value
          @state.following.pop
          @adaptor.add_child( root_0, value181.tree )
          # --> action

          			return_value.key = ( reference179.nil? ? nil : reference179.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => ( value181.nil? ? nil : value181.val ) }
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 340:4: reference equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1115 )
          reference182 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference182.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1117 )
          equals_op183 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op183.tree )
          __NULL184__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_constraint_statement_1119 )

          tree_for_NULL184 = @adaptor.create_with_payload( __NULL184__ )
          @adaptor.add_child( root_0, tree_for_NULL184 )

          # --> action

          			return_value.key = ( reference182.nil? ? nil : reference182.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => self.null_value }
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 345:4: reference not_equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1128 )
          reference185 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference185.tree )
          @state.following.push( TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1130 )
          not_equals_op186 = not_equals_op
          @state.following.pop
          @adaptor.add_child( root_0, not_equals_op186.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_1132 )
          value187 = value
          @state.following.pop
          @adaptor.add_child( root_0, value187.tree )
          # --> action

          			return_value.key = ( reference185.nil? ? nil : reference185.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-equals', '_value' => ( value187.nil? ? nil : value187.val ) }
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 350:4: reference not_equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1141 )
          reference188 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference188.tree )
          @state.following.push( TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1143 )
          not_equals_op189 = not_equals_op
          @state.following.pop
          @adaptor.add_child( root_0, not_equals_op189.tree )
          __NULL190__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_constraint_statement_1145 )

          tree_for_NULL190 = @adaptor.create_with_payload( __NULL190__ )
          @adaptor.add_child( root_0, tree_for_NULL190 )

          # --> action

          			return_value.key = ( reference188.nil? ? nil : reference188.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-equals', '_value' => self.null_value }
          		
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 355:4: reference ( 'is' )? 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1154 )
          reference191 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference191.tree )
          # at line 355:14: ( 'is' )?
          alt_76 = 2
          look_76_0 = @input.peek( 1 )

          if ( look_76_0 == T__41 )
            alt_76 = 1
          end
          case alt_76
          when 1
            # at line 355:14: 'is'
            string_literal192 = match( T__41, TOKENS_FOLLOWING_T__41_IN_constraint_statement_1156 )

            tree_for_string_literal192 = @adaptor.create_with_payload( string_literal192 )
            @adaptor.add_child( root_0, tree_for_string_literal192 )


          end
          string_literal193 = match( T__42, TOKENS_FOLLOWING_T__42_IN_constraint_statement_1159 )

          tree_for_string_literal193 = @adaptor.create_with_payload( string_literal193 )
          @adaptor.add_child( root_0, tree_for_string_literal193 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_1161 )
          set_value194 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value194.tree )
          # --> action

          			return_value.key = ( reference191.nil? ? nil : reference191.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'in', '_value' => ( set_value194.nil? ? nil : set_value194.val ) }
          		
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 360:4: reference ( 'isnt' | 'not' ) 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1170 )
          reference195 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference195.tree )
          set196 = @input.look
          if @input.peek( 1 ).between?( T__43, T__44 )
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set196 ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          string_literal197 = match( T__42, TOKENS_FOLLOWING_T__42_IN_constraint_statement_1178 )

          tree_for_string_literal197 = @adaptor.create_with_payload( string_literal197 )
          @adaptor.add_child( root_0, tree_for_string_literal197 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_1180 )
          set_value198 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value198.tree )
          # --> action

          			return_value.key = ( reference195.nil? ? nil : reference195.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-in', '_value' => ( set_value198.nil? ? nil : set_value198.val ) }
          		
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 365:4: conditional_constraint
          @state.following.push( TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_1189 )
          conditional_constraint199 = conditional_constraint
          @state.following.pop
          @adaptor.add_child( root_0, conditional_constraint199.tree )

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 366:4: reference binary_comp comp_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1194 )
          reference200 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference200.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_1196 )
          binary_comp201 = binary_comp
          @state.following.pop
          @adaptor.add_child( root_0, binary_comp201.tree )
          @state.following.push( TOKENS_FOLLOWING_comp_value_IN_constraint_statement_1198 )
          comp_value202 = comp_value
          @state.following.pop
          @adaptor.add_child( root_0, comp_value202.tree )
          # --> action

          			return_value.key = ( reference200.nil? ? nil : reference200.val )
          			return_value.val = { '_context' => 'constraint', '_type' => ( binary_comp201 && @input.to_s( binary_comp201.start, binary_comp201.stop ) ), '_value' => ( comp_value202.nil? ? nil : comp_value202.val ) }
          		
          # <-- action

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
        # trace_out( __method__, 29 )

      end
      
      return return_value
    end

    CompValueReturnValue = define_return_scope :val

    # 
    # parser rule comp_value
    # 
    # (in SFP.g)
    # 373:1: comp_value returns [val] : ( NUMBER | reference );
    # 
    def comp_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = CompValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NUMBER203__ = nil
      reference204 = nil

      tree_for_NUMBER203 = nil

      begin
        # at line 374:2: ( NUMBER | reference )
        alt_78 = 2
        look_78_0 = @input.peek( 1 )

        if ( look_78_0 == NUMBER )
          alt_78 = 1
        elsif ( look_78_0 == ID )
          alt_78 = 2
        else
          raise NoViableAlternative( "", 78, 0 )
        end
        case alt_78
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 374:4: NUMBER
          __NUMBER203__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_comp_value_1217 )

          tree_for_NUMBER203 = @adaptor.create_with_payload( __NUMBER203__ )
          @adaptor.add_child( root_0, tree_for_NUMBER203 )

          # --> action
          	return_value.val = __NUMBER203__.text.to_f	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 376:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_comp_value_1226 )
          reference204 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference204.tree )
          # --> action
          	return_value.val = ( reference204.nil? ? nil : reference204.val )	
          # <-- action

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
        # trace_out( __method__, 30 )

      end
      
      return return_value
    end

    ConditionalConstraintReturnValue = define_return_scope 

    # 
    # parser rule conditional_constraint
    # 
    # (in SFP.g)
    # 380:1: conditional_constraint : 'if' constraint_statement ( NL )* conditional_constraint_then ;
    # 
    def conditional_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
      return_value = ConditionalConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal205 = nil
      __NL207__ = nil
      constraint_statement206 = nil
      conditional_constraint_then208 = nil

      tree_for_string_literal205 = nil
      tree_for_NL207 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 381:4: 'if' constraint_statement ( NL )* conditional_constraint_then
        string_literal205 = match( T__26, TOKENS_FOLLOWING_T__26_IN_conditional_constraint_1241 )

        tree_for_string_literal205 = @adaptor.create_with_payload( string_literal205 )
        @adaptor.add_child( root_0, tree_for_string_literal205 )

        # --> action

        			id = self.next_id
        			@now[id] = { '_parent' => @now,
        				'_context' => 'ifthen',
        				'_if' => nil,
        				'_then' => nil
        			}
        			@now = @now[id]
        		
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_1249 )
        constraint_statement206 = constraint_statement
        @state.following.pop
        @adaptor.add_child( root_0, constraint_statement206.tree )
        # at line 391:24: ( NL )*
        while true # decision 79
          alt_79 = 2
          look_79_0 = @input.peek( 1 )

          if ( look_79_0 == NL )
            alt_79 = 1

          end
          case alt_79
          when 1
            # at line 391:24: NL
            __NL207__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditional_constraint_1251 )

            tree_for_NL207 = @adaptor.create_with_payload( __NL207__ )
            @adaptor.add_child( root_0, tree_for_NL207 )


          else
            break # out of loop for decision 79
          end
        end # loop for decision 79
        # --> action

        			@now['_if'] = { '_left' => ( constraint_statement206.nil? ? nil : constraint_statement206.key ),
        				'_right' => ( constraint_statement206.nil? ? nil : constraint_statement206.val )
        			}
        		
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_conditional_constraint_then_IN_conditional_constraint_1260 )
        conditional_constraint_then208 = conditional_constraint_then
        @state.following.pop
        @adaptor.add_child( root_0, conditional_constraint_then208.tree )
        # --> action
        	self.goto_parent()	
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
        # trace_out( __method__, 31 )

      end
      
      return return_value
    end

    ConditionalConstraintThenReturnValue = define_return_scope 

    # 
    # parser rule conditional_constraint_then
    # 
    # (in SFP.g)
    # 401:1: conditional_constraint_then : 'then' constraint_statement ;
    # 
    def conditional_constraint_then
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = ConditionalConstraintThenReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal209 = nil
      constraint_statement210 = nil

      tree_for_string_literal209 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 402:4: 'then' constraint_statement
        string_literal209 = match( T__27, TOKENS_FOLLOWING_T__27_IN_conditional_constraint_then_1275 )

        tree_for_string_literal209 = @adaptor.create_with_payload( string_literal209 )
        @adaptor.add_child( root_0, tree_for_string_literal209 )

        @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_1277 )
        constraint_statement210 = constraint_statement
        @state.following.pop
        @adaptor.add_child( root_0, constraint_statement210.tree )
        # --> action

        			@now['_then'] = { '_left' => ( constraint_statement210.nil? ? nil : constraint_statement210.key ),
        				'_right' => ( constraint_statement210.nil? ? nil : constraint_statement210.val )
        			}
        		
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
        # trace_out( __method__, 32 )

      end
      
      return return_value
    end

    MutationBodyReturnValue = define_return_scope 

    # 
    # parser rule mutation_body
    # 
    # (in SFP.g)
    # 410:1: mutation_body : ( ( mutation_statement | mutation_iterator ) ( NL )+ )* ;
    # 
    def mutation_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
      return_value = MutationBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL213__ = nil
      mutation_statement211 = nil
      mutation_iterator212 = nil

      tree_for_NL213 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 411:4: ( ( mutation_statement | mutation_iterator ) ( NL )+ )*
        # at line 411:4: ( ( mutation_statement | mutation_iterator ) ( NL )+ )*
        while true # decision 82
          alt_82 = 2
          look_82_0 = @input.peek( 1 )

          if ( look_82_0 == ID || look_82_0 == T__39 || look_82_0 == T__46 )
            alt_82 = 1

          end
          case alt_82
          when 1
            # at line 412:4: ( mutation_statement | mutation_iterator ) ( NL )+
            # at line 412:4: ( mutation_statement | mutation_iterator )
            alt_80 = 2
            look_80_0 = @input.peek( 1 )

            if ( look_80_0 == ID || look_80_0 == T__46 )
              alt_80 = 1
            elsif ( look_80_0 == T__39 )
              alt_80 = 2
            else
              raise NoViableAlternative( "", 80, 0 )
            end
            case alt_80
            when 1
              # at line 412:6: mutation_statement
              @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_mutation_body_1299 )
              mutation_statement211 = mutation_statement
              @state.following.pop
              @adaptor.add_child( root_0, mutation_statement211.tree )
              # --> action
              	@now[( mutation_statement211.nil? ? nil : mutation_statement211.key )] = ( mutation_statement211.nil? ? nil : mutation_statement211.val )	
              # <-- action

            when 2
              # at line 414:6: mutation_iterator
              @state.following.push( TOKENS_FOLLOWING_mutation_iterator_IN_mutation_body_1312 )
              mutation_iterator212 = mutation_iterator
              @state.following.pop
              @adaptor.add_child( root_0, mutation_iterator212.tree )

            end
            # at file 416:3: ( NL )+
            match_count_81 = 0
            while true
              alt_81 = 2
              look_81_0 = @input.peek( 1 )

              if ( look_81_0 == NL )
                alt_81 = 1

              end
              case alt_81
              when 1
                # at line 416:3: NL
                __NL213__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_body_1321 )

                tree_for_NL213 = @adaptor.create_with_payload( __NL213__ )
                @adaptor.add_child( root_0, tree_for_NL213 )


              else
                match_count_81 > 0 and break
                eee = EarlyExit(81)


                raise eee
              end
              match_count_81 += 1
            end


          else
            break # out of loop for decision 82
          end
        end # loop for decision 82
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
        # trace_out( __method__, 33 )

      end
      
      return return_value
    end

    MutationIteratorReturnValue = define_return_scope 

    # 
    # parser rule mutation_iterator
    # 
    # (in SFP.g)
    # 419:1: mutation_iterator : 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( mutation_statement ( NL )+ )* '}' ;
    # 
    def mutation_iterator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )
      return_value = MutationIteratorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal214 = nil
      string_literal216 = nil
      __ID217__ = nil
      __NL218__ = nil
      char_literal219 = nil
      __NL220__ = nil
      __NL222__ = nil
      char_literal223 = nil
      path215 = nil
      mutation_statement221 = nil

      tree_for_string_literal214 = nil
      tree_for_string_literal216 = nil
      tree_for_ID217 = nil
      tree_for_NL218 = nil
      tree_for_char_literal219 = nil
      tree_for_NL220 = nil
      tree_for_NL222 = nil
      tree_for_char_literal223 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 420:4: 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( mutation_statement ( NL )+ )* '}'
        string_literal214 = match( T__39, TOKENS_FOLLOWING_T__39_IN_mutation_iterator_1336 )

        tree_for_string_literal214 = @adaptor.create_with_payload( string_literal214 )
        @adaptor.add_child( root_0, tree_for_string_literal214 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_iterator_1338 )
        path215 = path
        @state.following.pop
        @adaptor.add_child( root_0, path215.tree )
        string_literal216 = match( T__40, TOKENS_FOLLOWING_T__40_IN_mutation_iterator_1340 )

        tree_for_string_literal216 = @adaptor.create_with_payload( string_literal216 )
        @adaptor.add_child( root_0, tree_for_string_literal216 )

        __ID217__ = match( ID, TOKENS_FOLLOWING_ID_IN_mutation_iterator_1342 )

        tree_for_ID217 = @adaptor.create_with_payload( __ID217__ )
        @adaptor.add_child( root_0, tree_for_ID217 )

        # at line 420:27: ( NL )*
        while true # decision 83
          alt_83 = 2
          look_83_0 = @input.peek( 1 )

          if ( look_83_0 == NL )
            alt_83 = 1

          end
          case alt_83
          when 1
            # at line 420:27: NL
            __NL218__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_1344 )

            tree_for_NL218 = @adaptor.create_with_payload( __NL218__ )
            @adaptor.add_child( root_0, tree_for_NL218 )


          else
            break # out of loop for decision 83
          end
        end # loop for decision 83
        char_literal219 = match( T__20, TOKENS_FOLLOWING_T__20_IN_mutation_iterator_1347 )

        tree_for_char_literal219 = @adaptor.create_with_payload( char_literal219 )
        @adaptor.add_child( root_0, tree_for_char_literal219 )

        # at file 420:35: ( NL )+
        match_count_84 = 0
        while true
          alt_84 = 2
          look_84_0 = @input.peek( 1 )

          if ( look_84_0 == NL )
            alt_84 = 1

          end
          case alt_84
          when 1
            # at line 420:35: NL
            __NL220__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_1349 )

            tree_for_NL220 = @adaptor.create_with_payload( __NL220__ )
            @adaptor.add_child( root_0, tree_for_NL220 )


          else
            match_count_84 > 0 and break
            eee = EarlyExit(84)


            raise eee
          end
          match_count_84 += 1
        end

        # --> action

        			id = self.to_ref(( path215 && @input.to_s( path215.start, path215.stop ) ))
        			@now[id] = { '_parent' => @now,
        				'_context' => 'iterator',
        				'_self' => id,
        				'_variable' => __ID217__.text
        			}
        			@now = @now[id]
        		
        # <-- action
        # at line 430:3: ( mutation_statement ( NL )+ )*
        while true # decision 86
          alt_86 = 2
          look_86_0 = @input.peek( 1 )

          if ( look_86_0 == ID || look_86_0 == T__46 )
            alt_86 = 1

          end
          case alt_86
          when 1
            # at line 430:4: mutation_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_mutation_iterator_1359 )
            mutation_statement221 = mutation_statement
            @state.following.pop
            @adaptor.add_child( root_0, mutation_statement221.tree )
            # --> action
            	@now[( mutation_statement221.nil? ? nil : mutation_statement221.key )] = ( mutation_statement221.nil? ? nil : mutation_statement221.val )	
            # <-- action
            # at file 432:3: ( NL )+
            match_count_85 = 0
            while true
              alt_85 = 2
              look_85_0 = @input.peek( 1 )

              if ( look_85_0 == NL )
                alt_85 = 1

              end
              case alt_85
              when 1
                # at line 432:3: NL
                __NL222__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_1367 )

                tree_for_NL222 = @adaptor.create_with_payload( __NL222__ )
                @adaptor.add_child( root_0, tree_for_NL222 )


              else
                match_count_85 > 0 and break
                eee = EarlyExit(85)


                raise eee
              end
              match_count_85 += 1
            end


          else
            break # out of loop for decision 86
          end
        end # loop for decision 86
        char_literal223 = match( T__21, TOKENS_FOLLOWING_T__21_IN_mutation_iterator_1374 )

        tree_for_char_literal223 = @adaptor.create_with_payload( char_literal223 )
        @adaptor.add_child( root_0, tree_for_char_literal223 )

        # --> action
        	self.goto_parent()	
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
        # trace_out( __method__, 34 )

      end
      
      return return_value
    end

    MutationStatementReturnValue = define_return_scope :key, :val

    # 
    # parser rule mutation_statement
    # 
    # (in SFP.g)
    # 437:1: mutation_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' );
    # 
    def mutation_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
      return_value = MutationStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL229__ = nil
      __NUMBER232__ = nil
      string_literal234 = nil
      string_literal235 = nil
      string_literal238 = nil
      string_literal241 = nil
      char_literal243 = nil
      string_literal245 = nil
      char_literal247 = nil
      reference224 = nil
      equals_op225 = nil
      value226 = nil
      reference227 = nil
      equals_op228 = nil
      reference230 = nil
      binary_op231 = nil
      reference233 = nil
      path236 = nil
      object_body237 = nil
      path239 = nil
      reference240 = nil
      value242 = nil
      reference244 = nil
      value246 = nil

      tree_for_NULL229 = nil
      tree_for_NUMBER232 = nil
      tree_for_string_literal234 = nil
      tree_for_string_literal235 = nil
      tree_for_string_literal238 = nil
      tree_for_string_literal241 = nil
      tree_for_char_literal243 = nil
      tree_for_string_literal245 = nil
      tree_for_char_literal247 = nil

      begin
        # at line 438:2: ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' )
        alt_88 = 7
        alt_88 = @dfa88.predict( @input )
        case alt_88
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 438:4: reference equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1393 )
          reference224 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference224.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_mutation_statement_1395 )
          equals_op225 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op225.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_1397 )
          value226 = value
          @state.following.pop
          @adaptor.add_child( root_0, value226.tree )
          # --> action

          			return_value.key = ( reference224.nil? ? nil : reference224.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'equals',
          				'_value' => ( value226.nil? ? nil : value226.val )
          			}
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 446:4: reference equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1406 )
          reference227 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference227.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_mutation_statement_1408 )
          equals_op228 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op228.tree )
          __NULL229__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_mutation_statement_1410 )

          tree_for_NULL229 = @adaptor.create_with_payload( __NULL229__ )
          @adaptor.add_child( root_0, tree_for_NULL229 )

          # --> action

          			return_value.key = ( reference227.nil? ? nil : reference227.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'equals',
          				'_value' => self.null_value
          			}
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 454:4: reference binary_op NUMBER
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1419 )
          reference230 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference230.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_op_IN_mutation_statement_1421 )
          binary_op231 = binary_op
          @state.following.pop
          @adaptor.add_child( root_0, binary_op231.tree )
          __NUMBER232__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_mutation_statement_1423 )

          tree_for_NUMBER232 = @adaptor.create_with_payload( __NUMBER232__ )
          @adaptor.add_child( root_0, tree_for_NUMBER232 )

          # --> action

          			return_value.key = ( reference230.nil? ? nil : reference230.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => ( binary_op231 && @input.to_s( binary_op231.start, binary_op231.stop ) ),
          				'_value' => __NUMBER232__.text.to_f
          			}
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 462:4: reference 'is' 'new' path ( object_body )?
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1432 )
          reference233 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference233.tree )
          string_literal234 = match( T__41, TOKENS_FOLLOWING_T__41_IN_mutation_statement_1434 )

          tree_for_string_literal234 = @adaptor.create_with_payload( string_literal234 )
          @adaptor.add_child( root_0, tree_for_string_literal234 )

          string_literal235 = match( T__45, TOKENS_FOLLOWING_T__45_IN_mutation_statement_1436 )

          tree_for_string_literal235 = @adaptor.create_with_payload( string_literal235 )
          @adaptor.add_child( root_0, tree_for_string_literal235 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_statement_1438 )
          path236 = path
          @state.following.pop
          @adaptor.add_child( root_0, path236.tree )
          # --> action

          			id = '_' + self.next_id
          			@now[id] = { '_self' => id,
          				'_context' => 'object',
          				'_isa' => self.to_ref(( path236 && @input.to_s( path236.start, path236.stop ) )),
          				'_parent' => @now
          			}
          			@now = @now[id]
          		
          # <-- action
          # at line 472:3: ( object_body )?
          alt_87 = 2
          look_87_0 = @input.peek( 1 )

          if ( look_87_0 == T__20 )
            alt_87 = 1
          end
          case alt_87
          when 1
            # at line 472:3: object_body
            @state.following.push( TOKENS_FOLLOWING_object_body_IN_mutation_statement_1446 )
            object_body237 = object_body
            @state.following.pop
            @adaptor.add_child( root_0, object_body237.tree )

          end
          # --> action

          			n = self.goto_parent()
          			@now.delete(n['_self'])
          			return_value.key = ( reference233.nil? ? nil : reference233.val )
          			return_value.val = n
          		
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 479:4: 'delete' path
          string_literal238 = match( T__46, TOKENS_FOLLOWING_T__46_IN_mutation_statement_1456 )

          tree_for_string_literal238 = @adaptor.create_with_payload( string_literal238 )
          @adaptor.add_child( root_0, tree_for_string_literal238 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_statement_1458 )
          path239 = path
          @state.following.pop
          @adaptor.add_child( root_0, path239.tree )
          # --> action

          			id = '_' + self.next_id
          			@now[id] = { '_self' => id,
          				'_context' => 'mutation',
          				'_type' => 'delete',
          				'_value' => self.to_ref(( path239 && @input.to_s( path239.start, path239.stop ) ))
          			}
          		
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 488:4: reference 'add(' value ')'
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1467 )
          reference240 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference240.tree )
          string_literal241 = match( T__47, TOKENS_FOLLOWING_T__47_IN_mutation_statement_1469 )

          tree_for_string_literal241 = @adaptor.create_with_payload( string_literal241 )
          @adaptor.add_child( root_0, tree_for_string_literal241 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_1471 )
          value242 = value
          @state.following.pop
          @adaptor.add_child( root_0, value242.tree )
          char_literal243 = match( T__36, TOKENS_FOLLOWING_T__36_IN_mutation_statement_1473 )

          tree_for_char_literal243 = @adaptor.create_with_payload( char_literal243 )
          @adaptor.add_child( root_0, tree_for_char_literal243 )

          # --> action

          			return_value.key = ( reference240.nil? ? nil : reference240.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'add',
          				'_value' => ( value242.nil? ? nil : value242.val )
          			}
          		
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 496:4: reference 'remove(' value ')'
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1482 )
          reference244 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference244.tree )
          string_literal245 = match( T__48, TOKENS_FOLLOWING_T__48_IN_mutation_statement_1484 )

          tree_for_string_literal245 = @adaptor.create_with_payload( string_literal245 )
          @adaptor.add_child( root_0, tree_for_string_literal245 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_1486 )
          value246 = value
          @state.following.pop
          @adaptor.add_child( root_0, value246.tree )
          char_literal247 = match( T__36, TOKENS_FOLLOWING_T__36_IN_mutation_statement_1488 )

          tree_for_char_literal247 = @adaptor.create_with_payload( char_literal247 )
          @adaptor.add_child( root_0, tree_for_char_literal247 )

          # --> action

          			return_value.key = ( reference244.nil? ? nil : reference244.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'remove',
          				'_value' => ( value246.nil? ? nil : value246.val )
          			}
          		
          # <-- action

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
        # trace_out( __method__, 35 )

      end
      
      return return_value
    end

    SetValueReturnValue = define_return_scope :val

    # 
    # parser rule set_value
    # 
    # (in SFP.g)
    # 506:1: set_value returns [val] : '(' set_item ( ',' set_item )* ')' ;
    # 
    def set_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
      return_value = SetValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal248 = nil
      char_literal250 = nil
      char_literal252 = nil
      set_item249 = nil
      set_item251 = nil

      tree_for_char_literal248 = nil
      tree_for_char_literal250 = nil
      tree_for_char_literal252 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 507:4: '(' set_item ( ',' set_item )* ')'
        char_literal248 = match( T__34, TOKENS_FOLLOWING_T__34_IN_set_value_1507 )

        tree_for_char_literal248 = @adaptor.create_with_payload( char_literal248 )
        @adaptor.add_child( root_0, tree_for_char_literal248 )

        # --> action
        	@set = Array.new	
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_1515 )
        set_item249 = set_item
        @state.following.pop
        @adaptor.add_child( root_0, set_item249.tree )
        # at line 509:12: ( ',' set_item )*
        while true # decision 89
          alt_89 = 2
          look_89_0 = @input.peek( 1 )

          if ( look_89_0 == T__35 )
            alt_89 = 1

          end
          case alt_89
          when 1
            # at line 509:13: ',' set_item
            char_literal250 = match( T__35, TOKENS_FOLLOWING_T__35_IN_set_value_1518 )

            tree_for_char_literal250 = @adaptor.create_with_payload( char_literal250 )
            @adaptor.add_child( root_0, tree_for_char_literal250 )

            @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_1520 )
            set_item251 = set_item
            @state.following.pop
            @adaptor.add_child( root_0, set_item251.tree )

          else
            break # out of loop for decision 89
          end
        end # loop for decision 89
        # --> action
        	return_value.val = @set	
        # <-- action
        char_literal252 = match( T__36, TOKENS_FOLLOWING_T__36_IN_set_value_1530 )

        tree_for_char_literal252 = @adaptor.create_with_payload( char_literal252 )
        @adaptor.add_child( root_0, tree_for_char_literal252 )

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
        # trace_out( __method__, 36 )

      end
      
      return return_value
    end

    SetItemReturnValue = define_return_scope 

    # 
    # parser rule set_item
    # 
    # (in SFP.g)
    # 514:1: set_item : value ;
    # 
    def set_item
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )
      return_value = SetItemReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      value253 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 515:4: value
        @state.following.push( TOKENS_FOLLOWING_value_IN_set_item_1541 )
        value253 = value
        @state.following.pop
        @adaptor.add_child( root_0, value253.tree )
        # --> action
        	@set.push(( value253.nil? ? nil : value253.val ))	
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
        # trace_out( __method__, 37 )

      end
      
      return return_value
    end

    ValueReturnValue = define_return_scope :val

    # 
    # parser rule value
    # 
    # (in SFP.g)
    # 519:1: value returns [val] : ( primitive_value | reference | set_value );
    # 
    def value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )
      return_value = ValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      primitive_value254 = nil
      reference255 = nil
      set_value256 = nil


      begin
        # at line 520:2: ( primitive_value | reference | set_value )
        alt_90 = 3
        case look_90 = @input.peek( 1 )
        when STRING, NUMBER, BOOLEAN, MULTILINE_STRING then alt_90 = 1
        when ID then alt_90 = 2
        when T__34 then alt_90 = 3
        else
          raise NoViableAlternative( "", 90, 0 )
        end
        case alt_90
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 520:4: primitive_value
          @state.following.push( TOKENS_FOLLOWING_primitive_value_IN_value_1560 )
          primitive_value254 = primitive_value
          @state.following.pop
          @adaptor.add_child( root_0, primitive_value254.tree )
          # --> action
          	return_value.val = ( primitive_value254.nil? ? nil : primitive_value254.val )	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 522:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_value_1569 )
          reference255 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference255.tree )
          # --> action
          	return_value.val = ( reference255.nil? ? nil : reference255.val )	
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 524:4: set_value
          @state.following.push( TOKENS_FOLLOWING_set_value_IN_value_1578 )
          set_value256 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value256.tree )
          # --> action
          	return_value.val = ( set_value256.nil? ? nil : set_value256.val )	
          # <-- action

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
        # trace_out( __method__, 38 )

      end
      
      return return_value
    end

    PrimitiveValueReturnValue = define_return_scope :val

    # 
    # parser rule primitive_value
    # 
    # (in SFP.g)
    # 528:1: primitive_value returns [val] : ( BOOLEAN | NUMBER | STRING | MULTILINE_STRING );
    # 
    def primitive_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )
      return_value = PrimitiveValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __BOOLEAN257__ = nil
      __NUMBER258__ = nil
      __STRING259__ = nil
      __MULTILINE_STRING260__ = nil

      tree_for_BOOLEAN257 = nil
      tree_for_NUMBER258 = nil
      tree_for_STRING259 = nil
      tree_for_MULTILINE_STRING260 = nil

      begin
        # at line 529:2: ( BOOLEAN | NUMBER | STRING | MULTILINE_STRING )
        alt_91 = 4
        case look_91 = @input.peek( 1 )
        when BOOLEAN then alt_91 = 1
        when NUMBER then alt_91 = 2
        when STRING then alt_91 = 3
        when MULTILINE_STRING then alt_91 = 4
        else
          raise NoViableAlternative( "", 91, 0 )
        end
        case alt_91
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 529:4: BOOLEAN
          __BOOLEAN257__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_1597 )

          tree_for_BOOLEAN257 = @adaptor.create_with_payload( __BOOLEAN257__ )
          @adaptor.add_child( root_0, tree_for_BOOLEAN257 )

          # --> action

          			if __BOOLEAN257__.text == 'true' or __BOOLEAN257__.text == 'on' or __BOOLEAN257__.text == 'yes'
          				return_value.val = true
          			else  # 'false', 'no', 'off'
          				return_value.val = false
          			end
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 537:4: NUMBER
          __NUMBER258__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_primitive_value_1606 )

          tree_for_NUMBER258 = @adaptor.create_with_payload( __NUMBER258__ )
          @adaptor.add_child( root_0, tree_for_NUMBER258 )

          # --> action
          	return_value.val = __NUMBER258__.text.to_f	
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 539:4: STRING
          __STRING259__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_primitive_value_1615 )

          tree_for_STRING259 = @adaptor.create_with_payload( __STRING259__ )
          @adaptor.add_child( root_0, tree_for_STRING259 )

          # --> action
          	return_value.val = __STRING259__.text[1,__STRING259__.text.length-2]	
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 541:4: MULTILINE_STRING
          __MULTILINE_STRING260__ = match( MULTILINE_STRING, TOKENS_FOLLOWING_MULTILINE_STRING_IN_primitive_value_1624 )

          tree_for_MULTILINE_STRING260 = @adaptor.create_with_payload( __MULTILINE_STRING260__ )
          @adaptor.add_child( root_0, tree_for_MULTILINE_STRING260 )

          # --> action
          	return_value.val = __MULTILINE_STRING260__.text[2, __MULTILINE_STRING260__.text.length-2]	
          # <-- action

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
        # trace_out( __method__, 39 )

      end
      
      return return_value
    end

    PathReturnValue = define_return_scope 

    # 
    # parser rule path
    # 
    # (in SFP.g)
    # 545:1: path : ID ( '.' ID )* ;
    # 
    def path
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )
      return_value = PathReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID261__ = nil
      char_literal262 = nil
      __ID263__ = nil

      tree_for_ID261 = nil
      tree_for_char_literal262 = nil
      tree_for_ID263 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 546:4: ID ( '.' ID )*
        __ID261__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_1639 )

        tree_for_ID261 = @adaptor.create_with_payload( __ID261__ )
        @adaptor.add_child( root_0, tree_for_ID261 )

        # at line 546:6: ( '.' ID )*
        while true # decision 92
          alt_92 = 2
          look_92_0 = @input.peek( 1 )

          if ( look_92_0 == T__49 )
            alt_92 = 1

          end
          case alt_92
          when 1
            # at line 546:7: '.' ID
            char_literal262 = match( T__49, TOKENS_FOLLOWING_T__49_IN_path_1641 )

            tree_for_char_literal262 = @adaptor.create_with_payload( char_literal262 )
            @adaptor.add_child( root_0, tree_for_char_literal262 )

            __ID263__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_1642 )

            tree_for_ID263 = @adaptor.create_with_payload( __ID263__ )
            @adaptor.add_child( root_0, tree_for_ID263 )


          else
            break # out of loop for decision 92
          end
        end # loop for decision 92
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
        # trace_out( __method__, 40 )

      end
      
      return return_value
    end

    ReferenceReturnValue = define_return_scope :val

    # 
    # parser rule reference
    # 
    # (in SFP.g)
    # 549:1: reference returns [val] : path ;
    # 
    def reference
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )
      return_value = ReferenceReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      path264 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 550:4: path
        @state.following.push( TOKENS_FOLLOWING_path_IN_reference_1659 )
        path264 = path
        @state.following.pop
        @adaptor.add_child( root_0, path264.tree )
        # --> action
        	return_value.val = self.to_ref(( path264 && @input.to_s( path264.start, path264.stop ) ))	
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
        # trace_out( __method__, 41 )

      end
      
      return return_value
    end

    ReferenceTypeReturnValue = define_return_scope :val

    # 
    # parser rule reference_type
    # 
    # (in SFP.g)
    # 554:1: reference_type returns [val] : 'isref' path ;
    # 
    def reference_type
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )
      return_value = ReferenceTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal265 = nil
      path266 = nil

      tree_for_string_literal265 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 555:4: 'isref' path
        string_literal265 = match( T__50, TOKENS_FOLLOWING_T__50_IN_reference_type_1678 )

        tree_for_string_literal265 = @adaptor.create_with_payload( string_literal265 )
        @adaptor.add_child( root_0, tree_for_string_literal265 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_reference_type_1680 )
        path266 = path
        @state.following.pop
        @adaptor.add_child( root_0, path266.tree )
        # --> action

        			return_value.val = { '_context' => 'null',
        				'_isa' => self.to_ref(( path266 && @input.to_s( path266.start, path266.stop ) ))
        			}
        		
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
        # trace_out( __method__, 42 )

      end
      
      return return_value
    end

    EqualsOpReturnValue = define_return_scope 

    # 
    # parser rule equals_op
    # 
    # (in SFP.g)
    # 563:1: equals_op : ( '=' | 'is' );
    # 
    def equals_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )
      return_value = EqualsOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set267 = nil

      tree_for_set267 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set267 = @input.look
        if @input.peek(1) == T__41 || @input.peek(1) == T__51
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set267 ) )
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
        # trace_out( __method__, 43 )

      end
      
      return return_value
    end

    NotEqualsOpReturnValue = define_return_scope 

    # 
    # parser rule not_equals_op
    # 
    # (in SFP.g)
    # 568:1: not_equals_op : ( '!=' | 'isnt' );
    # 
    def not_equals_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )
      return_value = NotEqualsOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set268 = nil

      tree_for_set268 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set268 = @input.look
        if @input.peek(1) == T__43 || @input.peek(1) == T__52
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set268 ) )
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
        # trace_out( __method__, 44 )

      end
      
      return return_value
    end

    BinaryOpReturnValue = define_return_scope 

    # 
    # parser rule binary_op
    # 
    # (in SFP.g)
    # 573:1: binary_op : ( '+=' | '-=' | '*=' | '/=' );
    # 
    def binary_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )
      return_value = BinaryOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set269 = nil

      tree_for_set269 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set269 = @input.look
        if @input.peek( 1 ).between?( T__53, T__56 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set269 ) )
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
        # trace_out( __method__, 45 )

      end
      
      return return_value
    end

    BinaryCompReturnValue = define_return_scope 

    # 
    # parser rule binary_comp
    # 
    # (in SFP.g)
    # 580:1: binary_comp : ( '>' | '>=' | '<' | '<=' );
    # 
    def binary_comp
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )
      return_value = BinaryCompReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set270 = nil

      tree_for_set270 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set270 = @input.look
        if @input.peek( 1 ).between?( T__57, T__60 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set270 ) )
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
        # trace_out( __method__, 46 )

      end
      
      return return_value
    end



    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA35 < ANTLR3::DFA
      EOT = unpack( 4, -1 )
      EOF = unpack( 4, -1 )
      MIN = unpack( 2, 4, 2, -1 )
      MAX = unpack( 1, 28, 1, 29, 2, -1 )
      ACCEPT = unpack( 2, -1, 1, 1, 1, 2 )
      SPECIAL = unpack( 4, -1 )
      TRANSITION = [
        unpack( 1, 1, 23, -1, 1, 2 ),
        unpack( 1, 1, 1, -1, 1, 3, 14, -1, 1, 3, 4, -1, 1, 3, 1, -1, 1, 
                 2, 1, 3 ),
        unpack(  ),
        unpack(  )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 35
      

      def description
        <<-'__dfa_description__'.strip!
          ()* loopback of 155:3: ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )*
        __dfa_description__
      end
    end
    class DFA65 < ANTLR3::DFA
      EOT = unpack( 7, -1 )
      EOF = unpack( 7, -1 )
      MIN = unpack( 1, 6, 1, 4, 2, -1, 1, 6, 1, -1, 1, 4 )
      MAX = unpack( 1, 39, 1, 60, 2, -1, 1, 6, 1, -1, 1, 60 )
      ACCEPT = unpack( 2, -1, 1, 1, 1, 3, 1, -1, 1, 2, 1, -1 )
      SPECIAL = unpack( 7, -1 )
      TRANSITION = [
        unpack( 1, 1, 19, -1, 1, 2, 12, -1, 1, 3 ),
        unpack( 1, 5, 15, -1, 1, 5, 20, -1, 4, 2, 4, -1, 1, 4, 1, -1, 2, 
                 2, 4, -1, 4, 2 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 6 ),
        unpack(  ),
        unpack( 1, 5, 15, -1, 1, 5, 20, -1, 4, 2, 4, -1, 1, 4, 1, -1, 2, 
                 2, 4, -1, 4, 2 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 65
      

      def description
        <<-'__dfa_description__'.strip!
          297:4: ( constraint_statement | constraint_namespace | constraint_iterator )
        __dfa_description__
      end
    end
    class DFA77 < ANTLR3::DFA
      EOT = unpack( 16, -1 )
      EOF = unpack( 16, -1 )
      MIN = unpack( 1, 6, 1, 41, 1, -1, 1, 6, 3, 5, 1, -1, 1, 5, 2, -1, 
                    1, 41, 4, -1 )
      MAX = unpack( 1, 26, 1, 60, 1, -1, 1, 6, 2, 42, 1, 34, 1, -1, 1, 34, 
                    2, -1, 1, 60, 4, -1 )
      ACCEPT = unpack( 2, -1, 1, 7, 4, -1, 1, 5, 1, -1, 1, 6, 1, 8, 1, -1, 
                       1, 1, 1, 2, 1, 3, 1, 4 )
      SPECIAL = unpack( 16, -1 )
      TRANSITION = [
        unpack( 1, 1, 19, -1, 1, 2 ),
        unpack( 1, 4, 1, 7, 1, 5, 1, 9, 4, -1, 1, 3, 1, -1, 1, 6, 1, 8, 
                 4, -1, 4, 10 ),
        unpack(  ),
        unpack( 1, 11 ),
        unpack( 2, 12, 1, 13, 3, 12, 23, -1, 1, 12, 7, -1, 1, 7 ),
        unpack( 2, 14, 1, 15, 3, 14, 23, -1, 1, 14, 7, -1, 1, 9 ),
        unpack( 2, 12, 1, 13, 3, 12, 23, -1, 1, 12 ),
        unpack(  ),
        unpack( 2, 14, 1, 15, 3, 14, 23, -1, 1, 14 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 4, 1, 7, 1, 5, 1, 9, 4, -1, 1, 3, 1, -1, 1, 6, 1, 8, 
                 4, -1, 4, 10 ),
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
      
      @decision = 77
      

      def description
        <<-'__dfa_description__'.strip!
          334:1: constraint_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | conditional_constraint | reference binary_comp comp_value );
        __dfa_description__
      end
    end
    class DFA88 < ANTLR3::DFA
      EOT = unpack( 13, -1 )
      EOF = unpack( 13, -1 )
      MIN = unpack( 1, 6, 1, 41, 1, -1, 1, 6, 1, 5, 1, -1, 1, 5, 2, -1, 
                    1, 41, 3, -1 )
      MAX = unpack( 1, 46, 1, 56, 1, -1, 1, 6, 1, 45, 1, -1, 1, 34, 2, -1, 
                    1, 56, 3, -1 )
      ACCEPT = unpack( 2, -1, 1, 5, 2, -1, 1, 3, 1, -1, 1, 6, 1, 7, 1, -1, 
                       1, 4, 1, 1, 1, 2 )
      SPECIAL = unpack( 13, -1 )
      TRANSITION = [
        unpack( 1, 1, 39, -1, 1, 2 ),
        unpack( 1, 4, 5, -1, 1, 7, 1, 8, 1, 3, 1, -1, 1, 6, 1, -1, 4, 5 ),
        unpack(  ),
        unpack( 1, 9 ),
        unpack( 2, 11, 1, 12, 3, 11, 23, -1, 1, 11, 10, -1, 1, 10 ),
        unpack(  ),
        unpack( 2, 11, 1, 12, 3, 11, 23, -1, 1, 11 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 4, 5, -1, 1, 7, 1, 8, 1, 3, 1, -1, 1, 6, 1, -1, 4, 5 ),
        unpack(  ),
        unpack(  ),
        unpack(  )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 88
      

      def description
        <<-'__dfa_description__'.strip!
          437:1: mutation_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' );
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa35 = DFA35.new( self, 35 )
      @dfa65 = DFA65.new( self, 65 )
      @dfa77 = DFA77.new( self, 77 )
      @dfa88 = DFA88.new( self, 88 )

    end
    TOKENS_FOLLOWING_NL_IN_sfp_49 = Set[ 1, 4, 6, 18, 22, 23, 33 ]
    TOKENS_FOLLOWING_include_IN_sfp_52 = Set[ 1, 6, 18, 22, 23, 33 ]
    TOKENS_FOLLOWING_header_IN_sfp_55 = Set[ 1, 6, 22, 23, 33 ]
    TOKENS_FOLLOWING_state_IN_sfp_65 = Set[ 1, 6, 22 ]
    TOKENS_FOLLOWING_composite_IN_sfp_69 = Set[ 1, 6, 22 ]
    TOKENS_FOLLOWING_constraint_IN_sfp_73 = Set[ 1, 6, 22 ]
    TOKENS_FOLLOWING_T__18_IN_include_86 = Set[ 5 ]
    TOKENS_FOLLOWING_include_file_IN_include_88 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_include_90 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_STRING_IN_include_file_102 = Set[ 1 ]
    TOKENS_FOLLOWING_class_definition_IN_header_118 = Set[ 1 ]
    TOKENS_FOLLOWING_procedure_IN_header_123 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_state_134 = Set[ 19, 20 ]
    TOKENS_FOLLOWING_T__19_IN_state_137 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_147 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_NL_IN_state_149 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_attribute_IN_state_154 = Set[ 6, 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_159 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_state_161 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__22_IN_composite_177 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_composite_179 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_composite_187 = Set[ 4, 6, 21, 22 ]
    TOKENS_FOLLOWING_NL_IN_composite_189 = Set[ 4, 6, 21, 22 ]
    TOKENS_FOLLOWING_attribute_IN_composite_194 = Set[ 6, 21, 22 ]
    TOKENS_FOLLOWING_constraint_IN_composite_198 = Set[ 6, 21, 22 ]
    TOKENS_FOLLOWING_T__21_IN_composite_203 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_composite_205 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__23_IN_class_definition_221 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_class_definition_223 = Set[ 1, 4, 20, 24 ]
    TOKENS_FOLLOWING_extends_class_IN_class_definition_232 = Set[ 1, 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_class_definition_246 = Set[ 4, 6, 21, 23, 33 ]
    TOKENS_FOLLOWING_NL_IN_class_definition_248 = Set[ 4, 6, 21, 23, 33 ]
    TOKENS_FOLLOWING_attribute_IN_class_definition_253 = Set[ 6, 21, 23, 33 ]
    TOKENS_FOLLOWING_procedure_IN_class_definition_257 = Set[ 6, 21, 23, 33 ]
    TOKENS_FOLLOWING_T__21_IN_class_definition_262 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_class_definition_266 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__24_IN_extends_class_287 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_extends_class_289 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_attribute_304 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_attribute_306 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_attribute_308 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_310 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_attribute_320 = Set[ 50 ]
    TOKENS_FOLLOWING_reference_type_IN_attribute_322 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_324 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_object_def_IN_attribute_334 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_336 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_object_def_348 = Set[ 1, 20, 25 ]
    TOKENS_FOLLOWING_T__25_IN_object_def_357 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_object_def_359 = Set[ 1, 20 ]
    TOKENS_FOLLOWING_object_body_IN_object_def_372 = Set[ 1 ]
    TOKENS_FOLLOWING_T__20_IN_object_body_388 = Set[ 4, 6, 21, 26, 29 ]
    TOKENS_FOLLOWING_NL_IN_object_body_390 = Set[ 4, 6, 21, 26, 29 ]
    TOKENS_FOLLOWING_object_attribute_IN_object_body_395 = Set[ 6, 21, 26, 29 ]
    TOKENS_FOLLOWING_state_dependency_IN_object_body_399 = Set[ 6, 21, 26, 29 ]
    TOKENS_FOLLOWING_operator_IN_object_body_403 = Set[ 6, 21, 26, 29 ]
    TOKENS_FOLLOWING_T__21_IN_object_body_408 = Set[ 1 ]
    TOKENS_FOLLOWING_attribute_IN_object_attribute_419 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_object_attribute_424 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_object_attribute_426 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_object_attribute_428 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_object_attribute_430 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__26_IN_state_dependency_446 = Set[ 6 ]
    TOKENS_FOLLOWING_dep_effect_IN_state_dependency_450 = Set[ 4, 27 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_452 = Set[ 4, 27 ]
    TOKENS_FOLLOWING_T__27_IN_state_dependency_455 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_457 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_dependency_460 = Set[ 4, 6, 21, 26, 39 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_464 = Set[ 4, 6, 21, 26, 39 ]
    TOKENS_FOLLOWING_constraint_body_IN_state_dependency_467 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_dependency_472 = Set[ 4, 28 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_478 = Set[ 4, 28 ]
    TOKENS_FOLLOWING_T__28_IN_state_dependency_481 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_483 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_dependency_486 = Set[ 4, 6, 21, 26, 39 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_490 = Set[ 4, 6, 21, 26, 39 ]
    TOKENS_FOLLOWING_constraint_body_IN_state_dependency_493 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_dependency_497 = Set[ 4, 28 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_503 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_reference_IN_dep_effect_515 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_dep_effect_517 = Set[ 5, 6, 7, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_dep_effect_524 = Set[ 1 ]
    TOKENS_FOLLOWING_NULL_IN_dep_effect_530 = Set[ 1 ]
    TOKENS_FOLLOWING_T__29_IN_operator_546 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_operator_548 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_operator_550 = Set[ 4, 30, 31, 32 ]
    TOKENS_FOLLOWING_NL_IN_operator_552 = Set[ 4, 30, 31, 32 ]
    TOKENS_FOLLOWING_T__30_IN_operator_563 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_operator_565 = Set[ 8 ]
    TOKENS_FOLLOWING_NUMBER_IN_operator_567 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_operator_569 = Set[ 4, 30, 31, 32 ]
    TOKENS_FOLLOWING_op_conditions_IN_operator_588 = Set[ 4, 30, 31, 32 ]
    TOKENS_FOLLOWING_op_effects_IN_operator_591 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_operator_595 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_operator_597 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_op_param_613 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_op_param_615 = Set[ 6 ]
    TOKENS_FOLLOWING_reference_IN_op_param_617 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_param_619 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__31_IN_op_conditions_635 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_op_conditions_637 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_NL_IN_op_conditions_639 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_op_statement_IN_op_conditions_648 = Set[ 6, 21 ]
    TOKENS_FOLLOWING_T__21_IN_op_conditions_653 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_conditions_655 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__32_IN_op_effects_671 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_op_effects_673 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_NL_IN_op_effects_675 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_op_statement_IN_op_effects_684 = Set[ 6, 21 ]
    TOKENS_FOLLOWING_T__21_IN_op_effects_689 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_effects_691 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_reference_IN_op_statement_707 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_op_statement_709 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_op_statement_711 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_statement_713 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__33_IN_procedure_729 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_procedure_731 = Set[ 20, 34 ]
    TOKENS_FOLLOWING_parameters_IN_procedure_739 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_procedure_742 = Set[ 4, 30, 31, 32 ]
    TOKENS_FOLLOWING_NL_IN_procedure_744 = Set[ 4, 30, 31, 32 ]
    TOKENS_FOLLOWING_T__30_IN_procedure_752 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_procedure_754 = Set[ 8 ]
    TOKENS_FOLLOWING_NUMBER_IN_procedure_756 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_procedure_766 = Set[ 4, 30, 31, 32 ]
    TOKENS_FOLLOWING_conditions_IN_procedure_776 = Set[ 4, 30, 31, 32 ]
    TOKENS_FOLLOWING_effects_IN_procedure_779 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_procedure_781 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_procedure_783 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__34_IN_parameters_799 = Set[ 6 ]
    TOKENS_FOLLOWING_parameter_IN_parameters_801 = Set[ 35, 36 ]
    TOKENS_FOLLOWING_T__35_IN_parameters_804 = Set[ 6 ]
    TOKENS_FOLLOWING_parameter_IN_parameters_806 = Set[ 35, 36 ]
    TOKENS_FOLLOWING_T__36_IN_parameters_810 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_822 = Set[ 50 ]
    TOKENS_FOLLOWING_reference_type_IN_parameter_824 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_833 = Set[ 37 ]
    TOKENS_FOLLOWING_T__37_IN_parameter_835 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_parameter_837 = Set[ 1 ]
    TOKENS_FOLLOWING_T__31_IN_conditions_852 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_conditions_860 = Set[ 4, 6, 21, 26, 39 ]
    TOKENS_FOLLOWING_NL_IN_conditions_862 = Set[ 4, 6, 21, 26, 39 ]
    TOKENS_FOLLOWING_constraint_body_IN_conditions_865 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_conditions_867 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_conditions_869 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__32_IN_effects_886 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_effects_894 = Set[ 4, 6, 21, 39, 46 ]
    TOKENS_FOLLOWING_NL_IN_effects_896 = Set[ 4, 6, 21, 39, 46 ]
    TOKENS_FOLLOWING_mutation_body_IN_effects_902 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_effects_907 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_effects_909 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_constraint_925 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_constraint_927 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_935 = Set[ 4, 6, 21, 26, 39 ]
    TOKENS_FOLLOWING_NL_IN_constraint_937 = Set[ 4, 6, 21, 26, 39 ]
    TOKENS_FOLLOWING_constraint_body_IN_constraint_940 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_942 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_944 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_967 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_namespace_IN_constraint_body_980 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_iterator_IN_constraint_body_987 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_body_996 = Set[ 1, 4, 6, 26, 39 ]
    TOKENS_FOLLOWING_path_IN_constraint_namespace_1010 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1012 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_namespace_1015 = Set[ 4, 6, 21, 26 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1017 = Set[ 4, 6, 21, 26 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_namespace_1021 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1029 = Set[ 4, 6, 21, 26 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_namespace_1034 = Set[ 1 ]
    TOKENS_FOLLOWING_T__39_IN_constraint_iterator_1045 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_constraint_iterator_1047 = Set[ 40 ]
    TOKENS_FOLLOWING_T__40_IN_constraint_iterator_1049 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_constraint_iterator_1051 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1053 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_iterator_1056 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1058 = Set[ 4, 6, 21, 26 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_iterator_1068 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1076 = Set[ 4, 6, 21, 26 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_iterator_1083 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1102 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1104 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_1106 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1115 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1117 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_1119 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1128 = Set[ 43, 52 ]
    TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1130 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_1132 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1141 = Set[ 43, 52 ]
    TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1143 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_1145 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1154 = Set[ 41, 42 ]
    TOKENS_FOLLOWING_T__41_IN_constraint_statement_1156 = Set[ 42 ]
    TOKENS_FOLLOWING_T__42_IN_constraint_statement_1159 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_1161 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1170 = Set[ 43, 44 ]
    TOKENS_FOLLOWING_set_IN_constraint_statement_1172 = Set[ 42 ]
    TOKENS_FOLLOWING_T__42_IN_constraint_statement_1178 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_1180 = Set[ 1 ]
    TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_1189 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1194 = Set[ 57, 58, 59, 60 ]
    TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_1196 = Set[ 6, 8 ]
    TOKENS_FOLLOWING_comp_value_IN_constraint_statement_1198 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_comp_value_1217 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_comp_value_1226 = Set[ 1 ]
    TOKENS_FOLLOWING_T__26_IN_conditional_constraint_1241 = Set[ 6, 26 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_1249 = Set[ 4, 27 ]
    TOKENS_FOLLOWING_NL_IN_conditional_constraint_1251 = Set[ 4, 27 ]
    TOKENS_FOLLOWING_conditional_constraint_then_IN_conditional_constraint_1260 = Set[ 1 ]
    TOKENS_FOLLOWING_T__27_IN_conditional_constraint_then_1275 = Set[ 6, 26 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_1277 = Set[ 1 ]
    TOKENS_FOLLOWING_mutation_statement_IN_mutation_body_1299 = Set[ 4 ]
    TOKENS_FOLLOWING_mutation_iterator_IN_mutation_body_1312 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_body_1321 = Set[ 1, 4, 6, 39, 46 ]
    TOKENS_FOLLOWING_T__39_IN_mutation_iterator_1336 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_iterator_1338 = Set[ 40 ]
    TOKENS_FOLLOWING_T__40_IN_mutation_iterator_1340 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_mutation_iterator_1342 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_1344 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_mutation_iterator_1347 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_1349 = Set[ 4, 6, 21, 46 ]
    TOKENS_FOLLOWING_mutation_statement_IN_mutation_iterator_1359 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_1367 = Set[ 4, 6, 21, 46 ]
    TOKENS_FOLLOWING_T__21_IN_mutation_iterator_1374 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1393 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_mutation_statement_1395 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_1397 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1406 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_mutation_statement_1408 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_mutation_statement_1410 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1419 = Set[ 53, 54, 55, 56 ]
    TOKENS_FOLLOWING_binary_op_IN_mutation_statement_1421 = Set[ 8 ]
    TOKENS_FOLLOWING_NUMBER_IN_mutation_statement_1423 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1432 = Set[ 41 ]
    TOKENS_FOLLOWING_T__41_IN_mutation_statement_1434 = Set[ 45 ]
    TOKENS_FOLLOWING_T__45_IN_mutation_statement_1436 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_statement_1438 = Set[ 1, 20 ]
    TOKENS_FOLLOWING_object_body_IN_mutation_statement_1446 = Set[ 1 ]
    TOKENS_FOLLOWING_T__46_IN_mutation_statement_1456 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_statement_1458 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1467 = Set[ 47 ]
    TOKENS_FOLLOWING_T__47_IN_mutation_statement_1469 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_1471 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_mutation_statement_1473 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1482 = Set[ 48 ]
    TOKENS_FOLLOWING_T__48_IN_mutation_statement_1484 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_1486 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_mutation_statement_1488 = Set[ 1 ]
    TOKENS_FOLLOWING_T__34_IN_set_value_1507 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_1515 = Set[ 35, 36 ]
    TOKENS_FOLLOWING_T__35_IN_set_value_1518 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_1520 = Set[ 35, 36 ]
    TOKENS_FOLLOWING_T__36_IN_set_value_1530 = Set[ 1 ]
    TOKENS_FOLLOWING_value_IN_set_item_1541 = Set[ 1 ]
    TOKENS_FOLLOWING_primitive_value_IN_value_1560 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_value_1569 = Set[ 1 ]
    TOKENS_FOLLOWING_set_value_IN_value_1578 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_1597 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_primitive_value_1606 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_primitive_value_1615 = Set[ 1 ]
    TOKENS_FOLLOWING_MULTILINE_STRING_IN_primitive_value_1624 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_path_1639 = Set[ 1, 49 ]
    TOKENS_FOLLOWING_T__49_IN_path_1641 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_path_1642 = Set[ 1, 49 ]
    TOKENS_FOLLOWING_path_IN_reference_1659 = Set[ 1 ]
    TOKENS_FOLLOWING_T__50_IN_reference_type_1678 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_reference_type_1680 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_not_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_comp_0 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end

