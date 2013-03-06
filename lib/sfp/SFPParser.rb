#!/usr/bin/env ruby
#
# SFP.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: SFP.g
# Generated at: 2013-03-06 16:26:23
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
    define_tokens( :T__68 => 68, :T__69 => 69, :T__66 => 66, :EXPONENT => 14, 
                   :T__67 => 67, :T__64 => 64, :T__29 => 29, :T__65 => 65, 
                   :T__28 => 28, :T__62 => 62, :T__27 => 27, :T__63 => 63, 
                   :T__26 => 26, :T__25 => 25, :T__24 => 24, :T__23 => 23, 
                   :T__22 => 22, :T__21 => 21, :T__20 => 20, :OCTAL_ESC => 17, 
                   :ID => 6, :T__61 => 61, :T__60 => 60, :EOF => -1, :T__55 => 55, 
                   :T__19 => 19, :T__56 => 56, :T__57 => 57, :T__58 => 58, 
                   :ESC_SEQ => 13, :BOOLEAN => 9, :T__51 => 51, :T__52 => 52, 
                   :T__18 => 18, :T__53 => 53, :T__54 => 54, :T__59 => 59, 
                   :NL => 4, :COMMENT => 11, :T__50 => 50, :T__42 => 42, 
                   :T__43 => 43, :T__40 => 40, :T__41 => 41, :T__46 => 46, 
                   :T__47 => 47, :T__44 => 44, :T__45 => 45, :T__48 => 48, 
                   :T__49 => 49, :UNICODE_ESC => 16, :NULL => 8, :NUMBER => 7, 
                   :HEX_DIGIT => 15, :MULTILINE_STRING => 10, :T__30 => 30, 
                   :T__31 => 31, :T__32 => 32, :WS => 12, :T__71 => 71, 
                   :T__33 => 33, :T__72 => 72, :T__34 => 34, :T__35 => 35, 
                   :T__70 => 70, :T__36 => 36, :T__37 => 37, :T__38 => 38, 
                   :T__39 => 39, :T__75 => 75, :T__74 => 74, :T__73 => 73, 
                   :STRING => 5 )

    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "NL", "STRING", "ID", "NUMBER", "NULL", "BOOLEAN", "MULTILINE_STRING", 
                    "COMMENT", "WS", "ESC_SEQ", "EXPONENT", "HEX_DIGIT", 
                    "UNICODE_ESC", "OCTAL_ESC", "'include'", "'state'", 
                    "'{'", "'}'", "'composite'", "'class'", "'extends'", 
                    "'isa'", "'['", "']'", "'if'", "'then'", "'or'", "'operator'", 
                    "'cost'", "'conditions'", "'effects'", "'procedure'", 
                    "'('", "','", "')'", "'areall'", "'isset'", "'goal'", 
                    "'constraint'", "'always'", "'sometime'", "'within'", 
                    "'after'", "'before'", "'foreach'", "'as'", "'forall'", 
                    "'exist'", "'forsome'", "'='", "':different'", "'not'", 
                    "'is'", "'in'", "'isnt'", "'total('", "'new'", "'delete'", 
                    "'add('", "'remove('", "'.'", "'isref'", "'either'", 
                    "'!='", "'+='", "'-='", "'*='", "'/='", "'>'", "'>='", 
                    "'<'", "'<='" )
    
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
                     :comp_value, :conditional_constraint, :conditional_constraint_if_part, 
                     :conditional_constraint_then_part, :mutation_body, 
                     :mutation_iterator, :mutation_statement, :set_value, 
                     :set_item, :value, :primitive_value, :path, :path_with_index, 
                     :id_ref, :reference, :reference_type, :set_type, :probability_op, 
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

          if ( look_4_2 == T__42 )
            alt_4 = 3
          elsif ( look_4_2.between?( T__19, T__20 ) )
            alt_4 = 1

          end
          when T__22 then alt_4 = 2
          when T__41 then alt_4 = 4
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

            if ( look_12_2 == T__42 )
              alt_12 = 2
            elsif ( look_12_2 == NL || look_12_2 == T__20 || look_12_2 == T__25 || look_12_2 == T__40 || look_12_2 == T__53 || look_12_2 == T__56 || look_12_2.between?( T__65, T__66 ) )
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
    # 115:1: attribute : ( ID equals_op value ( NL )+ | ID reference_type ( NL )+ | ID set_type ( NL )+ | ID probability_op set_value ( NL )+ | object_def ( NL )+ );
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
      __ID47__ = nil
      __NL49__ = nil
      __ID50__ = nil
      __NL53__ = nil
      __NL55__ = nil
      equals_op41 = nil
      value42 = nil
      reference_type45 = nil
      set_type48 = nil
      probability_op51 = nil
      set_value52 = nil
      object_def54 = nil

      tree_for_ID40 = nil
      tree_for_NL43 = nil
      tree_for_ID44 = nil
      tree_for_NL46 = nil
      tree_for_ID47 = nil
      tree_for_NL49 = nil
      tree_for_ID50 = nil
      tree_for_NL53 = nil
      tree_for_NL55 = nil

      begin
        # at line 116:2: ( ID equals_op value ( NL )+ | ID reference_type ( NL )+ | ID set_type ( NL )+ | ID probability_op set_value ( NL )+ | object_def ( NL )+ )
        alt_24 = 5
        look_24_0 = @input.peek( 1 )

        if ( look_24_0 == ID )
          case look_24 = @input.peek( 2 )
          when T__53, T__56 then alt_24 = 1
          when T__65 then alt_24 = 2
          when T__40 then alt_24 = 3
          when T__66 then alt_24 = 4
          when NL, T__20, T__25 then alt_24 = 5
          else
            raise NoViableAlternative( "", 24, 1 )
          end
        else
          raise NoViableAlternative( "", 24, 0 )
        end
        case alt_24
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

          			if @now.has_key?(__ID40__.text) and @now[__ID40__.text].is_a?(Hash) and
          					@now[__ID40__.text].isset and ( value42.nil? ? nil : value42.type ) == 'Set'
          				( value42.nil? ? nil : value42.val ).each { |v| @now[__ID40__.text]['_values'].push(v) }
          			else
          				@now[__ID40__.text] = ( value42.nil? ? nil : value42.val )
          			end
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 125:4: ID reference_type ( NL )+
          __ID44__ = match( ID, TOKENS_FOLLOWING_ID_IN_attribute_324 )

          tree_for_ID44 = @adaptor.create_with_payload( __ID44__ )
          @adaptor.add_child( root_0, tree_for_ID44 )

          @state.following.push( TOKENS_FOLLOWING_reference_type_IN_attribute_326 )
          reference_type45 = reference_type
          @state.following.pop
          @adaptor.add_child( root_0, reference_type45.tree )
          # at file 125:22: ( NL )+
          match_count_20 = 0
          while true
            alt_20 = 2
            look_20_0 = @input.peek( 1 )

            if ( look_20_0 == NL )
              alt_20 = 1

            end
            case alt_20
            when 1
              # at line 125:22: NL
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


          # at line 127:4: ID set_type ( NL )+
          __ID47__ = match( ID, TOKENS_FOLLOWING_ID_IN_attribute_338 )

          tree_for_ID47 = @adaptor.create_with_payload( __ID47__ )
          @adaptor.add_child( root_0, tree_for_ID47 )

          @state.following.push( TOKENS_FOLLOWING_set_type_IN_attribute_340 )
          set_type48 = set_type
          @state.following.pop
          @adaptor.add_child( root_0, set_type48.tree )
          # at file 127:16: ( NL )+
          match_count_21 = 0
          while true
            alt_21 = 2
            look_21_0 = @input.peek( 1 )

            if ( look_21_0 == NL )
              alt_21 = 1

            end
            case alt_21
            when 1
              # at line 127:16: NL
              __NL49__ = match( NL, TOKENS_FOLLOWING_NL_IN_attribute_342 )

              tree_for_NL49 = @adaptor.create_with_payload( __NL49__ )
              @adaptor.add_child( root_0, tree_for_NL49 )


            else
              match_count_21 > 0 and break
              eee = EarlyExit(21)


              raise eee
            end
            match_count_21 += 1
          end

          # --> action
          	@now[__ID47__.text] = ( set_type48.nil? ? nil : set_type48.val )	
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 129:4: ID probability_op set_value ( NL )+
          __ID50__ = match( ID, TOKENS_FOLLOWING_ID_IN_attribute_352 )

          tree_for_ID50 = @adaptor.create_with_payload( __ID50__ )
          @adaptor.add_child( root_0, tree_for_ID50 )

          @state.following.push( TOKENS_FOLLOWING_probability_op_IN_attribute_354 )
          probability_op51 = probability_op
          @state.following.pop
          @adaptor.add_child( root_0, probability_op51.tree )
          @state.following.push( TOKENS_FOLLOWING_set_value_IN_attribute_356 )
          set_value52 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value52.tree )
          # at file 129:32: ( NL )+
          match_count_22 = 0
          while true
            alt_22 = 2
            look_22_0 = @input.peek( 1 )

            if ( look_22_0 == NL )
              alt_22 = 1

            end
            case alt_22
            when 1
              # at line 129:32: NL
              __NL53__ = match( NL, TOKENS_FOLLOWING_NL_IN_attribute_358 )

              tree_for_NL53 = @adaptor.create_with_payload( __NL53__ )
              @adaptor.add_child( root_0, tree_for_NL53 )


            else
              match_count_22 > 0 and break
              eee = EarlyExit(22)


              raise eee
            end
            match_count_22 += 1
          end

          # --> action
           	
          			@conformant = true
          			@now[__ID50__.text] = { '_self' => __ID50__.text,
          				'_context' => 'either',
          				'_parent' => @now,
          				'_values' => ( set_value52.nil? ? nil : set_value52.val )
          			}
          		
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 138:4: object_def ( NL )+
          @state.following.push( TOKENS_FOLLOWING_object_def_IN_attribute_368 )
          object_def54 = object_def
          @state.following.pop
          @adaptor.add_child( root_0, object_def54.tree )
          # at file 138:15: ( NL )+
          match_count_23 = 0
          while true
            alt_23 = 2
            look_23_0 = @input.peek( 1 )

            if ( look_23_0 == NL )
              alt_23 = 1

            end
            case alt_23
            when 1
              # at line 138:15: NL
              __NL55__ = match( NL, TOKENS_FOLLOWING_NL_IN_attribute_370 )

              tree_for_NL55 = @adaptor.create_with_payload( __NL55__ )
              @adaptor.add_child( root_0, tree_for_NL55 )


            else
              match_count_23 > 0 and break
              eee = EarlyExit(23)


              raise eee
            end
            match_count_23 += 1
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
    # 141:1: object_def : ID ( 'isa' path ( '[' NUMBER ']' )? )? ( object_body )? ;
    # 
    def object_def
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )
      return_value = ObjectDefReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID56__ = nil
      string_literal57 = nil
      char_literal59 = nil
      __NUMBER60__ = nil
      char_literal61 = nil
      path58 = nil
      object_body62 = nil

      tree_for_ID56 = nil
      tree_for_string_literal57 = nil
      tree_for_char_literal59 = nil
      tree_for_NUMBER60 = nil
      tree_for_char_literal61 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 142:4: ID ( 'isa' path ( '[' NUMBER ']' )? )? ( object_body )?
        __ID56__ = match( ID, TOKENS_FOLLOWING_ID_IN_object_def_382 )

        tree_for_ID56 = @adaptor.create_with_payload( __ID56__ )
        @adaptor.add_child( root_0, tree_for_ID56 )

        # --> action

        			@now[__ID56__.text] = {	'_self' => __ID56__.text,
        				'_context' => 'object',
        				'_parent' => @now,
        				'_isa' => '$.Object'
        			}
        			@now = @now[__ID56__.text]
        			@now['_is_array'] = false
        		
        # <-- action
        # at line 152:3: ( 'isa' path ( '[' NUMBER ']' )? )?
        alt_26 = 2
        look_26_0 = @input.peek( 1 )

        if ( look_26_0 == T__25 )
          alt_26 = 1
        end
        case alt_26
        when 1
          # at line 152:4: 'isa' path ( '[' NUMBER ']' )?
          string_literal57 = match( T__25, TOKENS_FOLLOWING_T__25_IN_object_def_391 )

          tree_for_string_literal57 = @adaptor.create_with_payload( string_literal57 )
          @adaptor.add_child( root_0, tree_for_string_literal57 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_object_def_393 )
          path58 = path
          @state.following.pop
          @adaptor.add_child( root_0, path58.tree )
          # at line 152:14: ( '[' NUMBER ']' )?
          alt_25 = 2
          look_25_0 = @input.peek( 1 )

          if ( look_25_0 == T__26 )
            alt_25 = 1
          end
          case alt_25
          when 1
            # at line 152:15: '[' NUMBER ']'
            char_literal59 = match( T__26, TOKENS_FOLLOWING_T__26_IN_object_def_395 )

            tree_for_char_literal59 = @adaptor.create_with_payload( char_literal59 )
            @adaptor.add_child( root_0, tree_for_char_literal59 )

            __NUMBER60__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_object_def_397 )

            tree_for_NUMBER60 = @adaptor.create_with_payload( __NUMBER60__ )
            @adaptor.add_child( root_0, tree_for_NUMBER60 )

            # --> action
             @now['_is_array'] = true 
            # <-- action
            char_literal61 = match( T__27, TOKENS_FOLLOWING_T__27_IN_object_def_401 )

            tree_for_char_literal61 = @adaptor.create_with_payload( char_literal61 )
            @adaptor.add_child( root_0, tree_for_char_literal61 )


          end
          # --> action

          			@now['_isa'] = self.to_ref(( path58 && @input.to_s( path58.start, path58.stop ) ))
          			self.expand_object(@now)
          		
          # <-- action

        end
        # at line 158:3: ( object_body )?
        alt_27 = 2
        look_27_0 = @input.peek( 1 )

        if ( look_27_0 == T__20 )
          alt_27 = 1
        end
        case alt_27
        when 1
          # at line 158:3: object_body
          @state.following.push( TOKENS_FOLLOWING_object_body_IN_object_def_416 )
          object_body62 = object_body
          @state.following.pop
          @adaptor.add_child( root_0, object_body62.tree )

        end
        # --> action

        			if @now['_is_array']
        				@now.delete('_is_array')
        				obj = self.goto_parent()
        				total = __NUMBER60__.to_s.to_i
        				@arrays[obj.ref] = total
        				for i in 0..(total-1)
        					id = obj['_self'] + "[#{i}]"
        					@now[id] = deep_clone(obj)
        					@now[id]['_self'] = id
        					@now[id]['_classes'] = obj['_classes']
        					#puts 'is_array: ' + __ID56__.text + '[' + i.to_s + ']'
        				end
        				@now.delete(obj['_self'])
        			else
        				self.goto_parent()
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
    # 179:1: object_body : '{' ( NL )* ( object_attribute | state_dependency | operator )* '}' ;
    # 
    def object_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )
      return_value = ObjectBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal63 = nil
      __NL64__ = nil
      char_literal68 = nil
      object_attribute65 = nil
      state_dependency66 = nil
      operator67 = nil

      tree_for_char_literal63 = nil
      tree_for_NL64 = nil
      tree_for_char_literal68 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 180:4: '{' ( NL )* ( object_attribute | state_dependency | operator )* '}'
        char_literal63 = match( T__20, TOKENS_FOLLOWING_T__20_IN_object_body_432 )

        tree_for_char_literal63 = @adaptor.create_with_payload( char_literal63 )
        @adaptor.add_child( root_0, tree_for_char_literal63 )

        # at line 180:8: ( NL )*
        while true # decision 28
          alt_28 = 2
          look_28_0 = @input.peek( 1 )

          if ( look_28_0 == NL )
            alt_28 = 1

          end
          case alt_28
          when 1
            # at line 180:8: NL
            __NL64__ = match( NL, TOKENS_FOLLOWING_NL_IN_object_body_434 )

            tree_for_NL64 = @adaptor.create_with_payload( __NL64__ )
            @adaptor.add_child( root_0, tree_for_NL64 )


          else
            break # out of loop for decision 28
          end
        end # loop for decision 28
        # at line 180:12: ( object_attribute | state_dependency | operator )*
        while true # decision 29
          alt_29 = 4
          case look_29 = @input.peek( 1 )
          when ID then alt_29 = 1
          when T__28 then alt_29 = 2
          when T__31 then alt_29 = 3
          end
          case alt_29
          when 1
            # at line 180:14: object_attribute
            @state.following.push( TOKENS_FOLLOWING_object_attribute_IN_object_body_439 )
            object_attribute65 = object_attribute
            @state.following.pop
            @adaptor.add_child( root_0, object_attribute65.tree )

          when 2
            # at line 180:33: state_dependency
            @state.following.push( TOKENS_FOLLOWING_state_dependency_IN_object_body_443 )
            state_dependency66 = state_dependency
            @state.following.pop
            @adaptor.add_child( root_0, state_dependency66.tree )

          when 3
            # at line 180:52: operator
            @state.following.push( TOKENS_FOLLOWING_operator_IN_object_body_447 )
            operator67 = operator
            @state.following.pop
            @adaptor.add_child( root_0, operator67.tree )

          else
            break # out of loop for decision 29
          end
        end # loop for decision 29
        char_literal68 = match( T__21, TOKENS_FOLLOWING_T__21_IN_object_body_452 )

        tree_for_char_literal68 = @adaptor.create_with_payload( char_literal68 )
        @adaptor.add_child( root_0, tree_for_char_literal68 )

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
    # 183:1: object_attribute : ( attribute | ID equals_op NULL ( NL )+ );
    # 
    def object_attribute
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )
      return_value = ObjectAttributeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID70__ = nil
      __NULL72__ = nil
      __NL73__ = nil
      attribute69 = nil
      equals_op71 = nil

      tree_for_ID70 = nil
      tree_for_NULL72 = nil
      tree_for_NL73 = nil

      begin
        # at line 184:2: ( attribute | ID equals_op NULL ( NL )+ )
        alt_31 = 2
        look_31_0 = @input.peek( 1 )

        if ( look_31_0 == ID )
          look_31_1 = @input.peek( 2 )

          if ( look_31_1 == T__53 || look_31_1 == T__56 )
            look_31_2 = @input.peek( 3 )

            if ( look_31_2.between?( STRING, NUMBER ) || look_31_2.between?( BOOLEAN, MULTILINE_STRING ) || look_31_2 == T__36 )
              alt_31 = 1
            elsif ( look_31_2 == NULL )
              alt_31 = 2
            else
              raise NoViableAlternative( "", 31, 2 )
            end
          elsif ( look_31_1 == NL || look_31_1 == T__20 || look_31_1 == T__25 || look_31_1 == T__40 || look_31_1.between?( T__65, T__66 ) )
            alt_31 = 1
          else
            raise NoViableAlternative( "", 31, 1 )
          end
        else
          raise NoViableAlternative( "", 31, 0 )
        end
        case alt_31
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 184:4: attribute
          @state.following.push( TOKENS_FOLLOWING_attribute_IN_object_attribute_463 )
          attribute69 = attribute
          @state.following.pop
          @adaptor.add_child( root_0, attribute69.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 185:4: ID equals_op NULL ( NL )+
          __ID70__ = match( ID, TOKENS_FOLLOWING_ID_IN_object_attribute_468 )

          tree_for_ID70 = @adaptor.create_with_payload( __ID70__ )
          @adaptor.add_child( root_0, tree_for_ID70 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_object_attribute_470 )
          equals_op71 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op71.tree )
          __NULL72__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_object_attribute_472 )

          tree_for_NULL72 = @adaptor.create_with_payload( __NULL72__ )
          @adaptor.add_child( root_0, tree_for_NULL72 )

          # at file 185:22: ( NL )+
          match_count_30 = 0
          while true
            alt_30 = 2
            look_30_0 = @input.peek( 1 )

            if ( look_30_0 == NL )
              alt_30 = 1

            end
            case alt_30
            when 1
              # at line 185:22: NL
              __NL73__ = match( NL, TOKENS_FOLLOWING_NL_IN_object_attribute_474 )

              tree_for_NL73 = @adaptor.create_with_payload( __NL73__ )
              @adaptor.add_child( root_0, tree_for_NL73 )


            else
              match_count_30 > 0 and break
              eee = EarlyExit(30)


              raise eee
            end
            match_count_30 += 1
          end

          # --> action
          	@now[__ID70__.text] = self.null_value	
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
    # 189:1: state_dependency : 'if' dep_effect ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )* ( NL )+ ;
    # 
    def state_dependency
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )
      return_value = StateDependencyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal74 = nil
      __NL76__ = nil
      string_literal77 = nil
      __NL78__ = nil
      char_literal79 = nil
      __NL80__ = nil
      char_literal82 = nil
      __NL83__ = nil
      string_literal84 = nil
      __NL85__ = nil
      char_literal86 = nil
      __NL87__ = nil
      char_literal89 = nil
      __NL90__ = nil
      dep_effect75 = nil
      constraint_body81 = nil
      constraint_body88 = nil

      tree_for_string_literal74 = nil
      tree_for_NL76 = nil
      tree_for_string_literal77 = nil
      tree_for_NL78 = nil
      tree_for_char_literal79 = nil
      tree_for_NL80 = nil
      tree_for_char_literal82 = nil
      tree_for_NL83 = nil
      tree_for_string_literal84 = nil
      tree_for_NL85 = nil
      tree_for_char_literal86 = nil
      tree_for_NL87 = nil
      tree_for_char_literal89 = nil
      tree_for_NL90 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 190:4: 'if' dep_effect ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )* ( NL )+
        string_literal74 = match( T__28, TOKENS_FOLLOWING_T__28_IN_state_dependency_490 )

        tree_for_string_literal74 = @adaptor.create_with_payload( string_literal74 )
        @adaptor.add_child( root_0, tree_for_string_literal74 )

        @state.following.push( TOKENS_FOLLOWING_dep_effect_IN_state_dependency_494 )
        dep_effect75 = dep_effect
        @state.following.pop
        @adaptor.add_child( root_0, dep_effect75.tree )
        # at line 191:14: ( NL )*
        while true # decision 32
          alt_32 = 2
          look_32_0 = @input.peek( 1 )

          if ( look_32_0 == NL )
            alt_32 = 1

          end
          case alt_32
          when 1
            # at line 191:14: NL
            __NL76__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_496 )

            tree_for_NL76 = @adaptor.create_with_payload( __NL76__ )
            @adaptor.add_child( root_0, tree_for_NL76 )


          else
            break # out of loop for decision 32
          end
        end # loop for decision 32
        string_literal77 = match( T__29, TOKENS_FOLLOWING_T__29_IN_state_dependency_499 )

        tree_for_string_literal77 = @adaptor.create_with_payload( string_literal77 )
        @adaptor.add_child( root_0, tree_for_string_literal77 )

        # at line 191:25: ( NL )*
        while true # decision 33
          alt_33 = 2
          look_33_0 = @input.peek( 1 )

          if ( look_33_0 == NL )
            alt_33 = 1

          end
          case alt_33
          when 1
            # at line 191:25: NL
            __NL78__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_501 )

            tree_for_NL78 = @adaptor.create_with_payload( __NL78__ )
            @adaptor.add_child( root_0, tree_for_NL78 )


          else
            break # out of loop for decision 33
          end
        end # loop for decision 33
        char_literal79 = match( T__20, TOKENS_FOLLOWING_T__20_IN_state_dependency_504 )

        tree_for_char_literal79 = @adaptor.create_with_payload( char_literal79 )
        @adaptor.add_child( root_0, tree_for_char_literal79 )

        # at line 192:3: ( NL )*
        while true # decision 34
          alt_34 = 2
          look_34_0 = @input.peek( 1 )

          if ( look_34_0 == NL )
            alt_34 = 1

          end
          case alt_34
          when 1
            # at line 192:3: NL
            __NL80__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_508 )

            tree_for_NL80 = @adaptor.create_with_payload( __NL80__ )
            @adaptor.add_child( root_0, tree_for_NL80 )


          else
            break # out of loop for decision 34
          end
        end # loop for decision 34
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_state_dependency_511 )
        constraint_body81 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body81.tree )
        char_literal82 = match( T__21, TOKENS_FOLLOWING_T__21_IN_state_dependency_516 )

        tree_for_char_literal82 = @adaptor.create_with_payload( char_literal82 )
        @adaptor.add_child( root_0, tree_for_char_literal82 )

        # at line 194:3: ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )*
        while true # decision 38
          alt_38 = 2
          alt_38 = @dfa38.predict( @input )
          case alt_38
          when 1
            # at line 194:5: ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}'
            # at line 194:5: ( NL )*
            while true # decision 35
              alt_35 = 2
              look_35_0 = @input.peek( 1 )

              if ( look_35_0 == NL )
                alt_35 = 1

              end
              case alt_35
              when 1
                # at line 194:5: NL
                __NL83__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_522 )

                tree_for_NL83 = @adaptor.create_with_payload( __NL83__ )
                @adaptor.add_child( root_0, tree_for_NL83 )


              else
                break # out of loop for decision 35
              end
            end # loop for decision 35
            string_literal84 = match( T__30, TOKENS_FOLLOWING_T__30_IN_state_dependency_525 )

            tree_for_string_literal84 = @adaptor.create_with_payload( string_literal84 )
            @adaptor.add_child( root_0, tree_for_string_literal84 )

            # at line 194:14: ( NL )*
            while true # decision 36
              alt_36 = 2
              look_36_0 = @input.peek( 1 )

              if ( look_36_0 == NL )
                alt_36 = 1

              end
              case alt_36
              when 1
                # at line 194:14: NL
                __NL85__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_527 )

                tree_for_NL85 = @adaptor.create_with_payload( __NL85__ )
                @adaptor.add_child( root_0, tree_for_NL85 )


              else
                break # out of loop for decision 36
              end
            end # loop for decision 36
            char_literal86 = match( T__20, TOKENS_FOLLOWING_T__20_IN_state_dependency_530 )

            tree_for_char_literal86 = @adaptor.create_with_payload( char_literal86 )
            @adaptor.add_child( root_0, tree_for_char_literal86 )

            # at line 195:3: ( NL )*
            while true # decision 37
              alt_37 = 2
              look_37_0 = @input.peek( 1 )

              if ( look_37_0 == NL )
                alt_37 = 1

              end
              case alt_37
              when 1
                # at line 195:3: NL
                __NL87__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_534 )

                tree_for_NL87 = @adaptor.create_with_payload( __NL87__ )
                @adaptor.add_child( root_0, tree_for_NL87 )


              else
                break # out of loop for decision 37
              end
            end # loop for decision 37
            @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_state_dependency_537 )
            constraint_body88 = constraint_body
            @state.following.pop
            @adaptor.add_child( root_0, constraint_body88.tree )
            char_literal89 = match( T__21, TOKENS_FOLLOWING_T__21_IN_state_dependency_541 )

            tree_for_char_literal89 = @adaptor.create_with_payload( char_literal89 )
            @adaptor.add_child( root_0, tree_for_char_literal89 )


          else
            break # out of loop for decision 38
          end
        end # loop for decision 38
        # at file 197:3: ( NL )+
        match_count_39 = 0
        while true
          alt_39 = 2
          look_39_0 = @input.peek( 1 )

          if ( look_39_0 == NL )
            alt_39 = 1

          end
          case alt_39
          when 1
            # at line 197:3: NL
            __NL90__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_547 )

            tree_for_NL90 = @adaptor.create_with_payload( __NL90__ )
            @adaptor.add_child( root_0, tree_for_NL90 )


          else
            match_count_39 > 0 and break
            eee = EarlyExit(39)


            raise eee
          end
          match_count_39 += 1
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
    # 200:1: dep_effect : reference equals_op ( value | NULL ) ;
    # 
    def dep_effect
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )
      return_value = DepEffectReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL94__ = nil
      reference91 = nil
      equals_op92 = nil
      value93 = nil

      tree_for_NULL94 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 201:4: reference equals_op ( value | NULL )
        @state.following.push( TOKENS_FOLLOWING_reference_IN_dep_effect_559 )
        reference91 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference91.tree )
        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_dep_effect_561 )
        equals_op92 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op92.tree )
        # at line 202:3: ( value | NULL )
        alt_40 = 2
        look_40_0 = @input.peek( 1 )

        if ( look_40_0.between?( STRING, NUMBER ) || look_40_0.between?( BOOLEAN, MULTILINE_STRING ) || look_40_0 == T__36 )
          alt_40 = 1
        elsif ( look_40_0 == NULL )
          alt_40 = 2
        else
          raise NoViableAlternative( "", 40, 0 )
        end
        case alt_40
        when 1
          # at line 202:5: value
          @state.following.push( TOKENS_FOLLOWING_value_IN_dep_effect_568 )
          value93 = value
          @state.following.pop
          @adaptor.add_child( root_0, value93.tree )

        when 2
          # at line 203:5: NULL
          __NULL94__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_dep_effect_574 )

          tree_for_NULL94 = @adaptor.create_with_payload( __NULL94__ )
          @adaptor.add_child( root_0, tree_for_NULL94 )


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
    # 207:1: operator : 'operator' ID '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( op_conditions )? op_effects '}' ( NL )+ ;
    # 
    def operator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )
      return_value = OperatorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal95 = nil
      __ID96__ = nil
      char_literal97 = nil
      __NL98__ = nil
      string_literal99 = nil
      __NUMBER101__ = nil
      __NL102__ = nil
      char_literal105 = nil
      __NL106__ = nil
      equals_op100 = nil
      op_conditions103 = nil
      op_effects104 = nil

      tree_for_string_literal95 = nil
      tree_for_ID96 = nil
      tree_for_char_literal97 = nil
      tree_for_NL98 = nil
      tree_for_string_literal99 = nil
      tree_for_NUMBER101 = nil
      tree_for_NL102 = nil
      tree_for_char_literal105 = nil
      tree_for_NL106 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 208:4: 'operator' ID '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( op_conditions )? op_effects '}' ( NL )+
        string_literal95 = match( T__31, TOKENS_FOLLOWING_T__31_IN_operator_590 )

        tree_for_string_literal95 = @adaptor.create_with_payload( string_literal95 )
        @adaptor.add_child( root_0, tree_for_string_literal95 )

        __ID96__ = match( ID, TOKENS_FOLLOWING_ID_IN_operator_592 )

        tree_for_ID96 = @adaptor.create_with_payload( __ID96__ )
        @adaptor.add_child( root_0, tree_for_ID96 )

        char_literal97 = match( T__20, TOKENS_FOLLOWING_T__20_IN_operator_594 )

        tree_for_char_literal97 = @adaptor.create_with_payload( char_literal97 )
        @adaptor.add_child( root_0, tree_for_char_literal97 )

        # at line 208:22: ( NL )*
        while true # decision 41
          alt_41 = 2
          look_41_0 = @input.peek( 1 )

          if ( look_41_0 == NL )
            alt_41 = 1

          end
          case alt_41
          when 1
            # at line 208:22: NL
            __NL98__ = match( NL, TOKENS_FOLLOWING_NL_IN_operator_596 )

            tree_for_NL98 = @adaptor.create_with_payload( __NL98__ )
            @adaptor.add_child( root_0, tree_for_NL98 )


          else
            break # out of loop for decision 41
          end
        end # loop for decision 41
        # --> action

        			@now[__ID96__.text] = { '_self' => __ID96__.text,
        				'_context' => 'operator',
        				'_parent' => @now,
        				'_cost' => 1,
        				'_condition' => { '_context' => 'constraint' },
        				'_effect' => { '_context' => 'mutation' }
        			}
        			@now = @now[__ID96__.text]
        		
        # <-- action
        # at line 219:3: ( 'cost' equals_op NUMBER ( NL )+ )?
        alt_43 = 2
        look_43_0 = @input.peek( 1 )

        if ( look_43_0 == T__32 )
          alt_43 = 1
        end
        case alt_43
        when 1
          # at line 219:5: 'cost' equals_op NUMBER ( NL )+
          string_literal99 = match( T__32, TOKENS_FOLLOWING_T__32_IN_operator_607 )

          tree_for_string_literal99 = @adaptor.create_with_payload( string_literal99 )
          @adaptor.add_child( root_0, tree_for_string_literal99 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_operator_609 )
          equals_op100 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op100.tree )
          __NUMBER101__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_operator_611 )

          tree_for_NUMBER101 = @adaptor.create_with_payload( __NUMBER101__ )
          @adaptor.add_child( root_0, tree_for_NUMBER101 )

          # at file 219:29: ( NL )+
          match_count_42 = 0
          while true
            alt_42 = 2
            look_42_0 = @input.peek( 1 )

            if ( look_42_0 == NL )
              alt_42 = 1

            end
            case alt_42
            when 1
              # at line 219:29: NL
              __NL102__ = match( NL, TOKENS_FOLLOWING_NL_IN_operator_613 )

              tree_for_NL102 = @adaptor.create_with_payload( __NL102__ )
              @adaptor.add_child( root_0, tree_for_NL102 )


            else
              match_count_42 > 0 and break
              eee = EarlyExit(42)


              raise eee
            end
            match_count_42 += 1
          end

          # --> action
          	@now['_cost'] = __NUMBER101__.text.to_i	
          # <-- action

        end
        # at line 223:3: ( op_conditions )?
        alt_44 = 2
        look_44_0 = @input.peek( 1 )

        if ( look_44_0 == T__33 )
          alt_44 = 1
        end
        case alt_44
        when 1
          # at line 223:3: op_conditions
          @state.following.push( TOKENS_FOLLOWING_op_conditions_IN_operator_632 )
          op_conditions103 = op_conditions
          @state.following.pop
          @adaptor.add_child( root_0, op_conditions103.tree )

        end
        @state.following.push( TOKENS_FOLLOWING_op_effects_IN_operator_635 )
        op_effects104 = op_effects
        @state.following.pop
        @adaptor.add_child( root_0, op_effects104.tree )
        char_literal105 = match( T__21, TOKENS_FOLLOWING_T__21_IN_operator_639 )

        tree_for_char_literal105 = @adaptor.create_with_payload( char_literal105 )
        @adaptor.add_child( root_0, tree_for_char_literal105 )

        # at file 224:7: ( NL )+
        match_count_45 = 0
        while true
          alt_45 = 2
          look_45_0 = @input.peek( 1 )

          if ( look_45_0 == NL )
            alt_45 = 1

          end
          case alt_45
          when 1
            # at line 224:7: NL
            __NL106__ = match( NL, TOKENS_FOLLOWING_NL_IN_operator_641 )

            tree_for_NL106 = @adaptor.create_with_payload( __NL106__ )
            @adaptor.add_child( root_0, tree_for_NL106 )


          else
            match_count_45 > 0 and break
            eee = EarlyExit(45)


            raise eee
          end
          match_count_45 += 1
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
    # 228:1: op_param : ID equals_op reference ( NL )+ ;
    # 
    def op_param
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )
      return_value = OpParamReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID107__ = nil
      __NL110__ = nil
      equals_op108 = nil
      reference109 = nil

      tree_for_ID107 = nil
      tree_for_NL110 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 229:4: ID equals_op reference ( NL )+
        __ID107__ = match( ID, TOKENS_FOLLOWING_ID_IN_op_param_657 )

        tree_for_ID107 = @adaptor.create_with_payload( __ID107__ )
        @adaptor.add_child( root_0, tree_for_ID107 )

        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_op_param_659 )
        equals_op108 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op108.tree )
        @state.following.push( TOKENS_FOLLOWING_reference_IN_op_param_661 )
        reference109 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference109.tree )
        # at file 229:27: ( NL )+
        match_count_46 = 0
        while true
          alt_46 = 2
          look_46_0 = @input.peek( 1 )

          if ( look_46_0 == NL )
            alt_46 = 1

          end
          case alt_46
          when 1
            # at line 229:27: NL
            __NL110__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_param_663 )

            tree_for_NL110 = @adaptor.create_with_payload( __NL110__ )
            @adaptor.add_child( root_0, tree_for_NL110 )


          else
            match_count_46 > 0 and break
            eee = EarlyExit(46)


            raise eee
          end
          match_count_46 += 1
        end

        # --> action
        	@now[__ID107__.text] = ( reference109.nil? ? nil : reference109.val )	
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
    # 233:1: op_conditions : 'conditions' '{' ( NL )* ( op_statement )* '}' ( NL )+ ;
    # 
    def op_conditions
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      return_value = OpConditionsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal111 = nil
      char_literal112 = nil
      __NL113__ = nil
      char_literal115 = nil
      __NL116__ = nil
      op_statement114 = nil

      tree_for_string_literal111 = nil
      tree_for_char_literal112 = nil
      tree_for_NL113 = nil
      tree_for_char_literal115 = nil
      tree_for_NL116 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 234:4: 'conditions' '{' ( NL )* ( op_statement )* '}' ( NL )+
        string_literal111 = match( T__33, TOKENS_FOLLOWING_T__33_IN_op_conditions_679 )

        tree_for_string_literal111 = @adaptor.create_with_payload( string_literal111 )
        @adaptor.add_child( root_0, tree_for_string_literal111 )

        char_literal112 = match( T__20, TOKENS_FOLLOWING_T__20_IN_op_conditions_681 )

        tree_for_char_literal112 = @adaptor.create_with_payload( char_literal112 )
        @adaptor.add_child( root_0, tree_for_char_literal112 )

        # at line 234:21: ( NL )*
        while true # decision 47
          alt_47 = 2
          look_47_0 = @input.peek( 1 )

          if ( look_47_0 == NL )
            alt_47 = 1

          end
          case alt_47
          when 1
            # at line 234:21: NL
            __NL113__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_conditions_683 )

            tree_for_NL113 = @adaptor.create_with_payload( __NL113__ )
            @adaptor.add_child( root_0, tree_for_NL113 )


          else
            break # out of loop for decision 47
          end
        end # loop for decision 47
        # --> action

        			@now['_condition']['_parent'] = @now
        			@now = @now['_condition']
        		
        # <-- action
        # at line 239:3: ( op_statement )*
        while true # decision 48
          alt_48 = 2
          look_48_0 = @input.peek( 1 )

          if ( look_48_0 == ID )
            alt_48 = 1

          end
          case alt_48
          when 1
            # at line 239:3: op_statement
            @state.following.push( TOKENS_FOLLOWING_op_statement_IN_op_conditions_692 )
            op_statement114 = op_statement
            @state.following.pop
            @adaptor.add_child( root_0, op_statement114.tree )

          else
            break # out of loop for decision 48
          end
        end # loop for decision 48
        char_literal115 = match( T__21, TOKENS_FOLLOWING_T__21_IN_op_conditions_697 )

        tree_for_char_literal115 = @adaptor.create_with_payload( char_literal115 )
        @adaptor.add_child( root_0, tree_for_char_literal115 )

        # at file 240:7: ( NL )+
        match_count_49 = 0
        while true
          alt_49 = 2
          look_49_0 = @input.peek( 1 )

          if ( look_49_0 == NL )
            alt_49 = 1

          end
          case alt_49
          when 1
            # at line 240:7: NL
            __NL116__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_conditions_699 )

            tree_for_NL116 = @adaptor.create_with_payload( __NL116__ )
            @adaptor.add_child( root_0, tree_for_NL116 )


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
        # trace_out( __method__, 17 )

      end
      
      return return_value
    end

    OpEffectsReturnValue = define_return_scope 

    # 
    # parser rule op_effects
    # 
    # (in SFP.g)
    # 244:1: op_effects : 'effects' '{' ( NL )* ( op_statement )* '}' ( NL )+ ;
    # 
    def op_effects
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      return_value = OpEffectsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal117 = nil
      char_literal118 = nil
      __NL119__ = nil
      char_literal121 = nil
      __NL122__ = nil
      op_statement120 = nil

      tree_for_string_literal117 = nil
      tree_for_char_literal118 = nil
      tree_for_NL119 = nil
      tree_for_char_literal121 = nil
      tree_for_NL122 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 245:4: 'effects' '{' ( NL )* ( op_statement )* '}' ( NL )+
        string_literal117 = match( T__34, TOKENS_FOLLOWING_T__34_IN_op_effects_715 )

        tree_for_string_literal117 = @adaptor.create_with_payload( string_literal117 )
        @adaptor.add_child( root_0, tree_for_string_literal117 )

        char_literal118 = match( T__20, TOKENS_FOLLOWING_T__20_IN_op_effects_717 )

        tree_for_char_literal118 = @adaptor.create_with_payload( char_literal118 )
        @adaptor.add_child( root_0, tree_for_char_literal118 )

        # at line 245:18: ( NL )*
        while true # decision 50
          alt_50 = 2
          look_50_0 = @input.peek( 1 )

          if ( look_50_0 == NL )
            alt_50 = 1

          end
          case alt_50
          when 1
            # at line 245:18: NL
            __NL119__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_effects_719 )

            tree_for_NL119 = @adaptor.create_with_payload( __NL119__ )
            @adaptor.add_child( root_0, tree_for_NL119 )


          else
            break # out of loop for decision 50
          end
        end # loop for decision 50
        # --> action

        			@now['_effect']['_parent'] = @now
        			@now = @now['_effect']
        		
        # <-- action
        # at line 250:3: ( op_statement )*
        while true # decision 51
          alt_51 = 2
          look_51_0 = @input.peek( 1 )

          if ( look_51_0 == ID )
            alt_51 = 1

          end
          case alt_51
          when 1
            # at line 250:3: op_statement
            @state.following.push( TOKENS_FOLLOWING_op_statement_IN_op_effects_728 )
            op_statement120 = op_statement
            @state.following.pop
            @adaptor.add_child( root_0, op_statement120.tree )

          else
            break # out of loop for decision 51
          end
        end # loop for decision 51
        char_literal121 = match( T__21, TOKENS_FOLLOWING_T__21_IN_op_effects_733 )

        tree_for_char_literal121 = @adaptor.create_with_payload( char_literal121 )
        @adaptor.add_child( root_0, tree_for_char_literal121 )

        # at file 251:7: ( NL )+
        match_count_52 = 0
        while true
          alt_52 = 2
          look_52_0 = @input.peek( 1 )

          if ( look_52_0 == NL )
            alt_52 = 1

          end
          case alt_52
          when 1
            # at line 251:7: NL
            __NL122__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_effects_735 )

            tree_for_NL122 = @adaptor.create_with_payload( __NL122__ )
            @adaptor.add_child( root_0, tree_for_NL122 )


          else
            match_count_52 > 0 and break
            eee = EarlyExit(52)


            raise eee
          end
          match_count_52 += 1
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
    # 255:1: op_statement : reference equals_op value ( NL )+ ;
    # 
    def op_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      return_value = OpStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL126__ = nil
      reference123 = nil
      equals_op124 = nil
      value125 = nil

      tree_for_NL126 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 256:4: reference equals_op value ( NL )+
        @state.following.push( TOKENS_FOLLOWING_reference_IN_op_statement_751 )
        reference123 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference123.tree )
        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_op_statement_753 )
        equals_op124 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op124.tree )
        @state.following.push( TOKENS_FOLLOWING_value_IN_op_statement_755 )
        value125 = value
        @state.following.pop
        @adaptor.add_child( root_0, value125.tree )
        # at file 256:30: ( NL )+
        match_count_53 = 0
        while true
          alt_53 = 2
          look_53_0 = @input.peek( 1 )

          if ( look_53_0 == NL )
            alt_53 = 1

          end
          case alt_53
          when 1
            # at line 256:30: NL
            __NL126__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_statement_757 )

            tree_for_NL126 = @adaptor.create_with_payload( __NL126__ )
            @adaptor.add_child( root_0, tree_for_NL126 )


          else
            match_count_53 > 0 and break
            eee = EarlyExit(53)


            raise eee
          end
          match_count_53 += 1
        end

        # --> action
        	@now[( reference123.nil? ? nil : reference123.val )] = ( value125.nil? ? nil : value125.val )	
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
    # 260:1: procedure : 'procedure' ID ( parameters )? '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( conditions )? effects '}' ( NL )+ ;
    # 
    def procedure
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = ProcedureReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal127 = nil
      __ID128__ = nil
      char_literal130 = nil
      __NL131__ = nil
      string_literal132 = nil
      __NUMBER134__ = nil
      __NL135__ = nil
      char_literal138 = nil
      __NL139__ = nil
      parameters129 = nil
      equals_op133 = nil
      conditions136 = nil
      effects137 = nil

      tree_for_string_literal127 = nil
      tree_for_ID128 = nil
      tree_for_char_literal130 = nil
      tree_for_NL131 = nil
      tree_for_string_literal132 = nil
      tree_for_NUMBER134 = nil
      tree_for_NL135 = nil
      tree_for_char_literal138 = nil
      tree_for_NL139 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 261:4: 'procedure' ID ( parameters )? '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( conditions )? effects '}' ( NL )+
        string_literal127 = match( T__35, TOKENS_FOLLOWING_T__35_IN_procedure_773 )

        tree_for_string_literal127 = @adaptor.create_with_payload( string_literal127 )
        @adaptor.add_child( root_0, tree_for_string_literal127 )

        __ID128__ = match( ID, TOKENS_FOLLOWING_ID_IN_procedure_775 )

        tree_for_ID128 = @adaptor.create_with_payload( __ID128__ )
        @adaptor.add_child( root_0, tree_for_ID128 )

        # --> action

        			@now[__ID128__.text] = { '_self' => __ID128__.text,
        				'_context' => 'procedure',
        				'_parent' => @now,
        				'_cost' => 1,
        				'_condition' => { '_context' => 'constraint', '_type' => 'and' },
        				'_effect' => { '_context' => 'mutation', '_type' => 'and' }
        			}
        			@now = @now[__ID128__.text]
        		
        # <-- action
        # at line 272:3: ( parameters )?
        alt_54 = 2
        look_54_0 = @input.peek( 1 )

        if ( look_54_0 == T__36 )
          alt_54 = 1
        end
        case alt_54
        when 1
          # at line 272:3: parameters
          @state.following.push( TOKENS_FOLLOWING_parameters_IN_procedure_783 )
          parameters129 = parameters
          @state.following.pop
          @adaptor.add_child( root_0, parameters129.tree )

        end
        char_literal130 = match( T__20, TOKENS_FOLLOWING_T__20_IN_procedure_786 )

        tree_for_char_literal130 = @adaptor.create_with_payload( char_literal130 )
        @adaptor.add_child( root_0, tree_for_char_literal130 )

        # at line 272:19: ( NL )*
        while true # decision 55
          alt_55 = 2
          look_55_0 = @input.peek( 1 )

          if ( look_55_0 == NL )
            alt_55 = 1

          end
          case alt_55
          when 1
            # at line 272:19: NL
            __NL131__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_788 )

            tree_for_NL131 = @adaptor.create_with_payload( __NL131__ )
            @adaptor.add_child( root_0, tree_for_NL131 )


          else
            break # out of loop for decision 55
          end
        end # loop for decision 55
        # at line 273:3: ( 'cost' equals_op NUMBER ( NL )+ )?
        alt_57 = 2
        look_57_0 = @input.peek( 1 )

        if ( look_57_0 == T__32 )
          alt_57 = 1
        end
        case alt_57
        when 1
          # at line 273:5: 'cost' equals_op NUMBER ( NL )+
          string_literal132 = match( T__32, TOKENS_FOLLOWING_T__32_IN_procedure_796 )

          tree_for_string_literal132 = @adaptor.create_with_payload( string_literal132 )
          @adaptor.add_child( root_0, tree_for_string_literal132 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_procedure_798 )
          equals_op133 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op133.tree )
          __NUMBER134__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_procedure_800 )

          tree_for_NUMBER134 = @adaptor.create_with_payload( __NUMBER134__ )
          @adaptor.add_child( root_0, tree_for_NUMBER134 )

          # --> action
          	@now['_cost'] = __NUMBER134__.text.to_i	
          # <-- action
          # at file 275:4: ( NL )+
          match_count_56 = 0
          while true
            alt_56 = 2
            look_56_0 = @input.peek( 1 )

            if ( look_56_0 == NL )
              alt_56 = 1

            end
            case alt_56
            when 1
              # at line 275:4: NL
              __NL135__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_810 )

              tree_for_NL135 = @adaptor.create_with_payload( __NL135__ )
              @adaptor.add_child( root_0, tree_for_NL135 )


            else
              match_count_56 > 0 and break
              eee = EarlyExit(56)


              raise eee
            end
            match_count_56 += 1
          end


        end
        # at line 277:3: ( conditions )?
        alt_58 = 2
        look_58_0 = @input.peek( 1 )

        if ( look_58_0 == T__33 )
          alt_58 = 1
        end
        case alt_58
        when 1
          # at line 277:3: conditions
          @state.following.push( TOKENS_FOLLOWING_conditions_IN_procedure_820 )
          conditions136 = conditions
          @state.following.pop
          @adaptor.add_child( root_0, conditions136.tree )

        end
        @state.following.push( TOKENS_FOLLOWING_effects_IN_procedure_823 )
        effects137 = effects
        @state.following.pop
        @adaptor.add_child( root_0, effects137.tree )
        char_literal138 = match( T__21, TOKENS_FOLLOWING_T__21_IN_procedure_825 )

        tree_for_char_literal138 = @adaptor.create_with_payload( char_literal138 )
        @adaptor.add_child( root_0, tree_for_char_literal138 )

        # at file 277:27: ( NL )+
        match_count_59 = 0
        while true
          alt_59 = 2
          look_59_0 = @input.peek( 1 )

          if ( look_59_0 == NL )
            alt_59 = 1

          end
          case alt_59
          when 1
            # at line 277:27: NL
            __NL139__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_827 )

            tree_for_NL139 = @adaptor.create_with_payload( __NL139__ )
            @adaptor.add_child( root_0, tree_for_NL139 )


          else
            match_count_59 > 0 and break
            eee = EarlyExit(59)


            raise eee
          end
          match_count_59 += 1
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
    # 281:1: parameters : '(' parameter ( ',' ( NL )* parameter )* ')' ;
    # 
    def parameters
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = ParametersReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal140 = nil
      char_literal142 = nil
      __NL143__ = nil
      char_literal145 = nil
      parameter141 = nil
      parameter144 = nil

      tree_for_char_literal140 = nil
      tree_for_char_literal142 = nil
      tree_for_NL143 = nil
      tree_for_char_literal145 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 282:4: '(' parameter ( ',' ( NL )* parameter )* ')'
        char_literal140 = match( T__36, TOKENS_FOLLOWING_T__36_IN_parameters_843 )

        tree_for_char_literal140 = @adaptor.create_with_payload( char_literal140 )
        @adaptor.add_child( root_0, tree_for_char_literal140 )

        @state.following.push( TOKENS_FOLLOWING_parameter_IN_parameters_845 )
        parameter141 = parameter
        @state.following.pop
        @adaptor.add_child( root_0, parameter141.tree )
        # at line 282:18: ( ',' ( NL )* parameter )*
        while true # decision 61
          alt_61 = 2
          look_61_0 = @input.peek( 1 )

          if ( look_61_0 == T__37 )
            alt_61 = 1

          end
          case alt_61
          when 1
            # at line 282:19: ',' ( NL )* parameter
            char_literal142 = match( T__37, TOKENS_FOLLOWING_T__37_IN_parameters_848 )

            tree_for_char_literal142 = @adaptor.create_with_payload( char_literal142 )
            @adaptor.add_child( root_0, tree_for_char_literal142 )

            # at line 282:23: ( NL )*
            while true # decision 60
              alt_60 = 2
              look_60_0 = @input.peek( 1 )

              if ( look_60_0 == NL )
                alt_60 = 1

              end
              case alt_60
              when 1
                # at line 282:23: NL
                __NL143__ = match( NL, TOKENS_FOLLOWING_NL_IN_parameters_850 )

                tree_for_NL143 = @adaptor.create_with_payload( __NL143__ )
                @adaptor.add_child( root_0, tree_for_NL143 )


              else
                break # out of loop for decision 60
              end
            end # loop for decision 60
            @state.following.push( TOKENS_FOLLOWING_parameter_IN_parameters_853 )
            parameter144 = parameter
            @state.following.pop
            @adaptor.add_child( root_0, parameter144.tree )

          else
            break # out of loop for decision 61
          end
        end # loop for decision 61
        char_literal145 = match( T__38, TOKENS_FOLLOWING_T__38_IN_parameters_857 )

        tree_for_char_literal145 = @adaptor.create_with_payload( char_literal145 )
        @adaptor.add_child( root_0, tree_for_char_literal145 )

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
    # 285:1: parameter : ( ID reference_type | ID 'areall' path | ID 'isset' path );
    # 
    def parameter
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = ParameterReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID146__ = nil
      __ID148__ = nil
      string_literal149 = nil
      __ID151__ = nil
      string_literal152 = nil
      reference_type147 = nil
      path150 = nil
      path153 = nil

      tree_for_ID146 = nil
      tree_for_ID148 = nil
      tree_for_string_literal149 = nil
      tree_for_ID151 = nil
      tree_for_string_literal152 = nil

      begin
        # at line 286:2: ( ID reference_type | ID 'areall' path | ID 'isset' path )
        alt_62 = 3
        look_62_0 = @input.peek( 1 )

        if ( look_62_0 == ID )
          case look_62 = @input.peek( 2 )
          when T__39 then alt_62 = 2
          when T__40 then alt_62 = 3
          when T__65 then alt_62 = 1
          else
            raise NoViableAlternative( "", 62, 1 )
          end
        else
          raise NoViableAlternative( "", 62, 0 )
        end
        case alt_62
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 286:4: ID reference_type
          __ID146__ = match( ID, TOKENS_FOLLOWING_ID_IN_parameter_869 )

          tree_for_ID146 = @adaptor.create_with_payload( __ID146__ )
          @adaptor.add_child( root_0, tree_for_ID146 )

          @state.following.push( TOKENS_FOLLOWING_reference_type_IN_parameter_871 )
          reference_type147 = reference_type
          @state.following.pop
          @adaptor.add_child( root_0, reference_type147.tree )
          # --> action
          	@now[__ID146__.text] = ( reference_type147.nil? ? nil : reference_type147.val )	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 288:4: ID 'areall' path
          __ID148__ = match( ID, TOKENS_FOLLOWING_ID_IN_parameter_880 )

          tree_for_ID148 = @adaptor.create_with_payload( __ID148__ )
          @adaptor.add_child( root_0, tree_for_ID148 )

          string_literal149 = match( T__39, TOKENS_FOLLOWING_T__39_IN_parameter_882 )

          tree_for_string_literal149 = @adaptor.create_with_payload( string_literal149 )
          @adaptor.add_child( root_0, tree_for_string_literal149 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_parameter_884 )
          path150 = path
          @state.following.pop
          @adaptor.add_child( root_0, path150.tree )
          # --> action

          			@now[__ID148__.text] = { '_context' => 'all',
          				'_isa' => self.to_ref(( path150 && @input.to_s( path150.start, path150.stop ) )),
          				'_value' => nil
          			}
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 295:4: ID 'isset' path
          __ID151__ = match( ID, TOKENS_FOLLOWING_ID_IN_parameter_893 )

          tree_for_ID151 = @adaptor.create_with_payload( __ID151__ )
          @adaptor.add_child( root_0, tree_for_ID151 )

          string_literal152 = match( T__40, TOKENS_FOLLOWING_T__40_IN_parameter_895 )

          tree_for_string_literal152 = @adaptor.create_with_payload( string_literal152 )
          @adaptor.add_child( root_0, tree_for_string_literal152 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_parameter_897 )
          path153 = path
          @state.following.pop
          @adaptor.add_child( root_0, path153.tree )
          # --> action

          			@now[__ID151__.text] = { '_context' => 'set',
          				'_isa' => self.to_ref(( path153 && @input.to_s( path153.start, path153.stop ) )),
          				'_values' => []
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
    # 304:1: conditions : 'conditions' '{' ( NL )* constraint_body '}' ( NL )+ ;
    # 
    def conditions
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
      return_value = ConditionsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal154 = nil
      char_literal155 = nil
      __NL156__ = nil
      char_literal158 = nil
      __NL159__ = nil
      constraint_body157 = nil

      tree_for_string_literal154 = nil
      tree_for_char_literal155 = nil
      tree_for_NL156 = nil
      tree_for_char_literal158 = nil
      tree_for_NL159 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 305:4: 'conditions' '{' ( NL )* constraint_body '}' ( NL )+
        string_literal154 = match( T__33, TOKENS_FOLLOWING_T__33_IN_conditions_912 )

        tree_for_string_literal154 = @adaptor.create_with_payload( string_literal154 )
        @adaptor.add_child( root_0, tree_for_string_literal154 )

        # --> action

        			@now['_condition']['_parent'] = @now
        			@now = @now['_condition']
        		
        # <-- action
        char_literal155 = match( T__20, TOKENS_FOLLOWING_T__20_IN_conditions_920 )

        tree_for_char_literal155 = @adaptor.create_with_payload( char_literal155 )
        @adaptor.add_child( root_0, tree_for_char_literal155 )

        # at line 310:7: ( NL )*
        while true # decision 63
          alt_63 = 2
          look_63_0 = @input.peek( 1 )

          if ( look_63_0 == NL )
            alt_63 = 1

          end
          case alt_63
          when 1
            # at line 310:7: NL
            __NL156__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditions_922 )

            tree_for_NL156 = @adaptor.create_with_payload( __NL156__ )
            @adaptor.add_child( root_0, tree_for_NL156 )


          else
            break # out of loop for decision 63
          end
        end # loop for decision 63
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_conditions_925 )
        constraint_body157 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body157.tree )
        char_literal158 = match( T__21, TOKENS_FOLLOWING_T__21_IN_conditions_927 )

        tree_for_char_literal158 = @adaptor.create_with_payload( char_literal158 )
        @adaptor.add_child( root_0, tree_for_char_literal158 )

        # at file 310:31: ( NL )+
        match_count_64 = 0
        while true
          alt_64 = 2
          look_64_0 = @input.peek( 1 )

          if ( look_64_0 == NL )
            alt_64 = 1

          end
          case alt_64
          when 1
            # at line 310:31: NL
            __NL159__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditions_929 )

            tree_for_NL159 = @adaptor.create_with_payload( __NL159__ )
            @adaptor.add_child( root_0, tree_for_NL159 )


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
        # trace_out( __method__, 23 )

      end
      
      return return_value
    end

    EffectsReturnValue = define_return_scope 

    # 
    # parser rule effects
    # 
    # (in SFP.g)
    # 315:1: effects : 'effects' '{' ( NL )* mutation_body '}' ( NL )+ ;
    # 
    def effects
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = EffectsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal160 = nil
      char_literal161 = nil
      __NL162__ = nil
      char_literal164 = nil
      __NL165__ = nil
      mutation_body163 = nil

      tree_for_string_literal160 = nil
      tree_for_char_literal161 = nil
      tree_for_NL162 = nil
      tree_for_char_literal164 = nil
      tree_for_NL165 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 316:4: 'effects' '{' ( NL )* mutation_body '}' ( NL )+
        string_literal160 = match( T__34, TOKENS_FOLLOWING_T__34_IN_effects_946 )

        tree_for_string_literal160 = @adaptor.create_with_payload( string_literal160 )
        @adaptor.add_child( root_0, tree_for_string_literal160 )

        # --> action

        			@now['_effect']['_parent'] = @now
        			@now = @now['_effect']
        		
        # <-- action
        char_literal161 = match( T__20, TOKENS_FOLLOWING_T__20_IN_effects_954 )

        tree_for_char_literal161 = @adaptor.create_with_payload( char_literal161 )
        @adaptor.add_child( root_0, tree_for_char_literal161 )

        # at line 321:7: ( NL )*
        while true # decision 65
          alt_65 = 2
          look_65_0 = @input.peek( 1 )

          if ( look_65_0 == NL )
            alt_65 = 1

          end
          case alt_65
          when 1
            # at line 321:7: NL
            __NL162__ = match( NL, TOKENS_FOLLOWING_NL_IN_effects_956 )

            tree_for_NL162 = @adaptor.create_with_payload( __NL162__ )
            @adaptor.add_child( root_0, tree_for_NL162 )


          else
            break # out of loop for decision 65
          end
        end # loop for decision 65
        @state.following.push( TOKENS_FOLLOWING_mutation_body_IN_effects_962 )
        mutation_body163 = mutation_body
        @state.following.pop
        @adaptor.add_child( root_0, mutation_body163.tree )
        char_literal164 = match( T__21, TOKENS_FOLLOWING_T__21_IN_effects_967 )

        tree_for_char_literal164 = @adaptor.create_with_payload( char_literal164 )
        @adaptor.add_child( root_0, tree_for_char_literal164 )

        # at file 323:7: ( NL )+
        match_count_66 = 0
        while true
          alt_66 = 2
          look_66_0 = @input.peek( 1 )

          if ( look_66_0 == NL )
            alt_66 = 1

          end
          case alt_66
          when 1
            # at line 323:7: NL
            __NL165__ = match( NL, TOKENS_FOLLOWING_NL_IN_effects_969 )

            tree_for_NL165 = @adaptor.create_with_payload( __NL165__ )
            @adaptor.add_child( root_0, tree_for_NL165 )


          else
            match_count_66 > 0 and break
            eee = EarlyExit(66)


            raise eee
          end
          match_count_66 += 1
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
    # 327:1: goal_constraint : 'goal' ( 'constraint' )? ( NL )* '{' ( NL )* ( goal_body )* '}' ( NL )+ ;
    # 
    def goal_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = GoalConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal166 = nil
      string_literal167 = nil
      __NL168__ = nil
      char_literal169 = nil
      __NL170__ = nil
      char_literal172 = nil
      __NL173__ = nil
      goal_body171 = nil

      tree_for_string_literal166 = nil
      tree_for_string_literal167 = nil
      tree_for_NL168 = nil
      tree_for_char_literal169 = nil
      tree_for_NL170 = nil
      tree_for_char_literal172 = nil
      tree_for_NL173 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 328:4: 'goal' ( 'constraint' )? ( NL )* '{' ( NL )* ( goal_body )* '}' ( NL )+
        string_literal166 = match( T__41, TOKENS_FOLLOWING_T__41_IN_goal_constraint_985 )

        tree_for_string_literal166 = @adaptor.create_with_payload( string_literal166 )
        @adaptor.add_child( root_0, tree_for_string_literal166 )

        # at line 328:11: ( 'constraint' )?
        alt_67 = 2
        look_67_0 = @input.peek( 1 )

        if ( look_67_0 == T__42 )
          alt_67 = 1
        end
        case alt_67
        when 1
          # at line 328:11: 'constraint'
          string_literal167 = match( T__42, TOKENS_FOLLOWING_T__42_IN_goal_constraint_987 )

          tree_for_string_literal167 = @adaptor.create_with_payload( string_literal167 )
          @adaptor.add_child( root_0, tree_for_string_literal167 )


        end
        # at line 328:25: ( NL )*
        while true # decision 68
          alt_68 = 2
          look_68_0 = @input.peek( 1 )

          if ( look_68_0 == NL )
            alt_68 = 1

          end
          case alt_68
          when 1
            # at line 328:25: NL
            __NL168__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_constraint_990 )

            tree_for_NL168 = @adaptor.create_with_payload( __NL168__ )
            @adaptor.add_child( root_0, tree_for_NL168 )


          else
            break # out of loop for decision 68
          end
        end # loop for decision 68
        # --> action

        			@now['goal'] = { '_self' => 'goal',
        				'_context' => 'constraint',
        				'_type' => 'and',
        				'_parent' => @now
        			}
        			@now = @now['goal']
        		
        # <-- action
        char_literal169 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_constraint_999 )

        tree_for_char_literal169 = @adaptor.create_with_payload( char_literal169 )
        @adaptor.add_child( root_0, tree_for_char_literal169 )

        # at line 337:7: ( NL )*
        while true # decision 69
          alt_69 = 2
          look_69_0 = @input.peek( 1 )

          if ( look_69_0 == NL )
            alt_69 = 1

          end
          case alt_69
          when 1
            # at line 337:7: NL
            __NL170__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_constraint_1001 )

            tree_for_NL170 = @adaptor.create_with_payload( __NL170__ )
            @adaptor.add_child( root_0, tree_for_NL170 )


          else
            break # out of loop for decision 69
          end
        end # loop for decision 69
        # at line 337:11: ( goal_body )*
        while true # decision 70
          alt_70 = 2
          look_70_0 = @input.peek( 1 )

          if ( look_70_0 == ID || look_70_0 == T__28 || look_70_0.between?( T__43, T__48 ) || look_70_0.between?( T__50, T__52 ) || look_70_0 == T__55 || look_70_0 == T__59 )
            alt_70 = 1

          end
          case alt_70
          when 1
            # at line 337:11: goal_body
            @state.following.push( TOKENS_FOLLOWING_goal_body_IN_goal_constraint_1004 )
            goal_body171 = goal_body
            @state.following.pop
            @adaptor.add_child( root_0, goal_body171.tree )

          else
            break # out of loop for decision 70
          end
        end # loop for decision 70
        char_literal172 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_constraint_1007 )

        tree_for_char_literal172 = @adaptor.create_with_payload( char_literal172 )
        @adaptor.add_child( root_0, tree_for_char_literal172 )

        # at file 337:26: ( NL )+
        match_count_71 = 0
        while true
          alt_71 = 2
          look_71_0 = @input.peek( 1 )

          if ( look_71_0 == NL )
            alt_71 = 1

          end
          case alt_71
          when 1
            # at line 337:26: NL
            __NL173__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_constraint_1009 )

            tree_for_NL173 = @adaptor.create_with_payload( __NL173__ )
            @adaptor.add_child( root_0, tree_for_NL173 )


          else
            match_count_71 > 0 and break
            eee = EarlyExit(71)


            raise eee
          end
          match_count_71 += 1
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
    # 341:1: goal_body : ( ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ ) | 'always' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'sometime' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'within' NUMBER ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'after' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* ( 'then' | 'within' NUMBER ) ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'before' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ );
    # 
    def goal_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = GoalBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL178__ = nil
      string_literal179 = nil
      __NL180__ = nil
      char_literal181 = nil
      __NL182__ = nil
      char_literal184 = nil
      __NL185__ = nil
      string_literal186 = nil
      __NL187__ = nil
      char_literal188 = nil
      __NL189__ = nil
      char_literal191 = nil
      __NL192__ = nil
      string_literal193 = nil
      __NUMBER194__ = nil
      __NL195__ = nil
      char_literal196 = nil
      __NL197__ = nil
      char_literal199 = nil
      __NL200__ = nil
      string_literal201 = nil
      __NL202__ = nil
      char_literal203 = nil
      __NL204__ = nil
      char_literal206 = nil
      __NL207__ = nil
      string_literal208 = nil
      string_literal209 = nil
      __NUMBER210__ = nil
      __NL211__ = nil
      char_literal212 = nil
      __NL213__ = nil
      char_literal215 = nil
      __NL216__ = nil
      string_literal217 = nil
      __NL218__ = nil
      char_literal219 = nil
      __NL220__ = nil
      char_literal222 = nil
      __NL223__ = nil
      string_literal224 = nil
      __NL225__ = nil
      char_literal226 = nil
      __NL227__ = nil
      char_literal229 = nil
      __NL230__ = nil
      constraint_statement174 = nil
      constraint_namespace175 = nil
      constraint_iterator176 = nil
      constraint_class_quantification177 = nil
      constraint_body183 = nil
      constraint_body190 = nil
      constraint_body198 = nil
      constraint_body205 = nil
      constraint_body214 = nil
      constraint_body221 = nil
      constraint_body228 = nil

      tree_for_NL178 = nil
      tree_for_string_literal179 = nil
      tree_for_NL180 = nil
      tree_for_char_literal181 = nil
      tree_for_NL182 = nil
      tree_for_char_literal184 = nil
      tree_for_NL185 = nil
      tree_for_string_literal186 = nil
      tree_for_NL187 = nil
      tree_for_char_literal188 = nil
      tree_for_NL189 = nil
      tree_for_char_literal191 = nil
      tree_for_NL192 = nil
      tree_for_string_literal193 = nil
      tree_for_NUMBER194 = nil
      tree_for_NL195 = nil
      tree_for_char_literal196 = nil
      tree_for_NL197 = nil
      tree_for_char_literal199 = nil
      tree_for_NL200 = nil
      tree_for_string_literal201 = nil
      tree_for_NL202 = nil
      tree_for_char_literal203 = nil
      tree_for_NL204 = nil
      tree_for_char_literal206 = nil
      tree_for_NL207 = nil
      tree_for_string_literal208 = nil
      tree_for_string_literal209 = nil
      tree_for_NUMBER210 = nil
      tree_for_NL211 = nil
      tree_for_char_literal212 = nil
      tree_for_NL213 = nil
      tree_for_char_literal215 = nil
      tree_for_NL216 = nil
      tree_for_string_literal217 = nil
      tree_for_NL218 = nil
      tree_for_char_literal219 = nil
      tree_for_NL220 = nil
      tree_for_char_literal222 = nil
      tree_for_NL223 = nil
      tree_for_string_literal224 = nil
      tree_for_NL225 = nil
      tree_for_char_literal226 = nil
      tree_for_NL227 = nil
      tree_for_char_literal229 = nil
      tree_for_NL230 = nil

      begin
        # at line 342:2: ( ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ ) | 'always' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'sometime' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'within' NUMBER ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'after' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* ( 'then' | 'within' NUMBER ) ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'before' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ )
        alt_96 = 6
        case look_96 = @input.peek( 1 )
        when ID, T__28, T__48, T__50, T__51, T__52, T__55, T__59 then alt_96 = 1
        when T__43 then alt_96 = 2
        when T__44 then alt_96 = 3
        when T__45 then alt_96 = 4
        when T__46 then alt_96 = 5
        when T__47 then alt_96 = 6
        else
          raise NoViableAlternative( "", 96, 0 )
        end
        case alt_96
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 342:4: ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )
          # at line 342:4: ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )
          # at line 343:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+
          # at line 343:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification )
          alt_72 = 4
          alt_72 = @dfa72.predict( @input )
          case alt_72
          when 1
            # at line 343:6: constraint_statement
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_goal_body_1032 )
            constraint_statement174 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement174.tree )
            # --> action

            					@now[( constraint_statement174.nil? ? nil : constraint_statement174.key )] = ( constraint_statement174.nil? ? nil : constraint_statement174.val )
            				
            # <-- action

          when 2
            # at line 347:6: constraint_namespace
            @state.following.push( TOKENS_FOLLOWING_constraint_namespace_IN_goal_body_1045 )
            constraint_namespace175 = constraint_namespace
            @state.following.pop
            @adaptor.add_child( root_0, constraint_namespace175.tree )

          when 3
            # at line 348:6: constraint_iterator
            @state.following.push( TOKENS_FOLLOWING_constraint_iterator_IN_goal_body_1052 )
            constraint_iterator176 = constraint_iterator
            @state.following.pop
            @adaptor.add_child( root_0, constraint_iterator176.tree )

          when 4
            # at line 349:6: constraint_class_quantification
            @state.following.push( TOKENS_FOLLOWING_constraint_class_quantification_IN_goal_body_1059 )
            constraint_class_quantification177 = constraint_class_quantification
            @state.following.pop
            @adaptor.add_child( root_0, constraint_class_quantification177.tree )

          end
          # at file 351:3: ( NL )+
          match_count_73 = 0
          while true
            alt_73 = 2
            look_73_0 = @input.peek( 1 )

            if ( look_73_0 == NL )
              alt_73 = 1

            end
            case alt_73
            when 1
              # at line 351:3: NL
              __NL178__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1068 )

              tree_for_NL178 = @adaptor.create_with_payload( __NL178__ )
              @adaptor.add_child( root_0, tree_for_NL178 )


            else
              match_count_73 > 0 and break
              eee = EarlyExit(73)


              raise eee
            end
            match_count_73 += 1
          end



        when 2
          root_0 = @adaptor.create_flat_list


          # at line 352:4: 'always' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal179 = match( T__43, TOKENS_FOLLOWING_T__43_IN_goal_body_1075 )

          tree_for_string_literal179 = @adaptor.create_with_payload( string_literal179 )
          @adaptor.add_child( root_0, tree_for_string_literal179 )

          # at line 352:13: ( NL )*
          while true # decision 74
            alt_74 = 2
            look_74_0 = @input.peek( 1 )

            if ( look_74_0 == NL )
              alt_74 = 1

            end
            case alt_74
            when 1
              # at line 352:13: NL
              __NL180__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1077 )

              tree_for_NL180 = @adaptor.create_with_payload( __NL180__ )
              @adaptor.add_child( root_0, tree_for_NL180 )


            else
              break # out of loop for decision 74
            end
          end # loop for decision 74
          # --> action

          			@now['always'] = self.create_constraint('always', 'and') if
          				not @now.has_key?('always')
          			@now = @now['always']
          		
          # <-- action
          char_literal181 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1086 )

          tree_for_char_literal181 = @adaptor.create_with_payload( char_literal181 )
          @adaptor.add_child( root_0, tree_for_char_literal181 )

          # at line 358:7: ( NL )*
          while true # decision 75
            alt_75 = 2
            look_75_0 = @input.peek( 1 )

            if ( look_75_0 == NL )
              alt_75 = 1

            end
            case alt_75
            when 1
              # at line 358:7: NL
              __NL182__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1088 )

              tree_for_NL182 = @adaptor.create_with_payload( __NL182__ )
              @adaptor.add_child( root_0, tree_for_NL182 )


            else
              break # out of loop for decision 75
            end
          end # loop for decision 75
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1091 )
          constraint_body183 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body183.tree )
          char_literal184 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1093 )

          tree_for_char_literal184 = @adaptor.create_with_payload( char_literal184 )
          @adaptor.add_child( root_0, tree_for_char_literal184 )

          # at file 358:31: ( NL )+
          match_count_76 = 0
          while true
            alt_76 = 2
            look_76_0 = @input.peek( 1 )

            if ( look_76_0 == NL )
              alt_76 = 1

            end
            case alt_76
            when 1
              # at line 358:31: NL
              __NL185__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1095 )

              tree_for_NL185 = @adaptor.create_with_payload( __NL185__ )
              @adaptor.add_child( root_0, tree_for_NL185 )


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

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 360:4: 'sometime' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal186 = match( T__44, TOKENS_FOLLOWING_T__44_IN_goal_body_1105 )

          tree_for_string_literal186 = @adaptor.create_with_payload( string_literal186 )
          @adaptor.add_child( root_0, tree_for_string_literal186 )

          # at line 360:15: ( NL )*
          while true # decision 77
            alt_77 = 2
            look_77_0 = @input.peek( 1 )

            if ( look_77_0 == NL )
              alt_77 = 1

            end
            case alt_77
            when 1
              # at line 360:15: NL
              __NL187__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1107 )

              tree_for_NL187 = @adaptor.create_with_payload( __NL187__ )
              @adaptor.add_child( root_0, tree_for_NL187 )


            else
              break # out of loop for decision 77
            end
          end # loop for decision 77
          # --> action

          			@now['sometime'] = self.create_constraint('sometime', 'or') if
          				not @now.has_key?('sometime')
          			@now = @now['sometime']
          			id = self.next_id.to_s
          			@now[id] = self.create_constraint(id, 'and')
          			@now = @now[id]
          		
          # <-- action
          char_literal188 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1116 )

          tree_for_char_literal188 = @adaptor.create_with_payload( char_literal188 )
          @adaptor.add_child( root_0, tree_for_char_literal188 )

          # at line 369:7: ( NL )*
          while true # decision 78
            alt_78 = 2
            look_78_0 = @input.peek( 1 )

            if ( look_78_0 == NL )
              alt_78 = 1

            end
            case alt_78
            when 1
              # at line 369:7: NL
              __NL189__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1118 )

              tree_for_NL189 = @adaptor.create_with_payload( __NL189__ )
              @adaptor.add_child( root_0, tree_for_NL189 )


            else
              break # out of loop for decision 78
            end
          end # loop for decision 78
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1121 )
          constraint_body190 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body190.tree )
          char_literal191 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1123 )

          tree_for_char_literal191 = @adaptor.create_with_payload( char_literal191 )
          @adaptor.add_child( root_0, tree_for_char_literal191 )

          # at file 369:31: ( NL )+
          match_count_79 = 0
          while true
            alt_79 = 2
            look_79_0 = @input.peek( 1 )

            if ( look_79_0 == NL )
              alt_79 = 1

            end
            case alt_79
            when 1
              # at line 369:31: NL
              __NL192__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1125 )

              tree_for_NL192 = @adaptor.create_with_payload( __NL192__ )
              @adaptor.add_child( root_0, tree_for_NL192 )


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
          # --> action
          	self.goto_parent()	
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 372:4: 'within' NUMBER ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal193 = match( T__45, TOKENS_FOLLOWING_T__45_IN_goal_body_1139 )

          tree_for_string_literal193 = @adaptor.create_with_payload( string_literal193 )
          @adaptor.add_child( root_0, tree_for_string_literal193 )

          __NUMBER194__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_goal_body_1141 )

          tree_for_NUMBER194 = @adaptor.create_with_payload( __NUMBER194__ )
          @adaptor.add_child( root_0, tree_for_NUMBER194 )

          # at line 372:20: ( NL )*
          while true # decision 80
            alt_80 = 2
            look_80_0 = @input.peek( 1 )

            if ( look_80_0 == NL )
              alt_80 = 1

            end
            case alt_80
            when 1
              # at line 372:20: NL
              __NL195__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1143 )

              tree_for_NL195 = @adaptor.create_with_payload( __NL195__ )
              @adaptor.add_child( root_0, tree_for_NL195 )


            else
              break # out of loop for decision 80
            end
          end # loop for decision 80
          # --> action

          			id = self.next_id.to_s
          			@now[id] = self.create_constraint(id, 'within')
          			@now = @now[id]
          			@now['deadline'] = __NUMBER194__.text.to_s.to_i
          		
          # <-- action
          char_literal196 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1152 )

          tree_for_char_literal196 = @adaptor.create_with_payload( char_literal196 )
          @adaptor.add_child( root_0, tree_for_char_literal196 )

          # at line 379:7: ( NL )*
          while true # decision 81
            alt_81 = 2
            look_81_0 = @input.peek( 1 )

            if ( look_81_0 == NL )
              alt_81 = 1

            end
            case alt_81
            when 1
              # at line 379:7: NL
              __NL197__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1154 )

              tree_for_NL197 = @adaptor.create_with_payload( __NL197__ )
              @adaptor.add_child( root_0, tree_for_NL197 )


            else
              break # out of loop for decision 81
            end
          end # loop for decision 81
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1157 )
          constraint_body198 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body198.tree )
          char_literal199 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1159 )

          tree_for_char_literal199 = @adaptor.create_with_payload( char_literal199 )
          @adaptor.add_child( root_0, tree_for_char_literal199 )

          # at file 379:31: ( NL )+
          match_count_82 = 0
          while true
            alt_82 = 2
            look_82_0 = @input.peek( 1 )

            if ( look_82_0 == NL )
              alt_82 = 1

            end
            case alt_82
            when 1
              # at line 379:31: NL
              __NL200__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1161 )

              tree_for_NL200 = @adaptor.create_with_payload( __NL200__ )
              @adaptor.add_child( root_0, tree_for_NL200 )


            else
              match_count_82 > 0 and break
              eee = EarlyExit(82)


              raise eee
            end
            match_count_82 += 1
          end

          # --> action
          	self.goto_parent()	
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 381:4: 'after' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* ( 'then' | 'within' NUMBER ) ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal201 = match( T__46, TOKENS_FOLLOWING_T__46_IN_goal_body_1171 )

          tree_for_string_literal201 = @adaptor.create_with_payload( string_literal201 )
          @adaptor.add_child( root_0, tree_for_string_literal201 )

          # at line 381:12: ( NL )*
          while true # decision 83
            alt_83 = 2
            look_83_0 = @input.peek( 1 )

            if ( look_83_0 == NL )
              alt_83 = 1

            end
            case alt_83
            when 1
              # at line 381:12: NL
              __NL202__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1173 )

              tree_for_NL202 = @adaptor.create_with_payload( __NL202__ )
              @adaptor.add_child( root_0, tree_for_NL202 )


            else
              break # out of loop for decision 83
            end
          end # loop for decision 83
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
          char_literal203 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1182 )

          tree_for_char_literal203 = @adaptor.create_with_payload( char_literal203 )
          @adaptor.add_child( root_0, tree_for_char_literal203 )

          # at line 394:7: ( NL )*
          while true # decision 84
            alt_84 = 2
            look_84_0 = @input.peek( 1 )

            if ( look_84_0 == NL )
              alt_84 = 1

            end
            case alt_84
            when 1
              # at line 394:7: NL
              __NL204__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1184 )

              tree_for_NL204 = @adaptor.create_with_payload( __NL204__ )
              @adaptor.add_child( root_0, tree_for_NL204 )


            else
              break # out of loop for decision 84
            end
          end # loop for decision 84
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1187 )
          constraint_body205 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body205.tree )
          char_literal206 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1189 )

          tree_for_char_literal206 = @adaptor.create_with_payload( char_literal206 )
          @adaptor.add_child( root_0, tree_for_char_literal206 )

          # at line 394:31: ( NL )*
          while true # decision 85
            alt_85 = 2
            look_85_0 = @input.peek( 1 )

            if ( look_85_0 == NL )
              alt_85 = 1

            end
            case alt_85
            when 1
              # at line 394:31: NL
              __NL207__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1191 )

              tree_for_NL207 = @adaptor.create_with_payload( __NL207__ )
              @adaptor.add_child( root_0, tree_for_NL207 )


            else
              break # out of loop for decision 85
            end
          end # loop for decision 85
          # --> action
          	self.goto_parent()	
          # <-- action
          # at line 396:3: ( 'then' | 'within' NUMBER )
          alt_86 = 2
          look_86_0 = @input.peek( 1 )

          if ( look_86_0 == T__29 )
            alt_86 = 1
          elsif ( look_86_0 == T__45 )
            alt_86 = 2
          else
            raise NoViableAlternative( "", 86, 0 )
          end
          case alt_86
          when 1
            # at line 396:5: 'then'
            string_literal208 = match( T__29, TOKENS_FOLLOWING_T__29_IN_goal_body_1202 )

            tree_for_string_literal208 = @adaptor.create_with_payload( string_literal208 )
            @adaptor.add_child( root_0, tree_for_string_literal208 )


          when 2
            # at line 397:6: 'within' NUMBER
            string_literal209 = match( T__45, TOKENS_FOLLOWING_T__45_IN_goal_body_1209 )

            tree_for_string_literal209 = @adaptor.create_with_payload( string_literal209 )
            @adaptor.add_child( root_0, tree_for_string_literal209 )

            __NUMBER210__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_goal_body_1211 )

            tree_for_NUMBER210 = @adaptor.create_with_payload( __NUMBER210__ )
            @adaptor.add_child( root_0, tree_for_NUMBER210 )

            # --> action
             @now['deadline'] = __NUMBER210__.text.to_s.to_i 
            # <-- action

          end
          # at line 399:5: ( NL )*
          while true # decision 87
            alt_87 = 2
            look_87_0 = @input.peek( 1 )

            if ( look_87_0 == NL )
              alt_87 = 1

            end
            case alt_87
            when 1
              # at line 399:5: NL
              __NL211__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1223 )

              tree_for_NL211 = @adaptor.create_with_payload( __NL211__ )
              @adaptor.add_child( root_0, tree_for_NL211 )


            else
              break # out of loop for decision 87
            end
          end # loop for decision 87
          # --> action

          			@now['then'] = self.create_constraint('then')
          			@now = @now['then']
          		
          # <-- action
          char_literal212 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1232 )

          tree_for_char_literal212 = @adaptor.create_with_payload( char_literal212 )
          @adaptor.add_child( root_0, tree_for_char_literal212 )

          # at line 404:7: ( NL )*
          while true # decision 88
            alt_88 = 2
            look_88_0 = @input.peek( 1 )

            if ( look_88_0 == NL )
              alt_88 = 1

            end
            case alt_88
            when 1
              # at line 404:7: NL
              __NL213__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1234 )

              tree_for_NL213 = @adaptor.create_with_payload( __NL213__ )
              @adaptor.add_child( root_0, tree_for_NL213 )


            else
              break # out of loop for decision 88
            end
          end # loop for decision 88
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1237 )
          constraint_body214 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body214.tree )
          char_literal215 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1239 )

          tree_for_char_literal215 = @adaptor.create_with_payload( char_literal215 )
          @adaptor.add_child( root_0, tree_for_char_literal215 )

          # at file 404:31: ( NL )+
          match_count_89 = 0
          while true
            alt_89 = 2
            look_89_0 = @input.peek( 1 )

            if ( look_89_0 == NL )
              alt_89 = 1

            end
            case alt_89
            when 1
              # at line 404:31: NL
              __NL216__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1241 )

              tree_for_NL216 = @adaptor.create_with_payload( __NL216__ )
              @adaptor.add_child( root_0, tree_for_NL216 )


            else
              match_count_89 > 0 and break
              eee = EarlyExit(89)


              raise eee
            end
            match_count_89 += 1
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


          # at line 408:4: 'before' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal217 = match( T__47, TOKENS_FOLLOWING_T__47_IN_goal_body_1259 )

          tree_for_string_literal217 = @adaptor.create_with_payload( string_literal217 )
          @adaptor.add_child( root_0, tree_for_string_literal217 )

          # at line 408:13: ( NL )*
          while true # decision 90
            alt_90 = 2
            look_90_0 = @input.peek( 1 )

            if ( look_90_0 == NL )
              alt_90 = 1

            end
            case alt_90
            when 1
              # at line 408:13: NL
              __NL218__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1261 )

              tree_for_NL218 = @adaptor.create_with_payload( __NL218__ )
              @adaptor.add_child( root_0, tree_for_NL218 )


            else
              break # out of loop for decision 90
            end
          end # loop for decision 90
          # --> action

          			id = self.next_id.to_s
          			@now[id] = self.create_constraint(id, 'sometime-before')
          			@now = @now[id]
          			@now['before'] = self.create_constraint('before')
          			@now = @now['before']
          		
          # <-- action
          char_literal219 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1270 )

          tree_for_char_literal219 = @adaptor.create_with_payload( char_literal219 )
          @adaptor.add_child( root_0, tree_for_char_literal219 )

          # at line 416:7: ( NL )*
          while true # decision 91
            alt_91 = 2
            look_91_0 = @input.peek( 1 )

            if ( look_91_0 == NL )
              alt_91 = 1

            end
            case alt_91
            when 1
              # at line 416:7: NL
              __NL220__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1272 )

              tree_for_NL220 = @adaptor.create_with_payload( __NL220__ )
              @adaptor.add_child( root_0, tree_for_NL220 )


            else
              break # out of loop for decision 91
            end
          end # loop for decision 91
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1275 )
          constraint_body221 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body221.tree )
          char_literal222 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1277 )

          tree_for_char_literal222 = @adaptor.create_with_payload( char_literal222 )
          @adaptor.add_child( root_0, tree_for_char_literal222 )

          # at line 416:31: ( NL )*
          while true # decision 92
            alt_92 = 2
            look_92_0 = @input.peek( 1 )

            if ( look_92_0 == NL )
              alt_92 = 1

            end
            case alt_92
            when 1
              # at line 416:31: NL
              __NL223__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1279 )

              tree_for_NL223 = @adaptor.create_with_payload( __NL223__ )
              @adaptor.add_child( root_0, tree_for_NL223 )


            else
              break # out of loop for decision 92
            end
          end # loop for decision 92
          # --> action
          	self.goto_parent()	
          # <-- action
          string_literal224 = match( T__29, TOKENS_FOLLOWING_T__29_IN_goal_body_1288 )

          tree_for_string_literal224 = @adaptor.create_with_payload( string_literal224 )
          @adaptor.add_child( root_0, tree_for_string_literal224 )

          # at line 418:10: ( NL )*
          while true # decision 93
            alt_93 = 2
            look_93_0 = @input.peek( 1 )

            if ( look_93_0 == NL )
              alt_93 = 1

            end
            case alt_93
            when 1
              # at line 418:10: NL
              __NL225__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1290 )

              tree_for_NL225 = @adaptor.create_with_payload( __NL225__ )
              @adaptor.add_child( root_0, tree_for_NL225 )


            else
              break # out of loop for decision 93
            end
          end # loop for decision 93
          # --> action

          			@now['then'] = self.create_constraint('then')
          			@now = @now['then']
          		
          # <-- action
          char_literal226 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1299 )

          tree_for_char_literal226 = @adaptor.create_with_payload( char_literal226 )
          @adaptor.add_child( root_0, tree_for_char_literal226 )

          # at line 423:7: ( NL )*
          while true # decision 94
            alt_94 = 2
            look_94_0 = @input.peek( 1 )

            if ( look_94_0 == NL )
              alt_94 = 1

            end
            case alt_94
            when 1
              # at line 423:7: NL
              __NL227__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1301 )

              tree_for_NL227 = @adaptor.create_with_payload( __NL227__ )
              @adaptor.add_child( root_0, tree_for_NL227 )


            else
              break # out of loop for decision 94
            end
          end # loop for decision 94
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1304 )
          constraint_body228 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body228.tree )
          char_literal229 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1306 )

          tree_for_char_literal229 = @adaptor.create_with_payload( char_literal229 )
          @adaptor.add_child( root_0, tree_for_char_literal229 )

          # at file 423:31: ( NL )+
          match_count_95 = 0
          while true
            alt_95 = 2
            look_95_0 = @input.peek( 1 )

            if ( look_95_0 == NL )
              alt_95 = 1

            end
            case alt_95
            when 1
              # at line 423:31: NL
              __NL230__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1308 )

              tree_for_NL230 = @adaptor.create_with_payload( __NL230__ )
              @adaptor.add_child( root_0, tree_for_NL230 )


            else
              match_count_95 > 0 and break
              eee = EarlyExit(95)


              raise eee
            end
            match_count_95 += 1
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
    # 428:1: nested_constraint : '{' ( NL )* constraint_body '}' ;
    # 
    def nested_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = NestedConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal231 = nil
      __NL232__ = nil
      char_literal234 = nil
      constraint_body233 = nil

      tree_for_char_literal231 = nil
      tree_for_NL232 = nil
      tree_for_char_literal234 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 429:4: '{' ( NL )* constraint_body '}'
        char_literal231 = match( T__20, TOKENS_FOLLOWING_T__20_IN_nested_constraint_1328 )

        tree_for_char_literal231 = @adaptor.create_with_payload( char_literal231 )
        @adaptor.add_child( root_0, tree_for_char_literal231 )

        # at line 429:8: ( NL )*
        while true # decision 97
          alt_97 = 2
          look_97_0 = @input.peek( 1 )

          if ( look_97_0 == NL )
            alt_97 = 1

          end
          case alt_97
          when 1
            # at line 429:8: NL
            __NL232__ = match( NL, TOKENS_FOLLOWING_NL_IN_nested_constraint_1330 )

            tree_for_NL232 = @adaptor.create_with_payload( __NL232__ )
            @adaptor.add_child( root_0, tree_for_NL232 )


          else
            break # out of loop for decision 97
          end
        end # loop for decision 97
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_nested_constraint_1333 )
        constraint_body233 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body233.tree )
        char_literal234 = match( T__21, TOKENS_FOLLOWING_T__21_IN_nested_constraint_1335 )

        tree_for_char_literal234 = @adaptor.create_with_payload( char_literal234 )
        @adaptor.add_child( root_0, tree_for_char_literal234 )

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
    # 432:1: constraint : ID 'constraint' '{' ( NL )* constraint_body '}' ( NL )+ ;
    # 
    def constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = ConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID235__ = nil
      string_literal236 = nil
      char_literal237 = nil
      __NL238__ = nil
      char_literal240 = nil
      __NL241__ = nil
      constraint_body239 = nil

      tree_for_ID235 = nil
      tree_for_string_literal236 = nil
      tree_for_char_literal237 = nil
      tree_for_NL238 = nil
      tree_for_char_literal240 = nil
      tree_for_NL241 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 433:4: ID 'constraint' '{' ( NL )* constraint_body '}' ( NL )+
        __ID235__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_1346 )

        tree_for_ID235 = @adaptor.create_with_payload( __ID235__ )
        @adaptor.add_child( root_0, tree_for_ID235 )

        string_literal236 = match( T__42, TOKENS_FOLLOWING_T__42_IN_constraint_1348 )

        tree_for_string_literal236 = @adaptor.create_with_payload( string_literal236 )
        @adaptor.add_child( root_0, tree_for_string_literal236 )

        # --> action

        			@now[__ID235__.text] = { '_self' => __ID235__.text,
        				'_context' => 'constraint',
        				'_type' => 'and',
        				'_parent' => @now
        			}
        			@now = @now[__ID235__.text]
        		
        # <-- action
        char_literal237 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_1356 )

        tree_for_char_literal237 = @adaptor.create_with_payload( char_literal237 )
        @adaptor.add_child( root_0, tree_for_char_literal237 )

        # at line 442:7: ( NL )*
        while true # decision 98
          alt_98 = 2
          look_98_0 = @input.peek( 1 )

          if ( look_98_0 == NL )
            alt_98 = 1

          end
          case alt_98
          when 1
            # at line 442:7: NL
            __NL238__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_1358 )

            tree_for_NL238 = @adaptor.create_with_payload( __NL238__ )
            @adaptor.add_child( root_0, tree_for_NL238 )


          else
            break # out of loop for decision 98
          end
        end # loop for decision 98
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_constraint_1361 )
        constraint_body239 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body239.tree )
        char_literal240 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_1363 )

        tree_for_char_literal240 = @adaptor.create_with_payload( char_literal240 )
        @adaptor.add_child( root_0, tree_for_char_literal240 )

        # at file 442:31: ( NL )+
        match_count_99 = 0
        while true
          alt_99 = 2
          look_99_0 = @input.peek( 1 )

          if ( look_99_0 == NL )
            alt_99 = 1

          end
          case alt_99
          when 1
            # at line 442:31: NL
            __NL241__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_1365 )

            tree_for_NL241 = @adaptor.create_with_payload( __NL241__ )
            @adaptor.add_child( root_0, tree_for_NL241 )


          else
            match_count_99 > 0 and break
            eee = EarlyExit(99)


            raise eee
          end
          match_count_99 += 1
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
    # 446:1: constraint_body : ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )* ;
    # 
    def constraint_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = ConstraintBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL246__ = nil
      constraint_statement242 = nil
      constraint_namespace243 = nil
      constraint_iterator244 = nil
      constraint_class_quantification245 = nil

      tree_for_NL246 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 447:4: ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )*
        # at line 447:4: ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )*
        while true # decision 102
          alt_102 = 2
          look_102_0 = @input.peek( 1 )

          if ( look_102_0 == ID || look_102_0 == T__28 || look_102_0 == T__48 || look_102_0.between?( T__50, T__52 ) || look_102_0 == T__55 || look_102_0 == T__59 )
            alt_102 = 1

          end
          case alt_102
          when 1
            # at line 448:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+
            # at line 448:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification )
            alt_100 = 4
            alt_100 = @dfa100.predict( @input )
            case alt_100
            when 1
              # at line 448:6: constraint_statement
              @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_1388 )
              constraint_statement242 = constraint_statement
              @state.following.pop
              @adaptor.add_child( root_0, constraint_statement242.tree )
              # --> action

              					@now[( constraint_statement242.nil? ? nil : constraint_statement242.key )] = ( constraint_statement242.nil? ? nil : constraint_statement242.val )
              				
              # <-- action

            when 2
              # at line 452:6: constraint_namespace
              @state.following.push( TOKENS_FOLLOWING_constraint_namespace_IN_constraint_body_1401 )
              constraint_namespace243 = constraint_namespace
              @state.following.pop
              @adaptor.add_child( root_0, constraint_namespace243.tree )

            when 3
              # at line 453:6: constraint_iterator
              @state.following.push( TOKENS_FOLLOWING_constraint_iterator_IN_constraint_body_1408 )
              constraint_iterator244 = constraint_iterator
              @state.following.pop
              @adaptor.add_child( root_0, constraint_iterator244.tree )

            when 4
              # at line 454:6: constraint_class_quantification
              @state.following.push( TOKENS_FOLLOWING_constraint_class_quantification_IN_constraint_body_1415 )
              constraint_class_quantification245 = constraint_class_quantification
              @state.following.pop
              @adaptor.add_child( root_0, constraint_class_quantification245.tree )

            end
            # at file 456:3: ( NL )+
            match_count_101 = 0
            while true
              alt_101 = 2
              look_101_0 = @input.peek( 1 )

              if ( look_101_0 == NL )
                alt_101 = 1

              end
              case alt_101
              when 1
                # at line 456:3: NL
                __NL246__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_body_1424 )

                tree_for_NL246 = @adaptor.create_with_payload( __NL246__ )
                @adaptor.add_child( root_0, tree_for_NL246 )


              else
                match_count_101 > 0 and break
                eee = EarlyExit(101)


                raise eee
              end
              match_count_101 += 1
            end


          else
            break # out of loop for decision 102
          end
        end # loop for decision 102
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
    # 459:1: constraint_namespace : path ( NL )* '{' ( NL )* ( constraint_statement ( NL )+ )* '}' ;
    # 
    def constraint_namespace
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = ConstraintNamespaceReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL248__ = nil
      char_literal249 = nil
      __NL250__ = nil
      __NL252__ = nil
      char_literal253 = nil
      path247 = nil
      constraint_statement251 = nil

      tree_for_NL248 = nil
      tree_for_char_literal249 = nil
      tree_for_NL250 = nil
      tree_for_NL252 = nil
      tree_for_char_literal253 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 460:4: path ( NL )* '{' ( NL )* ( constraint_statement ( NL )+ )* '}'
        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_namespace_1438 )
        path247 = path
        @state.following.pop
        @adaptor.add_child( root_0, path247.tree )
        # at line 460:9: ( NL )*
        while true # decision 103
          alt_103 = 2
          look_103_0 = @input.peek( 1 )

          if ( look_103_0 == NL )
            alt_103 = 1

          end
          case alt_103
          when 1
            # at line 460:9: NL
            __NL248__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1440 )

            tree_for_NL248 = @adaptor.create_with_payload( __NL248__ )
            @adaptor.add_child( root_0, tree_for_NL248 )


          else
            break # out of loop for decision 103
          end
        end # loop for decision 103
        char_literal249 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_namespace_1443 )

        tree_for_char_literal249 = @adaptor.create_with_payload( char_literal249 )
        @adaptor.add_child( root_0, tree_for_char_literal249 )

        # at line 460:17: ( NL )*
        while true # decision 104
          alt_104 = 2
          look_104_0 = @input.peek( 1 )

          if ( look_104_0 == NL )
            alt_104 = 1

          end
          case alt_104
          when 1
            # at line 460:17: NL
            __NL250__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1445 )

            tree_for_NL250 = @adaptor.create_with_payload( __NL250__ )
            @adaptor.add_child( root_0, tree_for_NL250 )


          else
            break # out of loop for decision 104
          end
        end # loop for decision 104
        # at line 460:21: ( constraint_statement ( NL )+ )*
        while true # decision 106
          alt_106 = 2
          look_106_0 = @input.peek( 1 )

          if ( look_106_0 == ID || look_106_0 == T__28 || look_106_0 == T__55 || look_106_0 == T__59 )
            alt_106 = 1

          end
          case alt_106
          when 1
            # at line 460:22: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_namespace_1449 )
            constraint_statement251 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement251.tree )
            # --> action

            			key = self.to_ref(( path247 && @input.to_s( path247.start, path247.stop ) ) + '.' + ( constraint_statement251.nil? ? nil : constraint_statement251.key )[2,( constraint_statement251.nil? ? nil : constraint_statement251.key ).length])
            			@now[key] = ( constraint_statement251.nil? ? nil : constraint_statement251.val )
            		
            # <-- action
            # at file 465:3: ( NL )+
            match_count_105 = 0
            while true
              alt_105 = 2
              look_105_0 = @input.peek( 1 )

              if ( look_105_0 == NL )
                alt_105 = 1

              end
              case alt_105
              when 1
                # at line 465:3: NL
                __NL252__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1457 )

                tree_for_NL252 = @adaptor.create_with_payload( __NL252__ )
                @adaptor.add_child( root_0, tree_for_NL252 )


              else
                match_count_105 > 0 and break
                eee = EarlyExit(105)


                raise eee
              end
              match_count_105 += 1
            end


          else
            break # out of loop for decision 106
          end
        end # loop for decision 106
        char_literal253 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_namespace_1462 )

        tree_for_char_literal253 = @adaptor.create_with_payload( char_literal253 )
        @adaptor.add_child( root_0, tree_for_char_literal253 )

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
    # 468:1: constraint_iterator : 'foreach' '(' path 'as' ID ')' ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ )* '}' ;
    # 
    def constraint_iterator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
      return_value = ConstraintIteratorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal254 = nil
      char_literal255 = nil
      string_literal257 = nil
      __ID258__ = nil
      char_literal259 = nil
      __NL260__ = nil
      char_literal261 = nil
      __NL262__ = nil
      __NL264__ = nil
      char_literal265 = nil
      path256 = nil
      constraint_statement263 = nil

      tree_for_string_literal254 = nil
      tree_for_char_literal255 = nil
      tree_for_string_literal257 = nil
      tree_for_ID258 = nil
      tree_for_char_literal259 = nil
      tree_for_NL260 = nil
      tree_for_char_literal261 = nil
      tree_for_NL262 = nil
      tree_for_NL264 = nil
      tree_for_char_literal265 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 469:4: 'foreach' '(' path 'as' ID ')' ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ )* '}'
        string_literal254 = match( T__48, TOKENS_FOLLOWING_T__48_IN_constraint_iterator_1473 )

        tree_for_string_literal254 = @adaptor.create_with_payload( string_literal254 )
        @adaptor.add_child( root_0, tree_for_string_literal254 )

        char_literal255 = match( T__36, TOKENS_FOLLOWING_T__36_IN_constraint_iterator_1475 )

        tree_for_char_literal255 = @adaptor.create_with_payload( char_literal255 )
        @adaptor.add_child( root_0, tree_for_char_literal255 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_iterator_1477 )
        path256 = path
        @state.following.pop
        @adaptor.add_child( root_0, path256.tree )
        string_literal257 = match( T__49, TOKENS_FOLLOWING_T__49_IN_constraint_iterator_1479 )

        tree_for_string_literal257 = @adaptor.create_with_payload( string_literal257 )
        @adaptor.add_child( root_0, tree_for_string_literal257 )

        __ID258__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_iterator_1481 )

        tree_for_ID258 = @adaptor.create_with_payload( __ID258__ )
        @adaptor.add_child( root_0, tree_for_ID258 )

        char_literal259 = match( T__38, TOKENS_FOLLOWING_T__38_IN_constraint_iterator_1483 )

        tree_for_char_literal259 = @adaptor.create_with_payload( char_literal259 )
        @adaptor.add_child( root_0, tree_for_char_literal259 )

        # at line 469:35: ( NL )*
        while true # decision 107
          alt_107 = 2
          look_107_0 = @input.peek( 1 )

          if ( look_107_0 == NL )
            alt_107 = 1

          end
          case alt_107
          when 1
            # at line 469:35: NL
            __NL260__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1485 )

            tree_for_NL260 = @adaptor.create_with_payload( __NL260__ )
            @adaptor.add_child( root_0, tree_for_NL260 )


          else
            break # out of loop for decision 107
          end
        end # loop for decision 107
        char_literal261 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_iterator_1488 )

        tree_for_char_literal261 = @adaptor.create_with_payload( char_literal261 )
        @adaptor.add_child( root_0, tree_for_char_literal261 )

        # at file 469:43: ( NL )+
        match_count_108 = 0
        while true
          alt_108 = 2
          look_108_0 = @input.peek( 1 )

          if ( look_108_0 == NL )
            alt_108 = 1

          end
          case alt_108
          when 1
            # at line 469:43: NL
            __NL262__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1490 )

            tree_for_NL262 = @adaptor.create_with_payload( __NL262__ )
            @adaptor.add_child( root_0, tree_for_NL262 )


          else
            match_count_108 > 0 and break
            eee = EarlyExit(108)


            raise eee
          end
          match_count_108 += 1
        end

        # --> action

        			id = self.next_id.to_s
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'iterator',
        				'_self' => id,
        				'_value' => '$.' + ( path256 && @input.to_s( path256.start, path256.stop ) ),
        				'_variable' => __ID258__.text
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
        # at line 489:3: ( constraint_statement ( NL )+ )*
        while true # decision 110
          alt_110 = 2
          look_110_0 = @input.peek( 1 )

          if ( look_110_0 == ID || look_110_0 == T__28 || look_110_0 == T__55 || look_110_0 == T__59 )
            alt_110 = 1

          end
          case alt_110
          when 1
            # at line 489:4: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_iterator_1500 )
            constraint_statement263 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement263.tree )
            # --> action

            			@now[( constraint_statement263.nil? ? nil : constraint_statement263.key )] = ( constraint_statement263.nil? ? nil : constraint_statement263.val )
            		
            # <-- action
            # at file 493:3: ( NL )+
            match_count_109 = 0
            while true
              alt_109 = 2
              look_109_0 = @input.peek( 1 )

              if ( look_109_0 == NL )
                alt_109 = 1

              end
              case alt_109
              when 1
                # at line 493:3: NL
                __NL264__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1508 )

                tree_for_NL264 = @adaptor.create_with_payload( __NL264__ )
                @adaptor.add_child( root_0, tree_for_NL264 )


              else
                match_count_109 > 0 and break
                eee = EarlyExit(109)


                raise eee
              end
              match_count_109 += 1
            end


          else
            break # out of loop for decision 110
          end
        end # loop for decision 110
        char_literal265 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_iterator_1515 )

        tree_for_char_literal265 = @adaptor.create_with_payload( char_literal265 )
        @adaptor.add_child( root_0, tree_for_char_literal265 )

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
    # 501:1: quantification_keyword : ( 'forall' | 'exist' | 'forsome' );
    # 
    def quantification_keyword
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = QuantificationKeywordReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set266 = nil

      tree_for_set266 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set266 = @input.look
        if @input.peek( 1 ).between?( T__50, T__52 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set266 ) )
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
    # 507:1: constraint_class_quantification : quantification_keyword '(' path 'as' ID ')' ( ( binary_comp | '=' ) NUMBER )? ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ | constraint_different ( NL )+ | constraint_iterator ( NL )+ )* '}' ;
    # 
    def constraint_class_quantification
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
      return_value = ConstraintClassQuantificationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal268 = nil
      string_literal270 = nil
      __ID271__ = nil
      char_literal272 = nil
      char_literal274 = nil
      __NUMBER275__ = nil
      __NL276__ = nil
      char_literal277 = nil
      __NL278__ = nil
      __NL280__ = nil
      __NL282__ = nil
      __NL284__ = nil
      char_literal285 = nil
      quantification_keyword267 = nil
      path269 = nil
      binary_comp273 = nil
      constraint_statement279 = nil
      constraint_different281 = nil
      constraint_iterator283 = nil

      tree_for_char_literal268 = nil
      tree_for_string_literal270 = nil
      tree_for_ID271 = nil
      tree_for_char_literal272 = nil
      tree_for_char_literal274 = nil
      tree_for_NUMBER275 = nil
      tree_for_NL276 = nil
      tree_for_char_literal277 = nil
      tree_for_NL278 = nil
      tree_for_NL280 = nil
      tree_for_NL282 = nil
      tree_for_NL284 = nil
      tree_for_char_literal285 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 508:4: quantification_keyword '(' path 'as' ID ')' ( ( binary_comp | '=' ) NUMBER )? ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ | constraint_different ( NL )+ | constraint_iterator ( NL )+ )* '}'
        @state.following.push( TOKENS_FOLLOWING_quantification_keyword_IN_constraint_class_quantification_1551 )
        quantification_keyword267 = quantification_keyword
        @state.following.pop
        @adaptor.add_child( root_0, quantification_keyword267.tree )
        char_literal268 = match( T__36, TOKENS_FOLLOWING_T__36_IN_constraint_class_quantification_1553 )

        tree_for_char_literal268 = @adaptor.create_with_payload( char_literal268 )
        @adaptor.add_child( root_0, tree_for_char_literal268 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_class_quantification_1555 )
        path269 = path
        @state.following.pop
        @adaptor.add_child( root_0, path269.tree )
        string_literal270 = match( T__49, TOKENS_FOLLOWING_T__49_IN_constraint_class_quantification_1557 )

        tree_for_string_literal270 = @adaptor.create_with_payload( string_literal270 )
        @adaptor.add_child( root_0, tree_for_string_literal270 )

        __ID271__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_class_quantification_1559 )

        tree_for_ID271 = @adaptor.create_with_payload( __ID271__ )
        @adaptor.add_child( root_0, tree_for_ID271 )

        char_literal272 = match( T__38, TOKENS_FOLLOWING_T__38_IN_constraint_class_quantification_1561 )

        tree_for_char_literal272 = @adaptor.create_with_payload( char_literal272 )
        @adaptor.add_child( root_0, tree_for_char_literal272 )

        # --> action

        			id = self.next_id.to_s
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => ( quantification_keyword267 && @input.to_s( quantification_keyword267.start, quantification_keyword267.stop ) ),
        				'_self' => id,
        				'_class' => ( path269 && @input.to_s( path269.start, path269.stop ) ),
        				'_variable' => __ID271__.text
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
        # at line 528:3: ( ( binary_comp | '=' ) NUMBER )?
        alt_112 = 2
        look_112_0 = @input.peek( 1 )

        if ( look_112_0 == T__53 || look_112_0.between?( T__72, T__75 ) )
          alt_112 = 1
        end
        case alt_112
        when 1
          # at line 528:5: ( binary_comp | '=' ) NUMBER
          # at line 528:5: ( binary_comp | '=' )
          alt_111 = 2
          look_111_0 = @input.peek( 1 )

          if ( look_111_0.between?( T__72, T__75 ) )
            alt_111 = 1
          elsif ( look_111_0 == T__53 )
            alt_111 = 2
          else
            raise NoViableAlternative( "", 111, 0 )
          end
          case alt_111
          when 1
            # at line 528:7: binary_comp
            @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_constraint_class_quantification_1573 )
            binary_comp273 = binary_comp
            @state.following.pop
            @adaptor.add_child( root_0, binary_comp273.tree )
            # --> action
            	@now['_count_operator'] = ( binary_comp273 && @input.to_s( binary_comp273.start, binary_comp273.stop ) )	
            # <-- action

          when 2
            # at line 530:6: '='
            char_literal274 = match( T__53, TOKENS_FOLLOWING_T__53_IN_constraint_class_quantification_1586 )

            tree_for_char_literal274 = @adaptor.create_with_payload( char_literal274 )
            @adaptor.add_child( root_0, tree_for_char_literal274 )

            # --> action
            	@now['_count_operator'] = '='	
            # <-- action

          end
          __NUMBER275__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_constraint_class_quantification_1602 )

          tree_for_NUMBER275 = @adaptor.create_with_payload( __NUMBER275__ )
          @adaptor.add_child( root_0, tree_for_NUMBER275 )

          # --> action
          	@now['_count_value'] = __NUMBER275__.text.to_i	
          # <-- action

        end
        # at line 536:3: ( NL )*
        while true # decision 113
          alt_113 = 2
          look_113_0 = @input.peek( 1 )

          if ( look_113_0 == NL )
            alt_113 = 1

          end
          case alt_113
          when 1
            # at line 536:3: NL
            __NL276__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1616 )

            tree_for_NL276 = @adaptor.create_with_payload( __NL276__ )
            @adaptor.add_child( root_0, tree_for_NL276 )


          else
            break # out of loop for decision 113
          end
        end # loop for decision 113
        char_literal277 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_class_quantification_1619 )

        tree_for_char_literal277 = @adaptor.create_with_payload( char_literal277 )
        @adaptor.add_child( root_0, tree_for_char_literal277 )

        # at file 536:11: ( NL )+
        match_count_114 = 0
        while true
          alt_114 = 2
          look_114_0 = @input.peek( 1 )

          if ( look_114_0 == NL )
            alt_114 = 1

          end
          case alt_114
          when 1
            # at line 536:11: NL
            __NL278__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1621 )

            tree_for_NL278 = @adaptor.create_with_payload( __NL278__ )
            @adaptor.add_child( root_0, tree_for_NL278 )


          else
            match_count_114 > 0 and break
            eee = EarlyExit(114)


            raise eee
          end
          match_count_114 += 1
        end

        # at line 537:3: ( constraint_statement ( NL )+ | constraint_different ( NL )+ | constraint_iterator ( NL )+ )*
        while true # decision 118
          alt_118 = 4
          case look_118 = @input.peek( 1 )
          when ID, T__28, T__55, T__59 then alt_118 = 1
          when T__54 then alt_118 = 2
          when T__48 then alt_118 = 3
          end
          case alt_118
          when 1
            # at line 537:5: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_class_quantification_1628 )
            constraint_statement279 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement279.tree )
            # --> action
            	@now[( constraint_statement279.nil? ? nil : constraint_statement279.key )] = ( constraint_statement279.nil? ? nil : constraint_statement279.val )	
            # <-- action
            # at file 539:4: ( NL )+
            match_count_115 = 0
            while true
              alt_115 = 2
              look_115_0 = @input.peek( 1 )

              if ( look_115_0 == NL )
                alt_115 = 1

              end
              case alt_115
              when 1
                # at line 539:4: NL
                __NL280__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1638 )

                tree_for_NL280 = @adaptor.create_with_payload( __NL280__ )
                @adaptor.add_child( root_0, tree_for_NL280 )


              else
                match_count_115 > 0 and break
                eee = EarlyExit(115)


                raise eee
              end
              match_count_115 += 1
            end


          when 2
            # at line 540:5: constraint_different ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_different_IN_constraint_class_quantification_1645 )
            constraint_different281 = constraint_different
            @state.following.pop
            @adaptor.add_child( root_0, constraint_different281.tree )
            # at file 540:26: ( NL )+
            match_count_116 = 0
            while true
              alt_116 = 2
              look_116_0 = @input.peek( 1 )

              if ( look_116_0 == NL )
                alt_116 = 1

              end
              case alt_116
              when 1
                # at line 540:26: NL
                __NL282__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1647 )

                tree_for_NL282 = @adaptor.create_with_payload( __NL282__ )
                @adaptor.add_child( root_0, tree_for_NL282 )


              else
                match_count_116 > 0 and break
                eee = EarlyExit(116)


                raise eee
              end
              match_count_116 += 1
            end


          when 3
            # at line 541:5: constraint_iterator ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_iterator_IN_constraint_class_quantification_1654 )
            constraint_iterator283 = constraint_iterator
            @state.following.pop
            @adaptor.add_child( root_0, constraint_iterator283.tree )
            # at file 541:25: ( NL )+
            match_count_117 = 0
            while true
              alt_117 = 2
              look_117_0 = @input.peek( 1 )

              if ( look_117_0 == NL )
                alt_117 = 1

              end
              case alt_117
              when 1
                # at line 541:25: NL
                __NL284__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1656 )

                tree_for_NL284 = @adaptor.create_with_payload( __NL284__ )
                @adaptor.add_child( root_0, tree_for_NL284 )


              else
                match_count_117 > 0 and break
                eee = EarlyExit(117)


                raise eee
              end
              match_count_117 += 1
            end


          else
            break # out of loop for decision 118
          end
        end # loop for decision 118
        char_literal285 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_class_quantification_1664 )

        tree_for_char_literal285 = @adaptor.create_with_payload( char_literal285 )
        @adaptor.add_child( root_0, tree_for_char_literal285 )

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
    # 547:1: constraint_different : ':different' '(' path ')' ;
    # 
    def constraint_different
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )
      return_value = ConstraintDifferentReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal286 = nil
      char_literal287 = nil
      char_literal289 = nil
      path288 = nil

      tree_for_string_literal286 = nil
      tree_for_char_literal287 = nil
      tree_for_char_literal289 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 548:4: ':different' '(' path ')'
        string_literal286 = match( T__54, TOKENS_FOLLOWING_T__54_IN_constraint_different_1683 )

        tree_for_string_literal286 = @adaptor.create_with_payload( string_literal286 )
        @adaptor.add_child( root_0, tree_for_string_literal286 )

        char_literal287 = match( T__36, TOKENS_FOLLOWING_T__36_IN_constraint_different_1685 )

        tree_for_char_literal287 = @adaptor.create_with_payload( char_literal287 )
        @adaptor.add_child( root_0, tree_for_char_literal287 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_different_1687 )
        path288 = path
        @state.following.pop
        @adaptor.add_child( root_0, path288.tree )
        char_literal289 = match( T__38, TOKENS_FOLLOWING_T__38_IN_constraint_different_1689 )

        tree_for_char_literal289 = @adaptor.create_with_payload( char_literal289 )
        @adaptor.add_child( root_0, tree_for_char_literal289 )

        # --> action

        			id = self.next_id.to_s
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'different',
        				'_self' => id,
        				'_path' => ( path288 && @input.to_s( path288.start, path288.stop ) )
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
    # 560:1: constraint_statement returns [key, val] : ( reference | 'not' reference | reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | conditional_constraint | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | reference binary_comp comp_value | total_constraint );
    # 
    def constraint_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
      return_value = ConstraintStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal291 = nil
      __NULL298__ = nil
      __NULL304__ = nil
      string_literal307 = nil
      string_literal308 = nil
      set311 = nil
      string_literal312 = nil
      reference290 = nil
      reference292 = nil
      reference293 = nil
      equals_op294 = nil
      value295 = nil
      reference296 = nil
      equals_op297 = nil
      reference299 = nil
      not_equals_op300 = nil
      value301 = nil
      reference302 = nil
      not_equals_op303 = nil
      conditional_constraint305 = nil
      reference306 = nil
      set_value309 = nil
      reference310 = nil
      set_value313 = nil
      reference314 = nil
      binary_comp315 = nil
      comp_value316 = nil
      total_constraint317 = nil

      tree_for_string_literal291 = nil
      tree_for_NULL298 = nil
      tree_for_NULL304 = nil
      tree_for_string_literal307 = nil
      tree_for_string_literal308 = nil
      tree_for_set311 = nil
      tree_for_string_literal312 = nil

      begin
        # at line 561:2: ( reference | 'not' reference | reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | conditional_constraint | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | reference binary_comp comp_value | total_constraint )
        alt_120 = 11
        alt_120 = @dfa120.predict( @input )
        case alt_120
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 561:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1708 )
          reference290 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference290.tree )
          # --> action

          			return_value.key = ( reference290.nil? ? nil : reference290.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => true }
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 566:4: 'not' reference
          string_literal291 = match( T__55, TOKENS_FOLLOWING_T__55_IN_constraint_statement_1717 )

          tree_for_string_literal291 = @adaptor.create_with_payload( string_literal291 )
          @adaptor.add_child( root_0, tree_for_string_literal291 )

          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1719 )
          reference292 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference292.tree )
          # --> action

          			return_value.key = ( reference292.nil? ? nil : reference292.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => false }
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 571:4: reference equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1728 )
          reference293 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference293.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1730 )
          equals_op294 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op294.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_1732 )
          value295 = value
          @state.following.pop
          @adaptor.add_child( root_0, value295.tree )
          # --> action

          			return_value.key = ( reference293.nil? ? nil : reference293.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => ( value295.nil? ? nil : value295.val ) }
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 576:4: reference equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1741 )
          reference296 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference296.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1743 )
          equals_op297 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op297.tree )
          __NULL298__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_constraint_statement_1745 )

          tree_for_NULL298 = @adaptor.create_with_payload( __NULL298__ )
          @adaptor.add_child( root_0, tree_for_NULL298 )

          # --> action

          			return_value.key = ( reference296.nil? ? nil : reference296.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => self.null_value }
          		
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 581:4: reference not_equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1754 )
          reference299 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference299.tree )
          @state.following.push( TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1756 )
          not_equals_op300 = not_equals_op
          @state.following.pop
          @adaptor.add_child( root_0, not_equals_op300.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_1758 )
          value301 = value
          @state.following.pop
          @adaptor.add_child( root_0, value301.tree )
          # --> action

          			return_value.key = ( reference299.nil? ? nil : reference299.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-equals', '_value' => ( value301.nil? ? nil : value301.val ) }
          		
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 586:4: reference not_equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1767 )
          reference302 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference302.tree )
          @state.following.push( TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1769 )
          not_equals_op303 = not_equals_op
          @state.following.pop
          @adaptor.add_child( root_0, not_equals_op303.tree )
          __NULL304__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_constraint_statement_1771 )

          tree_for_NULL304 = @adaptor.create_with_payload( __NULL304__ )
          @adaptor.add_child( root_0, tree_for_NULL304 )

          # --> action

          			return_value.key = ( reference302.nil? ? nil : reference302.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-equals', '_value' => self.null_value }
          		
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 591:4: conditional_constraint
          @state.following.push( TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_1780 )
          conditional_constraint305 = conditional_constraint
          @state.following.pop
          @adaptor.add_child( root_0, conditional_constraint305.tree )
          # --> action

          			return_value.key = ( conditional_constraint305.nil? ? nil : conditional_constraint305.key )
          			return_value.val = ( conditional_constraint305.nil? ? nil : conditional_constraint305.val )
          		
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 596:4: reference ( 'is' )? 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1789 )
          reference306 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference306.tree )
          # at line 596:14: ( 'is' )?
          alt_119 = 2
          look_119_0 = @input.peek( 1 )

          if ( look_119_0 == T__56 )
            alt_119 = 1
          end
          case alt_119
          when 1
            # at line 596:14: 'is'
            string_literal307 = match( T__56, TOKENS_FOLLOWING_T__56_IN_constraint_statement_1791 )

            tree_for_string_literal307 = @adaptor.create_with_payload( string_literal307 )
            @adaptor.add_child( root_0, tree_for_string_literal307 )


          end
          string_literal308 = match( T__57, TOKENS_FOLLOWING_T__57_IN_constraint_statement_1794 )

          tree_for_string_literal308 = @adaptor.create_with_payload( string_literal308 )
          @adaptor.add_child( root_0, tree_for_string_literal308 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_1796 )
          set_value309 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value309.tree )
          # --> action

          			c_or = { '_context' => 'constraint', '_type' => 'or', '_parent' => @now }
          			( set_value309.nil? ? nil : set_value309.val ).each { |v|
          				id = self.next_id.to_s
          				item = { '_context' => 'constraint', '_type' => 'and', '_parent' => c_or }
          				item[( reference306.nil? ? nil : reference306.val )] = { '_context' => 'constraint', '_type' => 'equals', '_value' => v }
          				c_or[id] = item
          			}
          			return_value.key = self.next_id.to_s
          			return_value.val = c_or
          		
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 608:4: reference ( 'isnt' | 'not' ) 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1805 )
          reference310 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference310.tree )
          set311 = @input.look
          if @input.peek(1) == T__55 || @input.peek(1) == T__58
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set311 ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          string_literal312 = match( T__57, TOKENS_FOLLOWING_T__57_IN_constraint_statement_1813 )

          tree_for_string_literal312 = @adaptor.create_with_payload( string_literal312 )
          @adaptor.add_child( root_0, tree_for_string_literal312 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_1815 )
          set_value313 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value313.tree )
          # --> action

          			c_and = { '_context'=>'constraint', '_type'=>'and', '_parent'=>@now }
          			( set_value313.nil? ? nil : set_value313.val ).each { |v|
          				id = self.next_id.to_s
          				item = { '_context'=>'constraint', '_type'=>'and'}
          				item[( reference310.nil? ? nil : reference310.val )] = { '_context'=>'constraint', '_type'=>'not-equals', '_value'=>v }
          				c_and[id] = item
          			}
          			return_value.key = self.next_id.to_s
          			return_value.val = c_and

          			#return_value.key = ( reference310.nil? ? nil : reference310.val )
          			#return_value.val = { '_context' => 'constraint', '_type' => 'not-in', '_value' => ( set_value313.nil? ? nil : set_value313.val ) }
          		
          # <-- action

        when 10
          root_0 = @adaptor.create_flat_list


          # at line 623:4: reference binary_comp comp_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1824 )
          reference314 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference314.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_1826 )
          binary_comp315 = binary_comp
          @state.following.pop
          @adaptor.add_child( root_0, binary_comp315.tree )
          @state.following.push( TOKENS_FOLLOWING_comp_value_IN_constraint_statement_1828 )
          comp_value316 = comp_value
          @state.following.pop
          @adaptor.add_child( root_0, comp_value316.tree )
          # --> action

          			return_value.key = ( reference314.nil? ? nil : reference314.val )
          			return_value.val = { '_context' => 'constraint', '_type' => ( binary_comp315 && @input.to_s( binary_comp315.start, binary_comp315.stop ) ), '_value' => ( comp_value316.nil? ? nil : comp_value316.val ) }
          		
          # <-- action

        when 11
          root_0 = @adaptor.create_flat_list


          # at line 628:4: total_constraint
          @state.following.push( TOKENS_FOLLOWING_total_constraint_IN_constraint_statement_1837 )
          total_constraint317 = total_constraint
          @state.following.pop
          @adaptor.add_child( root_0, total_constraint317.tree )

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
    # 631:1: total_constraint : 'total(' total_statement ')' binary_comp NUMBER ;
    # 
    def total_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
      return_value = TotalConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal318 = nil
      char_literal320 = nil
      __NUMBER322__ = nil
      total_statement319 = nil
      binary_comp321 = nil

      tree_for_string_literal318 = nil
      tree_for_char_literal320 = nil
      tree_for_NUMBER322 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 632:4: 'total(' total_statement ')' binary_comp NUMBER
        string_literal318 = match( T__59, TOKENS_FOLLOWING_T__59_IN_total_constraint_1848 )

        tree_for_string_literal318 = @adaptor.create_with_payload( string_literal318 )
        @adaptor.add_child( root_0, tree_for_string_literal318 )

        @state.following.push( TOKENS_FOLLOWING_total_statement_IN_total_constraint_1850 )
        total_statement319 = total_statement
        @state.following.pop
        @adaptor.add_child( root_0, total_statement319.tree )
        char_literal320 = match( T__38, TOKENS_FOLLOWING_T__38_IN_total_constraint_1852 )

        tree_for_char_literal320 = @adaptor.create_with_payload( char_literal320 )
        @adaptor.add_child( root_0, tree_for_char_literal320 )

        @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_total_constraint_1854 )
        binary_comp321 = binary_comp
        @state.following.pop
        @adaptor.add_child( root_0, binary_comp321.tree )
        __NUMBER322__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_total_constraint_1856 )

        tree_for_NUMBER322 = @adaptor.create_with_payload( __NUMBER322__ )
        @adaptor.add_child( root_0, tree_for_NUMBER322 )

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
    # 635:1: total_statement : reference equals_op value ;
    # 
    def total_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )
      return_value = TotalStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      reference323 = nil
      equals_op324 = nil
      value325 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 636:4: reference equals_op value
        @state.following.push( TOKENS_FOLLOWING_reference_IN_total_statement_1867 )
        reference323 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference323.tree )
        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_total_statement_1869 )
        equals_op324 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op324.tree )
        @state.following.push( TOKENS_FOLLOWING_value_IN_total_statement_1871 )
        value325 = value
        @state.following.pop
        @adaptor.add_child( root_0, value325.tree )
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
    # 639:1: comp_value returns [val] : ( NUMBER | reference );
    # 
    def comp_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )
      return_value = CompValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NUMBER326__ = nil
      reference327 = nil

      tree_for_NUMBER326 = nil

      begin
        # at line 640:2: ( NUMBER | reference )
        alt_121 = 2
        look_121_0 = @input.peek( 1 )

        if ( look_121_0 == NUMBER )
          alt_121 = 1
        elsif ( look_121_0 == ID )
          alt_121 = 2
        else
          raise NoViableAlternative( "", 121, 0 )
        end
        case alt_121
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 640:4: NUMBER
          __NUMBER326__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_comp_value_1886 )

          tree_for_NUMBER326 = @adaptor.create_with_payload( __NUMBER326__ )
          @adaptor.add_child( root_0, tree_for_NUMBER326 )

          # --> action
          	return_value.val = __NUMBER326__.text.to_i	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 642:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_comp_value_1895 )
          reference327 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference327.tree )
          # --> action
          	return_value.val = ( reference327.nil? ? nil : reference327.val )	
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
    # 646:1: conditional_constraint returns [key, val] : 'if' conditional_constraint_if_part conditional_constraint_then_part ;
    # 
    def conditional_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )
      return_value = ConditionalConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal328 = nil
      conditional_constraint_if_part329 = nil
      conditional_constraint_then_part330 = nil

      tree_for_string_literal328 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 647:4: 'if' conditional_constraint_if_part conditional_constraint_then_part
        string_literal328 = match( T__28, TOKENS_FOLLOWING_T__28_IN_conditional_constraint_1914 )

        tree_for_string_literal328 = @adaptor.create_with_payload( string_literal328 )
        @adaptor.add_child( root_0, tree_for_string_literal328 )

        # --> action

        			return_value.key = id = self.next_id.to_s
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'or'
        			}
        			@now = @now[id]
        		
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_conditional_constraint_if_part_IN_conditional_constraint_1922 )
        conditional_constraint_if_part329 = conditional_constraint_if_part
        @state.following.pop
        @adaptor.add_child( root_0, conditional_constraint_if_part329.tree )
        @state.following.push( TOKENS_FOLLOWING_conditional_constraint_then_part_IN_conditional_constraint_1926 )
        conditional_constraint_then_part330 = conditional_constraint_then_part
        @state.following.pop
        @adaptor.add_child( root_0, conditional_constraint_then_part330.tree )
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

    ConditionalConstraintIfPartReturnValue = define_return_scope 

    # 
    # parser rule conditional_constraint_if_part
    # 
    # (in SFP.g)
    # 661:1: conditional_constraint_if_part : ( constraint_statement ( NL )* | '{' ( NL )+ constraint_body '}' ( NL )* );
    # 
    def conditional_constraint_if_part
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )
      return_value = ConditionalConstraintIfPartReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL332__ = nil
      char_literal333 = nil
      __NL334__ = nil
      char_literal336 = nil
      __NL337__ = nil
      constraint_statement331 = nil
      constraint_body335 = nil

      tree_for_NL332 = nil
      tree_for_char_literal333 = nil
      tree_for_NL334 = nil
      tree_for_char_literal336 = nil
      tree_for_NL337 = nil

      begin
        # at line 662:2: ( constraint_statement ( NL )* | '{' ( NL )+ constraint_body '}' ( NL )* )
        alt_125 = 2
        look_125_0 = @input.peek( 1 )

        if ( look_125_0 == ID || look_125_0 == T__28 || look_125_0 == T__55 || look_125_0 == T__59 )
          alt_125 = 1
        elsif ( look_125_0 == T__20 )
          alt_125 = 2
        else
          raise NoViableAlternative( "", 125, 0 )
        end
        case alt_125
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 662:4: constraint_statement ( NL )*
          @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_if_part_1941 )
          constraint_statement331 = constraint_statement
          @state.following.pop
          @adaptor.add_child( root_0, constraint_statement331.tree )
          # at line 662:25: ( NL )*
          while true # decision 122
            alt_122 = 2
            look_122_0 = @input.peek( 1 )

            if ( look_122_0 == NL )
              alt_122 = 1

            end
            case alt_122
            when 1
              # at line 662:25: NL
              __NL332__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditional_constraint_if_part_1943 )

              tree_for_NL332 = @adaptor.create_with_payload( __NL332__ )
              @adaptor.add_child( root_0, tree_for_NL332 )


            else
              break # out of loop for decision 122
            end
          end # loop for decision 122
          # --> action

          			id = self.next_id
          			@now[id] = { '_parent' => @now,
          				'_context' => 'constraint',
          				'_type' => 'not'
          			}
          			@now[id][( constraint_statement331.nil? ? nil : constraint_statement331.key )] = ( constraint_statement331.nil? ? nil : constraint_statement331.val )
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 671:4: '{' ( NL )+ constraint_body '}' ( NL )*
          char_literal333 = match( T__20, TOKENS_FOLLOWING_T__20_IN_conditional_constraint_if_part_1953 )

          tree_for_char_literal333 = @adaptor.create_with_payload( char_literal333 )
          @adaptor.add_child( root_0, tree_for_char_literal333 )

          # --> action

          			id = self.next_id
          			@now[id] = self.create_constraint(id, 'not')
          			@now = @now[id]
          		
          # <-- action
          # at file 677:3: ( NL )+
          match_count_123 = 0
          while true
            alt_123 = 2
            look_123_0 = @input.peek( 1 )

            if ( look_123_0 == NL )
              alt_123 = 1

            end
            case alt_123
            when 1
              # at line 677:3: NL
              __NL334__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditional_constraint_if_part_1961 )

              tree_for_NL334 = @adaptor.create_with_payload( __NL334__ )
              @adaptor.add_child( root_0, tree_for_NL334 )


            else
              match_count_123 > 0 and break
              eee = EarlyExit(123)


              raise eee
            end
            match_count_123 += 1
          end

          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_conditional_constraint_if_part_1964 )
          constraint_body335 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body335.tree )
          char_literal336 = match( T__21, TOKENS_FOLLOWING_T__21_IN_conditional_constraint_if_part_1968 )

          tree_for_char_literal336 = @adaptor.create_with_payload( char_literal336 )
          @adaptor.add_child( root_0, tree_for_char_literal336 )

          # at line 678:7: ( NL )*
          while true # decision 124
            alt_124 = 2
            look_124_0 = @input.peek( 1 )

            if ( look_124_0 == NL )
              alt_124 = 1

            end
            case alt_124
            when 1
              # at line 678:7: NL
              __NL337__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditional_constraint_if_part_1970 )

              tree_for_NL337 = @adaptor.create_with_payload( __NL337__ )
              @adaptor.add_child( root_0, tree_for_NL337 )


            else
              break # out of loop for decision 124
            end
          end # loop for decision 124
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
        # trace_out( __method__, 40 )

      end
      
      return return_value
    end

    ConditionalConstraintThenPartReturnValue = define_return_scope 

    # 
    # parser rule conditional_constraint_then_part
    # 
    # (in SFP.g)
    # 682:1: conditional_constraint_then_part : ( 'then' constraint_statement | 'then' '{' ( NL )+ constraint_body '}' );
    # 
    def conditional_constraint_then_part
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )
      return_value = ConditionalConstraintThenPartReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal338 = nil
      string_literal340 = nil
      char_literal341 = nil
      __NL342__ = nil
      char_literal344 = nil
      constraint_statement339 = nil
      constraint_body343 = nil

      tree_for_string_literal338 = nil
      tree_for_string_literal340 = nil
      tree_for_char_literal341 = nil
      tree_for_NL342 = nil
      tree_for_char_literal344 = nil

      begin
        # at line 683:2: ( 'then' constraint_statement | 'then' '{' ( NL )+ constraint_body '}' )
        alt_127 = 2
        look_127_0 = @input.peek( 1 )

        if ( look_127_0 == T__29 )
          look_127_1 = @input.peek( 2 )

          if ( look_127_1 == ID || look_127_1 == T__28 || look_127_1 == T__55 || look_127_1 == T__59 )
            alt_127 = 1
          elsif ( look_127_1 == T__20 )
            alt_127 = 2
          else
            raise NoViableAlternative( "", 127, 1 )
          end
        else
          raise NoViableAlternative( "", 127, 0 )
        end
        case alt_127
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 683:4: 'then' constraint_statement
          string_literal338 = match( T__29, TOKENS_FOLLOWING_T__29_IN_conditional_constraint_then_part_1986 )

          tree_for_string_literal338 = @adaptor.create_with_payload( string_literal338 )
          @adaptor.add_child( root_0, tree_for_string_literal338 )

          @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_part_1988 )
          constraint_statement339 = constraint_statement
          @state.following.pop
          @adaptor.add_child( root_0, constraint_statement339.tree )
          # --> action

          			id = self.next_id
          			@now[id] = { '_parent' => @now,
          				'_context' => 'constraint',
          				'_type' => 'and'
          			}
          			@now[id][( constraint_statement339.nil? ? nil : constraint_statement339.key )] = ( constraint_statement339.nil? ? nil : constraint_statement339.val )
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 692:4: 'then' '{' ( NL )+ constraint_body '}'
          string_literal340 = match( T__29, TOKENS_FOLLOWING_T__29_IN_conditional_constraint_then_part_1997 )

          tree_for_string_literal340 = @adaptor.create_with_payload( string_literal340 )
          @adaptor.add_child( root_0, tree_for_string_literal340 )

          # --> action

          			id = self.next_id
          			@now[id] = { '_parent' => @now,
          				'_context' => 'constraint',
          				'_type' => 'and'
          			}
          			@now = @now[id]
          		
          # <-- action
          char_literal341 = match( T__20, TOKENS_FOLLOWING_T__20_IN_conditional_constraint_then_part_2005 )

          tree_for_char_literal341 = @adaptor.create_with_payload( char_literal341 )
          @adaptor.add_child( root_0, tree_for_char_literal341 )

          # at file 701:7: ( NL )+
          match_count_126 = 0
          while true
            alt_126 = 2
            look_126_0 = @input.peek( 1 )

            if ( look_126_0 == NL )
              alt_126 = 1

            end
            case alt_126
            when 1
              # at line 701:7: NL
              __NL342__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditional_constraint_then_part_2007 )

              tree_for_NL342 = @adaptor.create_with_payload( __NL342__ )
              @adaptor.add_child( root_0, tree_for_NL342 )


            else
              match_count_126 > 0 and break
              eee = EarlyExit(126)


              raise eee
            end
            match_count_126 += 1
          end

          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_conditional_constraint_then_part_2010 )
          constraint_body343 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body343.tree )
          char_literal344 = match( T__21, TOKENS_FOLLOWING_T__21_IN_conditional_constraint_then_part_2012 )

          tree_for_char_literal344 = @adaptor.create_with_payload( char_literal344 )
          @adaptor.add_child( root_0, tree_for_char_literal344 )

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
        # trace_out( __method__, 41 )

      end
      
      return return_value
    end

    MutationBodyReturnValue = define_return_scope 

    # 
    # parser rule mutation_body
    # 
    # (in SFP.g)
    # 705:1: mutation_body : ( ( mutation_statement | mutation_iterator ) ( NL )+ )* ;
    # 
    def mutation_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )
      return_value = MutationBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL347__ = nil
      mutation_statement345 = nil
      mutation_iterator346 = nil

      tree_for_NL347 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 706:4: ( ( mutation_statement | mutation_iterator ) ( NL )+ )*
        # at line 706:4: ( ( mutation_statement | mutation_iterator ) ( NL )+ )*
        while true # decision 130
          alt_130 = 2
          look_130_0 = @input.peek( 1 )

          if ( look_130_0 == ID || look_130_0 == T__48 || look_130_0 == T__61 )
            alt_130 = 1

          end
          case alt_130
          when 1
            # at line 707:4: ( mutation_statement | mutation_iterator ) ( NL )+
            # at line 707:4: ( mutation_statement | mutation_iterator )
            alt_128 = 2
            look_128_0 = @input.peek( 1 )

            if ( look_128_0 == ID || look_128_0 == T__61 )
              alt_128 = 1
            elsif ( look_128_0 == T__48 )
              alt_128 = 2
            else
              raise NoViableAlternative( "", 128, 0 )
            end
            case alt_128
            when 1
              # at line 707:6: mutation_statement
              @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_mutation_body_2034 )
              mutation_statement345 = mutation_statement
              @state.following.pop
              @adaptor.add_child( root_0, mutation_statement345.tree )
              # --> action
              	@now[( mutation_statement345.nil? ? nil : mutation_statement345.key )] = ( mutation_statement345.nil? ? nil : mutation_statement345.val )	
              # <-- action

            when 2
              # at line 709:6: mutation_iterator
              @state.following.push( TOKENS_FOLLOWING_mutation_iterator_IN_mutation_body_2047 )
              mutation_iterator346 = mutation_iterator
              @state.following.pop
              @adaptor.add_child( root_0, mutation_iterator346.tree )

            end
            # at file 711:3: ( NL )+
            match_count_129 = 0
            while true
              alt_129 = 2
              look_129_0 = @input.peek( 1 )

              if ( look_129_0 == NL )
                alt_129 = 1

              end
              case alt_129
              when 1
                # at line 711:3: NL
                __NL347__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_body_2056 )

                tree_for_NL347 = @adaptor.create_with_payload( __NL347__ )
                @adaptor.add_child( root_0, tree_for_NL347 )


              else
                match_count_129 > 0 and break
                eee = EarlyExit(129)


                raise eee
              end
              match_count_129 += 1
            end


          else
            break # out of loop for decision 130
          end
        end # loop for decision 130
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

    MutationIteratorReturnValue = define_return_scope 

    # 
    # parser rule mutation_iterator
    # 
    # (in SFP.g)
    # 714:1: mutation_iterator : 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( mutation_statement ( NL )+ )* '}' ;
    # 
    def mutation_iterator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )
      return_value = MutationIteratorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal348 = nil
      string_literal350 = nil
      __ID351__ = nil
      __NL352__ = nil
      char_literal353 = nil
      __NL354__ = nil
      __NL356__ = nil
      char_literal357 = nil
      path349 = nil
      mutation_statement355 = nil

      tree_for_string_literal348 = nil
      tree_for_string_literal350 = nil
      tree_for_ID351 = nil
      tree_for_NL352 = nil
      tree_for_char_literal353 = nil
      tree_for_NL354 = nil
      tree_for_NL356 = nil
      tree_for_char_literal357 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 715:4: 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( mutation_statement ( NL )+ )* '}'
        string_literal348 = match( T__48, TOKENS_FOLLOWING_T__48_IN_mutation_iterator_2071 )

        tree_for_string_literal348 = @adaptor.create_with_payload( string_literal348 )
        @adaptor.add_child( root_0, tree_for_string_literal348 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_iterator_2073 )
        path349 = path
        @state.following.pop
        @adaptor.add_child( root_0, path349.tree )
        string_literal350 = match( T__49, TOKENS_FOLLOWING_T__49_IN_mutation_iterator_2075 )

        tree_for_string_literal350 = @adaptor.create_with_payload( string_literal350 )
        @adaptor.add_child( root_0, tree_for_string_literal350 )

        __ID351__ = match( ID, TOKENS_FOLLOWING_ID_IN_mutation_iterator_2077 )

        tree_for_ID351 = @adaptor.create_with_payload( __ID351__ )
        @adaptor.add_child( root_0, tree_for_ID351 )

        # at line 715:27: ( NL )*
        while true # decision 131
          alt_131 = 2
          look_131_0 = @input.peek( 1 )

          if ( look_131_0 == NL )
            alt_131 = 1

          end
          case alt_131
          when 1
            # at line 715:27: NL
            __NL352__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_2079 )

            tree_for_NL352 = @adaptor.create_with_payload( __NL352__ )
            @adaptor.add_child( root_0, tree_for_NL352 )


          else
            break # out of loop for decision 131
          end
        end # loop for decision 131
        char_literal353 = match( T__20, TOKENS_FOLLOWING_T__20_IN_mutation_iterator_2082 )

        tree_for_char_literal353 = @adaptor.create_with_payload( char_literal353 )
        @adaptor.add_child( root_0, tree_for_char_literal353 )

        # at file 715:35: ( NL )+
        match_count_132 = 0
        while true
          alt_132 = 2
          look_132_0 = @input.peek( 1 )

          if ( look_132_0 == NL )
            alt_132 = 1

          end
          case alt_132
          when 1
            # at line 715:35: NL
            __NL354__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_2084 )

            tree_for_NL354 = @adaptor.create_with_payload( __NL354__ )
            @adaptor.add_child( root_0, tree_for_NL354 )


          else
            match_count_132 > 0 and break
            eee = EarlyExit(132)


            raise eee
          end
          match_count_132 += 1
        end

        # --> action

        			id = self.to_ref(( path349 && @input.to_s( path349.start, path349.stop ) ))
        			@now[id] = { '_parent' => @now,
        				'_context' => 'iterator',
        				'_self' => id,
        				'_variable' => __ID351__.text
        			}
        			@now = @now[id]
        		
        # <-- action
        # at line 725:3: ( mutation_statement ( NL )+ )*
        while true # decision 134
          alt_134 = 2
          look_134_0 = @input.peek( 1 )

          if ( look_134_0 == ID || look_134_0 == T__61 )
            alt_134 = 1

          end
          case alt_134
          when 1
            # at line 725:4: mutation_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_mutation_iterator_2094 )
            mutation_statement355 = mutation_statement
            @state.following.pop
            @adaptor.add_child( root_0, mutation_statement355.tree )
            # --> action
            	@now[( mutation_statement355.nil? ? nil : mutation_statement355.key )] = ( mutation_statement355.nil? ? nil : mutation_statement355.val )	
            # <-- action
            # at file 727:3: ( NL )+
            match_count_133 = 0
            while true
              alt_133 = 2
              look_133_0 = @input.peek( 1 )

              if ( look_133_0 == NL )
                alt_133 = 1

              end
              case alt_133
              when 1
                # at line 727:3: NL
                __NL356__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_2102 )

                tree_for_NL356 = @adaptor.create_with_payload( __NL356__ )
                @adaptor.add_child( root_0, tree_for_NL356 )


              else
                match_count_133 > 0 and break
                eee = EarlyExit(133)


                raise eee
              end
              match_count_133 += 1
            end


          else
            break # out of loop for decision 134
          end
        end # loop for decision 134
        char_literal357 = match( T__21, TOKENS_FOLLOWING_T__21_IN_mutation_iterator_2109 )

        tree_for_char_literal357 = @adaptor.create_with_payload( char_literal357 )
        @adaptor.add_child( root_0, tree_for_char_literal357 )

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
        # trace_out( __method__, 43 )

      end
      
      return return_value
    end

    MutationStatementReturnValue = define_return_scope :key, :val

    # 
    # parser rule mutation_statement
    # 
    # (in SFP.g)
    # 732:1: mutation_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' );
    # 
    def mutation_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )
      return_value = MutationStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL363__ = nil
      __NUMBER366__ = nil
      string_literal368 = nil
      string_literal369 = nil
      string_literal372 = nil
      string_literal375 = nil
      char_literal377 = nil
      string_literal379 = nil
      char_literal381 = nil
      reference358 = nil
      equals_op359 = nil
      value360 = nil
      reference361 = nil
      equals_op362 = nil
      reference364 = nil
      binary_op365 = nil
      reference367 = nil
      path370 = nil
      object_body371 = nil
      path373 = nil
      reference374 = nil
      value376 = nil
      reference378 = nil
      value380 = nil

      tree_for_NULL363 = nil
      tree_for_NUMBER366 = nil
      tree_for_string_literal368 = nil
      tree_for_string_literal369 = nil
      tree_for_string_literal372 = nil
      tree_for_string_literal375 = nil
      tree_for_char_literal377 = nil
      tree_for_string_literal379 = nil
      tree_for_char_literal381 = nil

      begin
        # at line 733:2: ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' )
        alt_136 = 7
        alt_136 = @dfa136.predict( @input )
        case alt_136
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 733:4: reference equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2128 )
          reference358 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference358.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_mutation_statement_2130 )
          equals_op359 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op359.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_2132 )
          value360 = value
          @state.following.pop
          @adaptor.add_child( root_0, value360.tree )
          # --> action

          			return_value.key = ( reference358.nil? ? nil : reference358.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'equals',
          				'_value' => ( value360.nil? ? nil : value360.val )
          			}
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 741:4: reference equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2141 )
          reference361 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference361.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_mutation_statement_2143 )
          equals_op362 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op362.tree )
          __NULL363__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_mutation_statement_2145 )

          tree_for_NULL363 = @adaptor.create_with_payload( __NULL363__ )
          @adaptor.add_child( root_0, tree_for_NULL363 )

          # --> action

          			return_value.key = ( reference361.nil? ? nil : reference361.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'equals',
          				'_value' => self.null_value
          			}
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 749:4: reference binary_op NUMBER
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2154 )
          reference364 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference364.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_op_IN_mutation_statement_2156 )
          binary_op365 = binary_op
          @state.following.pop
          @adaptor.add_child( root_0, binary_op365.tree )
          __NUMBER366__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_mutation_statement_2158 )

          tree_for_NUMBER366 = @adaptor.create_with_payload( __NUMBER366__ )
          @adaptor.add_child( root_0, tree_for_NUMBER366 )

          # --> action

          			return_value.key = ( reference364.nil? ? nil : reference364.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => ( binary_op365 && @input.to_s( binary_op365.start, binary_op365.stop ) ),
          				'_value' => __NUMBER366__.text.to_i
          			}
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 757:4: reference 'is' 'new' path ( object_body )?
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2167 )
          reference367 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference367.tree )
          string_literal368 = match( T__56, TOKENS_FOLLOWING_T__56_IN_mutation_statement_2169 )

          tree_for_string_literal368 = @adaptor.create_with_payload( string_literal368 )
          @adaptor.add_child( root_0, tree_for_string_literal368 )

          string_literal369 = match( T__60, TOKENS_FOLLOWING_T__60_IN_mutation_statement_2171 )

          tree_for_string_literal369 = @adaptor.create_with_payload( string_literal369 )
          @adaptor.add_child( root_0, tree_for_string_literal369 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_statement_2173 )
          path370 = path
          @state.following.pop
          @adaptor.add_child( root_0, path370.tree )
          # --> action

          			id = '_' + self.next_id
          			@now[id] = { '_self' => id,
          				'_context' => 'object',
          				'_isa' => self.to_ref(( path370 && @input.to_s( path370.start, path370.stop ) )),
          				'_parent' => @now
          			}
          			@now = @now[id]
          		
          # <-- action
          # at line 767:3: ( object_body )?
          alt_135 = 2
          look_135_0 = @input.peek( 1 )

          if ( look_135_0 == T__20 )
            alt_135 = 1
          end
          case alt_135
          when 1
            # at line 767:3: object_body
            @state.following.push( TOKENS_FOLLOWING_object_body_IN_mutation_statement_2181 )
            object_body371 = object_body
            @state.following.pop
            @adaptor.add_child( root_0, object_body371.tree )

          end
          # --> action

          			n = self.goto_parent()
          			@now.delete(n['_self'])
          			return_value.key = ( reference367.nil? ? nil : reference367.val )
          			return_value.val = n
          		
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 774:4: 'delete' path
          string_literal372 = match( T__61, TOKENS_FOLLOWING_T__61_IN_mutation_statement_2191 )

          tree_for_string_literal372 = @adaptor.create_with_payload( string_literal372 )
          @adaptor.add_child( root_0, tree_for_string_literal372 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_statement_2193 )
          path373 = path
          @state.following.pop
          @adaptor.add_child( root_0, path373.tree )
          # --> action

          			id = '_' + self.next_id
          			@now[id] = { '_self' => id,
          				'_context' => 'mutation',
          				'_type' => 'delete',
          				'_value' => self.to_ref(( path373 && @input.to_s( path373.start, path373.stop ) ))
          			}
          		
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 783:4: reference 'add(' value ')'
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2202 )
          reference374 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference374.tree )
          string_literal375 = match( T__62, TOKENS_FOLLOWING_T__62_IN_mutation_statement_2204 )

          tree_for_string_literal375 = @adaptor.create_with_payload( string_literal375 )
          @adaptor.add_child( root_0, tree_for_string_literal375 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_2206 )
          value376 = value
          @state.following.pop
          @adaptor.add_child( root_0, value376.tree )
          char_literal377 = match( T__38, TOKENS_FOLLOWING_T__38_IN_mutation_statement_2208 )

          tree_for_char_literal377 = @adaptor.create_with_payload( char_literal377 )
          @adaptor.add_child( root_0, tree_for_char_literal377 )

          # --> action

          			return_value.key = ( reference374.nil? ? nil : reference374.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'add',
          				'_value' => ( value376.nil? ? nil : value376.val )
          			}
          		
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 791:4: reference 'remove(' value ')'
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2217 )
          reference378 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference378.tree )
          string_literal379 = match( T__63, TOKENS_FOLLOWING_T__63_IN_mutation_statement_2219 )

          tree_for_string_literal379 = @adaptor.create_with_payload( string_literal379 )
          @adaptor.add_child( root_0, tree_for_string_literal379 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_2221 )
          value380 = value
          @state.following.pop
          @adaptor.add_child( root_0, value380.tree )
          char_literal381 = match( T__38, TOKENS_FOLLOWING_T__38_IN_mutation_statement_2223 )

          tree_for_char_literal381 = @adaptor.create_with_payload( char_literal381 )
          @adaptor.add_child( root_0, tree_for_char_literal381 )

          # --> action

          			return_value.key = ( reference378.nil? ? nil : reference378.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'remove',
          				'_value' => ( value380.nil? ? nil : value380.val )
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
        # trace_out( __method__, 44 )

      end
      
      return return_value
    end

    SetValueReturnValue = define_return_scope :val

    # 
    # parser rule set_value
    # 
    # (in SFP.g)
    # 801:1: set_value returns [val] : '(' ( set_item ( ',' ( NL )* set_item )* )? ')' ;
    # 
    def set_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )
      return_value = SetValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal382 = nil
      char_literal384 = nil
      __NL385__ = nil
      char_literal387 = nil
      set_item383 = nil
      set_item386 = nil

      tree_for_char_literal382 = nil
      tree_for_char_literal384 = nil
      tree_for_NL385 = nil
      tree_for_char_literal387 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 802:4: '(' ( set_item ( ',' ( NL )* set_item )* )? ')'
        char_literal382 = match( T__36, TOKENS_FOLLOWING_T__36_IN_set_value_2242 )

        tree_for_char_literal382 = @adaptor.create_with_payload( char_literal382 )
        @adaptor.add_child( root_0, tree_for_char_literal382 )

        # --> action
        	@set = Array.new	
        # <-- action
        # at line 804:3: ( set_item ( ',' ( NL )* set_item )* )?
        alt_139 = 2
        look_139_0 = @input.peek( 1 )

        if ( look_139_0.between?( STRING, NUMBER ) || look_139_0.between?( BOOLEAN, MULTILINE_STRING ) || look_139_0 == T__36 )
          alt_139 = 1
        end
        case alt_139
        when 1
          # at line 804:4: set_item ( ',' ( NL )* set_item )*
          @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_2251 )
          set_item383 = set_item
          @state.following.pop
          @adaptor.add_child( root_0, set_item383.tree )
          # at line 804:13: ( ',' ( NL )* set_item )*
          while true # decision 138
            alt_138 = 2
            look_138_0 = @input.peek( 1 )

            if ( look_138_0 == T__37 )
              alt_138 = 1

            end
            case alt_138
            when 1
              # at line 804:14: ',' ( NL )* set_item
              char_literal384 = match( T__37, TOKENS_FOLLOWING_T__37_IN_set_value_2254 )

              tree_for_char_literal384 = @adaptor.create_with_payload( char_literal384 )
              @adaptor.add_child( root_0, tree_for_char_literal384 )

              # at line 804:18: ( NL )*
              while true # decision 137
                alt_137 = 2
                look_137_0 = @input.peek( 1 )

                if ( look_137_0 == NL )
                  alt_137 = 1

                end
                case alt_137
                when 1
                  # at line 804:18: NL
                  __NL385__ = match( NL, TOKENS_FOLLOWING_NL_IN_set_value_2256 )

                  tree_for_NL385 = @adaptor.create_with_payload( __NL385__ )
                  @adaptor.add_child( root_0, tree_for_NL385 )


                else
                  break # out of loop for decision 137
                end
              end # loop for decision 137
              @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_2259 )
              set_item386 = set_item
              @state.following.pop
              @adaptor.add_child( root_0, set_item386.tree )

            else
              break # out of loop for decision 138
            end
          end # loop for decision 138

        end
        # --> action
        	return_value.val = @set	
        # <-- action
        char_literal387 = match( T__38, TOKENS_FOLLOWING_T__38_IN_set_value_2271 )

        tree_for_char_literal387 = @adaptor.create_with_payload( char_literal387 )
        @adaptor.add_child( root_0, tree_for_char_literal387 )

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

    SetItemReturnValue = define_return_scope 

    # 
    # parser rule set_item
    # 
    # (in SFP.g)
    # 809:1: set_item : value ;
    # 
    def set_item
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )
      return_value = SetItemReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      value388 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 810:4: value
        @state.following.push( TOKENS_FOLLOWING_value_IN_set_item_2282 )
        value388 = value
        @state.following.pop
        @adaptor.add_child( root_0, value388.tree )
        # --> action
        	@set.push(( value388.nil? ? nil : value388.val ))	
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
        # trace_out( __method__, 46 )

      end
      
      return return_value
    end

    ValueReturnValue = define_return_scope :val, :type

    # 
    # parser rule value
    # 
    # (in SFP.g)
    # 814:1: value returns [val, type] : ( primitive_value | reference | set_value );
    # 
    def value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 47 )
      return_value = ValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      primitive_value389 = nil
      reference390 = nil
      set_value391 = nil


      begin
        # at line 815:2: ( primitive_value | reference | set_value )
        alt_140 = 3
        case look_140 = @input.peek( 1 )
        when STRING, NUMBER, BOOLEAN, MULTILINE_STRING then alt_140 = 1
        when ID then alt_140 = 2
        when T__36 then alt_140 = 3
        else
          raise NoViableAlternative( "", 140, 0 )
        end
        case alt_140
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 815:4: primitive_value
          @state.following.push( TOKENS_FOLLOWING_primitive_value_IN_value_2301 )
          primitive_value389 = primitive_value
          @state.following.pop
          @adaptor.add_child( root_0, primitive_value389.tree )
          # --> action

          			return_value.val = ( primitive_value389.nil? ? nil : primitive_value389.val )
          			return_value.type = ( primitive_value389.nil? ? nil : primitive_value389.type )
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 820:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_value_2310 )
          reference390 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference390.tree )
          # --> action

          			return_value.val = ( reference390.nil? ? nil : reference390.val )
          			return_value.type = 'Reference'
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 825:4: set_value
          @state.following.push( TOKENS_FOLLOWING_set_value_IN_value_2319 )
          set_value391 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value391.tree )
          # --> action

          			return_value.val = ( set_value391.nil? ? nil : set_value391.val )
          			return_value.type = 'Set'
          		
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

    PrimitiveValueReturnValue = define_return_scope :val, :type

    # 
    # parser rule primitive_value
    # 
    # (in SFP.g)
    # 832:1: primitive_value returns [val, type] : ( BOOLEAN | NUMBER | STRING | MULTILINE_STRING );
    # 
    def primitive_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 48 )
      return_value = PrimitiveValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __BOOLEAN392__ = nil
      __NUMBER393__ = nil
      __STRING394__ = nil
      __MULTILINE_STRING395__ = nil

      tree_for_BOOLEAN392 = nil
      tree_for_NUMBER393 = nil
      tree_for_STRING394 = nil
      tree_for_MULTILINE_STRING395 = nil

      begin
        # at line 833:2: ( BOOLEAN | NUMBER | STRING | MULTILINE_STRING )
        alt_141 = 4
        case look_141 = @input.peek( 1 )
        when BOOLEAN then alt_141 = 1
        when NUMBER then alt_141 = 2
        when STRING then alt_141 = 3
        when MULTILINE_STRING then alt_141 = 4
        else
          raise NoViableAlternative( "", 141, 0 )
        end
        case alt_141
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 833:4: BOOLEAN
          __BOOLEAN392__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_2338 )

          tree_for_BOOLEAN392 = @adaptor.create_with_payload( __BOOLEAN392__ )
          @adaptor.add_child( root_0, tree_for_BOOLEAN392 )

          # --> action

          			if __BOOLEAN392__.text == 'true' or __BOOLEAN392__.text == 'on' or __BOOLEAN392__.text == 'yes'
          				return_value.val = true
          			else  # 'false', 'no', 'off'
          				return_value.val = false
          			end
          			return_value.type = 'Boolean'
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 842:4: NUMBER
          __NUMBER393__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_primitive_value_2347 )

          tree_for_NUMBER393 = @adaptor.create_with_payload( __NUMBER393__ )
          @adaptor.add_child( root_0, tree_for_NUMBER393 )

          # --> action

          			return_value.val = __NUMBER393__.text.to_i
          			return_value.type = 'Number'
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 847:4: STRING
          __STRING394__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_primitive_value_2356 )

          tree_for_STRING394 = @adaptor.create_with_payload( __STRING394__ )
          @adaptor.add_child( root_0, tree_for_STRING394 )

          # --> action

          			return_value.val = __STRING394__.text[1,__STRING394__.text.length-2]
          			return_value.type = 'String'
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 852:4: MULTILINE_STRING
          __MULTILINE_STRING395__ = match( MULTILINE_STRING, TOKENS_FOLLOWING_MULTILINE_STRING_IN_primitive_value_2365 )

          tree_for_MULTILINE_STRING395 = @adaptor.create_with_payload( __MULTILINE_STRING395__ )
          @adaptor.add_child( root_0, tree_for_MULTILINE_STRING395 )

          # --> action

          			return_value.val = __MULTILINE_STRING395__.text[2, __MULTILINE_STRING395__.text.length-2]
          			return_value.type = 'String'
          		
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
        # trace_out( __method__, 48 )

      end
      
      return return_value
    end

    PathReturnValue = define_return_scope 

    # 
    # parser rule path
    # 
    # (in SFP.g)
    # 859:1: path : ID ( '.' ID )* ;
    # 
    def path
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 49 )
      return_value = PathReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID396__ = nil
      char_literal397 = nil
      __ID398__ = nil

      tree_for_ID396 = nil
      tree_for_char_literal397 = nil
      tree_for_ID398 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 860:4: ID ( '.' ID )*
        __ID396__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_2380 )

        tree_for_ID396 = @adaptor.create_with_payload( __ID396__ )
        @adaptor.add_child( root_0, tree_for_ID396 )

        # at line 860:6: ( '.' ID )*
        while true # decision 142
          alt_142 = 2
          look_142_0 = @input.peek( 1 )

          if ( look_142_0 == T__64 )
            alt_142 = 1

          end
          case alt_142
          when 1
            # at line 860:7: '.' ID
            char_literal397 = match( T__64, TOKENS_FOLLOWING_T__64_IN_path_2382 )

            tree_for_char_literal397 = @adaptor.create_with_payload( char_literal397 )
            @adaptor.add_child( root_0, tree_for_char_literal397 )

            __ID398__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_2383 )

            tree_for_ID398 = @adaptor.create_with_payload( __ID398__ )
            @adaptor.add_child( root_0, tree_for_ID398 )


          else
            break # out of loop for decision 142
          end
        end # loop for decision 142
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

    PathWithIndexReturnValue = define_return_scope 

    # 
    # parser rule path_with_index
    # 
    # (in SFP.g)
    # 863:1: path_with_index : id_ref ( '.' id_ref )* ;
    # 
    def path_with_index
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 50 )
      return_value = PathWithIndexReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal400 = nil
      id_ref399 = nil
      id_ref401 = nil

      tree_for_char_literal400 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 864:4: id_ref ( '.' id_ref )*
        @state.following.push( TOKENS_FOLLOWING_id_ref_IN_path_with_index_2396 )
        id_ref399 = id_ref
        @state.following.pop
        @adaptor.add_child( root_0, id_ref399.tree )
        # at line 864:10: ( '.' id_ref )*
        while true # decision 143
          alt_143 = 2
          look_143_0 = @input.peek( 1 )

          if ( look_143_0 == T__64 )
            alt_143 = 1

          end
          case alt_143
          when 1
            # at line 864:11: '.' id_ref
            char_literal400 = match( T__64, TOKENS_FOLLOWING_T__64_IN_path_with_index_2398 )

            tree_for_char_literal400 = @adaptor.create_with_payload( char_literal400 )
            @adaptor.add_child( root_0, tree_for_char_literal400 )

            @state.following.push( TOKENS_FOLLOWING_id_ref_IN_path_with_index_2399 )
            id_ref401 = id_ref
            @state.following.pop
            @adaptor.add_child( root_0, id_ref401.tree )

          else
            break # out of loop for decision 143
          end
        end # loop for decision 143
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

    IdRefReturnValue = define_return_scope 

    # 
    # parser rule id_ref
    # 
    # (in SFP.g)
    # 867:1: id_ref : ID ( '[' NUMBER ']' )? ;
    # 
    def id_ref
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 51 )
      return_value = IdRefReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID402__ = nil
      char_literal403 = nil
      __NUMBER404__ = nil
      char_literal405 = nil

      tree_for_ID402 = nil
      tree_for_char_literal403 = nil
      tree_for_NUMBER404 = nil
      tree_for_char_literal405 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 868:4: ID ( '[' NUMBER ']' )?
        __ID402__ = match( ID, TOKENS_FOLLOWING_ID_IN_id_ref_2412 )

        tree_for_ID402 = @adaptor.create_with_payload( __ID402__ )
        @adaptor.add_child( root_0, tree_for_ID402 )

        # at line 868:6: ( '[' NUMBER ']' )?
        alt_144 = 2
        look_144_0 = @input.peek( 1 )

        if ( look_144_0 == T__26 )
          alt_144 = 1
        end
        case alt_144
        when 1
          # at line 868:7: '[' NUMBER ']'
          char_literal403 = match( T__26, TOKENS_FOLLOWING_T__26_IN_id_ref_2414 )

          tree_for_char_literal403 = @adaptor.create_with_payload( char_literal403 )
          @adaptor.add_child( root_0, tree_for_char_literal403 )

          __NUMBER404__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_id_ref_2416 )

          tree_for_NUMBER404 = @adaptor.create_with_payload( __NUMBER404__ )
          @adaptor.add_child( root_0, tree_for_NUMBER404 )

          char_literal405 = match( T__27, TOKENS_FOLLOWING_T__27_IN_id_ref_2418 )

          tree_for_char_literal405 = @adaptor.create_with_payload( char_literal405 )
          @adaptor.add_child( root_0, tree_for_char_literal405 )


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
        # trace_out( __method__, 51 )

      end
      
      return return_value
    end

    ReferenceReturnValue = define_return_scope :val

    # 
    # parser rule reference
    # 
    # (in SFP.g)
    # 871:1: reference returns [val] : path_with_index ;
    # 
    def reference
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 52 )
      return_value = ReferenceReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      path_with_index406 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 872:4: path_with_index
        @state.following.push( TOKENS_FOLLOWING_path_with_index_IN_reference_2435 )
        path_with_index406 = path_with_index
        @state.following.pop
        @adaptor.add_child( root_0, path_with_index406.tree )
        # --> action
        	return_value.val = self.to_ref(( path_with_index406 && @input.to_s( path_with_index406.start, path_with_index406.stop ) ))	
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

    ReferenceTypeReturnValue = define_return_scope :val

    # 
    # parser rule reference_type
    # 
    # (in SFP.g)
    # 876:1: reference_type returns [val] : 'isref' path ;
    # 
    def reference_type
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 53 )
      return_value = ReferenceTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal407 = nil
      path408 = nil

      tree_for_string_literal407 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 877:4: 'isref' path
        string_literal407 = match( T__65, TOKENS_FOLLOWING_T__65_IN_reference_type_2454 )

        tree_for_string_literal407 = @adaptor.create_with_payload( string_literal407 )
        @adaptor.add_child( root_0, tree_for_string_literal407 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_reference_type_2456 )
        path408 = path
        @state.following.pop
        @adaptor.add_child( root_0, path408.tree )
        # --> action

        			return_value.val = { '_context' => 'null',
        				'_isa' => self.to_ref(( path408 && @input.to_s( path408.start, path408.stop ) ))
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
        # trace_out( __method__, 53 )

      end
      
      return return_value
    end

    SetTypeReturnValue = define_return_scope :val

    # 
    # parser rule set_type
    # 
    # (in SFP.g)
    # 885:1: set_type returns [val] : 'isset' path ;
    # 
    def set_type
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 54 )
      return_value = SetTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal409 = nil
      path410 = nil

      tree_for_string_literal409 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 886:4: 'isset' path
        string_literal409 = match( T__40, TOKENS_FOLLOWING_T__40_IN_set_type_2475 )

        tree_for_string_literal409 = @adaptor.create_with_payload( string_literal409 )
        @adaptor.add_child( root_0, tree_for_string_literal409 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_set_type_2477 )
        path410 = path
        @state.following.pop
        @adaptor.add_child( root_0, path410.tree )
        # --> action

        			return_value.val = { '_context' => 'set',
        				'_isa' => self.to_ref(( path410 && @input.to_s( path410.start, path410.stop ) )),
        				'_values' => []
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
        # trace_out( __method__, 54 )

      end
      
      return return_value
    end

    ProbabilityOpReturnValue = define_return_scope 

    # 
    # parser rule probability_op
    # 
    # (in SFP.g)
    # 895:1: probability_op : 'either' ;
    # 
    def probability_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 55 )
      return_value = ProbabilityOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal411 = nil

      tree_for_string_literal411 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 896:4: 'either'
        string_literal411 = match( T__66, TOKENS_FOLLOWING_T__66_IN_probability_op_2492 )

        tree_for_string_literal411 = @adaptor.create_with_payload( string_literal411 )
        @adaptor.add_child( root_0, tree_for_string_literal411 )

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

    EqualsOpReturnValue = define_return_scope 

    # 
    # parser rule equals_op
    # 
    # (in SFP.g)
    # 899:1: equals_op : ( '=' | 'is' );
    # 
    def equals_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 56 )
      return_value = EqualsOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set412 = nil

      tree_for_set412 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set412 = @input.look
        if @input.peek(1) == T__53 || @input.peek(1) == T__56
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set412 ) )
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

    NotEqualsOpReturnValue = define_return_scope 

    # 
    # parser rule not_equals_op
    # 
    # (in SFP.g)
    # 904:1: not_equals_op : ( '!=' | 'isnt' );
    # 
    def not_equals_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 57 )
      return_value = NotEqualsOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set413 = nil

      tree_for_set413 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set413 = @input.look
        if @input.peek(1) == T__58 || @input.peek(1) == T__67
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set413 ) )
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
        # trace_out( __method__, 57 )

      end
      
      return return_value
    end

    BinaryOpReturnValue = define_return_scope 

    # 
    # parser rule binary_op
    # 
    # (in SFP.g)
    # 909:1: binary_op : ( '+=' | '-=' | '*=' | '/=' );
    # 
    def binary_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 58 )
      return_value = BinaryOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set414 = nil

      tree_for_set414 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set414 = @input.look
        if @input.peek( 1 ).between?( T__68, T__71 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set414 ) )
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
        # trace_out( __method__, 58 )

      end
      
      return return_value
    end

    BinaryCompReturnValue = define_return_scope 

    # 
    # parser rule binary_comp
    # 
    # (in SFP.g)
    # 916:1: binary_comp : ( '>' | '>=' | '<' | '<=' );
    # 
    def binary_comp
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 59 )
      return_value = BinaryCompReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set415 = nil

      tree_for_set415 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set415 = @input.look
        if @input.peek( 1 ).between?( T__72, T__75 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set415 ) )
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
        # trace_out( __method__, 59 )

      end
      
      return return_value
    end



    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA38 < ANTLR3::DFA
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
      
      @decision = 38
      

      def description
        <<-'__dfa_description__'.strip!
          ()* loopback of 194:3: ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )*
        __dfa_description__
      end
    end
    class DFA72 < ANTLR3::DFA
      EOT = unpack( 9, -1 )
      EOF = unpack( 9, -1 )
      MIN = unpack( 1, 6, 1, 4, 3, -1, 1, 6, 1, 4, 1, -1, 1, 4 )
      MAX = unpack( 1, 59, 1, 75, 3, -1, 1, 6, 1, 59, 1, -1, 1, 75 )
      ACCEPT = unpack( 2, -1, 1, 1, 1, 3, 1, 4, 2, -1, 1, 2, 1, -1 )
      SPECIAL = unpack( 9, -1 )
      TRANSITION = [
        unpack( 1, 1, 21, -1, 1, 2, 19, -1, 1, 3, 1, -1, 3, 4, 2, -1, 1, 
                2, 3, -1, 1, 2 ),
        unpack( 1, 6, 15, -1, 1, 7, 5, -1, 1, 2, 26, -1, 1, 2, 1, -1, 4, 
                 2, 5, -1, 1, 5, 2, -1, 1, 2, 4, -1, 4, 2 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 8 ),
        unpack( 1, 6, 1, -1, 1, 2, 13, -1, 1, 7, 1, 2, 6, -1, 1, 2, 14, 
                 -1, 6, 2, 1, -1, 3, 2, 2, -1, 1, 2, 3, -1, 1, 2 ),
        unpack(  ),
        unpack( 1, 6, 15, -1, 1, 7, 5, -1, 1, 2, 26, -1, 1, 2, 1, -1, 4, 
                 2, 5, -1, 1, 5, 2, -1, 1, 2, 4, -1, 4, 2 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 72
      

      def description
        <<-'__dfa_description__'.strip!
          343:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification )
        __dfa_description__
      end
    end
    class DFA100 < ANTLR3::DFA
      EOT = unpack( 9, -1 )
      EOF = unpack( 9, -1 )
      MIN = unpack( 1, 6, 1, 4, 3, -1, 1, 6, 1, 4, 1, -1, 1, 4 )
      MAX = unpack( 1, 59, 1, 75, 3, -1, 1, 6, 1, 59, 1, -1, 1, 75 )
      ACCEPT = unpack( 2, -1, 1, 1, 1, 3, 1, 4, 2, -1, 1, 2, 1, -1 )
      SPECIAL = unpack( 9, -1 )
      TRANSITION = [
        unpack( 1, 1, 21, -1, 1, 2, 19, -1, 1, 3, 1, -1, 3, 4, 2, -1, 1, 
                2, 3, -1, 1, 2 ),
        unpack( 1, 6, 15, -1, 1, 7, 5, -1, 1, 2, 26, -1, 1, 2, 1, -1, 4, 
                 2, 5, -1, 1, 5, 2, -1, 1, 2, 4, -1, 4, 2 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 8 ),
        unpack( 1, 6, 1, -1, 1, 2, 13, -1, 1, 7, 1, 2, 6, -1, 1, 2, 19, 
                 -1, 1, 2, 1, -1, 3, 2, 2, -1, 1, 2, 3, -1, 1, 2 ),
        unpack(  ),
        unpack( 1, 6, 15, -1, 1, 7, 5, -1, 1, 2, 26, -1, 1, 2, 1, -1, 4, 
                 2, 5, -1, 1, 5, 2, -1, 1, 2, 4, -1, 4, 2 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 100
      

      def description
        <<-'__dfa_description__'.strip!
          448:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification )
        __dfa_description__
      end
    end
    class DFA120 < ANTLR3::DFA
      EOT = unpack( 25, -1 )
      EOF = unpack( 25, -1 )
      MIN = unpack( 1, 6, 1, 4, 3, -1, 1, 7, 1, 6, 1, -1, 3, 5, 1, -1, 1, 
                    5, 2, -1, 1, 27, 1, 4, 4, -1, 1, 4, 1, 7, 1, 27, 1, 
                    4 )
      MAX = unpack( 1, 59, 1, 75, 3, -1, 1, 7, 1, 6, 1, -1, 2, 57, 1, 36, 
                    1, -1, 1, 36, 2, -1, 1, 27, 1, 75, 4, -1, 1, 75, 1, 
                    7, 1, 27, 1, 75 )
      ACCEPT = unpack( 2, -1, 1, 2, 1, 7, 1, 11, 2, -1, 1, 1, 3, -1, 1, 
                       8, 1, -1, 1, 9, 1, 10, 2, -1, 1, 3, 1, 4, 1, 5, 1, 
                       6, 4, -1 )
      SPECIAL = unpack( 25, -1 )
      TRANSITION = [
        unpack( 1, 1, 21, -1, 1, 3, 26, -1, 1, 2, 3, -1, 1, 4 ),
        unpack( 1, 7, 21, -1, 1, 5, 2, -1, 1, 7, 23, -1, 1, 10, 1, -1, 
                 1, 13, 1, 8, 1, 11, 1, 9, 5, -1, 1, 6, 2, -1, 1, 12, 4, 
                 -1, 4, 14 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 15 ),
        unpack( 1, 16 ),
        unpack(  ),
        unpack( 3, 17, 1, 18, 2, 17, 25, -1, 1, 17, 20, -1, 1, 11 ),
        unpack( 3, 19, 1, 20, 2, 19, 25, -1, 1, 19, 20, -1, 1, 13 ),
        unpack( 3, 17, 1, 18, 2, 17, 25, -1, 1, 17 ),
        unpack(  ),
        unpack( 3, 19, 1, 20, 2, 19, 25, -1, 1, 19 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 21 ),
        unpack( 1, 7, 21, -1, 1, 22, 2, -1, 1, 7, 23, -1, 1, 10, 1, -1, 
                 1, 13, 1, 8, 1, 11, 1, 9, 5, -1, 1, 6, 2, -1, 1, 12, 4, 
                 -1, 4, 14 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 7, 24, -1, 1, 7, 23, -1, 1, 10, 1, -1, 1, 13, 1, 8, 
                 1, 11, 1, 9, 5, -1, 1, 6, 2, -1, 1, 12, 4, -1, 4, 14 ),
        unpack( 1, 23 ),
        unpack( 1, 24 ),
        unpack( 1, 7, 24, -1, 1, 7, 23, -1, 1, 10, 1, -1, 1, 13, 1, 8, 
                 1, 11, 1, 9, 5, -1, 1, 6, 2, -1, 1, 12, 4, -1, 4, 14 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 120
      

      def description
        <<-'__dfa_description__'.strip!
          560:1: constraint_statement returns [key, val] : ( reference | 'not' reference | reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | conditional_constraint | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | reference binary_comp comp_value | total_constraint );
        __dfa_description__
      end
    end
    class DFA136 < ANTLR3::DFA
      EOT = unpack( 19, -1 )
      EOF = unpack( 19, -1 )
      MIN = unpack( 1, 6, 1, 26, 1, -1, 1, 7, 1, 6, 1, 5, 1, -1, 1, 5, 2, 
                    -1, 1, 27, 1, 26, 3, -1, 1, 53, 1, 7, 1, 27, 1, 53 )
      MAX = unpack( 1, 61, 1, 71, 1, -1, 1, 7, 1, 6, 1, 60, 1, -1, 1, 36, 
                    2, -1, 1, 27, 1, 71, 3, -1, 1, 71, 1, 7, 1, 27, 1, 71 )
      ACCEPT = unpack( 2, -1, 1, 5, 3, -1, 1, 3, 1, -1, 1, 6, 1, 7, 2, -1, 
                       1, 4, 1, 1, 1, 2, 4, -1 )
      SPECIAL = unpack( 19, -1 )
      TRANSITION = [
        unpack( 1, 1, 54, -1, 1, 2 ),
        unpack( 1, 3, 26, -1, 1, 7, 2, -1, 1, 5, 5, -1, 1, 8, 1, 9, 1, 
                 4, 3, -1, 4, 6 ),
        unpack(  ),
        unpack( 1, 10 ),
        unpack( 1, 11 ),
        unpack( 3, 13, 1, 14, 2, 13, 25, -1, 1, 13, 23, -1, 1, 12 ),
        unpack(  ),
        unpack( 3, 13, 1, 14, 2, 13, 25, -1, 1, 13 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 15 ),
        unpack( 1, 16, 26, -1, 1, 7, 2, -1, 1, 5, 5, -1, 1, 8, 1, 9, 1, 
                 4, 3, -1, 4, 6 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 7, 2, -1, 1, 5, 5, -1, 1, 8, 1, 9, 1, 4, 3, -1, 4, 6 ),
        unpack( 1, 17 ),
        unpack( 1, 18 ),
        unpack( 1, 7, 2, -1, 1, 5, 5, -1, 1, 8, 1, 9, 1, 4, 3, -1, 4, 6 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 136
      

      def description
        <<-'__dfa_description__'.strip!
          732:1: mutation_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' );
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa38 = DFA38.new( self, 38 )
      @dfa72 = DFA72.new( self, 72 )
      @dfa100 = DFA100.new( self, 100 )
      @dfa120 = DFA120.new( self, 120 )
      @dfa136 = DFA136.new( self, 136 )

    end
    TOKENS_FOLLOWING_NL_IN_sfp_49 = Set[ 1, 4, 6, 18, 22, 23, 35, 41 ]
    TOKENS_FOLLOWING_include_IN_sfp_52 = Set[ 1, 6, 18, 22, 23, 35, 41 ]
    TOKENS_FOLLOWING_header_IN_sfp_55 = Set[ 1, 6, 22, 23, 35, 41 ]
    TOKENS_FOLLOWING_state_IN_sfp_65 = Set[ 1, 6, 22, 41 ]
    TOKENS_FOLLOWING_composite_IN_sfp_69 = Set[ 1, 6, 22, 41 ]
    TOKENS_FOLLOWING_constraint_IN_sfp_73 = Set[ 1, 6, 22, 41 ]
    TOKENS_FOLLOWING_goal_constraint_IN_sfp_77 = Set[ 1, 6, 22, 41 ]
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
    TOKENS_FOLLOWING_ID_IN_attribute_308 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_attribute_310 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_attribute_312 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_314 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_attribute_324 = Set[ 65 ]
    TOKENS_FOLLOWING_reference_type_IN_attribute_326 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_328 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_attribute_338 = Set[ 40 ]
    TOKENS_FOLLOWING_set_type_IN_attribute_340 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_342 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_attribute_352 = Set[ 66 ]
    TOKENS_FOLLOWING_probability_op_IN_attribute_354 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_set_value_IN_attribute_356 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_358 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_object_def_IN_attribute_368 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_370 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_object_def_382 = Set[ 1, 20, 25 ]
    TOKENS_FOLLOWING_T__25_IN_object_def_391 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_object_def_393 = Set[ 1, 20, 26 ]
    TOKENS_FOLLOWING_T__26_IN_object_def_395 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_object_def_397 = Set[ 27 ]
    TOKENS_FOLLOWING_T__27_IN_object_def_401 = Set[ 1, 20 ]
    TOKENS_FOLLOWING_object_body_IN_object_def_416 = Set[ 1 ]
    TOKENS_FOLLOWING_T__20_IN_object_body_432 = Set[ 4, 6, 21, 28, 31 ]
    TOKENS_FOLLOWING_NL_IN_object_body_434 = Set[ 4, 6, 21, 28, 31 ]
    TOKENS_FOLLOWING_object_attribute_IN_object_body_439 = Set[ 6, 21, 28, 31 ]
    TOKENS_FOLLOWING_state_dependency_IN_object_body_443 = Set[ 6, 21, 28, 31 ]
    TOKENS_FOLLOWING_operator_IN_object_body_447 = Set[ 6, 21, 28, 31 ]
    TOKENS_FOLLOWING_T__21_IN_object_body_452 = Set[ 1 ]
    TOKENS_FOLLOWING_attribute_IN_object_attribute_463 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_object_attribute_468 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_object_attribute_470 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_object_attribute_472 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_object_attribute_474 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__28_IN_state_dependency_490 = Set[ 6 ]
    TOKENS_FOLLOWING_dep_effect_IN_state_dependency_494 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_496 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_T__29_IN_state_dependency_499 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_501 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_dependency_504 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_508 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_state_dependency_511 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_dependency_516 = Set[ 4, 30 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_522 = Set[ 4, 30 ]
    TOKENS_FOLLOWING_T__30_IN_state_dependency_525 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_527 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_dependency_530 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_534 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_state_dependency_537 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_dependency_541 = Set[ 4, 30 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_547 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_reference_IN_dep_effect_559 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_dep_effect_561 = Set[ 5, 6, 7, 8, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_dep_effect_568 = Set[ 1 ]
    TOKENS_FOLLOWING_NULL_IN_dep_effect_574 = Set[ 1 ]
    TOKENS_FOLLOWING_T__31_IN_operator_590 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_operator_592 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_operator_594 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_NL_IN_operator_596 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_T__32_IN_operator_607 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_operator_609 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_operator_611 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_operator_613 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_op_conditions_IN_operator_632 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_op_effects_IN_operator_635 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_operator_639 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_operator_641 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_op_param_657 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_op_param_659 = Set[ 6 ]
    TOKENS_FOLLOWING_reference_IN_op_param_661 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_param_663 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__33_IN_op_conditions_679 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_op_conditions_681 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_NL_IN_op_conditions_683 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_op_statement_IN_op_conditions_692 = Set[ 6, 21 ]
    TOKENS_FOLLOWING_T__21_IN_op_conditions_697 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_conditions_699 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__34_IN_op_effects_715 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_op_effects_717 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_NL_IN_op_effects_719 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_op_statement_IN_op_effects_728 = Set[ 6, 21 ]
    TOKENS_FOLLOWING_T__21_IN_op_effects_733 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_effects_735 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_reference_IN_op_statement_751 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_op_statement_753 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_op_statement_755 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_statement_757 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__35_IN_procedure_773 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_procedure_775 = Set[ 20, 36 ]
    TOKENS_FOLLOWING_parameters_IN_procedure_783 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_procedure_786 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_NL_IN_procedure_788 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_T__32_IN_procedure_796 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_procedure_798 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_procedure_800 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_procedure_810 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_conditions_IN_procedure_820 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_effects_IN_procedure_823 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_procedure_825 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_procedure_827 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__36_IN_parameters_843 = Set[ 6 ]
    TOKENS_FOLLOWING_parameter_IN_parameters_845 = Set[ 37, 38 ]
    TOKENS_FOLLOWING_T__37_IN_parameters_848 = Set[ 4, 6 ]
    TOKENS_FOLLOWING_NL_IN_parameters_850 = Set[ 4, 6 ]
    TOKENS_FOLLOWING_parameter_IN_parameters_853 = Set[ 37, 38 ]
    TOKENS_FOLLOWING_T__38_IN_parameters_857 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_869 = Set[ 65 ]
    TOKENS_FOLLOWING_reference_type_IN_parameter_871 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_880 = Set[ 39 ]
    TOKENS_FOLLOWING_T__39_IN_parameter_882 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_parameter_884 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_893 = Set[ 40 ]
    TOKENS_FOLLOWING_T__40_IN_parameter_895 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_parameter_897 = Set[ 1 ]
    TOKENS_FOLLOWING_T__33_IN_conditions_912 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_conditions_920 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_conditions_922 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_conditions_925 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_conditions_927 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_conditions_929 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__34_IN_effects_946 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_effects_954 = Set[ 4, 6, 21, 48, 61 ]
    TOKENS_FOLLOWING_NL_IN_effects_956 = Set[ 4, 6, 21, 48, 61 ]
    TOKENS_FOLLOWING_mutation_body_IN_effects_962 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_effects_967 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_effects_969 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__41_IN_goal_constraint_985 = Set[ 4, 20, 42 ]
    TOKENS_FOLLOWING_T__42_IN_goal_constraint_987 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_constraint_990 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_constraint_999 = Set[ 4, 6, 21, 28, 43, 44, 45, 46, 47, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_constraint_1001 = Set[ 4, 6, 21, 28, 43, 44, 45, 46, 47, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_goal_body_IN_goal_constraint_1004 = Set[ 6, 21, 28, 43, 44, 45, 46, 47, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_T__21_IN_goal_constraint_1007 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_constraint_1009 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_constraint_statement_IN_goal_body_1032 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_namespace_IN_goal_body_1045 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_iterator_IN_goal_body_1052 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_class_quantification_IN_goal_body_1059 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1068 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__43_IN_goal_body_1075 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1077 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1086 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1088 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1091 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1093 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1095 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__44_IN_goal_body_1105 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1107 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1116 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1118 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1121 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1123 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1125 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__45_IN_goal_body_1139 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_goal_body_1141 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1143 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1152 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1154 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1157 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1159 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1161 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__46_IN_goal_body_1171 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1173 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1182 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1184 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1187 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1189 = Set[ 4, 29, 45 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1191 = Set[ 4, 29, 45 ]
    TOKENS_FOLLOWING_T__29_IN_goal_body_1202 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__45_IN_goal_body_1209 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_goal_body_1211 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1223 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1232 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1234 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1237 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1239 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1241 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__47_IN_goal_body_1259 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1261 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1270 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1272 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1275 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1277 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1279 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_T__29_IN_goal_body_1288 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1290 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1299 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1301 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1304 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1306 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1308 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__20_IN_nested_constraint_1328 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_nested_constraint_1330 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_nested_constraint_1333 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_nested_constraint_1335 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_constraint_1346 = Set[ 42 ]
    TOKENS_FOLLOWING_T__42_IN_constraint_1348 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_1356 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_constraint_1358 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_constraint_1361 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_1363 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_1365 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_1388 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_namespace_IN_constraint_body_1401 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_iterator_IN_constraint_body_1408 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_class_quantification_IN_constraint_body_1415 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_body_1424 = Set[ 1, 4, 6, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_path_IN_constraint_namespace_1438 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1440 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_namespace_1443 = Set[ 4, 6, 21, 28, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1445 = Set[ 4, 6, 21, 28, 55, 59 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_namespace_1449 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1457 = Set[ 4, 6, 21, 28, 55, 59 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_namespace_1462 = Set[ 1 ]
    TOKENS_FOLLOWING_T__48_IN_constraint_iterator_1473 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_constraint_iterator_1475 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_constraint_iterator_1477 = Set[ 49 ]
    TOKENS_FOLLOWING_T__49_IN_constraint_iterator_1479 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_constraint_iterator_1481 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_constraint_iterator_1483 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1485 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_iterator_1488 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1490 = Set[ 4, 6, 21, 28, 55, 59 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_iterator_1500 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1508 = Set[ 4, 6, 21, 28, 55, 59 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_iterator_1515 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_quantification_keyword_0 = Set[ 1 ]
    TOKENS_FOLLOWING_quantification_keyword_IN_constraint_class_quantification_1551 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_constraint_class_quantification_1553 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_constraint_class_quantification_1555 = Set[ 49 ]
    TOKENS_FOLLOWING_T__49_IN_constraint_class_quantification_1557 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_constraint_class_quantification_1559 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_constraint_class_quantification_1561 = Set[ 4, 20, 53, 72, 73, 74, 75 ]
    TOKENS_FOLLOWING_binary_comp_IN_constraint_class_quantification_1573 = Set[ 7 ]
    TOKENS_FOLLOWING_T__53_IN_constraint_class_quantification_1586 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_constraint_class_quantification_1602 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1616 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_class_quantification_1619 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1621 = Set[ 4, 6, 21, 28, 48, 54, 55, 59 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_class_quantification_1628 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1638 = Set[ 4, 6, 21, 28, 48, 54, 55, 59 ]
    TOKENS_FOLLOWING_constraint_different_IN_constraint_class_quantification_1645 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1647 = Set[ 4, 6, 21, 28, 48, 54, 55, 59 ]
    TOKENS_FOLLOWING_constraint_iterator_IN_constraint_class_quantification_1654 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1656 = Set[ 4, 6, 21, 28, 48, 54, 55, 59 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_class_quantification_1664 = Set[ 1 ]
    TOKENS_FOLLOWING_T__54_IN_constraint_different_1683 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_constraint_different_1685 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_constraint_different_1687 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_constraint_different_1689 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1708 = Set[ 1 ]
    TOKENS_FOLLOWING_T__55_IN_constraint_statement_1717 = Set[ 6 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1719 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1728 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1730 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_1732 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1741 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1743 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_1745 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1754 = Set[ 58, 67 ]
    TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1756 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_1758 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1767 = Set[ 58, 67 ]
    TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1769 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_1771 = Set[ 1 ]
    TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_1780 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1789 = Set[ 56, 57 ]
    TOKENS_FOLLOWING_T__56_IN_constraint_statement_1791 = Set[ 57 ]
    TOKENS_FOLLOWING_T__57_IN_constraint_statement_1794 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_1796 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1805 = Set[ 55, 58 ]
    TOKENS_FOLLOWING_set_IN_constraint_statement_1807 = Set[ 57 ]
    TOKENS_FOLLOWING_T__57_IN_constraint_statement_1813 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_1815 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1824 = Set[ 72, 73, 74, 75 ]
    TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_1826 = Set[ 6, 7 ]
    TOKENS_FOLLOWING_comp_value_IN_constraint_statement_1828 = Set[ 1 ]
    TOKENS_FOLLOWING_total_constraint_IN_constraint_statement_1837 = Set[ 1 ]
    TOKENS_FOLLOWING_T__59_IN_total_constraint_1848 = Set[ 6 ]
    TOKENS_FOLLOWING_total_statement_IN_total_constraint_1850 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_total_constraint_1852 = Set[ 72, 73, 74, 75 ]
    TOKENS_FOLLOWING_binary_comp_IN_total_constraint_1854 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_total_constraint_1856 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_total_statement_1867 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_total_statement_1869 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_total_statement_1871 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_comp_value_1886 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_comp_value_1895 = Set[ 1 ]
    TOKENS_FOLLOWING_T__28_IN_conditional_constraint_1914 = Set[ 6, 20, 28, 55, 59 ]
    TOKENS_FOLLOWING_conditional_constraint_if_part_IN_conditional_constraint_1922 = Set[ 29 ]
    TOKENS_FOLLOWING_conditional_constraint_then_part_IN_conditional_constraint_1926 = Set[ 1 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_if_part_1941 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_conditional_constraint_if_part_1943 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__20_IN_conditional_constraint_if_part_1953 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_conditional_constraint_if_part_1961 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_conditional_constraint_if_part_1964 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_conditional_constraint_if_part_1968 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_conditional_constraint_if_part_1970 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__29_IN_conditional_constraint_then_part_1986 = Set[ 6, 28, 55, 59 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_part_1988 = Set[ 1 ]
    TOKENS_FOLLOWING_T__29_IN_conditional_constraint_then_part_1997 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_conditional_constraint_then_part_2005 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_conditional_constraint_then_part_2007 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_conditional_constraint_then_part_2010 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_conditional_constraint_then_part_2012 = Set[ 1 ]
    TOKENS_FOLLOWING_mutation_statement_IN_mutation_body_2034 = Set[ 4 ]
    TOKENS_FOLLOWING_mutation_iterator_IN_mutation_body_2047 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_body_2056 = Set[ 1, 4, 6, 48, 61 ]
    TOKENS_FOLLOWING_T__48_IN_mutation_iterator_2071 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_iterator_2073 = Set[ 49 ]
    TOKENS_FOLLOWING_T__49_IN_mutation_iterator_2075 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_mutation_iterator_2077 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_2079 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_mutation_iterator_2082 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_2084 = Set[ 4, 6, 21, 61 ]
    TOKENS_FOLLOWING_mutation_statement_IN_mutation_iterator_2094 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_2102 = Set[ 4, 6, 21, 61 ]
    TOKENS_FOLLOWING_T__21_IN_mutation_iterator_2109 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2128 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_mutation_statement_2130 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_2132 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2141 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_mutation_statement_2143 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_mutation_statement_2145 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2154 = Set[ 68, 69, 70, 71 ]
    TOKENS_FOLLOWING_binary_op_IN_mutation_statement_2156 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_mutation_statement_2158 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2167 = Set[ 56 ]
    TOKENS_FOLLOWING_T__56_IN_mutation_statement_2169 = Set[ 60 ]
    TOKENS_FOLLOWING_T__60_IN_mutation_statement_2171 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_statement_2173 = Set[ 1, 20 ]
    TOKENS_FOLLOWING_object_body_IN_mutation_statement_2181 = Set[ 1 ]
    TOKENS_FOLLOWING_T__61_IN_mutation_statement_2191 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_statement_2193 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2202 = Set[ 62 ]
    TOKENS_FOLLOWING_T__62_IN_mutation_statement_2204 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_2206 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_mutation_statement_2208 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2217 = Set[ 63 ]
    TOKENS_FOLLOWING_T__63_IN_mutation_statement_2219 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_2221 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_mutation_statement_2223 = Set[ 1 ]
    TOKENS_FOLLOWING_T__36_IN_set_value_2242 = Set[ 5, 6, 7, 9, 10, 36, 38 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_2251 = Set[ 37, 38 ]
    TOKENS_FOLLOWING_T__37_IN_set_value_2254 = Set[ 4, 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_NL_IN_set_value_2256 = Set[ 4, 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_2259 = Set[ 37, 38 ]
    TOKENS_FOLLOWING_T__38_IN_set_value_2271 = Set[ 1 ]
    TOKENS_FOLLOWING_value_IN_set_item_2282 = Set[ 1 ]
    TOKENS_FOLLOWING_primitive_value_IN_value_2301 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_value_2310 = Set[ 1 ]
    TOKENS_FOLLOWING_set_value_IN_value_2319 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_2338 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_primitive_value_2347 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_primitive_value_2356 = Set[ 1 ]
    TOKENS_FOLLOWING_MULTILINE_STRING_IN_primitive_value_2365 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_path_2380 = Set[ 1, 64 ]
    TOKENS_FOLLOWING_T__64_IN_path_2382 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_path_2383 = Set[ 1, 64 ]
    TOKENS_FOLLOWING_id_ref_IN_path_with_index_2396 = Set[ 1, 64 ]
    TOKENS_FOLLOWING_T__64_IN_path_with_index_2398 = Set[ 6 ]
    TOKENS_FOLLOWING_id_ref_IN_path_with_index_2399 = Set[ 1, 64 ]
    TOKENS_FOLLOWING_ID_IN_id_ref_2412 = Set[ 1, 26 ]
    TOKENS_FOLLOWING_T__26_IN_id_ref_2414 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_id_ref_2416 = Set[ 27 ]
    TOKENS_FOLLOWING_T__27_IN_id_ref_2418 = Set[ 1 ]
    TOKENS_FOLLOWING_path_with_index_IN_reference_2435 = Set[ 1 ]
    TOKENS_FOLLOWING_T__65_IN_reference_type_2454 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_reference_type_2456 = Set[ 1 ]
    TOKENS_FOLLOWING_T__40_IN_set_type_2475 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_set_type_2477 = Set[ 1 ]
    TOKENS_FOLLOWING_T__66_IN_probability_op_2492 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_not_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_comp_0 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end

