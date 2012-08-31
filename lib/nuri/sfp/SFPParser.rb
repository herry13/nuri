#!/usr/bin/env ruby
#
# SFP.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: SFP.g
# Generated at: 2012-08-31 20:46:49
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
                   :ID => 6, :T__61 => 61, :T__60 => 60, :EOF => -1, :T__55 => 55, 
                   :T__19 => 19, :T__56 => 56, :T__57 => 57, :T__58 => 58, 
                   :ESC_SEQ => 14, :BOOLEAN => 9, :T__51 => 51, :T__52 => 52, 
                   :T__18 => 18, :T__53 => 53, :T__54 => 54, :T__59 => 59, 
                   :NL => 4, :COMMENT => 12, :T__50 => 50, :T__42 => 42, 
                   :T__43 => 43, :T__40 => 40, :T__41 => 41, :T__46 => 46, 
                   :T__47 => 47, :T__44 => 44, :T__45 => 45, :T__48 => 48, 
                   :T__49 => 49, :UNICODE_ESC => 16, :NULL => 7, :NUMBER => 8, 
                   :HEX_DIGIT => 15, :MULTILINE_STRING => 10, :T__30 => 30, 
                   :T__31 => 31, :T__32 => 32, :WS => 13, :T__33 => 33, 
                   :T__34 => 34, :T__35 => 35, :T__36 => 36, :T__37 => 37, 
                   :T__38 => 38, :T__39 => 39, :STRING => 5 )

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
                    "'is'", "'in'", "'isnt'", "'not'", "'total('", "'new'", 
                    "'delete'", "'add('", "'remove('", "'.'", "'isref'", 
                    "'='", "'!='", "'+='", "'-='", "'*='", "'/='", "'>'", 
                    "'>='", "'<'", "'<='" )
    
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
                     :total_constraint, :total_statement, :comp_value, :conditional_constraint, 
                     :conditional_constraint_then, :mutation_body, :mutation_iterator, 
                     :mutation_statement, :set_value, :set_item, :value, 
                     :primitive_value, :path, :reference, :reference_type, 
                     :equals_op, :not_equals_op, :binary_op, :binary_comp ].freeze


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
    # 39:1: sfp : ( NL )* ( include )* ( header )* ( state | composite | constraint )* ;
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


        # at line 40:4: ( NL )* ( include )* ( header )* ( state | composite | constraint )*
        # --> action
        	self.init	
        # <-- action
        # at line 41:3: ( NL )*
        while true # decision 1
          alt_1 = 2
          look_1_0 = @input.peek( 1 )

          if ( look_1_0 == NL )
            alt_1 = 1

          end
          case alt_1
          when 1
            # at line 41:3: NL
            __NL1__ = match( NL, TOKENS_FOLLOWING_NL_IN_sfp_49 )

            tree_for_NL1 = @adaptor.create_with_payload( __NL1__ )
            @adaptor.add_child( root_0, tree_for_NL1 )


          else
            break # out of loop for decision 1
          end
        end # loop for decision 1
        # at line 41:7: ( include )*
        while true # decision 2
          alt_2 = 2
          look_2_0 = @input.peek( 1 )

          if ( look_2_0 == T__18 )
            alt_2 = 1

          end
          case alt_2
          when 1
            # at line 41:7: include
            @state.following.push( TOKENS_FOLLOWING_include_IN_sfp_52 )
            include2 = include
            @state.following.pop
            @adaptor.add_child( root_0, include2.tree )

          else
            break # out of loop for decision 2
          end
        end # loop for decision 2
        # at line 41:16: ( header )*
        while true # decision 3
          alt_3 = 2
          look_3_0 = @input.peek( 1 )

          if ( look_3_0 == T__23 || look_3_0 == T__33 )
            alt_3 = 1

          end
          case alt_3
          when 1
            # at line 41:16: header
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
        # at line 43:3: ( state | composite | constraint )*
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
            # at line 43:4: state
            @state.following.push( TOKENS_FOLLOWING_state_IN_sfp_65 )
            state4 = state
            @state.following.pop
            @adaptor.add_child( root_0, state4.tree )

          when 2
            # at line 43:12: composite
            @state.following.push( TOKENS_FOLLOWING_composite_IN_sfp_69 )
            composite5 = composite
            @state.following.pop
            @adaptor.add_child( root_0, composite5.tree )

          when 3
            # at line 43:24: constraint
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
    # 46:1: include : 'include' include_file ( NL )+ ;
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


        # at line 47:4: 'include' include_file ( NL )+
        string_literal7 = match( T__18, TOKENS_FOLLOWING_T__18_IN_include_86 )

        tree_for_string_literal7 = @adaptor.create_with_payload( string_literal7 )
        @adaptor.add_child( root_0, tree_for_string_literal7 )

        @state.following.push( TOKENS_FOLLOWING_include_file_IN_include_88 )
        include_file8 = include_file
        @state.following.pop
        @adaptor.add_child( root_0, include_file8.tree )
        # at file 47:27: ( NL )+
        match_count_5 = 0
        while true
          alt_5 = 2
          look_5_0 = @input.peek( 1 )

          if ( look_5_0 == NL )
            alt_5 = 1

          end
          case alt_5
          when 1
            # at line 47:27: NL
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
    # 50:1: include_file : STRING ;
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


        # at line 51:4: STRING
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
    # 55:1: header : ( class_definition | procedure );
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
        # at line 56:2: ( class_definition | procedure )
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


          # at line 56:4: class_definition
          @state.following.push( TOKENS_FOLLOWING_class_definition_IN_header_118 )
          class_definition11 = class_definition
          @state.following.pop
          @adaptor.add_child( root_0, class_definition11.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 57:4: procedure
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
    # 60:1: state : ID ( 'state' )? '{' ( NL )* ( attribute )* '}' ( NL )* ;
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


        # at line 61:4: ID ( 'state' )? '{' ( NL )* ( attribute )* '}' ( NL )*
        __ID13__ = match( ID, TOKENS_FOLLOWING_ID_IN_state_134 )

        tree_for_ID13 = @adaptor.create_with_payload( __ID13__ )
        @adaptor.add_child( root_0, tree_for_ID13 )

        # at line 61:7: ( 'state' )?
        alt_7 = 2
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == T__19 )
          alt_7 = 1
        end
        case alt_7
        when 1
          # at line 61:8: 'state'
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

        # at line 69:7: ( NL )*
        while true # decision 8
          alt_8 = 2
          look_8_0 = @input.peek( 1 )

          if ( look_8_0 == NL )
            alt_8 = 1

          end
          case alt_8
          when 1
            # at line 69:7: NL
            __NL16__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_149 )

            tree_for_NL16 = @adaptor.create_with_payload( __NL16__ )
            @adaptor.add_child( root_0, tree_for_NL16 )


          else
            break # out of loop for decision 8
          end
        end # loop for decision 8
        # at line 70:3: ( attribute )*
        while true # decision 9
          alt_9 = 2
          look_9_0 = @input.peek( 1 )

          if ( look_9_0 == ID )
            alt_9 = 1

          end
          case alt_9
          when 1
            # at line 70:3: attribute
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

        # at line 71:7: ( NL )*
        while true # decision 10
          alt_10 = 2
          look_10_0 = @input.peek( 1 )

          if ( look_10_0 == NL )
            alt_10 = 1

          end
          case alt_10
          when 1
            # at line 71:7: NL
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
    # 75:1: composite : 'composite' ID '{' ( NL )* ( attribute | constraint )* '}' ( NL )* ;
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


        # at line 76:4: 'composite' ID '{' ( NL )* ( attribute | constraint )* '}' ( NL )*
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

        # at line 84:7: ( NL )*
        while true # decision 11
          alt_11 = 2
          look_11_0 = @input.peek( 1 )

          if ( look_11_0 == NL )
            alt_11 = 1

          end
          case alt_11
          when 1
            # at line 84:7: NL
            __NL23__ = match( NL, TOKENS_FOLLOWING_NL_IN_composite_189 )

            tree_for_NL23 = @adaptor.create_with_payload( __NL23__ )
            @adaptor.add_child( root_0, tree_for_NL23 )


          else
            break # out of loop for decision 11
          end
        end # loop for decision 11
        # at line 84:11: ( attribute | constraint )*
        while true # decision 12
          alt_12 = 3
          look_12_0 = @input.peek( 1 )

          if ( look_12_0 == ID )
            look_12_2 = @input.peek( 2 )

            if ( look_12_2 == T__38 )
              alt_12 = 2
            elsif ( look_12_2 == NL || look_12_2 == T__20 || look_12_2 == T__25 || look_12_2 == T__41 || look_12_2.between?( T__51, T__52 ) )
              alt_12 = 1

            end

          end
          case alt_12
          when 1
            # at line 84:13: attribute
            @state.following.push( TOKENS_FOLLOWING_attribute_IN_composite_194 )
            attribute24 = attribute
            @state.following.pop
            @adaptor.add_child( root_0, attribute24.tree )

          when 2
            # at line 84:25: constraint
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

        # at line 84:43: ( NL )*
        while true # decision 13
          alt_13 = 2
          look_13_0 = @input.peek( 1 )

          if ( look_13_0 == NL )
            alt_13 = 1

          end
          case alt_13
          when 1
            # at line 84:43: NL
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
    # 88:1: class_definition : 'class' ID ( extends_class )? ( '{' ( NL )* ( attribute | procedure )* '}' )? ( NL )* ;
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


        # at line 89:4: 'class' ID ( extends_class )? ( '{' ( NL )* ( attribute | procedure )* '}' )? ( NL )*
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
        # at line 97:3: ( extends_class )?
        alt_14 = 2
        look_14_0 = @input.peek( 1 )

        if ( look_14_0 == T__24 )
          alt_14 = 1
        end
        case alt_14
        when 1
          # at line 97:4: extends_class
          @state.following.push( TOKENS_FOLLOWING_extends_class_IN_class_definition_232 )
          extends_class30 = extends_class
          @state.following.pop
          @adaptor.add_child( root_0, extends_class30.tree )
          # --> action

          			@now['_extends'] = ( extends_class30.nil? ? nil : extends_class30.val )
          		
          # <-- action

        end
        # at line 102:3: ( '{' ( NL )* ( attribute | procedure )* '}' )?
        alt_17 = 2
        look_17_0 = @input.peek( 1 )

        if ( look_17_0 == T__20 )
          alt_17 = 1
        end
        case alt_17
        when 1
          # at line 102:4: '{' ( NL )* ( attribute | procedure )* '}'
          char_literal31 = match( T__20, TOKENS_FOLLOWING_T__20_IN_class_definition_246 )

          tree_for_char_literal31 = @adaptor.create_with_payload( char_literal31 )
          @adaptor.add_child( root_0, tree_for_char_literal31 )

          # at line 102:8: ( NL )*
          while true # decision 15
            alt_15 = 2
            look_15_0 = @input.peek( 1 )

            if ( look_15_0 == NL )
              alt_15 = 1

            end
            case alt_15
            when 1
              # at line 102:8: NL
              __NL32__ = match( NL, TOKENS_FOLLOWING_NL_IN_class_definition_248 )

              tree_for_NL32 = @adaptor.create_with_payload( __NL32__ )
              @adaptor.add_child( root_0, tree_for_NL32 )


            else
              break # out of loop for decision 15
            end
          end # loop for decision 15
          # at line 102:12: ( attribute | procedure )*
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
              # at line 102:14: attribute
              @state.following.push( TOKENS_FOLLOWING_attribute_IN_class_definition_253 )
              attribute33 = attribute
              @state.following.pop
              @adaptor.add_child( root_0, attribute33.tree )

            when 2
              # at line 102:26: procedure
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
        # at line 102:45: ( NL )*
        while true # decision 18
          alt_18 = 2
          look_18_0 = @input.peek( 1 )

          if ( look_18_0 == NL )
            alt_18 = 1

          end
          case alt_18
          when 1
            # at line 102:45: NL
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
    # 106:1: extends_class returns [val] : 'extends' path ;
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


        # at line 107:4: 'extends' path
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
    # 114:1: attribute : ( ID equals_op value ( NL )+ | ID reference_type ( NL )+ | object_def ( NL )+ );
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
        # at line 115:2: ( ID equals_op value ( NL )+ | ID reference_type ( NL )+ | object_def ( NL )+ )
        alt_22 = 3
        look_22_0 = @input.peek( 1 )

        if ( look_22_0 == ID )
          case look_22 = @input.peek( 2 )
          when T__41, T__52 then alt_22 = 1
          when T__51 then alt_22 = 2
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


          # at line 115:4: ID equals_op value ( NL )+
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
          # at file 115:23: ( NL )+
          match_count_19 = 0
          while true
            alt_19 = 2
            look_19_0 = @input.peek( 1 )

            if ( look_19_0 == NL )
              alt_19 = 1

            end
            case alt_19
            when 1
              # at line 115:23: NL
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


          # at line 117:4: ID reference_type ( NL )+
          __ID43__ = match( ID, TOKENS_FOLLOWING_ID_IN_attribute_320 )

          tree_for_ID43 = @adaptor.create_with_payload( __ID43__ )
          @adaptor.add_child( root_0, tree_for_ID43 )

          @state.following.push( TOKENS_FOLLOWING_reference_type_IN_attribute_322 )
          reference_type44 = reference_type
          @state.following.pop
          @adaptor.add_child( root_0, reference_type44.tree )
          # at file 117:22: ( NL )+
          match_count_20 = 0
          while true
            alt_20 = 2
            look_20_0 = @input.peek( 1 )

            if ( look_20_0 == NL )
              alt_20 = 1

            end
            case alt_20
            when 1
              # at line 117:22: NL
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


          # at line 119:4: object_def ( NL )+
          @state.following.push( TOKENS_FOLLOWING_object_def_IN_attribute_334 )
          object_def46 = object_def
          @state.following.pop
          @adaptor.add_child( root_0, object_def46.tree )
          # at file 119:15: ( NL )+
          match_count_21 = 0
          while true
            alt_21 = 2
            look_21_0 = @input.peek( 1 )

            if ( look_21_0 == NL )
              alt_21 = 1

            end
            case alt_21
            when 1
              # at line 119:15: NL
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
    # 122:1: object_def : ID ( 'isa' path )? ( object_body )? ;
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


        # at line 123:4: ID ( 'isa' path )? ( object_body )?
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
        # at line 132:3: ( 'isa' path )?
        alt_23 = 2
        look_23_0 = @input.peek( 1 )

        if ( look_23_0 == T__25 )
          alt_23 = 1
        end
        case alt_23
        when 1
          # at line 132:4: 'isa' path
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
        # at line 138:3: ( object_body )?
        alt_24 = 2
        look_24_0 = @input.peek( 1 )

        if ( look_24_0 == T__20 )
          alt_24 = 1
        end
        case alt_24
        when 1
          # at line 138:3: object_body
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
    # 142:1: object_body : '{' ( NL )* ( object_attribute | state_dependency | operator )* '}' ;
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


        # at line 143:4: '{' ( NL )* ( object_attribute | state_dependency | operator )* '}'
        char_literal52 = match( T__20, TOKENS_FOLLOWING_T__20_IN_object_body_388 )

        tree_for_char_literal52 = @adaptor.create_with_payload( char_literal52 )
        @adaptor.add_child( root_0, tree_for_char_literal52 )

        # at line 143:8: ( NL )*
        while true # decision 25
          alt_25 = 2
          look_25_0 = @input.peek( 1 )

          if ( look_25_0 == NL )
            alt_25 = 1

          end
          case alt_25
          when 1
            # at line 143:8: NL
            __NL53__ = match( NL, TOKENS_FOLLOWING_NL_IN_object_body_390 )

            tree_for_NL53 = @adaptor.create_with_payload( __NL53__ )
            @adaptor.add_child( root_0, tree_for_NL53 )


          else
            break # out of loop for decision 25
          end
        end # loop for decision 25
        # at line 143:12: ( object_attribute | state_dependency | operator )*
        while true # decision 26
          alt_26 = 4
          case look_26 = @input.peek( 1 )
          when ID then alt_26 = 1
          when T__26 then alt_26 = 2
          when T__29 then alt_26 = 3
          end
          case alt_26
          when 1
            # at line 143:14: object_attribute
            @state.following.push( TOKENS_FOLLOWING_object_attribute_IN_object_body_395 )
            object_attribute54 = object_attribute
            @state.following.pop
            @adaptor.add_child( root_0, object_attribute54.tree )

          when 2
            # at line 143:33: state_dependency
            @state.following.push( TOKENS_FOLLOWING_state_dependency_IN_object_body_399 )
            state_dependency55 = state_dependency
            @state.following.pop
            @adaptor.add_child( root_0, state_dependency55.tree )

          when 3
            # at line 143:52: operator
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
    # 146:1: object_attribute : ( attribute | ID equals_op NULL ( NL )+ );
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
        # at line 147:2: ( attribute | ID equals_op NULL ( NL )+ )
        alt_28 = 2
        look_28_0 = @input.peek( 1 )

        if ( look_28_0 == ID )
          look_28_1 = @input.peek( 2 )

          if ( look_28_1 == T__41 || look_28_1 == T__52 )
            look_28_2 = @input.peek( 3 )

            if ( look_28_2.between?( STRING, ID ) || look_28_2.between?( NUMBER, MULTILINE_STRING ) || look_28_2 == T__34 )
              alt_28 = 1
            elsif ( look_28_2 == NULL )
              alt_28 = 2
            else
              raise NoViableAlternative( "", 28, 2 )
            end
          elsif ( look_28_1 == NL || look_28_1 == T__20 || look_28_1 == T__25 || look_28_1 == T__51 )
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


          # at line 147:4: attribute
          @state.following.push( TOKENS_FOLLOWING_attribute_IN_object_attribute_419 )
          attribute58 = attribute
          @state.following.pop
          @adaptor.add_child( root_0, attribute58.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 148:4: ID equals_op NULL ( NL )+
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

          # at file 148:22: ( NL )+
          match_count_27 = 0
          while true
            alt_27 = 2
            look_27_0 = @input.peek( 1 )

            if ( look_27_0 == NL )
              alt_27 = 1

            end
            case alt_27
            when 1
              # at line 148:22: NL
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
    # 152:1: state_dependency : 'if' dep_effect ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )* ( NL )+ ;
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


        # at line 153:4: 'if' dep_effect ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )* ( NL )+
        string_literal63 = match( T__26, TOKENS_FOLLOWING_T__26_IN_state_dependency_446 )

        tree_for_string_literal63 = @adaptor.create_with_payload( string_literal63 )
        @adaptor.add_child( root_0, tree_for_string_literal63 )

        @state.following.push( TOKENS_FOLLOWING_dep_effect_IN_state_dependency_450 )
        dep_effect64 = dep_effect
        @state.following.pop
        @adaptor.add_child( root_0, dep_effect64.tree )
        # at line 154:14: ( NL )*
        while true # decision 29
          alt_29 = 2
          look_29_0 = @input.peek( 1 )

          if ( look_29_0 == NL )
            alt_29 = 1

          end
          case alt_29
          when 1
            # at line 154:14: NL
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

        # at line 154:25: ( NL )*
        while true # decision 30
          alt_30 = 2
          look_30_0 = @input.peek( 1 )

          if ( look_30_0 == NL )
            alt_30 = 1

          end
          case alt_30
          when 1
            # at line 154:25: NL
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

        # at line 155:3: ( NL )*
        while true # decision 31
          alt_31 = 2
          look_31_0 = @input.peek( 1 )

          if ( look_31_0 == NL )
            alt_31 = 1

          end
          case alt_31
          when 1
            # at line 155:3: NL
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

        # at line 157:3: ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )*
        while true # decision 35
          alt_35 = 2
          alt_35 = @dfa35.predict( @input )
          case alt_35
          when 1
            # at line 157:5: ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}'
            # at line 157:5: ( NL )*
            while true # decision 32
              alt_32 = 2
              look_32_0 = @input.peek( 1 )

              if ( look_32_0 == NL )
                alt_32 = 1

              end
              case alt_32
              when 1
                # at line 157:5: NL
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

            # at line 157:14: ( NL )*
            while true # decision 33
              alt_33 = 2
              look_33_0 = @input.peek( 1 )

              if ( look_33_0 == NL )
                alt_33 = 1

              end
              case alt_33
              when 1
                # at line 157:14: NL
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

            # at line 158:3: ( NL )*
            while true # decision 34
              alt_34 = 2
              look_34_0 = @input.peek( 1 )

              if ( look_34_0 == NL )
                alt_34 = 1

              end
              case alt_34
              when 1
                # at line 158:3: NL
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
        # at file 160:3: ( NL )+
        match_count_36 = 0
        while true
          alt_36 = 2
          look_36_0 = @input.peek( 1 )

          if ( look_36_0 == NL )
            alt_36 = 1

          end
          case alt_36
          when 1
            # at line 160:3: NL
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
    # 163:1: dep_effect : reference equals_op ( value | NULL ) ;
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


        # at line 164:4: reference equals_op ( value | NULL )
        @state.following.push( TOKENS_FOLLOWING_reference_IN_dep_effect_515 )
        reference80 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference80.tree )
        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_dep_effect_517 )
        equals_op81 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op81.tree )
        # at line 165:3: ( value | NULL )
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
          # at line 165:5: value
          @state.following.push( TOKENS_FOLLOWING_value_IN_dep_effect_524 )
          value82 = value
          @state.following.pop
          @adaptor.add_child( root_0, value82.tree )

        when 2
          # at line 166:5: NULL
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
    # 170:1: operator : 'operator' ID '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( op_conditions )? op_effects '}' ( NL )+ ;
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


        # at line 171:4: 'operator' ID '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( op_conditions )? op_effects '}' ( NL )+
        string_literal84 = match( T__29, TOKENS_FOLLOWING_T__29_IN_operator_546 )

        tree_for_string_literal84 = @adaptor.create_with_payload( string_literal84 )
        @adaptor.add_child( root_0, tree_for_string_literal84 )

        __ID85__ = match( ID, TOKENS_FOLLOWING_ID_IN_operator_548 )

        tree_for_ID85 = @adaptor.create_with_payload( __ID85__ )
        @adaptor.add_child( root_0, tree_for_ID85 )

        char_literal86 = match( T__20, TOKENS_FOLLOWING_T__20_IN_operator_550 )

        tree_for_char_literal86 = @adaptor.create_with_payload( char_literal86 )
        @adaptor.add_child( root_0, tree_for_char_literal86 )

        # at line 171:22: ( NL )*
        while true # decision 38
          alt_38 = 2
          look_38_0 = @input.peek( 1 )

          if ( look_38_0 == NL )
            alt_38 = 1

          end
          case alt_38
          when 1
            # at line 171:22: NL
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
        # at line 182:3: ( 'cost' equals_op NUMBER ( NL )+ )?
        alt_40 = 2
        look_40_0 = @input.peek( 1 )

        if ( look_40_0 == T__30 )
          alt_40 = 1
        end
        case alt_40
        when 1
          # at line 182:5: 'cost' equals_op NUMBER ( NL )+
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

          # at file 182:29: ( NL )+
          match_count_39 = 0
          while true
            alt_39 = 2
            look_39_0 = @input.peek( 1 )

            if ( look_39_0 == NL )
              alt_39 = 1

            end
            case alt_39
            when 1
              # at line 182:29: NL
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
        # at line 186:3: ( op_conditions )?
        alt_41 = 2
        look_41_0 = @input.peek( 1 )

        if ( look_41_0 == T__31 )
          alt_41 = 1
        end
        case alt_41
        when 1
          # at line 186:3: op_conditions
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

        # at file 187:7: ( NL )+
        match_count_42 = 0
        while true
          alt_42 = 2
          look_42_0 = @input.peek( 1 )

          if ( look_42_0 == NL )
            alt_42 = 1

          end
          case alt_42
          when 1
            # at line 187:7: NL
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
    # 191:1: op_param : ID equals_op reference ( NL )+ ;
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


        # at line 192:4: ID equals_op reference ( NL )+
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
        # at file 192:27: ( NL )+
        match_count_43 = 0
        while true
          alt_43 = 2
          look_43_0 = @input.peek( 1 )

          if ( look_43_0 == NL )
            alt_43 = 1

          end
          case alt_43
          when 1
            # at line 192:27: NL
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
    # 196:1: op_conditions : 'conditions' '{' ( NL )* ( op_statement )* '}' ( NL )+ ;
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


        # at line 197:4: 'conditions' '{' ( NL )* ( op_statement )* '}' ( NL )+
        string_literal100 = match( T__31, TOKENS_FOLLOWING_T__31_IN_op_conditions_635 )

        tree_for_string_literal100 = @adaptor.create_with_payload( string_literal100 )
        @adaptor.add_child( root_0, tree_for_string_literal100 )

        char_literal101 = match( T__20, TOKENS_FOLLOWING_T__20_IN_op_conditions_637 )

        tree_for_char_literal101 = @adaptor.create_with_payload( char_literal101 )
        @adaptor.add_child( root_0, tree_for_char_literal101 )

        # at line 197:21: ( NL )*
        while true # decision 44
          alt_44 = 2
          look_44_0 = @input.peek( 1 )

          if ( look_44_0 == NL )
            alt_44 = 1

          end
          case alt_44
          when 1
            # at line 197:21: NL
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
        # at line 202:3: ( op_statement )*
        while true # decision 45
          alt_45 = 2
          look_45_0 = @input.peek( 1 )

          if ( look_45_0 == ID )
            alt_45 = 1

          end
          case alt_45
          when 1
            # at line 202:3: op_statement
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

        # at file 203:7: ( NL )+
        match_count_46 = 0
        while true
          alt_46 = 2
          look_46_0 = @input.peek( 1 )

          if ( look_46_0 == NL )
            alt_46 = 1

          end
          case alt_46
          when 1
            # at line 203:7: NL
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
    # 207:1: op_effects : 'effects' '{' ( NL )* ( op_statement )* '}' ( NL )+ ;
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


        # at line 208:4: 'effects' '{' ( NL )* ( op_statement )* '}' ( NL )+
        string_literal106 = match( T__32, TOKENS_FOLLOWING_T__32_IN_op_effects_671 )

        tree_for_string_literal106 = @adaptor.create_with_payload( string_literal106 )
        @adaptor.add_child( root_0, tree_for_string_literal106 )

        char_literal107 = match( T__20, TOKENS_FOLLOWING_T__20_IN_op_effects_673 )

        tree_for_char_literal107 = @adaptor.create_with_payload( char_literal107 )
        @adaptor.add_child( root_0, tree_for_char_literal107 )

        # at line 208:18: ( NL )*
        while true # decision 47
          alt_47 = 2
          look_47_0 = @input.peek( 1 )

          if ( look_47_0 == NL )
            alt_47 = 1

          end
          case alt_47
          when 1
            # at line 208:18: NL
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
        # at line 213:3: ( op_statement )*
        while true # decision 48
          alt_48 = 2
          look_48_0 = @input.peek( 1 )

          if ( look_48_0 == ID )
            alt_48 = 1

          end
          case alt_48
          when 1
            # at line 213:3: op_statement
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

        # at file 214:7: ( NL )+
        match_count_49 = 0
        while true
          alt_49 = 2
          look_49_0 = @input.peek( 1 )

          if ( look_49_0 == NL )
            alt_49 = 1

          end
          case alt_49
          when 1
            # at line 214:7: NL
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
    # 218:1: op_statement : reference equals_op value ( NL )+ ;
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


        # at line 219:4: reference equals_op value ( NL )+
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
        # at file 219:30: ( NL )+
        match_count_50 = 0
        while true
          alt_50 = 2
          look_50_0 = @input.peek( 1 )

          if ( look_50_0 == NL )
            alt_50 = 1

          end
          case alt_50
          when 1
            # at line 219:30: NL
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
    # 223:1: procedure : 'procedure' ID ( parameters )? '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( conditions )? effects '}' ( NL )+ ;
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


        # at line 224:4: 'procedure' ID ( parameters )? '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( conditions )? effects '}' ( NL )+
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
        # at line 235:3: ( parameters )?
        alt_51 = 2
        look_51_0 = @input.peek( 1 )

        if ( look_51_0 == T__34 )
          alt_51 = 1
        end
        case alt_51
        when 1
          # at line 235:3: parameters
          @state.following.push( TOKENS_FOLLOWING_parameters_IN_procedure_739 )
          parameters118 = parameters
          @state.following.pop
          @adaptor.add_child( root_0, parameters118.tree )

        end
        char_literal119 = match( T__20, TOKENS_FOLLOWING_T__20_IN_procedure_742 )

        tree_for_char_literal119 = @adaptor.create_with_payload( char_literal119 )
        @adaptor.add_child( root_0, tree_for_char_literal119 )

        # at line 235:19: ( NL )*
        while true # decision 52
          alt_52 = 2
          look_52_0 = @input.peek( 1 )

          if ( look_52_0 == NL )
            alt_52 = 1

          end
          case alt_52
          when 1
            # at line 235:19: NL
            __NL120__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_744 )

            tree_for_NL120 = @adaptor.create_with_payload( __NL120__ )
            @adaptor.add_child( root_0, tree_for_NL120 )


          else
            break # out of loop for decision 52
          end
        end # loop for decision 52
        # at line 236:3: ( 'cost' equals_op NUMBER ( NL )+ )?
        alt_54 = 2
        look_54_0 = @input.peek( 1 )

        if ( look_54_0 == T__30 )
          alt_54 = 1
        end
        case alt_54
        when 1
          # at line 236:5: 'cost' equals_op NUMBER ( NL )+
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
          # at file 238:4: ( NL )+
          match_count_53 = 0
          while true
            alt_53 = 2
            look_53_0 = @input.peek( 1 )

            if ( look_53_0 == NL )
              alt_53 = 1

            end
            case alt_53
            when 1
              # at line 238:4: NL
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
        # at line 240:3: ( conditions )?
        alt_55 = 2
        look_55_0 = @input.peek( 1 )

        if ( look_55_0 == T__31 )
          alt_55 = 1
        end
        case alt_55
        when 1
          # at line 240:3: conditions
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

        # at file 240:27: ( NL )+
        match_count_56 = 0
        while true
          alt_56 = 2
          look_56_0 = @input.peek( 1 )

          if ( look_56_0 == NL )
            alt_56 = 1

          end
          case alt_56
          when 1
            # at line 240:27: NL
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
    # 244:1: parameters : '(' parameter ( ',' parameter )* ')' ;
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


        # at line 245:4: '(' parameter ( ',' parameter )* ')'
        char_literal129 = match( T__34, TOKENS_FOLLOWING_T__34_IN_parameters_799 )

        tree_for_char_literal129 = @adaptor.create_with_payload( char_literal129 )
        @adaptor.add_child( root_0, tree_for_char_literal129 )

        @state.following.push( TOKENS_FOLLOWING_parameter_IN_parameters_801 )
        parameter130 = parameter
        @state.following.pop
        @adaptor.add_child( root_0, parameter130.tree )
        # at line 245:18: ( ',' parameter )*
        while true # decision 57
          alt_57 = 2
          look_57_0 = @input.peek( 1 )

          if ( look_57_0 == T__35 )
            alt_57 = 1

          end
          case alt_57
          when 1
            # at line 245:19: ',' parameter
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
    # 248:1: parameter : ( ID reference_type | ID 'areall' path );
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
        # at line 249:2: ( ID reference_type | ID 'areall' path )
        alt_58 = 2
        look_58_0 = @input.peek( 1 )

        if ( look_58_0 == ID )
          look_58_1 = @input.peek( 2 )

          if ( look_58_1 == T__37 )
            alt_58 = 2
          elsif ( look_58_1 == T__51 )
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


          # at line 249:4: ID reference_type
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


          # at line 251:4: ID 'areall' path
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
    # 260:1: conditions : 'conditions' '{' ( NL )* constraint_body '}' ( NL )+ ;
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


        # at line 261:4: 'conditions' '{' ( NL )* constraint_body '}' ( NL )+
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

        # at line 266:7: ( NL )*
        while true # decision 59
          alt_59 = 2
          look_59_0 = @input.peek( 1 )

          if ( look_59_0 == NL )
            alt_59 = 1

          end
          case alt_59
          when 1
            # at line 266:7: NL
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

        # at file 266:31: ( NL )+
        match_count_60 = 0
        while true
          alt_60 = 2
          look_60_0 = @input.peek( 1 )

          if ( look_60_0 == NL )
            alt_60 = 1

          end
          case alt_60
          when 1
            # at line 266:31: NL
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
    # 271:1: effects : 'effects' '{' ( NL )* mutation_body '}' ( NL )+ ;
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


        # at line 272:4: 'effects' '{' ( NL )* mutation_body '}' ( NL )+
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

        # at line 277:7: ( NL )*
        while true # decision 61
          alt_61 = 2
          look_61_0 = @input.peek( 1 )

          if ( look_61_0 == NL )
            alt_61 = 1

          end
          case alt_61
          when 1
            # at line 277:7: NL
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

        # at file 279:7: ( NL )+
        match_count_62 = 0
        while true
          alt_62 = 2
          look_62_0 = @input.peek( 1 )

          if ( look_62_0 == NL )
            alt_62 = 1

          end
          case alt_62
          when 1
            # at line 279:7: NL
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
    # 283:1: constraint : ID 'constraint' '{' ( NL )* constraint_body '}' ( NL )+ ;
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


        # at line 284:4: ID 'constraint' '{' ( NL )* constraint_body '}' ( NL )+
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

        # at line 293:7: ( NL )*
        while true # decision 63
          alt_63 = 2
          look_63_0 = @input.peek( 1 )

          if ( look_63_0 == NL )
            alt_63 = 1

          end
          case alt_63
          when 1
            # at line 293:7: NL
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

        # at file 293:31: ( NL )+
        match_count_64 = 0
        while true
          alt_64 = 2
          look_64_0 = @input.peek( 1 )

          if ( look_64_0 == NL )
            alt_64 = 1

          end
          case alt_64
          when 1
            # at line 293:31: NL
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
    # 297:1: constraint_body : ( ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+ )* ;
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


        # at line 298:4: ( ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+ )*
        # at line 298:4: ( ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+ )*
        while true # decision 67
          alt_67 = 2
          look_67_0 = @input.peek( 1 )

          if ( look_67_0 == ID || look_67_0 == T__26 || look_67_0 == T__39 || look_67_0 == T__45 )
            alt_67 = 1

          end
          case alt_67
          when 1
            # at line 299:4: ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+
            # at line 299:4: ( constraint_statement | constraint_namespace | constraint_iterator )
            alt_65 = 3
            alt_65 = @dfa65.predict( @input )
            case alt_65
            when 1
              # at line 299:6: constraint_statement
              @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_967 )
              constraint_statement158 = constraint_statement
              @state.following.pop
              @adaptor.add_child( root_0, constraint_statement158.tree )
              # --> action

              					@now[( constraint_statement158.nil? ? nil : constraint_statement158.key )] = ( constraint_statement158.nil? ? nil : constraint_statement158.val )
              				
              # <-- action

            when 2
              # at line 303:6: constraint_namespace
              @state.following.push( TOKENS_FOLLOWING_constraint_namespace_IN_constraint_body_980 )
              constraint_namespace159 = constraint_namespace
              @state.following.pop
              @adaptor.add_child( root_0, constraint_namespace159.tree )

            when 3
              # at line 304:6: constraint_iterator
              @state.following.push( TOKENS_FOLLOWING_constraint_iterator_IN_constraint_body_987 )
              constraint_iterator160 = constraint_iterator
              @state.following.pop
              @adaptor.add_child( root_0, constraint_iterator160.tree )

            end
            # at file 306:3: ( NL )+
            match_count_66 = 0
            while true
              alt_66 = 2
              look_66_0 = @input.peek( 1 )

              if ( look_66_0 == NL )
                alt_66 = 1

              end
              case alt_66
              when 1
                # at line 306:3: NL
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
    # 309:1: constraint_namespace : path ( NL )* '{' ( NL )* ( constraint_statement ( NL )+ )* '}' ;
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


        # at line 310:4: path ( NL )* '{' ( NL )* ( constraint_statement ( NL )+ )* '}'
        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_namespace_1010 )
        path162 = path
        @state.following.pop
        @adaptor.add_child( root_0, path162.tree )
        # at line 310:9: ( NL )*
        while true # decision 68
          alt_68 = 2
          look_68_0 = @input.peek( 1 )

          if ( look_68_0 == NL )
            alt_68 = 1

          end
          case alt_68
          when 1
            # at line 310:9: NL
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

        # at line 310:17: ( NL )*
        while true # decision 69
          alt_69 = 2
          look_69_0 = @input.peek( 1 )

          if ( look_69_0 == NL )
            alt_69 = 1

          end
          case alt_69
          when 1
            # at line 310:17: NL
            __NL165__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1017 )

            tree_for_NL165 = @adaptor.create_with_payload( __NL165__ )
            @adaptor.add_child( root_0, tree_for_NL165 )


          else
            break # out of loop for decision 69
          end
        end # loop for decision 69
        # at line 310:21: ( constraint_statement ( NL )+ )*
        while true # decision 71
          alt_71 = 2
          look_71_0 = @input.peek( 1 )

          if ( look_71_0 == ID || look_71_0 == T__26 || look_71_0 == T__45 )
            alt_71 = 1

          end
          case alt_71
          when 1
            # at line 310:22: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_namespace_1021 )
            constraint_statement166 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement166.tree )
            # --> action

            			key = self.to_ref(( path162 && @input.to_s( path162.start, path162.stop ) ) + '.' + ( constraint_statement166.nil? ? nil : constraint_statement166.key )[2,( constraint_statement166.nil? ? nil : constraint_statement166.key ).length])
            			@now[key] = ( constraint_statement166.nil? ? nil : constraint_statement166.val )
            		
            # <-- action
            # at file 315:3: ( NL )+
            match_count_70 = 0
            while true
              alt_70 = 2
              look_70_0 = @input.peek( 1 )

              if ( look_70_0 == NL )
                alt_70 = 1

              end
              case alt_70
              when 1
                # at line 315:3: NL
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
    # 318:1: constraint_iterator : 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ )* '}' ;
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


        # at line 319:4: 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ )* '}'
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

        # at line 319:27: ( NL )*
        while true # decision 72
          alt_72 = 2
          look_72_0 = @input.peek( 1 )

          if ( look_72_0 == NL )
            alt_72 = 1

          end
          case alt_72
          when 1
            # at line 319:27: NL
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

        # at file 319:35: ( NL )+
        match_count_73 = 0
        while true
          alt_73 = 2
          look_73_0 = @input.peek( 1 )

          if ( look_73_0 == NL )
            alt_73 = 1

          end
          case alt_73
          when 1
            # at line 319:35: NL
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
        # at line 329:3: ( constraint_statement ( NL )+ )*
        while true # decision 75
          alt_75 = 2
          look_75_0 = @input.peek( 1 )

          if ( look_75_0 == ID || look_75_0 == T__26 || look_75_0 == T__45 )
            alt_75 = 1

          end
          case alt_75
          when 1
            # at line 329:4: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_iterator_1068 )
            constraint_statement176 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement176.tree )
            # --> action

            			@now[( constraint_statement176.nil? ? nil : constraint_statement176.key )] = ( constraint_statement176.nil? ? nil : constraint_statement176.val )
            		
            # <-- action
            # at file 333:3: ( NL )+
            match_count_74 = 0
            while true
              alt_74 = 2
              look_74_0 = @input.peek( 1 )

              if ( look_74_0 == NL )
                alt_74 = 1

              end
              case alt_74
              when 1
                # at line 333:3: NL
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
    # 338:1: constraint_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | conditional_constraint | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | reference binary_comp comp_value | total_constraint );
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
      string_literal193 = nil
      string_literal194 = nil
      set197 = nil
      string_literal198 = nil
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
      conditional_constraint191 = nil
      reference192 = nil
      set_value195 = nil
      reference196 = nil
      set_value199 = nil
      reference200 = nil
      binary_comp201 = nil
      comp_value202 = nil
      total_constraint203 = nil

      tree_for_NULL184 = nil
      tree_for_NULL190 = nil
      tree_for_string_literal193 = nil
      tree_for_string_literal194 = nil
      tree_for_set197 = nil
      tree_for_string_literal198 = nil

      begin
        # at line 339:2: ( reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | conditional_constraint | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | reference binary_comp comp_value | total_constraint )
        alt_77 = 9
        alt_77 = @dfa77.predict( @input )
        case alt_77
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 339:4: reference equals_op value
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


          # at line 344:4: reference equals_op NULL
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


          # at line 349:4: reference not_equals_op value
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


          # at line 354:4: reference not_equals_op NULL
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


          # at line 359:4: conditional_constraint
          @state.following.push( TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_1154 )
          conditional_constraint191 = conditional_constraint
          @state.following.pop
          @adaptor.add_child( root_0, conditional_constraint191.tree )
          # --> action

          			return_value.key = ( conditional_constraint191.nil? ? nil : conditional_constraint191.key )
          			return_value.val = ( conditional_constraint191.nil? ? nil : conditional_constraint191.val )
          		
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 364:4: reference ( 'is' )? 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1163 )
          reference192 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference192.tree )
          # at line 364:14: ( 'is' )?
          alt_76 = 2
          look_76_0 = @input.peek( 1 )

          if ( look_76_0 == T__41 )
            alt_76 = 1
          end
          case alt_76
          when 1
            # at line 364:14: 'is'
            string_literal193 = match( T__41, TOKENS_FOLLOWING_T__41_IN_constraint_statement_1165 )

            tree_for_string_literal193 = @adaptor.create_with_payload( string_literal193 )
            @adaptor.add_child( root_0, tree_for_string_literal193 )


          end
          string_literal194 = match( T__42, TOKENS_FOLLOWING_T__42_IN_constraint_statement_1168 )

          tree_for_string_literal194 = @adaptor.create_with_payload( string_literal194 )
          @adaptor.add_child( root_0, tree_for_string_literal194 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_1170 )
          set_value195 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value195.tree )
          # --> action

          			return_value.key = ( reference192.nil? ? nil : reference192.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'in', '_value' => ( set_value195.nil? ? nil : set_value195.val ) }
          		
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 369:4: reference ( 'isnt' | 'not' ) 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1179 )
          reference196 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference196.tree )
          set197 = @input.look
          if @input.peek( 1 ).between?( T__43, T__44 )
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set197 ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          string_literal198 = match( T__42, TOKENS_FOLLOWING_T__42_IN_constraint_statement_1187 )

          tree_for_string_literal198 = @adaptor.create_with_payload( string_literal198 )
          @adaptor.add_child( root_0, tree_for_string_literal198 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_1189 )
          set_value199 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value199.tree )
          # --> action

          			return_value.key = ( reference196.nil? ? nil : reference196.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-in', '_value' => ( set_value199.nil? ? nil : set_value199.val ) }
          		
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 374:4: reference binary_comp comp_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1198 )
          reference200 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference200.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_1200 )
          binary_comp201 = binary_comp
          @state.following.pop
          @adaptor.add_child( root_0, binary_comp201.tree )
          @state.following.push( TOKENS_FOLLOWING_comp_value_IN_constraint_statement_1202 )
          comp_value202 = comp_value
          @state.following.pop
          @adaptor.add_child( root_0, comp_value202.tree )
          # --> action

          			return_value.key = ( reference200.nil? ? nil : reference200.val )
          			return_value.val = { '_context' => 'constraint', '_type' => ( binary_comp201 && @input.to_s( binary_comp201.start, binary_comp201.stop ) ), '_value' => ( comp_value202.nil? ? nil : comp_value202.val ) }
          		
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 379:4: total_constraint
          @state.following.push( TOKENS_FOLLOWING_total_constraint_IN_constraint_statement_1211 )
          total_constraint203 = total_constraint
          @state.following.pop
          @adaptor.add_child( root_0, total_constraint203.tree )

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

    TotalConstraintReturnValue = define_return_scope 

    # 
    # parser rule total_constraint
    # 
    # (in SFP.g)
    # 382:1: total_constraint : 'total(' total_statement ')' binary_comp NUMBER ;
    # 
    def total_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = TotalConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal204 = nil
      char_literal206 = nil
      __NUMBER208__ = nil
      total_statement205 = nil
      binary_comp207 = nil

      tree_for_string_literal204 = nil
      tree_for_char_literal206 = nil
      tree_for_NUMBER208 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 383:4: 'total(' total_statement ')' binary_comp NUMBER
        string_literal204 = match( T__45, TOKENS_FOLLOWING_T__45_IN_total_constraint_1222 )

        tree_for_string_literal204 = @adaptor.create_with_payload( string_literal204 )
        @adaptor.add_child( root_0, tree_for_string_literal204 )

        @state.following.push( TOKENS_FOLLOWING_total_statement_IN_total_constraint_1224 )
        total_statement205 = total_statement
        @state.following.pop
        @adaptor.add_child( root_0, total_statement205.tree )
        char_literal206 = match( T__36, TOKENS_FOLLOWING_T__36_IN_total_constraint_1226 )

        tree_for_char_literal206 = @adaptor.create_with_payload( char_literal206 )
        @adaptor.add_child( root_0, tree_for_char_literal206 )

        @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_total_constraint_1228 )
        binary_comp207 = binary_comp
        @state.following.pop
        @adaptor.add_child( root_0, binary_comp207.tree )
        __NUMBER208__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_total_constraint_1230 )

        tree_for_NUMBER208 = @adaptor.create_with_payload( __NUMBER208__ )
        @adaptor.add_child( root_0, tree_for_NUMBER208 )

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
        # trace_out( __method__, 30 )

      end
      
      return return_value
    end

    TotalStatementReturnValue = define_return_scope 

    # 
    # parser rule total_statement
    # 
    # (in SFP.g)
    # 386:1: total_statement : reference equals_op value ;
    # 
    def total_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
      return_value = TotalStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      reference209 = nil
      equals_op210 = nil
      value211 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 387:4: reference equals_op value
        @state.following.push( TOKENS_FOLLOWING_reference_IN_total_statement_1241 )
        reference209 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference209.tree )
        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_total_statement_1243 )
        equals_op210 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op210.tree )
        @state.following.push( TOKENS_FOLLOWING_value_IN_total_statement_1245 )
        value211 = value
        @state.following.pop
        @adaptor.add_child( root_0, value211.tree )
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

    CompValueReturnValue = define_return_scope :val

    # 
    # parser rule comp_value
    # 
    # (in SFP.g)
    # 390:1: comp_value returns [val] : ( NUMBER | reference );
    # 
    def comp_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = CompValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NUMBER212__ = nil
      reference213 = nil

      tree_for_NUMBER212 = nil

      begin
        # at line 391:2: ( NUMBER | reference )
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


          # at line 391:4: NUMBER
          __NUMBER212__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_comp_value_1260 )

          tree_for_NUMBER212 = @adaptor.create_with_payload( __NUMBER212__ )
          @adaptor.add_child( root_0, tree_for_NUMBER212 )

          # --> action
          	return_value.val = __NUMBER212__.text.to_f	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 393:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_comp_value_1269 )
          reference213 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference213.tree )
          # --> action
          	return_value.val = ( reference213.nil? ? nil : reference213.val )	
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
        # trace_out( __method__, 32 )

      end
      
      return return_value
    end

    ConditionalConstraintReturnValue = define_return_scope :key, :val

    # 
    # parser rule conditional_constraint
    # 
    # (in SFP.g)
    # 397:1: conditional_constraint returns [key, val] : 'if' constraint_statement ( NL )* conditional_constraint_then ;
    # 
    def conditional_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
      return_value = ConditionalConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal214 = nil
      __NL216__ = nil
      constraint_statement215 = nil
      conditional_constraint_then217 = nil

      tree_for_string_literal214 = nil
      tree_for_NL216 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 398:4: 'if' constraint_statement ( NL )* conditional_constraint_then
        string_literal214 = match( T__26, TOKENS_FOLLOWING_T__26_IN_conditional_constraint_1288 )

        tree_for_string_literal214 = @adaptor.create_with_payload( string_literal214 )
        @adaptor.add_child( root_0, tree_for_string_literal214 )

        # --> action

        			return_value.key = id = self.next_id.to_s
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'or'
        			}
        			@now = @now[id]
        		
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_1296 )
        constraint_statement215 = constraint_statement
        @state.following.pop
        @adaptor.add_child( root_0, constraint_statement215.tree )
        # at line 407:24: ( NL )*
        while true # decision 79
          alt_79 = 2
          look_79_0 = @input.peek( 1 )

          if ( look_79_0 == NL )
            alt_79 = 1

          end
          case alt_79
          when 1
            # at line 407:24: NL
            __NL216__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditional_constraint_1298 )

            tree_for_NL216 = @adaptor.create_with_payload( __NL216__ )
            @adaptor.add_child( root_0, tree_for_NL216 )


          else
            break # out of loop for decision 79
          end
        end # loop for decision 79
        # --> action

        			id = self.next_id
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'not'
        			}
        			@now[id][( constraint_statement215.nil? ? nil : constraint_statement215.key )] = ( constraint_statement215.nil? ? nil : constraint_statement215.val )
        		
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_conditional_constraint_then_IN_conditional_constraint_1307 )
        conditional_constraint_then217 = conditional_constraint_then
        @state.following.pop
        @adaptor.add_child( root_0, conditional_constraint_then217.tree )
        # --> action
        	return_value.val = self.goto_parent()	
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
        # trace_out( __method__, 33 )

      end
      
      return return_value
    end

    ConditionalConstraintThenReturnValue = define_return_scope 

    # 
    # parser rule conditional_constraint_then
    # 
    # (in SFP.g)
    # 420:1: conditional_constraint_then : 'then' constraint_statement ;
    # 
    def conditional_constraint_then
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )
      return_value = ConditionalConstraintThenReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal218 = nil
      constraint_statement219 = nil

      tree_for_string_literal218 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 421:4: 'then' constraint_statement
        string_literal218 = match( T__27, TOKENS_FOLLOWING_T__27_IN_conditional_constraint_then_1322 )

        tree_for_string_literal218 = @adaptor.create_with_payload( string_literal218 )
        @adaptor.add_child( root_0, tree_for_string_literal218 )

        @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_1324 )
        constraint_statement219 = constraint_statement
        @state.following.pop
        @adaptor.add_child( root_0, constraint_statement219.tree )
        # --> action

        			id = self.next_id
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'and'
        			}
        			@now[id][( constraint_statement219.nil? ? nil : constraint_statement219.key )] = ( constraint_statement219.nil? ? nil : constraint_statement219.val )
        		
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

    MutationBodyReturnValue = define_return_scope 

    # 
    # parser rule mutation_body
    # 
    # (in SFP.g)
    # 432:1: mutation_body : ( ( mutation_statement | mutation_iterator ) ( NL )+ )* ;
    # 
    def mutation_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
      return_value = MutationBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL222__ = nil
      mutation_statement220 = nil
      mutation_iterator221 = nil

      tree_for_NL222 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 433:4: ( ( mutation_statement | mutation_iterator ) ( NL )+ )*
        # at line 433:4: ( ( mutation_statement | mutation_iterator ) ( NL )+ )*
        while true # decision 82
          alt_82 = 2
          look_82_0 = @input.peek( 1 )

          if ( look_82_0 == ID || look_82_0 == T__39 || look_82_0 == T__47 )
            alt_82 = 1

          end
          case alt_82
          when 1
            # at line 434:4: ( mutation_statement | mutation_iterator ) ( NL )+
            # at line 434:4: ( mutation_statement | mutation_iterator )
            alt_80 = 2
            look_80_0 = @input.peek( 1 )

            if ( look_80_0 == ID || look_80_0 == T__47 )
              alt_80 = 1
            elsif ( look_80_0 == T__39 )
              alt_80 = 2
            else
              raise NoViableAlternative( "", 80, 0 )
            end
            case alt_80
            when 1
              # at line 434:6: mutation_statement
              @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_mutation_body_1346 )
              mutation_statement220 = mutation_statement
              @state.following.pop
              @adaptor.add_child( root_0, mutation_statement220.tree )
              # --> action
              	@now[( mutation_statement220.nil? ? nil : mutation_statement220.key )] = ( mutation_statement220.nil? ? nil : mutation_statement220.val )	
              # <-- action

            when 2
              # at line 436:6: mutation_iterator
              @state.following.push( TOKENS_FOLLOWING_mutation_iterator_IN_mutation_body_1359 )
              mutation_iterator221 = mutation_iterator
              @state.following.pop
              @adaptor.add_child( root_0, mutation_iterator221.tree )

            end
            # at file 438:3: ( NL )+
            match_count_81 = 0
            while true
              alt_81 = 2
              look_81_0 = @input.peek( 1 )

              if ( look_81_0 == NL )
                alt_81 = 1

              end
              case alt_81
              when 1
                # at line 438:3: NL
                __NL222__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_body_1368 )

                tree_for_NL222 = @adaptor.create_with_payload( __NL222__ )
                @adaptor.add_child( root_0, tree_for_NL222 )


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
        # trace_out( __method__, 35 )

      end
      
      return return_value
    end

    MutationIteratorReturnValue = define_return_scope 

    # 
    # parser rule mutation_iterator
    # 
    # (in SFP.g)
    # 441:1: mutation_iterator : 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( mutation_statement ( NL )+ )* '}' ;
    # 
    def mutation_iterator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
      return_value = MutationIteratorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal223 = nil
      string_literal225 = nil
      __ID226__ = nil
      __NL227__ = nil
      char_literal228 = nil
      __NL229__ = nil
      __NL231__ = nil
      char_literal232 = nil
      path224 = nil
      mutation_statement230 = nil

      tree_for_string_literal223 = nil
      tree_for_string_literal225 = nil
      tree_for_ID226 = nil
      tree_for_NL227 = nil
      tree_for_char_literal228 = nil
      tree_for_NL229 = nil
      tree_for_NL231 = nil
      tree_for_char_literal232 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 442:4: 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( mutation_statement ( NL )+ )* '}'
        string_literal223 = match( T__39, TOKENS_FOLLOWING_T__39_IN_mutation_iterator_1383 )

        tree_for_string_literal223 = @adaptor.create_with_payload( string_literal223 )
        @adaptor.add_child( root_0, tree_for_string_literal223 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_iterator_1385 )
        path224 = path
        @state.following.pop
        @adaptor.add_child( root_0, path224.tree )
        string_literal225 = match( T__40, TOKENS_FOLLOWING_T__40_IN_mutation_iterator_1387 )

        tree_for_string_literal225 = @adaptor.create_with_payload( string_literal225 )
        @adaptor.add_child( root_0, tree_for_string_literal225 )

        __ID226__ = match( ID, TOKENS_FOLLOWING_ID_IN_mutation_iterator_1389 )

        tree_for_ID226 = @adaptor.create_with_payload( __ID226__ )
        @adaptor.add_child( root_0, tree_for_ID226 )

        # at line 442:27: ( NL )*
        while true # decision 83
          alt_83 = 2
          look_83_0 = @input.peek( 1 )

          if ( look_83_0 == NL )
            alt_83 = 1

          end
          case alt_83
          when 1
            # at line 442:27: NL
            __NL227__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_1391 )

            tree_for_NL227 = @adaptor.create_with_payload( __NL227__ )
            @adaptor.add_child( root_0, tree_for_NL227 )


          else
            break # out of loop for decision 83
          end
        end # loop for decision 83
        char_literal228 = match( T__20, TOKENS_FOLLOWING_T__20_IN_mutation_iterator_1394 )

        tree_for_char_literal228 = @adaptor.create_with_payload( char_literal228 )
        @adaptor.add_child( root_0, tree_for_char_literal228 )

        # at file 442:35: ( NL )+
        match_count_84 = 0
        while true
          alt_84 = 2
          look_84_0 = @input.peek( 1 )

          if ( look_84_0 == NL )
            alt_84 = 1

          end
          case alt_84
          when 1
            # at line 442:35: NL
            __NL229__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_1396 )

            tree_for_NL229 = @adaptor.create_with_payload( __NL229__ )
            @adaptor.add_child( root_0, tree_for_NL229 )


          else
            match_count_84 > 0 and break
            eee = EarlyExit(84)


            raise eee
          end
          match_count_84 += 1
        end

        # --> action

        			id = self.to_ref(( path224 && @input.to_s( path224.start, path224.stop ) ))
        			@now[id] = { '_parent' => @now,
        				'_context' => 'iterator',
        				'_self' => id,
        				'_variable' => __ID226__.text
        			}
        			@now = @now[id]
        		
        # <-- action
        # at line 452:3: ( mutation_statement ( NL )+ )*
        while true # decision 86
          alt_86 = 2
          look_86_0 = @input.peek( 1 )

          if ( look_86_0 == ID || look_86_0 == T__47 )
            alt_86 = 1

          end
          case alt_86
          when 1
            # at line 452:4: mutation_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_mutation_iterator_1406 )
            mutation_statement230 = mutation_statement
            @state.following.pop
            @adaptor.add_child( root_0, mutation_statement230.tree )
            # --> action
            	@now[( mutation_statement230.nil? ? nil : mutation_statement230.key )] = ( mutation_statement230.nil? ? nil : mutation_statement230.val )	
            # <-- action
            # at file 454:3: ( NL )+
            match_count_85 = 0
            while true
              alt_85 = 2
              look_85_0 = @input.peek( 1 )

              if ( look_85_0 == NL )
                alt_85 = 1

              end
              case alt_85
              when 1
                # at line 454:3: NL
                __NL231__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_1414 )

                tree_for_NL231 = @adaptor.create_with_payload( __NL231__ )
                @adaptor.add_child( root_0, tree_for_NL231 )


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
        char_literal232 = match( T__21, TOKENS_FOLLOWING_T__21_IN_mutation_iterator_1421 )

        tree_for_char_literal232 = @adaptor.create_with_payload( char_literal232 )
        @adaptor.add_child( root_0, tree_for_char_literal232 )

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
        # trace_out( __method__, 36 )

      end
      
      return return_value
    end

    MutationStatementReturnValue = define_return_scope :key, :val

    # 
    # parser rule mutation_statement
    # 
    # (in SFP.g)
    # 459:1: mutation_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' );
    # 
    def mutation_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )
      return_value = MutationStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL238__ = nil
      __NUMBER241__ = nil
      string_literal243 = nil
      string_literal244 = nil
      string_literal247 = nil
      string_literal250 = nil
      char_literal252 = nil
      string_literal254 = nil
      char_literal256 = nil
      reference233 = nil
      equals_op234 = nil
      value235 = nil
      reference236 = nil
      equals_op237 = nil
      reference239 = nil
      binary_op240 = nil
      reference242 = nil
      path245 = nil
      object_body246 = nil
      path248 = nil
      reference249 = nil
      value251 = nil
      reference253 = nil
      value255 = nil

      tree_for_NULL238 = nil
      tree_for_NUMBER241 = nil
      tree_for_string_literal243 = nil
      tree_for_string_literal244 = nil
      tree_for_string_literal247 = nil
      tree_for_string_literal250 = nil
      tree_for_char_literal252 = nil
      tree_for_string_literal254 = nil
      tree_for_char_literal256 = nil

      begin
        # at line 460:2: ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' )
        alt_88 = 7
        alt_88 = @dfa88.predict( @input )
        case alt_88
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 460:4: reference equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1440 )
          reference233 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference233.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_mutation_statement_1442 )
          equals_op234 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op234.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_1444 )
          value235 = value
          @state.following.pop
          @adaptor.add_child( root_0, value235.tree )
          # --> action

          			return_value.key = ( reference233.nil? ? nil : reference233.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'equals',
          				'_value' => ( value235.nil? ? nil : value235.val )
          			}
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 468:4: reference equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1453 )
          reference236 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference236.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_mutation_statement_1455 )
          equals_op237 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op237.tree )
          __NULL238__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_mutation_statement_1457 )

          tree_for_NULL238 = @adaptor.create_with_payload( __NULL238__ )
          @adaptor.add_child( root_0, tree_for_NULL238 )

          # --> action

          			return_value.key = ( reference236.nil? ? nil : reference236.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'equals',
          				'_value' => self.null_value
          			}
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 476:4: reference binary_op NUMBER
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1466 )
          reference239 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference239.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_op_IN_mutation_statement_1468 )
          binary_op240 = binary_op
          @state.following.pop
          @adaptor.add_child( root_0, binary_op240.tree )
          __NUMBER241__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_mutation_statement_1470 )

          tree_for_NUMBER241 = @adaptor.create_with_payload( __NUMBER241__ )
          @adaptor.add_child( root_0, tree_for_NUMBER241 )

          # --> action

          			return_value.key = ( reference239.nil? ? nil : reference239.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => ( binary_op240 && @input.to_s( binary_op240.start, binary_op240.stop ) ),
          				'_value' => __NUMBER241__.text.to_f
          			}
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 484:4: reference 'is' 'new' path ( object_body )?
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1479 )
          reference242 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference242.tree )
          string_literal243 = match( T__41, TOKENS_FOLLOWING_T__41_IN_mutation_statement_1481 )

          tree_for_string_literal243 = @adaptor.create_with_payload( string_literal243 )
          @adaptor.add_child( root_0, tree_for_string_literal243 )

          string_literal244 = match( T__46, TOKENS_FOLLOWING_T__46_IN_mutation_statement_1483 )

          tree_for_string_literal244 = @adaptor.create_with_payload( string_literal244 )
          @adaptor.add_child( root_0, tree_for_string_literal244 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_statement_1485 )
          path245 = path
          @state.following.pop
          @adaptor.add_child( root_0, path245.tree )
          # --> action

          			id = '_' + self.next_id
          			@now[id] = { '_self' => id,
          				'_context' => 'object',
          				'_isa' => self.to_ref(( path245 && @input.to_s( path245.start, path245.stop ) )),
          				'_parent' => @now
          			}
          			@now = @now[id]
          		
          # <-- action
          # at line 494:3: ( object_body )?
          alt_87 = 2
          look_87_0 = @input.peek( 1 )

          if ( look_87_0 == T__20 )
            alt_87 = 1
          end
          case alt_87
          when 1
            # at line 494:3: object_body
            @state.following.push( TOKENS_FOLLOWING_object_body_IN_mutation_statement_1493 )
            object_body246 = object_body
            @state.following.pop
            @adaptor.add_child( root_0, object_body246.tree )

          end
          # --> action

          			n = self.goto_parent()
          			@now.delete(n['_self'])
          			return_value.key = ( reference242.nil? ? nil : reference242.val )
          			return_value.val = n
          		
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 501:4: 'delete' path
          string_literal247 = match( T__47, TOKENS_FOLLOWING_T__47_IN_mutation_statement_1503 )

          tree_for_string_literal247 = @adaptor.create_with_payload( string_literal247 )
          @adaptor.add_child( root_0, tree_for_string_literal247 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_statement_1505 )
          path248 = path
          @state.following.pop
          @adaptor.add_child( root_0, path248.tree )
          # --> action

          			id = '_' + self.next_id
          			@now[id] = { '_self' => id,
          				'_context' => 'mutation',
          				'_type' => 'delete',
          				'_value' => self.to_ref(( path248 && @input.to_s( path248.start, path248.stop ) ))
          			}
          		
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 510:4: reference 'add(' value ')'
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1514 )
          reference249 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference249.tree )
          string_literal250 = match( T__48, TOKENS_FOLLOWING_T__48_IN_mutation_statement_1516 )

          tree_for_string_literal250 = @adaptor.create_with_payload( string_literal250 )
          @adaptor.add_child( root_0, tree_for_string_literal250 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_1518 )
          value251 = value
          @state.following.pop
          @adaptor.add_child( root_0, value251.tree )
          char_literal252 = match( T__36, TOKENS_FOLLOWING_T__36_IN_mutation_statement_1520 )

          tree_for_char_literal252 = @adaptor.create_with_payload( char_literal252 )
          @adaptor.add_child( root_0, tree_for_char_literal252 )

          # --> action

          			return_value.key = ( reference249.nil? ? nil : reference249.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'add',
          				'_value' => ( value251.nil? ? nil : value251.val )
          			}
          		
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 518:4: reference 'remove(' value ')'
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1529 )
          reference253 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference253.tree )
          string_literal254 = match( T__49, TOKENS_FOLLOWING_T__49_IN_mutation_statement_1531 )

          tree_for_string_literal254 = @adaptor.create_with_payload( string_literal254 )
          @adaptor.add_child( root_0, tree_for_string_literal254 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_1533 )
          value255 = value
          @state.following.pop
          @adaptor.add_child( root_0, value255.tree )
          char_literal256 = match( T__36, TOKENS_FOLLOWING_T__36_IN_mutation_statement_1535 )

          tree_for_char_literal256 = @adaptor.create_with_payload( char_literal256 )
          @adaptor.add_child( root_0, tree_for_char_literal256 )

          # --> action

          			return_value.key = ( reference253.nil? ? nil : reference253.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'remove',
          				'_value' => ( value255.nil? ? nil : value255.val )
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
        # trace_out( __method__, 37 )

      end
      
      return return_value
    end

    SetValueReturnValue = define_return_scope :val

    # 
    # parser rule set_value
    # 
    # (in SFP.g)
    # 528:1: set_value returns [val] : '(' set_item ( ',' set_item )* ')' ;
    # 
    def set_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )
      return_value = SetValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal257 = nil
      char_literal259 = nil
      char_literal261 = nil
      set_item258 = nil
      set_item260 = nil

      tree_for_char_literal257 = nil
      tree_for_char_literal259 = nil
      tree_for_char_literal261 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 529:4: '(' set_item ( ',' set_item )* ')'
        char_literal257 = match( T__34, TOKENS_FOLLOWING_T__34_IN_set_value_1554 )

        tree_for_char_literal257 = @adaptor.create_with_payload( char_literal257 )
        @adaptor.add_child( root_0, tree_for_char_literal257 )

        # --> action
        	@set = Array.new	
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_1562 )
        set_item258 = set_item
        @state.following.pop
        @adaptor.add_child( root_0, set_item258.tree )
        # at line 531:12: ( ',' set_item )*
        while true # decision 89
          alt_89 = 2
          look_89_0 = @input.peek( 1 )

          if ( look_89_0 == T__35 )
            alt_89 = 1

          end
          case alt_89
          when 1
            # at line 531:13: ',' set_item
            char_literal259 = match( T__35, TOKENS_FOLLOWING_T__35_IN_set_value_1565 )

            tree_for_char_literal259 = @adaptor.create_with_payload( char_literal259 )
            @adaptor.add_child( root_0, tree_for_char_literal259 )

            @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_1567 )
            set_item260 = set_item
            @state.following.pop
            @adaptor.add_child( root_0, set_item260.tree )

          else
            break # out of loop for decision 89
          end
        end # loop for decision 89
        # --> action
        	return_value.val = @set	
        # <-- action
        char_literal261 = match( T__36, TOKENS_FOLLOWING_T__36_IN_set_value_1577 )

        tree_for_char_literal261 = @adaptor.create_with_payload( char_literal261 )
        @adaptor.add_child( root_0, tree_for_char_literal261 )

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
        # trace_out( __method__, 38 )

      end
      
      return return_value
    end

    SetItemReturnValue = define_return_scope 

    # 
    # parser rule set_item
    # 
    # (in SFP.g)
    # 536:1: set_item : value ;
    # 
    def set_item
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )
      return_value = SetItemReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      value262 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 537:4: value
        @state.following.push( TOKENS_FOLLOWING_value_IN_set_item_1588 )
        value262 = value
        @state.following.pop
        @adaptor.add_child( root_0, value262.tree )
        # --> action
        	@set.push(( value262.nil? ? nil : value262.val ))	
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
        # trace_out( __method__, 39 )

      end
      
      return return_value
    end

    ValueReturnValue = define_return_scope :val

    # 
    # parser rule value
    # 
    # (in SFP.g)
    # 541:1: value returns [val] : ( primitive_value | reference | set_value );
    # 
    def value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )
      return_value = ValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      primitive_value263 = nil
      reference264 = nil
      set_value265 = nil


      begin
        # at line 542:2: ( primitive_value | reference | set_value )
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


          # at line 542:4: primitive_value
          @state.following.push( TOKENS_FOLLOWING_primitive_value_IN_value_1607 )
          primitive_value263 = primitive_value
          @state.following.pop
          @adaptor.add_child( root_0, primitive_value263.tree )
          # --> action
          	return_value.val = ( primitive_value263.nil? ? nil : primitive_value263.val )	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 544:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_value_1616 )
          reference264 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference264.tree )
          # --> action
          	return_value.val = ( reference264.nil? ? nil : reference264.val )	
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 546:4: set_value
          @state.following.push( TOKENS_FOLLOWING_set_value_IN_value_1625 )
          set_value265 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value265.tree )
          # --> action
          	return_value.val = ( set_value265.nil? ? nil : set_value265.val )	
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
        # trace_out( __method__, 40 )

      end
      
      return return_value
    end

    PrimitiveValueReturnValue = define_return_scope :val

    # 
    # parser rule primitive_value
    # 
    # (in SFP.g)
    # 550:1: primitive_value returns [val] : ( BOOLEAN | NUMBER | STRING | MULTILINE_STRING );
    # 
    def primitive_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )
      return_value = PrimitiveValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __BOOLEAN266__ = nil
      __NUMBER267__ = nil
      __STRING268__ = nil
      __MULTILINE_STRING269__ = nil

      tree_for_BOOLEAN266 = nil
      tree_for_NUMBER267 = nil
      tree_for_STRING268 = nil
      tree_for_MULTILINE_STRING269 = nil

      begin
        # at line 551:2: ( BOOLEAN | NUMBER | STRING | MULTILINE_STRING )
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


          # at line 551:4: BOOLEAN
          __BOOLEAN266__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_1644 )

          tree_for_BOOLEAN266 = @adaptor.create_with_payload( __BOOLEAN266__ )
          @adaptor.add_child( root_0, tree_for_BOOLEAN266 )

          # --> action

          			if __BOOLEAN266__.text == 'true' or __BOOLEAN266__.text == 'on' or __BOOLEAN266__.text == 'yes'
          				return_value.val = true
          			else  # 'false', 'no', 'off'
          				return_value.val = false
          			end
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 559:4: NUMBER
          __NUMBER267__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_primitive_value_1653 )

          tree_for_NUMBER267 = @adaptor.create_with_payload( __NUMBER267__ )
          @adaptor.add_child( root_0, tree_for_NUMBER267 )

          # --> action
          	return_value.val = __NUMBER267__.text.to_f	
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 561:4: STRING
          __STRING268__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_primitive_value_1662 )

          tree_for_STRING268 = @adaptor.create_with_payload( __STRING268__ )
          @adaptor.add_child( root_0, tree_for_STRING268 )

          # --> action
          	return_value.val = __STRING268__.text[1,__STRING268__.text.length-2]	
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 563:4: MULTILINE_STRING
          __MULTILINE_STRING269__ = match( MULTILINE_STRING, TOKENS_FOLLOWING_MULTILINE_STRING_IN_primitive_value_1671 )

          tree_for_MULTILINE_STRING269 = @adaptor.create_with_payload( __MULTILINE_STRING269__ )
          @adaptor.add_child( root_0, tree_for_MULTILINE_STRING269 )

          # --> action
          	return_value.val = __MULTILINE_STRING269__.text[2, __MULTILINE_STRING269__.text.length-2]	
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
        # trace_out( __method__, 41 )

      end
      
      return return_value
    end

    PathReturnValue = define_return_scope 

    # 
    # parser rule path
    # 
    # (in SFP.g)
    # 567:1: path : ID ( '.' ID )* ;
    # 
    def path
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )
      return_value = PathReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID270__ = nil
      char_literal271 = nil
      __ID272__ = nil

      tree_for_ID270 = nil
      tree_for_char_literal271 = nil
      tree_for_ID272 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 568:4: ID ( '.' ID )*
        __ID270__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_1686 )

        tree_for_ID270 = @adaptor.create_with_payload( __ID270__ )
        @adaptor.add_child( root_0, tree_for_ID270 )

        # at line 568:6: ( '.' ID )*
        while true # decision 92
          alt_92 = 2
          look_92_0 = @input.peek( 1 )

          if ( look_92_0 == T__50 )
            alt_92 = 1

          end
          case alt_92
          when 1
            # at line 568:7: '.' ID
            char_literal271 = match( T__50, TOKENS_FOLLOWING_T__50_IN_path_1688 )

            tree_for_char_literal271 = @adaptor.create_with_payload( char_literal271 )
            @adaptor.add_child( root_0, tree_for_char_literal271 )

            __ID272__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_1689 )

            tree_for_ID272 = @adaptor.create_with_payload( __ID272__ )
            @adaptor.add_child( root_0, tree_for_ID272 )


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
        # trace_out( __method__, 42 )

      end
      
      return return_value
    end

    ReferenceReturnValue = define_return_scope :val

    # 
    # parser rule reference
    # 
    # (in SFP.g)
    # 571:1: reference returns [val] : path ;
    # 
    def reference
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )
      return_value = ReferenceReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      path273 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 572:4: path
        @state.following.push( TOKENS_FOLLOWING_path_IN_reference_1706 )
        path273 = path
        @state.following.pop
        @adaptor.add_child( root_0, path273.tree )
        # --> action
        	return_value.val = self.to_ref(( path273 && @input.to_s( path273.start, path273.stop ) ))	
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
        # trace_out( __method__, 43 )

      end
      
      return return_value
    end

    ReferenceTypeReturnValue = define_return_scope :val

    # 
    # parser rule reference_type
    # 
    # (in SFP.g)
    # 576:1: reference_type returns [val] : 'isref' path ;
    # 
    def reference_type
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )
      return_value = ReferenceTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal274 = nil
      path275 = nil

      tree_for_string_literal274 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 577:4: 'isref' path
        string_literal274 = match( T__51, TOKENS_FOLLOWING_T__51_IN_reference_type_1725 )

        tree_for_string_literal274 = @adaptor.create_with_payload( string_literal274 )
        @adaptor.add_child( root_0, tree_for_string_literal274 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_reference_type_1727 )
        path275 = path
        @state.following.pop
        @adaptor.add_child( root_0, path275.tree )
        # --> action

        			return_value.val = { '_context' => 'null',
        				'_isa' => self.to_ref(( path275 && @input.to_s( path275.start, path275.stop ) ))
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
        # trace_out( __method__, 44 )

      end
      
      return return_value
    end

    EqualsOpReturnValue = define_return_scope 

    # 
    # parser rule equals_op
    # 
    # (in SFP.g)
    # 585:1: equals_op : ( '=' | 'is' );
    # 
    def equals_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )
      return_value = EqualsOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set276 = nil

      tree_for_set276 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set276 = @input.look
        if @input.peek(1) == T__41 || @input.peek(1) == T__52
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set276 ) )
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

    NotEqualsOpReturnValue = define_return_scope 

    # 
    # parser rule not_equals_op
    # 
    # (in SFP.g)
    # 590:1: not_equals_op : ( '!=' | 'isnt' );
    # 
    def not_equals_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )
      return_value = NotEqualsOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set277 = nil

      tree_for_set277 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set277 = @input.look
        if @input.peek(1) == T__43 || @input.peek(1) == T__53
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set277 ) )
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

    BinaryOpReturnValue = define_return_scope 

    # 
    # parser rule binary_op
    # 
    # (in SFP.g)
    # 595:1: binary_op : ( '+=' | '-=' | '*=' | '/=' );
    # 
    def binary_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 47 )
      return_value = BinaryOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set278 = nil

      tree_for_set278 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set278 = @input.look
        if @input.peek( 1 ).between?( T__54, T__57 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set278 ) )
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
        # trace_out( __method__, 47 )

      end
      
      return return_value
    end

    BinaryCompReturnValue = define_return_scope 

    # 
    # parser rule binary_comp
    # 
    # (in SFP.g)
    # 602:1: binary_comp : ( '>' | '>=' | '<' | '<=' );
    # 
    def binary_comp
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 48 )
      return_value = BinaryCompReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set279 = nil

      tree_for_set279 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set279 = @input.look
        if @input.peek( 1 ).between?( T__58, T__61 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set279 ) )
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
        # trace_out( __method__, 48 )

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
          ()* loopback of 157:3: ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )*
        __dfa_description__
      end
    end
    class DFA65 < ANTLR3::DFA
      EOT = unpack( 7, -1 )
      EOF = unpack( 7, -1 )
      MIN = unpack( 1, 6, 1, 4, 2, -1, 1, 6, 1, -1, 1, 4 )
      MAX = unpack( 1, 45, 1, 61, 2, -1, 1, 6, 1, -1, 1, 61 )
      ACCEPT = unpack( 2, -1, 1, 1, 1, 3, 1, -1, 1, 2, 1, -1 )
      SPECIAL = unpack( 7, -1 )
      TRANSITION = [
        unpack( 1, 1, 19, -1, 1, 2, 12, -1, 1, 3, 5, -1, 1, 2 ),
        unpack( 1, 5, 15, -1, 1, 5, 20, -1, 4, 2, 5, -1, 1, 4, 1, -1, 2, 
                 2, 4, -1, 4, 2 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 6 ),
        unpack(  ),
        unpack( 1, 5, 15, -1, 1, 5, 20, -1, 4, 2, 5, -1, 1, 4, 1, -1, 2, 
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
          299:4: ( constraint_statement | constraint_namespace | constraint_iterator )
        __dfa_description__
      end
    end
    class DFA77 < ANTLR3::DFA
      EOT = unpack( 17, -1 )
      EOF = unpack( 17, -1 )
      MIN = unpack( 1, 6, 1, 41, 2, -1, 1, 6, 3, 5, 1, -1, 1, 5, 2, -1, 
                    1, 41, 4, -1 )
      MAX = unpack( 1, 45, 1, 61, 2, -1, 1, 6, 2, 42, 1, 34, 1, -1, 1, 34, 
                    2, -1, 1, 61, 4, -1 )
      ACCEPT = unpack( 2, -1, 1, 5, 1, 9, 4, -1, 1, 6, 1, -1, 1, 7, 1, 8, 
                       1, -1, 1, 1, 1, 2, 1, 3, 1, 4 )
      SPECIAL = unpack( 17, -1 )
      TRANSITION = [
        unpack( 1, 1, 19, -1, 1, 2, 18, -1, 1, 3 ),
        unpack( 1, 5, 1, 8, 1, 6, 1, 10, 5, -1, 1, 4, 1, -1, 1, 7, 1, 9, 
                 4, -1, 4, 11 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 12 ),
        unpack( 2, 13, 1, 14, 3, 13, 23, -1, 1, 13, 7, -1, 1, 8 ),
        unpack( 2, 15, 1, 16, 3, 15, 23, -1, 1, 15, 7, -1, 1, 10 ),
        unpack( 2, 13, 1, 14, 3, 13, 23, -1, 1, 13 ),
        unpack(  ),
        unpack( 2, 15, 1, 16, 3, 15, 23, -1, 1, 15 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 5, 1, 8, 1, 6, 1, 10, 5, -1, 1, 4, 1, -1, 1, 7, 1, 9, 
                 4, -1, 4, 11 ),
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
          338:1: constraint_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | conditional_constraint | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | reference binary_comp comp_value | total_constraint );
        __dfa_description__
      end
    end
    class DFA88 < ANTLR3::DFA
      EOT = unpack( 13, -1 )
      EOF = unpack( 13, -1 )
      MIN = unpack( 1, 6, 1, 41, 1, -1, 1, 6, 1, 5, 1, -1, 1, 5, 2, -1, 
                    1, 41, 3, -1 )
      MAX = unpack( 1, 47, 1, 57, 1, -1, 1, 6, 1, 46, 1, -1, 1, 34, 2, -1, 
                    1, 57, 3, -1 )
      ACCEPT = unpack( 2, -1, 1, 5, 2, -1, 1, 3, 1, -1, 1, 6, 1, 7, 1, -1, 
                       1, 4, 1, 1, 1, 2 )
      SPECIAL = unpack( 13, -1 )
      TRANSITION = [
        unpack( 1, 1, 40, -1, 1, 2 ),
        unpack( 1, 4, 6, -1, 1, 7, 1, 8, 1, 3, 1, -1, 1, 6, 1, -1, 4, 5 ),
        unpack(  ),
        unpack( 1, 9 ),
        unpack( 2, 11, 1, 12, 3, 11, 23, -1, 1, 11, 11, -1, 1, 10 ),
        unpack(  ),
        unpack( 2, 11, 1, 12, 3, 11, 23, -1, 1, 11 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 4, 6, -1, 1, 7, 1, 8, 1, 3, 1, -1, 1, 6, 1, -1, 4, 5 ),
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
          459:1: mutation_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' );
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
    TOKENS_FOLLOWING_ID_IN_attribute_304 = Set[ 41, 52 ]
    TOKENS_FOLLOWING_equals_op_IN_attribute_306 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_attribute_308 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_310 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_attribute_320 = Set[ 51 ]
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
    TOKENS_FOLLOWING_ID_IN_object_attribute_424 = Set[ 41, 52 ]
    TOKENS_FOLLOWING_equals_op_IN_object_attribute_426 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_object_attribute_428 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_object_attribute_430 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__26_IN_state_dependency_446 = Set[ 6 ]
    TOKENS_FOLLOWING_dep_effect_IN_state_dependency_450 = Set[ 4, 27 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_452 = Set[ 4, 27 ]
    TOKENS_FOLLOWING_T__27_IN_state_dependency_455 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_457 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_dependency_460 = Set[ 4, 6, 21, 26, 39, 45 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_464 = Set[ 4, 6, 21, 26, 39, 45 ]
    TOKENS_FOLLOWING_constraint_body_IN_state_dependency_467 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_dependency_472 = Set[ 4, 28 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_478 = Set[ 4, 28 ]
    TOKENS_FOLLOWING_T__28_IN_state_dependency_481 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_483 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_dependency_486 = Set[ 4, 6, 21, 26, 39, 45 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_490 = Set[ 4, 6, 21, 26, 39, 45 ]
    TOKENS_FOLLOWING_constraint_body_IN_state_dependency_493 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_dependency_497 = Set[ 4, 28 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_503 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_reference_IN_dep_effect_515 = Set[ 41, 52 ]
    TOKENS_FOLLOWING_equals_op_IN_dep_effect_517 = Set[ 5, 6, 7, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_dep_effect_524 = Set[ 1 ]
    TOKENS_FOLLOWING_NULL_IN_dep_effect_530 = Set[ 1 ]
    TOKENS_FOLLOWING_T__29_IN_operator_546 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_operator_548 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_operator_550 = Set[ 4, 30, 31, 32 ]
    TOKENS_FOLLOWING_NL_IN_operator_552 = Set[ 4, 30, 31, 32 ]
    TOKENS_FOLLOWING_T__30_IN_operator_563 = Set[ 41, 52 ]
    TOKENS_FOLLOWING_equals_op_IN_operator_565 = Set[ 8 ]
    TOKENS_FOLLOWING_NUMBER_IN_operator_567 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_operator_569 = Set[ 4, 30, 31, 32 ]
    TOKENS_FOLLOWING_op_conditions_IN_operator_588 = Set[ 4, 30, 31, 32 ]
    TOKENS_FOLLOWING_op_effects_IN_operator_591 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_operator_595 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_operator_597 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_op_param_613 = Set[ 41, 52 ]
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
    TOKENS_FOLLOWING_reference_IN_op_statement_707 = Set[ 41, 52 ]
    TOKENS_FOLLOWING_equals_op_IN_op_statement_709 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_op_statement_711 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_statement_713 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__33_IN_procedure_729 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_procedure_731 = Set[ 20, 34 ]
    TOKENS_FOLLOWING_parameters_IN_procedure_739 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_procedure_742 = Set[ 4, 30, 31, 32 ]
    TOKENS_FOLLOWING_NL_IN_procedure_744 = Set[ 4, 30, 31, 32 ]
    TOKENS_FOLLOWING_T__30_IN_procedure_752 = Set[ 41, 52 ]
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
    TOKENS_FOLLOWING_ID_IN_parameter_822 = Set[ 51 ]
    TOKENS_FOLLOWING_reference_type_IN_parameter_824 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_833 = Set[ 37 ]
    TOKENS_FOLLOWING_T__37_IN_parameter_835 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_parameter_837 = Set[ 1 ]
    TOKENS_FOLLOWING_T__31_IN_conditions_852 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_conditions_860 = Set[ 4, 6, 21, 26, 39, 45 ]
    TOKENS_FOLLOWING_NL_IN_conditions_862 = Set[ 4, 6, 21, 26, 39, 45 ]
    TOKENS_FOLLOWING_constraint_body_IN_conditions_865 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_conditions_867 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_conditions_869 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__32_IN_effects_886 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_effects_894 = Set[ 4, 6, 21, 39, 47 ]
    TOKENS_FOLLOWING_NL_IN_effects_896 = Set[ 4, 6, 21, 39, 47 ]
    TOKENS_FOLLOWING_mutation_body_IN_effects_902 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_effects_907 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_effects_909 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_constraint_925 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_constraint_927 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_935 = Set[ 4, 6, 21, 26, 39, 45 ]
    TOKENS_FOLLOWING_NL_IN_constraint_937 = Set[ 4, 6, 21, 26, 39, 45 ]
    TOKENS_FOLLOWING_constraint_body_IN_constraint_940 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_942 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_944 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_967 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_namespace_IN_constraint_body_980 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_iterator_IN_constraint_body_987 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_body_996 = Set[ 1, 4, 6, 26, 39, 45 ]
    TOKENS_FOLLOWING_path_IN_constraint_namespace_1010 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1012 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_namespace_1015 = Set[ 4, 6, 21, 26, 45 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1017 = Set[ 4, 6, 21, 26, 45 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_namespace_1021 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1029 = Set[ 4, 6, 21, 26, 45 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_namespace_1034 = Set[ 1 ]
    TOKENS_FOLLOWING_T__39_IN_constraint_iterator_1045 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_constraint_iterator_1047 = Set[ 40 ]
    TOKENS_FOLLOWING_T__40_IN_constraint_iterator_1049 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_constraint_iterator_1051 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1053 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_iterator_1056 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1058 = Set[ 4, 6, 21, 26, 45 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_iterator_1068 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1076 = Set[ 4, 6, 21, 26, 45 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_iterator_1083 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1102 = Set[ 41, 52 ]
    TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1104 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_1106 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1115 = Set[ 41, 52 ]
    TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1117 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_1119 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1128 = Set[ 43, 53 ]
    TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1130 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_1132 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1141 = Set[ 43, 53 ]
    TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1143 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_1145 = Set[ 1 ]
    TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_1154 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1163 = Set[ 41, 42 ]
    TOKENS_FOLLOWING_T__41_IN_constraint_statement_1165 = Set[ 42 ]
    TOKENS_FOLLOWING_T__42_IN_constraint_statement_1168 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_1170 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1179 = Set[ 43, 44 ]
    TOKENS_FOLLOWING_set_IN_constraint_statement_1181 = Set[ 42 ]
    TOKENS_FOLLOWING_T__42_IN_constraint_statement_1187 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_1189 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1198 = Set[ 58, 59, 60, 61 ]
    TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_1200 = Set[ 6, 8 ]
    TOKENS_FOLLOWING_comp_value_IN_constraint_statement_1202 = Set[ 1 ]
    TOKENS_FOLLOWING_total_constraint_IN_constraint_statement_1211 = Set[ 1 ]
    TOKENS_FOLLOWING_T__45_IN_total_constraint_1222 = Set[ 6 ]
    TOKENS_FOLLOWING_total_statement_IN_total_constraint_1224 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_total_constraint_1226 = Set[ 58, 59, 60, 61 ]
    TOKENS_FOLLOWING_binary_comp_IN_total_constraint_1228 = Set[ 8 ]
    TOKENS_FOLLOWING_NUMBER_IN_total_constraint_1230 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_total_statement_1241 = Set[ 41, 52 ]
    TOKENS_FOLLOWING_equals_op_IN_total_statement_1243 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_total_statement_1245 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_comp_value_1260 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_comp_value_1269 = Set[ 1 ]
    TOKENS_FOLLOWING_T__26_IN_conditional_constraint_1288 = Set[ 6, 26, 45 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_1296 = Set[ 4, 27 ]
    TOKENS_FOLLOWING_NL_IN_conditional_constraint_1298 = Set[ 4, 27 ]
    TOKENS_FOLLOWING_conditional_constraint_then_IN_conditional_constraint_1307 = Set[ 1 ]
    TOKENS_FOLLOWING_T__27_IN_conditional_constraint_then_1322 = Set[ 6, 26, 45 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_1324 = Set[ 1 ]
    TOKENS_FOLLOWING_mutation_statement_IN_mutation_body_1346 = Set[ 4 ]
    TOKENS_FOLLOWING_mutation_iterator_IN_mutation_body_1359 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_body_1368 = Set[ 1, 4, 6, 39, 47 ]
    TOKENS_FOLLOWING_T__39_IN_mutation_iterator_1383 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_iterator_1385 = Set[ 40 ]
    TOKENS_FOLLOWING_T__40_IN_mutation_iterator_1387 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_mutation_iterator_1389 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_1391 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_mutation_iterator_1394 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_1396 = Set[ 4, 6, 21, 47 ]
    TOKENS_FOLLOWING_mutation_statement_IN_mutation_iterator_1406 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_1414 = Set[ 4, 6, 21, 47 ]
    TOKENS_FOLLOWING_T__21_IN_mutation_iterator_1421 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1440 = Set[ 41, 52 ]
    TOKENS_FOLLOWING_equals_op_IN_mutation_statement_1442 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_1444 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1453 = Set[ 41, 52 ]
    TOKENS_FOLLOWING_equals_op_IN_mutation_statement_1455 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_mutation_statement_1457 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1466 = Set[ 54, 55, 56, 57 ]
    TOKENS_FOLLOWING_binary_op_IN_mutation_statement_1468 = Set[ 8 ]
    TOKENS_FOLLOWING_NUMBER_IN_mutation_statement_1470 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1479 = Set[ 41 ]
    TOKENS_FOLLOWING_T__41_IN_mutation_statement_1481 = Set[ 46 ]
    TOKENS_FOLLOWING_T__46_IN_mutation_statement_1483 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_statement_1485 = Set[ 1, 20 ]
    TOKENS_FOLLOWING_object_body_IN_mutation_statement_1493 = Set[ 1 ]
    TOKENS_FOLLOWING_T__47_IN_mutation_statement_1503 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_statement_1505 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1514 = Set[ 48 ]
    TOKENS_FOLLOWING_T__48_IN_mutation_statement_1516 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_1518 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_mutation_statement_1520 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1529 = Set[ 49 ]
    TOKENS_FOLLOWING_T__49_IN_mutation_statement_1531 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_1533 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_mutation_statement_1535 = Set[ 1 ]
    TOKENS_FOLLOWING_T__34_IN_set_value_1554 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_1562 = Set[ 35, 36 ]
    TOKENS_FOLLOWING_T__35_IN_set_value_1565 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_1567 = Set[ 35, 36 ]
    TOKENS_FOLLOWING_T__36_IN_set_value_1577 = Set[ 1 ]
    TOKENS_FOLLOWING_value_IN_set_item_1588 = Set[ 1 ]
    TOKENS_FOLLOWING_primitive_value_IN_value_1607 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_value_1616 = Set[ 1 ]
    TOKENS_FOLLOWING_set_value_IN_value_1625 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_1644 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_primitive_value_1653 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_primitive_value_1662 = Set[ 1 ]
    TOKENS_FOLLOWING_MULTILINE_STRING_IN_primitive_value_1671 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_path_1686 = Set[ 1, 50 ]
    TOKENS_FOLLOWING_T__50_IN_path_1688 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_path_1689 = Set[ 1, 50 ]
    TOKENS_FOLLOWING_path_IN_reference_1706 = Set[ 1 ]
    TOKENS_FOLLOWING_T__51_IN_reference_type_1725 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_reference_type_1727 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_not_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_comp_0 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end

