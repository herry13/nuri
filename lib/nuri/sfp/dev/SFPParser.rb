#!/usr/bin/env ruby
#
# SFP.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: SFP.g
# Generated at: 2012-10-07 20:56:02
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
    define_tokens( :T__68 => 68, :T__69 => 69, :T__66 => 66, :EXPONENT => 11, 
                   :T__67 => 67, :T__64 => 64, :T__29 => 29, :T__65 => 65, 
                   :T__28 => 28, :T__62 => 62, :T__27 => 27, :T__63 => 63, 
                   :T__26 => 26, :T__25 => 25, :T__24 => 24, :T__23 => 23, 
                   :T__22 => 22, :T__21 => 21, :T__20 => 20, :OCTAL_ESC => 17, 
                   :ID => 6, :T__61 => 61, :T__60 => 60, :EOF => -1, :T__55 => 55, 
                   :T__19 => 19, :T__56 => 56, :T__57 => 57, :T__58 => 58, 
                   :ESC_SEQ => 14, :BOOLEAN => 9, :T__51 => 51, :T__52 => 52, 
                   :T__18 => 18, :T__53 => 53, :T__54 => 54, :T__59 => 59, 
                   :NL => 4, :COMMENT => 12, :T__50 => 50, :T__42 => 42, 
                   :T__43 => 43, :T__40 => 40, :T__41 => 41, :T__46 => 46, 
                   :T__47 => 47, :T__44 => 44, :T__45 => 45, :T__48 => 48, 
                   :T__49 => 49, :UNICODE_ESC => 16, :NULL => 8, :NUMBER => 7, 
                   :HEX_DIGIT => 15, :MULTILINE_STRING => 10, :T__30 => 30, 
                   :T__31 => 31, :T__32 => 32, :WS => 13, :T__71 => 71, 
                   :T__33 => 33, :T__72 => 72, :T__34 => 34, :T__35 => 35, 
                   :T__70 => 70, :T__36 => 36, :T__37 => 37, :T__38 => 38, 
                   :T__39 => 39, :T__73 => 73, :STRING => 5 )

    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "NL", "STRING", "ID", "NUMBER", "NULL", "BOOLEAN", "MULTILINE_STRING", 
                    "EXPONENT", "COMMENT", "WS", "ESC_SEQ", "HEX_DIGIT", 
                    "UNICODE_ESC", "OCTAL_ESC", "'include'", "'state'", 
                    "'{'", "'}'", "'composite'", "'class'", "'extends'", 
                    "'isa'", "'['", "']'", "'if'", "'then'", "'or'", "'operator'", 
                    "'cost'", "'conditions'", "'effects'", "'procedure'", 
                    "'('", "','", "')'", "'areall'", "'goal'", "'constraint'", 
                    "'always'", "'sometime'", "'within'", "'after'", "'before'", 
                    "'foreach'", "'as'", "'forall'", "'exist'", "'forsome'", 
                    "'='", "':different'", "'is'", "'in'", "'isnt'", "'not'", 
                    "'total('", "'new'", "'delete'", "'add('", "'remove('", 
                    "'.'", "'isref'", "'!='", "'+='", "'-='", "'*='", "'/='", 
                    "'>'", "'>='", "'<'", "'<='" )
    
  end


  class Parser < ANTLR3::Parser
    @grammar_home = SFP
    include ANTLR3::ASTBuilder

    RULE_METHODS = [ :sfp, :include, :include_file, :header, :state, :composite, 
                     :class_definition, :extends_class, :attribute, :object_def, 
                     :object_body, :object_attribute, :state_dependency, 
                     :dep_effect, :operator, :op_param, :op_conditions, 
                     :op_effects, :op_statement, :procedure, :parameters, 
                     :parameter, :conditions, :effects, :goal_constraint, 
                     :goal_body, :nested_constraint, :constraint, :constraint_body, 
                     :constraint_namespace, :constraint_iterator, :quantification_keyword, 
                     :constraint_class_quantification, :constraint_different, 
                     :constraint_statement, :total_constraint, :total_statement, 
                     :comp_value, :conditional_constraint, :conditional_constraint_then, 
                     :mutation_body, :mutation_iterator, :mutation_statement, 
                     :set_value, :set_item, :value, :primitive_value, :path, 
                     :path_with_index, :id_ref, :reference, :reference_type, 
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
    # 40:1: sfp : ( NL )* ( include )* ( header )* ( state | composite | constraint | goal_constraint )* ;
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
      goal_constraint7 = nil

      tree_for_NL1 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 41:4: ( NL )* ( include )* ( header )* ( state | composite | constraint | goal_constraint )*
        # --> action
        	self.init	
        # <-- action
        # at line 42:3: ( NL )*
        while true # decision 1
          alt_1 = 2
          look_1_0 = @input.peek( 1 )

          if ( look_1_0 == NL )
            alt_1 = 1

          end
          case alt_1
          when 1
            # at line 42:3: NL
            __NL1__ = match( NL, TOKENS_FOLLOWING_NL_IN_sfp_49 )

            tree_for_NL1 = @adaptor.create_with_payload( __NL1__ )
            @adaptor.add_child( root_0, tree_for_NL1 )


          else
            break # out of loop for decision 1
          end
        end # loop for decision 1
        # at line 42:7: ( include )*
        while true # decision 2
          alt_2 = 2
          look_2_0 = @input.peek( 1 )

          if ( look_2_0 == T__18 )
            alt_2 = 1

          end
          case alt_2
          when 1
            # at line 42:7: include
            @state.following.push( TOKENS_FOLLOWING_include_IN_sfp_52 )
            include2 = include
            @state.following.pop
            @adaptor.add_child( root_0, include2.tree )

          else
            break # out of loop for decision 2
          end
        end # loop for decision 2
        # at line 42:16: ( header )*
        while true # decision 3
          alt_3 = 2
          look_3_0 = @input.peek( 1 )

          if ( look_3_0 == T__23 || look_3_0 == T__35 )
            alt_3 = 1

          end
          case alt_3
          when 1
            # at line 42:16: header
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
        # at line 44:3: ( state | composite | constraint | goal_constraint )*
        while true # decision 4
          alt_4 = 5
          case look_4 = @input.peek( 1 )
          when ID then look_4_2 = @input.peek( 2 )

          if ( look_4_2 == T__41 )
            alt_4 = 3
          elsif ( look_4_2.between?( T__19, T__20 ) )
            alt_4 = 1

          end
          when T__22 then alt_4 = 2
          when T__40 then alt_4 = 4
          end
          case alt_4
          when 1
            # at line 44:4: state
            @state.following.push( TOKENS_FOLLOWING_state_IN_sfp_65 )
            state4 = state
            @state.following.pop
            @adaptor.add_child( root_0, state4.tree )

          when 2
            # at line 44:12: composite
            @state.following.push( TOKENS_FOLLOWING_composite_IN_sfp_69 )
            composite5 = composite
            @state.following.pop
            @adaptor.add_child( root_0, composite5.tree )

          when 3
            # at line 44:24: constraint
            @state.following.push( TOKENS_FOLLOWING_constraint_IN_sfp_73 )
            constraint6 = constraint
            @state.following.pop
            @adaptor.add_child( root_0, constraint6.tree )

          when 4
            # at line 44:37: goal_constraint
            @state.following.push( TOKENS_FOLLOWING_goal_constraint_IN_sfp_77 )
            goal_constraint7 = goal_constraint
            @state.following.pop
            @adaptor.add_child( root_0, goal_constraint7.tree )

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
    # 47:1: include : 'include' include_file ( NL )+ ;
    # 
    def include
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )
      return_value = IncludeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal8 = nil
      __NL10__ = nil
      include_file9 = nil

      tree_for_string_literal8 = nil
      tree_for_NL10 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 48:4: 'include' include_file ( NL )+
        string_literal8 = match( T__18, TOKENS_FOLLOWING_T__18_IN_include_90 )

        tree_for_string_literal8 = @adaptor.create_with_payload( string_literal8 )
        @adaptor.add_child( root_0, tree_for_string_literal8 )

        @state.following.push( TOKENS_FOLLOWING_include_file_IN_include_92 )
        include_file9 = include_file
        @state.following.pop
        @adaptor.add_child( root_0, include_file9.tree )
        # at file 48:27: ( NL )+
        match_count_5 = 0
        while true
          alt_5 = 2
          look_5_0 = @input.peek( 1 )

          if ( look_5_0 == NL )
            alt_5 = 1

          end
          case alt_5
          when 1
            # at line 48:27: NL
            __NL10__ = match( NL, TOKENS_FOLLOWING_NL_IN_include_94 )

            tree_for_NL10 = @adaptor.create_with_payload( __NL10__ )
            @adaptor.add_child( root_0, tree_for_NL10 )


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
    # 51:1: include_file : STRING ;
    # 
    def include_file
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )
      return_value = IncludeFileReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __STRING11__ = nil

      tree_for_STRING11 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 52:4: STRING
        __STRING11__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_include_file_106 )

        tree_for_STRING11 = @adaptor.create_with_payload( __STRING11__ )
        @adaptor.add_child( root_0, tree_for_STRING11 )

        # --> action
         self.process_file(__STRING11__.text[1,__STRING11__.text.length-2]) 
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
    # 56:1: header : ( class_definition | procedure );
    # 
    def header
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )
      return_value = HeaderReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      class_definition12 = nil
      procedure13 = nil


      begin
        # at line 57:2: ( class_definition | procedure )
        alt_6 = 2
        look_6_0 = @input.peek( 1 )

        if ( look_6_0 == T__23 )
          alt_6 = 1
        elsif ( look_6_0 == T__35 )
          alt_6 = 2
        else
          raise NoViableAlternative( "", 6, 0 )
        end
        case alt_6
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 57:4: class_definition
          @state.following.push( TOKENS_FOLLOWING_class_definition_IN_header_122 )
          class_definition12 = class_definition
          @state.following.pop
          @adaptor.add_child( root_0, class_definition12.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 58:4: procedure
          @state.following.push( TOKENS_FOLLOWING_procedure_IN_header_127 )
          procedure13 = procedure
          @state.following.pop
          @adaptor.add_child( root_0, procedure13.tree )

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
    # 61:1: state : ID ( 'state' )? '{' ( NL )* ( attribute )* '}' ( NL )* ;
    # 
    def state
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )
      return_value = StateReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID14__ = nil
      string_literal15 = nil
      char_literal16 = nil
      __NL17__ = nil
      char_literal19 = nil
      __NL20__ = nil
      attribute18 = nil

      tree_for_ID14 = nil
      tree_for_string_literal15 = nil
      tree_for_char_literal16 = nil
      tree_for_NL17 = nil
      tree_for_char_literal19 = nil
      tree_for_NL20 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 62:4: ID ( 'state' )? '{' ( NL )* ( attribute )* '}' ( NL )*
        __ID14__ = match( ID, TOKENS_FOLLOWING_ID_IN_state_138 )

        tree_for_ID14 = @adaptor.create_with_payload( __ID14__ )
        @adaptor.add_child( root_0, tree_for_ID14 )

        # at line 62:7: ( 'state' )?
        alt_7 = 2
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == T__19 )
          alt_7 = 1
        end
        case alt_7
        when 1
          # at line 62:8: 'state'
          string_literal15 = match( T__19, TOKENS_FOLLOWING_T__19_IN_state_141 )

          tree_for_string_literal15 = @adaptor.create_with_payload( string_literal15 )
          @adaptor.add_child( root_0, tree_for_string_literal15 )


        end
        # --> action

        			@now[__ID14__.text] = { '_self' => __ID14__.text,
        				'_context' => 'state',
        				'_parent' => @now
        			}
        			@now = @now[__ID14__.text]
        		
        # <-- action
        char_literal16 = match( T__20, TOKENS_FOLLOWING_T__20_IN_state_151 )

        tree_for_char_literal16 = @adaptor.create_with_payload( char_literal16 )
        @adaptor.add_child( root_0, tree_for_char_literal16 )

        # at line 70:7: ( NL )*
        while true # decision 8
          alt_8 = 2
          look_8_0 = @input.peek( 1 )

          if ( look_8_0 == NL )
            alt_8 = 1

          end
          case alt_8
          when 1
            # at line 70:7: NL
            __NL17__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_153 )

            tree_for_NL17 = @adaptor.create_with_payload( __NL17__ )
            @adaptor.add_child( root_0, tree_for_NL17 )


          else
            break # out of loop for decision 8
          end
        end # loop for decision 8
        # at line 71:3: ( attribute )*
        while true # decision 9
          alt_9 = 2
          look_9_0 = @input.peek( 1 )

          if ( look_9_0 == ID )
            alt_9 = 1

          end
          case alt_9
          when 1
            # at line 71:3: attribute
            @state.following.push( TOKENS_FOLLOWING_attribute_IN_state_158 )
            attribute18 = attribute
            @state.following.pop
            @adaptor.add_child( root_0, attribute18.tree )

          else
            break # out of loop for decision 9
          end
        end # loop for decision 9
        char_literal19 = match( T__21, TOKENS_FOLLOWING_T__21_IN_state_163 )

        tree_for_char_literal19 = @adaptor.create_with_payload( char_literal19 )
        @adaptor.add_child( root_0, tree_for_char_literal19 )

        # at line 72:7: ( NL )*
        while true # decision 10
          alt_10 = 2
          look_10_0 = @input.peek( 1 )

          if ( look_10_0 == NL )
            alt_10 = 1

          end
          case alt_10
          when 1
            # at line 72:7: NL
            __NL20__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_165 )

            tree_for_NL20 = @adaptor.create_with_payload( __NL20__ )
            @adaptor.add_child( root_0, tree_for_NL20 )


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
    # 76:1: composite : 'composite' ID '{' ( NL )* ( attribute | constraint )* '}' ( NL )* ;
    # 
    def composite
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )
      return_value = CompositeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal21 = nil
      __ID22__ = nil
      char_literal23 = nil
      __NL24__ = nil
      char_literal27 = nil
      __NL28__ = nil
      attribute25 = nil
      constraint26 = nil

      tree_for_string_literal21 = nil
      tree_for_ID22 = nil
      tree_for_char_literal23 = nil
      tree_for_NL24 = nil
      tree_for_char_literal27 = nil
      tree_for_NL28 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 77:4: 'composite' ID '{' ( NL )* ( attribute | constraint )* '}' ( NL )*
        string_literal21 = match( T__22, TOKENS_FOLLOWING_T__22_IN_composite_181 )

        tree_for_string_literal21 = @adaptor.create_with_payload( string_literal21 )
        @adaptor.add_child( root_0, tree_for_string_literal21 )

        __ID22__ = match( ID, TOKENS_FOLLOWING_ID_IN_composite_183 )

        tree_for_ID22 = @adaptor.create_with_payload( __ID22__ )
        @adaptor.add_child( root_0, tree_for_ID22 )

        # --> action

        			@now[__ID22__.text] = { '_self' => __ID22__.text,
        				'_context' => 'composite',
        				'_parent' => @now
        			}
        			@now = @now[__ID22__.text]
        		
        # <-- action
        char_literal23 = match( T__20, TOKENS_FOLLOWING_T__20_IN_composite_191 )

        tree_for_char_literal23 = @adaptor.create_with_payload( char_literal23 )
        @adaptor.add_child( root_0, tree_for_char_literal23 )

        # at line 85:7: ( NL )*
        while true # decision 11
          alt_11 = 2
          look_11_0 = @input.peek( 1 )

          if ( look_11_0 == NL )
            alt_11 = 1

          end
          case alt_11
          when 1
            # at line 85:7: NL
            __NL24__ = match( NL, TOKENS_FOLLOWING_NL_IN_composite_193 )

            tree_for_NL24 = @adaptor.create_with_payload( __NL24__ )
            @adaptor.add_child( root_0, tree_for_NL24 )


          else
            break # out of loop for decision 11
          end
        end # loop for decision 11
        # at line 85:11: ( attribute | constraint )*
        while true # decision 12
          alt_12 = 3
          look_12_0 = @input.peek( 1 )

          if ( look_12_0 == ID )
            look_12_2 = @input.peek( 2 )

            if ( look_12_2 == T__41 )
              alt_12 = 2
            elsif ( look_12_2 == NL || look_12_2 == T__20 || look_12_2 == T__25 || look_12_2 == T__52 || look_12_2 == T__54 || look_12_2 == T__64 )
              alt_12 = 1

            end

          end
          case alt_12
          when 1
            # at line 85:13: attribute
            @state.following.push( TOKENS_FOLLOWING_attribute_IN_composite_198 )
            attribute25 = attribute
            @state.following.pop
            @adaptor.add_child( root_0, attribute25.tree )

          when 2
            # at line 85:25: constraint
            @state.following.push( TOKENS_FOLLOWING_constraint_IN_composite_202 )
            constraint26 = constraint
            @state.following.pop
            @adaptor.add_child( root_0, constraint26.tree )

          else
            break # out of loop for decision 12
          end
        end # loop for decision 12
        char_literal27 = match( T__21, TOKENS_FOLLOWING_T__21_IN_composite_207 )

        tree_for_char_literal27 = @adaptor.create_with_payload( char_literal27 )
        @adaptor.add_child( root_0, tree_for_char_literal27 )

        # at line 85:43: ( NL )*
        while true # decision 13
          alt_13 = 2
          look_13_0 = @input.peek( 1 )

          if ( look_13_0 == NL )
            alt_13 = 1

          end
          case alt_13
          when 1
            # at line 85:43: NL
            __NL28__ = match( NL, TOKENS_FOLLOWING_NL_IN_composite_209 )

            tree_for_NL28 = @adaptor.create_with_payload( __NL28__ )
            @adaptor.add_child( root_0, tree_for_NL28 )


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
    # 89:1: class_definition : 'class' ID ( extends_class )? ( '{' ( NL )* ( attribute | procedure )* '}' )? ( NL )* ;
    # 
    def class_definition
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )
      return_value = ClassDefinitionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal29 = nil
      __ID30__ = nil
      char_literal32 = nil
      __NL33__ = nil
      char_literal36 = nil
      __NL37__ = nil
      extends_class31 = nil
      attribute34 = nil
      procedure35 = nil

      tree_for_string_literal29 = nil
      tree_for_ID30 = nil
      tree_for_char_literal32 = nil
      tree_for_NL33 = nil
      tree_for_char_literal36 = nil
      tree_for_NL37 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 90:4: 'class' ID ( extends_class )? ( '{' ( NL )* ( attribute | procedure )* '}' )? ( NL )*
        string_literal29 = match( T__23, TOKENS_FOLLOWING_T__23_IN_class_definition_225 )

        tree_for_string_literal29 = @adaptor.create_with_payload( string_literal29 )
        @adaptor.add_child( root_0, tree_for_string_literal29 )

        __ID30__ = match( ID, TOKENS_FOLLOWING_ID_IN_class_definition_227 )

        tree_for_ID30 = @adaptor.create_with_payload( __ID30__ )
        @adaptor.add_child( root_0, tree_for_ID30 )

        # --> action

        			@now[__ID30__.text] = { '_self' => __ID30__.text,
        				'_context' => 'class',
        				'_parent' => @now
        			}
        			@now = @now[__ID30__.text]
        		
        # <-- action
        # at line 98:3: ( extends_class )?
        alt_14 = 2
        look_14_0 = @input.peek( 1 )

        if ( look_14_0 == T__24 )
          alt_14 = 1
        end
        case alt_14
        when 1
          # at line 98:4: extends_class
          @state.following.push( TOKENS_FOLLOWING_extends_class_IN_class_definition_236 )
          extends_class31 = extends_class
          @state.following.pop
          @adaptor.add_child( root_0, extends_class31.tree )
          # --> action

          			@now['_extends'] = ( extends_class31.nil? ? nil : extends_class31.val )
          		
          # <-- action

        end
        # at line 103:3: ( '{' ( NL )* ( attribute | procedure )* '}' )?
        alt_17 = 2
        look_17_0 = @input.peek( 1 )

        if ( look_17_0 == T__20 )
          alt_17 = 1
        end
        case alt_17
        when 1
          # at line 103:4: '{' ( NL )* ( attribute | procedure )* '}'
          char_literal32 = match( T__20, TOKENS_FOLLOWING_T__20_IN_class_definition_250 )

          tree_for_char_literal32 = @adaptor.create_with_payload( char_literal32 )
          @adaptor.add_child( root_0, tree_for_char_literal32 )

          # at line 103:8: ( NL )*
          while true # decision 15
            alt_15 = 2
            look_15_0 = @input.peek( 1 )

            if ( look_15_0 == NL )
              alt_15 = 1

            end
            case alt_15
            when 1
              # at line 103:8: NL
              __NL33__ = match( NL, TOKENS_FOLLOWING_NL_IN_class_definition_252 )

              tree_for_NL33 = @adaptor.create_with_payload( __NL33__ )
              @adaptor.add_child( root_0, tree_for_NL33 )


            else
              break # out of loop for decision 15
            end
          end # loop for decision 15
          # at line 103:12: ( attribute | procedure )*
          while true # decision 16
            alt_16 = 3
            look_16_0 = @input.peek( 1 )

            if ( look_16_0 == ID )
              alt_16 = 1
            elsif ( look_16_0 == T__35 )
              alt_16 = 2

            end
            case alt_16
            when 1
              # at line 103:14: attribute
              @state.following.push( TOKENS_FOLLOWING_attribute_IN_class_definition_257 )
              attribute34 = attribute
              @state.following.pop
              @adaptor.add_child( root_0, attribute34.tree )

            when 2
              # at line 103:26: procedure
              @state.following.push( TOKENS_FOLLOWING_procedure_IN_class_definition_261 )
              procedure35 = procedure
              @state.following.pop
              @adaptor.add_child( root_0, procedure35.tree )

            else
              break # out of loop for decision 16
            end
          end # loop for decision 16
          char_literal36 = match( T__21, TOKENS_FOLLOWING_T__21_IN_class_definition_266 )

          tree_for_char_literal36 = @adaptor.create_with_payload( char_literal36 )
          @adaptor.add_child( root_0, tree_for_char_literal36 )


        end
        # at line 103:45: ( NL )*
        while true # decision 18
          alt_18 = 2
          look_18_0 = @input.peek( 1 )

          if ( look_18_0 == NL )
            alt_18 = 1

          end
          case alt_18
          when 1
            # at line 103:45: NL
            __NL37__ = match( NL, TOKENS_FOLLOWING_NL_IN_class_definition_270 )

            tree_for_NL37 = @adaptor.create_with_payload( __NL37__ )
            @adaptor.add_child( root_0, tree_for_NL37 )


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
    # 107:1: extends_class returns [val] : 'extends' path ;
    # 
    def extends_class
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )
      return_value = ExtendsClassReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal38 = nil
      path39 = nil

      tree_for_string_literal38 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 108:4: 'extends' path
        string_literal38 = match( T__24, TOKENS_FOLLOWING_T__24_IN_extends_class_291 )

        tree_for_string_literal38 = @adaptor.create_with_payload( string_literal38 )
        @adaptor.add_child( root_0, tree_for_string_literal38 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_extends_class_293 )
        path39 = path
        @state.following.pop
        @adaptor.add_child( root_0, path39.tree )
        # --> action

        			return_value.val = self.to_ref(( path39 && @input.to_s( path39.start, path39.stop ) ))
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
    # 115:1: attribute : ( ID equals_op value ( NL )+ | ID reference_type ( NL )+ | object_def ( NL )+ );
    # 
    def attribute
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )
      return_value = AttributeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID40__ = nil
      __NL43__ = nil
      __ID44__ = nil
      __NL46__ = nil
      __NL48__ = nil
      equals_op41 = nil
      value42 = nil
      reference_type45 = nil
      object_def47 = nil

      tree_for_ID40 = nil
      tree_for_NL43 = nil
      tree_for_ID44 = nil
      tree_for_NL46 = nil
      tree_for_NL48 = nil

      begin
        # at line 116:2: ( ID equals_op value ( NL )+ | ID reference_type ( NL )+ | object_def ( NL )+ )
        alt_22 = 3
        look_22_0 = @input.peek( 1 )

        if ( look_22_0 == ID )
          case look_22 = @input.peek( 2 )
          when T__52, T__54 then alt_22 = 1
          when T__64 then alt_22 = 2
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


          # at line 116:4: ID equals_op value ( NL )+
          __ID40__ = match( ID, TOKENS_FOLLOWING_ID_IN_attribute_308 )

          tree_for_ID40 = @adaptor.create_with_payload( __ID40__ )
          @adaptor.add_child( root_0, tree_for_ID40 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_attribute_310 )
          equals_op41 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op41.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_attribute_312 )
          value42 = value
          @state.following.pop
          @adaptor.add_child( root_0, value42.tree )
          # at file 116:23: ( NL )+
          match_count_19 = 0
          while true
            alt_19 = 2
            look_19_0 = @input.peek( 1 )

            if ( look_19_0 == NL )
              alt_19 = 1

            end
            case alt_19
            when 1
              # at line 116:23: NL
              __NL43__ = match( NL, TOKENS_FOLLOWING_NL_IN_attribute_314 )

              tree_for_NL43 = @adaptor.create_with_payload( __NL43__ )
              @adaptor.add_child( root_0, tree_for_NL43 )


            else
              match_count_19 > 0 and break
              eee = EarlyExit(19)


              raise eee
            end
            match_count_19 += 1
          end

          # --> action
          	@now[__ID40__.text] = ( value42.nil? ? nil : value42.val )	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 118:4: ID reference_type ( NL )+
          __ID44__ = match( ID, TOKENS_FOLLOWING_ID_IN_attribute_324 )

          tree_for_ID44 = @adaptor.create_with_payload( __ID44__ )
          @adaptor.add_child( root_0, tree_for_ID44 )

          @state.following.push( TOKENS_FOLLOWING_reference_type_IN_attribute_326 )
          reference_type45 = reference_type
          @state.following.pop
          @adaptor.add_child( root_0, reference_type45.tree )
          # at file 118:22: ( NL )+
          match_count_20 = 0
          while true
            alt_20 = 2
            look_20_0 = @input.peek( 1 )

            if ( look_20_0 == NL )
              alt_20 = 1

            end
            case alt_20
            when 1
              # at line 118:22: NL
              __NL46__ = match( NL, TOKENS_FOLLOWING_NL_IN_attribute_328 )

              tree_for_NL46 = @adaptor.create_with_payload( __NL46__ )
              @adaptor.add_child( root_0, tree_for_NL46 )


            else
              match_count_20 > 0 and break
              eee = EarlyExit(20)


              raise eee
            end
            match_count_20 += 1
          end

          # --> action
          	@now[__ID44__.text] = ( reference_type45.nil? ? nil : reference_type45.val )	
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 120:4: object_def ( NL )+
          @state.following.push( TOKENS_FOLLOWING_object_def_IN_attribute_338 )
          object_def47 = object_def
          @state.following.pop
          @adaptor.add_child( root_0, object_def47.tree )
          # at file 120:15: ( NL )+
          match_count_21 = 0
          while true
            alt_21 = 2
            look_21_0 = @input.peek( 1 )

            if ( look_21_0 == NL )
              alt_21 = 1

            end
            case alt_21
            when 1
              # at line 120:15: NL
              __NL48__ = match( NL, TOKENS_FOLLOWING_NL_IN_attribute_340 )

              tree_for_NL48 = @adaptor.create_with_payload( __NL48__ )
              @adaptor.add_child( root_0, tree_for_NL48 )


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
    # 123:1: object_def : ID ( 'isa' path ( '[' NUMBER ']' )? )? ( object_body )? ;
    # 
    def object_def
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )
      return_value = ObjectDefReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID49__ = nil
      string_literal50 = nil
      char_literal52 = nil
      __NUMBER53__ = nil
      char_literal54 = nil
      path51 = nil
      object_body55 = nil

      tree_for_ID49 = nil
      tree_for_string_literal50 = nil
      tree_for_char_literal52 = nil
      tree_for_NUMBER53 = nil
      tree_for_char_literal54 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 124:4: ID ( 'isa' path ( '[' NUMBER ']' )? )? ( object_body )?
        __ID49__ = match( ID, TOKENS_FOLLOWING_ID_IN_object_def_352 )

        tree_for_ID49 = @adaptor.create_with_payload( __ID49__ )
        @adaptor.add_child( root_0, tree_for_ID49 )

        # --> action

        			@now[__ID49__.text] = {	'_self' => __ID49__.text,
        				'_context' => 'object',
        				'_parent' => @now,
        				'_isa' => '$.Object'
        			}
        			@now = @now[__ID49__.text]
        			@is_array = false
        		
        # <-- action
        # at line 134:3: ( 'isa' path ( '[' NUMBER ']' )? )?
        alt_24 = 2
        look_24_0 = @input.peek( 1 )

        if ( look_24_0 == T__25 )
          alt_24 = 1
        end
        case alt_24
        when 1
          # at line 134:4: 'isa' path ( '[' NUMBER ']' )?
          string_literal50 = match( T__25, TOKENS_FOLLOWING_T__25_IN_object_def_361 )

          tree_for_string_literal50 = @adaptor.create_with_payload( string_literal50 )
          @adaptor.add_child( root_0, tree_for_string_literal50 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_object_def_363 )
          path51 = path
          @state.following.pop
          @adaptor.add_child( root_0, path51.tree )
          # at line 134:14: ( '[' NUMBER ']' )?
          alt_23 = 2
          look_23_0 = @input.peek( 1 )

          if ( look_23_0 == T__26 )
            alt_23 = 1
          end
          case alt_23
          when 1
            # at line 134:15: '[' NUMBER ']'
            char_literal52 = match( T__26, TOKENS_FOLLOWING_T__26_IN_object_def_365 )

            tree_for_char_literal52 = @adaptor.create_with_payload( char_literal52 )
            @adaptor.add_child( root_0, tree_for_char_literal52 )

            __NUMBER53__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_object_def_367 )

            tree_for_NUMBER53 = @adaptor.create_with_payload( __NUMBER53__ )
            @adaptor.add_child( root_0, tree_for_NUMBER53 )

            # --> action
             @is_array = true 
            # <-- action
            char_literal54 = match( T__27, TOKENS_FOLLOWING_T__27_IN_object_def_371 )

            tree_for_char_literal54 = @adaptor.create_with_payload( char_literal54 )
            @adaptor.add_child( root_0, tree_for_char_literal54 )


          end
          # --> action

          			@now['_isa'] = self.to_ref(( path51 && @input.to_s( path51.start, path51.stop ) ))
          			self.expand_object(@now)
          		
          # <-- action

        end
        # at line 140:3: ( object_body )?
        alt_25 = 2
        look_25_0 = @input.peek( 1 )

        if ( look_25_0 == T__20 )
          alt_25 = 1
        end
        case alt_25
        when 1
          # at line 140:3: object_body
          @state.following.push( TOKENS_FOLLOWING_object_body_IN_object_def_386 )
          object_body55 = object_body
          @state.following.pop
          @adaptor.add_child( root_0, object_body55.tree )

        end
        # --> action

        			obj = self.goto_parent()
        			if @is_array
        				total = __NUMBER53__.to_s.to_i
        				@arrays[obj.ref] = total
        				for i in 0..(total-1)
        					id = obj['_self'] + "[#{i}]"
        					@now[id] = deep_clone(obj)
        					@now[id]['_self'] = id
        					@now[id]['_classes'] = obj['_classes']
        					#puts 'is_array: ' + __ID49__.text + '[' + i.to_s + ']'
        				end
        				@now.delete(obj['_self'])
        			end
        		
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
    # 158:1: object_body : '{' ( NL )* ( object_attribute | state_dependency | operator )* '}' ;
    # 
    def object_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )
      return_value = ObjectBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal56 = nil
      __NL57__ = nil
      char_literal61 = nil
      object_attribute58 = nil
      state_dependency59 = nil
      operator60 = nil

      tree_for_char_literal56 = nil
      tree_for_NL57 = nil
      tree_for_char_literal61 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 159:4: '{' ( NL )* ( object_attribute | state_dependency | operator )* '}'
        char_literal56 = match( T__20, TOKENS_FOLLOWING_T__20_IN_object_body_402 )

        tree_for_char_literal56 = @adaptor.create_with_payload( char_literal56 )
        @adaptor.add_child( root_0, tree_for_char_literal56 )

        # at line 159:8: ( NL )*
        while true # decision 26
          alt_26 = 2
          look_26_0 = @input.peek( 1 )

          if ( look_26_0 == NL )
            alt_26 = 1

          end
          case alt_26
          when 1
            # at line 159:8: NL
            __NL57__ = match( NL, TOKENS_FOLLOWING_NL_IN_object_body_404 )

            tree_for_NL57 = @adaptor.create_with_payload( __NL57__ )
            @adaptor.add_child( root_0, tree_for_NL57 )


          else
            break # out of loop for decision 26
          end
        end # loop for decision 26
        # at line 159:12: ( object_attribute | state_dependency | operator )*
        while true # decision 27
          alt_27 = 4
          case look_27 = @input.peek( 1 )
          when ID then alt_27 = 1
          when T__28 then alt_27 = 2
          when T__31 then alt_27 = 3
          end
          case alt_27
          when 1
            # at line 159:14: object_attribute
            @state.following.push( TOKENS_FOLLOWING_object_attribute_IN_object_body_409 )
            object_attribute58 = object_attribute
            @state.following.pop
            @adaptor.add_child( root_0, object_attribute58.tree )

          when 2
            # at line 159:33: state_dependency
            @state.following.push( TOKENS_FOLLOWING_state_dependency_IN_object_body_413 )
            state_dependency59 = state_dependency
            @state.following.pop
            @adaptor.add_child( root_0, state_dependency59.tree )

          when 3
            # at line 159:52: operator
            @state.following.push( TOKENS_FOLLOWING_operator_IN_object_body_417 )
            operator60 = operator
            @state.following.pop
            @adaptor.add_child( root_0, operator60.tree )

          else
            break # out of loop for decision 27
          end
        end # loop for decision 27
        char_literal61 = match( T__21, TOKENS_FOLLOWING_T__21_IN_object_body_422 )

        tree_for_char_literal61 = @adaptor.create_with_payload( char_literal61 )
        @adaptor.add_child( root_0, tree_for_char_literal61 )

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
    # 162:1: object_attribute : ( attribute | ID equals_op NULL ( NL )+ );
    # 
    def object_attribute
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )
      return_value = ObjectAttributeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID63__ = nil
      __NULL65__ = nil
      __NL66__ = nil
      attribute62 = nil
      equals_op64 = nil

      tree_for_ID63 = nil
      tree_for_NULL65 = nil
      tree_for_NL66 = nil

      begin
        # at line 163:2: ( attribute | ID equals_op NULL ( NL )+ )
        alt_29 = 2
        look_29_0 = @input.peek( 1 )

        if ( look_29_0 == ID )
          look_29_1 = @input.peek( 2 )

          if ( look_29_1 == T__52 || look_29_1 == T__54 )
            look_29_2 = @input.peek( 3 )

            if ( look_29_2.between?( STRING, NUMBER ) || look_29_2.between?( BOOLEAN, MULTILINE_STRING ) || look_29_2 == T__36 )
              alt_29 = 1
            elsif ( look_29_2 == NULL )
              alt_29 = 2
            else
              raise NoViableAlternative( "", 29, 2 )
            end
          elsif ( look_29_1 == NL || look_29_1 == T__20 || look_29_1 == T__25 || look_29_1 == T__64 )
            alt_29 = 1
          else
            raise NoViableAlternative( "", 29, 1 )
          end
        else
          raise NoViableAlternative( "", 29, 0 )
        end
        case alt_29
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 163:4: attribute
          @state.following.push( TOKENS_FOLLOWING_attribute_IN_object_attribute_433 )
          attribute62 = attribute
          @state.following.pop
          @adaptor.add_child( root_0, attribute62.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 164:4: ID equals_op NULL ( NL )+
          __ID63__ = match( ID, TOKENS_FOLLOWING_ID_IN_object_attribute_438 )

          tree_for_ID63 = @adaptor.create_with_payload( __ID63__ )
          @adaptor.add_child( root_0, tree_for_ID63 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_object_attribute_440 )
          equals_op64 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op64.tree )
          __NULL65__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_object_attribute_442 )

          tree_for_NULL65 = @adaptor.create_with_payload( __NULL65__ )
          @adaptor.add_child( root_0, tree_for_NULL65 )

          # at file 164:22: ( NL )+
          match_count_28 = 0
          while true
            alt_28 = 2
            look_28_0 = @input.peek( 1 )

            if ( look_28_0 == NL )
              alt_28 = 1

            end
            case alt_28
            when 1
              # at line 164:22: NL
              __NL66__ = match( NL, TOKENS_FOLLOWING_NL_IN_object_attribute_444 )

              tree_for_NL66 = @adaptor.create_with_payload( __NL66__ )
              @adaptor.add_child( root_0, tree_for_NL66 )


            else
              match_count_28 > 0 and break
              eee = EarlyExit(28)


              raise eee
            end
            match_count_28 += 1
          end

          # --> action
          	@now[__ID63__.text] = self.null_value	
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
    # 168:1: state_dependency : 'if' dep_effect ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )* ( NL )+ ;
    # 
    def state_dependency
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )
      return_value = StateDependencyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal67 = nil
      __NL69__ = nil
      string_literal70 = nil
      __NL71__ = nil
      char_literal72 = nil
      __NL73__ = nil
      char_literal75 = nil
      __NL76__ = nil
      string_literal77 = nil
      __NL78__ = nil
      char_literal79 = nil
      __NL80__ = nil
      char_literal82 = nil
      __NL83__ = nil
      dep_effect68 = nil
      constraint_body74 = nil
      constraint_body81 = nil

      tree_for_string_literal67 = nil
      tree_for_NL69 = nil
      tree_for_string_literal70 = nil
      tree_for_NL71 = nil
      tree_for_char_literal72 = nil
      tree_for_NL73 = nil
      tree_for_char_literal75 = nil
      tree_for_NL76 = nil
      tree_for_string_literal77 = nil
      tree_for_NL78 = nil
      tree_for_char_literal79 = nil
      tree_for_NL80 = nil
      tree_for_char_literal82 = nil
      tree_for_NL83 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 169:4: 'if' dep_effect ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )* ( NL )+
        string_literal67 = match( T__28, TOKENS_FOLLOWING_T__28_IN_state_dependency_460 )

        tree_for_string_literal67 = @adaptor.create_with_payload( string_literal67 )
        @adaptor.add_child( root_0, tree_for_string_literal67 )

        @state.following.push( TOKENS_FOLLOWING_dep_effect_IN_state_dependency_464 )
        dep_effect68 = dep_effect
        @state.following.pop
        @adaptor.add_child( root_0, dep_effect68.tree )
        # at line 170:14: ( NL )*
        while true # decision 30
          alt_30 = 2
          look_30_0 = @input.peek( 1 )

          if ( look_30_0 == NL )
            alt_30 = 1

          end
          case alt_30
          when 1
            # at line 170:14: NL
            __NL69__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_466 )

            tree_for_NL69 = @adaptor.create_with_payload( __NL69__ )
            @adaptor.add_child( root_0, tree_for_NL69 )


          else
            break # out of loop for decision 30
          end
        end # loop for decision 30
        string_literal70 = match( T__29, TOKENS_FOLLOWING_T__29_IN_state_dependency_469 )

        tree_for_string_literal70 = @adaptor.create_with_payload( string_literal70 )
        @adaptor.add_child( root_0, tree_for_string_literal70 )

        # at line 170:25: ( NL )*
        while true # decision 31
          alt_31 = 2
          look_31_0 = @input.peek( 1 )

          if ( look_31_0 == NL )
            alt_31 = 1

          end
          case alt_31
          when 1
            # at line 170:25: NL
            __NL71__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_471 )

            tree_for_NL71 = @adaptor.create_with_payload( __NL71__ )
            @adaptor.add_child( root_0, tree_for_NL71 )


          else
            break # out of loop for decision 31
          end
        end # loop for decision 31
        char_literal72 = match( T__20, TOKENS_FOLLOWING_T__20_IN_state_dependency_474 )

        tree_for_char_literal72 = @adaptor.create_with_payload( char_literal72 )
        @adaptor.add_child( root_0, tree_for_char_literal72 )

        # at line 171:3: ( NL )*
        while true # decision 32
          alt_32 = 2
          look_32_0 = @input.peek( 1 )

          if ( look_32_0 == NL )
            alt_32 = 1

          end
          case alt_32
          when 1
            # at line 171:3: NL
            __NL73__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_478 )

            tree_for_NL73 = @adaptor.create_with_payload( __NL73__ )
            @adaptor.add_child( root_0, tree_for_NL73 )


          else
            break # out of loop for decision 32
          end
        end # loop for decision 32
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_state_dependency_481 )
        constraint_body74 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body74.tree )
        char_literal75 = match( T__21, TOKENS_FOLLOWING_T__21_IN_state_dependency_486 )

        tree_for_char_literal75 = @adaptor.create_with_payload( char_literal75 )
        @adaptor.add_child( root_0, tree_for_char_literal75 )

        # at line 173:3: ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )*
        while true # decision 36
          alt_36 = 2
          alt_36 = @dfa36.predict( @input )
          case alt_36
          when 1
            # at line 173:5: ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}'
            # at line 173:5: ( NL )*
            while true # decision 33
              alt_33 = 2
              look_33_0 = @input.peek( 1 )

              if ( look_33_0 == NL )
                alt_33 = 1

              end
              case alt_33
              when 1
                # at line 173:5: NL
                __NL76__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_492 )

                tree_for_NL76 = @adaptor.create_with_payload( __NL76__ )
                @adaptor.add_child( root_0, tree_for_NL76 )


              else
                break # out of loop for decision 33
              end
            end # loop for decision 33
            string_literal77 = match( T__30, TOKENS_FOLLOWING_T__30_IN_state_dependency_495 )

            tree_for_string_literal77 = @adaptor.create_with_payload( string_literal77 )
            @adaptor.add_child( root_0, tree_for_string_literal77 )

            # at line 173:14: ( NL )*
            while true # decision 34
              alt_34 = 2
              look_34_0 = @input.peek( 1 )

              if ( look_34_0 == NL )
                alt_34 = 1

              end
              case alt_34
              when 1
                # at line 173:14: NL
                __NL78__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_497 )

                tree_for_NL78 = @adaptor.create_with_payload( __NL78__ )
                @adaptor.add_child( root_0, tree_for_NL78 )


              else
                break # out of loop for decision 34
              end
            end # loop for decision 34
            char_literal79 = match( T__20, TOKENS_FOLLOWING_T__20_IN_state_dependency_500 )

            tree_for_char_literal79 = @adaptor.create_with_payload( char_literal79 )
            @adaptor.add_child( root_0, tree_for_char_literal79 )

            # at line 174:3: ( NL )*
            while true # decision 35
              alt_35 = 2
              look_35_0 = @input.peek( 1 )

              if ( look_35_0 == NL )
                alt_35 = 1

              end
              case alt_35
              when 1
                # at line 174:3: NL
                __NL80__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_504 )

                tree_for_NL80 = @adaptor.create_with_payload( __NL80__ )
                @adaptor.add_child( root_0, tree_for_NL80 )


              else
                break # out of loop for decision 35
              end
            end # loop for decision 35
            @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_state_dependency_507 )
            constraint_body81 = constraint_body
            @state.following.pop
            @adaptor.add_child( root_0, constraint_body81.tree )
            char_literal82 = match( T__21, TOKENS_FOLLOWING_T__21_IN_state_dependency_511 )

            tree_for_char_literal82 = @adaptor.create_with_payload( char_literal82 )
            @adaptor.add_child( root_0, tree_for_char_literal82 )


          else
            break # out of loop for decision 36
          end
        end # loop for decision 36
        # at file 176:3: ( NL )+
        match_count_37 = 0
        while true
          alt_37 = 2
          look_37_0 = @input.peek( 1 )

          if ( look_37_0 == NL )
            alt_37 = 1

          end
          case alt_37
          when 1
            # at line 176:3: NL
            __NL83__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_517 )

            tree_for_NL83 = @adaptor.create_with_payload( __NL83__ )
            @adaptor.add_child( root_0, tree_for_NL83 )


          else
            match_count_37 > 0 and break
            eee = EarlyExit(37)


            raise eee
          end
          match_count_37 += 1
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
    # 179:1: dep_effect : reference equals_op ( value | NULL ) ;
    # 
    def dep_effect
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )
      return_value = DepEffectReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL87__ = nil
      reference84 = nil
      equals_op85 = nil
      value86 = nil

      tree_for_NULL87 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 180:4: reference equals_op ( value | NULL )
        @state.following.push( TOKENS_FOLLOWING_reference_IN_dep_effect_529 )
        reference84 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference84.tree )
        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_dep_effect_531 )
        equals_op85 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op85.tree )
        # at line 181:3: ( value | NULL )
        alt_38 = 2
        look_38_0 = @input.peek( 1 )

        if ( look_38_0.between?( STRING, NUMBER ) || look_38_0.between?( BOOLEAN, MULTILINE_STRING ) || look_38_0 == T__36 )
          alt_38 = 1
        elsif ( look_38_0 == NULL )
          alt_38 = 2
        else
          raise NoViableAlternative( "", 38, 0 )
        end
        case alt_38
        when 1
          # at line 181:5: value
          @state.following.push( TOKENS_FOLLOWING_value_IN_dep_effect_538 )
          value86 = value
          @state.following.pop
          @adaptor.add_child( root_0, value86.tree )

        when 2
          # at line 182:5: NULL
          __NULL87__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_dep_effect_544 )

          tree_for_NULL87 = @adaptor.create_with_payload( __NULL87__ )
          @adaptor.add_child( root_0, tree_for_NULL87 )


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
    # 186:1: operator : 'operator' ID '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( op_conditions )? op_effects '}' ( NL )+ ;
    # 
    def operator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )
      return_value = OperatorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal88 = nil
      __ID89__ = nil
      char_literal90 = nil
      __NL91__ = nil
      string_literal92 = nil
      __NUMBER94__ = nil
      __NL95__ = nil
      char_literal98 = nil
      __NL99__ = nil
      equals_op93 = nil
      op_conditions96 = nil
      op_effects97 = nil

      tree_for_string_literal88 = nil
      tree_for_ID89 = nil
      tree_for_char_literal90 = nil
      tree_for_NL91 = nil
      tree_for_string_literal92 = nil
      tree_for_NUMBER94 = nil
      tree_for_NL95 = nil
      tree_for_char_literal98 = nil
      tree_for_NL99 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 187:4: 'operator' ID '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( op_conditions )? op_effects '}' ( NL )+
        string_literal88 = match( T__31, TOKENS_FOLLOWING_T__31_IN_operator_560 )

        tree_for_string_literal88 = @adaptor.create_with_payload( string_literal88 )
        @adaptor.add_child( root_0, tree_for_string_literal88 )

        __ID89__ = match( ID, TOKENS_FOLLOWING_ID_IN_operator_562 )

        tree_for_ID89 = @adaptor.create_with_payload( __ID89__ )
        @adaptor.add_child( root_0, tree_for_ID89 )

        char_literal90 = match( T__20, TOKENS_FOLLOWING_T__20_IN_operator_564 )

        tree_for_char_literal90 = @adaptor.create_with_payload( char_literal90 )
        @adaptor.add_child( root_0, tree_for_char_literal90 )

        # at line 187:22: ( NL )*
        while true # decision 39
          alt_39 = 2
          look_39_0 = @input.peek( 1 )

          if ( look_39_0 == NL )
            alt_39 = 1

          end
          case alt_39
          when 1
            # at line 187:22: NL
            __NL91__ = match( NL, TOKENS_FOLLOWING_NL_IN_operator_566 )

            tree_for_NL91 = @adaptor.create_with_payload( __NL91__ )
            @adaptor.add_child( root_0, tree_for_NL91 )


          else
            break # out of loop for decision 39
          end
        end # loop for decision 39
        # --> action

        			@now[__ID89__.text] = { '_self' => __ID89__.text,
        				'_context' => 'operator',
        				'_parent' => @now,
        				'_cost' => 1,
        				'_conditions' => { '_context' => 'constraint' },
        				'_effects' => { '_context' => 'mutation' }
        			}
        			@now = @now[__ID89__.text]
        		
        # <-- action
        # at line 198:3: ( 'cost' equals_op NUMBER ( NL )+ )?
        alt_41 = 2
        look_41_0 = @input.peek( 1 )

        if ( look_41_0 == T__32 )
          alt_41 = 1
        end
        case alt_41
        when 1
          # at line 198:5: 'cost' equals_op NUMBER ( NL )+
          string_literal92 = match( T__32, TOKENS_FOLLOWING_T__32_IN_operator_577 )

          tree_for_string_literal92 = @adaptor.create_with_payload( string_literal92 )
          @adaptor.add_child( root_0, tree_for_string_literal92 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_operator_579 )
          equals_op93 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op93.tree )
          __NUMBER94__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_operator_581 )

          tree_for_NUMBER94 = @adaptor.create_with_payload( __NUMBER94__ )
          @adaptor.add_child( root_0, tree_for_NUMBER94 )

          # at file 198:29: ( NL )+
          match_count_40 = 0
          while true
            alt_40 = 2
            look_40_0 = @input.peek( 1 )

            if ( look_40_0 == NL )
              alt_40 = 1

            end
            case alt_40
            when 1
              # at line 198:29: NL
              __NL95__ = match( NL, TOKENS_FOLLOWING_NL_IN_operator_583 )

              tree_for_NL95 = @adaptor.create_with_payload( __NL95__ )
              @adaptor.add_child( root_0, tree_for_NL95 )


            else
              match_count_40 > 0 and break
              eee = EarlyExit(40)


              raise eee
            end
            match_count_40 += 1
          end

          # --> action
          	@now['_cost'] = __NUMBER94__.text.to_i	
          # <-- action

        end
        # at line 202:3: ( op_conditions )?
        alt_42 = 2
        look_42_0 = @input.peek( 1 )

        if ( look_42_0 == T__33 )
          alt_42 = 1
        end
        case alt_42
        when 1
          # at line 202:3: op_conditions
          @state.following.push( TOKENS_FOLLOWING_op_conditions_IN_operator_602 )
          op_conditions96 = op_conditions
          @state.following.pop
          @adaptor.add_child( root_0, op_conditions96.tree )

        end
        @state.following.push( TOKENS_FOLLOWING_op_effects_IN_operator_605 )
        op_effects97 = op_effects
        @state.following.pop
        @adaptor.add_child( root_0, op_effects97.tree )
        char_literal98 = match( T__21, TOKENS_FOLLOWING_T__21_IN_operator_609 )

        tree_for_char_literal98 = @adaptor.create_with_payload( char_literal98 )
        @adaptor.add_child( root_0, tree_for_char_literal98 )

        # at file 203:7: ( NL )+
        match_count_43 = 0
        while true
          alt_43 = 2
          look_43_0 = @input.peek( 1 )

          if ( look_43_0 == NL )
            alt_43 = 1

          end
          case alt_43
          when 1
            # at line 203:7: NL
            __NL99__ = match( NL, TOKENS_FOLLOWING_NL_IN_operator_611 )

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
    # 207:1: op_param : ID equals_op reference ( NL )+ ;
    # 
    def op_param
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )
      return_value = OpParamReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID100__ = nil
      __NL103__ = nil
      equals_op101 = nil
      reference102 = nil

      tree_for_ID100 = nil
      tree_for_NL103 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 208:4: ID equals_op reference ( NL )+
        __ID100__ = match( ID, TOKENS_FOLLOWING_ID_IN_op_param_627 )

        tree_for_ID100 = @adaptor.create_with_payload( __ID100__ )
        @adaptor.add_child( root_0, tree_for_ID100 )

        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_op_param_629 )
        equals_op101 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op101.tree )
        @state.following.push( TOKENS_FOLLOWING_reference_IN_op_param_631 )
        reference102 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference102.tree )
        # at file 208:27: ( NL )+
        match_count_44 = 0
        while true
          alt_44 = 2
          look_44_0 = @input.peek( 1 )

          if ( look_44_0 == NL )
            alt_44 = 1

          end
          case alt_44
          when 1
            # at line 208:27: NL
            __NL103__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_param_633 )

            tree_for_NL103 = @adaptor.create_with_payload( __NL103__ )
            @adaptor.add_child( root_0, tree_for_NL103 )


          else
            match_count_44 > 0 and break
            eee = EarlyExit(44)


            raise eee
          end
          match_count_44 += 1
        end

        # --> action
        	@now[__ID100__.text] = ( reference102.nil? ? nil : reference102.val )	
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
    # 212:1: op_conditions : 'conditions' '{' ( NL )* ( op_statement )* '}' ( NL )+ ;
    # 
    def op_conditions
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      return_value = OpConditionsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal104 = nil
      char_literal105 = nil
      __NL106__ = nil
      char_literal108 = nil
      __NL109__ = nil
      op_statement107 = nil

      tree_for_string_literal104 = nil
      tree_for_char_literal105 = nil
      tree_for_NL106 = nil
      tree_for_char_literal108 = nil
      tree_for_NL109 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 213:4: 'conditions' '{' ( NL )* ( op_statement )* '}' ( NL )+
        string_literal104 = match( T__33, TOKENS_FOLLOWING_T__33_IN_op_conditions_649 )

        tree_for_string_literal104 = @adaptor.create_with_payload( string_literal104 )
        @adaptor.add_child( root_0, tree_for_string_literal104 )

        char_literal105 = match( T__20, TOKENS_FOLLOWING_T__20_IN_op_conditions_651 )

        tree_for_char_literal105 = @adaptor.create_with_payload( char_literal105 )
        @adaptor.add_child( root_0, tree_for_char_literal105 )

        # at line 213:21: ( NL )*
        while true # decision 45
          alt_45 = 2
          look_45_0 = @input.peek( 1 )

          if ( look_45_0 == NL )
            alt_45 = 1

          end
          case alt_45
          when 1
            # at line 213:21: NL
            __NL106__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_conditions_653 )

            tree_for_NL106 = @adaptor.create_with_payload( __NL106__ )
            @adaptor.add_child( root_0, tree_for_NL106 )


          else
            break # out of loop for decision 45
          end
        end # loop for decision 45
        # --> action

        			@now['_conditions']['_parent'] = @now
        			@now = @now['_conditions']
        		
        # <-- action
        # at line 218:3: ( op_statement )*
        while true # decision 46
          alt_46 = 2
          look_46_0 = @input.peek( 1 )

          if ( look_46_0 == ID )
            alt_46 = 1

          end
          case alt_46
          when 1
            # at line 218:3: op_statement
            @state.following.push( TOKENS_FOLLOWING_op_statement_IN_op_conditions_662 )
            op_statement107 = op_statement
            @state.following.pop
            @adaptor.add_child( root_0, op_statement107.tree )

          else
            break # out of loop for decision 46
          end
        end # loop for decision 46
        char_literal108 = match( T__21, TOKENS_FOLLOWING_T__21_IN_op_conditions_667 )

        tree_for_char_literal108 = @adaptor.create_with_payload( char_literal108 )
        @adaptor.add_child( root_0, tree_for_char_literal108 )

        # at file 219:7: ( NL )+
        match_count_47 = 0
        while true
          alt_47 = 2
          look_47_0 = @input.peek( 1 )

          if ( look_47_0 == NL )
            alt_47 = 1

          end
          case alt_47
          when 1
            # at line 219:7: NL
            __NL109__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_conditions_669 )

            tree_for_NL109 = @adaptor.create_with_payload( __NL109__ )
            @adaptor.add_child( root_0, tree_for_NL109 )


          else
            match_count_47 > 0 and break
            eee = EarlyExit(47)


            raise eee
          end
          match_count_47 += 1
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
    # 223:1: op_effects : 'effects' '{' ( NL )* ( op_statement )* '}' ( NL )+ ;
    # 
    def op_effects
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      return_value = OpEffectsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal110 = nil
      char_literal111 = nil
      __NL112__ = nil
      char_literal114 = nil
      __NL115__ = nil
      op_statement113 = nil

      tree_for_string_literal110 = nil
      tree_for_char_literal111 = nil
      tree_for_NL112 = nil
      tree_for_char_literal114 = nil
      tree_for_NL115 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 224:4: 'effects' '{' ( NL )* ( op_statement )* '}' ( NL )+
        string_literal110 = match( T__34, TOKENS_FOLLOWING_T__34_IN_op_effects_685 )

        tree_for_string_literal110 = @adaptor.create_with_payload( string_literal110 )
        @adaptor.add_child( root_0, tree_for_string_literal110 )

        char_literal111 = match( T__20, TOKENS_FOLLOWING_T__20_IN_op_effects_687 )

        tree_for_char_literal111 = @adaptor.create_with_payload( char_literal111 )
        @adaptor.add_child( root_0, tree_for_char_literal111 )

        # at line 224:18: ( NL )*
        while true # decision 48
          alt_48 = 2
          look_48_0 = @input.peek( 1 )

          if ( look_48_0 == NL )
            alt_48 = 1

          end
          case alt_48
          when 1
            # at line 224:18: NL
            __NL112__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_effects_689 )

            tree_for_NL112 = @adaptor.create_with_payload( __NL112__ )
            @adaptor.add_child( root_0, tree_for_NL112 )


          else
            break # out of loop for decision 48
          end
        end # loop for decision 48
        # --> action

        			@now['_effects']['_parent'] = @now
        			@now = @now['_effects']
        		
        # <-- action
        # at line 229:3: ( op_statement )*
        while true # decision 49
          alt_49 = 2
          look_49_0 = @input.peek( 1 )

          if ( look_49_0 == ID )
            alt_49 = 1

          end
          case alt_49
          when 1
            # at line 229:3: op_statement
            @state.following.push( TOKENS_FOLLOWING_op_statement_IN_op_effects_698 )
            op_statement113 = op_statement
            @state.following.pop
            @adaptor.add_child( root_0, op_statement113.tree )

          else
            break # out of loop for decision 49
          end
        end # loop for decision 49
        char_literal114 = match( T__21, TOKENS_FOLLOWING_T__21_IN_op_effects_703 )

        tree_for_char_literal114 = @adaptor.create_with_payload( char_literal114 )
        @adaptor.add_child( root_0, tree_for_char_literal114 )

        # at file 230:7: ( NL )+
        match_count_50 = 0
        while true
          alt_50 = 2
          look_50_0 = @input.peek( 1 )

          if ( look_50_0 == NL )
            alt_50 = 1

          end
          case alt_50
          when 1
            # at line 230:7: NL
            __NL115__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_effects_705 )

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
    # 234:1: op_statement : reference equals_op value ( NL )+ ;
    # 
    def op_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      return_value = OpStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL119__ = nil
      reference116 = nil
      equals_op117 = nil
      value118 = nil

      tree_for_NL119 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 235:4: reference equals_op value ( NL )+
        @state.following.push( TOKENS_FOLLOWING_reference_IN_op_statement_721 )
        reference116 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference116.tree )
        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_op_statement_723 )
        equals_op117 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op117.tree )
        @state.following.push( TOKENS_FOLLOWING_value_IN_op_statement_725 )
        value118 = value
        @state.following.pop
        @adaptor.add_child( root_0, value118.tree )
        # at file 235:30: ( NL )+
        match_count_51 = 0
        while true
          alt_51 = 2
          look_51_0 = @input.peek( 1 )

          if ( look_51_0 == NL )
            alt_51 = 1

          end
          case alt_51
          when 1
            # at line 235:30: NL
            __NL119__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_statement_727 )

            tree_for_NL119 = @adaptor.create_with_payload( __NL119__ )
            @adaptor.add_child( root_0, tree_for_NL119 )


          else
            match_count_51 > 0 and break
            eee = EarlyExit(51)


            raise eee
          end
          match_count_51 += 1
        end

        # --> action
        	@now[( reference116.nil? ? nil : reference116.val )] = ( value118.nil? ? nil : value118.val )	
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
    # 239:1: procedure : 'procedure' ID ( parameters )? '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( conditions )? effects '}' ( NL )+ ;
    # 
    def procedure
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = ProcedureReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal120 = nil
      __ID121__ = nil
      char_literal123 = nil
      __NL124__ = nil
      string_literal125 = nil
      __NUMBER127__ = nil
      __NL128__ = nil
      char_literal131 = nil
      __NL132__ = nil
      parameters122 = nil
      equals_op126 = nil
      conditions129 = nil
      effects130 = nil

      tree_for_string_literal120 = nil
      tree_for_ID121 = nil
      tree_for_char_literal123 = nil
      tree_for_NL124 = nil
      tree_for_string_literal125 = nil
      tree_for_NUMBER127 = nil
      tree_for_NL128 = nil
      tree_for_char_literal131 = nil
      tree_for_NL132 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 240:4: 'procedure' ID ( parameters )? '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( conditions )? effects '}' ( NL )+
        string_literal120 = match( T__35, TOKENS_FOLLOWING_T__35_IN_procedure_743 )

        tree_for_string_literal120 = @adaptor.create_with_payload( string_literal120 )
        @adaptor.add_child( root_0, tree_for_string_literal120 )

        __ID121__ = match( ID, TOKENS_FOLLOWING_ID_IN_procedure_745 )

        tree_for_ID121 = @adaptor.create_with_payload( __ID121__ )
        @adaptor.add_child( root_0, tree_for_ID121 )

        # --> action

        			@now[__ID121__.text] = { '_self' => __ID121__.text,
        				'_context' => 'procedure',
        				'_parent' => @now,
        				'_cost' => 1,
        				'_conditions' => { '_context' => 'constraint', '_type' => 'and' },
        				'_effects' => { '_context' => 'mutation', '_type' => 'and' }
        			}
        			@now = @now[__ID121__.text]
        		
        # <-- action
        # at line 251:3: ( parameters )?
        alt_52 = 2
        look_52_0 = @input.peek( 1 )

        if ( look_52_0 == T__36 )
          alt_52 = 1
        end
        case alt_52
        when 1
          # at line 251:3: parameters
          @state.following.push( TOKENS_FOLLOWING_parameters_IN_procedure_753 )
          parameters122 = parameters
          @state.following.pop
          @adaptor.add_child( root_0, parameters122.tree )

        end
        char_literal123 = match( T__20, TOKENS_FOLLOWING_T__20_IN_procedure_756 )

        tree_for_char_literal123 = @adaptor.create_with_payload( char_literal123 )
        @adaptor.add_child( root_0, tree_for_char_literal123 )

        # at line 251:19: ( NL )*
        while true # decision 53
          alt_53 = 2
          look_53_0 = @input.peek( 1 )

          if ( look_53_0 == NL )
            alt_53 = 1

          end
          case alt_53
          when 1
            # at line 251:19: NL
            __NL124__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_758 )

            tree_for_NL124 = @adaptor.create_with_payload( __NL124__ )
            @adaptor.add_child( root_0, tree_for_NL124 )


          else
            break # out of loop for decision 53
          end
        end # loop for decision 53
        # at line 252:3: ( 'cost' equals_op NUMBER ( NL )+ )?
        alt_55 = 2
        look_55_0 = @input.peek( 1 )

        if ( look_55_0 == T__32 )
          alt_55 = 1
        end
        case alt_55
        when 1
          # at line 252:5: 'cost' equals_op NUMBER ( NL )+
          string_literal125 = match( T__32, TOKENS_FOLLOWING_T__32_IN_procedure_766 )

          tree_for_string_literal125 = @adaptor.create_with_payload( string_literal125 )
          @adaptor.add_child( root_0, tree_for_string_literal125 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_procedure_768 )
          equals_op126 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op126.tree )
          __NUMBER127__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_procedure_770 )

          tree_for_NUMBER127 = @adaptor.create_with_payload( __NUMBER127__ )
          @adaptor.add_child( root_0, tree_for_NUMBER127 )

          # --> action
          	@now['_cost'] = __NUMBER127__.text.to_i	
          # <-- action
          # at file 254:4: ( NL )+
          match_count_54 = 0
          while true
            alt_54 = 2
            look_54_0 = @input.peek( 1 )

            if ( look_54_0 == NL )
              alt_54 = 1

            end
            case alt_54
            when 1
              # at line 254:4: NL
              __NL128__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_780 )

              tree_for_NL128 = @adaptor.create_with_payload( __NL128__ )
              @adaptor.add_child( root_0, tree_for_NL128 )


            else
              match_count_54 > 0 and break
              eee = EarlyExit(54)


              raise eee
            end
            match_count_54 += 1
          end


        end
        # at line 256:3: ( conditions )?
        alt_56 = 2
        look_56_0 = @input.peek( 1 )

        if ( look_56_0 == T__33 )
          alt_56 = 1
        end
        case alt_56
        when 1
          # at line 256:3: conditions
          @state.following.push( TOKENS_FOLLOWING_conditions_IN_procedure_790 )
          conditions129 = conditions
          @state.following.pop
          @adaptor.add_child( root_0, conditions129.tree )

        end
        @state.following.push( TOKENS_FOLLOWING_effects_IN_procedure_793 )
        effects130 = effects
        @state.following.pop
        @adaptor.add_child( root_0, effects130.tree )
        char_literal131 = match( T__21, TOKENS_FOLLOWING_T__21_IN_procedure_795 )

        tree_for_char_literal131 = @adaptor.create_with_payload( char_literal131 )
        @adaptor.add_child( root_0, tree_for_char_literal131 )

        # at file 256:27: ( NL )+
        match_count_57 = 0
        while true
          alt_57 = 2
          look_57_0 = @input.peek( 1 )

          if ( look_57_0 == NL )
            alt_57 = 1

          end
          case alt_57
          when 1
            # at line 256:27: NL
            __NL132__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_797 )

            tree_for_NL132 = @adaptor.create_with_payload( __NL132__ )
            @adaptor.add_child( root_0, tree_for_NL132 )


          else
            match_count_57 > 0 and break
            eee = EarlyExit(57)


            raise eee
          end
          match_count_57 += 1
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
    # 260:1: parameters : '(' parameter ( ',' parameter )* ')' ;
    # 
    def parameters
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = ParametersReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal133 = nil
      char_literal135 = nil
      char_literal137 = nil
      parameter134 = nil
      parameter136 = nil

      tree_for_char_literal133 = nil
      tree_for_char_literal135 = nil
      tree_for_char_literal137 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 261:4: '(' parameter ( ',' parameter )* ')'
        char_literal133 = match( T__36, TOKENS_FOLLOWING_T__36_IN_parameters_813 )

        tree_for_char_literal133 = @adaptor.create_with_payload( char_literal133 )
        @adaptor.add_child( root_0, tree_for_char_literal133 )

        @state.following.push( TOKENS_FOLLOWING_parameter_IN_parameters_815 )
        parameter134 = parameter
        @state.following.pop
        @adaptor.add_child( root_0, parameter134.tree )
        # at line 261:18: ( ',' parameter )*
        while true # decision 58
          alt_58 = 2
          look_58_0 = @input.peek( 1 )

          if ( look_58_0 == T__37 )
            alt_58 = 1

          end
          case alt_58
          when 1
            # at line 261:19: ',' parameter
            char_literal135 = match( T__37, TOKENS_FOLLOWING_T__37_IN_parameters_818 )

            tree_for_char_literal135 = @adaptor.create_with_payload( char_literal135 )
            @adaptor.add_child( root_0, tree_for_char_literal135 )

            @state.following.push( TOKENS_FOLLOWING_parameter_IN_parameters_820 )
            parameter136 = parameter
            @state.following.pop
            @adaptor.add_child( root_0, parameter136.tree )

          else
            break # out of loop for decision 58
          end
        end # loop for decision 58
        char_literal137 = match( T__38, TOKENS_FOLLOWING_T__38_IN_parameters_824 )

        tree_for_char_literal137 = @adaptor.create_with_payload( char_literal137 )
        @adaptor.add_child( root_0, tree_for_char_literal137 )

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
    # 264:1: parameter : ( ID reference_type | ID 'areall' path );
    # 
    def parameter
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = ParameterReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID138__ = nil
      __ID140__ = nil
      string_literal141 = nil
      reference_type139 = nil
      path142 = nil

      tree_for_ID138 = nil
      tree_for_ID140 = nil
      tree_for_string_literal141 = nil

      begin
        # at line 265:2: ( ID reference_type | ID 'areall' path )
        alt_59 = 2
        look_59_0 = @input.peek( 1 )

        if ( look_59_0 == ID )
          look_59_1 = @input.peek( 2 )

          if ( look_59_1 == T__39 )
            alt_59 = 2
          elsif ( look_59_1 == T__64 )
            alt_59 = 1
          else
            raise NoViableAlternative( "", 59, 1 )
          end
        else
          raise NoViableAlternative( "", 59, 0 )
        end
        case alt_59
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 265:4: ID reference_type
          __ID138__ = match( ID, TOKENS_FOLLOWING_ID_IN_parameter_836 )

          tree_for_ID138 = @adaptor.create_with_payload( __ID138__ )
          @adaptor.add_child( root_0, tree_for_ID138 )

          @state.following.push( TOKENS_FOLLOWING_reference_type_IN_parameter_838 )
          reference_type139 = reference_type
          @state.following.pop
          @adaptor.add_child( root_0, reference_type139.tree )
          # --> action
          	@now[__ID138__.text] = ( reference_type139.nil? ? nil : reference_type139.val )	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 267:4: ID 'areall' path
          __ID140__ = match( ID, TOKENS_FOLLOWING_ID_IN_parameter_847 )

          tree_for_ID140 = @adaptor.create_with_payload( __ID140__ )
          @adaptor.add_child( root_0, tree_for_ID140 )

          string_literal141 = match( T__39, TOKENS_FOLLOWING_T__39_IN_parameter_849 )

          tree_for_string_literal141 = @adaptor.create_with_payload( string_literal141 )
          @adaptor.add_child( root_0, tree_for_string_literal141 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_parameter_851 )
          path142 = path
          @state.following.pop
          @adaptor.add_child( root_0, path142.tree )
          # --> action

          			@now[__ID140__.text] = { '_context' => 'all',
          				'_isa' => self.to_ref(( path142 && @input.to_s( path142.start, path142.stop ) )),
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
    # 276:1: conditions : 'conditions' '{' ( NL )* constraint_body '}' ( NL )+ ;
    # 
    def conditions
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
      return_value = ConditionsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal143 = nil
      char_literal144 = nil
      __NL145__ = nil
      char_literal147 = nil
      __NL148__ = nil
      constraint_body146 = nil

      tree_for_string_literal143 = nil
      tree_for_char_literal144 = nil
      tree_for_NL145 = nil
      tree_for_char_literal147 = nil
      tree_for_NL148 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 277:4: 'conditions' '{' ( NL )* constraint_body '}' ( NL )+
        string_literal143 = match( T__33, TOKENS_FOLLOWING_T__33_IN_conditions_866 )

        tree_for_string_literal143 = @adaptor.create_with_payload( string_literal143 )
        @adaptor.add_child( root_0, tree_for_string_literal143 )

        # --> action

        			@now['_conditions']['_parent'] = @now
        			@now = @now['_conditions']
        		
        # <-- action
        char_literal144 = match( T__20, TOKENS_FOLLOWING_T__20_IN_conditions_874 )

        tree_for_char_literal144 = @adaptor.create_with_payload( char_literal144 )
        @adaptor.add_child( root_0, tree_for_char_literal144 )

        # at line 282:7: ( NL )*
        while true # decision 60
          alt_60 = 2
          look_60_0 = @input.peek( 1 )

          if ( look_60_0 == NL )
            alt_60 = 1

          end
          case alt_60
          when 1
            # at line 282:7: NL
            __NL145__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditions_876 )

            tree_for_NL145 = @adaptor.create_with_payload( __NL145__ )
            @adaptor.add_child( root_0, tree_for_NL145 )


          else
            break # out of loop for decision 60
          end
        end # loop for decision 60
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_conditions_879 )
        constraint_body146 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body146.tree )
        char_literal147 = match( T__21, TOKENS_FOLLOWING_T__21_IN_conditions_881 )

        tree_for_char_literal147 = @adaptor.create_with_payload( char_literal147 )
        @adaptor.add_child( root_0, tree_for_char_literal147 )

        # at file 282:31: ( NL )+
        match_count_61 = 0
        while true
          alt_61 = 2
          look_61_0 = @input.peek( 1 )

          if ( look_61_0 == NL )
            alt_61 = 1

          end
          case alt_61
          when 1
            # at line 282:31: NL
            __NL148__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditions_883 )

            tree_for_NL148 = @adaptor.create_with_payload( __NL148__ )
            @adaptor.add_child( root_0, tree_for_NL148 )


          else
            match_count_61 > 0 and break
            eee = EarlyExit(61)


            raise eee
          end
          match_count_61 += 1
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
    # 287:1: effects : 'effects' '{' ( NL )* mutation_body '}' ( NL )+ ;
    # 
    def effects
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = EffectsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal149 = nil
      char_literal150 = nil
      __NL151__ = nil
      char_literal153 = nil
      __NL154__ = nil
      mutation_body152 = nil

      tree_for_string_literal149 = nil
      tree_for_char_literal150 = nil
      tree_for_NL151 = nil
      tree_for_char_literal153 = nil
      tree_for_NL154 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 288:4: 'effects' '{' ( NL )* mutation_body '}' ( NL )+
        string_literal149 = match( T__34, TOKENS_FOLLOWING_T__34_IN_effects_900 )

        tree_for_string_literal149 = @adaptor.create_with_payload( string_literal149 )
        @adaptor.add_child( root_0, tree_for_string_literal149 )

        # --> action

        			@now['_effects']['_parent'] = @now
        			@now = @now['_effects']
        		
        # <-- action
        char_literal150 = match( T__20, TOKENS_FOLLOWING_T__20_IN_effects_908 )

        tree_for_char_literal150 = @adaptor.create_with_payload( char_literal150 )
        @adaptor.add_child( root_0, tree_for_char_literal150 )

        # at line 293:7: ( NL )*
        while true # decision 62
          alt_62 = 2
          look_62_0 = @input.peek( 1 )

          if ( look_62_0 == NL )
            alt_62 = 1

          end
          case alt_62
          when 1
            # at line 293:7: NL
            __NL151__ = match( NL, TOKENS_FOLLOWING_NL_IN_effects_910 )

            tree_for_NL151 = @adaptor.create_with_payload( __NL151__ )
            @adaptor.add_child( root_0, tree_for_NL151 )


          else
            break # out of loop for decision 62
          end
        end # loop for decision 62
        @state.following.push( TOKENS_FOLLOWING_mutation_body_IN_effects_916 )
        mutation_body152 = mutation_body
        @state.following.pop
        @adaptor.add_child( root_0, mutation_body152.tree )
        char_literal153 = match( T__21, TOKENS_FOLLOWING_T__21_IN_effects_921 )

        tree_for_char_literal153 = @adaptor.create_with_payload( char_literal153 )
        @adaptor.add_child( root_0, tree_for_char_literal153 )

        # at file 295:7: ( NL )+
        match_count_63 = 0
        while true
          alt_63 = 2
          look_63_0 = @input.peek( 1 )

          if ( look_63_0 == NL )
            alt_63 = 1

          end
          case alt_63
          when 1
            # at line 295:7: NL
            __NL154__ = match( NL, TOKENS_FOLLOWING_NL_IN_effects_923 )

            tree_for_NL154 = @adaptor.create_with_payload( __NL154__ )
            @adaptor.add_child( root_0, tree_for_NL154 )


          else
            match_count_63 > 0 and break
            eee = EarlyExit(63)


            raise eee
          end
          match_count_63 += 1
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

    GoalConstraintReturnValue = define_return_scope 

    # 
    # parser rule goal_constraint
    # 
    # (in SFP.g)
    # 299:1: goal_constraint : 'goal' ( 'constraint' )? ( NL )* '{' ( NL )* ( goal_body )* '}' ( NL )+ ;
    # 
    def goal_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = GoalConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal155 = nil
      string_literal156 = nil
      __NL157__ = nil
      char_literal158 = nil
      __NL159__ = nil
      char_literal161 = nil
      __NL162__ = nil
      goal_body160 = nil

      tree_for_string_literal155 = nil
      tree_for_string_literal156 = nil
      tree_for_NL157 = nil
      tree_for_char_literal158 = nil
      tree_for_NL159 = nil
      tree_for_char_literal161 = nil
      tree_for_NL162 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 300:4: 'goal' ( 'constraint' )? ( NL )* '{' ( NL )* ( goal_body )* '}' ( NL )+
        string_literal155 = match( T__40, TOKENS_FOLLOWING_T__40_IN_goal_constraint_939 )

        tree_for_string_literal155 = @adaptor.create_with_payload( string_literal155 )
        @adaptor.add_child( root_0, tree_for_string_literal155 )

        # at line 300:11: ( 'constraint' )?
        alt_64 = 2
        look_64_0 = @input.peek( 1 )

        if ( look_64_0 == T__41 )
          alt_64 = 1
        end
        case alt_64
        when 1
          # at line 300:11: 'constraint'
          string_literal156 = match( T__41, TOKENS_FOLLOWING_T__41_IN_goal_constraint_941 )

          tree_for_string_literal156 = @adaptor.create_with_payload( string_literal156 )
          @adaptor.add_child( root_0, tree_for_string_literal156 )


        end
        # at line 300:25: ( NL )*
        while true # decision 65
          alt_65 = 2
          look_65_0 = @input.peek( 1 )

          if ( look_65_0 == NL )
            alt_65 = 1

          end
          case alt_65
          when 1
            # at line 300:25: NL
            __NL157__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_constraint_944 )

            tree_for_NL157 = @adaptor.create_with_payload( __NL157__ )
            @adaptor.add_child( root_0, tree_for_NL157 )


          else
            break # out of loop for decision 65
          end
        end # loop for decision 65
        # --> action

        			@now['goal'] = { '_self' => 'goal',
        				'_context' => 'constraint',
        				'_type' => 'and',
        				'_parent' => @now
        			}
        			@now = @now['goal']
        		
        # <-- action
        char_literal158 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_constraint_953 )

        tree_for_char_literal158 = @adaptor.create_with_payload( char_literal158 )
        @adaptor.add_child( root_0, tree_for_char_literal158 )

        # at line 309:7: ( NL )*
        while true # decision 66
          alt_66 = 2
          look_66_0 = @input.peek( 1 )

          if ( look_66_0 == NL )
            alt_66 = 1

          end
          case alt_66
          when 1
            # at line 309:7: NL
            __NL159__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_constraint_955 )

            tree_for_NL159 = @adaptor.create_with_payload( __NL159__ )
            @adaptor.add_child( root_0, tree_for_NL159 )


          else
            break # out of loop for decision 66
          end
        end # loop for decision 66
        # at line 309:11: ( goal_body )*
        while true # decision 67
          alt_67 = 2
          look_67_0 = @input.peek( 1 )

          if ( look_67_0 == ID || look_67_0 == T__28 || look_67_0.between?( T__42, T__47 ) || look_67_0.between?( T__49, T__51 ) || look_67_0 == T__58 )
            alt_67 = 1

          end
          case alt_67
          when 1
            # at line 309:11: goal_body
            @state.following.push( TOKENS_FOLLOWING_goal_body_IN_goal_constraint_958 )
            goal_body160 = goal_body
            @state.following.pop
            @adaptor.add_child( root_0, goal_body160.tree )

          else
            break # out of loop for decision 67
          end
        end # loop for decision 67
        char_literal161 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_constraint_961 )

        tree_for_char_literal161 = @adaptor.create_with_payload( char_literal161 )
        @adaptor.add_child( root_0, tree_for_char_literal161 )

        # at file 309:26: ( NL )+
        match_count_68 = 0
        while true
          alt_68 = 2
          look_68_0 = @input.peek( 1 )

          if ( look_68_0 == NL )
            alt_68 = 1

          end
          case alt_68
          when 1
            # at line 309:26: NL
            __NL162__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_constraint_963 )

            tree_for_NL162 = @adaptor.create_with_payload( __NL162__ )
            @adaptor.add_child( root_0, tree_for_NL162 )


          else
            match_count_68 > 0 and break
            eee = EarlyExit(68)


            raise eee
          end
          match_count_68 += 1
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

    GoalBodyReturnValue = define_return_scope 

    # 
    # parser rule goal_body
    # 
    # (in SFP.g)
    # 313:1: goal_body : ( ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ ) | 'always' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'sometime' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'within' NUMBER ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'after' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* ( 'then' | 'within' NUMBER ) ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'before' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ );
    # 
    def goal_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = GoalBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL167__ = nil
      string_literal168 = nil
      __NL169__ = nil
      char_literal170 = nil
      __NL171__ = nil
      char_literal173 = nil
      __NL174__ = nil
      string_literal175 = nil
      __NL176__ = nil
      char_literal177 = nil
      __NL178__ = nil
      char_literal180 = nil
      __NL181__ = nil
      string_literal182 = nil
      __NUMBER183__ = nil
      __NL184__ = nil
      char_literal185 = nil
      __NL186__ = nil
      char_literal188 = nil
      __NL189__ = nil
      string_literal190 = nil
      __NL191__ = nil
      char_literal192 = nil
      __NL193__ = nil
      char_literal195 = nil
      __NL196__ = nil
      string_literal197 = nil
      string_literal198 = nil
      __NUMBER199__ = nil
      __NL200__ = nil
      char_literal201 = nil
      __NL202__ = nil
      char_literal204 = nil
      __NL205__ = nil
      string_literal206 = nil
      __NL207__ = nil
      char_literal208 = nil
      __NL209__ = nil
      char_literal211 = nil
      __NL212__ = nil
      string_literal213 = nil
      __NL214__ = nil
      char_literal215 = nil
      __NL216__ = nil
      char_literal218 = nil
      __NL219__ = nil
      constraint_statement163 = nil
      constraint_namespace164 = nil
      constraint_iterator165 = nil
      constraint_class_quantification166 = nil
      constraint_body172 = nil
      constraint_body179 = nil
      constraint_body187 = nil
      constraint_body194 = nil
      constraint_body203 = nil
      constraint_body210 = nil
      constraint_body217 = nil

      tree_for_NL167 = nil
      tree_for_string_literal168 = nil
      tree_for_NL169 = nil
      tree_for_char_literal170 = nil
      tree_for_NL171 = nil
      tree_for_char_literal173 = nil
      tree_for_NL174 = nil
      tree_for_string_literal175 = nil
      tree_for_NL176 = nil
      tree_for_char_literal177 = nil
      tree_for_NL178 = nil
      tree_for_char_literal180 = nil
      tree_for_NL181 = nil
      tree_for_string_literal182 = nil
      tree_for_NUMBER183 = nil
      tree_for_NL184 = nil
      tree_for_char_literal185 = nil
      tree_for_NL186 = nil
      tree_for_char_literal188 = nil
      tree_for_NL189 = nil
      tree_for_string_literal190 = nil
      tree_for_NL191 = nil
      tree_for_char_literal192 = nil
      tree_for_NL193 = nil
      tree_for_char_literal195 = nil
      tree_for_NL196 = nil
      tree_for_string_literal197 = nil
      tree_for_string_literal198 = nil
      tree_for_NUMBER199 = nil
      tree_for_NL200 = nil
      tree_for_char_literal201 = nil
      tree_for_NL202 = nil
      tree_for_char_literal204 = nil
      tree_for_NL205 = nil
      tree_for_string_literal206 = nil
      tree_for_NL207 = nil
      tree_for_char_literal208 = nil
      tree_for_NL209 = nil
      tree_for_char_literal211 = nil
      tree_for_NL212 = nil
      tree_for_string_literal213 = nil
      tree_for_NL214 = nil
      tree_for_char_literal215 = nil
      tree_for_NL216 = nil
      tree_for_char_literal218 = nil
      tree_for_NL219 = nil

      begin
        # at line 314:2: ( ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ ) | 'always' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'sometime' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'within' NUMBER ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'after' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* ( 'then' | 'within' NUMBER ) ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'before' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ )
        alt_93 = 6
        case look_93 = @input.peek( 1 )
        when ID, T__28, T__47, T__49, T__50, T__51, T__58 then alt_93 = 1
        when T__42 then alt_93 = 2
        when T__43 then alt_93 = 3
        when T__44 then alt_93 = 4
        when T__45 then alt_93 = 5
        when T__46 then alt_93 = 6
        else
          raise NoViableAlternative( "", 93, 0 )
        end
        case alt_93
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 314:4: ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )
          # at line 314:4: ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )
          # at line 315:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+
          # at line 315:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification )
          alt_69 = 4
          alt_69 = @dfa69.predict( @input )
          case alt_69
          when 1
            # at line 315:6: constraint_statement
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_goal_body_986 )
            constraint_statement163 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement163.tree )
            # --> action

            					@now[( constraint_statement163.nil? ? nil : constraint_statement163.key )] = ( constraint_statement163.nil? ? nil : constraint_statement163.val )
            				
            # <-- action

          when 2
            # at line 319:6: constraint_namespace
            @state.following.push( TOKENS_FOLLOWING_constraint_namespace_IN_goal_body_999 )
            constraint_namespace164 = constraint_namespace
            @state.following.pop
            @adaptor.add_child( root_0, constraint_namespace164.tree )

          when 3
            # at line 320:6: constraint_iterator
            @state.following.push( TOKENS_FOLLOWING_constraint_iterator_IN_goal_body_1006 )
            constraint_iterator165 = constraint_iterator
            @state.following.pop
            @adaptor.add_child( root_0, constraint_iterator165.tree )

          when 4
            # at line 321:6: constraint_class_quantification
            @state.following.push( TOKENS_FOLLOWING_constraint_class_quantification_IN_goal_body_1013 )
            constraint_class_quantification166 = constraint_class_quantification
            @state.following.pop
            @adaptor.add_child( root_0, constraint_class_quantification166.tree )

          end
          # at file 323:3: ( NL )+
          match_count_70 = 0
          while true
            alt_70 = 2
            look_70_0 = @input.peek( 1 )

            if ( look_70_0 == NL )
              alt_70 = 1

            end
            case alt_70
            when 1
              # at line 323:3: NL
              __NL167__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1022 )

              tree_for_NL167 = @adaptor.create_with_payload( __NL167__ )
              @adaptor.add_child( root_0, tree_for_NL167 )


            else
              match_count_70 > 0 and break
              eee = EarlyExit(70)


              raise eee
            end
            match_count_70 += 1
          end



        when 2
          root_0 = @adaptor.create_flat_list


          # at line 324:4: 'always' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal168 = match( T__42, TOKENS_FOLLOWING_T__42_IN_goal_body_1029 )

          tree_for_string_literal168 = @adaptor.create_with_payload( string_literal168 )
          @adaptor.add_child( root_0, tree_for_string_literal168 )

          # at line 324:13: ( NL )*
          while true # decision 71
            alt_71 = 2
            look_71_0 = @input.peek( 1 )

            if ( look_71_0 == NL )
              alt_71 = 1

            end
            case alt_71
            when 1
              # at line 324:13: NL
              __NL169__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1031 )

              tree_for_NL169 = @adaptor.create_with_payload( __NL169__ )
              @adaptor.add_child( root_0, tree_for_NL169 )


            else
              break # out of loop for decision 71
            end
          end # loop for decision 71
          # --> action

          			@now['always'] = self.create_constraint('always', 'and') if
          				not @now.has_key?('always')
          			@now = @now['always']
          		
          # <-- action
          char_literal170 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1040 )

          tree_for_char_literal170 = @adaptor.create_with_payload( char_literal170 )
          @adaptor.add_child( root_0, tree_for_char_literal170 )

          # at line 330:7: ( NL )*
          while true # decision 72
            alt_72 = 2
            look_72_0 = @input.peek( 1 )

            if ( look_72_0 == NL )
              alt_72 = 1

            end
            case alt_72
            when 1
              # at line 330:7: NL
              __NL171__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1042 )

              tree_for_NL171 = @adaptor.create_with_payload( __NL171__ )
              @adaptor.add_child( root_0, tree_for_NL171 )


            else
              break # out of loop for decision 72
            end
          end # loop for decision 72
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1045 )
          constraint_body172 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body172.tree )
          char_literal173 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1047 )

          tree_for_char_literal173 = @adaptor.create_with_payload( char_literal173 )
          @adaptor.add_child( root_0, tree_for_char_literal173 )

          # at file 330:31: ( NL )+
          match_count_73 = 0
          while true
            alt_73 = 2
            look_73_0 = @input.peek( 1 )

            if ( look_73_0 == NL )
              alt_73 = 1

            end
            case alt_73
            when 1
              # at line 330:31: NL
              __NL174__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1049 )

              tree_for_NL174 = @adaptor.create_with_payload( __NL174__ )
              @adaptor.add_child( root_0, tree_for_NL174 )


            else
              match_count_73 > 0 and break
              eee = EarlyExit(73)


              raise eee
            end
            match_count_73 += 1
          end

          # --> action
          	self.goto_parent()	
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 332:4: 'sometime' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal175 = match( T__43, TOKENS_FOLLOWING_T__43_IN_goal_body_1059 )

          tree_for_string_literal175 = @adaptor.create_with_payload( string_literal175 )
          @adaptor.add_child( root_0, tree_for_string_literal175 )

          # at line 332:15: ( NL )*
          while true # decision 74
            alt_74 = 2
            look_74_0 = @input.peek( 1 )

            if ( look_74_0 == NL )
              alt_74 = 1

            end
            case alt_74
            when 1
              # at line 332:15: NL
              __NL176__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1061 )

              tree_for_NL176 = @adaptor.create_with_payload( __NL176__ )
              @adaptor.add_child( root_0, tree_for_NL176 )


            else
              break # out of loop for decision 74
            end
          end # loop for decision 74
          # --> action

          			@now['sometime'] = self.create_constraint('sometime', 'or') if
          				not @now.has_key?('sometime')
          			@now = @now['sometime']
          			id = self.next_id.to_s
          			@now[id] = self.create_constraint(id, 'and')
          			@now = @now[id]
          		
          # <-- action
          char_literal177 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1070 )

          tree_for_char_literal177 = @adaptor.create_with_payload( char_literal177 )
          @adaptor.add_child( root_0, tree_for_char_literal177 )

          # at line 341:7: ( NL )*
          while true # decision 75
            alt_75 = 2
            look_75_0 = @input.peek( 1 )

            if ( look_75_0 == NL )
              alt_75 = 1

            end
            case alt_75
            when 1
              # at line 341:7: NL
              __NL178__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1072 )

              tree_for_NL178 = @adaptor.create_with_payload( __NL178__ )
              @adaptor.add_child( root_0, tree_for_NL178 )


            else
              break # out of loop for decision 75
            end
          end # loop for decision 75
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1075 )
          constraint_body179 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body179.tree )
          char_literal180 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1077 )

          tree_for_char_literal180 = @adaptor.create_with_payload( char_literal180 )
          @adaptor.add_child( root_0, tree_for_char_literal180 )

          # at file 341:31: ( NL )+
          match_count_76 = 0
          while true
            alt_76 = 2
            look_76_0 = @input.peek( 1 )

            if ( look_76_0 == NL )
              alt_76 = 1

            end
            case alt_76
            when 1
              # at line 341:31: NL
              __NL181__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1079 )

              tree_for_NL181 = @adaptor.create_with_payload( __NL181__ )
              @adaptor.add_child( root_0, tree_for_NL181 )


            else
              match_count_76 > 0 and break
              eee = EarlyExit(76)


              raise eee
            end
            match_count_76 += 1
          end

          # --> action
          	self.goto_parent()	
          # <-- action
          # --> action
          	self.goto_parent()	
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 344:4: 'within' NUMBER ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal182 = match( T__44, TOKENS_FOLLOWING_T__44_IN_goal_body_1093 )

          tree_for_string_literal182 = @adaptor.create_with_payload( string_literal182 )
          @adaptor.add_child( root_0, tree_for_string_literal182 )

          __NUMBER183__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_goal_body_1095 )

          tree_for_NUMBER183 = @adaptor.create_with_payload( __NUMBER183__ )
          @adaptor.add_child( root_0, tree_for_NUMBER183 )

          # at line 344:20: ( NL )*
          while true # decision 77
            alt_77 = 2
            look_77_0 = @input.peek( 1 )

            if ( look_77_0 == NL )
              alt_77 = 1

            end
            case alt_77
            when 1
              # at line 344:20: NL
              __NL184__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1097 )

              tree_for_NL184 = @adaptor.create_with_payload( __NL184__ )
              @adaptor.add_child( root_0, tree_for_NL184 )


            else
              break # out of loop for decision 77
            end
          end # loop for decision 77
          # --> action

          			id = self.next_id.to_s
          			@now[id] = self.create_constraint(id, 'within')
          			@now = @now[id]
          			@now['deadline'] = __NUMBER183__.text.to_s.to_i
          		
          # <-- action
          char_literal185 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1106 )

          tree_for_char_literal185 = @adaptor.create_with_payload( char_literal185 )
          @adaptor.add_child( root_0, tree_for_char_literal185 )

          # at line 351:7: ( NL )*
          while true # decision 78
            alt_78 = 2
            look_78_0 = @input.peek( 1 )

            if ( look_78_0 == NL )
              alt_78 = 1

            end
            case alt_78
            when 1
              # at line 351:7: NL
              __NL186__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1108 )

              tree_for_NL186 = @adaptor.create_with_payload( __NL186__ )
              @adaptor.add_child( root_0, tree_for_NL186 )


            else
              break # out of loop for decision 78
            end
          end # loop for decision 78
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1111 )
          constraint_body187 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body187.tree )
          char_literal188 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1113 )

          tree_for_char_literal188 = @adaptor.create_with_payload( char_literal188 )
          @adaptor.add_child( root_0, tree_for_char_literal188 )

          # at file 351:31: ( NL )+
          match_count_79 = 0
          while true
            alt_79 = 2
            look_79_0 = @input.peek( 1 )

            if ( look_79_0 == NL )
              alt_79 = 1

            end
            case alt_79
            when 1
              # at line 351:31: NL
              __NL189__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1115 )

              tree_for_NL189 = @adaptor.create_with_payload( __NL189__ )
              @adaptor.add_child( root_0, tree_for_NL189 )


            else
              match_count_79 > 0 and break
              eee = EarlyExit(79)


              raise eee
            end
            match_count_79 += 1
          end

          # --> action
          	self.goto_parent()	
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 353:4: 'after' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* ( 'then' | 'within' NUMBER ) ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal190 = match( T__45, TOKENS_FOLLOWING_T__45_IN_goal_body_1125 )

          tree_for_string_literal190 = @adaptor.create_with_payload( string_literal190 )
          @adaptor.add_child( root_0, tree_for_string_literal190 )

          # at line 353:12: ( NL )*
          while true # decision 80
            alt_80 = 2
            look_80_0 = @input.peek( 1 )

            if ( look_80_0 == NL )
              alt_80 = 1

            end
            case alt_80
            when 1
              # at line 353:12: NL
              __NL191__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1127 )

              tree_for_NL191 = @adaptor.create_with_payload( __NL191__ )
              @adaptor.add_child( root_0, tree_for_NL191 )


            else
              break # out of loop for decision 80
            end
          end # loop for decision 80
          # --> action

          			@now['sometime-after'] = self.create_constraint('sometime-after', 'or') if
          				not @now.has_key?('sometime-after')
          			@now = @now['sometime-after']

          			id = self.next_id.to_s
          			@now[id] = self.create_constraint(id, 'sometime-after')
          			@now = @now[id]
          			@now['after'] = self.create_constraint('after')
          			@now['deadline'] = -1
          			@now = @now['after']
          		
          # <-- action
          char_literal192 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1136 )

          tree_for_char_literal192 = @adaptor.create_with_payload( char_literal192 )
          @adaptor.add_child( root_0, tree_for_char_literal192 )

          # at line 366:7: ( NL )*
          while true # decision 81
            alt_81 = 2
            look_81_0 = @input.peek( 1 )

            if ( look_81_0 == NL )
              alt_81 = 1

            end
            case alt_81
            when 1
              # at line 366:7: NL
              __NL193__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1138 )

              tree_for_NL193 = @adaptor.create_with_payload( __NL193__ )
              @adaptor.add_child( root_0, tree_for_NL193 )


            else
              break # out of loop for decision 81
            end
          end # loop for decision 81
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1141 )
          constraint_body194 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body194.tree )
          char_literal195 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1143 )

          tree_for_char_literal195 = @adaptor.create_with_payload( char_literal195 )
          @adaptor.add_child( root_0, tree_for_char_literal195 )

          # at line 366:31: ( NL )*
          while true # decision 82
            alt_82 = 2
            look_82_0 = @input.peek( 1 )

            if ( look_82_0 == NL )
              alt_82 = 1

            end
            case alt_82
            when 1
              # at line 366:31: NL
              __NL196__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1145 )

              tree_for_NL196 = @adaptor.create_with_payload( __NL196__ )
              @adaptor.add_child( root_0, tree_for_NL196 )


            else
              break # out of loop for decision 82
            end
          end # loop for decision 82
          # --> action
          	self.goto_parent()	
          # <-- action
          # at line 368:3: ( 'then' | 'within' NUMBER )
          alt_83 = 2
          look_83_0 = @input.peek( 1 )

          if ( look_83_0 == T__29 )
            alt_83 = 1
          elsif ( look_83_0 == T__44 )
            alt_83 = 2
          else
            raise NoViableAlternative( "", 83, 0 )
          end
          case alt_83
          when 1
            # at line 368:5: 'then'
            string_literal197 = match( T__29, TOKENS_FOLLOWING_T__29_IN_goal_body_1156 )

            tree_for_string_literal197 = @adaptor.create_with_payload( string_literal197 )
            @adaptor.add_child( root_0, tree_for_string_literal197 )


          when 2
            # at line 369:6: 'within' NUMBER
            string_literal198 = match( T__44, TOKENS_FOLLOWING_T__44_IN_goal_body_1163 )

            tree_for_string_literal198 = @adaptor.create_with_payload( string_literal198 )
            @adaptor.add_child( root_0, tree_for_string_literal198 )

            __NUMBER199__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_goal_body_1165 )

            tree_for_NUMBER199 = @adaptor.create_with_payload( __NUMBER199__ )
            @adaptor.add_child( root_0, tree_for_NUMBER199 )

            # --> action
             @now['deadline'] = __NUMBER199__.text.to_s.to_i 
            # <-- action

          end
          # at line 371:5: ( NL )*
          while true # decision 84
            alt_84 = 2
            look_84_0 = @input.peek( 1 )

            if ( look_84_0 == NL )
              alt_84 = 1

            end
            case alt_84
            when 1
              # at line 371:5: NL
              __NL200__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1177 )

              tree_for_NL200 = @adaptor.create_with_payload( __NL200__ )
              @adaptor.add_child( root_0, tree_for_NL200 )


            else
              break # out of loop for decision 84
            end
          end # loop for decision 84
          # --> action

          			@now['then'] = self.create_constraint('then')
          			@now = @now['then']
          		
          # <-- action
          char_literal201 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1186 )

          tree_for_char_literal201 = @adaptor.create_with_payload( char_literal201 )
          @adaptor.add_child( root_0, tree_for_char_literal201 )

          # at line 376:7: ( NL )*
          while true # decision 85
            alt_85 = 2
            look_85_0 = @input.peek( 1 )

            if ( look_85_0 == NL )
              alt_85 = 1

            end
            case alt_85
            when 1
              # at line 376:7: NL
              __NL202__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1188 )

              tree_for_NL202 = @adaptor.create_with_payload( __NL202__ )
              @adaptor.add_child( root_0, tree_for_NL202 )


            else
              break # out of loop for decision 85
            end
          end # loop for decision 85
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1191 )
          constraint_body203 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body203.tree )
          char_literal204 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1193 )

          tree_for_char_literal204 = @adaptor.create_with_payload( char_literal204 )
          @adaptor.add_child( root_0, tree_for_char_literal204 )

          # at file 376:31: ( NL )+
          match_count_86 = 0
          while true
            alt_86 = 2
            look_86_0 = @input.peek( 1 )

            if ( look_86_0 == NL )
              alt_86 = 1

            end
            case alt_86
            when 1
              # at line 376:31: NL
              __NL205__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1195 )

              tree_for_NL205 = @adaptor.create_with_payload( __NL205__ )
              @adaptor.add_child( root_0, tree_for_NL205 )


            else
              match_count_86 > 0 and break
              eee = EarlyExit(86)


              raise eee
            end
            match_count_86 += 1
          end

          # --> action
          	self.goto_parent()	
          # <-- action
          # --> action
          	self.goto_parent()	
          # <-- action
          # --> action
          	self.goto_parent()	
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 380:4: 'before' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal206 = match( T__46, TOKENS_FOLLOWING_T__46_IN_goal_body_1213 )

          tree_for_string_literal206 = @adaptor.create_with_payload( string_literal206 )
          @adaptor.add_child( root_0, tree_for_string_literal206 )

          # at line 380:13: ( NL )*
          while true # decision 87
            alt_87 = 2
            look_87_0 = @input.peek( 1 )

            if ( look_87_0 == NL )
              alt_87 = 1

            end
            case alt_87
            when 1
              # at line 380:13: NL
              __NL207__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1215 )

              tree_for_NL207 = @adaptor.create_with_payload( __NL207__ )
              @adaptor.add_child( root_0, tree_for_NL207 )


            else
              break # out of loop for decision 87
            end
          end # loop for decision 87
          # --> action

          			id = self.next_id.to_s
          			@now[id] = self.create_constraint(id, 'sometime-before')
          			@now = @now[id]
          			@now['before'] = self.create_constraint('before')
          			@now = @now['before']
          		
          # <-- action
          char_literal208 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1224 )

          tree_for_char_literal208 = @adaptor.create_with_payload( char_literal208 )
          @adaptor.add_child( root_0, tree_for_char_literal208 )

          # at line 388:7: ( NL )*
          while true # decision 88
            alt_88 = 2
            look_88_0 = @input.peek( 1 )

            if ( look_88_0 == NL )
              alt_88 = 1

            end
            case alt_88
            when 1
              # at line 388:7: NL
              __NL209__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1226 )

              tree_for_NL209 = @adaptor.create_with_payload( __NL209__ )
              @adaptor.add_child( root_0, tree_for_NL209 )


            else
              break # out of loop for decision 88
            end
          end # loop for decision 88
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1229 )
          constraint_body210 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body210.tree )
          char_literal211 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1231 )

          tree_for_char_literal211 = @adaptor.create_with_payload( char_literal211 )
          @adaptor.add_child( root_0, tree_for_char_literal211 )

          # at line 388:31: ( NL )*
          while true # decision 89
            alt_89 = 2
            look_89_0 = @input.peek( 1 )

            if ( look_89_0 == NL )
              alt_89 = 1

            end
            case alt_89
            when 1
              # at line 388:31: NL
              __NL212__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1233 )

              tree_for_NL212 = @adaptor.create_with_payload( __NL212__ )
              @adaptor.add_child( root_0, tree_for_NL212 )


            else
              break # out of loop for decision 89
            end
          end # loop for decision 89
          # --> action
          	self.goto_parent()	
          # <-- action
          string_literal213 = match( T__29, TOKENS_FOLLOWING_T__29_IN_goal_body_1242 )

          tree_for_string_literal213 = @adaptor.create_with_payload( string_literal213 )
          @adaptor.add_child( root_0, tree_for_string_literal213 )

          # at line 390:10: ( NL )*
          while true # decision 90
            alt_90 = 2
            look_90_0 = @input.peek( 1 )

            if ( look_90_0 == NL )
              alt_90 = 1

            end
            case alt_90
            when 1
              # at line 390:10: NL
              __NL214__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1244 )

              tree_for_NL214 = @adaptor.create_with_payload( __NL214__ )
              @adaptor.add_child( root_0, tree_for_NL214 )


            else
              break # out of loop for decision 90
            end
          end # loop for decision 90
          # --> action

          			@now['then'] = self.create_constraint('then')
          			@now = @now['then']
          		
          # <-- action
          char_literal215 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1253 )

          tree_for_char_literal215 = @adaptor.create_with_payload( char_literal215 )
          @adaptor.add_child( root_0, tree_for_char_literal215 )

          # at line 395:7: ( NL )*
          while true # decision 91
            alt_91 = 2
            look_91_0 = @input.peek( 1 )

            if ( look_91_0 == NL )
              alt_91 = 1

            end
            case alt_91
            when 1
              # at line 395:7: NL
              __NL216__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1255 )

              tree_for_NL216 = @adaptor.create_with_payload( __NL216__ )
              @adaptor.add_child( root_0, tree_for_NL216 )


            else
              break # out of loop for decision 91
            end
          end # loop for decision 91
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1258 )
          constraint_body217 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body217.tree )
          char_literal218 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1260 )

          tree_for_char_literal218 = @adaptor.create_with_payload( char_literal218 )
          @adaptor.add_child( root_0, tree_for_char_literal218 )

          # at file 395:31: ( NL )+
          match_count_92 = 0
          while true
            alt_92 = 2
            look_92_0 = @input.peek( 1 )

            if ( look_92_0 == NL )
              alt_92 = 1

            end
            case alt_92
            when 1
              # at line 395:31: NL
              __NL219__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1262 )

              tree_for_NL219 = @adaptor.create_with_payload( __NL219__ )
              @adaptor.add_child( root_0, tree_for_NL219 )


            else
              match_count_92 > 0 and break
              eee = EarlyExit(92)


              raise eee
            end
            match_count_92 += 1
          end

          # --> action
          	self.goto_parent()	
          # <-- action
          # --> action
          	self.goto_parent()	
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
        # trace_out( __method__, 26 )

      end
      
      return return_value
    end

    NestedConstraintReturnValue = define_return_scope 

    # 
    # parser rule nested_constraint
    # 
    # (in SFP.g)
    # 400:1: nested_constraint : '{' ( NL )* constraint_body '}' ;
    # 
    def nested_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = NestedConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal220 = nil
      __NL221__ = nil
      char_literal223 = nil
      constraint_body222 = nil

      tree_for_char_literal220 = nil
      tree_for_NL221 = nil
      tree_for_char_literal223 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 401:4: '{' ( NL )* constraint_body '}'
        char_literal220 = match( T__20, TOKENS_FOLLOWING_T__20_IN_nested_constraint_1282 )

        tree_for_char_literal220 = @adaptor.create_with_payload( char_literal220 )
        @adaptor.add_child( root_0, tree_for_char_literal220 )

        # at line 401:8: ( NL )*
        while true # decision 94
          alt_94 = 2
          look_94_0 = @input.peek( 1 )

          if ( look_94_0 == NL )
            alt_94 = 1

          end
          case alt_94
          when 1
            # at line 401:8: NL
            __NL221__ = match( NL, TOKENS_FOLLOWING_NL_IN_nested_constraint_1284 )

            tree_for_NL221 = @adaptor.create_with_payload( __NL221__ )
            @adaptor.add_child( root_0, tree_for_NL221 )


          else
            break # out of loop for decision 94
          end
        end # loop for decision 94
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_nested_constraint_1287 )
        constraint_body222 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body222.tree )
        char_literal223 = match( T__21, TOKENS_FOLLOWING_T__21_IN_nested_constraint_1289 )

        tree_for_char_literal223 = @adaptor.create_with_payload( char_literal223 )
        @adaptor.add_child( root_0, tree_for_char_literal223 )

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

    ConstraintReturnValue = define_return_scope 

    # 
    # parser rule constraint
    # 
    # (in SFP.g)
    # 404:1: constraint : ID 'constraint' '{' ( NL )* constraint_body '}' ( NL )+ ;
    # 
    def constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = ConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID224__ = nil
      string_literal225 = nil
      char_literal226 = nil
      __NL227__ = nil
      char_literal229 = nil
      __NL230__ = nil
      constraint_body228 = nil

      tree_for_ID224 = nil
      tree_for_string_literal225 = nil
      tree_for_char_literal226 = nil
      tree_for_NL227 = nil
      tree_for_char_literal229 = nil
      tree_for_NL230 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 405:4: ID 'constraint' '{' ( NL )* constraint_body '}' ( NL )+
        __ID224__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_1300 )

        tree_for_ID224 = @adaptor.create_with_payload( __ID224__ )
        @adaptor.add_child( root_0, tree_for_ID224 )

        string_literal225 = match( T__41, TOKENS_FOLLOWING_T__41_IN_constraint_1302 )

        tree_for_string_literal225 = @adaptor.create_with_payload( string_literal225 )
        @adaptor.add_child( root_0, tree_for_string_literal225 )

        # --> action

        			@now[__ID224__.text] = { '_self' => __ID224__.text,
        				'_context' => 'constraint',
        				'_type' => 'and',
        				'_parent' => @now
        			}
        			@now = @now[__ID224__.text]
        		
        # <-- action
        char_literal226 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_1310 )

        tree_for_char_literal226 = @adaptor.create_with_payload( char_literal226 )
        @adaptor.add_child( root_0, tree_for_char_literal226 )

        # at line 414:7: ( NL )*
        while true # decision 95
          alt_95 = 2
          look_95_0 = @input.peek( 1 )

          if ( look_95_0 == NL )
            alt_95 = 1

          end
          case alt_95
          when 1
            # at line 414:7: NL
            __NL227__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_1312 )

            tree_for_NL227 = @adaptor.create_with_payload( __NL227__ )
            @adaptor.add_child( root_0, tree_for_NL227 )


          else
            break # out of loop for decision 95
          end
        end # loop for decision 95
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_constraint_1315 )
        constraint_body228 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body228.tree )
        char_literal229 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_1317 )

        tree_for_char_literal229 = @adaptor.create_with_payload( char_literal229 )
        @adaptor.add_child( root_0, tree_for_char_literal229 )

        # at file 414:31: ( NL )+
        match_count_96 = 0
        while true
          alt_96 = 2
          look_96_0 = @input.peek( 1 )

          if ( look_96_0 == NL )
            alt_96 = 1

          end
          case alt_96
          when 1
            # at line 414:31: NL
            __NL230__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_1319 )

            tree_for_NL230 = @adaptor.create_with_payload( __NL230__ )
            @adaptor.add_child( root_0, tree_for_NL230 )


          else
            match_count_96 > 0 and break
            eee = EarlyExit(96)


            raise eee
          end
          match_count_96 += 1
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
        # trace_out( __method__, 28 )

      end
      
      return return_value
    end

    ConstraintBodyReturnValue = define_return_scope 

    # 
    # parser rule constraint_body
    # 
    # (in SFP.g)
    # 418:1: constraint_body : ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )* ;
    # 
    def constraint_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = ConstraintBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL235__ = nil
      constraint_statement231 = nil
      constraint_namespace232 = nil
      constraint_iterator233 = nil
      constraint_class_quantification234 = nil

      tree_for_NL235 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 419:4: ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )*
        # at line 419:4: ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )*
        while true # decision 99
          alt_99 = 2
          look_99_0 = @input.peek( 1 )

          if ( look_99_0 == ID || look_99_0 == T__28 || look_99_0 == T__47 || look_99_0.between?( T__49, T__51 ) || look_99_0 == T__58 )
            alt_99 = 1

          end
          case alt_99
          when 1
            # at line 420:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+
            # at line 420:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification )
            alt_97 = 4
            alt_97 = @dfa97.predict( @input )
            case alt_97
            when 1
              # at line 420:6: constraint_statement
              @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_1342 )
              constraint_statement231 = constraint_statement
              @state.following.pop
              @adaptor.add_child( root_0, constraint_statement231.tree )
              # --> action

              					@now[( constraint_statement231.nil? ? nil : constraint_statement231.key )] = ( constraint_statement231.nil? ? nil : constraint_statement231.val )
              				
              # <-- action

            when 2
              # at line 424:6: constraint_namespace
              @state.following.push( TOKENS_FOLLOWING_constraint_namespace_IN_constraint_body_1355 )
              constraint_namespace232 = constraint_namespace
              @state.following.pop
              @adaptor.add_child( root_0, constraint_namespace232.tree )

            when 3
              # at line 425:6: constraint_iterator
              @state.following.push( TOKENS_FOLLOWING_constraint_iterator_IN_constraint_body_1362 )
              constraint_iterator233 = constraint_iterator
              @state.following.pop
              @adaptor.add_child( root_0, constraint_iterator233.tree )

            when 4
              # at line 426:6: constraint_class_quantification
              @state.following.push( TOKENS_FOLLOWING_constraint_class_quantification_IN_constraint_body_1369 )
              constraint_class_quantification234 = constraint_class_quantification
              @state.following.pop
              @adaptor.add_child( root_0, constraint_class_quantification234.tree )

            end
            # at file 428:3: ( NL )+
            match_count_98 = 0
            while true
              alt_98 = 2
              look_98_0 = @input.peek( 1 )

              if ( look_98_0 == NL )
                alt_98 = 1

              end
              case alt_98
              when 1
                # at line 428:3: NL
                __NL235__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_body_1378 )

                tree_for_NL235 = @adaptor.create_with_payload( __NL235__ )
                @adaptor.add_child( root_0, tree_for_NL235 )


              else
                match_count_98 > 0 and break
                eee = EarlyExit(98)


                raise eee
              end
              match_count_98 += 1
            end


          else
            break # out of loop for decision 99
          end
        end # loop for decision 99
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
        # trace_out( __method__, 29 )

      end
      
      return return_value
    end

    ConstraintNamespaceReturnValue = define_return_scope 

    # 
    # parser rule constraint_namespace
    # 
    # (in SFP.g)
    # 431:1: constraint_namespace : path ( NL )* '{' ( NL )* ( constraint_statement ( NL )+ )* '}' ;
    # 
    def constraint_namespace
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = ConstraintNamespaceReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL237__ = nil
      char_literal238 = nil
      __NL239__ = nil
      __NL241__ = nil
      char_literal242 = nil
      path236 = nil
      constraint_statement240 = nil

      tree_for_NL237 = nil
      tree_for_char_literal238 = nil
      tree_for_NL239 = nil
      tree_for_NL241 = nil
      tree_for_char_literal242 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 432:4: path ( NL )* '{' ( NL )* ( constraint_statement ( NL )+ )* '}'
        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_namespace_1392 )
        path236 = path
        @state.following.pop
        @adaptor.add_child( root_0, path236.tree )
        # at line 432:9: ( NL )*
        while true # decision 100
          alt_100 = 2
          look_100_0 = @input.peek( 1 )

          if ( look_100_0 == NL )
            alt_100 = 1

          end
          case alt_100
          when 1
            # at line 432:9: NL
            __NL237__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1394 )

            tree_for_NL237 = @adaptor.create_with_payload( __NL237__ )
            @adaptor.add_child( root_0, tree_for_NL237 )


          else
            break # out of loop for decision 100
          end
        end # loop for decision 100
        char_literal238 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_namespace_1397 )

        tree_for_char_literal238 = @adaptor.create_with_payload( char_literal238 )
        @adaptor.add_child( root_0, tree_for_char_literal238 )

        # at line 432:17: ( NL )*
        while true # decision 101
          alt_101 = 2
          look_101_0 = @input.peek( 1 )

          if ( look_101_0 == NL )
            alt_101 = 1

          end
          case alt_101
          when 1
            # at line 432:17: NL
            __NL239__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1399 )

            tree_for_NL239 = @adaptor.create_with_payload( __NL239__ )
            @adaptor.add_child( root_0, tree_for_NL239 )


          else
            break # out of loop for decision 101
          end
        end # loop for decision 101
        # at line 432:21: ( constraint_statement ( NL )+ )*
        while true # decision 103
          alt_103 = 2
          look_103_0 = @input.peek( 1 )

          if ( look_103_0 == ID || look_103_0 == T__28 || look_103_0 == T__58 )
            alt_103 = 1

          end
          case alt_103
          when 1
            # at line 432:22: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_namespace_1403 )
            constraint_statement240 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement240.tree )
            # --> action

            			key = self.to_ref(( path236 && @input.to_s( path236.start, path236.stop ) ) + '.' + ( constraint_statement240.nil? ? nil : constraint_statement240.key )[2,( constraint_statement240.nil? ? nil : constraint_statement240.key ).length])
            			@now[key] = ( constraint_statement240.nil? ? nil : constraint_statement240.val )
            		
            # <-- action
            # at file 437:3: ( NL )+
            match_count_102 = 0
            while true
              alt_102 = 2
              look_102_0 = @input.peek( 1 )

              if ( look_102_0 == NL )
                alt_102 = 1

              end
              case alt_102
              when 1
                # at line 437:3: NL
                __NL241__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1411 )

                tree_for_NL241 = @adaptor.create_with_payload( __NL241__ )
                @adaptor.add_child( root_0, tree_for_NL241 )


              else
                match_count_102 > 0 and break
                eee = EarlyExit(102)


                raise eee
              end
              match_count_102 += 1
            end


          else
            break # out of loop for decision 103
          end
        end # loop for decision 103
        char_literal242 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_namespace_1416 )

        tree_for_char_literal242 = @adaptor.create_with_payload( char_literal242 )
        @adaptor.add_child( root_0, tree_for_char_literal242 )

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

    ConstraintIteratorReturnValue = define_return_scope 

    # 
    # parser rule constraint_iterator
    # 
    # (in SFP.g)
    # 440:1: constraint_iterator : 'foreach' '(' path 'as' ID ')' ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ )* '}' ;
    # 
    def constraint_iterator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
      return_value = ConstraintIteratorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal243 = nil
      char_literal244 = nil
      string_literal246 = nil
      __ID247__ = nil
      char_literal248 = nil
      __NL249__ = nil
      char_literal250 = nil
      __NL251__ = nil
      __NL253__ = nil
      char_literal254 = nil
      path245 = nil
      constraint_statement252 = nil

      tree_for_string_literal243 = nil
      tree_for_char_literal244 = nil
      tree_for_string_literal246 = nil
      tree_for_ID247 = nil
      tree_for_char_literal248 = nil
      tree_for_NL249 = nil
      tree_for_char_literal250 = nil
      tree_for_NL251 = nil
      tree_for_NL253 = nil
      tree_for_char_literal254 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 441:4: 'foreach' '(' path 'as' ID ')' ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ )* '}'
        string_literal243 = match( T__47, TOKENS_FOLLOWING_T__47_IN_constraint_iterator_1427 )

        tree_for_string_literal243 = @adaptor.create_with_payload( string_literal243 )
        @adaptor.add_child( root_0, tree_for_string_literal243 )

        char_literal244 = match( T__36, TOKENS_FOLLOWING_T__36_IN_constraint_iterator_1429 )

        tree_for_char_literal244 = @adaptor.create_with_payload( char_literal244 )
        @adaptor.add_child( root_0, tree_for_char_literal244 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_iterator_1431 )
        path245 = path
        @state.following.pop
        @adaptor.add_child( root_0, path245.tree )
        string_literal246 = match( T__48, TOKENS_FOLLOWING_T__48_IN_constraint_iterator_1433 )

        tree_for_string_literal246 = @adaptor.create_with_payload( string_literal246 )
        @adaptor.add_child( root_0, tree_for_string_literal246 )

        __ID247__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_iterator_1435 )

        tree_for_ID247 = @adaptor.create_with_payload( __ID247__ )
        @adaptor.add_child( root_0, tree_for_ID247 )

        char_literal248 = match( T__38, TOKENS_FOLLOWING_T__38_IN_constraint_iterator_1437 )

        tree_for_char_literal248 = @adaptor.create_with_payload( char_literal248 )
        @adaptor.add_child( root_0, tree_for_char_literal248 )

        # at line 441:35: ( NL )*
        while true # decision 104
          alt_104 = 2
          look_104_0 = @input.peek( 1 )

          if ( look_104_0 == NL )
            alt_104 = 1

          end
          case alt_104
          when 1
            # at line 441:35: NL
            __NL249__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1439 )

            tree_for_NL249 = @adaptor.create_with_payload( __NL249__ )
            @adaptor.add_child( root_0, tree_for_NL249 )


          else
            break # out of loop for decision 104
          end
        end # loop for decision 104
        char_literal250 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_iterator_1442 )

        tree_for_char_literal250 = @adaptor.create_with_payload( char_literal250 )
        @adaptor.add_child( root_0, tree_for_char_literal250 )

        # at file 441:43: ( NL )+
        match_count_105 = 0
        while true
          alt_105 = 2
          look_105_0 = @input.peek( 1 )

          if ( look_105_0 == NL )
            alt_105 = 1

          end
          case alt_105
          when 1
            # at line 441:43: NL
            __NL251__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1444 )

            tree_for_NL251 = @adaptor.create_with_payload( __NL251__ )
            @adaptor.add_child( root_0, tree_for_NL251 )


          else
            match_count_105 > 0 and break
            eee = EarlyExit(105)


            raise eee
          end
          match_count_105 += 1
        end

        # --> action

        			id = self.next_id.to_s
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'iterator',
        				'_self' => id,
        				'_value' => ( path245 && @input.to_s( path245.start, path245.stop ) ),
        				'_variable' => __ID247__.text
        			}
        			@now = @now[id]
        			
        			id = '_template'
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'and',
        				'_self' => id,
        			}
        			@now = @now[id]
        		
        # <-- action
        # at line 461:3: ( constraint_statement ( NL )+ )*
        while true # decision 107
          alt_107 = 2
          look_107_0 = @input.peek( 1 )

          if ( look_107_0 == ID || look_107_0 == T__28 || look_107_0 == T__58 )
            alt_107 = 1

          end
          case alt_107
          when 1
            # at line 461:4: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_iterator_1454 )
            constraint_statement252 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement252.tree )
            # --> action

            			@now[( constraint_statement252.nil? ? nil : constraint_statement252.key )] = ( constraint_statement252.nil? ? nil : constraint_statement252.val )
            		
            # <-- action
            # at file 465:3: ( NL )+
            match_count_106 = 0
            while true
              alt_106 = 2
              look_106_0 = @input.peek( 1 )

              if ( look_106_0 == NL )
                alt_106 = 1

              end
              case alt_106
              when 1
                # at line 465:3: NL
                __NL253__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1462 )

                tree_for_NL253 = @adaptor.create_with_payload( __NL253__ )
                @adaptor.add_child( root_0, tree_for_NL253 )


              else
                match_count_106 > 0 and break
                eee = EarlyExit(106)


                raise eee
              end
              match_count_106 += 1
            end


          else
            break # out of loop for decision 107
          end
        end # loop for decision 107
        char_literal254 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_iterator_1469 )

        tree_for_char_literal254 = @adaptor.create_with_payload( char_literal254 )
        @adaptor.add_child( root_0, tree_for_char_literal254 )

        # --> action

        			self.goto_parent()
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

    QuantificationKeywordReturnValue = define_return_scope 

    # 
    # parser rule quantification_keyword
    # 
    # (in SFP.g)
    # 473:1: quantification_keyword : ( 'forall' | 'exist' | 'forsome' );
    # 
    def quantification_keyword
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = QuantificationKeywordReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set255 = nil

      tree_for_set255 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set255 = @input.look
        if @input.peek( 1 ).between?( T__49, T__51 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set255 ) )
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
        # trace_out( __method__, 32 )

      end
      
      return return_value
    end

    ConstraintClassQuantificationReturnValue = define_return_scope 

    # 
    # parser rule constraint_class_quantification
    # 
    # (in SFP.g)
    # 479:1: constraint_class_quantification : quantification_keyword '(' path 'as' ID ')' ( ( binary_comp | '=' ) NUMBER )? ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ | constraint_different )* '}' ;
    # 
    def constraint_class_quantification
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
      return_value = ConstraintClassQuantificationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal257 = nil
      string_literal259 = nil
      __ID260__ = nil
      char_literal261 = nil
      char_literal263 = nil
      __NUMBER264__ = nil
      __NL265__ = nil
      char_literal266 = nil
      __NL267__ = nil
      __NL269__ = nil
      char_literal271 = nil
      quantification_keyword256 = nil
      path258 = nil
      binary_comp262 = nil
      constraint_statement268 = nil
      constraint_different270 = nil

      tree_for_char_literal257 = nil
      tree_for_string_literal259 = nil
      tree_for_ID260 = nil
      tree_for_char_literal261 = nil
      tree_for_char_literal263 = nil
      tree_for_NUMBER264 = nil
      tree_for_NL265 = nil
      tree_for_char_literal266 = nil
      tree_for_NL267 = nil
      tree_for_NL269 = nil
      tree_for_char_literal271 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 480:4: quantification_keyword '(' path 'as' ID ')' ( ( binary_comp | '=' ) NUMBER )? ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ | constraint_different )* '}'
        @state.following.push( TOKENS_FOLLOWING_quantification_keyword_IN_constraint_class_quantification_1505 )
        quantification_keyword256 = quantification_keyword
        @state.following.pop
        @adaptor.add_child( root_0, quantification_keyword256.tree )
        char_literal257 = match( T__36, TOKENS_FOLLOWING_T__36_IN_constraint_class_quantification_1507 )

        tree_for_char_literal257 = @adaptor.create_with_payload( char_literal257 )
        @adaptor.add_child( root_0, tree_for_char_literal257 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_class_quantification_1509 )
        path258 = path
        @state.following.pop
        @adaptor.add_child( root_0, path258.tree )
        string_literal259 = match( T__48, TOKENS_FOLLOWING_T__48_IN_constraint_class_quantification_1511 )

        tree_for_string_literal259 = @adaptor.create_with_payload( string_literal259 )
        @adaptor.add_child( root_0, tree_for_string_literal259 )

        __ID260__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_class_quantification_1513 )

        tree_for_ID260 = @adaptor.create_with_payload( __ID260__ )
        @adaptor.add_child( root_0, tree_for_ID260 )

        char_literal261 = match( T__38, TOKENS_FOLLOWING_T__38_IN_constraint_class_quantification_1515 )

        tree_for_char_literal261 = @adaptor.create_with_payload( char_literal261 )
        @adaptor.add_child( root_0, tree_for_char_literal261 )

        # --> action

        			id = self.next_id.to_s
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => ( quantification_keyword256 && @input.to_s( quantification_keyword256.start, quantification_keyword256.stop ) ),
        				'_self' => id,
        				'_class' => ( path258 && @input.to_s( path258.start, path258.stop ) ),
        				'_variable' => __ID260__.text
        			}
        			@now = @now[id]

        			id = '_template'
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'and',
        				'_self' => id
        			}
        			@now = @now[id]
        		
        # <-- action
        # at line 500:3: ( ( binary_comp | '=' ) NUMBER )?
        alt_109 = 2
        look_109_0 = @input.peek( 1 )

        if ( look_109_0 == T__52 || look_109_0.between?( T__70, T__73 ) )
          alt_109 = 1
        end
        case alt_109
        when 1
          # at line 500:5: ( binary_comp | '=' ) NUMBER
          # at line 500:5: ( binary_comp | '=' )
          alt_108 = 2
          look_108_0 = @input.peek( 1 )

          if ( look_108_0.between?( T__70, T__73 ) )
            alt_108 = 1
          elsif ( look_108_0 == T__52 )
            alt_108 = 2
          else
            raise NoViableAlternative( "", 108, 0 )
          end
          case alt_108
          when 1
            # at line 500:7: binary_comp
            @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_constraint_class_quantification_1527 )
            binary_comp262 = binary_comp
            @state.following.pop
            @adaptor.add_child( root_0, binary_comp262.tree )
            # --> action
            	@now['_count_operator'] = ( binary_comp262 && @input.to_s( binary_comp262.start, binary_comp262.stop ) )	
            # <-- action

          when 2
            # at line 502:6: '='
            char_literal263 = match( T__52, TOKENS_FOLLOWING_T__52_IN_constraint_class_quantification_1540 )

            tree_for_char_literal263 = @adaptor.create_with_payload( char_literal263 )
            @adaptor.add_child( root_0, tree_for_char_literal263 )

            # --> action
            	@now['_count_operator'] = '='	
            # <-- action

          end
          __NUMBER264__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_constraint_class_quantification_1556 )

          tree_for_NUMBER264 = @adaptor.create_with_payload( __NUMBER264__ )
          @adaptor.add_child( root_0, tree_for_NUMBER264 )

          # --> action
          	@now['_count_value'] = __NUMBER264__.text.to_i	
          # <-- action

        end
        # at line 508:3: ( NL )*
        while true # decision 110
          alt_110 = 2
          look_110_0 = @input.peek( 1 )

          if ( look_110_0 == NL )
            alt_110 = 1

          end
          case alt_110
          when 1
            # at line 508:3: NL
            __NL265__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1570 )

            tree_for_NL265 = @adaptor.create_with_payload( __NL265__ )
            @adaptor.add_child( root_0, tree_for_NL265 )


          else
            break # out of loop for decision 110
          end
        end # loop for decision 110
        char_literal266 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_class_quantification_1573 )

        tree_for_char_literal266 = @adaptor.create_with_payload( char_literal266 )
        @adaptor.add_child( root_0, tree_for_char_literal266 )

        # at file 508:11: ( NL )+
        match_count_111 = 0
        while true
          alt_111 = 2
          look_111_0 = @input.peek( 1 )

          if ( look_111_0 == NL )
            alt_111 = 1

          end
          case alt_111
          when 1
            # at line 508:11: NL
            __NL267__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1575 )

            tree_for_NL267 = @adaptor.create_with_payload( __NL267__ )
            @adaptor.add_child( root_0, tree_for_NL267 )


          else
            match_count_111 > 0 and break
            eee = EarlyExit(111)


            raise eee
          end
          match_count_111 += 1
        end

        # at line 509:3: ( constraint_statement ( NL )+ | constraint_different )*
        while true # decision 113
          alt_113 = 3
          look_113_0 = @input.peek( 1 )

          if ( look_113_0 == ID || look_113_0 == T__28 || look_113_0 == T__58 )
            alt_113 = 1
          elsif ( look_113_0 == T__53 )
            alt_113 = 2

          end
          case alt_113
          when 1
            # at line 509:5: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_class_quantification_1582 )
            constraint_statement268 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement268.tree )
            # --> action
            	@now[( constraint_statement268.nil? ? nil : constraint_statement268.key )] = ( constraint_statement268.nil? ? nil : constraint_statement268.val )	
            # <-- action
            # at file 511:4: ( NL )+
            match_count_112 = 0
            while true
              alt_112 = 2
              look_112_0 = @input.peek( 1 )

              if ( look_112_0 == NL )
                alt_112 = 1

              end
              case alt_112
              when 1
                # at line 511:4: NL
                __NL269__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1592 )

                tree_for_NL269 = @adaptor.create_with_payload( __NL269__ )
                @adaptor.add_child( root_0, tree_for_NL269 )


              else
                match_count_112 > 0 and break
                eee = EarlyExit(112)


                raise eee
              end
              match_count_112 += 1
            end


          when 2
            # at line 512:5: constraint_different
            @state.following.push( TOKENS_FOLLOWING_constraint_different_IN_constraint_class_quantification_1599 )
            constraint_different270 = constraint_different
            @state.following.pop
            @adaptor.add_child( root_0, constraint_different270.tree )

          else
            break # out of loop for decision 113
          end
        end # loop for decision 113
        char_literal271 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_class_quantification_1606 )

        tree_for_char_literal271 = @adaptor.create_with_payload( char_literal271 )
        @adaptor.add_child( root_0, tree_for_char_literal271 )

        # --> action
        	self.goto_parent()	
        # <-- action
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
        # trace_out( __method__, 33 )

      end
      
      return return_value
    end

    ConstraintDifferentReturnValue = define_return_scope 

    # 
    # parser rule constraint_different
    # 
    # (in SFP.g)
    # 518:1: constraint_different : ':different' '(' path ')' ( NL )+ ;
    # 
    def constraint_different
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )
      return_value = ConstraintDifferentReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal272 = nil
      char_literal273 = nil
      char_literal275 = nil
      __NL276__ = nil
      path274 = nil

      tree_for_string_literal272 = nil
      tree_for_char_literal273 = nil
      tree_for_char_literal275 = nil
      tree_for_NL276 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 519:4: ':different' '(' path ')' ( NL )+
        string_literal272 = match( T__53, TOKENS_FOLLOWING_T__53_IN_constraint_different_1625 )

        tree_for_string_literal272 = @adaptor.create_with_payload( string_literal272 )
        @adaptor.add_child( root_0, tree_for_string_literal272 )

        char_literal273 = match( T__36, TOKENS_FOLLOWING_T__36_IN_constraint_different_1627 )

        tree_for_char_literal273 = @adaptor.create_with_payload( char_literal273 )
        @adaptor.add_child( root_0, tree_for_char_literal273 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_different_1629 )
        path274 = path
        @state.following.pop
        @adaptor.add_child( root_0, path274.tree )
        char_literal275 = match( T__38, TOKENS_FOLLOWING_T__38_IN_constraint_different_1631 )

        tree_for_char_literal275 = @adaptor.create_with_payload( char_literal275 )
        @adaptor.add_child( root_0, tree_for_char_literal275 )

        # at file 519:30: ( NL )+
        match_count_114 = 0
        while true
          alt_114 = 2
          look_114_0 = @input.peek( 1 )

          if ( look_114_0 == NL )
            alt_114 = 1

          end
          case alt_114
          when 1
            # at line 519:30: NL
            __NL276__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_different_1633 )

            tree_for_NL276 = @adaptor.create_with_payload( __NL276__ )
            @adaptor.add_child( root_0, tree_for_NL276 )


          else
            match_count_114 > 0 and break
            eee = EarlyExit(114)


            raise eee
          end
          match_count_114 += 1
        end

        # --> action

        			id = self.next_id.to_s
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'different',
        				'_self' => id,
        				'_path' => ( path274 && @input.to_s( path274.start, path274.stop ) )
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
        # trace_out( __method__, 34 )

      end
      
      return return_value
    end

    ConstraintStatementReturnValue = define_return_scope :key, :val

    # 
    # parser rule constraint_statement
    # 
    # (in SFP.g)
    # 531:1: constraint_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | conditional_constraint | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | reference binary_comp comp_value | total_constraint );
    # 
    def constraint_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
      return_value = ConstraintStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL282__ = nil
      __NULL288__ = nil
      string_literal291 = nil
      string_literal292 = nil
      set295 = nil
      string_literal296 = nil
      reference277 = nil
      equals_op278 = nil
      value279 = nil
      reference280 = nil
      equals_op281 = nil
      reference283 = nil
      not_equals_op284 = nil
      value285 = nil
      reference286 = nil
      not_equals_op287 = nil
      conditional_constraint289 = nil
      reference290 = nil
      set_value293 = nil
      reference294 = nil
      set_value297 = nil
      reference298 = nil
      binary_comp299 = nil
      comp_value300 = nil
      total_constraint301 = nil

      tree_for_NULL282 = nil
      tree_for_NULL288 = nil
      tree_for_string_literal291 = nil
      tree_for_string_literal292 = nil
      tree_for_set295 = nil
      tree_for_string_literal296 = nil

      begin
        # at line 532:2: ( reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | conditional_constraint | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | reference binary_comp comp_value | total_constraint )
        alt_116 = 9
        alt_116 = @dfa116.predict( @input )
        case alt_116
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 532:4: reference equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1653 )
          reference277 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference277.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1655 )
          equals_op278 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op278.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_1657 )
          value279 = value
          @state.following.pop
          @adaptor.add_child( root_0, value279.tree )
          # --> action

          			return_value.key = ( reference277.nil? ? nil : reference277.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => ( value279.nil? ? nil : value279.val ) }
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 537:4: reference equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1666 )
          reference280 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference280.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1668 )
          equals_op281 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op281.tree )
          __NULL282__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_constraint_statement_1670 )

          tree_for_NULL282 = @adaptor.create_with_payload( __NULL282__ )
          @adaptor.add_child( root_0, tree_for_NULL282 )

          # --> action

          			return_value.key = ( reference280.nil? ? nil : reference280.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => self.null_value }
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 542:4: reference not_equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1679 )
          reference283 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference283.tree )
          @state.following.push( TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1681 )
          not_equals_op284 = not_equals_op
          @state.following.pop
          @adaptor.add_child( root_0, not_equals_op284.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_1683 )
          value285 = value
          @state.following.pop
          @adaptor.add_child( root_0, value285.tree )
          # --> action

          			return_value.key = ( reference283.nil? ? nil : reference283.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-equals', '_value' => ( value285.nil? ? nil : value285.val ) }
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 547:4: reference not_equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1692 )
          reference286 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference286.tree )
          @state.following.push( TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1694 )
          not_equals_op287 = not_equals_op
          @state.following.pop
          @adaptor.add_child( root_0, not_equals_op287.tree )
          __NULL288__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_constraint_statement_1696 )

          tree_for_NULL288 = @adaptor.create_with_payload( __NULL288__ )
          @adaptor.add_child( root_0, tree_for_NULL288 )

          # --> action

          			return_value.key = ( reference286.nil? ? nil : reference286.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-equals', '_value' => self.null_value }
          		
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 552:4: conditional_constraint
          @state.following.push( TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_1705 )
          conditional_constraint289 = conditional_constraint
          @state.following.pop
          @adaptor.add_child( root_0, conditional_constraint289.tree )
          # --> action

          			return_value.key = ( conditional_constraint289.nil? ? nil : conditional_constraint289.key )
          			return_value.val = ( conditional_constraint289.nil? ? nil : conditional_constraint289.val )
          		
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 557:4: reference ( 'is' )? 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1714 )
          reference290 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference290.tree )
          # at line 557:14: ( 'is' )?
          alt_115 = 2
          look_115_0 = @input.peek( 1 )

          if ( look_115_0 == T__54 )
            alt_115 = 1
          end
          case alt_115
          when 1
            # at line 557:14: 'is'
            string_literal291 = match( T__54, TOKENS_FOLLOWING_T__54_IN_constraint_statement_1716 )

            tree_for_string_literal291 = @adaptor.create_with_payload( string_literal291 )
            @adaptor.add_child( root_0, tree_for_string_literal291 )


          end
          string_literal292 = match( T__55, TOKENS_FOLLOWING_T__55_IN_constraint_statement_1719 )

          tree_for_string_literal292 = @adaptor.create_with_payload( string_literal292 )
          @adaptor.add_child( root_0, tree_for_string_literal292 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_1721 )
          set_value293 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value293.tree )
          # --> action

          			c_or = { '_context' => 'constraint', '_type' => 'or', '_parent' => @now }
          			( set_value293.nil? ? nil : set_value293.val ).each { |v|
          				id = self.next_id.to_s
          				item = { '_context' => 'constraint', '_type' => 'and', '_parent' => c_or }
          				item[( reference290.nil? ? nil : reference290.val )] = { '_context' => 'constraint', '_type' => 'equals', '_value' => v }
          				c_or[id] = item
          			}
          			return_value.key = self.next_id.to_s
          			return_value.val = c_or
          		
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 569:4: reference ( 'isnt' | 'not' ) 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1730 )
          reference294 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference294.tree )
          set295 = @input.look
          if @input.peek( 1 ).between?( T__56, T__57 )
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set295 ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          string_literal296 = match( T__55, TOKENS_FOLLOWING_T__55_IN_constraint_statement_1738 )

          tree_for_string_literal296 = @adaptor.create_with_payload( string_literal296 )
          @adaptor.add_child( root_0, tree_for_string_literal296 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_1740 )
          set_value297 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value297.tree )
          # --> action

          			c_and = { '_context'=>'constraint', '_type'=>'and', '_parent'=>@now }
          			( set_value297.nil? ? nil : set_value297.val ).each { |v|
          				id = self.next_id.to_s
          				item = { '_context'=>'constraint', '_type'=>'and'}
          				item[( reference294.nil? ? nil : reference294.val )] = { '_context'=>'constraint', '_type'=>'not-equals', '_value'=>v }
          				c_and[id] = item
          			}
          			return_value.key = self.next_id.to_s
          			return_value.val = c_and

          			#return_value.key = ( reference294.nil? ? nil : reference294.val )
          			#return_value.val = { '_context' => 'constraint', '_type' => 'not-in', '_value' => ( set_value297.nil? ? nil : set_value297.val ) }
          		
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 584:4: reference binary_comp comp_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1749 )
          reference298 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference298.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_1751 )
          binary_comp299 = binary_comp
          @state.following.pop
          @adaptor.add_child( root_0, binary_comp299.tree )
          @state.following.push( TOKENS_FOLLOWING_comp_value_IN_constraint_statement_1753 )
          comp_value300 = comp_value
          @state.following.pop
          @adaptor.add_child( root_0, comp_value300.tree )
          # --> action

          			return_value.key = ( reference298.nil? ? nil : reference298.val )
          			return_value.val = { '_context' => 'constraint', '_type' => ( binary_comp299 && @input.to_s( binary_comp299.start, binary_comp299.stop ) ), '_value' => ( comp_value300.nil? ? nil : comp_value300.val ) }
          		
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 589:4: total_constraint
          @state.following.push( TOKENS_FOLLOWING_total_constraint_IN_constraint_statement_1762 )
          total_constraint301 = total_constraint
          @state.following.pop
          @adaptor.add_child( root_0, total_constraint301.tree )

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

    TotalConstraintReturnValue = define_return_scope 

    # 
    # parser rule total_constraint
    # 
    # (in SFP.g)
    # 592:1: total_constraint : 'total(' total_statement ')' binary_comp NUMBER ;
    # 
    def total_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
      return_value = TotalConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal302 = nil
      char_literal304 = nil
      __NUMBER306__ = nil
      total_statement303 = nil
      binary_comp305 = nil

      tree_for_string_literal302 = nil
      tree_for_char_literal304 = nil
      tree_for_NUMBER306 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 593:4: 'total(' total_statement ')' binary_comp NUMBER
        string_literal302 = match( T__58, TOKENS_FOLLOWING_T__58_IN_total_constraint_1773 )

        tree_for_string_literal302 = @adaptor.create_with_payload( string_literal302 )
        @adaptor.add_child( root_0, tree_for_string_literal302 )

        @state.following.push( TOKENS_FOLLOWING_total_statement_IN_total_constraint_1775 )
        total_statement303 = total_statement
        @state.following.pop
        @adaptor.add_child( root_0, total_statement303.tree )
        char_literal304 = match( T__38, TOKENS_FOLLOWING_T__38_IN_total_constraint_1777 )

        tree_for_char_literal304 = @adaptor.create_with_payload( char_literal304 )
        @adaptor.add_child( root_0, tree_for_char_literal304 )

        @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_total_constraint_1779 )
        binary_comp305 = binary_comp
        @state.following.pop
        @adaptor.add_child( root_0, binary_comp305.tree )
        __NUMBER306__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_total_constraint_1781 )

        tree_for_NUMBER306 = @adaptor.create_with_payload( __NUMBER306__ )
        @adaptor.add_child( root_0, tree_for_NUMBER306 )

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

    TotalStatementReturnValue = define_return_scope 

    # 
    # parser rule total_statement
    # 
    # (in SFP.g)
    # 596:1: total_statement : reference equals_op value ;
    # 
    def total_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )
      return_value = TotalStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      reference307 = nil
      equals_op308 = nil
      value309 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 597:4: reference equals_op value
        @state.following.push( TOKENS_FOLLOWING_reference_IN_total_statement_1792 )
        reference307 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference307.tree )
        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_total_statement_1794 )
        equals_op308 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op308.tree )
        @state.following.push( TOKENS_FOLLOWING_value_IN_total_statement_1796 )
        value309 = value
        @state.following.pop
        @adaptor.add_child( root_0, value309.tree )
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

    CompValueReturnValue = define_return_scope :val

    # 
    # parser rule comp_value
    # 
    # (in SFP.g)
    # 600:1: comp_value returns [val] : ( NUMBER | reference );
    # 
    def comp_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )
      return_value = CompValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NUMBER310__ = nil
      reference311 = nil

      tree_for_NUMBER310 = nil

      begin
        # at line 601:2: ( NUMBER | reference )
        alt_117 = 2
        look_117_0 = @input.peek( 1 )

        if ( look_117_0 == NUMBER )
          alt_117 = 1
        elsif ( look_117_0 == ID )
          alt_117 = 2
        else
          raise NoViableAlternative( "", 117, 0 )
        end
        case alt_117
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 601:4: NUMBER
          __NUMBER310__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_comp_value_1811 )

          tree_for_NUMBER310 = @adaptor.create_with_payload( __NUMBER310__ )
          @adaptor.add_child( root_0, tree_for_NUMBER310 )

          # --> action
          	return_value.val = __NUMBER310__.text.to_f	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 603:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_comp_value_1820 )
          reference311 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference311.tree )
          # --> action
          	return_value.val = ( reference311.nil? ? nil : reference311.val )	
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

    ConditionalConstraintReturnValue = define_return_scope :key, :val

    # 
    # parser rule conditional_constraint
    # 
    # (in SFP.g)
    # 607:1: conditional_constraint returns [key, val] : 'if' constraint_statement ( NL )* conditional_constraint_then ;
    # 
    def conditional_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )
      return_value = ConditionalConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal312 = nil
      __NL314__ = nil
      constraint_statement313 = nil
      conditional_constraint_then315 = nil

      tree_for_string_literal312 = nil
      tree_for_NL314 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 608:4: 'if' constraint_statement ( NL )* conditional_constraint_then
        string_literal312 = match( T__28, TOKENS_FOLLOWING_T__28_IN_conditional_constraint_1839 )

        tree_for_string_literal312 = @adaptor.create_with_payload( string_literal312 )
        @adaptor.add_child( root_0, tree_for_string_literal312 )

        # --> action

        			return_value.key = id = self.next_id.to_s
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'or'
        			}
        			@now = @now[id]
        		
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_1847 )
        constraint_statement313 = constraint_statement
        @state.following.pop
        @adaptor.add_child( root_0, constraint_statement313.tree )
        # at line 617:24: ( NL )*
        while true # decision 118
          alt_118 = 2
          look_118_0 = @input.peek( 1 )

          if ( look_118_0 == NL )
            alt_118 = 1

          end
          case alt_118
          when 1
            # at line 617:24: NL
            __NL314__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditional_constraint_1849 )

            tree_for_NL314 = @adaptor.create_with_payload( __NL314__ )
            @adaptor.add_child( root_0, tree_for_NL314 )


          else
            break # out of loop for decision 118
          end
        end # loop for decision 118
        # --> action

        			id = self.next_id
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'not'
        			}
        			@now[id][( constraint_statement313.nil? ? nil : constraint_statement313.key )] = ( constraint_statement313.nil? ? nil : constraint_statement313.val )
        		
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_conditional_constraint_then_IN_conditional_constraint_1858 )
        conditional_constraint_then315 = conditional_constraint_then
        @state.following.pop
        @adaptor.add_child( root_0, conditional_constraint_then315.tree )
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
        # trace_out( __method__, 39 )

      end
      
      return return_value
    end

    ConditionalConstraintThenReturnValue = define_return_scope 

    # 
    # parser rule conditional_constraint_then
    # 
    # (in SFP.g)
    # 630:1: conditional_constraint_then : 'then' constraint_statement ;
    # 
    def conditional_constraint_then
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )
      return_value = ConditionalConstraintThenReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal316 = nil
      constraint_statement317 = nil

      tree_for_string_literal316 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 631:4: 'then' constraint_statement
        string_literal316 = match( T__29, TOKENS_FOLLOWING_T__29_IN_conditional_constraint_then_1873 )

        tree_for_string_literal316 = @adaptor.create_with_payload( string_literal316 )
        @adaptor.add_child( root_0, tree_for_string_literal316 )

        @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_1875 )
        constraint_statement317 = constraint_statement
        @state.following.pop
        @adaptor.add_child( root_0, constraint_statement317.tree )
        # --> action

        			id = self.next_id
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'and'
        			}
        			@now[id][( constraint_statement317.nil? ? nil : constraint_statement317.key )] = ( constraint_statement317.nil? ? nil : constraint_statement317.val )
        		
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
        # trace_out( __method__, 40 )

      end
      
      return return_value
    end

    MutationBodyReturnValue = define_return_scope 

    # 
    # parser rule mutation_body
    # 
    # (in SFP.g)
    # 642:1: mutation_body : ( ( mutation_statement | mutation_iterator ) ( NL )+ )* ;
    # 
    def mutation_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )
      return_value = MutationBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL320__ = nil
      mutation_statement318 = nil
      mutation_iterator319 = nil

      tree_for_NL320 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 643:4: ( ( mutation_statement | mutation_iterator ) ( NL )+ )*
        # at line 643:4: ( ( mutation_statement | mutation_iterator ) ( NL )+ )*
        while true # decision 121
          alt_121 = 2
          look_121_0 = @input.peek( 1 )

          if ( look_121_0 == ID || look_121_0 == T__47 || look_121_0 == T__60 )
            alt_121 = 1

          end
          case alt_121
          when 1
            # at line 644:4: ( mutation_statement | mutation_iterator ) ( NL )+
            # at line 644:4: ( mutation_statement | mutation_iterator )
            alt_119 = 2
            look_119_0 = @input.peek( 1 )

            if ( look_119_0 == ID || look_119_0 == T__60 )
              alt_119 = 1
            elsif ( look_119_0 == T__47 )
              alt_119 = 2
            else
              raise NoViableAlternative( "", 119, 0 )
            end
            case alt_119
            when 1
              # at line 644:6: mutation_statement
              @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_mutation_body_1897 )
              mutation_statement318 = mutation_statement
              @state.following.pop
              @adaptor.add_child( root_0, mutation_statement318.tree )
              # --> action
              	@now[( mutation_statement318.nil? ? nil : mutation_statement318.key )] = ( mutation_statement318.nil? ? nil : mutation_statement318.val )	
              # <-- action

            when 2
              # at line 646:6: mutation_iterator
              @state.following.push( TOKENS_FOLLOWING_mutation_iterator_IN_mutation_body_1910 )
              mutation_iterator319 = mutation_iterator
              @state.following.pop
              @adaptor.add_child( root_0, mutation_iterator319.tree )

            end
            # at file 648:3: ( NL )+
            match_count_120 = 0
            while true
              alt_120 = 2
              look_120_0 = @input.peek( 1 )

              if ( look_120_0 == NL )
                alt_120 = 1

              end
              case alt_120
              when 1
                # at line 648:3: NL
                __NL320__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_body_1919 )

                tree_for_NL320 = @adaptor.create_with_payload( __NL320__ )
                @adaptor.add_child( root_0, tree_for_NL320 )


              else
                match_count_120 > 0 and break
                eee = EarlyExit(120)


                raise eee
              end
              match_count_120 += 1
            end


          else
            break # out of loop for decision 121
          end
        end # loop for decision 121
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

    MutationIteratorReturnValue = define_return_scope 

    # 
    # parser rule mutation_iterator
    # 
    # (in SFP.g)
    # 651:1: mutation_iterator : 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( mutation_statement ( NL )+ )* '}' ;
    # 
    def mutation_iterator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )
      return_value = MutationIteratorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal321 = nil
      string_literal323 = nil
      __ID324__ = nil
      __NL325__ = nil
      char_literal326 = nil
      __NL327__ = nil
      __NL329__ = nil
      char_literal330 = nil
      path322 = nil
      mutation_statement328 = nil

      tree_for_string_literal321 = nil
      tree_for_string_literal323 = nil
      tree_for_ID324 = nil
      tree_for_NL325 = nil
      tree_for_char_literal326 = nil
      tree_for_NL327 = nil
      tree_for_NL329 = nil
      tree_for_char_literal330 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 652:4: 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( mutation_statement ( NL )+ )* '}'
        string_literal321 = match( T__47, TOKENS_FOLLOWING_T__47_IN_mutation_iterator_1934 )

        tree_for_string_literal321 = @adaptor.create_with_payload( string_literal321 )
        @adaptor.add_child( root_0, tree_for_string_literal321 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_iterator_1936 )
        path322 = path
        @state.following.pop
        @adaptor.add_child( root_0, path322.tree )
        string_literal323 = match( T__48, TOKENS_FOLLOWING_T__48_IN_mutation_iterator_1938 )

        tree_for_string_literal323 = @adaptor.create_with_payload( string_literal323 )
        @adaptor.add_child( root_0, tree_for_string_literal323 )

        __ID324__ = match( ID, TOKENS_FOLLOWING_ID_IN_mutation_iterator_1940 )

        tree_for_ID324 = @adaptor.create_with_payload( __ID324__ )
        @adaptor.add_child( root_0, tree_for_ID324 )

        # at line 652:27: ( NL )*
        while true # decision 122
          alt_122 = 2
          look_122_0 = @input.peek( 1 )

          if ( look_122_0 == NL )
            alt_122 = 1

          end
          case alt_122
          when 1
            # at line 652:27: NL
            __NL325__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_1942 )

            tree_for_NL325 = @adaptor.create_with_payload( __NL325__ )
            @adaptor.add_child( root_0, tree_for_NL325 )


          else
            break # out of loop for decision 122
          end
        end # loop for decision 122
        char_literal326 = match( T__20, TOKENS_FOLLOWING_T__20_IN_mutation_iterator_1945 )

        tree_for_char_literal326 = @adaptor.create_with_payload( char_literal326 )
        @adaptor.add_child( root_0, tree_for_char_literal326 )

        # at file 652:35: ( NL )+
        match_count_123 = 0
        while true
          alt_123 = 2
          look_123_0 = @input.peek( 1 )

          if ( look_123_0 == NL )
            alt_123 = 1

          end
          case alt_123
          when 1
            # at line 652:35: NL
            __NL327__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_1947 )

            tree_for_NL327 = @adaptor.create_with_payload( __NL327__ )
            @adaptor.add_child( root_0, tree_for_NL327 )


          else
            match_count_123 > 0 and break
            eee = EarlyExit(123)


            raise eee
          end
          match_count_123 += 1
        end

        # --> action

        			id = self.to_ref(( path322 && @input.to_s( path322.start, path322.stop ) ))
        			@now[id] = { '_parent' => @now,
        				'_context' => 'iterator',
        				'_self' => id,
        				'_variable' => __ID324__.text
        			}
        			@now = @now[id]
        		
        # <-- action
        # at line 662:3: ( mutation_statement ( NL )+ )*
        while true # decision 125
          alt_125 = 2
          look_125_0 = @input.peek( 1 )

          if ( look_125_0 == ID || look_125_0 == T__60 )
            alt_125 = 1

          end
          case alt_125
          when 1
            # at line 662:4: mutation_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_mutation_iterator_1957 )
            mutation_statement328 = mutation_statement
            @state.following.pop
            @adaptor.add_child( root_0, mutation_statement328.tree )
            # --> action
            	@now[( mutation_statement328.nil? ? nil : mutation_statement328.key )] = ( mutation_statement328.nil? ? nil : mutation_statement328.val )	
            # <-- action
            # at file 664:3: ( NL )+
            match_count_124 = 0
            while true
              alt_124 = 2
              look_124_0 = @input.peek( 1 )

              if ( look_124_0 == NL )
                alt_124 = 1

              end
              case alt_124
              when 1
                # at line 664:3: NL
                __NL329__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_1965 )

                tree_for_NL329 = @adaptor.create_with_payload( __NL329__ )
                @adaptor.add_child( root_0, tree_for_NL329 )


              else
                match_count_124 > 0 and break
                eee = EarlyExit(124)


                raise eee
              end
              match_count_124 += 1
            end


          else
            break # out of loop for decision 125
          end
        end # loop for decision 125
        char_literal330 = match( T__21, TOKENS_FOLLOWING_T__21_IN_mutation_iterator_1972 )

        tree_for_char_literal330 = @adaptor.create_with_payload( char_literal330 )
        @adaptor.add_child( root_0, tree_for_char_literal330 )

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
        # trace_out( __method__, 42 )

      end
      
      return return_value
    end

    MutationStatementReturnValue = define_return_scope :key, :val

    # 
    # parser rule mutation_statement
    # 
    # (in SFP.g)
    # 669:1: mutation_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' );
    # 
    def mutation_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )
      return_value = MutationStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL336__ = nil
      __NUMBER339__ = nil
      string_literal341 = nil
      string_literal342 = nil
      string_literal345 = nil
      string_literal348 = nil
      char_literal350 = nil
      string_literal352 = nil
      char_literal354 = nil
      reference331 = nil
      equals_op332 = nil
      value333 = nil
      reference334 = nil
      equals_op335 = nil
      reference337 = nil
      binary_op338 = nil
      reference340 = nil
      path343 = nil
      object_body344 = nil
      path346 = nil
      reference347 = nil
      value349 = nil
      reference351 = nil
      value353 = nil

      tree_for_NULL336 = nil
      tree_for_NUMBER339 = nil
      tree_for_string_literal341 = nil
      tree_for_string_literal342 = nil
      tree_for_string_literal345 = nil
      tree_for_string_literal348 = nil
      tree_for_char_literal350 = nil
      tree_for_string_literal352 = nil
      tree_for_char_literal354 = nil

      begin
        # at line 670:2: ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' )
        alt_127 = 7
        alt_127 = @dfa127.predict( @input )
        case alt_127
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 670:4: reference equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1991 )
          reference331 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference331.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_mutation_statement_1993 )
          equals_op332 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op332.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_1995 )
          value333 = value
          @state.following.pop
          @adaptor.add_child( root_0, value333.tree )
          # --> action

          			return_value.key = ( reference331.nil? ? nil : reference331.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'equals',
          				'_value' => ( value333.nil? ? nil : value333.val )
          			}
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 678:4: reference equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2004 )
          reference334 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference334.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_mutation_statement_2006 )
          equals_op335 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op335.tree )
          __NULL336__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_mutation_statement_2008 )

          tree_for_NULL336 = @adaptor.create_with_payload( __NULL336__ )
          @adaptor.add_child( root_0, tree_for_NULL336 )

          # --> action

          			return_value.key = ( reference334.nil? ? nil : reference334.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'equals',
          				'_value' => self.null_value
          			}
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 686:4: reference binary_op NUMBER
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2017 )
          reference337 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference337.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_op_IN_mutation_statement_2019 )
          binary_op338 = binary_op
          @state.following.pop
          @adaptor.add_child( root_0, binary_op338.tree )
          __NUMBER339__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_mutation_statement_2021 )

          tree_for_NUMBER339 = @adaptor.create_with_payload( __NUMBER339__ )
          @adaptor.add_child( root_0, tree_for_NUMBER339 )

          # --> action

          			return_value.key = ( reference337.nil? ? nil : reference337.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => ( binary_op338 && @input.to_s( binary_op338.start, binary_op338.stop ) ),
          				'_value' => __NUMBER339__.text.to_f
          			}
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 694:4: reference 'is' 'new' path ( object_body )?
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2030 )
          reference340 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference340.tree )
          string_literal341 = match( T__54, TOKENS_FOLLOWING_T__54_IN_mutation_statement_2032 )

          tree_for_string_literal341 = @adaptor.create_with_payload( string_literal341 )
          @adaptor.add_child( root_0, tree_for_string_literal341 )

          string_literal342 = match( T__59, TOKENS_FOLLOWING_T__59_IN_mutation_statement_2034 )

          tree_for_string_literal342 = @adaptor.create_with_payload( string_literal342 )
          @adaptor.add_child( root_0, tree_for_string_literal342 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_statement_2036 )
          path343 = path
          @state.following.pop
          @adaptor.add_child( root_0, path343.tree )
          # --> action

          			id = '_' + self.next_id
          			@now[id] = { '_self' => id,
          				'_context' => 'object',
          				'_isa' => self.to_ref(( path343 && @input.to_s( path343.start, path343.stop ) )),
          				'_parent' => @now
          			}
          			@now = @now[id]
          		
          # <-- action
          # at line 704:3: ( object_body )?
          alt_126 = 2
          look_126_0 = @input.peek( 1 )

          if ( look_126_0 == T__20 )
            alt_126 = 1
          end
          case alt_126
          when 1
            # at line 704:3: object_body
            @state.following.push( TOKENS_FOLLOWING_object_body_IN_mutation_statement_2044 )
            object_body344 = object_body
            @state.following.pop
            @adaptor.add_child( root_0, object_body344.tree )

          end
          # --> action

          			n = self.goto_parent()
          			@now.delete(n['_self'])
          			return_value.key = ( reference340.nil? ? nil : reference340.val )
          			return_value.val = n
          		
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 711:4: 'delete' path
          string_literal345 = match( T__60, TOKENS_FOLLOWING_T__60_IN_mutation_statement_2054 )

          tree_for_string_literal345 = @adaptor.create_with_payload( string_literal345 )
          @adaptor.add_child( root_0, tree_for_string_literal345 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_statement_2056 )
          path346 = path
          @state.following.pop
          @adaptor.add_child( root_0, path346.tree )
          # --> action

          			id = '_' + self.next_id
          			@now[id] = { '_self' => id,
          				'_context' => 'mutation',
          				'_type' => 'delete',
          				'_value' => self.to_ref(( path346 && @input.to_s( path346.start, path346.stop ) ))
          			}
          		
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 720:4: reference 'add(' value ')'
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2065 )
          reference347 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference347.tree )
          string_literal348 = match( T__61, TOKENS_FOLLOWING_T__61_IN_mutation_statement_2067 )

          tree_for_string_literal348 = @adaptor.create_with_payload( string_literal348 )
          @adaptor.add_child( root_0, tree_for_string_literal348 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_2069 )
          value349 = value
          @state.following.pop
          @adaptor.add_child( root_0, value349.tree )
          char_literal350 = match( T__38, TOKENS_FOLLOWING_T__38_IN_mutation_statement_2071 )

          tree_for_char_literal350 = @adaptor.create_with_payload( char_literal350 )
          @adaptor.add_child( root_0, tree_for_char_literal350 )

          # --> action

          			return_value.key = ( reference347.nil? ? nil : reference347.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'add',
          				'_value' => ( value349.nil? ? nil : value349.val )
          			}
          		
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 728:4: reference 'remove(' value ')'
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2080 )
          reference351 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference351.tree )
          string_literal352 = match( T__62, TOKENS_FOLLOWING_T__62_IN_mutation_statement_2082 )

          tree_for_string_literal352 = @adaptor.create_with_payload( string_literal352 )
          @adaptor.add_child( root_0, tree_for_string_literal352 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_2084 )
          value353 = value
          @state.following.pop
          @adaptor.add_child( root_0, value353.tree )
          char_literal354 = match( T__38, TOKENS_FOLLOWING_T__38_IN_mutation_statement_2086 )

          tree_for_char_literal354 = @adaptor.create_with_payload( char_literal354 )
          @adaptor.add_child( root_0, tree_for_char_literal354 )

          # --> action

          			return_value.key = ( reference351.nil? ? nil : reference351.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'remove',
          				'_value' => ( value353.nil? ? nil : value353.val )
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
        # trace_out( __method__, 43 )

      end
      
      return return_value
    end

    SetValueReturnValue = define_return_scope :val

    # 
    # parser rule set_value
    # 
    # (in SFP.g)
    # 738:1: set_value returns [val] : '(' set_item ( ',' set_item )* ')' ;
    # 
    def set_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )
      return_value = SetValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal355 = nil
      char_literal357 = nil
      char_literal359 = nil
      set_item356 = nil
      set_item358 = nil

      tree_for_char_literal355 = nil
      tree_for_char_literal357 = nil
      tree_for_char_literal359 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 739:4: '(' set_item ( ',' set_item )* ')'
        char_literal355 = match( T__36, TOKENS_FOLLOWING_T__36_IN_set_value_2105 )

        tree_for_char_literal355 = @adaptor.create_with_payload( char_literal355 )
        @adaptor.add_child( root_0, tree_for_char_literal355 )

        # --> action
        	@set = Array.new	
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_2113 )
        set_item356 = set_item
        @state.following.pop
        @adaptor.add_child( root_0, set_item356.tree )
        # at line 741:12: ( ',' set_item )*
        while true # decision 128
          alt_128 = 2
          look_128_0 = @input.peek( 1 )

          if ( look_128_0 == T__37 )
            alt_128 = 1

          end
          case alt_128
          when 1
            # at line 741:13: ',' set_item
            char_literal357 = match( T__37, TOKENS_FOLLOWING_T__37_IN_set_value_2116 )

            tree_for_char_literal357 = @adaptor.create_with_payload( char_literal357 )
            @adaptor.add_child( root_0, tree_for_char_literal357 )

            @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_2118 )
            set_item358 = set_item
            @state.following.pop
            @adaptor.add_child( root_0, set_item358.tree )

          else
            break # out of loop for decision 128
          end
        end # loop for decision 128
        # --> action
        	return_value.val = @set	
        # <-- action
        char_literal359 = match( T__38, TOKENS_FOLLOWING_T__38_IN_set_value_2128 )

        tree_for_char_literal359 = @adaptor.create_with_payload( char_literal359 )
        @adaptor.add_child( root_0, tree_for_char_literal359 )

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

    SetItemReturnValue = define_return_scope 

    # 
    # parser rule set_item
    # 
    # (in SFP.g)
    # 746:1: set_item : value ;
    # 
    def set_item
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )
      return_value = SetItemReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      value360 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 747:4: value
        @state.following.push( TOKENS_FOLLOWING_value_IN_set_item_2139 )
        value360 = value
        @state.following.pop
        @adaptor.add_child( root_0, value360.tree )
        # --> action
        	@set.push(( value360.nil? ? nil : value360.val ))	
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
        # trace_out( __method__, 45 )

      end
      
      return return_value
    end

    ValueReturnValue = define_return_scope :val

    # 
    # parser rule value
    # 
    # (in SFP.g)
    # 751:1: value returns [val] : ( primitive_value | reference | set_value );
    # 
    def value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )
      return_value = ValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      primitive_value361 = nil
      reference362 = nil
      set_value363 = nil


      begin
        # at line 752:2: ( primitive_value | reference | set_value )
        alt_129 = 3
        case look_129 = @input.peek( 1 )
        when STRING, NUMBER, BOOLEAN, MULTILINE_STRING then alt_129 = 1
        when ID then alt_129 = 2
        when T__36 then alt_129 = 3
        else
          raise NoViableAlternative( "", 129, 0 )
        end
        case alt_129
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 752:4: primitive_value
          @state.following.push( TOKENS_FOLLOWING_primitive_value_IN_value_2158 )
          primitive_value361 = primitive_value
          @state.following.pop
          @adaptor.add_child( root_0, primitive_value361.tree )
          # --> action
          	return_value.val = ( primitive_value361.nil? ? nil : primitive_value361.val )	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 754:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_value_2167 )
          reference362 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference362.tree )
          # --> action
          	return_value.val = ( reference362.nil? ? nil : reference362.val )	
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 756:4: set_value
          @state.following.push( TOKENS_FOLLOWING_set_value_IN_value_2176 )
          set_value363 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value363.tree )
          # --> action
          	return_value.val = ( set_value363.nil? ? nil : set_value363.val )	
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
        # trace_out( __method__, 46 )

      end
      
      return return_value
    end

    PrimitiveValueReturnValue = define_return_scope :val

    # 
    # parser rule primitive_value
    # 
    # (in SFP.g)
    # 760:1: primitive_value returns [val] : ( BOOLEAN | NUMBER | STRING | MULTILINE_STRING );
    # 
    def primitive_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 47 )
      return_value = PrimitiveValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __BOOLEAN364__ = nil
      __NUMBER365__ = nil
      __STRING366__ = nil
      __MULTILINE_STRING367__ = nil

      tree_for_BOOLEAN364 = nil
      tree_for_NUMBER365 = nil
      tree_for_STRING366 = nil
      tree_for_MULTILINE_STRING367 = nil

      begin
        # at line 761:2: ( BOOLEAN | NUMBER | STRING | MULTILINE_STRING )
        alt_130 = 4
        case look_130 = @input.peek( 1 )
        when BOOLEAN then alt_130 = 1
        when NUMBER then alt_130 = 2
        when STRING then alt_130 = 3
        when MULTILINE_STRING then alt_130 = 4
        else
          raise NoViableAlternative( "", 130, 0 )
        end
        case alt_130
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 761:4: BOOLEAN
          __BOOLEAN364__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_2195 )

          tree_for_BOOLEAN364 = @adaptor.create_with_payload( __BOOLEAN364__ )
          @adaptor.add_child( root_0, tree_for_BOOLEAN364 )

          # --> action

          			if __BOOLEAN364__.text == 'true' or __BOOLEAN364__.text == 'on' or __BOOLEAN364__.text == 'yes'
          				return_value.val = true
          			else  # 'false', 'no', 'off'
          				return_value.val = false
          			end
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 769:4: NUMBER
          __NUMBER365__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_primitive_value_2204 )

          tree_for_NUMBER365 = @adaptor.create_with_payload( __NUMBER365__ )
          @adaptor.add_child( root_0, tree_for_NUMBER365 )

          # --> action
          	return_value.val = __NUMBER365__.text.to_f	
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 771:4: STRING
          __STRING366__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_primitive_value_2213 )

          tree_for_STRING366 = @adaptor.create_with_payload( __STRING366__ )
          @adaptor.add_child( root_0, tree_for_STRING366 )

          # --> action
          	return_value.val = __STRING366__.text[1,__STRING366__.text.length-2]	
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 773:4: MULTILINE_STRING
          __MULTILINE_STRING367__ = match( MULTILINE_STRING, TOKENS_FOLLOWING_MULTILINE_STRING_IN_primitive_value_2222 )

          tree_for_MULTILINE_STRING367 = @adaptor.create_with_payload( __MULTILINE_STRING367__ )
          @adaptor.add_child( root_0, tree_for_MULTILINE_STRING367 )

          # --> action
          	return_value.val = __MULTILINE_STRING367__.text[2, __MULTILINE_STRING367__.text.length-2]	
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
        # trace_out( __method__, 47 )

      end
      
      return return_value
    end

    PathReturnValue = define_return_scope 

    # 
    # parser rule path
    # 
    # (in SFP.g)
    # 777:1: path : ID ( '.' ID )* ;
    # 
    def path
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 48 )
      return_value = PathReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID368__ = nil
      char_literal369 = nil
      __ID370__ = nil

      tree_for_ID368 = nil
      tree_for_char_literal369 = nil
      tree_for_ID370 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 778:4: ID ( '.' ID )*
        __ID368__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_2237 )

        tree_for_ID368 = @adaptor.create_with_payload( __ID368__ )
        @adaptor.add_child( root_0, tree_for_ID368 )

        # at line 778:6: ( '.' ID )*
        while true # decision 131
          alt_131 = 2
          look_131_0 = @input.peek( 1 )

          if ( look_131_0 == T__63 )
            alt_131 = 1

          end
          case alt_131
          when 1
            # at line 778:7: '.' ID
            char_literal369 = match( T__63, TOKENS_FOLLOWING_T__63_IN_path_2239 )

            tree_for_char_literal369 = @adaptor.create_with_payload( char_literal369 )
            @adaptor.add_child( root_0, tree_for_char_literal369 )

            __ID370__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_2240 )

            tree_for_ID370 = @adaptor.create_with_payload( __ID370__ )
            @adaptor.add_child( root_0, tree_for_ID370 )


          else
            break # out of loop for decision 131
          end
        end # loop for decision 131
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

    PathWithIndexReturnValue = define_return_scope 

    # 
    # parser rule path_with_index
    # 
    # (in SFP.g)
    # 781:1: path_with_index : id_ref ( '.' id_ref )* ;
    # 
    def path_with_index
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 49 )
      return_value = PathWithIndexReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal372 = nil
      id_ref371 = nil
      id_ref373 = nil

      tree_for_char_literal372 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 782:4: id_ref ( '.' id_ref )*
        @state.following.push( TOKENS_FOLLOWING_id_ref_IN_path_with_index_2253 )
        id_ref371 = id_ref
        @state.following.pop
        @adaptor.add_child( root_0, id_ref371.tree )
        # at line 782:10: ( '.' id_ref )*
        while true # decision 132
          alt_132 = 2
          look_132_0 = @input.peek( 1 )

          if ( look_132_0 == T__63 )
            alt_132 = 1

          end
          case alt_132
          when 1
            # at line 782:11: '.' id_ref
            char_literal372 = match( T__63, TOKENS_FOLLOWING_T__63_IN_path_with_index_2255 )

            tree_for_char_literal372 = @adaptor.create_with_payload( char_literal372 )
            @adaptor.add_child( root_0, tree_for_char_literal372 )

            @state.following.push( TOKENS_FOLLOWING_id_ref_IN_path_with_index_2256 )
            id_ref373 = id_ref
            @state.following.pop
            @adaptor.add_child( root_0, id_ref373.tree )

          else
            break # out of loop for decision 132
          end
        end # loop for decision 132
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
        # trace_out( __method__, 49 )

      end
      
      return return_value
    end

    IdRefReturnValue = define_return_scope 

    # 
    # parser rule id_ref
    # 
    # (in SFP.g)
    # 785:1: id_ref : ID ( '[' NUMBER ']' )? ;
    # 
    def id_ref
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 50 )
      return_value = IdRefReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID374__ = nil
      char_literal375 = nil
      __NUMBER376__ = nil
      char_literal377 = nil

      tree_for_ID374 = nil
      tree_for_char_literal375 = nil
      tree_for_NUMBER376 = nil
      tree_for_char_literal377 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 786:4: ID ( '[' NUMBER ']' )?
        __ID374__ = match( ID, TOKENS_FOLLOWING_ID_IN_id_ref_2269 )

        tree_for_ID374 = @adaptor.create_with_payload( __ID374__ )
        @adaptor.add_child( root_0, tree_for_ID374 )

        # at line 786:6: ( '[' NUMBER ']' )?
        alt_133 = 2
        look_133_0 = @input.peek( 1 )

        if ( look_133_0 == T__26 )
          alt_133 = 1
        end
        case alt_133
        when 1
          # at line 786:7: '[' NUMBER ']'
          char_literal375 = match( T__26, TOKENS_FOLLOWING_T__26_IN_id_ref_2271 )

          tree_for_char_literal375 = @adaptor.create_with_payload( char_literal375 )
          @adaptor.add_child( root_0, tree_for_char_literal375 )

          __NUMBER376__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_id_ref_2273 )

          tree_for_NUMBER376 = @adaptor.create_with_payload( __NUMBER376__ )
          @adaptor.add_child( root_0, tree_for_NUMBER376 )

          char_literal377 = match( T__27, TOKENS_FOLLOWING_T__27_IN_id_ref_2275 )

          tree_for_char_literal377 = @adaptor.create_with_payload( char_literal377 )
          @adaptor.add_child( root_0, tree_for_char_literal377 )


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
        # trace_out( __method__, 50 )

      end
      
      return return_value
    end

    ReferenceReturnValue = define_return_scope :val

    # 
    # parser rule reference
    # 
    # (in SFP.g)
    # 789:1: reference returns [val] : path_with_index ;
    # 
    def reference
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 51 )
      return_value = ReferenceReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      path_with_index378 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 790:4: path_with_index
        @state.following.push( TOKENS_FOLLOWING_path_with_index_IN_reference_2292 )
        path_with_index378 = path_with_index
        @state.following.pop
        @adaptor.add_child( root_0, path_with_index378.tree )
        # --> action
        	return_value.val = self.to_ref(( path_with_index378 && @input.to_s( path_with_index378.start, path_with_index378.stop ) ))	
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
        # trace_out( __method__, 51 )

      end
      
      return return_value
    end

    ReferenceTypeReturnValue = define_return_scope :val

    # 
    # parser rule reference_type
    # 
    # (in SFP.g)
    # 794:1: reference_type returns [val] : 'isref' path ;
    # 
    def reference_type
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 52 )
      return_value = ReferenceTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal379 = nil
      path380 = nil

      tree_for_string_literal379 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 795:4: 'isref' path
        string_literal379 = match( T__64, TOKENS_FOLLOWING_T__64_IN_reference_type_2311 )

        tree_for_string_literal379 = @adaptor.create_with_payload( string_literal379 )
        @adaptor.add_child( root_0, tree_for_string_literal379 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_reference_type_2313 )
        path380 = path
        @state.following.pop
        @adaptor.add_child( root_0, path380.tree )
        # --> action

        			return_value.val = { '_context' => 'null',
        				'_isa' => self.to_ref(( path380 && @input.to_s( path380.start, path380.stop ) ))
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
        # trace_out( __method__, 52 )

      end
      
      return return_value
    end

    EqualsOpReturnValue = define_return_scope 

    # 
    # parser rule equals_op
    # 
    # (in SFP.g)
    # 803:1: equals_op : ( '=' | 'is' );
    # 
    def equals_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 53 )
      return_value = EqualsOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set381 = nil

      tree_for_set381 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set381 = @input.look
        if @input.peek(1) == T__52 || @input.peek(1) == T__54
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set381 ) )
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
        # trace_out( __method__, 53 )

      end
      
      return return_value
    end

    NotEqualsOpReturnValue = define_return_scope 

    # 
    # parser rule not_equals_op
    # 
    # (in SFP.g)
    # 808:1: not_equals_op : ( '!=' | 'isnt' );
    # 
    def not_equals_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 54 )
      return_value = NotEqualsOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set382 = nil

      tree_for_set382 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set382 = @input.look
        if @input.peek(1) == T__56 || @input.peek(1) == T__65
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set382 ) )
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
        # trace_out( __method__, 54 )

      end
      
      return return_value
    end

    BinaryOpReturnValue = define_return_scope 

    # 
    # parser rule binary_op
    # 
    # (in SFP.g)
    # 813:1: binary_op : ( '+=' | '-=' | '*=' | '/=' );
    # 
    def binary_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 55 )
      return_value = BinaryOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set383 = nil

      tree_for_set383 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set383 = @input.look
        if @input.peek( 1 ).between?( T__66, T__69 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set383 ) )
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
        # trace_out( __method__, 55 )

      end
      
      return return_value
    end

    BinaryCompReturnValue = define_return_scope 

    # 
    # parser rule binary_comp
    # 
    # (in SFP.g)
    # 820:1: binary_comp : ( '>' | '>=' | '<' | '<=' );
    # 
    def binary_comp
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 56 )
      return_value = BinaryCompReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set384 = nil

      tree_for_set384 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set384 = @input.look
        if @input.peek( 1 ).between?( T__70, T__73 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set384 ) )
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
        # trace_out( __method__, 56 )

      end
      
      return return_value
    end



    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA36 < ANTLR3::DFA
      EOT = unpack( 4, -1 )
      EOF = unpack( 4, -1 )
      MIN = unpack( 2, 4, 2, -1 )
      MAX = unpack( 1, 30, 1, 31, 2, -1 )
      ACCEPT = unpack( 2, -1, 1, 1, 1, 2 )
      SPECIAL = unpack( 4, -1 )
      TRANSITION = [
        unpack( 1, 1, 25, -1, 1, 2 ),
        unpack( 1, 1, 1, -1, 1, 3, 14, -1, 1, 3, 6, -1, 1, 3, 1, -1, 1, 
                 2, 1, 3 ),
        unpack(  ),
        unpack(  )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 36
      

      def description
        <<-'__dfa_description__'.strip!
          ()* loopback of 173:3: ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )*
        __dfa_description__
      end
    end
    class DFA69 < ANTLR3::DFA
      EOT = unpack( 8, -1 )
      EOF = unpack( 8, -1 )
      MIN = unpack( 1, 6, 1, 4, 3, -1, 1, 6, 1, -1, 1, 4 )
      MAX = unpack( 1, 58, 1, 73, 3, -1, 1, 6, 1, -1, 1, 73 )
      ACCEPT = unpack( 2, -1, 1, 1, 1, 3, 1, 4, 1, -1, 1, 2, 1, -1 )
      SPECIAL = unpack( 8, -1 )
      TRANSITION = [
        unpack( 1, 1, 21, -1, 1, 2, 18, -1, 1, 3, 1, -1, 3, 4, 6, -1, 1, 
                2 ),
        unpack( 1, 6, 15, -1, 1, 6, 5, -1, 1, 2, 25, -1, 1, 2, 1, -1, 4, 
                 2, 5, -1, 1, 5, 1, -1, 1, 2, 4, -1, 4, 2 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 7 ),
        unpack(  ),
        unpack( 1, 6, 15, -1, 1, 6, 5, -1, 1, 2, 25, -1, 1, 2, 1, -1, 4, 
                 2, 5, -1, 1, 5, 1, -1, 1, 2, 4, -1, 4, 2 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 69
      

      def description
        <<-'__dfa_description__'.strip!
          315:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification )
        __dfa_description__
      end
    end
    class DFA97 < ANTLR3::DFA
      EOT = unpack( 8, -1 )
      EOF = unpack( 8, -1 )
      MIN = unpack( 1, 6, 1, 4, 3, -1, 1, 6, 1, -1, 1, 4 )
      MAX = unpack( 1, 58, 1, 73, 3, -1, 1, 6, 1, -1, 1, 73 )
      ACCEPT = unpack( 2, -1, 1, 1, 1, 3, 1, 4, 1, -1, 1, 2, 1, -1 )
      SPECIAL = unpack( 8, -1 )
      TRANSITION = [
        unpack( 1, 1, 21, -1, 1, 2, 18, -1, 1, 3, 1, -1, 3, 4, 6, -1, 1, 
                2 ),
        unpack( 1, 6, 15, -1, 1, 6, 5, -1, 1, 2, 25, -1, 1, 2, 1, -1, 4, 
                 2, 5, -1, 1, 5, 1, -1, 1, 2, 4, -1, 4, 2 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 7 ),
        unpack(  ),
        unpack( 1, 6, 15, -1, 1, 6, 5, -1, 1, 2, 25, -1, 1, 2, 1, -1, 4, 
                 2, 5, -1, 1, 5, 1, -1, 1, 2, 4, -1, 4, 2 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 97
      

      def description
        <<-'__dfa_description__'.strip!
          420:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification )
        __dfa_description__
      end
    end
    class DFA116 < ANTLR3::DFA
      EOT = unpack( 23, -1 )
      EOF = unpack( 23, -1 )
      MIN = unpack( 1, 6, 1, 26, 2, -1, 1, 7, 1, 6, 3, 5, 1, -1, 1, 5, 2, 
                    -1, 1, 27, 1, 26, 4, -1, 1, 52, 1, 7, 1, 27, 1, 52 )
      MAX = unpack( 1, 58, 1, 73, 2, -1, 1, 7, 1, 6, 2, 55, 1, 36, 1, -1, 
                    1, 36, 2, -1, 1, 27, 1, 73, 4, -1, 1, 73, 1, 7, 1, 27, 
                    1, 73 )
      ACCEPT = unpack( 2, -1, 1, 5, 1, 9, 5, -1, 1, 6, 1, -1, 1, 7, 1, 8, 
                       2, -1, 1, 1, 1, 2, 1, 3, 1, 4, 4, -1 )
      SPECIAL = unpack( 23, -1 )
      TRANSITION = [
        unpack( 1, 1, 21, -1, 1, 2, 29, -1, 1, 3 ),
        unpack( 1, 4, 25, -1, 1, 8, 1, -1, 1, 6, 1, 9, 1, 7, 1, 11, 5, 
                 -1, 1, 5, 1, -1, 1, 10, 4, -1, 4, 12 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 13 ),
        unpack( 1, 14 ),
        unpack( 3, 15, 1, 16, 2, 15, 25, -1, 1, 15, 18, -1, 1, 9 ),
        unpack( 3, 17, 1, 18, 2, 17, 25, -1, 1, 17, 18, -1, 1, 11 ),
        unpack( 3, 15, 1, 16, 2, 15, 25, -1, 1, 15 ),
        unpack(  ),
        unpack( 3, 17, 1, 18, 2, 17, 25, -1, 1, 17 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 19 ),
        unpack( 1, 20, 25, -1, 1, 8, 1, -1, 1, 6, 1, 9, 1, 7, 1, 11, 5, 
                 -1, 1, 5, 1, -1, 1, 10, 4, -1, 4, 12 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 8, 1, -1, 1, 6, 1, 9, 1, 7, 1, 11, 5, -1, 1, 5, 1, -1, 
                 1, 10, 4, -1, 4, 12 ),
        unpack( 1, 21 ),
        unpack( 1, 22 ),
        unpack( 1, 8, 1, -1, 1, 6, 1, 9, 1, 7, 1, 11, 5, -1, 1, 5, 1, -1, 
                 1, 10, 4, -1, 4, 12 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 116
      

      def description
        <<-'__dfa_description__'.strip!
          531:1: constraint_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | conditional_constraint | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | reference binary_comp comp_value | total_constraint );
        __dfa_description__
      end
    end
    class DFA127 < ANTLR3::DFA
      EOT = unpack( 19, -1 )
      EOF = unpack( 19, -1 )
      MIN = unpack( 1, 6, 1, 26, 1, -1, 1, 7, 1, 6, 1, 5, 1, -1, 1, 5, 2, 
                    -1, 1, 27, 1, 26, 3, -1, 1, 52, 1, 7, 1, 27, 1, 52 )
      MAX = unpack( 1, 60, 1, 69, 1, -1, 1, 7, 1, 6, 1, 59, 1, -1, 1, 36, 
                    2, -1, 1, 27, 1, 69, 3, -1, 1, 69, 1, 7, 1, 27, 1, 69 )
      ACCEPT = unpack( 2, -1, 1, 5, 3, -1, 1, 3, 1, -1, 1, 6, 1, 7, 2, -1, 
                       1, 4, 1, 1, 1, 2, 4, -1 )
      SPECIAL = unpack( 19, -1 )
      TRANSITION = [
        unpack( 1, 1, 53, -1, 1, 2 ),
        unpack( 1, 3, 25, -1, 1, 7, 1, -1, 1, 5, 6, -1, 1, 8, 1, 9, 1, 
                 4, 2, -1, 4, 6 ),
        unpack(  ),
        unpack( 1, 10 ),
        unpack( 1, 11 ),
        unpack( 3, 13, 1, 14, 2, 13, 25, -1, 1, 13, 22, -1, 1, 12 ),
        unpack(  ),
        unpack( 3, 13, 1, 14, 2, 13, 25, -1, 1, 13 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 15 ),
        unpack( 1, 16, 25, -1, 1, 7, 1, -1, 1, 5, 6, -1, 1, 8, 1, 9, 1, 
                 4, 2, -1, 4, 6 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 7, 1, -1, 1, 5, 6, -1, 1, 8, 1, 9, 1, 4, 2, -1, 4, 6 ),
        unpack( 1, 17 ),
        unpack( 1, 18 ),
        unpack( 1, 7, 1, -1, 1, 5, 6, -1, 1, 8, 1, 9, 1, 4, 2, -1, 4, 6 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 127
      

      def description
        <<-'__dfa_description__'.strip!
          669:1: mutation_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' );
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa36 = DFA36.new( self, 36 )
      @dfa69 = DFA69.new( self, 69 )
      @dfa97 = DFA97.new( self, 97 )
      @dfa116 = DFA116.new( self, 116 )
      @dfa127 = DFA127.new( self, 127 )

    end
    TOKENS_FOLLOWING_NL_IN_sfp_49 = Set[ 1, 4, 6, 18, 22, 23, 35, 40 ]
    TOKENS_FOLLOWING_include_IN_sfp_52 = Set[ 1, 6, 18, 22, 23, 35, 40 ]
    TOKENS_FOLLOWING_header_IN_sfp_55 = Set[ 1, 6, 22, 23, 35, 40 ]
    TOKENS_FOLLOWING_state_IN_sfp_65 = Set[ 1, 6, 22, 40 ]
    TOKENS_FOLLOWING_composite_IN_sfp_69 = Set[ 1, 6, 22, 40 ]
    TOKENS_FOLLOWING_constraint_IN_sfp_73 = Set[ 1, 6, 22, 40 ]
    TOKENS_FOLLOWING_goal_constraint_IN_sfp_77 = Set[ 1, 6, 22, 40 ]
    TOKENS_FOLLOWING_T__18_IN_include_90 = Set[ 5 ]
    TOKENS_FOLLOWING_include_file_IN_include_92 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_include_94 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_STRING_IN_include_file_106 = Set[ 1 ]
    TOKENS_FOLLOWING_class_definition_IN_header_122 = Set[ 1 ]
    TOKENS_FOLLOWING_procedure_IN_header_127 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_state_138 = Set[ 19, 20 ]
    TOKENS_FOLLOWING_T__19_IN_state_141 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_151 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_NL_IN_state_153 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_attribute_IN_state_158 = Set[ 6, 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_163 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_state_165 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__22_IN_composite_181 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_composite_183 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_composite_191 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_NL_IN_composite_193 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_attribute_IN_composite_198 = Set[ 6, 21 ]
    TOKENS_FOLLOWING_constraint_IN_composite_202 = Set[ 6, 21 ]
    TOKENS_FOLLOWING_T__21_IN_composite_207 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_composite_209 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__23_IN_class_definition_225 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_class_definition_227 = Set[ 1, 4, 20, 24 ]
    TOKENS_FOLLOWING_extends_class_IN_class_definition_236 = Set[ 1, 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_class_definition_250 = Set[ 4, 6, 21, 23, 35 ]
    TOKENS_FOLLOWING_NL_IN_class_definition_252 = Set[ 4, 6, 21, 23, 35 ]
    TOKENS_FOLLOWING_attribute_IN_class_definition_257 = Set[ 6, 21, 23, 35 ]
    TOKENS_FOLLOWING_procedure_IN_class_definition_261 = Set[ 6, 21, 23, 35 ]
    TOKENS_FOLLOWING_T__21_IN_class_definition_266 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_class_definition_270 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__24_IN_extends_class_291 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_extends_class_293 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_attribute_308 = Set[ 52, 54 ]
    TOKENS_FOLLOWING_equals_op_IN_attribute_310 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_attribute_312 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_314 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_attribute_324 = Set[ 64 ]
    TOKENS_FOLLOWING_reference_type_IN_attribute_326 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_328 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_object_def_IN_attribute_338 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_340 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_object_def_352 = Set[ 1, 20, 25 ]
    TOKENS_FOLLOWING_T__25_IN_object_def_361 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_object_def_363 = Set[ 1, 20, 26 ]
    TOKENS_FOLLOWING_T__26_IN_object_def_365 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_object_def_367 = Set[ 27 ]
    TOKENS_FOLLOWING_T__27_IN_object_def_371 = Set[ 1, 20 ]
    TOKENS_FOLLOWING_object_body_IN_object_def_386 = Set[ 1 ]
    TOKENS_FOLLOWING_T__20_IN_object_body_402 = Set[ 4, 6, 21, 28, 31 ]
    TOKENS_FOLLOWING_NL_IN_object_body_404 = Set[ 4, 6, 21, 28, 31 ]
    TOKENS_FOLLOWING_object_attribute_IN_object_body_409 = Set[ 6, 21, 28, 31 ]
    TOKENS_FOLLOWING_state_dependency_IN_object_body_413 = Set[ 6, 21, 28, 31 ]
    TOKENS_FOLLOWING_operator_IN_object_body_417 = Set[ 6, 21, 28, 31 ]
    TOKENS_FOLLOWING_T__21_IN_object_body_422 = Set[ 1 ]
    TOKENS_FOLLOWING_attribute_IN_object_attribute_433 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_object_attribute_438 = Set[ 52, 54 ]
    TOKENS_FOLLOWING_equals_op_IN_object_attribute_440 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_object_attribute_442 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_object_attribute_444 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__28_IN_state_dependency_460 = Set[ 6 ]
    TOKENS_FOLLOWING_dep_effect_IN_state_dependency_464 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_466 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_T__29_IN_state_dependency_469 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_471 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_dependency_474 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 58 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_478 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 58 ]
    TOKENS_FOLLOWING_constraint_body_IN_state_dependency_481 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_dependency_486 = Set[ 4, 30 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_492 = Set[ 4, 30 ]
    TOKENS_FOLLOWING_T__30_IN_state_dependency_495 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_497 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_dependency_500 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 58 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_504 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 58 ]
    TOKENS_FOLLOWING_constraint_body_IN_state_dependency_507 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_dependency_511 = Set[ 4, 30 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_517 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_reference_IN_dep_effect_529 = Set[ 52, 54 ]
    TOKENS_FOLLOWING_equals_op_IN_dep_effect_531 = Set[ 5, 6, 7, 8, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_dep_effect_538 = Set[ 1 ]
    TOKENS_FOLLOWING_NULL_IN_dep_effect_544 = Set[ 1 ]
    TOKENS_FOLLOWING_T__31_IN_operator_560 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_operator_562 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_operator_564 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_NL_IN_operator_566 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_T__32_IN_operator_577 = Set[ 52, 54 ]
    TOKENS_FOLLOWING_equals_op_IN_operator_579 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_operator_581 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_operator_583 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_op_conditions_IN_operator_602 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_op_effects_IN_operator_605 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_operator_609 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_operator_611 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_op_param_627 = Set[ 52, 54 ]
    TOKENS_FOLLOWING_equals_op_IN_op_param_629 = Set[ 6 ]
    TOKENS_FOLLOWING_reference_IN_op_param_631 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_param_633 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__33_IN_op_conditions_649 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_op_conditions_651 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_NL_IN_op_conditions_653 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_op_statement_IN_op_conditions_662 = Set[ 6, 21 ]
    TOKENS_FOLLOWING_T__21_IN_op_conditions_667 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_conditions_669 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__34_IN_op_effects_685 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_op_effects_687 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_NL_IN_op_effects_689 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_op_statement_IN_op_effects_698 = Set[ 6, 21 ]
    TOKENS_FOLLOWING_T__21_IN_op_effects_703 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_effects_705 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_reference_IN_op_statement_721 = Set[ 52, 54 ]
    TOKENS_FOLLOWING_equals_op_IN_op_statement_723 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_op_statement_725 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_statement_727 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__35_IN_procedure_743 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_procedure_745 = Set[ 20, 36 ]
    TOKENS_FOLLOWING_parameters_IN_procedure_753 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_procedure_756 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_NL_IN_procedure_758 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_T__32_IN_procedure_766 = Set[ 52, 54 ]
    TOKENS_FOLLOWING_equals_op_IN_procedure_768 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_procedure_770 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_procedure_780 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_conditions_IN_procedure_790 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_effects_IN_procedure_793 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_procedure_795 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_procedure_797 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__36_IN_parameters_813 = Set[ 6 ]
    TOKENS_FOLLOWING_parameter_IN_parameters_815 = Set[ 37, 38 ]
    TOKENS_FOLLOWING_T__37_IN_parameters_818 = Set[ 6 ]
    TOKENS_FOLLOWING_parameter_IN_parameters_820 = Set[ 37, 38 ]
    TOKENS_FOLLOWING_T__38_IN_parameters_824 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_836 = Set[ 64 ]
    TOKENS_FOLLOWING_reference_type_IN_parameter_838 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_847 = Set[ 39 ]
    TOKENS_FOLLOWING_T__39_IN_parameter_849 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_parameter_851 = Set[ 1 ]
    TOKENS_FOLLOWING_T__33_IN_conditions_866 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_conditions_874 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 58 ]
    TOKENS_FOLLOWING_NL_IN_conditions_876 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 58 ]
    TOKENS_FOLLOWING_constraint_body_IN_conditions_879 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_conditions_881 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_conditions_883 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__34_IN_effects_900 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_effects_908 = Set[ 4, 6, 21, 47, 60 ]
    TOKENS_FOLLOWING_NL_IN_effects_910 = Set[ 4, 6, 21, 47, 60 ]
    TOKENS_FOLLOWING_mutation_body_IN_effects_916 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_effects_921 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_effects_923 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__40_IN_goal_constraint_939 = Set[ 4, 20, 41 ]
    TOKENS_FOLLOWING_T__41_IN_goal_constraint_941 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_constraint_944 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_constraint_953 = Set[ 4, 6, 21, 28, 42, 43, 44, 45, 46, 47, 49, 50, 51, 58 ]
    TOKENS_FOLLOWING_NL_IN_goal_constraint_955 = Set[ 4, 6, 21, 28, 42, 43, 44, 45, 46, 47, 49, 50, 51, 58 ]
    TOKENS_FOLLOWING_goal_body_IN_goal_constraint_958 = Set[ 6, 21, 28, 42, 43, 44, 45, 46, 47, 49, 50, 51, 58 ]
    TOKENS_FOLLOWING_T__21_IN_goal_constraint_961 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_constraint_963 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_constraint_statement_IN_goal_body_986 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_namespace_IN_goal_body_999 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_iterator_IN_goal_body_1006 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_class_quantification_IN_goal_body_1013 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1022 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__42_IN_goal_body_1029 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1031 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1040 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 58 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1042 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 58 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1045 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1047 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1049 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__43_IN_goal_body_1059 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1061 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1070 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 58 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1072 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 58 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1075 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1077 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1079 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__44_IN_goal_body_1093 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_goal_body_1095 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1097 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1106 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 58 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1108 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 58 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1111 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1113 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1115 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__45_IN_goal_body_1125 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1127 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1136 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 58 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1138 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 58 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1141 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1143 = Set[ 4, 29, 44 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1145 = Set[ 4, 29, 44 ]
    TOKENS_FOLLOWING_T__29_IN_goal_body_1156 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__44_IN_goal_body_1163 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_goal_body_1165 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1177 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1186 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 58 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1188 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 58 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1191 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1193 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1195 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__46_IN_goal_body_1213 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1215 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1224 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 58 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1226 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 58 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1229 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1231 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1233 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_T__29_IN_goal_body_1242 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1244 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1253 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 58 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1255 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 58 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1258 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1260 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1262 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__20_IN_nested_constraint_1282 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 58 ]
    TOKENS_FOLLOWING_NL_IN_nested_constraint_1284 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 58 ]
    TOKENS_FOLLOWING_constraint_body_IN_nested_constraint_1287 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_nested_constraint_1289 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_constraint_1300 = Set[ 41 ]
    TOKENS_FOLLOWING_T__41_IN_constraint_1302 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_1310 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 58 ]
    TOKENS_FOLLOWING_NL_IN_constraint_1312 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 58 ]
    TOKENS_FOLLOWING_constraint_body_IN_constraint_1315 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_1317 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_1319 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_1342 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_namespace_IN_constraint_body_1355 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_iterator_IN_constraint_body_1362 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_class_quantification_IN_constraint_body_1369 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_body_1378 = Set[ 1, 4, 6, 28, 47, 49, 50, 51, 58 ]
    TOKENS_FOLLOWING_path_IN_constraint_namespace_1392 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1394 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_namespace_1397 = Set[ 4, 6, 21, 28, 58 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1399 = Set[ 4, 6, 21, 28, 58 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_namespace_1403 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1411 = Set[ 4, 6, 21, 28, 58 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_namespace_1416 = Set[ 1 ]
    TOKENS_FOLLOWING_T__47_IN_constraint_iterator_1427 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_constraint_iterator_1429 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_constraint_iterator_1431 = Set[ 48 ]
    TOKENS_FOLLOWING_T__48_IN_constraint_iterator_1433 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_constraint_iterator_1435 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_constraint_iterator_1437 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1439 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_iterator_1442 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1444 = Set[ 4, 6, 21, 28, 58 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_iterator_1454 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1462 = Set[ 4, 6, 21, 28, 58 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_iterator_1469 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_quantification_keyword_0 = Set[ 1 ]
    TOKENS_FOLLOWING_quantification_keyword_IN_constraint_class_quantification_1505 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_constraint_class_quantification_1507 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_constraint_class_quantification_1509 = Set[ 48 ]
    TOKENS_FOLLOWING_T__48_IN_constraint_class_quantification_1511 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_constraint_class_quantification_1513 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_constraint_class_quantification_1515 = Set[ 4, 20, 52, 70, 71, 72, 73 ]
    TOKENS_FOLLOWING_binary_comp_IN_constraint_class_quantification_1527 = Set[ 7 ]
    TOKENS_FOLLOWING_T__52_IN_constraint_class_quantification_1540 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_constraint_class_quantification_1556 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1570 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_class_quantification_1573 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1575 = Set[ 4, 6, 21, 28, 53, 58 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_class_quantification_1582 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1592 = Set[ 4, 6, 21, 28, 53, 58 ]
    TOKENS_FOLLOWING_constraint_different_IN_constraint_class_quantification_1599 = Set[ 6, 21, 28, 53, 58 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_class_quantification_1606 = Set[ 1 ]
    TOKENS_FOLLOWING_T__53_IN_constraint_different_1625 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_constraint_different_1627 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_constraint_different_1629 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_constraint_different_1631 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_different_1633 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1653 = Set[ 52, 54 ]
    TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1655 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_1657 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1666 = Set[ 52, 54 ]
    TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1668 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_1670 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1679 = Set[ 56, 65 ]
    TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1681 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_1683 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1692 = Set[ 56, 65 ]
    TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1694 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_1696 = Set[ 1 ]
    TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_1705 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1714 = Set[ 54, 55 ]
    TOKENS_FOLLOWING_T__54_IN_constraint_statement_1716 = Set[ 55 ]
    TOKENS_FOLLOWING_T__55_IN_constraint_statement_1719 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_1721 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1730 = Set[ 56, 57 ]
    TOKENS_FOLLOWING_set_IN_constraint_statement_1732 = Set[ 55 ]
    TOKENS_FOLLOWING_T__55_IN_constraint_statement_1738 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_1740 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1749 = Set[ 70, 71, 72, 73 ]
    TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_1751 = Set[ 6, 7 ]
    TOKENS_FOLLOWING_comp_value_IN_constraint_statement_1753 = Set[ 1 ]
    TOKENS_FOLLOWING_total_constraint_IN_constraint_statement_1762 = Set[ 1 ]
    TOKENS_FOLLOWING_T__58_IN_total_constraint_1773 = Set[ 6 ]
    TOKENS_FOLLOWING_total_statement_IN_total_constraint_1775 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_total_constraint_1777 = Set[ 70, 71, 72, 73 ]
    TOKENS_FOLLOWING_binary_comp_IN_total_constraint_1779 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_total_constraint_1781 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_total_statement_1792 = Set[ 52, 54 ]
    TOKENS_FOLLOWING_equals_op_IN_total_statement_1794 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_total_statement_1796 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_comp_value_1811 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_comp_value_1820 = Set[ 1 ]
    TOKENS_FOLLOWING_T__28_IN_conditional_constraint_1839 = Set[ 6, 28, 58 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_1847 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_NL_IN_conditional_constraint_1849 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_conditional_constraint_then_IN_conditional_constraint_1858 = Set[ 1 ]
    TOKENS_FOLLOWING_T__29_IN_conditional_constraint_then_1873 = Set[ 6, 28, 58 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_1875 = Set[ 1 ]
    TOKENS_FOLLOWING_mutation_statement_IN_mutation_body_1897 = Set[ 4 ]
    TOKENS_FOLLOWING_mutation_iterator_IN_mutation_body_1910 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_body_1919 = Set[ 1, 4, 6, 47, 60 ]
    TOKENS_FOLLOWING_T__47_IN_mutation_iterator_1934 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_iterator_1936 = Set[ 48 ]
    TOKENS_FOLLOWING_T__48_IN_mutation_iterator_1938 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_mutation_iterator_1940 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_1942 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_mutation_iterator_1945 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_1947 = Set[ 4, 6, 21, 60 ]
    TOKENS_FOLLOWING_mutation_statement_IN_mutation_iterator_1957 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_1965 = Set[ 4, 6, 21, 60 ]
    TOKENS_FOLLOWING_T__21_IN_mutation_iterator_1972 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1991 = Set[ 52, 54 ]
    TOKENS_FOLLOWING_equals_op_IN_mutation_statement_1993 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_1995 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2004 = Set[ 52, 54 ]
    TOKENS_FOLLOWING_equals_op_IN_mutation_statement_2006 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_mutation_statement_2008 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2017 = Set[ 66, 67, 68, 69 ]
    TOKENS_FOLLOWING_binary_op_IN_mutation_statement_2019 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_mutation_statement_2021 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2030 = Set[ 54 ]
    TOKENS_FOLLOWING_T__54_IN_mutation_statement_2032 = Set[ 59 ]
    TOKENS_FOLLOWING_T__59_IN_mutation_statement_2034 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_statement_2036 = Set[ 1, 20 ]
    TOKENS_FOLLOWING_object_body_IN_mutation_statement_2044 = Set[ 1 ]
    TOKENS_FOLLOWING_T__60_IN_mutation_statement_2054 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_statement_2056 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2065 = Set[ 61 ]
    TOKENS_FOLLOWING_T__61_IN_mutation_statement_2067 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_2069 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_mutation_statement_2071 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2080 = Set[ 62 ]
    TOKENS_FOLLOWING_T__62_IN_mutation_statement_2082 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_2084 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_mutation_statement_2086 = Set[ 1 ]
    TOKENS_FOLLOWING_T__36_IN_set_value_2105 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_2113 = Set[ 37, 38 ]
    TOKENS_FOLLOWING_T__37_IN_set_value_2116 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_2118 = Set[ 37, 38 ]
    TOKENS_FOLLOWING_T__38_IN_set_value_2128 = Set[ 1 ]
    TOKENS_FOLLOWING_value_IN_set_item_2139 = Set[ 1 ]
    TOKENS_FOLLOWING_primitive_value_IN_value_2158 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_value_2167 = Set[ 1 ]
    TOKENS_FOLLOWING_set_value_IN_value_2176 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_2195 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_primitive_value_2204 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_primitive_value_2213 = Set[ 1 ]
    TOKENS_FOLLOWING_MULTILINE_STRING_IN_primitive_value_2222 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_path_2237 = Set[ 1, 63 ]
    TOKENS_FOLLOWING_T__63_IN_path_2239 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_path_2240 = Set[ 1, 63 ]
    TOKENS_FOLLOWING_id_ref_IN_path_with_index_2253 = Set[ 1, 63 ]
    TOKENS_FOLLOWING_T__63_IN_path_with_index_2255 = Set[ 6 ]
    TOKENS_FOLLOWING_id_ref_IN_path_with_index_2256 = Set[ 1, 63 ]
    TOKENS_FOLLOWING_ID_IN_id_ref_2269 = Set[ 1, 26 ]
    TOKENS_FOLLOWING_T__26_IN_id_ref_2271 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_id_ref_2273 = Set[ 27 ]
    TOKENS_FOLLOWING_T__27_IN_id_ref_2275 = Set[ 1 ]
    TOKENS_FOLLOWING_path_with_index_IN_reference_2292 = Set[ 1 ]
    TOKENS_FOLLOWING_T__64_IN_reference_type_2311 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_reference_type_2313 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_not_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_comp_0 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end

