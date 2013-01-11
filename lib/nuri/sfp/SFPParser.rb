#!/usr/bin/env ruby
#
# SFP.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: SFP.g
# Generated at: 2013-01-11 02:35:47
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
                   :T__39 => 39, :T__74 => 74, :T__73 => 73, :STRING => 5 )

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
                    "'cost'", "'condition'", "'effect'", "'procedure'", 
                    "'('", "','", "')'", "'areall'", "'isset'", "'goal'", 
                    "'constraint'", "'always'", "'sometime'", "'within'", 
                    "'after'", "'before'", "'foreach'", "'as'", "'forall'", 
                    "'exist'", "'forsome'", "'='", "':different'", "'not'", 
                    "'is'", "'in'", "'isnt'", "'total('", "'new'", "'delete'", 
                    "'add('", "'remove('", "'.'", "'isref'", "'!='", "'+='", 
                    "'-='", "'*='", "'/='", "'>'", "'>='", "'<'", "'<='" )
    
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
                     :id_ref, :reference, :reference_type, :set_type, :equals_op, 
                     :not_equals_op, :binary_op, :binary_comp ].freeze


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
            elsif ( look_12_2 == NL || look_12_2 == T__20 || look_12_2 == T__25 || look_12_2 == T__40 || look_12_2 == T__53 || look_12_2 == T__56 || look_12_2 == T__65 )
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
    # 115:1: attribute : ( ID equals_op value ( NL )+ | ID reference_type ( NL )+ | ID set_type ( NL )+ | object_def ( NL )+ );
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
      __NL51__ = nil
      equals_op41 = nil
      value42 = nil
      reference_type45 = nil
      set_type48 = nil
      object_def50 = nil

      tree_for_ID40 = nil
      tree_for_NL43 = nil
      tree_for_ID44 = nil
      tree_for_NL46 = nil
      tree_for_ID47 = nil
      tree_for_NL49 = nil
      tree_for_NL51 = nil

      begin
        # at line 116:2: ( ID equals_op value ( NL )+ | ID reference_type ( NL )+ | ID set_type ( NL )+ | object_def ( NL )+ )
        alt_23 = 4
        look_23_0 = @input.peek( 1 )

        if ( look_23_0 == ID )
          case look_23 = @input.peek( 2 )
          when T__53, T__56 then alt_23 = 1
          when T__65 then alt_23 = 2
          when T__40 then alt_23 = 3
          when NL, T__20, T__25 then alt_23 = 4
          else
            raise NoViableAlternative( "", 23, 1 )
          end
        else
          raise NoViableAlternative( "", 23, 0 )
        end
        case alt_23
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


          # at line 129:4: object_def ( NL )+
          @state.following.push( TOKENS_FOLLOWING_object_def_IN_attribute_352 )
          object_def50 = object_def
          @state.following.pop
          @adaptor.add_child( root_0, object_def50.tree )
          # at file 129:15: ( NL )+
          match_count_22 = 0
          while true
            alt_22 = 2
            look_22_0 = @input.peek( 1 )

            if ( look_22_0 == NL )
              alt_22 = 1

            end
            case alt_22
            when 1
              # at line 129:15: NL
              __NL51__ = match( NL, TOKENS_FOLLOWING_NL_IN_attribute_354 )

              tree_for_NL51 = @adaptor.create_with_payload( __NL51__ )
              @adaptor.add_child( root_0, tree_for_NL51 )


            else
              match_count_22 > 0 and break
              eee = EarlyExit(22)


              raise eee
            end
            match_count_22 += 1
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
    # 132:1: object_def : ID ( 'isa' path ( '[' NUMBER ']' )? )? ( object_body )? ;
    # 
    def object_def
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )
      return_value = ObjectDefReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID52__ = nil
      string_literal53 = nil
      char_literal55 = nil
      __NUMBER56__ = nil
      char_literal57 = nil
      path54 = nil
      object_body58 = nil

      tree_for_ID52 = nil
      tree_for_string_literal53 = nil
      tree_for_char_literal55 = nil
      tree_for_NUMBER56 = nil
      tree_for_char_literal57 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 133:4: ID ( 'isa' path ( '[' NUMBER ']' )? )? ( object_body )?
        __ID52__ = match( ID, TOKENS_FOLLOWING_ID_IN_object_def_366 )

        tree_for_ID52 = @adaptor.create_with_payload( __ID52__ )
        @adaptor.add_child( root_0, tree_for_ID52 )

        # --> action

        			@now[__ID52__.text] = {	'_self' => __ID52__.text,
        				'_context' => 'object',
        				'_parent' => @now,
        				'_isa' => '$.Object'
        			}
        			@now = @now[__ID52__.text]
        			@now['_is_array'] = false
        		
        # <-- action
        # at line 143:3: ( 'isa' path ( '[' NUMBER ']' )? )?
        alt_25 = 2
        look_25_0 = @input.peek( 1 )

        if ( look_25_0 == T__25 )
          alt_25 = 1
        end
        case alt_25
        when 1
          # at line 143:4: 'isa' path ( '[' NUMBER ']' )?
          string_literal53 = match( T__25, TOKENS_FOLLOWING_T__25_IN_object_def_375 )

          tree_for_string_literal53 = @adaptor.create_with_payload( string_literal53 )
          @adaptor.add_child( root_0, tree_for_string_literal53 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_object_def_377 )
          path54 = path
          @state.following.pop
          @adaptor.add_child( root_0, path54.tree )
          # at line 143:14: ( '[' NUMBER ']' )?
          alt_24 = 2
          look_24_0 = @input.peek( 1 )

          if ( look_24_0 == T__26 )
            alt_24 = 1
          end
          case alt_24
          when 1
            # at line 143:15: '[' NUMBER ']'
            char_literal55 = match( T__26, TOKENS_FOLLOWING_T__26_IN_object_def_379 )

            tree_for_char_literal55 = @adaptor.create_with_payload( char_literal55 )
            @adaptor.add_child( root_0, tree_for_char_literal55 )

            __NUMBER56__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_object_def_381 )

            tree_for_NUMBER56 = @adaptor.create_with_payload( __NUMBER56__ )
            @adaptor.add_child( root_0, tree_for_NUMBER56 )

            # --> action
             @now['_is_array'] = true 
            # <-- action
            char_literal57 = match( T__27, TOKENS_FOLLOWING_T__27_IN_object_def_385 )

            tree_for_char_literal57 = @adaptor.create_with_payload( char_literal57 )
            @adaptor.add_child( root_0, tree_for_char_literal57 )


          end
          # --> action

          			@now['_isa'] = self.to_ref(( path54 && @input.to_s( path54.start, path54.stop ) ))
          			self.expand_object(@now)
          		
          # <-- action

        end
        # at line 149:3: ( object_body )?
        alt_26 = 2
        look_26_0 = @input.peek( 1 )

        if ( look_26_0 == T__20 )
          alt_26 = 1
        end
        case alt_26
        when 1
          # at line 149:3: object_body
          @state.following.push( TOKENS_FOLLOWING_object_body_IN_object_def_400 )
          object_body58 = object_body
          @state.following.pop
          @adaptor.add_child( root_0, object_body58.tree )

        end
        # --> action

        			if @now['_is_array']
        				@now.delete('_is_array')
        				obj = self.goto_parent()
        				total = __NUMBER56__.to_s.to_i
        				@arrays[obj.ref] = total
        				for i in 0..(total-1)
        					id = obj['_self'] + "[#{i}]"
        					@now[id] = deep_clone(obj)
        					@now[id]['_self'] = id
        					@now[id]['_classes'] = obj['_classes']
        					#puts 'is_array: ' + __ID52__.text + '[' + i.to_s + ']'
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
    # 170:1: object_body : '{' ( NL )* ( object_attribute | state_dependency | operator )* '}' ;
    # 
    def object_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )
      return_value = ObjectBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal59 = nil
      __NL60__ = nil
      char_literal64 = nil
      object_attribute61 = nil
      state_dependency62 = nil
      operator63 = nil

      tree_for_char_literal59 = nil
      tree_for_NL60 = nil
      tree_for_char_literal64 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 171:4: '{' ( NL )* ( object_attribute | state_dependency | operator )* '}'
        char_literal59 = match( T__20, TOKENS_FOLLOWING_T__20_IN_object_body_416 )

        tree_for_char_literal59 = @adaptor.create_with_payload( char_literal59 )
        @adaptor.add_child( root_0, tree_for_char_literal59 )

        # at line 171:8: ( NL )*
        while true # decision 27
          alt_27 = 2
          look_27_0 = @input.peek( 1 )

          if ( look_27_0 == NL )
            alt_27 = 1

          end
          case alt_27
          when 1
            # at line 171:8: NL
            __NL60__ = match( NL, TOKENS_FOLLOWING_NL_IN_object_body_418 )

            tree_for_NL60 = @adaptor.create_with_payload( __NL60__ )
            @adaptor.add_child( root_0, tree_for_NL60 )


          else
            break # out of loop for decision 27
          end
        end # loop for decision 27
        # at line 171:12: ( object_attribute | state_dependency | operator )*
        while true # decision 28
          alt_28 = 4
          case look_28 = @input.peek( 1 )
          when ID then alt_28 = 1
          when T__28 then alt_28 = 2
          when T__31 then alt_28 = 3
          end
          case alt_28
          when 1
            # at line 171:14: object_attribute
            @state.following.push( TOKENS_FOLLOWING_object_attribute_IN_object_body_423 )
            object_attribute61 = object_attribute
            @state.following.pop
            @adaptor.add_child( root_0, object_attribute61.tree )

          when 2
            # at line 171:33: state_dependency
            @state.following.push( TOKENS_FOLLOWING_state_dependency_IN_object_body_427 )
            state_dependency62 = state_dependency
            @state.following.pop
            @adaptor.add_child( root_0, state_dependency62.tree )

          when 3
            # at line 171:52: operator
            @state.following.push( TOKENS_FOLLOWING_operator_IN_object_body_431 )
            operator63 = operator
            @state.following.pop
            @adaptor.add_child( root_0, operator63.tree )

          else
            break # out of loop for decision 28
          end
        end # loop for decision 28
        char_literal64 = match( T__21, TOKENS_FOLLOWING_T__21_IN_object_body_436 )

        tree_for_char_literal64 = @adaptor.create_with_payload( char_literal64 )
        @adaptor.add_child( root_0, tree_for_char_literal64 )

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
    # 174:1: object_attribute : ( attribute | ID equals_op NULL ( NL )+ );
    # 
    def object_attribute
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )
      return_value = ObjectAttributeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID66__ = nil
      __NULL68__ = nil
      __NL69__ = nil
      attribute65 = nil
      equals_op67 = nil

      tree_for_ID66 = nil
      tree_for_NULL68 = nil
      tree_for_NL69 = nil

      begin
        # at line 175:2: ( attribute | ID equals_op NULL ( NL )+ )
        alt_30 = 2
        look_30_0 = @input.peek( 1 )

        if ( look_30_0 == ID )
          look_30_1 = @input.peek( 2 )

          if ( look_30_1 == T__53 || look_30_1 == T__56 )
            look_30_2 = @input.peek( 3 )

            if ( look_30_2.between?( STRING, NUMBER ) || look_30_2.between?( BOOLEAN, MULTILINE_STRING ) || look_30_2 == T__36 )
              alt_30 = 1
            elsif ( look_30_2 == NULL )
              alt_30 = 2
            else
              raise NoViableAlternative( "", 30, 2 )
            end
          elsif ( look_30_1 == NL || look_30_1 == T__20 || look_30_1 == T__25 || look_30_1 == T__40 || look_30_1 == T__65 )
            alt_30 = 1
          else
            raise NoViableAlternative( "", 30, 1 )
          end
        else
          raise NoViableAlternative( "", 30, 0 )
        end
        case alt_30
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 175:4: attribute
          @state.following.push( TOKENS_FOLLOWING_attribute_IN_object_attribute_447 )
          attribute65 = attribute
          @state.following.pop
          @adaptor.add_child( root_0, attribute65.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 176:4: ID equals_op NULL ( NL )+
          __ID66__ = match( ID, TOKENS_FOLLOWING_ID_IN_object_attribute_452 )

          tree_for_ID66 = @adaptor.create_with_payload( __ID66__ )
          @adaptor.add_child( root_0, tree_for_ID66 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_object_attribute_454 )
          equals_op67 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op67.tree )
          __NULL68__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_object_attribute_456 )

          tree_for_NULL68 = @adaptor.create_with_payload( __NULL68__ )
          @adaptor.add_child( root_0, tree_for_NULL68 )

          # at file 176:22: ( NL )+
          match_count_29 = 0
          while true
            alt_29 = 2
            look_29_0 = @input.peek( 1 )

            if ( look_29_0 == NL )
              alt_29 = 1

            end
            case alt_29
            when 1
              # at line 176:22: NL
              __NL69__ = match( NL, TOKENS_FOLLOWING_NL_IN_object_attribute_458 )

              tree_for_NL69 = @adaptor.create_with_payload( __NL69__ )
              @adaptor.add_child( root_0, tree_for_NL69 )


            else
              match_count_29 > 0 and break
              eee = EarlyExit(29)


              raise eee
            end
            match_count_29 += 1
          end

          # --> action
          	@now[__ID66__.text] = self.null_value	
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
    # 180:1: state_dependency : 'if' dep_effect ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )* ( NL )+ ;
    # 
    def state_dependency
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )
      return_value = StateDependencyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal70 = nil
      __NL72__ = nil
      string_literal73 = nil
      __NL74__ = nil
      char_literal75 = nil
      __NL76__ = nil
      char_literal78 = nil
      __NL79__ = nil
      string_literal80 = nil
      __NL81__ = nil
      char_literal82 = nil
      __NL83__ = nil
      char_literal85 = nil
      __NL86__ = nil
      dep_effect71 = nil
      constraint_body77 = nil
      constraint_body84 = nil

      tree_for_string_literal70 = nil
      tree_for_NL72 = nil
      tree_for_string_literal73 = nil
      tree_for_NL74 = nil
      tree_for_char_literal75 = nil
      tree_for_NL76 = nil
      tree_for_char_literal78 = nil
      tree_for_NL79 = nil
      tree_for_string_literal80 = nil
      tree_for_NL81 = nil
      tree_for_char_literal82 = nil
      tree_for_NL83 = nil
      tree_for_char_literal85 = nil
      tree_for_NL86 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 181:4: 'if' dep_effect ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )* ( NL )+
        string_literal70 = match( T__28, TOKENS_FOLLOWING_T__28_IN_state_dependency_474 )

        tree_for_string_literal70 = @adaptor.create_with_payload( string_literal70 )
        @adaptor.add_child( root_0, tree_for_string_literal70 )

        @state.following.push( TOKENS_FOLLOWING_dep_effect_IN_state_dependency_478 )
        dep_effect71 = dep_effect
        @state.following.pop
        @adaptor.add_child( root_0, dep_effect71.tree )
        # at line 182:14: ( NL )*
        while true # decision 31
          alt_31 = 2
          look_31_0 = @input.peek( 1 )

          if ( look_31_0 == NL )
            alt_31 = 1

          end
          case alt_31
          when 1
            # at line 182:14: NL
            __NL72__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_480 )

            tree_for_NL72 = @adaptor.create_with_payload( __NL72__ )
            @adaptor.add_child( root_0, tree_for_NL72 )


          else
            break # out of loop for decision 31
          end
        end # loop for decision 31
        string_literal73 = match( T__29, TOKENS_FOLLOWING_T__29_IN_state_dependency_483 )

        tree_for_string_literal73 = @adaptor.create_with_payload( string_literal73 )
        @adaptor.add_child( root_0, tree_for_string_literal73 )

        # at line 182:25: ( NL )*
        while true # decision 32
          alt_32 = 2
          look_32_0 = @input.peek( 1 )

          if ( look_32_0 == NL )
            alt_32 = 1

          end
          case alt_32
          when 1
            # at line 182:25: NL
            __NL74__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_485 )

            tree_for_NL74 = @adaptor.create_with_payload( __NL74__ )
            @adaptor.add_child( root_0, tree_for_NL74 )


          else
            break # out of loop for decision 32
          end
        end # loop for decision 32
        char_literal75 = match( T__20, TOKENS_FOLLOWING_T__20_IN_state_dependency_488 )

        tree_for_char_literal75 = @adaptor.create_with_payload( char_literal75 )
        @adaptor.add_child( root_0, tree_for_char_literal75 )

        # at line 183:3: ( NL )*
        while true # decision 33
          alt_33 = 2
          look_33_0 = @input.peek( 1 )

          if ( look_33_0 == NL )
            alt_33 = 1

          end
          case alt_33
          when 1
            # at line 183:3: NL
            __NL76__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_492 )

            tree_for_NL76 = @adaptor.create_with_payload( __NL76__ )
            @adaptor.add_child( root_0, tree_for_NL76 )


          else
            break # out of loop for decision 33
          end
        end # loop for decision 33
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_state_dependency_495 )
        constraint_body77 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body77.tree )
        char_literal78 = match( T__21, TOKENS_FOLLOWING_T__21_IN_state_dependency_500 )

        tree_for_char_literal78 = @adaptor.create_with_payload( char_literal78 )
        @adaptor.add_child( root_0, tree_for_char_literal78 )

        # at line 185:3: ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )*
        while true # decision 37
          alt_37 = 2
          alt_37 = @dfa37.predict( @input )
          case alt_37
          when 1
            # at line 185:5: ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}'
            # at line 185:5: ( NL )*
            while true # decision 34
              alt_34 = 2
              look_34_0 = @input.peek( 1 )

              if ( look_34_0 == NL )
                alt_34 = 1

              end
              case alt_34
              when 1
                # at line 185:5: NL
                __NL79__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_506 )

                tree_for_NL79 = @adaptor.create_with_payload( __NL79__ )
                @adaptor.add_child( root_0, tree_for_NL79 )


              else
                break # out of loop for decision 34
              end
            end # loop for decision 34
            string_literal80 = match( T__30, TOKENS_FOLLOWING_T__30_IN_state_dependency_509 )

            tree_for_string_literal80 = @adaptor.create_with_payload( string_literal80 )
            @adaptor.add_child( root_0, tree_for_string_literal80 )

            # at line 185:14: ( NL )*
            while true # decision 35
              alt_35 = 2
              look_35_0 = @input.peek( 1 )

              if ( look_35_0 == NL )
                alt_35 = 1

              end
              case alt_35
              when 1
                # at line 185:14: NL
                __NL81__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_511 )

                tree_for_NL81 = @adaptor.create_with_payload( __NL81__ )
                @adaptor.add_child( root_0, tree_for_NL81 )


              else
                break # out of loop for decision 35
              end
            end # loop for decision 35
            char_literal82 = match( T__20, TOKENS_FOLLOWING_T__20_IN_state_dependency_514 )

            tree_for_char_literal82 = @adaptor.create_with_payload( char_literal82 )
            @adaptor.add_child( root_0, tree_for_char_literal82 )

            # at line 186:3: ( NL )*
            while true # decision 36
              alt_36 = 2
              look_36_0 = @input.peek( 1 )

              if ( look_36_0 == NL )
                alt_36 = 1

              end
              case alt_36
              when 1
                # at line 186:3: NL
                __NL83__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_518 )

                tree_for_NL83 = @adaptor.create_with_payload( __NL83__ )
                @adaptor.add_child( root_0, tree_for_NL83 )


              else
                break # out of loop for decision 36
              end
            end # loop for decision 36
            @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_state_dependency_521 )
            constraint_body84 = constraint_body
            @state.following.pop
            @adaptor.add_child( root_0, constraint_body84.tree )
            char_literal85 = match( T__21, TOKENS_FOLLOWING_T__21_IN_state_dependency_525 )

            tree_for_char_literal85 = @adaptor.create_with_payload( char_literal85 )
            @adaptor.add_child( root_0, tree_for_char_literal85 )


          else
            break # out of loop for decision 37
          end
        end # loop for decision 37
        # at file 188:3: ( NL )+
        match_count_38 = 0
        while true
          alt_38 = 2
          look_38_0 = @input.peek( 1 )

          if ( look_38_0 == NL )
            alt_38 = 1

          end
          case alt_38
          when 1
            # at line 188:3: NL
            __NL86__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_531 )

            tree_for_NL86 = @adaptor.create_with_payload( __NL86__ )
            @adaptor.add_child( root_0, tree_for_NL86 )


          else
            match_count_38 > 0 and break
            eee = EarlyExit(38)


            raise eee
          end
          match_count_38 += 1
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
    # 191:1: dep_effect : reference equals_op ( value | NULL ) ;
    # 
    def dep_effect
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )
      return_value = DepEffectReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL90__ = nil
      reference87 = nil
      equals_op88 = nil
      value89 = nil

      tree_for_NULL90 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 192:4: reference equals_op ( value | NULL )
        @state.following.push( TOKENS_FOLLOWING_reference_IN_dep_effect_543 )
        reference87 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference87.tree )
        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_dep_effect_545 )
        equals_op88 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op88.tree )
        # at line 193:3: ( value | NULL )
        alt_39 = 2
        look_39_0 = @input.peek( 1 )

        if ( look_39_0.between?( STRING, NUMBER ) || look_39_0.between?( BOOLEAN, MULTILINE_STRING ) || look_39_0 == T__36 )
          alt_39 = 1
        elsif ( look_39_0 == NULL )
          alt_39 = 2
        else
          raise NoViableAlternative( "", 39, 0 )
        end
        case alt_39
        when 1
          # at line 193:5: value
          @state.following.push( TOKENS_FOLLOWING_value_IN_dep_effect_552 )
          value89 = value
          @state.following.pop
          @adaptor.add_child( root_0, value89.tree )

        when 2
          # at line 194:5: NULL
          __NULL90__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_dep_effect_558 )

          tree_for_NULL90 = @adaptor.create_with_payload( __NULL90__ )
          @adaptor.add_child( root_0, tree_for_NULL90 )


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
    # 198:1: operator : 'operator' ID '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( op_conditions )? op_effects '}' ( NL )+ ;
    # 
    def operator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )
      return_value = OperatorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal91 = nil
      __ID92__ = nil
      char_literal93 = nil
      __NL94__ = nil
      string_literal95 = nil
      __NUMBER97__ = nil
      __NL98__ = nil
      char_literal101 = nil
      __NL102__ = nil
      equals_op96 = nil
      op_conditions99 = nil
      op_effects100 = nil

      tree_for_string_literal91 = nil
      tree_for_ID92 = nil
      tree_for_char_literal93 = nil
      tree_for_NL94 = nil
      tree_for_string_literal95 = nil
      tree_for_NUMBER97 = nil
      tree_for_NL98 = nil
      tree_for_char_literal101 = nil
      tree_for_NL102 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 199:4: 'operator' ID '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( op_conditions )? op_effects '}' ( NL )+
        string_literal91 = match( T__31, TOKENS_FOLLOWING_T__31_IN_operator_574 )

        tree_for_string_literal91 = @adaptor.create_with_payload( string_literal91 )
        @adaptor.add_child( root_0, tree_for_string_literal91 )

        __ID92__ = match( ID, TOKENS_FOLLOWING_ID_IN_operator_576 )

        tree_for_ID92 = @adaptor.create_with_payload( __ID92__ )
        @adaptor.add_child( root_0, tree_for_ID92 )

        char_literal93 = match( T__20, TOKENS_FOLLOWING_T__20_IN_operator_578 )

        tree_for_char_literal93 = @adaptor.create_with_payload( char_literal93 )
        @adaptor.add_child( root_0, tree_for_char_literal93 )

        # at line 199:22: ( NL )*
        while true # decision 40
          alt_40 = 2
          look_40_0 = @input.peek( 1 )

          if ( look_40_0 == NL )
            alt_40 = 1

          end
          case alt_40
          when 1
            # at line 199:22: NL
            __NL94__ = match( NL, TOKENS_FOLLOWING_NL_IN_operator_580 )

            tree_for_NL94 = @adaptor.create_with_payload( __NL94__ )
            @adaptor.add_child( root_0, tree_for_NL94 )


          else
            break # out of loop for decision 40
          end
        end # loop for decision 40
        # --> action

        			@now[__ID92__.text] = { '_self' => __ID92__.text,
        				'_context' => 'operator',
        				'_parent' => @now,
        				'_cost' => 1,
        				'_condition' => { '_context' => 'constraint' },
        				'_effect' => { '_context' => 'mutation' }
        			}
        			@now = @now[__ID92__.text]
        		
        # <-- action
        # at line 210:3: ( 'cost' equals_op NUMBER ( NL )+ )?
        alt_42 = 2
        look_42_0 = @input.peek( 1 )

        if ( look_42_0 == T__32 )
          alt_42 = 1
        end
        case alt_42
        when 1
          # at line 210:5: 'cost' equals_op NUMBER ( NL )+
          string_literal95 = match( T__32, TOKENS_FOLLOWING_T__32_IN_operator_591 )

          tree_for_string_literal95 = @adaptor.create_with_payload( string_literal95 )
          @adaptor.add_child( root_0, tree_for_string_literal95 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_operator_593 )
          equals_op96 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op96.tree )
          __NUMBER97__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_operator_595 )

          tree_for_NUMBER97 = @adaptor.create_with_payload( __NUMBER97__ )
          @adaptor.add_child( root_0, tree_for_NUMBER97 )

          # at file 210:29: ( NL )+
          match_count_41 = 0
          while true
            alt_41 = 2
            look_41_0 = @input.peek( 1 )

            if ( look_41_0 == NL )
              alt_41 = 1

            end
            case alt_41
            when 1
              # at line 210:29: NL
              __NL98__ = match( NL, TOKENS_FOLLOWING_NL_IN_operator_597 )

              tree_for_NL98 = @adaptor.create_with_payload( __NL98__ )
              @adaptor.add_child( root_0, tree_for_NL98 )


            else
              match_count_41 > 0 and break
              eee = EarlyExit(41)


              raise eee
            end
            match_count_41 += 1
          end

          # --> action
          	@now['_cost'] = __NUMBER97__.text.to_i	
          # <-- action

        end
        # at line 214:3: ( op_conditions )?
        alt_43 = 2
        look_43_0 = @input.peek( 1 )

        if ( look_43_0 == T__33 )
          alt_43 = 1
        end
        case alt_43
        when 1
          # at line 214:3: op_conditions
          @state.following.push( TOKENS_FOLLOWING_op_conditions_IN_operator_616 )
          op_conditions99 = op_conditions
          @state.following.pop
          @adaptor.add_child( root_0, op_conditions99.tree )

        end
        @state.following.push( TOKENS_FOLLOWING_op_effects_IN_operator_619 )
        op_effects100 = op_effects
        @state.following.pop
        @adaptor.add_child( root_0, op_effects100.tree )
        char_literal101 = match( T__21, TOKENS_FOLLOWING_T__21_IN_operator_623 )

        tree_for_char_literal101 = @adaptor.create_with_payload( char_literal101 )
        @adaptor.add_child( root_0, tree_for_char_literal101 )

        # at file 215:7: ( NL )+
        match_count_44 = 0
        while true
          alt_44 = 2
          look_44_0 = @input.peek( 1 )

          if ( look_44_0 == NL )
            alt_44 = 1

          end
          case alt_44
          when 1
            # at line 215:7: NL
            __NL102__ = match( NL, TOKENS_FOLLOWING_NL_IN_operator_625 )

            tree_for_NL102 = @adaptor.create_with_payload( __NL102__ )
            @adaptor.add_child( root_0, tree_for_NL102 )


          else
            match_count_44 > 0 and break
            eee = EarlyExit(44)


            raise eee
          end
          match_count_44 += 1
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
    # 219:1: op_param : ID equals_op reference ( NL )+ ;
    # 
    def op_param
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )
      return_value = OpParamReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID103__ = nil
      __NL106__ = nil
      equals_op104 = nil
      reference105 = nil

      tree_for_ID103 = nil
      tree_for_NL106 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 220:4: ID equals_op reference ( NL )+
        __ID103__ = match( ID, TOKENS_FOLLOWING_ID_IN_op_param_641 )

        tree_for_ID103 = @adaptor.create_with_payload( __ID103__ )
        @adaptor.add_child( root_0, tree_for_ID103 )

        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_op_param_643 )
        equals_op104 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op104.tree )
        @state.following.push( TOKENS_FOLLOWING_reference_IN_op_param_645 )
        reference105 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference105.tree )
        # at file 220:27: ( NL )+
        match_count_45 = 0
        while true
          alt_45 = 2
          look_45_0 = @input.peek( 1 )

          if ( look_45_0 == NL )
            alt_45 = 1

          end
          case alt_45
          when 1
            # at line 220:27: NL
            __NL106__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_param_647 )

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
        	@now[__ID103__.text] = ( reference105.nil? ? nil : reference105.val )	
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
    # 224:1: op_conditions : 'condition' '{' ( NL )* ( op_statement )* '}' ( NL )+ ;
    # 
    def op_conditions
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      return_value = OpConditionsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal107 = nil
      char_literal108 = nil
      __NL109__ = nil
      char_literal111 = nil
      __NL112__ = nil
      op_statement110 = nil

      tree_for_string_literal107 = nil
      tree_for_char_literal108 = nil
      tree_for_NL109 = nil
      tree_for_char_literal111 = nil
      tree_for_NL112 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 225:4: 'condition' '{' ( NL )* ( op_statement )* '}' ( NL )+
        string_literal107 = match( T__33, TOKENS_FOLLOWING_T__33_IN_op_conditions_663 )

        tree_for_string_literal107 = @adaptor.create_with_payload( string_literal107 )
        @adaptor.add_child( root_0, tree_for_string_literal107 )

        char_literal108 = match( T__20, TOKENS_FOLLOWING_T__20_IN_op_conditions_665 )

        tree_for_char_literal108 = @adaptor.create_with_payload( char_literal108 )
        @adaptor.add_child( root_0, tree_for_char_literal108 )

        # at line 225:20: ( NL )*
        while true # decision 46
          alt_46 = 2
          look_46_0 = @input.peek( 1 )

          if ( look_46_0 == NL )
            alt_46 = 1

          end
          case alt_46
          when 1
            # at line 225:20: NL
            __NL109__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_conditions_667 )

            tree_for_NL109 = @adaptor.create_with_payload( __NL109__ )
            @adaptor.add_child( root_0, tree_for_NL109 )


          else
            break # out of loop for decision 46
          end
        end # loop for decision 46
        # --> action

        			@now['_condition']['_parent'] = @now
        			@now = @now['_condition']
        		
        # <-- action
        # at line 230:3: ( op_statement )*
        while true # decision 47
          alt_47 = 2
          look_47_0 = @input.peek( 1 )

          if ( look_47_0 == ID )
            alt_47 = 1

          end
          case alt_47
          when 1
            # at line 230:3: op_statement
            @state.following.push( TOKENS_FOLLOWING_op_statement_IN_op_conditions_676 )
            op_statement110 = op_statement
            @state.following.pop
            @adaptor.add_child( root_0, op_statement110.tree )

          else
            break # out of loop for decision 47
          end
        end # loop for decision 47
        char_literal111 = match( T__21, TOKENS_FOLLOWING_T__21_IN_op_conditions_681 )

        tree_for_char_literal111 = @adaptor.create_with_payload( char_literal111 )
        @adaptor.add_child( root_0, tree_for_char_literal111 )

        # at file 231:7: ( NL )+
        match_count_48 = 0
        while true
          alt_48 = 2
          look_48_0 = @input.peek( 1 )

          if ( look_48_0 == NL )
            alt_48 = 1

          end
          case alt_48
          when 1
            # at line 231:7: NL
            __NL112__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_conditions_683 )

            tree_for_NL112 = @adaptor.create_with_payload( __NL112__ )
            @adaptor.add_child( root_0, tree_for_NL112 )


          else
            match_count_48 > 0 and break
            eee = EarlyExit(48)


            raise eee
          end
          match_count_48 += 1
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
    # 235:1: op_effects : 'effect' '{' ( NL )* ( op_statement )* '}' ( NL )+ ;
    # 
    def op_effects
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      return_value = OpEffectsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal113 = nil
      char_literal114 = nil
      __NL115__ = nil
      char_literal117 = nil
      __NL118__ = nil
      op_statement116 = nil

      tree_for_string_literal113 = nil
      tree_for_char_literal114 = nil
      tree_for_NL115 = nil
      tree_for_char_literal117 = nil
      tree_for_NL118 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 236:4: 'effect' '{' ( NL )* ( op_statement )* '}' ( NL )+
        string_literal113 = match( T__34, TOKENS_FOLLOWING_T__34_IN_op_effects_699 )

        tree_for_string_literal113 = @adaptor.create_with_payload( string_literal113 )
        @adaptor.add_child( root_0, tree_for_string_literal113 )

        char_literal114 = match( T__20, TOKENS_FOLLOWING_T__20_IN_op_effects_701 )

        tree_for_char_literal114 = @adaptor.create_with_payload( char_literal114 )
        @adaptor.add_child( root_0, tree_for_char_literal114 )

        # at line 236:17: ( NL )*
        while true # decision 49
          alt_49 = 2
          look_49_0 = @input.peek( 1 )

          if ( look_49_0 == NL )
            alt_49 = 1

          end
          case alt_49
          when 1
            # at line 236:17: NL
            __NL115__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_effects_703 )

            tree_for_NL115 = @adaptor.create_with_payload( __NL115__ )
            @adaptor.add_child( root_0, tree_for_NL115 )


          else
            break # out of loop for decision 49
          end
        end # loop for decision 49
        # --> action

        			@now['_effect']['_parent'] = @now
        			@now = @now['_effect']
        		
        # <-- action
        # at line 241:3: ( op_statement )*
        while true # decision 50
          alt_50 = 2
          look_50_0 = @input.peek( 1 )

          if ( look_50_0 == ID )
            alt_50 = 1

          end
          case alt_50
          when 1
            # at line 241:3: op_statement
            @state.following.push( TOKENS_FOLLOWING_op_statement_IN_op_effects_712 )
            op_statement116 = op_statement
            @state.following.pop
            @adaptor.add_child( root_0, op_statement116.tree )

          else
            break # out of loop for decision 50
          end
        end # loop for decision 50
        char_literal117 = match( T__21, TOKENS_FOLLOWING_T__21_IN_op_effects_717 )

        tree_for_char_literal117 = @adaptor.create_with_payload( char_literal117 )
        @adaptor.add_child( root_0, tree_for_char_literal117 )

        # at file 242:7: ( NL )+
        match_count_51 = 0
        while true
          alt_51 = 2
          look_51_0 = @input.peek( 1 )

          if ( look_51_0 == NL )
            alt_51 = 1

          end
          case alt_51
          when 1
            # at line 242:7: NL
            __NL118__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_effects_719 )

            tree_for_NL118 = @adaptor.create_with_payload( __NL118__ )
            @adaptor.add_child( root_0, tree_for_NL118 )


          else
            match_count_51 > 0 and break
            eee = EarlyExit(51)


            raise eee
          end
          match_count_51 += 1
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
    # 246:1: op_statement : reference equals_op value ( NL )+ ;
    # 
    def op_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      return_value = OpStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL122__ = nil
      reference119 = nil
      equals_op120 = nil
      value121 = nil

      tree_for_NL122 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 247:4: reference equals_op value ( NL )+
        @state.following.push( TOKENS_FOLLOWING_reference_IN_op_statement_735 )
        reference119 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference119.tree )
        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_op_statement_737 )
        equals_op120 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op120.tree )
        @state.following.push( TOKENS_FOLLOWING_value_IN_op_statement_739 )
        value121 = value
        @state.following.pop
        @adaptor.add_child( root_0, value121.tree )
        # at file 247:30: ( NL )+
        match_count_52 = 0
        while true
          alt_52 = 2
          look_52_0 = @input.peek( 1 )

          if ( look_52_0 == NL )
            alt_52 = 1

          end
          case alt_52
          when 1
            # at line 247:30: NL
            __NL122__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_statement_741 )

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
        	@now[( reference119.nil? ? nil : reference119.val )] = ( value121.nil? ? nil : value121.val )	
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
    # 251:1: procedure : 'procedure' ID ( parameters )? '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( conditions )? effects '}' ( NL )+ ;
    # 
    def procedure
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = ProcedureReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal123 = nil
      __ID124__ = nil
      char_literal126 = nil
      __NL127__ = nil
      string_literal128 = nil
      __NUMBER130__ = nil
      __NL131__ = nil
      char_literal134 = nil
      __NL135__ = nil
      parameters125 = nil
      equals_op129 = nil
      conditions132 = nil
      effects133 = nil

      tree_for_string_literal123 = nil
      tree_for_ID124 = nil
      tree_for_char_literal126 = nil
      tree_for_NL127 = nil
      tree_for_string_literal128 = nil
      tree_for_NUMBER130 = nil
      tree_for_NL131 = nil
      tree_for_char_literal134 = nil
      tree_for_NL135 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 252:4: 'procedure' ID ( parameters )? '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( conditions )? effects '}' ( NL )+
        string_literal123 = match( T__35, TOKENS_FOLLOWING_T__35_IN_procedure_757 )

        tree_for_string_literal123 = @adaptor.create_with_payload( string_literal123 )
        @adaptor.add_child( root_0, tree_for_string_literal123 )

        __ID124__ = match( ID, TOKENS_FOLLOWING_ID_IN_procedure_759 )

        tree_for_ID124 = @adaptor.create_with_payload( __ID124__ )
        @adaptor.add_child( root_0, tree_for_ID124 )

        # --> action

        			@now[__ID124__.text] = { '_self' => __ID124__.text,
        				'_context' => 'procedure',
        				'_parent' => @now,
        				'_cost' => 1,
        				'_condition' => { '_context' => 'constraint', '_type' => 'and' },
        				'_effect' => { '_context' => 'mutation', '_type' => 'and' }
        			}
        			@now = @now[__ID124__.text]
        		
        # <-- action
        # at line 263:3: ( parameters )?
        alt_53 = 2
        look_53_0 = @input.peek( 1 )

        if ( look_53_0 == T__36 )
          alt_53 = 1
        end
        case alt_53
        when 1
          # at line 263:3: parameters
          @state.following.push( TOKENS_FOLLOWING_parameters_IN_procedure_767 )
          parameters125 = parameters
          @state.following.pop
          @adaptor.add_child( root_0, parameters125.tree )

        end
        char_literal126 = match( T__20, TOKENS_FOLLOWING_T__20_IN_procedure_770 )

        tree_for_char_literal126 = @adaptor.create_with_payload( char_literal126 )
        @adaptor.add_child( root_0, tree_for_char_literal126 )

        # at line 263:19: ( NL )*
        while true # decision 54
          alt_54 = 2
          look_54_0 = @input.peek( 1 )

          if ( look_54_0 == NL )
            alt_54 = 1

          end
          case alt_54
          when 1
            # at line 263:19: NL
            __NL127__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_772 )

            tree_for_NL127 = @adaptor.create_with_payload( __NL127__ )
            @adaptor.add_child( root_0, tree_for_NL127 )


          else
            break # out of loop for decision 54
          end
        end # loop for decision 54
        # at line 264:3: ( 'cost' equals_op NUMBER ( NL )+ )?
        alt_56 = 2
        look_56_0 = @input.peek( 1 )

        if ( look_56_0 == T__32 )
          alt_56 = 1
        end
        case alt_56
        when 1
          # at line 264:5: 'cost' equals_op NUMBER ( NL )+
          string_literal128 = match( T__32, TOKENS_FOLLOWING_T__32_IN_procedure_780 )

          tree_for_string_literal128 = @adaptor.create_with_payload( string_literal128 )
          @adaptor.add_child( root_0, tree_for_string_literal128 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_procedure_782 )
          equals_op129 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op129.tree )
          __NUMBER130__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_procedure_784 )

          tree_for_NUMBER130 = @adaptor.create_with_payload( __NUMBER130__ )
          @adaptor.add_child( root_0, tree_for_NUMBER130 )

          # --> action
          	@now['_cost'] = __NUMBER130__.text.to_i	
          # <-- action
          # at file 266:4: ( NL )+
          match_count_55 = 0
          while true
            alt_55 = 2
            look_55_0 = @input.peek( 1 )

            if ( look_55_0 == NL )
              alt_55 = 1

            end
            case alt_55
            when 1
              # at line 266:4: NL
              __NL131__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_794 )

              tree_for_NL131 = @adaptor.create_with_payload( __NL131__ )
              @adaptor.add_child( root_0, tree_for_NL131 )


            else
              match_count_55 > 0 and break
              eee = EarlyExit(55)


              raise eee
            end
            match_count_55 += 1
          end


        end
        # at line 268:3: ( conditions )?
        alt_57 = 2
        look_57_0 = @input.peek( 1 )

        if ( look_57_0 == T__33 )
          alt_57 = 1
        end
        case alt_57
        when 1
          # at line 268:3: conditions
          @state.following.push( TOKENS_FOLLOWING_conditions_IN_procedure_804 )
          conditions132 = conditions
          @state.following.pop
          @adaptor.add_child( root_0, conditions132.tree )

        end
        @state.following.push( TOKENS_FOLLOWING_effects_IN_procedure_807 )
        effects133 = effects
        @state.following.pop
        @adaptor.add_child( root_0, effects133.tree )
        char_literal134 = match( T__21, TOKENS_FOLLOWING_T__21_IN_procedure_809 )

        tree_for_char_literal134 = @adaptor.create_with_payload( char_literal134 )
        @adaptor.add_child( root_0, tree_for_char_literal134 )

        # at file 268:27: ( NL )+
        match_count_58 = 0
        while true
          alt_58 = 2
          look_58_0 = @input.peek( 1 )

          if ( look_58_0 == NL )
            alt_58 = 1

          end
          case alt_58
          when 1
            # at line 268:27: NL
            __NL135__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_811 )

            tree_for_NL135 = @adaptor.create_with_payload( __NL135__ )
            @adaptor.add_child( root_0, tree_for_NL135 )


          else
            match_count_58 > 0 and break
            eee = EarlyExit(58)


            raise eee
          end
          match_count_58 += 1
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
    # 272:1: parameters : '(' parameter ( ',' ( NL )* parameter )* ')' ;
    # 
    def parameters
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = ParametersReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal136 = nil
      char_literal138 = nil
      __NL139__ = nil
      char_literal141 = nil
      parameter137 = nil
      parameter140 = nil

      tree_for_char_literal136 = nil
      tree_for_char_literal138 = nil
      tree_for_NL139 = nil
      tree_for_char_literal141 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 273:4: '(' parameter ( ',' ( NL )* parameter )* ')'
        char_literal136 = match( T__36, TOKENS_FOLLOWING_T__36_IN_parameters_827 )

        tree_for_char_literal136 = @adaptor.create_with_payload( char_literal136 )
        @adaptor.add_child( root_0, tree_for_char_literal136 )

        @state.following.push( TOKENS_FOLLOWING_parameter_IN_parameters_829 )
        parameter137 = parameter
        @state.following.pop
        @adaptor.add_child( root_0, parameter137.tree )
        # at line 273:18: ( ',' ( NL )* parameter )*
        while true # decision 60
          alt_60 = 2
          look_60_0 = @input.peek( 1 )

          if ( look_60_0 == T__37 )
            alt_60 = 1

          end
          case alt_60
          when 1
            # at line 273:19: ',' ( NL )* parameter
            char_literal138 = match( T__37, TOKENS_FOLLOWING_T__37_IN_parameters_832 )

            tree_for_char_literal138 = @adaptor.create_with_payload( char_literal138 )
            @adaptor.add_child( root_0, tree_for_char_literal138 )

            # at line 273:23: ( NL )*
            while true # decision 59
              alt_59 = 2
              look_59_0 = @input.peek( 1 )

              if ( look_59_0 == NL )
                alt_59 = 1

              end
              case alt_59
              when 1
                # at line 273:23: NL
                __NL139__ = match( NL, TOKENS_FOLLOWING_NL_IN_parameters_834 )

                tree_for_NL139 = @adaptor.create_with_payload( __NL139__ )
                @adaptor.add_child( root_0, tree_for_NL139 )


              else
                break # out of loop for decision 59
              end
            end # loop for decision 59
            @state.following.push( TOKENS_FOLLOWING_parameter_IN_parameters_837 )
            parameter140 = parameter
            @state.following.pop
            @adaptor.add_child( root_0, parameter140.tree )

          else
            break # out of loop for decision 60
          end
        end # loop for decision 60
        char_literal141 = match( T__38, TOKENS_FOLLOWING_T__38_IN_parameters_841 )

        tree_for_char_literal141 = @adaptor.create_with_payload( char_literal141 )
        @adaptor.add_child( root_0, tree_for_char_literal141 )

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
    # 276:1: parameter : ( ID reference_type | ID 'areall' path | ID 'isset' path );
    # 
    def parameter
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = ParameterReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID142__ = nil
      __ID144__ = nil
      string_literal145 = nil
      __ID147__ = nil
      string_literal148 = nil
      reference_type143 = nil
      path146 = nil
      path149 = nil

      tree_for_ID142 = nil
      tree_for_ID144 = nil
      tree_for_string_literal145 = nil
      tree_for_ID147 = nil
      tree_for_string_literal148 = nil

      begin
        # at line 277:2: ( ID reference_type | ID 'areall' path | ID 'isset' path )
        alt_61 = 3
        look_61_0 = @input.peek( 1 )

        if ( look_61_0 == ID )
          case look_61 = @input.peek( 2 )
          when T__39 then alt_61 = 2
          when T__40 then alt_61 = 3
          when T__65 then alt_61 = 1
          else
            raise NoViableAlternative( "", 61, 1 )
          end
        else
          raise NoViableAlternative( "", 61, 0 )
        end
        case alt_61
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 277:4: ID reference_type
          __ID142__ = match( ID, TOKENS_FOLLOWING_ID_IN_parameter_853 )

          tree_for_ID142 = @adaptor.create_with_payload( __ID142__ )
          @adaptor.add_child( root_0, tree_for_ID142 )

          @state.following.push( TOKENS_FOLLOWING_reference_type_IN_parameter_855 )
          reference_type143 = reference_type
          @state.following.pop
          @adaptor.add_child( root_0, reference_type143.tree )
          # --> action
          	@now[__ID142__.text] = ( reference_type143.nil? ? nil : reference_type143.val )	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 279:4: ID 'areall' path
          __ID144__ = match( ID, TOKENS_FOLLOWING_ID_IN_parameter_864 )

          tree_for_ID144 = @adaptor.create_with_payload( __ID144__ )
          @adaptor.add_child( root_0, tree_for_ID144 )

          string_literal145 = match( T__39, TOKENS_FOLLOWING_T__39_IN_parameter_866 )

          tree_for_string_literal145 = @adaptor.create_with_payload( string_literal145 )
          @adaptor.add_child( root_0, tree_for_string_literal145 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_parameter_868 )
          path146 = path
          @state.following.pop
          @adaptor.add_child( root_0, path146.tree )
          # --> action

          			@now[__ID144__.text] = { '_context' => 'all',
          				'_isa' => self.to_ref(( path146 && @input.to_s( path146.start, path146.stop ) )),
          				'_value' => nil
          			}
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 286:4: ID 'isset' path
          __ID147__ = match( ID, TOKENS_FOLLOWING_ID_IN_parameter_877 )

          tree_for_ID147 = @adaptor.create_with_payload( __ID147__ )
          @adaptor.add_child( root_0, tree_for_ID147 )

          string_literal148 = match( T__40, TOKENS_FOLLOWING_T__40_IN_parameter_879 )

          tree_for_string_literal148 = @adaptor.create_with_payload( string_literal148 )
          @adaptor.add_child( root_0, tree_for_string_literal148 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_parameter_881 )
          path149 = path
          @state.following.pop
          @adaptor.add_child( root_0, path149.tree )
          # --> action

          			@now[__ID147__.text] = { '_context' => 'set',
          				'_isa' => self.to_ref(( path149 && @input.to_s( path149.start, path149.stop ) )),
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
    # 295:1: conditions : 'condition' '{' ( NL )* constraint_body '}' ( NL )+ ;
    # 
    def conditions
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
      return_value = ConditionsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal150 = nil
      char_literal151 = nil
      __NL152__ = nil
      char_literal154 = nil
      __NL155__ = nil
      constraint_body153 = nil

      tree_for_string_literal150 = nil
      tree_for_char_literal151 = nil
      tree_for_NL152 = nil
      tree_for_char_literal154 = nil
      tree_for_NL155 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 296:4: 'condition' '{' ( NL )* constraint_body '}' ( NL )+
        string_literal150 = match( T__33, TOKENS_FOLLOWING_T__33_IN_conditions_896 )

        tree_for_string_literal150 = @adaptor.create_with_payload( string_literal150 )
        @adaptor.add_child( root_0, tree_for_string_literal150 )

        # --> action

        			@now['_condition']['_parent'] = @now
        			@now = @now['_condition']
        		
        # <-- action
        char_literal151 = match( T__20, TOKENS_FOLLOWING_T__20_IN_conditions_904 )

        tree_for_char_literal151 = @adaptor.create_with_payload( char_literal151 )
        @adaptor.add_child( root_0, tree_for_char_literal151 )

        # at line 301:7: ( NL )*
        while true # decision 62
          alt_62 = 2
          look_62_0 = @input.peek( 1 )

          if ( look_62_0 == NL )
            alt_62 = 1

          end
          case alt_62
          when 1
            # at line 301:7: NL
            __NL152__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditions_906 )

            tree_for_NL152 = @adaptor.create_with_payload( __NL152__ )
            @adaptor.add_child( root_0, tree_for_NL152 )


          else
            break # out of loop for decision 62
          end
        end # loop for decision 62
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_conditions_909 )
        constraint_body153 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body153.tree )
        char_literal154 = match( T__21, TOKENS_FOLLOWING_T__21_IN_conditions_911 )

        tree_for_char_literal154 = @adaptor.create_with_payload( char_literal154 )
        @adaptor.add_child( root_0, tree_for_char_literal154 )

        # at file 301:31: ( NL )+
        match_count_63 = 0
        while true
          alt_63 = 2
          look_63_0 = @input.peek( 1 )

          if ( look_63_0 == NL )
            alt_63 = 1

          end
          case alt_63
          when 1
            # at line 301:31: NL
            __NL155__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditions_913 )

            tree_for_NL155 = @adaptor.create_with_payload( __NL155__ )
            @adaptor.add_child( root_0, tree_for_NL155 )


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
        # trace_out( __method__, 23 )

      end
      
      return return_value
    end

    EffectsReturnValue = define_return_scope 

    # 
    # parser rule effects
    # 
    # (in SFP.g)
    # 306:1: effects : 'effect' '{' ( NL )* mutation_body '}' ( NL )+ ;
    # 
    def effects
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = EffectsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal156 = nil
      char_literal157 = nil
      __NL158__ = nil
      char_literal160 = nil
      __NL161__ = nil
      mutation_body159 = nil

      tree_for_string_literal156 = nil
      tree_for_char_literal157 = nil
      tree_for_NL158 = nil
      tree_for_char_literal160 = nil
      tree_for_NL161 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 307:4: 'effect' '{' ( NL )* mutation_body '}' ( NL )+
        string_literal156 = match( T__34, TOKENS_FOLLOWING_T__34_IN_effects_930 )

        tree_for_string_literal156 = @adaptor.create_with_payload( string_literal156 )
        @adaptor.add_child( root_0, tree_for_string_literal156 )

        # --> action

        			@now['_effect']['_parent'] = @now
        			@now = @now['_effect']
        		
        # <-- action
        char_literal157 = match( T__20, TOKENS_FOLLOWING_T__20_IN_effects_938 )

        tree_for_char_literal157 = @adaptor.create_with_payload( char_literal157 )
        @adaptor.add_child( root_0, tree_for_char_literal157 )

        # at line 312:7: ( NL )*
        while true # decision 64
          alt_64 = 2
          look_64_0 = @input.peek( 1 )

          if ( look_64_0 == NL )
            alt_64 = 1

          end
          case alt_64
          when 1
            # at line 312:7: NL
            __NL158__ = match( NL, TOKENS_FOLLOWING_NL_IN_effects_940 )

            tree_for_NL158 = @adaptor.create_with_payload( __NL158__ )
            @adaptor.add_child( root_0, tree_for_NL158 )


          else
            break # out of loop for decision 64
          end
        end # loop for decision 64
        @state.following.push( TOKENS_FOLLOWING_mutation_body_IN_effects_946 )
        mutation_body159 = mutation_body
        @state.following.pop
        @adaptor.add_child( root_0, mutation_body159.tree )
        char_literal160 = match( T__21, TOKENS_FOLLOWING_T__21_IN_effects_951 )

        tree_for_char_literal160 = @adaptor.create_with_payload( char_literal160 )
        @adaptor.add_child( root_0, tree_for_char_literal160 )

        # at file 314:7: ( NL )+
        match_count_65 = 0
        while true
          alt_65 = 2
          look_65_0 = @input.peek( 1 )

          if ( look_65_0 == NL )
            alt_65 = 1

          end
          case alt_65
          when 1
            # at line 314:7: NL
            __NL161__ = match( NL, TOKENS_FOLLOWING_NL_IN_effects_953 )

            tree_for_NL161 = @adaptor.create_with_payload( __NL161__ )
            @adaptor.add_child( root_0, tree_for_NL161 )


          else
            match_count_65 > 0 and break
            eee = EarlyExit(65)


            raise eee
          end
          match_count_65 += 1
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
    # 318:1: goal_constraint : 'goal' ( 'constraint' )? ( NL )* '{' ( NL )* ( goal_body )* '}' ( NL )+ ;
    # 
    def goal_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = GoalConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal162 = nil
      string_literal163 = nil
      __NL164__ = nil
      char_literal165 = nil
      __NL166__ = nil
      char_literal168 = nil
      __NL169__ = nil
      goal_body167 = nil

      tree_for_string_literal162 = nil
      tree_for_string_literal163 = nil
      tree_for_NL164 = nil
      tree_for_char_literal165 = nil
      tree_for_NL166 = nil
      tree_for_char_literal168 = nil
      tree_for_NL169 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 319:4: 'goal' ( 'constraint' )? ( NL )* '{' ( NL )* ( goal_body )* '}' ( NL )+
        string_literal162 = match( T__41, TOKENS_FOLLOWING_T__41_IN_goal_constraint_969 )

        tree_for_string_literal162 = @adaptor.create_with_payload( string_literal162 )
        @adaptor.add_child( root_0, tree_for_string_literal162 )

        # at line 319:11: ( 'constraint' )?
        alt_66 = 2
        look_66_0 = @input.peek( 1 )

        if ( look_66_0 == T__42 )
          alt_66 = 1
        end
        case alt_66
        when 1
          # at line 319:11: 'constraint'
          string_literal163 = match( T__42, TOKENS_FOLLOWING_T__42_IN_goal_constraint_971 )

          tree_for_string_literal163 = @adaptor.create_with_payload( string_literal163 )
          @adaptor.add_child( root_0, tree_for_string_literal163 )


        end
        # at line 319:25: ( NL )*
        while true # decision 67
          alt_67 = 2
          look_67_0 = @input.peek( 1 )

          if ( look_67_0 == NL )
            alt_67 = 1

          end
          case alt_67
          when 1
            # at line 319:25: NL
            __NL164__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_constraint_974 )

            tree_for_NL164 = @adaptor.create_with_payload( __NL164__ )
            @adaptor.add_child( root_0, tree_for_NL164 )


          else
            break # out of loop for decision 67
          end
        end # loop for decision 67
        # --> action

        			@now['goal'] = { '_self' => 'goal',
        				'_context' => 'constraint',
        				'_type' => 'and',
        				'_parent' => @now
        			}
        			@now = @now['goal']
        		
        # <-- action
        char_literal165 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_constraint_983 )

        tree_for_char_literal165 = @adaptor.create_with_payload( char_literal165 )
        @adaptor.add_child( root_0, tree_for_char_literal165 )

        # at line 328:7: ( NL )*
        while true # decision 68
          alt_68 = 2
          look_68_0 = @input.peek( 1 )

          if ( look_68_0 == NL )
            alt_68 = 1

          end
          case alt_68
          when 1
            # at line 328:7: NL
            __NL166__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_constraint_985 )

            tree_for_NL166 = @adaptor.create_with_payload( __NL166__ )
            @adaptor.add_child( root_0, tree_for_NL166 )


          else
            break # out of loop for decision 68
          end
        end # loop for decision 68
        # at line 328:11: ( goal_body )*
        while true # decision 69
          alt_69 = 2
          look_69_0 = @input.peek( 1 )

          if ( look_69_0 == ID || look_69_0 == T__28 || look_69_0.between?( T__43, T__48 ) || look_69_0.between?( T__50, T__52 ) || look_69_0 == T__55 || look_69_0 == T__59 )
            alt_69 = 1

          end
          case alt_69
          when 1
            # at line 328:11: goal_body
            @state.following.push( TOKENS_FOLLOWING_goal_body_IN_goal_constraint_988 )
            goal_body167 = goal_body
            @state.following.pop
            @adaptor.add_child( root_0, goal_body167.tree )

          else
            break # out of loop for decision 69
          end
        end # loop for decision 69
        char_literal168 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_constraint_991 )

        tree_for_char_literal168 = @adaptor.create_with_payload( char_literal168 )
        @adaptor.add_child( root_0, tree_for_char_literal168 )

        # at file 328:26: ( NL )+
        match_count_70 = 0
        while true
          alt_70 = 2
          look_70_0 = @input.peek( 1 )

          if ( look_70_0 == NL )
            alt_70 = 1

          end
          case alt_70
          when 1
            # at line 328:26: NL
            __NL169__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_constraint_993 )

            tree_for_NL169 = @adaptor.create_with_payload( __NL169__ )
            @adaptor.add_child( root_0, tree_for_NL169 )


          else
            match_count_70 > 0 and break
            eee = EarlyExit(70)


            raise eee
          end
          match_count_70 += 1
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
    # 332:1: goal_body : ( ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ ) | 'always' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'sometime' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'within' NUMBER ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'after' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* ( 'then' | 'within' NUMBER ) ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'before' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ );
    # 
    def goal_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = GoalBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL174__ = nil
      string_literal175 = nil
      __NL176__ = nil
      char_literal177 = nil
      __NL178__ = nil
      char_literal180 = nil
      __NL181__ = nil
      string_literal182 = nil
      __NL183__ = nil
      char_literal184 = nil
      __NL185__ = nil
      char_literal187 = nil
      __NL188__ = nil
      string_literal189 = nil
      __NUMBER190__ = nil
      __NL191__ = nil
      char_literal192 = nil
      __NL193__ = nil
      char_literal195 = nil
      __NL196__ = nil
      string_literal197 = nil
      __NL198__ = nil
      char_literal199 = nil
      __NL200__ = nil
      char_literal202 = nil
      __NL203__ = nil
      string_literal204 = nil
      string_literal205 = nil
      __NUMBER206__ = nil
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
      string_literal220 = nil
      __NL221__ = nil
      char_literal222 = nil
      __NL223__ = nil
      char_literal225 = nil
      __NL226__ = nil
      constraint_statement170 = nil
      constraint_namespace171 = nil
      constraint_iterator172 = nil
      constraint_class_quantification173 = nil
      constraint_body179 = nil
      constraint_body186 = nil
      constraint_body194 = nil
      constraint_body201 = nil
      constraint_body210 = nil
      constraint_body217 = nil
      constraint_body224 = nil

      tree_for_NL174 = nil
      tree_for_string_literal175 = nil
      tree_for_NL176 = nil
      tree_for_char_literal177 = nil
      tree_for_NL178 = nil
      tree_for_char_literal180 = nil
      tree_for_NL181 = nil
      tree_for_string_literal182 = nil
      tree_for_NL183 = nil
      tree_for_char_literal184 = nil
      tree_for_NL185 = nil
      tree_for_char_literal187 = nil
      tree_for_NL188 = nil
      tree_for_string_literal189 = nil
      tree_for_NUMBER190 = nil
      tree_for_NL191 = nil
      tree_for_char_literal192 = nil
      tree_for_NL193 = nil
      tree_for_char_literal195 = nil
      tree_for_NL196 = nil
      tree_for_string_literal197 = nil
      tree_for_NL198 = nil
      tree_for_char_literal199 = nil
      tree_for_NL200 = nil
      tree_for_char_literal202 = nil
      tree_for_NL203 = nil
      tree_for_string_literal204 = nil
      tree_for_string_literal205 = nil
      tree_for_NUMBER206 = nil
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
      tree_for_string_literal220 = nil
      tree_for_NL221 = nil
      tree_for_char_literal222 = nil
      tree_for_NL223 = nil
      tree_for_char_literal225 = nil
      tree_for_NL226 = nil

      begin
        # at line 333:2: ( ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ ) | 'always' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'sometime' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'within' NUMBER ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'after' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* ( 'then' | 'within' NUMBER ) ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'before' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ )
        alt_95 = 6
        case look_95 = @input.peek( 1 )
        when ID, T__28, T__48, T__50, T__51, T__52, T__55, T__59 then alt_95 = 1
        when T__43 then alt_95 = 2
        when T__44 then alt_95 = 3
        when T__45 then alt_95 = 4
        when T__46 then alt_95 = 5
        when T__47 then alt_95 = 6
        else
          raise NoViableAlternative( "", 95, 0 )
        end
        case alt_95
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 333:4: ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )
          # at line 333:4: ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )
          # at line 334:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+
          # at line 334:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification )
          alt_71 = 4
          alt_71 = @dfa71.predict( @input )
          case alt_71
          when 1
            # at line 334:6: constraint_statement
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_goal_body_1016 )
            constraint_statement170 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement170.tree )
            # --> action

            					@now[( constraint_statement170.nil? ? nil : constraint_statement170.key )] = ( constraint_statement170.nil? ? nil : constraint_statement170.val )
            				
            # <-- action

          when 2
            # at line 338:6: constraint_namespace
            @state.following.push( TOKENS_FOLLOWING_constraint_namespace_IN_goal_body_1029 )
            constraint_namespace171 = constraint_namespace
            @state.following.pop
            @adaptor.add_child( root_0, constraint_namespace171.tree )

          when 3
            # at line 339:6: constraint_iterator
            @state.following.push( TOKENS_FOLLOWING_constraint_iterator_IN_goal_body_1036 )
            constraint_iterator172 = constraint_iterator
            @state.following.pop
            @adaptor.add_child( root_0, constraint_iterator172.tree )

          when 4
            # at line 340:6: constraint_class_quantification
            @state.following.push( TOKENS_FOLLOWING_constraint_class_quantification_IN_goal_body_1043 )
            constraint_class_quantification173 = constraint_class_quantification
            @state.following.pop
            @adaptor.add_child( root_0, constraint_class_quantification173.tree )

          end
          # at file 342:3: ( NL )+
          match_count_72 = 0
          while true
            alt_72 = 2
            look_72_0 = @input.peek( 1 )

            if ( look_72_0 == NL )
              alt_72 = 1

            end
            case alt_72
            when 1
              # at line 342:3: NL
              __NL174__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1052 )

              tree_for_NL174 = @adaptor.create_with_payload( __NL174__ )
              @adaptor.add_child( root_0, tree_for_NL174 )


            else
              match_count_72 > 0 and break
              eee = EarlyExit(72)


              raise eee
            end
            match_count_72 += 1
          end



        when 2
          root_0 = @adaptor.create_flat_list


          # at line 343:4: 'always' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal175 = match( T__43, TOKENS_FOLLOWING_T__43_IN_goal_body_1059 )

          tree_for_string_literal175 = @adaptor.create_with_payload( string_literal175 )
          @adaptor.add_child( root_0, tree_for_string_literal175 )

          # at line 343:13: ( NL )*
          while true # decision 73
            alt_73 = 2
            look_73_0 = @input.peek( 1 )

            if ( look_73_0 == NL )
              alt_73 = 1

            end
            case alt_73
            when 1
              # at line 343:13: NL
              __NL176__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1061 )

              tree_for_NL176 = @adaptor.create_with_payload( __NL176__ )
              @adaptor.add_child( root_0, tree_for_NL176 )


            else
              break # out of loop for decision 73
            end
          end # loop for decision 73
          # --> action

          			@now['always'] = self.create_constraint('always', 'and') if
          				not @now.has_key?('always')
          			@now = @now['always']
          		
          # <-- action
          char_literal177 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1070 )

          tree_for_char_literal177 = @adaptor.create_with_payload( char_literal177 )
          @adaptor.add_child( root_0, tree_for_char_literal177 )

          # at line 349:7: ( NL )*
          while true # decision 74
            alt_74 = 2
            look_74_0 = @input.peek( 1 )

            if ( look_74_0 == NL )
              alt_74 = 1

            end
            case alt_74
            when 1
              # at line 349:7: NL
              __NL178__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1072 )

              tree_for_NL178 = @adaptor.create_with_payload( __NL178__ )
              @adaptor.add_child( root_0, tree_for_NL178 )


            else
              break # out of loop for decision 74
            end
          end # loop for decision 74
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1075 )
          constraint_body179 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body179.tree )
          char_literal180 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1077 )

          tree_for_char_literal180 = @adaptor.create_with_payload( char_literal180 )
          @adaptor.add_child( root_0, tree_for_char_literal180 )

          # at file 349:31: ( NL )+
          match_count_75 = 0
          while true
            alt_75 = 2
            look_75_0 = @input.peek( 1 )

            if ( look_75_0 == NL )
              alt_75 = 1

            end
            case alt_75
            when 1
              # at line 349:31: NL
              __NL181__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1079 )

              tree_for_NL181 = @adaptor.create_with_payload( __NL181__ )
              @adaptor.add_child( root_0, tree_for_NL181 )


            else
              match_count_75 > 0 and break
              eee = EarlyExit(75)


              raise eee
            end
            match_count_75 += 1
          end

          # --> action
          	self.goto_parent()	
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 351:4: 'sometime' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal182 = match( T__44, TOKENS_FOLLOWING_T__44_IN_goal_body_1089 )

          tree_for_string_literal182 = @adaptor.create_with_payload( string_literal182 )
          @adaptor.add_child( root_0, tree_for_string_literal182 )

          # at line 351:15: ( NL )*
          while true # decision 76
            alt_76 = 2
            look_76_0 = @input.peek( 1 )

            if ( look_76_0 == NL )
              alt_76 = 1

            end
            case alt_76
            when 1
              # at line 351:15: NL
              __NL183__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1091 )

              tree_for_NL183 = @adaptor.create_with_payload( __NL183__ )
              @adaptor.add_child( root_0, tree_for_NL183 )


            else
              break # out of loop for decision 76
            end
          end # loop for decision 76
          # --> action

          			@now['sometime'] = self.create_constraint('sometime', 'or') if
          				not @now.has_key?('sometime')
          			@now = @now['sometime']
          			id = self.next_id.to_s
          			@now[id] = self.create_constraint(id, 'and')
          			@now = @now[id]
          		
          # <-- action
          char_literal184 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1100 )

          tree_for_char_literal184 = @adaptor.create_with_payload( char_literal184 )
          @adaptor.add_child( root_0, tree_for_char_literal184 )

          # at line 360:7: ( NL )*
          while true # decision 77
            alt_77 = 2
            look_77_0 = @input.peek( 1 )

            if ( look_77_0 == NL )
              alt_77 = 1

            end
            case alt_77
            when 1
              # at line 360:7: NL
              __NL185__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1102 )

              tree_for_NL185 = @adaptor.create_with_payload( __NL185__ )
              @adaptor.add_child( root_0, tree_for_NL185 )


            else
              break # out of loop for decision 77
            end
          end # loop for decision 77
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1105 )
          constraint_body186 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body186.tree )
          char_literal187 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1107 )

          tree_for_char_literal187 = @adaptor.create_with_payload( char_literal187 )
          @adaptor.add_child( root_0, tree_for_char_literal187 )

          # at file 360:31: ( NL )+
          match_count_78 = 0
          while true
            alt_78 = 2
            look_78_0 = @input.peek( 1 )

            if ( look_78_0 == NL )
              alt_78 = 1

            end
            case alt_78
            when 1
              # at line 360:31: NL
              __NL188__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1109 )

              tree_for_NL188 = @adaptor.create_with_payload( __NL188__ )
              @adaptor.add_child( root_0, tree_for_NL188 )


            else
              match_count_78 > 0 and break
              eee = EarlyExit(78)


              raise eee
            end
            match_count_78 += 1
          end

          # --> action
          	self.goto_parent()	
          # <-- action
          # --> action
          	self.goto_parent()	
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 363:4: 'within' NUMBER ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal189 = match( T__45, TOKENS_FOLLOWING_T__45_IN_goal_body_1123 )

          tree_for_string_literal189 = @adaptor.create_with_payload( string_literal189 )
          @adaptor.add_child( root_0, tree_for_string_literal189 )

          __NUMBER190__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_goal_body_1125 )

          tree_for_NUMBER190 = @adaptor.create_with_payload( __NUMBER190__ )
          @adaptor.add_child( root_0, tree_for_NUMBER190 )

          # at line 363:20: ( NL )*
          while true # decision 79
            alt_79 = 2
            look_79_0 = @input.peek( 1 )

            if ( look_79_0 == NL )
              alt_79 = 1

            end
            case alt_79
            when 1
              # at line 363:20: NL
              __NL191__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1127 )

              tree_for_NL191 = @adaptor.create_with_payload( __NL191__ )
              @adaptor.add_child( root_0, tree_for_NL191 )


            else
              break # out of loop for decision 79
            end
          end # loop for decision 79
          # --> action

          			id = self.next_id.to_s
          			@now[id] = self.create_constraint(id, 'within')
          			@now = @now[id]
          			@now['deadline'] = __NUMBER190__.text.to_s.to_i
          		
          # <-- action
          char_literal192 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1136 )

          tree_for_char_literal192 = @adaptor.create_with_payload( char_literal192 )
          @adaptor.add_child( root_0, tree_for_char_literal192 )

          # at line 370:7: ( NL )*
          while true # decision 80
            alt_80 = 2
            look_80_0 = @input.peek( 1 )

            if ( look_80_0 == NL )
              alt_80 = 1

            end
            case alt_80
            when 1
              # at line 370:7: NL
              __NL193__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1138 )

              tree_for_NL193 = @adaptor.create_with_payload( __NL193__ )
              @adaptor.add_child( root_0, tree_for_NL193 )


            else
              break # out of loop for decision 80
            end
          end # loop for decision 80
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1141 )
          constraint_body194 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body194.tree )
          char_literal195 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1143 )

          tree_for_char_literal195 = @adaptor.create_with_payload( char_literal195 )
          @adaptor.add_child( root_0, tree_for_char_literal195 )

          # at file 370:31: ( NL )+
          match_count_81 = 0
          while true
            alt_81 = 2
            look_81_0 = @input.peek( 1 )

            if ( look_81_0 == NL )
              alt_81 = 1

            end
            case alt_81
            when 1
              # at line 370:31: NL
              __NL196__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1145 )

              tree_for_NL196 = @adaptor.create_with_payload( __NL196__ )
              @adaptor.add_child( root_0, tree_for_NL196 )


            else
              match_count_81 > 0 and break
              eee = EarlyExit(81)


              raise eee
            end
            match_count_81 += 1
          end

          # --> action
          	self.goto_parent()	
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 372:4: 'after' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* ( 'then' | 'within' NUMBER ) ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal197 = match( T__46, TOKENS_FOLLOWING_T__46_IN_goal_body_1155 )

          tree_for_string_literal197 = @adaptor.create_with_payload( string_literal197 )
          @adaptor.add_child( root_0, tree_for_string_literal197 )

          # at line 372:12: ( NL )*
          while true # decision 82
            alt_82 = 2
            look_82_0 = @input.peek( 1 )

            if ( look_82_0 == NL )
              alt_82 = 1

            end
            case alt_82
            when 1
              # at line 372:12: NL
              __NL198__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1157 )

              tree_for_NL198 = @adaptor.create_with_payload( __NL198__ )
              @adaptor.add_child( root_0, tree_for_NL198 )


            else
              break # out of loop for decision 82
            end
          end # loop for decision 82
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
          char_literal199 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1166 )

          tree_for_char_literal199 = @adaptor.create_with_payload( char_literal199 )
          @adaptor.add_child( root_0, tree_for_char_literal199 )

          # at line 385:7: ( NL )*
          while true # decision 83
            alt_83 = 2
            look_83_0 = @input.peek( 1 )

            if ( look_83_0 == NL )
              alt_83 = 1

            end
            case alt_83
            when 1
              # at line 385:7: NL
              __NL200__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1168 )

              tree_for_NL200 = @adaptor.create_with_payload( __NL200__ )
              @adaptor.add_child( root_0, tree_for_NL200 )


            else
              break # out of loop for decision 83
            end
          end # loop for decision 83
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1171 )
          constraint_body201 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body201.tree )
          char_literal202 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1173 )

          tree_for_char_literal202 = @adaptor.create_with_payload( char_literal202 )
          @adaptor.add_child( root_0, tree_for_char_literal202 )

          # at line 385:31: ( NL )*
          while true # decision 84
            alt_84 = 2
            look_84_0 = @input.peek( 1 )

            if ( look_84_0 == NL )
              alt_84 = 1

            end
            case alt_84
            when 1
              # at line 385:31: NL
              __NL203__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1175 )

              tree_for_NL203 = @adaptor.create_with_payload( __NL203__ )
              @adaptor.add_child( root_0, tree_for_NL203 )


            else
              break # out of loop for decision 84
            end
          end # loop for decision 84
          # --> action
          	self.goto_parent()	
          # <-- action
          # at line 387:3: ( 'then' | 'within' NUMBER )
          alt_85 = 2
          look_85_0 = @input.peek( 1 )

          if ( look_85_0 == T__29 )
            alt_85 = 1
          elsif ( look_85_0 == T__45 )
            alt_85 = 2
          else
            raise NoViableAlternative( "", 85, 0 )
          end
          case alt_85
          when 1
            # at line 387:5: 'then'
            string_literal204 = match( T__29, TOKENS_FOLLOWING_T__29_IN_goal_body_1186 )

            tree_for_string_literal204 = @adaptor.create_with_payload( string_literal204 )
            @adaptor.add_child( root_0, tree_for_string_literal204 )


          when 2
            # at line 388:6: 'within' NUMBER
            string_literal205 = match( T__45, TOKENS_FOLLOWING_T__45_IN_goal_body_1193 )

            tree_for_string_literal205 = @adaptor.create_with_payload( string_literal205 )
            @adaptor.add_child( root_0, tree_for_string_literal205 )

            __NUMBER206__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_goal_body_1195 )

            tree_for_NUMBER206 = @adaptor.create_with_payload( __NUMBER206__ )
            @adaptor.add_child( root_0, tree_for_NUMBER206 )

            # --> action
             @now['deadline'] = __NUMBER206__.text.to_s.to_i 
            # <-- action

          end
          # at line 390:5: ( NL )*
          while true # decision 86
            alt_86 = 2
            look_86_0 = @input.peek( 1 )

            if ( look_86_0 == NL )
              alt_86 = 1

            end
            case alt_86
            when 1
              # at line 390:5: NL
              __NL207__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1207 )

              tree_for_NL207 = @adaptor.create_with_payload( __NL207__ )
              @adaptor.add_child( root_0, tree_for_NL207 )


            else
              break # out of loop for decision 86
            end
          end # loop for decision 86
          # --> action

          			@now['then'] = self.create_constraint('then')
          			@now = @now['then']
          		
          # <-- action
          char_literal208 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1216 )

          tree_for_char_literal208 = @adaptor.create_with_payload( char_literal208 )
          @adaptor.add_child( root_0, tree_for_char_literal208 )

          # at line 395:7: ( NL )*
          while true # decision 87
            alt_87 = 2
            look_87_0 = @input.peek( 1 )

            if ( look_87_0 == NL )
              alt_87 = 1

            end
            case alt_87
            when 1
              # at line 395:7: NL
              __NL209__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1218 )

              tree_for_NL209 = @adaptor.create_with_payload( __NL209__ )
              @adaptor.add_child( root_0, tree_for_NL209 )


            else
              break # out of loop for decision 87
            end
          end # loop for decision 87
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1221 )
          constraint_body210 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body210.tree )
          char_literal211 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1223 )

          tree_for_char_literal211 = @adaptor.create_with_payload( char_literal211 )
          @adaptor.add_child( root_0, tree_for_char_literal211 )

          # at file 395:31: ( NL )+
          match_count_88 = 0
          while true
            alt_88 = 2
            look_88_0 = @input.peek( 1 )

            if ( look_88_0 == NL )
              alt_88 = 1

            end
            case alt_88
            when 1
              # at line 395:31: NL
              __NL212__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1225 )

              tree_for_NL212 = @adaptor.create_with_payload( __NL212__ )
              @adaptor.add_child( root_0, tree_for_NL212 )


            else
              match_count_88 > 0 and break
              eee = EarlyExit(88)


              raise eee
            end
            match_count_88 += 1
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


          # at line 399:4: 'before' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal213 = match( T__47, TOKENS_FOLLOWING_T__47_IN_goal_body_1243 )

          tree_for_string_literal213 = @adaptor.create_with_payload( string_literal213 )
          @adaptor.add_child( root_0, tree_for_string_literal213 )

          # at line 399:13: ( NL )*
          while true # decision 89
            alt_89 = 2
            look_89_0 = @input.peek( 1 )

            if ( look_89_0 == NL )
              alt_89 = 1

            end
            case alt_89
            when 1
              # at line 399:13: NL
              __NL214__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1245 )

              tree_for_NL214 = @adaptor.create_with_payload( __NL214__ )
              @adaptor.add_child( root_0, tree_for_NL214 )


            else
              break # out of loop for decision 89
            end
          end # loop for decision 89
          # --> action

          			id = self.next_id.to_s
          			@now[id] = self.create_constraint(id, 'sometime-before')
          			@now = @now[id]
          			@now['before'] = self.create_constraint('before')
          			@now = @now['before']
          		
          # <-- action
          char_literal215 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1254 )

          tree_for_char_literal215 = @adaptor.create_with_payload( char_literal215 )
          @adaptor.add_child( root_0, tree_for_char_literal215 )

          # at line 407:7: ( NL )*
          while true # decision 90
            alt_90 = 2
            look_90_0 = @input.peek( 1 )

            if ( look_90_0 == NL )
              alt_90 = 1

            end
            case alt_90
            when 1
              # at line 407:7: NL
              __NL216__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1256 )

              tree_for_NL216 = @adaptor.create_with_payload( __NL216__ )
              @adaptor.add_child( root_0, tree_for_NL216 )


            else
              break # out of loop for decision 90
            end
          end # loop for decision 90
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1259 )
          constraint_body217 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body217.tree )
          char_literal218 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1261 )

          tree_for_char_literal218 = @adaptor.create_with_payload( char_literal218 )
          @adaptor.add_child( root_0, tree_for_char_literal218 )

          # at line 407:31: ( NL )*
          while true # decision 91
            alt_91 = 2
            look_91_0 = @input.peek( 1 )

            if ( look_91_0 == NL )
              alt_91 = 1

            end
            case alt_91
            when 1
              # at line 407:31: NL
              __NL219__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1263 )

              tree_for_NL219 = @adaptor.create_with_payload( __NL219__ )
              @adaptor.add_child( root_0, tree_for_NL219 )


            else
              break # out of loop for decision 91
            end
          end # loop for decision 91
          # --> action
          	self.goto_parent()	
          # <-- action
          string_literal220 = match( T__29, TOKENS_FOLLOWING_T__29_IN_goal_body_1272 )

          tree_for_string_literal220 = @adaptor.create_with_payload( string_literal220 )
          @adaptor.add_child( root_0, tree_for_string_literal220 )

          # at line 409:10: ( NL )*
          while true # decision 92
            alt_92 = 2
            look_92_0 = @input.peek( 1 )

            if ( look_92_0 == NL )
              alt_92 = 1

            end
            case alt_92
            when 1
              # at line 409:10: NL
              __NL221__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1274 )

              tree_for_NL221 = @adaptor.create_with_payload( __NL221__ )
              @adaptor.add_child( root_0, tree_for_NL221 )


            else
              break # out of loop for decision 92
            end
          end # loop for decision 92
          # --> action

          			@now['then'] = self.create_constraint('then')
          			@now = @now['then']
          		
          # <-- action
          char_literal222 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1283 )

          tree_for_char_literal222 = @adaptor.create_with_payload( char_literal222 )
          @adaptor.add_child( root_0, tree_for_char_literal222 )

          # at line 414:7: ( NL )*
          while true # decision 93
            alt_93 = 2
            look_93_0 = @input.peek( 1 )

            if ( look_93_0 == NL )
              alt_93 = 1

            end
            case alt_93
            when 1
              # at line 414:7: NL
              __NL223__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1285 )

              tree_for_NL223 = @adaptor.create_with_payload( __NL223__ )
              @adaptor.add_child( root_0, tree_for_NL223 )


            else
              break # out of loop for decision 93
            end
          end # loop for decision 93
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1288 )
          constraint_body224 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body224.tree )
          char_literal225 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1290 )

          tree_for_char_literal225 = @adaptor.create_with_payload( char_literal225 )
          @adaptor.add_child( root_0, tree_for_char_literal225 )

          # at file 414:31: ( NL )+
          match_count_94 = 0
          while true
            alt_94 = 2
            look_94_0 = @input.peek( 1 )

            if ( look_94_0 == NL )
              alt_94 = 1

            end
            case alt_94
            when 1
              # at line 414:31: NL
              __NL226__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1292 )

              tree_for_NL226 = @adaptor.create_with_payload( __NL226__ )
              @adaptor.add_child( root_0, tree_for_NL226 )


            else
              match_count_94 > 0 and break
              eee = EarlyExit(94)


              raise eee
            end
            match_count_94 += 1
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
    # 419:1: nested_constraint : '{' ( NL )* constraint_body '}' ;
    # 
    def nested_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = NestedConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal227 = nil
      __NL228__ = nil
      char_literal230 = nil
      constraint_body229 = nil

      tree_for_char_literal227 = nil
      tree_for_NL228 = nil
      tree_for_char_literal230 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 420:4: '{' ( NL )* constraint_body '}'
        char_literal227 = match( T__20, TOKENS_FOLLOWING_T__20_IN_nested_constraint_1312 )

        tree_for_char_literal227 = @adaptor.create_with_payload( char_literal227 )
        @adaptor.add_child( root_0, tree_for_char_literal227 )

        # at line 420:8: ( NL )*
        while true # decision 96
          alt_96 = 2
          look_96_0 = @input.peek( 1 )

          if ( look_96_0 == NL )
            alt_96 = 1

          end
          case alt_96
          when 1
            # at line 420:8: NL
            __NL228__ = match( NL, TOKENS_FOLLOWING_NL_IN_nested_constraint_1314 )

            tree_for_NL228 = @adaptor.create_with_payload( __NL228__ )
            @adaptor.add_child( root_0, tree_for_NL228 )


          else
            break # out of loop for decision 96
          end
        end # loop for decision 96
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_nested_constraint_1317 )
        constraint_body229 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body229.tree )
        char_literal230 = match( T__21, TOKENS_FOLLOWING_T__21_IN_nested_constraint_1319 )

        tree_for_char_literal230 = @adaptor.create_with_payload( char_literal230 )
        @adaptor.add_child( root_0, tree_for_char_literal230 )

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
    # 423:1: constraint : ID 'constraint' '{' ( NL )* constraint_body '}' ( NL )+ ;
    # 
    def constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = ConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID231__ = nil
      string_literal232 = nil
      char_literal233 = nil
      __NL234__ = nil
      char_literal236 = nil
      __NL237__ = nil
      constraint_body235 = nil

      tree_for_ID231 = nil
      tree_for_string_literal232 = nil
      tree_for_char_literal233 = nil
      tree_for_NL234 = nil
      tree_for_char_literal236 = nil
      tree_for_NL237 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 424:4: ID 'constraint' '{' ( NL )* constraint_body '}' ( NL )+
        __ID231__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_1330 )

        tree_for_ID231 = @adaptor.create_with_payload( __ID231__ )
        @adaptor.add_child( root_0, tree_for_ID231 )

        string_literal232 = match( T__42, TOKENS_FOLLOWING_T__42_IN_constraint_1332 )

        tree_for_string_literal232 = @adaptor.create_with_payload( string_literal232 )
        @adaptor.add_child( root_0, tree_for_string_literal232 )

        # --> action

        			@now[__ID231__.text] = { '_self' => __ID231__.text,
        				'_context' => 'constraint',
        				'_type' => 'and',
        				'_parent' => @now
        			}
        			@now = @now[__ID231__.text]
        		
        # <-- action
        char_literal233 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_1340 )

        tree_for_char_literal233 = @adaptor.create_with_payload( char_literal233 )
        @adaptor.add_child( root_0, tree_for_char_literal233 )

        # at line 433:7: ( NL )*
        while true # decision 97
          alt_97 = 2
          look_97_0 = @input.peek( 1 )

          if ( look_97_0 == NL )
            alt_97 = 1

          end
          case alt_97
          when 1
            # at line 433:7: NL
            __NL234__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_1342 )

            tree_for_NL234 = @adaptor.create_with_payload( __NL234__ )
            @adaptor.add_child( root_0, tree_for_NL234 )


          else
            break # out of loop for decision 97
          end
        end # loop for decision 97
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_constraint_1345 )
        constraint_body235 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body235.tree )
        char_literal236 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_1347 )

        tree_for_char_literal236 = @adaptor.create_with_payload( char_literal236 )
        @adaptor.add_child( root_0, tree_for_char_literal236 )

        # at file 433:31: ( NL )+
        match_count_98 = 0
        while true
          alt_98 = 2
          look_98_0 = @input.peek( 1 )

          if ( look_98_0 == NL )
            alt_98 = 1

          end
          case alt_98
          when 1
            # at line 433:31: NL
            __NL237__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_1349 )

            tree_for_NL237 = @adaptor.create_with_payload( __NL237__ )
            @adaptor.add_child( root_0, tree_for_NL237 )


          else
            match_count_98 > 0 and break
            eee = EarlyExit(98)


            raise eee
          end
          match_count_98 += 1
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
    # 437:1: constraint_body : ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )* ;
    # 
    def constraint_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = ConstraintBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL242__ = nil
      constraint_statement238 = nil
      constraint_namespace239 = nil
      constraint_iterator240 = nil
      constraint_class_quantification241 = nil

      tree_for_NL242 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 438:4: ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )*
        # at line 438:4: ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )*
        while true # decision 101
          alt_101 = 2
          look_101_0 = @input.peek( 1 )

          if ( look_101_0 == ID || look_101_0 == T__28 || look_101_0 == T__48 || look_101_0.between?( T__50, T__52 ) || look_101_0 == T__55 || look_101_0 == T__59 )
            alt_101 = 1

          end
          case alt_101
          when 1
            # at line 439:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+
            # at line 439:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification )
            alt_99 = 4
            alt_99 = @dfa99.predict( @input )
            case alt_99
            when 1
              # at line 439:6: constraint_statement
              @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_1372 )
              constraint_statement238 = constraint_statement
              @state.following.pop
              @adaptor.add_child( root_0, constraint_statement238.tree )
              # --> action

              					@now[( constraint_statement238.nil? ? nil : constraint_statement238.key )] = ( constraint_statement238.nil? ? nil : constraint_statement238.val )
              				
              # <-- action

            when 2
              # at line 443:6: constraint_namespace
              @state.following.push( TOKENS_FOLLOWING_constraint_namespace_IN_constraint_body_1385 )
              constraint_namespace239 = constraint_namespace
              @state.following.pop
              @adaptor.add_child( root_0, constraint_namespace239.tree )

            when 3
              # at line 444:6: constraint_iterator
              @state.following.push( TOKENS_FOLLOWING_constraint_iterator_IN_constraint_body_1392 )
              constraint_iterator240 = constraint_iterator
              @state.following.pop
              @adaptor.add_child( root_0, constraint_iterator240.tree )

            when 4
              # at line 445:6: constraint_class_quantification
              @state.following.push( TOKENS_FOLLOWING_constraint_class_quantification_IN_constraint_body_1399 )
              constraint_class_quantification241 = constraint_class_quantification
              @state.following.pop
              @adaptor.add_child( root_0, constraint_class_quantification241.tree )

            end
            # at file 447:3: ( NL )+
            match_count_100 = 0
            while true
              alt_100 = 2
              look_100_0 = @input.peek( 1 )

              if ( look_100_0 == NL )
                alt_100 = 1

              end
              case alt_100
              when 1
                # at line 447:3: NL
                __NL242__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_body_1408 )

                tree_for_NL242 = @adaptor.create_with_payload( __NL242__ )
                @adaptor.add_child( root_0, tree_for_NL242 )


              else
                match_count_100 > 0 and break
                eee = EarlyExit(100)


                raise eee
              end
              match_count_100 += 1
            end


          else
            break # out of loop for decision 101
          end
        end # loop for decision 101
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
    # 450:1: constraint_namespace : path ( NL )* '{' ( NL )* ( constraint_statement ( NL )+ )* '}' ;
    # 
    def constraint_namespace
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = ConstraintNamespaceReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL244__ = nil
      char_literal245 = nil
      __NL246__ = nil
      __NL248__ = nil
      char_literal249 = nil
      path243 = nil
      constraint_statement247 = nil

      tree_for_NL244 = nil
      tree_for_char_literal245 = nil
      tree_for_NL246 = nil
      tree_for_NL248 = nil
      tree_for_char_literal249 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 451:4: path ( NL )* '{' ( NL )* ( constraint_statement ( NL )+ )* '}'
        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_namespace_1422 )
        path243 = path
        @state.following.pop
        @adaptor.add_child( root_0, path243.tree )
        # at line 451:9: ( NL )*
        while true # decision 102
          alt_102 = 2
          look_102_0 = @input.peek( 1 )

          if ( look_102_0 == NL )
            alt_102 = 1

          end
          case alt_102
          when 1
            # at line 451:9: NL
            __NL244__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1424 )

            tree_for_NL244 = @adaptor.create_with_payload( __NL244__ )
            @adaptor.add_child( root_0, tree_for_NL244 )


          else
            break # out of loop for decision 102
          end
        end # loop for decision 102
        char_literal245 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_namespace_1427 )

        tree_for_char_literal245 = @adaptor.create_with_payload( char_literal245 )
        @adaptor.add_child( root_0, tree_for_char_literal245 )

        # at line 451:17: ( NL )*
        while true # decision 103
          alt_103 = 2
          look_103_0 = @input.peek( 1 )

          if ( look_103_0 == NL )
            alt_103 = 1

          end
          case alt_103
          when 1
            # at line 451:17: NL
            __NL246__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1429 )

            tree_for_NL246 = @adaptor.create_with_payload( __NL246__ )
            @adaptor.add_child( root_0, tree_for_NL246 )


          else
            break # out of loop for decision 103
          end
        end # loop for decision 103
        # at line 451:21: ( constraint_statement ( NL )+ )*
        while true # decision 105
          alt_105 = 2
          look_105_0 = @input.peek( 1 )

          if ( look_105_0 == ID || look_105_0 == T__28 || look_105_0 == T__55 || look_105_0 == T__59 )
            alt_105 = 1

          end
          case alt_105
          when 1
            # at line 451:22: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_namespace_1433 )
            constraint_statement247 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement247.tree )
            # --> action

            			key = self.to_ref(( path243 && @input.to_s( path243.start, path243.stop ) ) + '.' + ( constraint_statement247.nil? ? nil : constraint_statement247.key )[2,( constraint_statement247.nil? ? nil : constraint_statement247.key ).length])
            			@now[key] = ( constraint_statement247.nil? ? nil : constraint_statement247.val )
            		
            # <-- action
            # at file 456:3: ( NL )+
            match_count_104 = 0
            while true
              alt_104 = 2
              look_104_0 = @input.peek( 1 )

              if ( look_104_0 == NL )
                alt_104 = 1

              end
              case alt_104
              when 1
                # at line 456:3: NL
                __NL248__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1441 )

                tree_for_NL248 = @adaptor.create_with_payload( __NL248__ )
                @adaptor.add_child( root_0, tree_for_NL248 )


              else
                match_count_104 > 0 and break
                eee = EarlyExit(104)


                raise eee
              end
              match_count_104 += 1
            end


          else
            break # out of loop for decision 105
          end
        end # loop for decision 105
        char_literal249 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_namespace_1446 )

        tree_for_char_literal249 = @adaptor.create_with_payload( char_literal249 )
        @adaptor.add_child( root_0, tree_for_char_literal249 )

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
    # 459:1: constraint_iterator : 'foreach' '(' path 'as' ID ')' ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ )* '}' ;
    # 
    def constraint_iterator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
      return_value = ConstraintIteratorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal250 = nil
      char_literal251 = nil
      string_literal253 = nil
      __ID254__ = nil
      char_literal255 = nil
      __NL256__ = nil
      char_literal257 = nil
      __NL258__ = nil
      __NL260__ = nil
      char_literal261 = nil
      path252 = nil
      constraint_statement259 = nil

      tree_for_string_literal250 = nil
      tree_for_char_literal251 = nil
      tree_for_string_literal253 = nil
      tree_for_ID254 = nil
      tree_for_char_literal255 = nil
      tree_for_NL256 = nil
      tree_for_char_literal257 = nil
      tree_for_NL258 = nil
      tree_for_NL260 = nil
      tree_for_char_literal261 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 460:4: 'foreach' '(' path 'as' ID ')' ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ )* '}'
        string_literal250 = match( T__48, TOKENS_FOLLOWING_T__48_IN_constraint_iterator_1457 )

        tree_for_string_literal250 = @adaptor.create_with_payload( string_literal250 )
        @adaptor.add_child( root_0, tree_for_string_literal250 )

        char_literal251 = match( T__36, TOKENS_FOLLOWING_T__36_IN_constraint_iterator_1459 )

        tree_for_char_literal251 = @adaptor.create_with_payload( char_literal251 )
        @adaptor.add_child( root_0, tree_for_char_literal251 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_iterator_1461 )
        path252 = path
        @state.following.pop
        @adaptor.add_child( root_0, path252.tree )
        string_literal253 = match( T__49, TOKENS_FOLLOWING_T__49_IN_constraint_iterator_1463 )

        tree_for_string_literal253 = @adaptor.create_with_payload( string_literal253 )
        @adaptor.add_child( root_0, tree_for_string_literal253 )

        __ID254__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_iterator_1465 )

        tree_for_ID254 = @adaptor.create_with_payload( __ID254__ )
        @adaptor.add_child( root_0, tree_for_ID254 )

        char_literal255 = match( T__38, TOKENS_FOLLOWING_T__38_IN_constraint_iterator_1467 )

        tree_for_char_literal255 = @adaptor.create_with_payload( char_literal255 )
        @adaptor.add_child( root_0, tree_for_char_literal255 )

        # at line 460:35: ( NL )*
        while true # decision 106
          alt_106 = 2
          look_106_0 = @input.peek( 1 )

          if ( look_106_0 == NL )
            alt_106 = 1

          end
          case alt_106
          when 1
            # at line 460:35: NL
            __NL256__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1469 )

            tree_for_NL256 = @adaptor.create_with_payload( __NL256__ )
            @adaptor.add_child( root_0, tree_for_NL256 )


          else
            break # out of loop for decision 106
          end
        end # loop for decision 106
        char_literal257 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_iterator_1472 )

        tree_for_char_literal257 = @adaptor.create_with_payload( char_literal257 )
        @adaptor.add_child( root_0, tree_for_char_literal257 )

        # at file 460:43: ( NL )+
        match_count_107 = 0
        while true
          alt_107 = 2
          look_107_0 = @input.peek( 1 )

          if ( look_107_0 == NL )
            alt_107 = 1

          end
          case alt_107
          when 1
            # at line 460:43: NL
            __NL258__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1474 )

            tree_for_NL258 = @adaptor.create_with_payload( __NL258__ )
            @adaptor.add_child( root_0, tree_for_NL258 )


          else
            match_count_107 > 0 and break
            eee = EarlyExit(107)


            raise eee
          end
          match_count_107 += 1
        end

        # --> action

        			id = self.next_id.to_s
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'iterator',
        				'_self' => id,
        				'_value' => '$.' + ( path252 && @input.to_s( path252.start, path252.stop ) ),
        				'_variable' => __ID254__.text
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
        # at line 480:3: ( constraint_statement ( NL )+ )*
        while true # decision 109
          alt_109 = 2
          look_109_0 = @input.peek( 1 )

          if ( look_109_0 == ID || look_109_0 == T__28 || look_109_0 == T__55 || look_109_0 == T__59 )
            alt_109 = 1

          end
          case alt_109
          when 1
            # at line 480:4: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_iterator_1484 )
            constraint_statement259 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement259.tree )
            # --> action

            			@now[( constraint_statement259.nil? ? nil : constraint_statement259.key )] = ( constraint_statement259.nil? ? nil : constraint_statement259.val )
            		
            # <-- action
            # at file 484:3: ( NL )+
            match_count_108 = 0
            while true
              alt_108 = 2
              look_108_0 = @input.peek( 1 )

              if ( look_108_0 == NL )
                alt_108 = 1

              end
              case alt_108
              when 1
                # at line 484:3: NL
                __NL260__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1492 )

                tree_for_NL260 = @adaptor.create_with_payload( __NL260__ )
                @adaptor.add_child( root_0, tree_for_NL260 )


              else
                match_count_108 > 0 and break
                eee = EarlyExit(108)


                raise eee
              end
              match_count_108 += 1
            end


          else
            break # out of loop for decision 109
          end
        end # loop for decision 109
        char_literal261 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_iterator_1499 )

        tree_for_char_literal261 = @adaptor.create_with_payload( char_literal261 )
        @adaptor.add_child( root_0, tree_for_char_literal261 )

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
    # 492:1: quantification_keyword : ( 'forall' | 'exist' | 'forsome' );
    # 
    def quantification_keyword
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = QuantificationKeywordReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set262 = nil

      tree_for_set262 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set262 = @input.look
        if @input.peek( 1 ).between?( T__50, T__52 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set262 ) )
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
    # 498:1: constraint_class_quantification : quantification_keyword '(' path 'as' ID ')' ( ( binary_comp | '=' ) NUMBER )? ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ | constraint_different ( NL )+ | constraint_iterator ( NL )+ )* '}' ;
    # 
    def constraint_class_quantification
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
      return_value = ConstraintClassQuantificationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal264 = nil
      string_literal266 = nil
      __ID267__ = nil
      char_literal268 = nil
      char_literal270 = nil
      __NUMBER271__ = nil
      __NL272__ = nil
      char_literal273 = nil
      __NL274__ = nil
      __NL276__ = nil
      __NL278__ = nil
      __NL280__ = nil
      char_literal281 = nil
      quantification_keyword263 = nil
      path265 = nil
      binary_comp269 = nil
      constraint_statement275 = nil
      constraint_different277 = nil
      constraint_iterator279 = nil

      tree_for_char_literal264 = nil
      tree_for_string_literal266 = nil
      tree_for_ID267 = nil
      tree_for_char_literal268 = nil
      tree_for_char_literal270 = nil
      tree_for_NUMBER271 = nil
      tree_for_NL272 = nil
      tree_for_char_literal273 = nil
      tree_for_NL274 = nil
      tree_for_NL276 = nil
      tree_for_NL278 = nil
      tree_for_NL280 = nil
      tree_for_char_literal281 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 499:4: quantification_keyword '(' path 'as' ID ')' ( ( binary_comp | '=' ) NUMBER )? ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ | constraint_different ( NL )+ | constraint_iterator ( NL )+ )* '}'
        @state.following.push( TOKENS_FOLLOWING_quantification_keyword_IN_constraint_class_quantification_1535 )
        quantification_keyword263 = quantification_keyword
        @state.following.pop
        @adaptor.add_child( root_0, quantification_keyword263.tree )
        char_literal264 = match( T__36, TOKENS_FOLLOWING_T__36_IN_constraint_class_quantification_1537 )

        tree_for_char_literal264 = @adaptor.create_with_payload( char_literal264 )
        @adaptor.add_child( root_0, tree_for_char_literal264 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_class_quantification_1539 )
        path265 = path
        @state.following.pop
        @adaptor.add_child( root_0, path265.tree )
        string_literal266 = match( T__49, TOKENS_FOLLOWING_T__49_IN_constraint_class_quantification_1541 )

        tree_for_string_literal266 = @adaptor.create_with_payload( string_literal266 )
        @adaptor.add_child( root_0, tree_for_string_literal266 )

        __ID267__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_class_quantification_1543 )

        tree_for_ID267 = @adaptor.create_with_payload( __ID267__ )
        @adaptor.add_child( root_0, tree_for_ID267 )

        char_literal268 = match( T__38, TOKENS_FOLLOWING_T__38_IN_constraint_class_quantification_1545 )

        tree_for_char_literal268 = @adaptor.create_with_payload( char_literal268 )
        @adaptor.add_child( root_0, tree_for_char_literal268 )

        # --> action

        			id = self.next_id.to_s
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => ( quantification_keyword263 && @input.to_s( quantification_keyword263.start, quantification_keyword263.stop ) ),
        				'_self' => id,
        				'_class' => ( path265 && @input.to_s( path265.start, path265.stop ) ),
        				'_variable' => __ID267__.text
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
        # at line 519:3: ( ( binary_comp | '=' ) NUMBER )?
        alt_111 = 2
        look_111_0 = @input.peek( 1 )

        if ( look_111_0 == T__53 || look_111_0.between?( T__71, T__74 ) )
          alt_111 = 1
        end
        case alt_111
        when 1
          # at line 519:5: ( binary_comp | '=' ) NUMBER
          # at line 519:5: ( binary_comp | '=' )
          alt_110 = 2
          look_110_0 = @input.peek( 1 )

          if ( look_110_0.between?( T__71, T__74 ) )
            alt_110 = 1
          elsif ( look_110_0 == T__53 )
            alt_110 = 2
          else
            raise NoViableAlternative( "", 110, 0 )
          end
          case alt_110
          when 1
            # at line 519:7: binary_comp
            @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_constraint_class_quantification_1557 )
            binary_comp269 = binary_comp
            @state.following.pop
            @adaptor.add_child( root_0, binary_comp269.tree )
            # --> action
            	@now['_count_operator'] = ( binary_comp269 && @input.to_s( binary_comp269.start, binary_comp269.stop ) )	
            # <-- action

          when 2
            # at line 521:6: '='
            char_literal270 = match( T__53, TOKENS_FOLLOWING_T__53_IN_constraint_class_quantification_1570 )

            tree_for_char_literal270 = @adaptor.create_with_payload( char_literal270 )
            @adaptor.add_child( root_0, tree_for_char_literal270 )

            # --> action
            	@now['_count_operator'] = '='	
            # <-- action

          end
          __NUMBER271__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_constraint_class_quantification_1586 )

          tree_for_NUMBER271 = @adaptor.create_with_payload( __NUMBER271__ )
          @adaptor.add_child( root_0, tree_for_NUMBER271 )

          # --> action
          	@now['_count_value'] = __NUMBER271__.text.to_i	
          # <-- action

        end
        # at line 527:3: ( NL )*
        while true # decision 112
          alt_112 = 2
          look_112_0 = @input.peek( 1 )

          if ( look_112_0 == NL )
            alt_112 = 1

          end
          case alt_112
          when 1
            # at line 527:3: NL
            __NL272__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1600 )

            tree_for_NL272 = @adaptor.create_with_payload( __NL272__ )
            @adaptor.add_child( root_0, tree_for_NL272 )


          else
            break # out of loop for decision 112
          end
        end # loop for decision 112
        char_literal273 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_class_quantification_1603 )

        tree_for_char_literal273 = @adaptor.create_with_payload( char_literal273 )
        @adaptor.add_child( root_0, tree_for_char_literal273 )

        # at file 527:11: ( NL )+
        match_count_113 = 0
        while true
          alt_113 = 2
          look_113_0 = @input.peek( 1 )

          if ( look_113_0 == NL )
            alt_113 = 1

          end
          case alt_113
          when 1
            # at line 527:11: NL
            __NL274__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1605 )

            tree_for_NL274 = @adaptor.create_with_payload( __NL274__ )
            @adaptor.add_child( root_0, tree_for_NL274 )


          else
            match_count_113 > 0 and break
            eee = EarlyExit(113)


            raise eee
          end
          match_count_113 += 1
        end

        # at line 528:3: ( constraint_statement ( NL )+ | constraint_different ( NL )+ | constraint_iterator ( NL )+ )*
        while true # decision 117
          alt_117 = 4
          case look_117 = @input.peek( 1 )
          when ID, T__28, T__55, T__59 then alt_117 = 1
          when T__54 then alt_117 = 2
          when T__48 then alt_117 = 3
          end
          case alt_117
          when 1
            # at line 528:5: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_class_quantification_1612 )
            constraint_statement275 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement275.tree )
            # --> action
            	@now[( constraint_statement275.nil? ? nil : constraint_statement275.key )] = ( constraint_statement275.nil? ? nil : constraint_statement275.val )	
            # <-- action
            # at file 530:4: ( NL )+
            match_count_114 = 0
            while true
              alt_114 = 2
              look_114_0 = @input.peek( 1 )

              if ( look_114_0 == NL )
                alt_114 = 1

              end
              case alt_114
              when 1
                # at line 530:4: NL
                __NL276__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1622 )

                tree_for_NL276 = @adaptor.create_with_payload( __NL276__ )
                @adaptor.add_child( root_0, tree_for_NL276 )


              else
                match_count_114 > 0 and break
                eee = EarlyExit(114)


                raise eee
              end
              match_count_114 += 1
            end


          when 2
            # at line 531:5: constraint_different ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_different_IN_constraint_class_quantification_1629 )
            constraint_different277 = constraint_different
            @state.following.pop
            @adaptor.add_child( root_0, constraint_different277.tree )
            # at file 531:26: ( NL )+
            match_count_115 = 0
            while true
              alt_115 = 2
              look_115_0 = @input.peek( 1 )

              if ( look_115_0 == NL )
                alt_115 = 1

              end
              case alt_115
              when 1
                # at line 531:26: NL
                __NL278__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1631 )

                tree_for_NL278 = @adaptor.create_with_payload( __NL278__ )
                @adaptor.add_child( root_0, tree_for_NL278 )


              else
                match_count_115 > 0 and break
                eee = EarlyExit(115)


                raise eee
              end
              match_count_115 += 1
            end


          when 3
            # at line 532:5: constraint_iterator ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_iterator_IN_constraint_class_quantification_1638 )
            constraint_iterator279 = constraint_iterator
            @state.following.pop
            @adaptor.add_child( root_0, constraint_iterator279.tree )
            # at file 532:25: ( NL )+
            match_count_116 = 0
            while true
              alt_116 = 2
              look_116_0 = @input.peek( 1 )

              if ( look_116_0 == NL )
                alt_116 = 1

              end
              case alt_116
              when 1
                # at line 532:25: NL
                __NL280__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1640 )

                tree_for_NL280 = @adaptor.create_with_payload( __NL280__ )
                @adaptor.add_child( root_0, tree_for_NL280 )


              else
                match_count_116 > 0 and break
                eee = EarlyExit(116)


                raise eee
              end
              match_count_116 += 1
            end


          else
            break # out of loop for decision 117
          end
        end # loop for decision 117
        char_literal281 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_class_quantification_1648 )

        tree_for_char_literal281 = @adaptor.create_with_payload( char_literal281 )
        @adaptor.add_child( root_0, tree_for_char_literal281 )

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
    # 538:1: constraint_different : ':different' '(' path ')' ;
    # 
    def constraint_different
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )
      return_value = ConstraintDifferentReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal282 = nil
      char_literal283 = nil
      char_literal285 = nil
      path284 = nil

      tree_for_string_literal282 = nil
      tree_for_char_literal283 = nil
      tree_for_char_literal285 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 539:4: ':different' '(' path ')'
        string_literal282 = match( T__54, TOKENS_FOLLOWING_T__54_IN_constraint_different_1667 )

        tree_for_string_literal282 = @adaptor.create_with_payload( string_literal282 )
        @adaptor.add_child( root_0, tree_for_string_literal282 )

        char_literal283 = match( T__36, TOKENS_FOLLOWING_T__36_IN_constraint_different_1669 )

        tree_for_char_literal283 = @adaptor.create_with_payload( char_literal283 )
        @adaptor.add_child( root_0, tree_for_char_literal283 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_different_1671 )
        path284 = path
        @state.following.pop
        @adaptor.add_child( root_0, path284.tree )
        char_literal285 = match( T__38, TOKENS_FOLLOWING_T__38_IN_constraint_different_1673 )

        tree_for_char_literal285 = @adaptor.create_with_payload( char_literal285 )
        @adaptor.add_child( root_0, tree_for_char_literal285 )

        # --> action

        			id = self.next_id.to_s
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'different',
        				'_self' => id,
        				'_path' => ( path284 && @input.to_s( path284.start, path284.stop ) )
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
    # 551:1: constraint_statement returns [key, val] : ( reference | 'not' reference | reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | conditional_constraint | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | reference binary_comp comp_value | total_constraint );
    # 
    def constraint_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
      return_value = ConstraintStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal287 = nil
      __NULL294__ = nil
      __NULL300__ = nil
      string_literal303 = nil
      string_literal304 = nil
      set307 = nil
      string_literal308 = nil
      reference286 = nil
      reference288 = nil
      reference289 = nil
      equals_op290 = nil
      value291 = nil
      reference292 = nil
      equals_op293 = nil
      reference295 = nil
      not_equals_op296 = nil
      value297 = nil
      reference298 = nil
      not_equals_op299 = nil
      conditional_constraint301 = nil
      reference302 = nil
      set_value305 = nil
      reference306 = nil
      set_value309 = nil
      reference310 = nil
      binary_comp311 = nil
      comp_value312 = nil
      total_constraint313 = nil

      tree_for_string_literal287 = nil
      tree_for_NULL294 = nil
      tree_for_NULL300 = nil
      tree_for_string_literal303 = nil
      tree_for_string_literal304 = nil
      tree_for_set307 = nil
      tree_for_string_literal308 = nil

      begin
        # at line 552:2: ( reference | 'not' reference | reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | conditional_constraint | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | reference binary_comp comp_value | total_constraint )
        alt_119 = 11
        alt_119 = @dfa119.predict( @input )
        case alt_119
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 552:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1692 )
          reference286 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference286.tree )
          # --> action

          			return_value.key = ( reference286.nil? ? nil : reference286.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => true }
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 557:4: 'not' reference
          string_literal287 = match( T__55, TOKENS_FOLLOWING_T__55_IN_constraint_statement_1701 )

          tree_for_string_literal287 = @adaptor.create_with_payload( string_literal287 )
          @adaptor.add_child( root_0, tree_for_string_literal287 )

          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1703 )
          reference288 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference288.tree )
          # --> action

          			return_value.key = ( reference288.nil? ? nil : reference288.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => false }
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 562:4: reference equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1712 )
          reference289 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference289.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1714 )
          equals_op290 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op290.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_1716 )
          value291 = value
          @state.following.pop
          @adaptor.add_child( root_0, value291.tree )
          # --> action

          			return_value.key = ( reference289.nil? ? nil : reference289.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => ( value291.nil? ? nil : value291.val ) }
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 567:4: reference equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1725 )
          reference292 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference292.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1727 )
          equals_op293 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op293.tree )
          __NULL294__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_constraint_statement_1729 )

          tree_for_NULL294 = @adaptor.create_with_payload( __NULL294__ )
          @adaptor.add_child( root_0, tree_for_NULL294 )

          # --> action

          			return_value.key = ( reference292.nil? ? nil : reference292.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => self.null_value }
          		
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 572:4: reference not_equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1738 )
          reference295 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference295.tree )
          @state.following.push( TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1740 )
          not_equals_op296 = not_equals_op
          @state.following.pop
          @adaptor.add_child( root_0, not_equals_op296.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_1742 )
          value297 = value
          @state.following.pop
          @adaptor.add_child( root_0, value297.tree )
          # --> action

          			return_value.key = ( reference295.nil? ? nil : reference295.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-equals', '_value' => ( value297.nil? ? nil : value297.val ) }
          		
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 577:4: reference not_equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1751 )
          reference298 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference298.tree )
          @state.following.push( TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1753 )
          not_equals_op299 = not_equals_op
          @state.following.pop
          @adaptor.add_child( root_0, not_equals_op299.tree )
          __NULL300__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_constraint_statement_1755 )

          tree_for_NULL300 = @adaptor.create_with_payload( __NULL300__ )
          @adaptor.add_child( root_0, tree_for_NULL300 )

          # --> action

          			return_value.key = ( reference298.nil? ? nil : reference298.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-equals', '_value' => self.null_value }
          		
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 582:4: conditional_constraint
          @state.following.push( TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_1764 )
          conditional_constraint301 = conditional_constraint
          @state.following.pop
          @adaptor.add_child( root_0, conditional_constraint301.tree )
          # --> action

          			return_value.key = ( conditional_constraint301.nil? ? nil : conditional_constraint301.key )
          			return_value.val = ( conditional_constraint301.nil? ? nil : conditional_constraint301.val )
          		
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 587:4: reference ( 'is' )? 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1773 )
          reference302 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference302.tree )
          # at line 587:14: ( 'is' )?
          alt_118 = 2
          look_118_0 = @input.peek( 1 )

          if ( look_118_0 == T__56 )
            alt_118 = 1
          end
          case alt_118
          when 1
            # at line 587:14: 'is'
            string_literal303 = match( T__56, TOKENS_FOLLOWING_T__56_IN_constraint_statement_1775 )

            tree_for_string_literal303 = @adaptor.create_with_payload( string_literal303 )
            @adaptor.add_child( root_0, tree_for_string_literal303 )


          end
          string_literal304 = match( T__57, TOKENS_FOLLOWING_T__57_IN_constraint_statement_1778 )

          tree_for_string_literal304 = @adaptor.create_with_payload( string_literal304 )
          @adaptor.add_child( root_0, tree_for_string_literal304 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_1780 )
          set_value305 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value305.tree )
          # --> action

          			c_or = { '_context' => 'constraint', '_type' => 'or', '_parent' => @now }
          			( set_value305.nil? ? nil : set_value305.val ).each { |v|
          				id = self.next_id.to_s
          				item = { '_context' => 'constraint', '_type' => 'and', '_parent' => c_or }
          				item[( reference302.nil? ? nil : reference302.val )] = { '_context' => 'constraint', '_type' => 'equals', '_value' => v }
          				c_or[id] = item
          			}
          			return_value.key = self.next_id.to_s
          			return_value.val = c_or
          		
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 599:4: reference ( 'isnt' | 'not' ) 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1789 )
          reference306 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference306.tree )
          set307 = @input.look
          if @input.peek(1) == T__55 || @input.peek(1) == T__58
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set307 ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          string_literal308 = match( T__57, TOKENS_FOLLOWING_T__57_IN_constraint_statement_1797 )

          tree_for_string_literal308 = @adaptor.create_with_payload( string_literal308 )
          @adaptor.add_child( root_0, tree_for_string_literal308 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_1799 )
          set_value309 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value309.tree )
          # --> action

          			c_and = { '_context'=>'constraint', '_type'=>'and', '_parent'=>@now }
          			( set_value309.nil? ? nil : set_value309.val ).each { |v|
          				id = self.next_id.to_s
          				item = { '_context'=>'constraint', '_type'=>'and'}
          				item[( reference306.nil? ? nil : reference306.val )] = { '_context'=>'constraint', '_type'=>'not-equals', '_value'=>v }
          				c_and[id] = item
          			}
          			return_value.key = self.next_id.to_s
          			return_value.val = c_and

          			#return_value.key = ( reference306.nil? ? nil : reference306.val )
          			#return_value.val = { '_context' => 'constraint', '_type' => 'not-in', '_value' => ( set_value309.nil? ? nil : set_value309.val ) }
          		
          # <-- action

        when 10
          root_0 = @adaptor.create_flat_list


          # at line 614:4: reference binary_comp comp_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1808 )
          reference310 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference310.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_1810 )
          binary_comp311 = binary_comp
          @state.following.pop
          @adaptor.add_child( root_0, binary_comp311.tree )
          @state.following.push( TOKENS_FOLLOWING_comp_value_IN_constraint_statement_1812 )
          comp_value312 = comp_value
          @state.following.pop
          @adaptor.add_child( root_0, comp_value312.tree )
          # --> action

          			return_value.key = ( reference310.nil? ? nil : reference310.val )
          			return_value.val = { '_context' => 'constraint', '_type' => ( binary_comp311 && @input.to_s( binary_comp311.start, binary_comp311.stop ) ), '_value' => ( comp_value312.nil? ? nil : comp_value312.val ) }
          		
          # <-- action

        when 11
          root_0 = @adaptor.create_flat_list


          # at line 619:4: total_constraint
          @state.following.push( TOKENS_FOLLOWING_total_constraint_IN_constraint_statement_1821 )
          total_constraint313 = total_constraint
          @state.following.pop
          @adaptor.add_child( root_0, total_constraint313.tree )

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
    # 622:1: total_constraint : 'total(' total_statement ')' binary_comp NUMBER ;
    # 
    def total_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
      return_value = TotalConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal314 = nil
      char_literal316 = nil
      __NUMBER318__ = nil
      total_statement315 = nil
      binary_comp317 = nil

      tree_for_string_literal314 = nil
      tree_for_char_literal316 = nil
      tree_for_NUMBER318 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 623:4: 'total(' total_statement ')' binary_comp NUMBER
        string_literal314 = match( T__59, TOKENS_FOLLOWING_T__59_IN_total_constraint_1832 )

        tree_for_string_literal314 = @adaptor.create_with_payload( string_literal314 )
        @adaptor.add_child( root_0, tree_for_string_literal314 )

        @state.following.push( TOKENS_FOLLOWING_total_statement_IN_total_constraint_1834 )
        total_statement315 = total_statement
        @state.following.pop
        @adaptor.add_child( root_0, total_statement315.tree )
        char_literal316 = match( T__38, TOKENS_FOLLOWING_T__38_IN_total_constraint_1836 )

        tree_for_char_literal316 = @adaptor.create_with_payload( char_literal316 )
        @adaptor.add_child( root_0, tree_for_char_literal316 )

        @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_total_constraint_1838 )
        binary_comp317 = binary_comp
        @state.following.pop
        @adaptor.add_child( root_0, binary_comp317.tree )
        __NUMBER318__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_total_constraint_1840 )

        tree_for_NUMBER318 = @adaptor.create_with_payload( __NUMBER318__ )
        @adaptor.add_child( root_0, tree_for_NUMBER318 )

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
    # 626:1: total_statement : reference equals_op value ;
    # 
    def total_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )
      return_value = TotalStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      reference319 = nil
      equals_op320 = nil
      value321 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 627:4: reference equals_op value
        @state.following.push( TOKENS_FOLLOWING_reference_IN_total_statement_1851 )
        reference319 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference319.tree )
        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_total_statement_1853 )
        equals_op320 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op320.tree )
        @state.following.push( TOKENS_FOLLOWING_value_IN_total_statement_1855 )
        value321 = value
        @state.following.pop
        @adaptor.add_child( root_0, value321.tree )
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
    # 630:1: comp_value returns [val] : ( NUMBER | reference );
    # 
    def comp_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )
      return_value = CompValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NUMBER322__ = nil
      reference323 = nil

      tree_for_NUMBER322 = nil

      begin
        # at line 631:2: ( NUMBER | reference )
        alt_120 = 2
        look_120_0 = @input.peek( 1 )

        if ( look_120_0 == NUMBER )
          alt_120 = 1
        elsif ( look_120_0 == ID )
          alt_120 = 2
        else
          raise NoViableAlternative( "", 120, 0 )
        end
        case alt_120
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 631:4: NUMBER
          __NUMBER322__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_comp_value_1870 )

          tree_for_NUMBER322 = @adaptor.create_with_payload( __NUMBER322__ )
          @adaptor.add_child( root_0, tree_for_NUMBER322 )

          # --> action
          	return_value.val = __NUMBER322__.text.to_i	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 633:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_comp_value_1879 )
          reference323 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference323.tree )
          # --> action
          	return_value.val = ( reference323.nil? ? nil : reference323.val )	
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
    # 637:1: conditional_constraint returns [key, val] : 'if' conditional_constraint_if_part conditional_constraint_then_part ;
    # 
    def conditional_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )
      return_value = ConditionalConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal324 = nil
      conditional_constraint_if_part325 = nil
      conditional_constraint_then_part326 = nil

      tree_for_string_literal324 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 638:4: 'if' conditional_constraint_if_part conditional_constraint_then_part
        string_literal324 = match( T__28, TOKENS_FOLLOWING_T__28_IN_conditional_constraint_1898 )

        tree_for_string_literal324 = @adaptor.create_with_payload( string_literal324 )
        @adaptor.add_child( root_0, tree_for_string_literal324 )

        # --> action

        			return_value.key = id = self.next_id.to_s
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'or'
        			}
        			@now = @now[id]
        		
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_conditional_constraint_if_part_IN_conditional_constraint_1906 )
        conditional_constraint_if_part325 = conditional_constraint_if_part
        @state.following.pop
        @adaptor.add_child( root_0, conditional_constraint_if_part325.tree )
        @state.following.push( TOKENS_FOLLOWING_conditional_constraint_then_part_IN_conditional_constraint_1910 )
        conditional_constraint_then_part326 = conditional_constraint_then_part
        @state.following.pop
        @adaptor.add_child( root_0, conditional_constraint_then_part326.tree )
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
    # 652:1: conditional_constraint_if_part : ( constraint_statement ( NL )* | '{' ( NL )+ constraint_body '}' ( NL )* );
    # 
    def conditional_constraint_if_part
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )
      return_value = ConditionalConstraintIfPartReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL328__ = nil
      char_literal329 = nil
      __NL330__ = nil
      char_literal332 = nil
      __NL333__ = nil
      constraint_statement327 = nil
      constraint_body331 = nil

      tree_for_NL328 = nil
      tree_for_char_literal329 = nil
      tree_for_NL330 = nil
      tree_for_char_literal332 = nil
      tree_for_NL333 = nil

      begin
        # at line 653:2: ( constraint_statement ( NL )* | '{' ( NL )+ constraint_body '}' ( NL )* )
        alt_124 = 2
        look_124_0 = @input.peek( 1 )

        if ( look_124_0 == ID || look_124_0 == T__28 || look_124_0 == T__55 || look_124_0 == T__59 )
          alt_124 = 1
        elsif ( look_124_0 == T__20 )
          alt_124 = 2
        else
          raise NoViableAlternative( "", 124, 0 )
        end
        case alt_124
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 653:4: constraint_statement ( NL )*
          @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_if_part_1925 )
          constraint_statement327 = constraint_statement
          @state.following.pop
          @adaptor.add_child( root_0, constraint_statement327.tree )
          # at line 653:25: ( NL )*
          while true # decision 121
            alt_121 = 2
            look_121_0 = @input.peek( 1 )

            if ( look_121_0 == NL )
              alt_121 = 1

            end
            case alt_121
            when 1
              # at line 653:25: NL
              __NL328__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditional_constraint_if_part_1927 )

              tree_for_NL328 = @adaptor.create_with_payload( __NL328__ )
              @adaptor.add_child( root_0, tree_for_NL328 )


            else
              break # out of loop for decision 121
            end
          end # loop for decision 121
          # --> action

          			id = self.next_id
          			@now[id] = { '_parent' => @now,
          				'_context' => 'constraint',
          				'_type' => 'not'
          			}
          			@now[id][( constraint_statement327.nil? ? nil : constraint_statement327.key )] = ( constraint_statement327.nil? ? nil : constraint_statement327.val )
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 662:4: '{' ( NL )+ constraint_body '}' ( NL )*
          char_literal329 = match( T__20, TOKENS_FOLLOWING_T__20_IN_conditional_constraint_if_part_1937 )

          tree_for_char_literal329 = @adaptor.create_with_payload( char_literal329 )
          @adaptor.add_child( root_0, tree_for_char_literal329 )

          # --> action

          			id = self.next_id
          			@now[id] = self.create_constraint(id, 'not')
          			@now = @now[id]
          		
          # <-- action
          # at file 668:3: ( NL )+
          match_count_122 = 0
          while true
            alt_122 = 2
            look_122_0 = @input.peek( 1 )

            if ( look_122_0 == NL )
              alt_122 = 1

            end
            case alt_122
            when 1
              # at line 668:3: NL
              __NL330__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditional_constraint_if_part_1945 )

              tree_for_NL330 = @adaptor.create_with_payload( __NL330__ )
              @adaptor.add_child( root_0, tree_for_NL330 )


            else
              match_count_122 > 0 and break
              eee = EarlyExit(122)


              raise eee
            end
            match_count_122 += 1
          end

          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_conditional_constraint_if_part_1948 )
          constraint_body331 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body331.tree )
          char_literal332 = match( T__21, TOKENS_FOLLOWING_T__21_IN_conditional_constraint_if_part_1952 )

          tree_for_char_literal332 = @adaptor.create_with_payload( char_literal332 )
          @adaptor.add_child( root_0, tree_for_char_literal332 )

          # at line 669:7: ( NL )*
          while true # decision 123
            alt_123 = 2
            look_123_0 = @input.peek( 1 )

            if ( look_123_0 == NL )
              alt_123 = 1

            end
            case alt_123
            when 1
              # at line 669:7: NL
              __NL333__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditional_constraint_if_part_1954 )

              tree_for_NL333 = @adaptor.create_with_payload( __NL333__ )
              @adaptor.add_child( root_0, tree_for_NL333 )


            else
              break # out of loop for decision 123
            end
          end # loop for decision 123
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
    # 673:1: conditional_constraint_then_part : ( 'then' constraint_statement | 'then' '{' ( NL )+ constraint_body '}' );
    # 
    def conditional_constraint_then_part
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )
      return_value = ConditionalConstraintThenPartReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal334 = nil
      string_literal336 = nil
      char_literal337 = nil
      __NL338__ = nil
      char_literal340 = nil
      constraint_statement335 = nil
      constraint_body339 = nil

      tree_for_string_literal334 = nil
      tree_for_string_literal336 = nil
      tree_for_char_literal337 = nil
      tree_for_NL338 = nil
      tree_for_char_literal340 = nil

      begin
        # at line 674:2: ( 'then' constraint_statement | 'then' '{' ( NL )+ constraint_body '}' )
        alt_126 = 2
        look_126_0 = @input.peek( 1 )

        if ( look_126_0 == T__29 )
          look_126_1 = @input.peek( 2 )

          if ( look_126_1 == ID || look_126_1 == T__28 || look_126_1 == T__55 || look_126_1 == T__59 )
            alt_126 = 1
          elsif ( look_126_1 == T__20 )
            alt_126 = 2
          else
            raise NoViableAlternative( "", 126, 1 )
          end
        else
          raise NoViableAlternative( "", 126, 0 )
        end
        case alt_126
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 674:4: 'then' constraint_statement
          string_literal334 = match( T__29, TOKENS_FOLLOWING_T__29_IN_conditional_constraint_then_part_1970 )

          tree_for_string_literal334 = @adaptor.create_with_payload( string_literal334 )
          @adaptor.add_child( root_0, tree_for_string_literal334 )

          @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_part_1972 )
          constraint_statement335 = constraint_statement
          @state.following.pop
          @adaptor.add_child( root_0, constraint_statement335.tree )
          # --> action

          			id = self.next_id
          			@now[id] = { '_parent' => @now,
          				'_context' => 'constraint',
          				'_type' => 'and'
          			}
          			@now[id][( constraint_statement335.nil? ? nil : constraint_statement335.key )] = ( constraint_statement335.nil? ? nil : constraint_statement335.val )
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 683:4: 'then' '{' ( NL )+ constraint_body '}'
          string_literal336 = match( T__29, TOKENS_FOLLOWING_T__29_IN_conditional_constraint_then_part_1981 )

          tree_for_string_literal336 = @adaptor.create_with_payload( string_literal336 )
          @adaptor.add_child( root_0, tree_for_string_literal336 )

          # --> action

          			id = self.next_id
          			@now[id] = { '_parent' => @now,
          				'_context' => 'constraint',
          				'_type' => 'and'
          			}
          			@now = @now[id]
          		
          # <-- action
          char_literal337 = match( T__20, TOKENS_FOLLOWING_T__20_IN_conditional_constraint_then_part_1989 )

          tree_for_char_literal337 = @adaptor.create_with_payload( char_literal337 )
          @adaptor.add_child( root_0, tree_for_char_literal337 )

          # at file 692:7: ( NL )+
          match_count_125 = 0
          while true
            alt_125 = 2
            look_125_0 = @input.peek( 1 )

            if ( look_125_0 == NL )
              alt_125 = 1

            end
            case alt_125
            when 1
              # at line 692:7: NL
              __NL338__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditional_constraint_then_part_1991 )

              tree_for_NL338 = @adaptor.create_with_payload( __NL338__ )
              @adaptor.add_child( root_0, tree_for_NL338 )


            else
              match_count_125 > 0 and break
              eee = EarlyExit(125)


              raise eee
            end
            match_count_125 += 1
          end

          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_conditional_constraint_then_part_1994 )
          constraint_body339 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body339.tree )
          char_literal340 = match( T__21, TOKENS_FOLLOWING_T__21_IN_conditional_constraint_then_part_1996 )

          tree_for_char_literal340 = @adaptor.create_with_payload( char_literal340 )
          @adaptor.add_child( root_0, tree_for_char_literal340 )

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
    # 696:1: mutation_body : ( ( mutation_statement | mutation_iterator ) ( NL )+ )* ;
    # 
    def mutation_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )
      return_value = MutationBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL343__ = nil
      mutation_statement341 = nil
      mutation_iterator342 = nil

      tree_for_NL343 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 697:4: ( ( mutation_statement | mutation_iterator ) ( NL )+ )*
        # at line 697:4: ( ( mutation_statement | mutation_iterator ) ( NL )+ )*
        while true # decision 129
          alt_129 = 2
          look_129_0 = @input.peek( 1 )

          if ( look_129_0 == ID || look_129_0 == T__48 || look_129_0 == T__61 )
            alt_129 = 1

          end
          case alt_129
          when 1
            # at line 698:4: ( mutation_statement | mutation_iterator ) ( NL )+
            # at line 698:4: ( mutation_statement | mutation_iterator )
            alt_127 = 2
            look_127_0 = @input.peek( 1 )

            if ( look_127_0 == ID || look_127_0 == T__61 )
              alt_127 = 1
            elsif ( look_127_0 == T__48 )
              alt_127 = 2
            else
              raise NoViableAlternative( "", 127, 0 )
            end
            case alt_127
            when 1
              # at line 698:6: mutation_statement
              @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_mutation_body_2018 )
              mutation_statement341 = mutation_statement
              @state.following.pop
              @adaptor.add_child( root_0, mutation_statement341.tree )
              # --> action
              	@now[( mutation_statement341.nil? ? nil : mutation_statement341.key )] = ( mutation_statement341.nil? ? nil : mutation_statement341.val )	
              # <-- action

            when 2
              # at line 700:6: mutation_iterator
              @state.following.push( TOKENS_FOLLOWING_mutation_iterator_IN_mutation_body_2031 )
              mutation_iterator342 = mutation_iterator
              @state.following.pop
              @adaptor.add_child( root_0, mutation_iterator342.tree )

            end
            # at file 702:3: ( NL )+
            match_count_128 = 0
            while true
              alt_128 = 2
              look_128_0 = @input.peek( 1 )

              if ( look_128_0 == NL )
                alt_128 = 1

              end
              case alt_128
              when 1
                # at line 702:3: NL
                __NL343__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_body_2040 )

                tree_for_NL343 = @adaptor.create_with_payload( __NL343__ )
                @adaptor.add_child( root_0, tree_for_NL343 )


              else
                match_count_128 > 0 and break
                eee = EarlyExit(128)


                raise eee
              end
              match_count_128 += 1
            end


          else
            break # out of loop for decision 129
          end
        end # loop for decision 129
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
    # 705:1: mutation_iterator : 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( mutation_statement ( NL )+ )* '}' ;
    # 
    def mutation_iterator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )
      return_value = MutationIteratorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal344 = nil
      string_literal346 = nil
      __ID347__ = nil
      __NL348__ = nil
      char_literal349 = nil
      __NL350__ = nil
      __NL352__ = nil
      char_literal353 = nil
      path345 = nil
      mutation_statement351 = nil

      tree_for_string_literal344 = nil
      tree_for_string_literal346 = nil
      tree_for_ID347 = nil
      tree_for_NL348 = nil
      tree_for_char_literal349 = nil
      tree_for_NL350 = nil
      tree_for_NL352 = nil
      tree_for_char_literal353 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 706:4: 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( mutation_statement ( NL )+ )* '}'
        string_literal344 = match( T__48, TOKENS_FOLLOWING_T__48_IN_mutation_iterator_2055 )

        tree_for_string_literal344 = @adaptor.create_with_payload( string_literal344 )
        @adaptor.add_child( root_0, tree_for_string_literal344 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_iterator_2057 )
        path345 = path
        @state.following.pop
        @adaptor.add_child( root_0, path345.tree )
        string_literal346 = match( T__49, TOKENS_FOLLOWING_T__49_IN_mutation_iterator_2059 )

        tree_for_string_literal346 = @adaptor.create_with_payload( string_literal346 )
        @adaptor.add_child( root_0, tree_for_string_literal346 )

        __ID347__ = match( ID, TOKENS_FOLLOWING_ID_IN_mutation_iterator_2061 )

        tree_for_ID347 = @adaptor.create_with_payload( __ID347__ )
        @adaptor.add_child( root_0, tree_for_ID347 )

        # at line 706:27: ( NL )*
        while true # decision 130
          alt_130 = 2
          look_130_0 = @input.peek( 1 )

          if ( look_130_0 == NL )
            alt_130 = 1

          end
          case alt_130
          when 1
            # at line 706:27: NL
            __NL348__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_2063 )

            tree_for_NL348 = @adaptor.create_with_payload( __NL348__ )
            @adaptor.add_child( root_0, tree_for_NL348 )


          else
            break # out of loop for decision 130
          end
        end # loop for decision 130
        char_literal349 = match( T__20, TOKENS_FOLLOWING_T__20_IN_mutation_iterator_2066 )

        tree_for_char_literal349 = @adaptor.create_with_payload( char_literal349 )
        @adaptor.add_child( root_0, tree_for_char_literal349 )

        # at file 706:35: ( NL )+
        match_count_131 = 0
        while true
          alt_131 = 2
          look_131_0 = @input.peek( 1 )

          if ( look_131_0 == NL )
            alt_131 = 1

          end
          case alt_131
          when 1
            # at line 706:35: NL
            __NL350__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_2068 )

            tree_for_NL350 = @adaptor.create_with_payload( __NL350__ )
            @adaptor.add_child( root_0, tree_for_NL350 )


          else
            match_count_131 > 0 and break
            eee = EarlyExit(131)


            raise eee
          end
          match_count_131 += 1
        end

        # --> action

        			id = self.to_ref(( path345 && @input.to_s( path345.start, path345.stop ) ))
        			@now[id] = { '_parent' => @now,
        				'_context' => 'iterator',
        				'_self' => id,
        				'_variable' => __ID347__.text
        			}
        			@now = @now[id]
        		
        # <-- action
        # at line 716:3: ( mutation_statement ( NL )+ )*
        while true # decision 133
          alt_133 = 2
          look_133_0 = @input.peek( 1 )

          if ( look_133_0 == ID || look_133_0 == T__61 )
            alt_133 = 1

          end
          case alt_133
          when 1
            # at line 716:4: mutation_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_mutation_iterator_2078 )
            mutation_statement351 = mutation_statement
            @state.following.pop
            @adaptor.add_child( root_0, mutation_statement351.tree )
            # --> action
            	@now[( mutation_statement351.nil? ? nil : mutation_statement351.key )] = ( mutation_statement351.nil? ? nil : mutation_statement351.val )	
            # <-- action
            # at file 718:3: ( NL )+
            match_count_132 = 0
            while true
              alt_132 = 2
              look_132_0 = @input.peek( 1 )

              if ( look_132_0 == NL )
                alt_132 = 1

              end
              case alt_132
              when 1
                # at line 718:3: NL
                __NL352__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_2086 )

                tree_for_NL352 = @adaptor.create_with_payload( __NL352__ )
                @adaptor.add_child( root_0, tree_for_NL352 )


              else
                match_count_132 > 0 and break
                eee = EarlyExit(132)


                raise eee
              end
              match_count_132 += 1
            end


          else
            break # out of loop for decision 133
          end
        end # loop for decision 133
        char_literal353 = match( T__21, TOKENS_FOLLOWING_T__21_IN_mutation_iterator_2093 )

        tree_for_char_literal353 = @adaptor.create_with_payload( char_literal353 )
        @adaptor.add_child( root_0, tree_for_char_literal353 )

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
    # 723:1: mutation_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' );
    # 
    def mutation_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )
      return_value = MutationStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL359__ = nil
      __NUMBER362__ = nil
      string_literal364 = nil
      string_literal365 = nil
      string_literal368 = nil
      string_literal371 = nil
      char_literal373 = nil
      string_literal375 = nil
      char_literal377 = nil
      reference354 = nil
      equals_op355 = nil
      value356 = nil
      reference357 = nil
      equals_op358 = nil
      reference360 = nil
      binary_op361 = nil
      reference363 = nil
      path366 = nil
      object_body367 = nil
      path369 = nil
      reference370 = nil
      value372 = nil
      reference374 = nil
      value376 = nil

      tree_for_NULL359 = nil
      tree_for_NUMBER362 = nil
      tree_for_string_literal364 = nil
      tree_for_string_literal365 = nil
      tree_for_string_literal368 = nil
      tree_for_string_literal371 = nil
      tree_for_char_literal373 = nil
      tree_for_string_literal375 = nil
      tree_for_char_literal377 = nil

      begin
        # at line 724:2: ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' )
        alt_135 = 7
        alt_135 = @dfa135.predict( @input )
        case alt_135
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 724:4: reference equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2112 )
          reference354 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference354.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_mutation_statement_2114 )
          equals_op355 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op355.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_2116 )
          value356 = value
          @state.following.pop
          @adaptor.add_child( root_0, value356.tree )
          # --> action

          			return_value.key = ( reference354.nil? ? nil : reference354.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'equals',
          				'_value' => ( value356.nil? ? nil : value356.val )
          			}
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 732:4: reference equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2125 )
          reference357 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference357.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_mutation_statement_2127 )
          equals_op358 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op358.tree )
          __NULL359__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_mutation_statement_2129 )

          tree_for_NULL359 = @adaptor.create_with_payload( __NULL359__ )
          @adaptor.add_child( root_0, tree_for_NULL359 )

          # --> action

          			return_value.key = ( reference357.nil? ? nil : reference357.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'equals',
          				'_value' => self.null_value
          			}
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 740:4: reference binary_op NUMBER
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2138 )
          reference360 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference360.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_op_IN_mutation_statement_2140 )
          binary_op361 = binary_op
          @state.following.pop
          @adaptor.add_child( root_0, binary_op361.tree )
          __NUMBER362__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_mutation_statement_2142 )

          tree_for_NUMBER362 = @adaptor.create_with_payload( __NUMBER362__ )
          @adaptor.add_child( root_0, tree_for_NUMBER362 )

          # --> action

          			return_value.key = ( reference360.nil? ? nil : reference360.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => ( binary_op361 && @input.to_s( binary_op361.start, binary_op361.stop ) ),
          				'_value' => __NUMBER362__.text.to_i
          			}
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 748:4: reference 'is' 'new' path ( object_body )?
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2151 )
          reference363 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference363.tree )
          string_literal364 = match( T__56, TOKENS_FOLLOWING_T__56_IN_mutation_statement_2153 )

          tree_for_string_literal364 = @adaptor.create_with_payload( string_literal364 )
          @adaptor.add_child( root_0, tree_for_string_literal364 )

          string_literal365 = match( T__60, TOKENS_FOLLOWING_T__60_IN_mutation_statement_2155 )

          tree_for_string_literal365 = @adaptor.create_with_payload( string_literal365 )
          @adaptor.add_child( root_0, tree_for_string_literal365 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_statement_2157 )
          path366 = path
          @state.following.pop
          @adaptor.add_child( root_0, path366.tree )
          # --> action

          			id = '_' + self.next_id
          			@now[id] = { '_self' => id,
          				'_context' => 'object',
          				'_isa' => self.to_ref(( path366 && @input.to_s( path366.start, path366.stop ) )),
          				'_parent' => @now
          			}
          			@now = @now[id]
          		
          # <-- action
          # at line 758:3: ( object_body )?
          alt_134 = 2
          look_134_0 = @input.peek( 1 )

          if ( look_134_0 == T__20 )
            alt_134 = 1
          end
          case alt_134
          when 1
            # at line 758:3: object_body
            @state.following.push( TOKENS_FOLLOWING_object_body_IN_mutation_statement_2165 )
            object_body367 = object_body
            @state.following.pop
            @adaptor.add_child( root_0, object_body367.tree )

          end
          # --> action

          			n = self.goto_parent()
          			@now.delete(n['_self'])
          			return_value.key = ( reference363.nil? ? nil : reference363.val )
          			return_value.val = n
          		
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 765:4: 'delete' path
          string_literal368 = match( T__61, TOKENS_FOLLOWING_T__61_IN_mutation_statement_2175 )

          tree_for_string_literal368 = @adaptor.create_with_payload( string_literal368 )
          @adaptor.add_child( root_0, tree_for_string_literal368 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_statement_2177 )
          path369 = path
          @state.following.pop
          @adaptor.add_child( root_0, path369.tree )
          # --> action

          			id = '_' + self.next_id
          			@now[id] = { '_self' => id,
          				'_context' => 'mutation',
          				'_type' => 'delete',
          				'_value' => self.to_ref(( path369 && @input.to_s( path369.start, path369.stop ) ))
          			}
          		
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 774:4: reference 'add(' value ')'
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2186 )
          reference370 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference370.tree )
          string_literal371 = match( T__62, TOKENS_FOLLOWING_T__62_IN_mutation_statement_2188 )

          tree_for_string_literal371 = @adaptor.create_with_payload( string_literal371 )
          @adaptor.add_child( root_0, tree_for_string_literal371 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_2190 )
          value372 = value
          @state.following.pop
          @adaptor.add_child( root_0, value372.tree )
          char_literal373 = match( T__38, TOKENS_FOLLOWING_T__38_IN_mutation_statement_2192 )

          tree_for_char_literal373 = @adaptor.create_with_payload( char_literal373 )
          @adaptor.add_child( root_0, tree_for_char_literal373 )

          # --> action

          			return_value.key = ( reference370.nil? ? nil : reference370.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'add',
          				'_value' => ( value372.nil? ? nil : value372.val )
          			}
          		
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 782:4: reference 'remove(' value ')'
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2201 )
          reference374 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference374.tree )
          string_literal375 = match( T__63, TOKENS_FOLLOWING_T__63_IN_mutation_statement_2203 )

          tree_for_string_literal375 = @adaptor.create_with_payload( string_literal375 )
          @adaptor.add_child( root_0, tree_for_string_literal375 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_2205 )
          value376 = value
          @state.following.pop
          @adaptor.add_child( root_0, value376.tree )
          char_literal377 = match( T__38, TOKENS_FOLLOWING_T__38_IN_mutation_statement_2207 )

          tree_for_char_literal377 = @adaptor.create_with_payload( char_literal377 )
          @adaptor.add_child( root_0, tree_for_char_literal377 )

          # --> action

          			return_value.key = ( reference374.nil? ? nil : reference374.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'remove',
          				'_value' => ( value376.nil? ? nil : value376.val )
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
    # 792:1: set_value returns [val] : '(' ( set_item ( ',' ( NL )* set_item )* )? ')' ;
    # 
    def set_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )
      return_value = SetValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal378 = nil
      char_literal380 = nil
      __NL381__ = nil
      char_literal383 = nil
      set_item379 = nil
      set_item382 = nil

      tree_for_char_literal378 = nil
      tree_for_char_literal380 = nil
      tree_for_NL381 = nil
      tree_for_char_literal383 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 793:4: '(' ( set_item ( ',' ( NL )* set_item )* )? ')'
        char_literal378 = match( T__36, TOKENS_FOLLOWING_T__36_IN_set_value_2226 )

        tree_for_char_literal378 = @adaptor.create_with_payload( char_literal378 )
        @adaptor.add_child( root_0, tree_for_char_literal378 )

        # --> action
        	@set = Array.new	
        # <-- action
        # at line 795:3: ( set_item ( ',' ( NL )* set_item )* )?
        alt_138 = 2
        look_138_0 = @input.peek( 1 )

        if ( look_138_0.between?( STRING, NUMBER ) || look_138_0.between?( BOOLEAN, MULTILINE_STRING ) || look_138_0 == T__36 )
          alt_138 = 1
        end
        case alt_138
        when 1
          # at line 795:4: set_item ( ',' ( NL )* set_item )*
          @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_2235 )
          set_item379 = set_item
          @state.following.pop
          @adaptor.add_child( root_0, set_item379.tree )
          # at line 795:13: ( ',' ( NL )* set_item )*
          while true # decision 137
            alt_137 = 2
            look_137_0 = @input.peek( 1 )

            if ( look_137_0 == T__37 )
              alt_137 = 1

            end
            case alt_137
            when 1
              # at line 795:14: ',' ( NL )* set_item
              char_literal380 = match( T__37, TOKENS_FOLLOWING_T__37_IN_set_value_2238 )

              tree_for_char_literal380 = @adaptor.create_with_payload( char_literal380 )
              @adaptor.add_child( root_0, tree_for_char_literal380 )

              # at line 795:18: ( NL )*
              while true # decision 136
                alt_136 = 2
                look_136_0 = @input.peek( 1 )

                if ( look_136_0 == NL )
                  alt_136 = 1

                end
                case alt_136
                when 1
                  # at line 795:18: NL
                  __NL381__ = match( NL, TOKENS_FOLLOWING_NL_IN_set_value_2240 )

                  tree_for_NL381 = @adaptor.create_with_payload( __NL381__ )
                  @adaptor.add_child( root_0, tree_for_NL381 )


                else
                  break # out of loop for decision 136
                end
              end # loop for decision 136
              @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_2243 )
              set_item382 = set_item
              @state.following.pop
              @adaptor.add_child( root_0, set_item382.tree )

            else
              break # out of loop for decision 137
            end
          end # loop for decision 137

        end
        # --> action
        	return_value.val = @set	
        # <-- action
        char_literal383 = match( T__38, TOKENS_FOLLOWING_T__38_IN_set_value_2255 )

        tree_for_char_literal383 = @adaptor.create_with_payload( char_literal383 )
        @adaptor.add_child( root_0, tree_for_char_literal383 )

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
    # 800:1: set_item : value ;
    # 
    def set_item
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )
      return_value = SetItemReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      value384 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 801:4: value
        @state.following.push( TOKENS_FOLLOWING_value_IN_set_item_2266 )
        value384 = value
        @state.following.pop
        @adaptor.add_child( root_0, value384.tree )
        # --> action
        	@set.push(( value384.nil? ? nil : value384.val ))	
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
    # 805:1: value returns [val, type] : ( primitive_value | reference | set_value );
    # 
    def value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 47 )
      return_value = ValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      primitive_value385 = nil
      reference386 = nil
      set_value387 = nil


      begin
        # at line 806:2: ( primitive_value | reference | set_value )
        alt_139 = 3
        case look_139 = @input.peek( 1 )
        when STRING, NUMBER, BOOLEAN, MULTILINE_STRING then alt_139 = 1
        when ID then alt_139 = 2
        when T__36 then alt_139 = 3
        else
          raise NoViableAlternative( "", 139, 0 )
        end
        case alt_139
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 806:4: primitive_value
          @state.following.push( TOKENS_FOLLOWING_primitive_value_IN_value_2285 )
          primitive_value385 = primitive_value
          @state.following.pop
          @adaptor.add_child( root_0, primitive_value385.tree )
          # --> action

          			return_value.val = ( primitive_value385.nil? ? nil : primitive_value385.val )
          			return_value.type = ( primitive_value385.nil? ? nil : primitive_value385.type )
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 811:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_value_2294 )
          reference386 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference386.tree )
          # --> action

          			return_value.val = ( reference386.nil? ? nil : reference386.val )
          			return_value.type = 'Reference'
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 816:4: set_value
          @state.following.push( TOKENS_FOLLOWING_set_value_IN_value_2303 )
          set_value387 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value387.tree )
          # --> action

          			return_value.val = ( set_value387.nil? ? nil : set_value387.val )
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
    # 823:1: primitive_value returns [val, type] : ( BOOLEAN | NUMBER | STRING | MULTILINE_STRING );
    # 
    def primitive_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 48 )
      return_value = PrimitiveValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __BOOLEAN388__ = nil
      __NUMBER389__ = nil
      __STRING390__ = nil
      __MULTILINE_STRING391__ = nil

      tree_for_BOOLEAN388 = nil
      tree_for_NUMBER389 = nil
      tree_for_STRING390 = nil
      tree_for_MULTILINE_STRING391 = nil

      begin
        # at line 824:2: ( BOOLEAN | NUMBER | STRING | MULTILINE_STRING )
        alt_140 = 4
        case look_140 = @input.peek( 1 )
        when BOOLEAN then alt_140 = 1
        when NUMBER then alt_140 = 2
        when STRING then alt_140 = 3
        when MULTILINE_STRING then alt_140 = 4
        else
          raise NoViableAlternative( "", 140, 0 )
        end
        case alt_140
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 824:4: BOOLEAN
          __BOOLEAN388__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_2322 )

          tree_for_BOOLEAN388 = @adaptor.create_with_payload( __BOOLEAN388__ )
          @adaptor.add_child( root_0, tree_for_BOOLEAN388 )

          # --> action

          			if __BOOLEAN388__.text == 'true' or __BOOLEAN388__.text == 'on' or __BOOLEAN388__.text == 'yes'
          				return_value.val = true
          			else  # 'false', 'no', 'off'
          				return_value.val = false
          			end
          			return_value.type = 'Boolean'
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 833:4: NUMBER
          __NUMBER389__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_primitive_value_2331 )

          tree_for_NUMBER389 = @adaptor.create_with_payload( __NUMBER389__ )
          @adaptor.add_child( root_0, tree_for_NUMBER389 )

          # --> action

          			return_value.val = __NUMBER389__.text.to_i
          			return_value.type = 'Number'
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 838:4: STRING
          __STRING390__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_primitive_value_2340 )

          tree_for_STRING390 = @adaptor.create_with_payload( __STRING390__ )
          @adaptor.add_child( root_0, tree_for_STRING390 )

          # --> action

          			return_value.val = __STRING390__.text[1,__STRING390__.text.length-2]
          			return_value.type = 'String'
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 843:4: MULTILINE_STRING
          __MULTILINE_STRING391__ = match( MULTILINE_STRING, TOKENS_FOLLOWING_MULTILINE_STRING_IN_primitive_value_2349 )

          tree_for_MULTILINE_STRING391 = @adaptor.create_with_payload( __MULTILINE_STRING391__ )
          @adaptor.add_child( root_0, tree_for_MULTILINE_STRING391 )

          # --> action

          			return_value.val = __MULTILINE_STRING391__.text[2, __MULTILINE_STRING391__.text.length-2]
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
    # 850:1: path : ID ( '.' ID )* ;
    # 
    def path
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 49 )
      return_value = PathReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID392__ = nil
      char_literal393 = nil
      __ID394__ = nil

      tree_for_ID392 = nil
      tree_for_char_literal393 = nil
      tree_for_ID394 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 851:4: ID ( '.' ID )*
        __ID392__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_2364 )

        tree_for_ID392 = @adaptor.create_with_payload( __ID392__ )
        @adaptor.add_child( root_0, tree_for_ID392 )

        # at line 851:6: ( '.' ID )*
        while true # decision 141
          alt_141 = 2
          look_141_0 = @input.peek( 1 )

          if ( look_141_0 == T__64 )
            alt_141 = 1

          end
          case alt_141
          when 1
            # at line 851:7: '.' ID
            char_literal393 = match( T__64, TOKENS_FOLLOWING_T__64_IN_path_2366 )

            tree_for_char_literal393 = @adaptor.create_with_payload( char_literal393 )
            @adaptor.add_child( root_0, tree_for_char_literal393 )

            __ID394__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_2367 )

            tree_for_ID394 = @adaptor.create_with_payload( __ID394__ )
            @adaptor.add_child( root_0, tree_for_ID394 )


          else
            break # out of loop for decision 141
          end
        end # loop for decision 141
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
    # 854:1: path_with_index : id_ref ( '.' id_ref )* ;
    # 
    def path_with_index
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 50 )
      return_value = PathWithIndexReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal396 = nil
      id_ref395 = nil
      id_ref397 = nil

      tree_for_char_literal396 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 855:4: id_ref ( '.' id_ref )*
        @state.following.push( TOKENS_FOLLOWING_id_ref_IN_path_with_index_2380 )
        id_ref395 = id_ref
        @state.following.pop
        @adaptor.add_child( root_0, id_ref395.tree )
        # at line 855:10: ( '.' id_ref )*
        while true # decision 142
          alt_142 = 2
          look_142_0 = @input.peek( 1 )

          if ( look_142_0 == T__64 )
            alt_142 = 1

          end
          case alt_142
          when 1
            # at line 855:11: '.' id_ref
            char_literal396 = match( T__64, TOKENS_FOLLOWING_T__64_IN_path_with_index_2382 )

            tree_for_char_literal396 = @adaptor.create_with_payload( char_literal396 )
            @adaptor.add_child( root_0, tree_for_char_literal396 )

            @state.following.push( TOKENS_FOLLOWING_id_ref_IN_path_with_index_2383 )
            id_ref397 = id_ref
            @state.following.pop
            @adaptor.add_child( root_0, id_ref397.tree )

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
        # trace_out( __method__, 50 )

      end
      
      return return_value
    end

    IdRefReturnValue = define_return_scope 

    # 
    # parser rule id_ref
    # 
    # (in SFP.g)
    # 858:1: id_ref : ID ( '[' NUMBER ']' )? ;
    # 
    def id_ref
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 51 )
      return_value = IdRefReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID398__ = nil
      char_literal399 = nil
      __NUMBER400__ = nil
      char_literal401 = nil

      tree_for_ID398 = nil
      tree_for_char_literal399 = nil
      tree_for_NUMBER400 = nil
      tree_for_char_literal401 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 859:4: ID ( '[' NUMBER ']' )?
        __ID398__ = match( ID, TOKENS_FOLLOWING_ID_IN_id_ref_2396 )

        tree_for_ID398 = @adaptor.create_with_payload( __ID398__ )
        @adaptor.add_child( root_0, tree_for_ID398 )

        # at line 859:6: ( '[' NUMBER ']' )?
        alt_143 = 2
        look_143_0 = @input.peek( 1 )

        if ( look_143_0 == T__26 )
          alt_143 = 1
        end
        case alt_143
        when 1
          # at line 859:7: '[' NUMBER ']'
          char_literal399 = match( T__26, TOKENS_FOLLOWING_T__26_IN_id_ref_2398 )

          tree_for_char_literal399 = @adaptor.create_with_payload( char_literal399 )
          @adaptor.add_child( root_0, tree_for_char_literal399 )

          __NUMBER400__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_id_ref_2400 )

          tree_for_NUMBER400 = @adaptor.create_with_payload( __NUMBER400__ )
          @adaptor.add_child( root_0, tree_for_NUMBER400 )

          char_literal401 = match( T__27, TOKENS_FOLLOWING_T__27_IN_id_ref_2402 )

          tree_for_char_literal401 = @adaptor.create_with_payload( char_literal401 )
          @adaptor.add_child( root_0, tree_for_char_literal401 )


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
    # 862:1: reference returns [val] : path_with_index ;
    # 
    def reference
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 52 )
      return_value = ReferenceReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      path_with_index402 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 863:4: path_with_index
        @state.following.push( TOKENS_FOLLOWING_path_with_index_IN_reference_2419 )
        path_with_index402 = path_with_index
        @state.following.pop
        @adaptor.add_child( root_0, path_with_index402.tree )
        # --> action
        	return_value.val = self.to_ref(( path_with_index402 && @input.to_s( path_with_index402.start, path_with_index402.stop ) ))	
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
    # 867:1: reference_type returns [val] : 'isref' path ;
    # 
    def reference_type
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 53 )
      return_value = ReferenceTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal403 = nil
      path404 = nil

      tree_for_string_literal403 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 868:4: 'isref' path
        string_literal403 = match( T__65, TOKENS_FOLLOWING_T__65_IN_reference_type_2438 )

        tree_for_string_literal403 = @adaptor.create_with_payload( string_literal403 )
        @adaptor.add_child( root_0, tree_for_string_literal403 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_reference_type_2440 )
        path404 = path
        @state.following.pop
        @adaptor.add_child( root_0, path404.tree )
        # --> action

        			return_value.val = { '_context' => 'null',
        				'_isa' => self.to_ref(( path404 && @input.to_s( path404.start, path404.stop ) ))
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
    # 876:1: set_type returns [val] : 'isset' path ;
    # 
    def set_type
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 54 )
      return_value = SetTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal405 = nil
      path406 = nil

      tree_for_string_literal405 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 877:4: 'isset' path
        string_literal405 = match( T__40, TOKENS_FOLLOWING_T__40_IN_set_type_2459 )

        tree_for_string_literal405 = @adaptor.create_with_payload( string_literal405 )
        @adaptor.add_child( root_0, tree_for_string_literal405 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_set_type_2461 )
        path406 = path
        @state.following.pop
        @adaptor.add_child( root_0, path406.tree )
        # --> action

        			return_value.val = { '_context' => 'set',
        				'_isa' => self.to_ref(( path406 && @input.to_s( path406.start, path406.stop ) )),
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

    EqualsOpReturnValue = define_return_scope 

    # 
    # parser rule equals_op
    # 
    # (in SFP.g)
    # 886:1: equals_op : ( '=' | 'is' );
    # 
    def equals_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 55 )
      return_value = EqualsOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set407 = nil

      tree_for_set407 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set407 = @input.look
        if @input.peek(1) == T__53 || @input.peek(1) == T__56
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set407 ) )
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

    NotEqualsOpReturnValue = define_return_scope 

    # 
    # parser rule not_equals_op
    # 
    # (in SFP.g)
    # 891:1: not_equals_op : ( '!=' | 'isnt' );
    # 
    def not_equals_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 56 )
      return_value = NotEqualsOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set408 = nil

      tree_for_set408 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set408 = @input.look
        if @input.peek(1) == T__58 || @input.peek(1) == T__66
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set408 ) )
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

    BinaryOpReturnValue = define_return_scope 

    # 
    # parser rule binary_op
    # 
    # (in SFP.g)
    # 896:1: binary_op : ( '+=' | '-=' | '*=' | '/=' );
    # 
    def binary_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 57 )
      return_value = BinaryOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set409 = nil

      tree_for_set409 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set409 = @input.look
        if @input.peek( 1 ).between?( T__67, T__70 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set409 ) )
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

    BinaryCompReturnValue = define_return_scope 

    # 
    # parser rule binary_comp
    # 
    # (in SFP.g)
    # 903:1: binary_comp : ( '>' | '>=' | '<' | '<=' );
    # 
    def binary_comp
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 58 )
      return_value = BinaryCompReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set410 = nil

      tree_for_set410 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set410 = @input.look
        if @input.peek( 1 ).between?( T__71, T__74 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set410 ) )
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



    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA37 < ANTLR3::DFA
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
      
      @decision = 37
      

      def description
        <<-'__dfa_description__'.strip!
          ()* loopback of 185:3: ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )*
        __dfa_description__
      end
    end
    class DFA71 < ANTLR3::DFA
      EOT = unpack( 9, -1 )
      EOF = unpack( 9, -1 )
      MIN = unpack( 1, 6, 1, 4, 3, -1, 1, 6, 1, 4, 1, -1, 1, 4 )
      MAX = unpack( 1, 59, 1, 74, 3, -1, 1, 6, 1, 59, 1, -1, 1, 74 )
      ACCEPT = unpack( 2, -1, 1, 1, 1, 3, 1, 4, 2, -1, 1, 2, 1, -1 )
      SPECIAL = unpack( 9, -1 )
      TRANSITION = [
        unpack( 1, 1, 21, -1, 1, 2, 19, -1, 1, 3, 1, -1, 3, 4, 2, -1, 1, 
                2, 3, -1, 1, 2 ),
        unpack( 1, 6, 15, -1, 1, 7, 5, -1, 1, 2, 26, -1, 1, 2, 1, -1, 4, 
                 2, 5, -1, 1, 5, 1, -1, 1, 2, 4, -1, 4, 2 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 8 ),
        unpack( 1, 6, 1, -1, 1, 2, 13, -1, 1, 7, 1, 2, 6, -1, 1, 2, 14, 
                 -1, 6, 2, 1, -1, 3, 2, 2, -1, 1, 2, 3, -1, 1, 2 ),
        unpack(  ),
        unpack( 1, 6, 15, -1, 1, 7, 5, -1, 1, 2, 26, -1, 1, 2, 1, -1, 4, 
                 2, 5, -1, 1, 5, 1, -1, 1, 2, 4, -1, 4, 2 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 71
      

      def description
        <<-'__dfa_description__'.strip!
          334:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification )
        __dfa_description__
      end
    end
    class DFA99 < ANTLR3::DFA
      EOT = unpack( 9, -1 )
      EOF = unpack( 9, -1 )
      MIN = unpack( 1, 6, 1, 4, 3, -1, 1, 6, 1, 4, 1, -1, 1, 4 )
      MAX = unpack( 1, 59, 1, 74, 3, -1, 1, 6, 1, 59, 1, -1, 1, 74 )
      ACCEPT = unpack( 2, -1, 1, 1, 1, 3, 1, 4, 2, -1, 1, 2, 1, -1 )
      SPECIAL = unpack( 9, -1 )
      TRANSITION = [
        unpack( 1, 1, 21, -1, 1, 2, 19, -1, 1, 3, 1, -1, 3, 4, 2, -1, 1, 
                2, 3, -1, 1, 2 ),
        unpack( 1, 6, 15, -1, 1, 7, 5, -1, 1, 2, 26, -1, 1, 2, 1, -1, 4, 
                 2, 5, -1, 1, 5, 1, -1, 1, 2, 4, -1, 4, 2 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 8 ),
        unpack( 1, 6, 1, -1, 1, 2, 13, -1, 1, 7, 1, 2, 6, -1, 1, 2, 19, 
                 -1, 1, 2, 1, -1, 3, 2, 2, -1, 1, 2, 3, -1, 1, 2 ),
        unpack(  ),
        unpack( 1, 6, 15, -1, 1, 7, 5, -1, 1, 2, 26, -1, 1, 2, 1, -1, 4, 
                 2, 5, -1, 1, 5, 1, -1, 1, 2, 4, -1, 4, 2 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 99
      

      def description
        <<-'__dfa_description__'.strip!
          439:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification )
        __dfa_description__
      end
    end
    class DFA119 < ANTLR3::DFA
      EOT = unpack( 25, -1 )
      EOF = unpack( 25, -1 )
      MIN = unpack( 1, 6, 1, 4, 3, -1, 1, 7, 1, 6, 1, -1, 3, 5, 1, -1, 1, 
                    5, 2, -1, 1, 27, 1, 4, 4, -1, 1, 4, 1, 7, 1, 27, 1, 
                    4 )
      MAX = unpack( 1, 59, 1, 74, 3, -1, 1, 7, 1, 6, 1, -1, 2, 57, 1, 36, 
                    1, -1, 1, 36, 2, -1, 1, 27, 1, 74, 4, -1, 1, 74, 1, 
                    7, 1, 27, 1, 74 )
      ACCEPT = unpack( 2, -1, 1, 2, 1, 7, 1, 11, 2, -1, 1, 1, 3, -1, 1, 
                       8, 1, -1, 1, 9, 1, 10, 2, -1, 1, 3, 1, 4, 1, 5, 1, 
                       6, 4, -1 )
      SPECIAL = unpack( 25, -1 )
      TRANSITION = [
        unpack( 1, 1, 21, -1, 1, 3, 26, -1, 1, 2, 3, -1, 1, 4 ),
        unpack( 1, 7, 21, -1, 1, 5, 2, -1, 1, 7, 23, -1, 1, 10, 1, -1, 
                 1, 13, 1, 8, 1, 11, 1, 9, 5, -1, 1, 6, 1, -1, 1, 12, 4, 
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
                 1, 13, 1, 8, 1, 11, 1, 9, 5, -1, 1, 6, 1, -1, 1, 12, 4, 
                 -1, 4, 14 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 7, 24, -1, 1, 7, 23, -1, 1, 10, 1, -1, 1, 13, 1, 8, 
                 1, 11, 1, 9, 5, -1, 1, 6, 1, -1, 1, 12, 4, -1, 4, 14 ),
        unpack( 1, 23 ),
        unpack( 1, 24 ),
        unpack( 1, 7, 24, -1, 1, 7, 23, -1, 1, 10, 1, -1, 1, 13, 1, 8, 
                 1, 11, 1, 9, 5, -1, 1, 6, 1, -1, 1, 12, 4, -1, 4, 14 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 119
      

      def description
        <<-'__dfa_description__'.strip!
          551:1: constraint_statement returns [key, val] : ( reference | 'not' reference | reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | conditional_constraint | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | reference binary_comp comp_value | total_constraint );
        __dfa_description__
      end
    end
    class DFA135 < ANTLR3::DFA
      EOT = unpack( 19, -1 )
      EOF = unpack( 19, -1 )
      MIN = unpack( 1, 6, 1, 26, 1, -1, 1, 7, 1, 6, 1, 5, 1, -1, 1, 5, 2, 
                    -1, 1, 27, 1, 26, 3, -1, 1, 53, 1, 7, 1, 27, 1, 53 )
      MAX = unpack( 1, 61, 1, 70, 1, -1, 1, 7, 1, 6, 1, 60, 1, -1, 1, 36, 
                    2, -1, 1, 27, 1, 70, 3, -1, 1, 70, 1, 7, 1, 27, 1, 70 )
      ACCEPT = unpack( 2, -1, 1, 5, 3, -1, 1, 3, 1, -1, 1, 6, 1, 7, 2, -1, 
                       1, 4, 1, 1, 1, 2, 4, -1 )
      SPECIAL = unpack( 19, -1 )
      TRANSITION = [
        unpack( 1, 1, 54, -1, 1, 2 ),
        unpack( 1, 3, 26, -1, 1, 7, 2, -1, 1, 5, 5, -1, 1, 8, 1, 9, 1, 
                 4, 2, -1, 4, 6 ),
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
                 4, 2, -1, 4, 6 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 7, 2, -1, 1, 5, 5, -1, 1, 8, 1, 9, 1, 4, 2, -1, 4, 6 ),
        unpack( 1, 17 ),
        unpack( 1, 18 ),
        unpack( 1, 7, 2, -1, 1, 5, 5, -1, 1, 8, 1, 9, 1, 4, 2, -1, 4, 6 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 135
      

      def description
        <<-'__dfa_description__'.strip!
          723:1: mutation_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' );
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa37 = DFA37.new( self, 37 )
      @dfa71 = DFA71.new( self, 71 )
      @dfa99 = DFA99.new( self, 99 )
      @dfa119 = DFA119.new( self, 119 )
      @dfa135 = DFA135.new( self, 135 )

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
    TOKENS_FOLLOWING_object_def_IN_attribute_352 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_354 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_object_def_366 = Set[ 1, 20, 25 ]
    TOKENS_FOLLOWING_T__25_IN_object_def_375 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_object_def_377 = Set[ 1, 20, 26 ]
    TOKENS_FOLLOWING_T__26_IN_object_def_379 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_object_def_381 = Set[ 27 ]
    TOKENS_FOLLOWING_T__27_IN_object_def_385 = Set[ 1, 20 ]
    TOKENS_FOLLOWING_object_body_IN_object_def_400 = Set[ 1 ]
    TOKENS_FOLLOWING_T__20_IN_object_body_416 = Set[ 4, 6, 21, 28, 31 ]
    TOKENS_FOLLOWING_NL_IN_object_body_418 = Set[ 4, 6, 21, 28, 31 ]
    TOKENS_FOLLOWING_object_attribute_IN_object_body_423 = Set[ 6, 21, 28, 31 ]
    TOKENS_FOLLOWING_state_dependency_IN_object_body_427 = Set[ 6, 21, 28, 31 ]
    TOKENS_FOLLOWING_operator_IN_object_body_431 = Set[ 6, 21, 28, 31 ]
    TOKENS_FOLLOWING_T__21_IN_object_body_436 = Set[ 1 ]
    TOKENS_FOLLOWING_attribute_IN_object_attribute_447 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_object_attribute_452 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_object_attribute_454 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_object_attribute_456 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_object_attribute_458 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__28_IN_state_dependency_474 = Set[ 6 ]
    TOKENS_FOLLOWING_dep_effect_IN_state_dependency_478 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_480 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_T__29_IN_state_dependency_483 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_485 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_dependency_488 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_492 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_state_dependency_495 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_dependency_500 = Set[ 4, 30 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_506 = Set[ 4, 30 ]
    TOKENS_FOLLOWING_T__30_IN_state_dependency_509 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_511 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_dependency_514 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_518 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_state_dependency_521 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_dependency_525 = Set[ 4, 30 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_531 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_reference_IN_dep_effect_543 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_dep_effect_545 = Set[ 5, 6, 7, 8, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_dep_effect_552 = Set[ 1 ]
    TOKENS_FOLLOWING_NULL_IN_dep_effect_558 = Set[ 1 ]
    TOKENS_FOLLOWING_T__31_IN_operator_574 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_operator_576 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_operator_578 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_NL_IN_operator_580 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_T__32_IN_operator_591 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_operator_593 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_operator_595 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_operator_597 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_op_conditions_IN_operator_616 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_op_effects_IN_operator_619 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_operator_623 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_operator_625 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_op_param_641 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_op_param_643 = Set[ 6 ]
    TOKENS_FOLLOWING_reference_IN_op_param_645 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_param_647 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__33_IN_op_conditions_663 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_op_conditions_665 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_NL_IN_op_conditions_667 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_op_statement_IN_op_conditions_676 = Set[ 6, 21 ]
    TOKENS_FOLLOWING_T__21_IN_op_conditions_681 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_conditions_683 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__34_IN_op_effects_699 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_op_effects_701 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_NL_IN_op_effects_703 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_op_statement_IN_op_effects_712 = Set[ 6, 21 ]
    TOKENS_FOLLOWING_T__21_IN_op_effects_717 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_effects_719 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_reference_IN_op_statement_735 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_op_statement_737 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_op_statement_739 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_statement_741 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__35_IN_procedure_757 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_procedure_759 = Set[ 20, 36 ]
    TOKENS_FOLLOWING_parameters_IN_procedure_767 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_procedure_770 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_NL_IN_procedure_772 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_T__32_IN_procedure_780 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_procedure_782 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_procedure_784 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_procedure_794 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_conditions_IN_procedure_804 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_effects_IN_procedure_807 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_procedure_809 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_procedure_811 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__36_IN_parameters_827 = Set[ 6 ]
    TOKENS_FOLLOWING_parameter_IN_parameters_829 = Set[ 37, 38 ]
    TOKENS_FOLLOWING_T__37_IN_parameters_832 = Set[ 4, 6 ]
    TOKENS_FOLLOWING_NL_IN_parameters_834 = Set[ 4, 6 ]
    TOKENS_FOLLOWING_parameter_IN_parameters_837 = Set[ 37, 38 ]
    TOKENS_FOLLOWING_T__38_IN_parameters_841 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_853 = Set[ 65 ]
    TOKENS_FOLLOWING_reference_type_IN_parameter_855 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_864 = Set[ 39 ]
    TOKENS_FOLLOWING_T__39_IN_parameter_866 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_parameter_868 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_877 = Set[ 40 ]
    TOKENS_FOLLOWING_T__40_IN_parameter_879 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_parameter_881 = Set[ 1 ]
    TOKENS_FOLLOWING_T__33_IN_conditions_896 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_conditions_904 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_conditions_906 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_conditions_909 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_conditions_911 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_conditions_913 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__34_IN_effects_930 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_effects_938 = Set[ 4, 6, 21, 48, 61 ]
    TOKENS_FOLLOWING_NL_IN_effects_940 = Set[ 4, 6, 21, 48, 61 ]
    TOKENS_FOLLOWING_mutation_body_IN_effects_946 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_effects_951 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_effects_953 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__41_IN_goal_constraint_969 = Set[ 4, 20, 42 ]
    TOKENS_FOLLOWING_T__42_IN_goal_constraint_971 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_constraint_974 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_constraint_983 = Set[ 4, 6, 21, 28, 43, 44, 45, 46, 47, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_constraint_985 = Set[ 4, 6, 21, 28, 43, 44, 45, 46, 47, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_goal_body_IN_goal_constraint_988 = Set[ 6, 21, 28, 43, 44, 45, 46, 47, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_T__21_IN_goal_constraint_991 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_constraint_993 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_constraint_statement_IN_goal_body_1016 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_namespace_IN_goal_body_1029 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_iterator_IN_goal_body_1036 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_class_quantification_IN_goal_body_1043 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1052 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__43_IN_goal_body_1059 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1061 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1070 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1072 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1075 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1077 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1079 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__44_IN_goal_body_1089 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1091 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1100 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1102 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1105 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1107 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1109 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__45_IN_goal_body_1123 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_goal_body_1125 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1127 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1136 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1138 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1141 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1143 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1145 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__46_IN_goal_body_1155 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1157 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1166 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1168 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1171 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1173 = Set[ 4, 29, 45 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1175 = Set[ 4, 29, 45 ]
    TOKENS_FOLLOWING_T__29_IN_goal_body_1186 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__45_IN_goal_body_1193 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_goal_body_1195 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1207 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1216 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1218 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1221 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1223 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1225 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__47_IN_goal_body_1243 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1245 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1254 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1256 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1259 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1261 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1263 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_T__29_IN_goal_body_1272 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1274 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1283 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1285 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1288 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1290 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1292 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__20_IN_nested_constraint_1312 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_nested_constraint_1314 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_nested_constraint_1317 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_nested_constraint_1319 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_constraint_1330 = Set[ 42 ]
    TOKENS_FOLLOWING_T__42_IN_constraint_1332 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_1340 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_constraint_1342 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_constraint_1345 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_1347 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_1349 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_1372 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_namespace_IN_constraint_body_1385 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_iterator_IN_constraint_body_1392 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_class_quantification_IN_constraint_body_1399 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_body_1408 = Set[ 1, 4, 6, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_path_IN_constraint_namespace_1422 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1424 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_namespace_1427 = Set[ 4, 6, 21, 28, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1429 = Set[ 4, 6, 21, 28, 55, 59 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_namespace_1433 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1441 = Set[ 4, 6, 21, 28, 55, 59 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_namespace_1446 = Set[ 1 ]
    TOKENS_FOLLOWING_T__48_IN_constraint_iterator_1457 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_constraint_iterator_1459 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_constraint_iterator_1461 = Set[ 49 ]
    TOKENS_FOLLOWING_T__49_IN_constraint_iterator_1463 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_constraint_iterator_1465 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_constraint_iterator_1467 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1469 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_iterator_1472 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1474 = Set[ 4, 6, 21, 28, 55, 59 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_iterator_1484 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1492 = Set[ 4, 6, 21, 28, 55, 59 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_iterator_1499 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_quantification_keyword_0 = Set[ 1 ]
    TOKENS_FOLLOWING_quantification_keyword_IN_constraint_class_quantification_1535 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_constraint_class_quantification_1537 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_constraint_class_quantification_1539 = Set[ 49 ]
    TOKENS_FOLLOWING_T__49_IN_constraint_class_quantification_1541 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_constraint_class_quantification_1543 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_constraint_class_quantification_1545 = Set[ 4, 20, 53, 71, 72, 73, 74 ]
    TOKENS_FOLLOWING_binary_comp_IN_constraint_class_quantification_1557 = Set[ 7 ]
    TOKENS_FOLLOWING_T__53_IN_constraint_class_quantification_1570 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_constraint_class_quantification_1586 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1600 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_class_quantification_1603 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1605 = Set[ 4, 6, 21, 28, 48, 54, 55, 59 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_class_quantification_1612 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1622 = Set[ 4, 6, 21, 28, 48, 54, 55, 59 ]
    TOKENS_FOLLOWING_constraint_different_IN_constraint_class_quantification_1629 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1631 = Set[ 4, 6, 21, 28, 48, 54, 55, 59 ]
    TOKENS_FOLLOWING_constraint_iterator_IN_constraint_class_quantification_1638 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1640 = Set[ 4, 6, 21, 28, 48, 54, 55, 59 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_class_quantification_1648 = Set[ 1 ]
    TOKENS_FOLLOWING_T__54_IN_constraint_different_1667 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_constraint_different_1669 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_constraint_different_1671 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_constraint_different_1673 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1692 = Set[ 1 ]
    TOKENS_FOLLOWING_T__55_IN_constraint_statement_1701 = Set[ 6 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1703 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1712 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1714 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_1716 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1725 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1727 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_1729 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1738 = Set[ 58, 66 ]
    TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1740 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_1742 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1751 = Set[ 58, 66 ]
    TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1753 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_1755 = Set[ 1 ]
    TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_1764 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1773 = Set[ 56, 57 ]
    TOKENS_FOLLOWING_T__56_IN_constraint_statement_1775 = Set[ 57 ]
    TOKENS_FOLLOWING_T__57_IN_constraint_statement_1778 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_1780 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1789 = Set[ 55, 58 ]
    TOKENS_FOLLOWING_set_IN_constraint_statement_1791 = Set[ 57 ]
    TOKENS_FOLLOWING_T__57_IN_constraint_statement_1797 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_1799 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1808 = Set[ 71, 72, 73, 74 ]
    TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_1810 = Set[ 6, 7 ]
    TOKENS_FOLLOWING_comp_value_IN_constraint_statement_1812 = Set[ 1 ]
    TOKENS_FOLLOWING_total_constraint_IN_constraint_statement_1821 = Set[ 1 ]
    TOKENS_FOLLOWING_T__59_IN_total_constraint_1832 = Set[ 6 ]
    TOKENS_FOLLOWING_total_statement_IN_total_constraint_1834 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_total_constraint_1836 = Set[ 71, 72, 73, 74 ]
    TOKENS_FOLLOWING_binary_comp_IN_total_constraint_1838 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_total_constraint_1840 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_total_statement_1851 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_total_statement_1853 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_total_statement_1855 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_comp_value_1870 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_comp_value_1879 = Set[ 1 ]
    TOKENS_FOLLOWING_T__28_IN_conditional_constraint_1898 = Set[ 6, 20, 28, 55, 59 ]
    TOKENS_FOLLOWING_conditional_constraint_if_part_IN_conditional_constraint_1906 = Set[ 29 ]
    TOKENS_FOLLOWING_conditional_constraint_then_part_IN_conditional_constraint_1910 = Set[ 1 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_if_part_1925 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_conditional_constraint_if_part_1927 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__20_IN_conditional_constraint_if_part_1937 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_conditional_constraint_if_part_1945 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_conditional_constraint_if_part_1948 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_conditional_constraint_if_part_1952 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_conditional_constraint_if_part_1954 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__29_IN_conditional_constraint_then_part_1970 = Set[ 6, 28, 55, 59 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_part_1972 = Set[ 1 ]
    TOKENS_FOLLOWING_T__29_IN_conditional_constraint_then_part_1981 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_conditional_constraint_then_part_1989 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_conditional_constraint_then_part_1991 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_conditional_constraint_then_part_1994 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_conditional_constraint_then_part_1996 = Set[ 1 ]
    TOKENS_FOLLOWING_mutation_statement_IN_mutation_body_2018 = Set[ 4 ]
    TOKENS_FOLLOWING_mutation_iterator_IN_mutation_body_2031 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_body_2040 = Set[ 1, 4, 6, 48, 61 ]
    TOKENS_FOLLOWING_T__48_IN_mutation_iterator_2055 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_iterator_2057 = Set[ 49 ]
    TOKENS_FOLLOWING_T__49_IN_mutation_iterator_2059 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_mutation_iterator_2061 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_2063 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_mutation_iterator_2066 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_2068 = Set[ 4, 6, 21, 61 ]
    TOKENS_FOLLOWING_mutation_statement_IN_mutation_iterator_2078 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_2086 = Set[ 4, 6, 21, 61 ]
    TOKENS_FOLLOWING_T__21_IN_mutation_iterator_2093 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2112 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_mutation_statement_2114 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_2116 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2125 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_mutation_statement_2127 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_mutation_statement_2129 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2138 = Set[ 67, 68, 69, 70 ]
    TOKENS_FOLLOWING_binary_op_IN_mutation_statement_2140 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_mutation_statement_2142 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2151 = Set[ 56 ]
    TOKENS_FOLLOWING_T__56_IN_mutation_statement_2153 = Set[ 60 ]
    TOKENS_FOLLOWING_T__60_IN_mutation_statement_2155 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_statement_2157 = Set[ 1, 20 ]
    TOKENS_FOLLOWING_object_body_IN_mutation_statement_2165 = Set[ 1 ]
    TOKENS_FOLLOWING_T__61_IN_mutation_statement_2175 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_statement_2177 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2186 = Set[ 62 ]
    TOKENS_FOLLOWING_T__62_IN_mutation_statement_2188 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_2190 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_mutation_statement_2192 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2201 = Set[ 63 ]
    TOKENS_FOLLOWING_T__63_IN_mutation_statement_2203 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_2205 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_mutation_statement_2207 = Set[ 1 ]
    TOKENS_FOLLOWING_T__36_IN_set_value_2226 = Set[ 5, 6, 7, 9, 10, 36, 38 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_2235 = Set[ 37, 38 ]
    TOKENS_FOLLOWING_T__37_IN_set_value_2238 = Set[ 4, 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_NL_IN_set_value_2240 = Set[ 4, 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_2243 = Set[ 37, 38 ]
    TOKENS_FOLLOWING_T__38_IN_set_value_2255 = Set[ 1 ]
    TOKENS_FOLLOWING_value_IN_set_item_2266 = Set[ 1 ]
    TOKENS_FOLLOWING_primitive_value_IN_value_2285 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_value_2294 = Set[ 1 ]
    TOKENS_FOLLOWING_set_value_IN_value_2303 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_2322 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_primitive_value_2331 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_primitive_value_2340 = Set[ 1 ]
    TOKENS_FOLLOWING_MULTILINE_STRING_IN_primitive_value_2349 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_path_2364 = Set[ 1, 64 ]
    TOKENS_FOLLOWING_T__64_IN_path_2366 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_path_2367 = Set[ 1, 64 ]
    TOKENS_FOLLOWING_id_ref_IN_path_with_index_2380 = Set[ 1, 64 ]
    TOKENS_FOLLOWING_T__64_IN_path_with_index_2382 = Set[ 6 ]
    TOKENS_FOLLOWING_id_ref_IN_path_with_index_2383 = Set[ 1, 64 ]
    TOKENS_FOLLOWING_ID_IN_id_ref_2396 = Set[ 1, 26 ]
    TOKENS_FOLLOWING_T__26_IN_id_ref_2398 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_id_ref_2400 = Set[ 27 ]
    TOKENS_FOLLOWING_T__27_IN_id_ref_2402 = Set[ 1 ]
    TOKENS_FOLLOWING_path_with_index_IN_reference_2419 = Set[ 1 ]
    TOKENS_FOLLOWING_T__65_IN_reference_type_2438 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_reference_type_2440 = Set[ 1 ]
    TOKENS_FOLLOWING_T__40_IN_set_type_2459 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_set_type_2461 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_not_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_comp_0 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end

