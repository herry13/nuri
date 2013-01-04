#!/usr/bin/env ruby
#
# SFP.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: SFP.g
# Generated at: 2013-01-04 02:08:23
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
    # 272:1: parameters : '(' parameter ( ',' parameter )* ')' ;
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
      char_literal140 = nil
      parameter137 = nil
      parameter139 = nil

      tree_for_char_literal136 = nil
      tree_for_char_literal138 = nil
      tree_for_char_literal140 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 273:4: '(' parameter ( ',' parameter )* ')'
        char_literal136 = match( T__36, TOKENS_FOLLOWING_T__36_IN_parameters_827 )

        tree_for_char_literal136 = @adaptor.create_with_payload( char_literal136 )
        @adaptor.add_child( root_0, tree_for_char_literal136 )

        @state.following.push( TOKENS_FOLLOWING_parameter_IN_parameters_829 )
        parameter137 = parameter
        @state.following.pop
        @adaptor.add_child( root_0, parameter137.tree )
        # at line 273:18: ( ',' parameter )*
        while true # decision 59
          alt_59 = 2
          look_59_0 = @input.peek( 1 )

          if ( look_59_0 == T__37 )
            alt_59 = 1

          end
          case alt_59
          when 1
            # at line 273:19: ',' parameter
            char_literal138 = match( T__37, TOKENS_FOLLOWING_T__37_IN_parameters_832 )

            tree_for_char_literal138 = @adaptor.create_with_payload( char_literal138 )
            @adaptor.add_child( root_0, tree_for_char_literal138 )

            @state.following.push( TOKENS_FOLLOWING_parameter_IN_parameters_834 )
            parameter139 = parameter
            @state.following.pop
            @adaptor.add_child( root_0, parameter139.tree )

          else
            break # out of loop for decision 59
          end
        end # loop for decision 59
        char_literal140 = match( T__38, TOKENS_FOLLOWING_T__38_IN_parameters_838 )

        tree_for_char_literal140 = @adaptor.create_with_payload( char_literal140 )
        @adaptor.add_child( root_0, tree_for_char_literal140 )

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
      __ID141__ = nil
      __ID143__ = nil
      string_literal144 = nil
      __ID146__ = nil
      string_literal147 = nil
      reference_type142 = nil
      path145 = nil
      path148 = nil

      tree_for_ID141 = nil
      tree_for_ID143 = nil
      tree_for_string_literal144 = nil
      tree_for_ID146 = nil
      tree_for_string_literal147 = nil

      begin
        # at line 277:2: ( ID reference_type | ID 'areall' path | ID 'isset' path )
        alt_60 = 3
        look_60_0 = @input.peek( 1 )

        if ( look_60_0 == ID )
          case look_60 = @input.peek( 2 )
          when T__39 then alt_60 = 2
          when T__40 then alt_60 = 3
          when T__65 then alt_60 = 1
          else
            raise NoViableAlternative( "", 60, 1 )
          end
        else
          raise NoViableAlternative( "", 60, 0 )
        end
        case alt_60
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 277:4: ID reference_type
          __ID141__ = match( ID, TOKENS_FOLLOWING_ID_IN_parameter_850 )

          tree_for_ID141 = @adaptor.create_with_payload( __ID141__ )
          @adaptor.add_child( root_0, tree_for_ID141 )

          @state.following.push( TOKENS_FOLLOWING_reference_type_IN_parameter_852 )
          reference_type142 = reference_type
          @state.following.pop
          @adaptor.add_child( root_0, reference_type142.tree )
          # --> action
          	@now[__ID141__.text] = ( reference_type142.nil? ? nil : reference_type142.val )	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 279:4: ID 'areall' path
          __ID143__ = match( ID, TOKENS_FOLLOWING_ID_IN_parameter_861 )

          tree_for_ID143 = @adaptor.create_with_payload( __ID143__ )
          @adaptor.add_child( root_0, tree_for_ID143 )

          string_literal144 = match( T__39, TOKENS_FOLLOWING_T__39_IN_parameter_863 )

          tree_for_string_literal144 = @adaptor.create_with_payload( string_literal144 )
          @adaptor.add_child( root_0, tree_for_string_literal144 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_parameter_865 )
          path145 = path
          @state.following.pop
          @adaptor.add_child( root_0, path145.tree )
          # --> action

          			@now[__ID143__.text] = { '_context' => 'all',
          				'_isa' => self.to_ref(( path145 && @input.to_s( path145.start, path145.stop ) )),
          				'_value' => nil
          			}
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 286:4: ID 'isset' path
          __ID146__ = match( ID, TOKENS_FOLLOWING_ID_IN_parameter_874 )

          tree_for_ID146 = @adaptor.create_with_payload( __ID146__ )
          @adaptor.add_child( root_0, tree_for_ID146 )

          string_literal147 = match( T__40, TOKENS_FOLLOWING_T__40_IN_parameter_876 )

          tree_for_string_literal147 = @adaptor.create_with_payload( string_literal147 )
          @adaptor.add_child( root_0, tree_for_string_literal147 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_parameter_878 )
          path148 = path
          @state.following.pop
          @adaptor.add_child( root_0, path148.tree )
          # --> action

          			@now[__ID146__.text] = { '_context' => 'set',
          				'_isa' => self.to_ref(( path148 && @input.to_s( path148.start, path148.stop ) )),
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
      string_literal149 = nil
      char_literal150 = nil
      __NL151__ = nil
      char_literal153 = nil
      __NL154__ = nil
      constraint_body152 = nil

      tree_for_string_literal149 = nil
      tree_for_char_literal150 = nil
      tree_for_NL151 = nil
      tree_for_char_literal153 = nil
      tree_for_NL154 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 296:4: 'condition' '{' ( NL )* constraint_body '}' ( NL )+
        string_literal149 = match( T__33, TOKENS_FOLLOWING_T__33_IN_conditions_893 )

        tree_for_string_literal149 = @adaptor.create_with_payload( string_literal149 )
        @adaptor.add_child( root_0, tree_for_string_literal149 )

        # --> action

        			@now['_condition']['_parent'] = @now
        			@now = @now['_condition']
        		
        # <-- action
        char_literal150 = match( T__20, TOKENS_FOLLOWING_T__20_IN_conditions_901 )

        tree_for_char_literal150 = @adaptor.create_with_payload( char_literal150 )
        @adaptor.add_child( root_0, tree_for_char_literal150 )

        # at line 301:7: ( NL )*
        while true # decision 61
          alt_61 = 2
          look_61_0 = @input.peek( 1 )

          if ( look_61_0 == NL )
            alt_61 = 1

          end
          case alt_61
          when 1
            # at line 301:7: NL
            __NL151__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditions_903 )

            tree_for_NL151 = @adaptor.create_with_payload( __NL151__ )
            @adaptor.add_child( root_0, tree_for_NL151 )


          else
            break # out of loop for decision 61
          end
        end # loop for decision 61
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_conditions_906 )
        constraint_body152 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body152.tree )
        char_literal153 = match( T__21, TOKENS_FOLLOWING_T__21_IN_conditions_908 )

        tree_for_char_literal153 = @adaptor.create_with_payload( char_literal153 )
        @adaptor.add_child( root_0, tree_for_char_literal153 )

        # at file 301:31: ( NL )+
        match_count_62 = 0
        while true
          alt_62 = 2
          look_62_0 = @input.peek( 1 )

          if ( look_62_0 == NL )
            alt_62 = 1

          end
          case alt_62
          when 1
            # at line 301:31: NL
            __NL154__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditions_910 )

            tree_for_NL154 = @adaptor.create_with_payload( __NL154__ )
            @adaptor.add_child( root_0, tree_for_NL154 )


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
      string_literal155 = nil
      char_literal156 = nil
      __NL157__ = nil
      char_literal159 = nil
      __NL160__ = nil
      mutation_body158 = nil

      tree_for_string_literal155 = nil
      tree_for_char_literal156 = nil
      tree_for_NL157 = nil
      tree_for_char_literal159 = nil
      tree_for_NL160 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 307:4: 'effect' '{' ( NL )* mutation_body '}' ( NL )+
        string_literal155 = match( T__34, TOKENS_FOLLOWING_T__34_IN_effects_927 )

        tree_for_string_literal155 = @adaptor.create_with_payload( string_literal155 )
        @adaptor.add_child( root_0, tree_for_string_literal155 )

        # --> action

        			@now['_effect']['_parent'] = @now
        			@now = @now['_effect']
        		
        # <-- action
        char_literal156 = match( T__20, TOKENS_FOLLOWING_T__20_IN_effects_935 )

        tree_for_char_literal156 = @adaptor.create_with_payload( char_literal156 )
        @adaptor.add_child( root_0, tree_for_char_literal156 )

        # at line 312:7: ( NL )*
        while true # decision 63
          alt_63 = 2
          look_63_0 = @input.peek( 1 )

          if ( look_63_0 == NL )
            alt_63 = 1

          end
          case alt_63
          when 1
            # at line 312:7: NL
            __NL157__ = match( NL, TOKENS_FOLLOWING_NL_IN_effects_937 )

            tree_for_NL157 = @adaptor.create_with_payload( __NL157__ )
            @adaptor.add_child( root_0, tree_for_NL157 )


          else
            break # out of loop for decision 63
          end
        end # loop for decision 63
        @state.following.push( TOKENS_FOLLOWING_mutation_body_IN_effects_943 )
        mutation_body158 = mutation_body
        @state.following.pop
        @adaptor.add_child( root_0, mutation_body158.tree )
        char_literal159 = match( T__21, TOKENS_FOLLOWING_T__21_IN_effects_948 )

        tree_for_char_literal159 = @adaptor.create_with_payload( char_literal159 )
        @adaptor.add_child( root_0, tree_for_char_literal159 )

        # at file 314:7: ( NL )+
        match_count_64 = 0
        while true
          alt_64 = 2
          look_64_0 = @input.peek( 1 )

          if ( look_64_0 == NL )
            alt_64 = 1

          end
          case alt_64
          when 1
            # at line 314:7: NL
            __NL160__ = match( NL, TOKENS_FOLLOWING_NL_IN_effects_950 )

            tree_for_NL160 = @adaptor.create_with_payload( __NL160__ )
            @adaptor.add_child( root_0, tree_for_NL160 )


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
      string_literal161 = nil
      string_literal162 = nil
      __NL163__ = nil
      char_literal164 = nil
      __NL165__ = nil
      char_literal167 = nil
      __NL168__ = nil
      goal_body166 = nil

      tree_for_string_literal161 = nil
      tree_for_string_literal162 = nil
      tree_for_NL163 = nil
      tree_for_char_literal164 = nil
      tree_for_NL165 = nil
      tree_for_char_literal167 = nil
      tree_for_NL168 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 319:4: 'goal' ( 'constraint' )? ( NL )* '{' ( NL )* ( goal_body )* '}' ( NL )+
        string_literal161 = match( T__41, TOKENS_FOLLOWING_T__41_IN_goal_constraint_966 )

        tree_for_string_literal161 = @adaptor.create_with_payload( string_literal161 )
        @adaptor.add_child( root_0, tree_for_string_literal161 )

        # at line 319:11: ( 'constraint' )?
        alt_65 = 2
        look_65_0 = @input.peek( 1 )

        if ( look_65_0 == T__42 )
          alt_65 = 1
        end
        case alt_65
        when 1
          # at line 319:11: 'constraint'
          string_literal162 = match( T__42, TOKENS_FOLLOWING_T__42_IN_goal_constraint_968 )

          tree_for_string_literal162 = @adaptor.create_with_payload( string_literal162 )
          @adaptor.add_child( root_0, tree_for_string_literal162 )


        end
        # at line 319:25: ( NL )*
        while true # decision 66
          alt_66 = 2
          look_66_0 = @input.peek( 1 )

          if ( look_66_0 == NL )
            alt_66 = 1

          end
          case alt_66
          when 1
            # at line 319:25: NL
            __NL163__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_constraint_971 )

            tree_for_NL163 = @adaptor.create_with_payload( __NL163__ )
            @adaptor.add_child( root_0, tree_for_NL163 )


          else
            break # out of loop for decision 66
          end
        end # loop for decision 66
        # --> action

        			@now['goal'] = { '_self' => 'goal',
        				'_context' => 'constraint',
        				'_type' => 'and',
        				'_parent' => @now
        			}
        			@now = @now['goal']
        		
        # <-- action
        char_literal164 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_constraint_980 )

        tree_for_char_literal164 = @adaptor.create_with_payload( char_literal164 )
        @adaptor.add_child( root_0, tree_for_char_literal164 )

        # at line 328:7: ( NL )*
        while true # decision 67
          alt_67 = 2
          look_67_0 = @input.peek( 1 )

          if ( look_67_0 == NL )
            alt_67 = 1

          end
          case alt_67
          when 1
            # at line 328:7: NL
            __NL165__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_constraint_982 )

            tree_for_NL165 = @adaptor.create_with_payload( __NL165__ )
            @adaptor.add_child( root_0, tree_for_NL165 )


          else
            break # out of loop for decision 67
          end
        end # loop for decision 67
        # at line 328:11: ( goal_body )*
        while true # decision 68
          alt_68 = 2
          look_68_0 = @input.peek( 1 )

          if ( look_68_0 == ID || look_68_0 == T__28 || look_68_0.between?( T__43, T__48 ) || look_68_0.between?( T__50, T__52 ) || look_68_0 == T__55 || look_68_0 == T__59 )
            alt_68 = 1

          end
          case alt_68
          when 1
            # at line 328:11: goal_body
            @state.following.push( TOKENS_FOLLOWING_goal_body_IN_goal_constraint_985 )
            goal_body166 = goal_body
            @state.following.pop
            @adaptor.add_child( root_0, goal_body166.tree )

          else
            break # out of loop for decision 68
          end
        end # loop for decision 68
        char_literal167 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_constraint_988 )

        tree_for_char_literal167 = @adaptor.create_with_payload( char_literal167 )
        @adaptor.add_child( root_0, tree_for_char_literal167 )

        # at file 328:26: ( NL )+
        match_count_69 = 0
        while true
          alt_69 = 2
          look_69_0 = @input.peek( 1 )

          if ( look_69_0 == NL )
            alt_69 = 1

          end
          case alt_69
          when 1
            # at line 328:26: NL
            __NL168__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_constraint_990 )

            tree_for_NL168 = @adaptor.create_with_payload( __NL168__ )
            @adaptor.add_child( root_0, tree_for_NL168 )


          else
            match_count_69 > 0 and break
            eee = EarlyExit(69)


            raise eee
          end
          match_count_69 += 1
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
      __NL173__ = nil
      string_literal174 = nil
      __NL175__ = nil
      char_literal176 = nil
      __NL177__ = nil
      char_literal179 = nil
      __NL180__ = nil
      string_literal181 = nil
      __NL182__ = nil
      char_literal183 = nil
      __NL184__ = nil
      char_literal186 = nil
      __NL187__ = nil
      string_literal188 = nil
      __NUMBER189__ = nil
      __NL190__ = nil
      char_literal191 = nil
      __NL192__ = nil
      char_literal194 = nil
      __NL195__ = nil
      string_literal196 = nil
      __NL197__ = nil
      char_literal198 = nil
      __NL199__ = nil
      char_literal201 = nil
      __NL202__ = nil
      string_literal203 = nil
      string_literal204 = nil
      __NUMBER205__ = nil
      __NL206__ = nil
      char_literal207 = nil
      __NL208__ = nil
      char_literal210 = nil
      __NL211__ = nil
      string_literal212 = nil
      __NL213__ = nil
      char_literal214 = nil
      __NL215__ = nil
      char_literal217 = nil
      __NL218__ = nil
      string_literal219 = nil
      __NL220__ = nil
      char_literal221 = nil
      __NL222__ = nil
      char_literal224 = nil
      __NL225__ = nil
      constraint_statement169 = nil
      constraint_namespace170 = nil
      constraint_iterator171 = nil
      constraint_class_quantification172 = nil
      constraint_body178 = nil
      constraint_body185 = nil
      constraint_body193 = nil
      constraint_body200 = nil
      constraint_body209 = nil
      constraint_body216 = nil
      constraint_body223 = nil

      tree_for_NL173 = nil
      tree_for_string_literal174 = nil
      tree_for_NL175 = nil
      tree_for_char_literal176 = nil
      tree_for_NL177 = nil
      tree_for_char_literal179 = nil
      tree_for_NL180 = nil
      tree_for_string_literal181 = nil
      tree_for_NL182 = nil
      tree_for_char_literal183 = nil
      tree_for_NL184 = nil
      tree_for_char_literal186 = nil
      tree_for_NL187 = nil
      tree_for_string_literal188 = nil
      tree_for_NUMBER189 = nil
      tree_for_NL190 = nil
      tree_for_char_literal191 = nil
      tree_for_NL192 = nil
      tree_for_char_literal194 = nil
      tree_for_NL195 = nil
      tree_for_string_literal196 = nil
      tree_for_NL197 = nil
      tree_for_char_literal198 = nil
      tree_for_NL199 = nil
      tree_for_char_literal201 = nil
      tree_for_NL202 = nil
      tree_for_string_literal203 = nil
      tree_for_string_literal204 = nil
      tree_for_NUMBER205 = nil
      tree_for_NL206 = nil
      tree_for_char_literal207 = nil
      tree_for_NL208 = nil
      tree_for_char_literal210 = nil
      tree_for_NL211 = nil
      tree_for_string_literal212 = nil
      tree_for_NL213 = nil
      tree_for_char_literal214 = nil
      tree_for_NL215 = nil
      tree_for_char_literal217 = nil
      tree_for_NL218 = nil
      tree_for_string_literal219 = nil
      tree_for_NL220 = nil
      tree_for_char_literal221 = nil
      tree_for_NL222 = nil
      tree_for_char_literal224 = nil
      tree_for_NL225 = nil

      begin
        # at line 333:2: ( ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ ) | 'always' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'sometime' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'within' NUMBER ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'after' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* ( 'then' | 'within' NUMBER ) ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'before' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ )
        alt_94 = 6
        case look_94 = @input.peek( 1 )
        when ID, T__28, T__48, T__50, T__51, T__52, T__55, T__59 then alt_94 = 1
        when T__43 then alt_94 = 2
        when T__44 then alt_94 = 3
        when T__45 then alt_94 = 4
        when T__46 then alt_94 = 5
        when T__47 then alt_94 = 6
        else
          raise NoViableAlternative( "", 94, 0 )
        end
        case alt_94
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 333:4: ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )
          # at line 333:4: ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )
          # at line 334:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+
          # at line 334:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification )
          alt_70 = 4
          alt_70 = @dfa70.predict( @input )
          case alt_70
          when 1
            # at line 334:6: constraint_statement
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_goal_body_1013 )
            constraint_statement169 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement169.tree )
            # --> action

            					@now[( constraint_statement169.nil? ? nil : constraint_statement169.key )] = ( constraint_statement169.nil? ? nil : constraint_statement169.val )
            				
            # <-- action

          when 2
            # at line 338:6: constraint_namespace
            @state.following.push( TOKENS_FOLLOWING_constraint_namespace_IN_goal_body_1026 )
            constraint_namespace170 = constraint_namespace
            @state.following.pop
            @adaptor.add_child( root_0, constraint_namespace170.tree )

          when 3
            # at line 339:6: constraint_iterator
            @state.following.push( TOKENS_FOLLOWING_constraint_iterator_IN_goal_body_1033 )
            constraint_iterator171 = constraint_iterator
            @state.following.pop
            @adaptor.add_child( root_0, constraint_iterator171.tree )

          when 4
            # at line 340:6: constraint_class_quantification
            @state.following.push( TOKENS_FOLLOWING_constraint_class_quantification_IN_goal_body_1040 )
            constraint_class_quantification172 = constraint_class_quantification
            @state.following.pop
            @adaptor.add_child( root_0, constraint_class_quantification172.tree )

          end
          # at file 342:3: ( NL )+
          match_count_71 = 0
          while true
            alt_71 = 2
            look_71_0 = @input.peek( 1 )

            if ( look_71_0 == NL )
              alt_71 = 1

            end
            case alt_71
            when 1
              # at line 342:3: NL
              __NL173__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1049 )

              tree_for_NL173 = @adaptor.create_with_payload( __NL173__ )
              @adaptor.add_child( root_0, tree_for_NL173 )


            else
              match_count_71 > 0 and break
              eee = EarlyExit(71)


              raise eee
            end
            match_count_71 += 1
          end



        when 2
          root_0 = @adaptor.create_flat_list


          # at line 343:4: 'always' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal174 = match( T__43, TOKENS_FOLLOWING_T__43_IN_goal_body_1056 )

          tree_for_string_literal174 = @adaptor.create_with_payload( string_literal174 )
          @adaptor.add_child( root_0, tree_for_string_literal174 )

          # at line 343:13: ( NL )*
          while true # decision 72
            alt_72 = 2
            look_72_0 = @input.peek( 1 )

            if ( look_72_0 == NL )
              alt_72 = 1

            end
            case alt_72
            when 1
              # at line 343:13: NL
              __NL175__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1058 )

              tree_for_NL175 = @adaptor.create_with_payload( __NL175__ )
              @adaptor.add_child( root_0, tree_for_NL175 )


            else
              break # out of loop for decision 72
            end
          end # loop for decision 72
          # --> action

          			@now['always'] = self.create_constraint('always', 'and') if
          				not @now.has_key?('always')
          			@now = @now['always']
          		
          # <-- action
          char_literal176 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1067 )

          tree_for_char_literal176 = @adaptor.create_with_payload( char_literal176 )
          @adaptor.add_child( root_0, tree_for_char_literal176 )

          # at line 349:7: ( NL )*
          while true # decision 73
            alt_73 = 2
            look_73_0 = @input.peek( 1 )

            if ( look_73_0 == NL )
              alt_73 = 1

            end
            case alt_73
            when 1
              # at line 349:7: NL
              __NL177__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1069 )

              tree_for_NL177 = @adaptor.create_with_payload( __NL177__ )
              @adaptor.add_child( root_0, tree_for_NL177 )


            else
              break # out of loop for decision 73
            end
          end # loop for decision 73
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1072 )
          constraint_body178 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body178.tree )
          char_literal179 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1074 )

          tree_for_char_literal179 = @adaptor.create_with_payload( char_literal179 )
          @adaptor.add_child( root_0, tree_for_char_literal179 )

          # at file 349:31: ( NL )+
          match_count_74 = 0
          while true
            alt_74 = 2
            look_74_0 = @input.peek( 1 )

            if ( look_74_0 == NL )
              alt_74 = 1

            end
            case alt_74
            when 1
              # at line 349:31: NL
              __NL180__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1076 )

              tree_for_NL180 = @adaptor.create_with_payload( __NL180__ )
              @adaptor.add_child( root_0, tree_for_NL180 )


            else
              match_count_74 > 0 and break
              eee = EarlyExit(74)


              raise eee
            end
            match_count_74 += 1
          end

          # --> action
          	self.goto_parent()	
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 351:4: 'sometime' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal181 = match( T__44, TOKENS_FOLLOWING_T__44_IN_goal_body_1086 )

          tree_for_string_literal181 = @adaptor.create_with_payload( string_literal181 )
          @adaptor.add_child( root_0, tree_for_string_literal181 )

          # at line 351:15: ( NL )*
          while true # decision 75
            alt_75 = 2
            look_75_0 = @input.peek( 1 )

            if ( look_75_0 == NL )
              alt_75 = 1

            end
            case alt_75
            when 1
              # at line 351:15: NL
              __NL182__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1088 )

              tree_for_NL182 = @adaptor.create_with_payload( __NL182__ )
              @adaptor.add_child( root_0, tree_for_NL182 )


            else
              break # out of loop for decision 75
            end
          end # loop for decision 75
          # --> action

          			@now['sometime'] = self.create_constraint('sometime', 'or') if
          				not @now.has_key?('sometime')
          			@now = @now['sometime']
          			id = self.next_id.to_s
          			@now[id] = self.create_constraint(id, 'and')
          			@now = @now[id]
          		
          # <-- action
          char_literal183 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1097 )

          tree_for_char_literal183 = @adaptor.create_with_payload( char_literal183 )
          @adaptor.add_child( root_0, tree_for_char_literal183 )

          # at line 360:7: ( NL )*
          while true # decision 76
            alt_76 = 2
            look_76_0 = @input.peek( 1 )

            if ( look_76_0 == NL )
              alt_76 = 1

            end
            case alt_76
            when 1
              # at line 360:7: NL
              __NL184__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1099 )

              tree_for_NL184 = @adaptor.create_with_payload( __NL184__ )
              @adaptor.add_child( root_0, tree_for_NL184 )


            else
              break # out of loop for decision 76
            end
          end # loop for decision 76
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1102 )
          constraint_body185 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body185.tree )
          char_literal186 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1104 )

          tree_for_char_literal186 = @adaptor.create_with_payload( char_literal186 )
          @adaptor.add_child( root_0, tree_for_char_literal186 )

          # at file 360:31: ( NL )+
          match_count_77 = 0
          while true
            alt_77 = 2
            look_77_0 = @input.peek( 1 )

            if ( look_77_0 == NL )
              alt_77 = 1

            end
            case alt_77
            when 1
              # at line 360:31: NL
              __NL187__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1106 )

              tree_for_NL187 = @adaptor.create_with_payload( __NL187__ )
              @adaptor.add_child( root_0, tree_for_NL187 )


            else
              match_count_77 > 0 and break
              eee = EarlyExit(77)


              raise eee
            end
            match_count_77 += 1
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
          string_literal188 = match( T__45, TOKENS_FOLLOWING_T__45_IN_goal_body_1120 )

          tree_for_string_literal188 = @adaptor.create_with_payload( string_literal188 )
          @adaptor.add_child( root_0, tree_for_string_literal188 )

          __NUMBER189__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_goal_body_1122 )

          tree_for_NUMBER189 = @adaptor.create_with_payload( __NUMBER189__ )
          @adaptor.add_child( root_0, tree_for_NUMBER189 )

          # at line 363:20: ( NL )*
          while true # decision 78
            alt_78 = 2
            look_78_0 = @input.peek( 1 )

            if ( look_78_0 == NL )
              alt_78 = 1

            end
            case alt_78
            when 1
              # at line 363:20: NL
              __NL190__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1124 )

              tree_for_NL190 = @adaptor.create_with_payload( __NL190__ )
              @adaptor.add_child( root_0, tree_for_NL190 )


            else
              break # out of loop for decision 78
            end
          end # loop for decision 78
          # --> action

          			id = self.next_id.to_s
          			@now[id] = self.create_constraint(id, 'within')
          			@now = @now[id]
          			@now['deadline'] = __NUMBER189__.text.to_s.to_i
          		
          # <-- action
          char_literal191 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1133 )

          tree_for_char_literal191 = @adaptor.create_with_payload( char_literal191 )
          @adaptor.add_child( root_0, tree_for_char_literal191 )

          # at line 370:7: ( NL )*
          while true # decision 79
            alt_79 = 2
            look_79_0 = @input.peek( 1 )

            if ( look_79_0 == NL )
              alt_79 = 1

            end
            case alt_79
            when 1
              # at line 370:7: NL
              __NL192__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1135 )

              tree_for_NL192 = @adaptor.create_with_payload( __NL192__ )
              @adaptor.add_child( root_0, tree_for_NL192 )


            else
              break # out of loop for decision 79
            end
          end # loop for decision 79
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1138 )
          constraint_body193 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body193.tree )
          char_literal194 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1140 )

          tree_for_char_literal194 = @adaptor.create_with_payload( char_literal194 )
          @adaptor.add_child( root_0, tree_for_char_literal194 )

          # at file 370:31: ( NL )+
          match_count_80 = 0
          while true
            alt_80 = 2
            look_80_0 = @input.peek( 1 )

            if ( look_80_0 == NL )
              alt_80 = 1

            end
            case alt_80
            when 1
              # at line 370:31: NL
              __NL195__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1142 )

              tree_for_NL195 = @adaptor.create_with_payload( __NL195__ )
              @adaptor.add_child( root_0, tree_for_NL195 )


            else
              match_count_80 > 0 and break
              eee = EarlyExit(80)


              raise eee
            end
            match_count_80 += 1
          end

          # --> action
          	self.goto_parent()	
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 372:4: 'after' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* ( 'then' | 'within' NUMBER ) ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal196 = match( T__46, TOKENS_FOLLOWING_T__46_IN_goal_body_1152 )

          tree_for_string_literal196 = @adaptor.create_with_payload( string_literal196 )
          @adaptor.add_child( root_0, tree_for_string_literal196 )

          # at line 372:12: ( NL )*
          while true # decision 81
            alt_81 = 2
            look_81_0 = @input.peek( 1 )

            if ( look_81_0 == NL )
              alt_81 = 1

            end
            case alt_81
            when 1
              # at line 372:12: NL
              __NL197__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1154 )

              tree_for_NL197 = @adaptor.create_with_payload( __NL197__ )
              @adaptor.add_child( root_0, tree_for_NL197 )


            else
              break # out of loop for decision 81
            end
          end # loop for decision 81
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
          char_literal198 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1163 )

          tree_for_char_literal198 = @adaptor.create_with_payload( char_literal198 )
          @adaptor.add_child( root_0, tree_for_char_literal198 )

          # at line 385:7: ( NL )*
          while true # decision 82
            alt_82 = 2
            look_82_0 = @input.peek( 1 )

            if ( look_82_0 == NL )
              alt_82 = 1

            end
            case alt_82
            when 1
              # at line 385:7: NL
              __NL199__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1165 )

              tree_for_NL199 = @adaptor.create_with_payload( __NL199__ )
              @adaptor.add_child( root_0, tree_for_NL199 )


            else
              break # out of loop for decision 82
            end
          end # loop for decision 82
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1168 )
          constraint_body200 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body200.tree )
          char_literal201 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1170 )

          tree_for_char_literal201 = @adaptor.create_with_payload( char_literal201 )
          @adaptor.add_child( root_0, tree_for_char_literal201 )

          # at line 385:31: ( NL )*
          while true # decision 83
            alt_83 = 2
            look_83_0 = @input.peek( 1 )

            if ( look_83_0 == NL )
              alt_83 = 1

            end
            case alt_83
            when 1
              # at line 385:31: NL
              __NL202__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1172 )

              tree_for_NL202 = @adaptor.create_with_payload( __NL202__ )
              @adaptor.add_child( root_0, tree_for_NL202 )


            else
              break # out of loop for decision 83
            end
          end # loop for decision 83
          # --> action
          	self.goto_parent()	
          # <-- action
          # at line 387:3: ( 'then' | 'within' NUMBER )
          alt_84 = 2
          look_84_0 = @input.peek( 1 )

          if ( look_84_0 == T__29 )
            alt_84 = 1
          elsif ( look_84_0 == T__45 )
            alt_84 = 2
          else
            raise NoViableAlternative( "", 84, 0 )
          end
          case alt_84
          when 1
            # at line 387:5: 'then'
            string_literal203 = match( T__29, TOKENS_FOLLOWING_T__29_IN_goal_body_1183 )

            tree_for_string_literal203 = @adaptor.create_with_payload( string_literal203 )
            @adaptor.add_child( root_0, tree_for_string_literal203 )


          when 2
            # at line 388:6: 'within' NUMBER
            string_literal204 = match( T__45, TOKENS_FOLLOWING_T__45_IN_goal_body_1190 )

            tree_for_string_literal204 = @adaptor.create_with_payload( string_literal204 )
            @adaptor.add_child( root_0, tree_for_string_literal204 )

            __NUMBER205__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_goal_body_1192 )

            tree_for_NUMBER205 = @adaptor.create_with_payload( __NUMBER205__ )
            @adaptor.add_child( root_0, tree_for_NUMBER205 )

            # --> action
             @now['deadline'] = __NUMBER205__.text.to_s.to_i 
            # <-- action

          end
          # at line 390:5: ( NL )*
          while true # decision 85
            alt_85 = 2
            look_85_0 = @input.peek( 1 )

            if ( look_85_0 == NL )
              alt_85 = 1

            end
            case alt_85
            when 1
              # at line 390:5: NL
              __NL206__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1204 )

              tree_for_NL206 = @adaptor.create_with_payload( __NL206__ )
              @adaptor.add_child( root_0, tree_for_NL206 )


            else
              break # out of loop for decision 85
            end
          end # loop for decision 85
          # --> action

          			@now['then'] = self.create_constraint('then')
          			@now = @now['then']
          		
          # <-- action
          char_literal207 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1213 )

          tree_for_char_literal207 = @adaptor.create_with_payload( char_literal207 )
          @adaptor.add_child( root_0, tree_for_char_literal207 )

          # at line 395:7: ( NL )*
          while true # decision 86
            alt_86 = 2
            look_86_0 = @input.peek( 1 )

            if ( look_86_0 == NL )
              alt_86 = 1

            end
            case alt_86
            when 1
              # at line 395:7: NL
              __NL208__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1215 )

              tree_for_NL208 = @adaptor.create_with_payload( __NL208__ )
              @adaptor.add_child( root_0, tree_for_NL208 )


            else
              break # out of loop for decision 86
            end
          end # loop for decision 86
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1218 )
          constraint_body209 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body209.tree )
          char_literal210 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1220 )

          tree_for_char_literal210 = @adaptor.create_with_payload( char_literal210 )
          @adaptor.add_child( root_0, tree_for_char_literal210 )

          # at file 395:31: ( NL )+
          match_count_87 = 0
          while true
            alt_87 = 2
            look_87_0 = @input.peek( 1 )

            if ( look_87_0 == NL )
              alt_87 = 1

            end
            case alt_87
            when 1
              # at line 395:31: NL
              __NL211__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1222 )

              tree_for_NL211 = @adaptor.create_with_payload( __NL211__ )
              @adaptor.add_child( root_0, tree_for_NL211 )


            else
              match_count_87 > 0 and break
              eee = EarlyExit(87)


              raise eee
            end
            match_count_87 += 1
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
          string_literal212 = match( T__47, TOKENS_FOLLOWING_T__47_IN_goal_body_1240 )

          tree_for_string_literal212 = @adaptor.create_with_payload( string_literal212 )
          @adaptor.add_child( root_0, tree_for_string_literal212 )

          # at line 399:13: ( NL )*
          while true # decision 88
            alt_88 = 2
            look_88_0 = @input.peek( 1 )

            if ( look_88_0 == NL )
              alt_88 = 1

            end
            case alt_88
            when 1
              # at line 399:13: NL
              __NL213__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1242 )

              tree_for_NL213 = @adaptor.create_with_payload( __NL213__ )
              @adaptor.add_child( root_0, tree_for_NL213 )


            else
              break # out of loop for decision 88
            end
          end # loop for decision 88
          # --> action

          			id = self.next_id.to_s
          			@now[id] = self.create_constraint(id, 'sometime-before')
          			@now = @now[id]
          			@now['before'] = self.create_constraint('before')
          			@now = @now['before']
          		
          # <-- action
          char_literal214 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1251 )

          tree_for_char_literal214 = @adaptor.create_with_payload( char_literal214 )
          @adaptor.add_child( root_0, tree_for_char_literal214 )

          # at line 407:7: ( NL )*
          while true # decision 89
            alt_89 = 2
            look_89_0 = @input.peek( 1 )

            if ( look_89_0 == NL )
              alt_89 = 1

            end
            case alt_89
            when 1
              # at line 407:7: NL
              __NL215__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1253 )

              tree_for_NL215 = @adaptor.create_with_payload( __NL215__ )
              @adaptor.add_child( root_0, tree_for_NL215 )


            else
              break # out of loop for decision 89
            end
          end # loop for decision 89
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1256 )
          constraint_body216 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body216.tree )
          char_literal217 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1258 )

          tree_for_char_literal217 = @adaptor.create_with_payload( char_literal217 )
          @adaptor.add_child( root_0, tree_for_char_literal217 )

          # at line 407:31: ( NL )*
          while true # decision 90
            alt_90 = 2
            look_90_0 = @input.peek( 1 )

            if ( look_90_0 == NL )
              alt_90 = 1

            end
            case alt_90
            when 1
              # at line 407:31: NL
              __NL218__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1260 )

              tree_for_NL218 = @adaptor.create_with_payload( __NL218__ )
              @adaptor.add_child( root_0, tree_for_NL218 )


            else
              break # out of loop for decision 90
            end
          end # loop for decision 90
          # --> action
          	self.goto_parent()	
          # <-- action
          string_literal219 = match( T__29, TOKENS_FOLLOWING_T__29_IN_goal_body_1269 )

          tree_for_string_literal219 = @adaptor.create_with_payload( string_literal219 )
          @adaptor.add_child( root_0, tree_for_string_literal219 )

          # at line 409:10: ( NL )*
          while true # decision 91
            alt_91 = 2
            look_91_0 = @input.peek( 1 )

            if ( look_91_0 == NL )
              alt_91 = 1

            end
            case alt_91
            when 1
              # at line 409:10: NL
              __NL220__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1271 )

              tree_for_NL220 = @adaptor.create_with_payload( __NL220__ )
              @adaptor.add_child( root_0, tree_for_NL220 )


            else
              break # out of loop for decision 91
            end
          end # loop for decision 91
          # --> action

          			@now['then'] = self.create_constraint('then')
          			@now = @now['then']
          		
          # <-- action
          char_literal221 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1280 )

          tree_for_char_literal221 = @adaptor.create_with_payload( char_literal221 )
          @adaptor.add_child( root_0, tree_for_char_literal221 )

          # at line 414:7: ( NL )*
          while true # decision 92
            alt_92 = 2
            look_92_0 = @input.peek( 1 )

            if ( look_92_0 == NL )
              alt_92 = 1

            end
            case alt_92
            when 1
              # at line 414:7: NL
              __NL222__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1282 )

              tree_for_NL222 = @adaptor.create_with_payload( __NL222__ )
              @adaptor.add_child( root_0, tree_for_NL222 )


            else
              break # out of loop for decision 92
            end
          end # loop for decision 92
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1285 )
          constraint_body223 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body223.tree )
          char_literal224 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1287 )

          tree_for_char_literal224 = @adaptor.create_with_payload( char_literal224 )
          @adaptor.add_child( root_0, tree_for_char_literal224 )

          # at file 414:31: ( NL )+
          match_count_93 = 0
          while true
            alt_93 = 2
            look_93_0 = @input.peek( 1 )

            if ( look_93_0 == NL )
              alt_93 = 1

            end
            case alt_93
            when 1
              # at line 414:31: NL
              __NL225__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1289 )

              tree_for_NL225 = @adaptor.create_with_payload( __NL225__ )
              @adaptor.add_child( root_0, tree_for_NL225 )


            else
              match_count_93 > 0 and break
              eee = EarlyExit(93)


              raise eee
            end
            match_count_93 += 1
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
      char_literal226 = nil
      __NL227__ = nil
      char_literal229 = nil
      constraint_body228 = nil

      tree_for_char_literal226 = nil
      tree_for_NL227 = nil
      tree_for_char_literal229 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 420:4: '{' ( NL )* constraint_body '}'
        char_literal226 = match( T__20, TOKENS_FOLLOWING_T__20_IN_nested_constraint_1309 )

        tree_for_char_literal226 = @adaptor.create_with_payload( char_literal226 )
        @adaptor.add_child( root_0, tree_for_char_literal226 )

        # at line 420:8: ( NL )*
        while true # decision 95
          alt_95 = 2
          look_95_0 = @input.peek( 1 )

          if ( look_95_0 == NL )
            alt_95 = 1

          end
          case alt_95
          when 1
            # at line 420:8: NL
            __NL227__ = match( NL, TOKENS_FOLLOWING_NL_IN_nested_constraint_1311 )

            tree_for_NL227 = @adaptor.create_with_payload( __NL227__ )
            @adaptor.add_child( root_0, tree_for_NL227 )


          else
            break # out of loop for decision 95
          end
        end # loop for decision 95
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_nested_constraint_1314 )
        constraint_body228 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body228.tree )
        char_literal229 = match( T__21, TOKENS_FOLLOWING_T__21_IN_nested_constraint_1316 )

        tree_for_char_literal229 = @adaptor.create_with_payload( char_literal229 )
        @adaptor.add_child( root_0, tree_for_char_literal229 )

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
      __ID230__ = nil
      string_literal231 = nil
      char_literal232 = nil
      __NL233__ = nil
      char_literal235 = nil
      __NL236__ = nil
      constraint_body234 = nil

      tree_for_ID230 = nil
      tree_for_string_literal231 = nil
      tree_for_char_literal232 = nil
      tree_for_NL233 = nil
      tree_for_char_literal235 = nil
      tree_for_NL236 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 424:4: ID 'constraint' '{' ( NL )* constraint_body '}' ( NL )+
        __ID230__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_1327 )

        tree_for_ID230 = @adaptor.create_with_payload( __ID230__ )
        @adaptor.add_child( root_0, tree_for_ID230 )

        string_literal231 = match( T__42, TOKENS_FOLLOWING_T__42_IN_constraint_1329 )

        tree_for_string_literal231 = @adaptor.create_with_payload( string_literal231 )
        @adaptor.add_child( root_0, tree_for_string_literal231 )

        # --> action

        			@now[__ID230__.text] = { '_self' => __ID230__.text,
        				'_context' => 'constraint',
        				'_type' => 'and',
        				'_parent' => @now
        			}
        			@now = @now[__ID230__.text]
        		
        # <-- action
        char_literal232 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_1337 )

        tree_for_char_literal232 = @adaptor.create_with_payload( char_literal232 )
        @adaptor.add_child( root_0, tree_for_char_literal232 )

        # at line 433:7: ( NL )*
        while true # decision 96
          alt_96 = 2
          look_96_0 = @input.peek( 1 )

          if ( look_96_0 == NL )
            alt_96 = 1

          end
          case alt_96
          when 1
            # at line 433:7: NL
            __NL233__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_1339 )

            tree_for_NL233 = @adaptor.create_with_payload( __NL233__ )
            @adaptor.add_child( root_0, tree_for_NL233 )


          else
            break # out of loop for decision 96
          end
        end # loop for decision 96
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_constraint_1342 )
        constraint_body234 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body234.tree )
        char_literal235 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_1344 )

        tree_for_char_literal235 = @adaptor.create_with_payload( char_literal235 )
        @adaptor.add_child( root_0, tree_for_char_literal235 )

        # at file 433:31: ( NL )+
        match_count_97 = 0
        while true
          alt_97 = 2
          look_97_0 = @input.peek( 1 )

          if ( look_97_0 == NL )
            alt_97 = 1

          end
          case alt_97
          when 1
            # at line 433:31: NL
            __NL236__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_1346 )

            tree_for_NL236 = @adaptor.create_with_payload( __NL236__ )
            @adaptor.add_child( root_0, tree_for_NL236 )


          else
            match_count_97 > 0 and break
            eee = EarlyExit(97)


            raise eee
          end
          match_count_97 += 1
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
      __NL241__ = nil
      constraint_statement237 = nil
      constraint_namespace238 = nil
      constraint_iterator239 = nil
      constraint_class_quantification240 = nil

      tree_for_NL241 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 438:4: ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )*
        # at line 438:4: ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )*
        while true # decision 100
          alt_100 = 2
          look_100_0 = @input.peek( 1 )

          if ( look_100_0 == ID || look_100_0 == T__28 || look_100_0 == T__48 || look_100_0.between?( T__50, T__52 ) || look_100_0 == T__55 || look_100_0 == T__59 )
            alt_100 = 1

          end
          case alt_100
          when 1
            # at line 439:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+
            # at line 439:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification )
            alt_98 = 4
            alt_98 = @dfa98.predict( @input )
            case alt_98
            when 1
              # at line 439:6: constraint_statement
              @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_1369 )
              constraint_statement237 = constraint_statement
              @state.following.pop
              @adaptor.add_child( root_0, constraint_statement237.tree )
              # --> action

              					@now[( constraint_statement237.nil? ? nil : constraint_statement237.key )] = ( constraint_statement237.nil? ? nil : constraint_statement237.val )
              				
              # <-- action

            when 2
              # at line 443:6: constraint_namespace
              @state.following.push( TOKENS_FOLLOWING_constraint_namespace_IN_constraint_body_1382 )
              constraint_namespace238 = constraint_namespace
              @state.following.pop
              @adaptor.add_child( root_0, constraint_namespace238.tree )

            when 3
              # at line 444:6: constraint_iterator
              @state.following.push( TOKENS_FOLLOWING_constraint_iterator_IN_constraint_body_1389 )
              constraint_iterator239 = constraint_iterator
              @state.following.pop
              @adaptor.add_child( root_0, constraint_iterator239.tree )

            when 4
              # at line 445:6: constraint_class_quantification
              @state.following.push( TOKENS_FOLLOWING_constraint_class_quantification_IN_constraint_body_1396 )
              constraint_class_quantification240 = constraint_class_quantification
              @state.following.pop
              @adaptor.add_child( root_0, constraint_class_quantification240.tree )

            end
            # at file 447:3: ( NL )+
            match_count_99 = 0
            while true
              alt_99 = 2
              look_99_0 = @input.peek( 1 )

              if ( look_99_0 == NL )
                alt_99 = 1

              end
              case alt_99
              when 1
                # at line 447:3: NL
                __NL241__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_body_1405 )

                tree_for_NL241 = @adaptor.create_with_payload( __NL241__ )
                @adaptor.add_child( root_0, tree_for_NL241 )


              else
                match_count_99 > 0 and break
                eee = EarlyExit(99)


                raise eee
              end
              match_count_99 += 1
            end


          else
            break # out of loop for decision 100
          end
        end # loop for decision 100
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
      __NL243__ = nil
      char_literal244 = nil
      __NL245__ = nil
      __NL247__ = nil
      char_literal248 = nil
      path242 = nil
      constraint_statement246 = nil

      tree_for_NL243 = nil
      tree_for_char_literal244 = nil
      tree_for_NL245 = nil
      tree_for_NL247 = nil
      tree_for_char_literal248 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 451:4: path ( NL )* '{' ( NL )* ( constraint_statement ( NL )+ )* '}'
        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_namespace_1419 )
        path242 = path
        @state.following.pop
        @adaptor.add_child( root_0, path242.tree )
        # at line 451:9: ( NL )*
        while true # decision 101
          alt_101 = 2
          look_101_0 = @input.peek( 1 )

          if ( look_101_0 == NL )
            alt_101 = 1

          end
          case alt_101
          when 1
            # at line 451:9: NL
            __NL243__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1421 )

            tree_for_NL243 = @adaptor.create_with_payload( __NL243__ )
            @adaptor.add_child( root_0, tree_for_NL243 )


          else
            break # out of loop for decision 101
          end
        end # loop for decision 101
        char_literal244 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_namespace_1424 )

        tree_for_char_literal244 = @adaptor.create_with_payload( char_literal244 )
        @adaptor.add_child( root_0, tree_for_char_literal244 )

        # at line 451:17: ( NL )*
        while true # decision 102
          alt_102 = 2
          look_102_0 = @input.peek( 1 )

          if ( look_102_0 == NL )
            alt_102 = 1

          end
          case alt_102
          when 1
            # at line 451:17: NL
            __NL245__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1426 )

            tree_for_NL245 = @adaptor.create_with_payload( __NL245__ )
            @adaptor.add_child( root_0, tree_for_NL245 )


          else
            break # out of loop for decision 102
          end
        end # loop for decision 102
        # at line 451:21: ( constraint_statement ( NL )+ )*
        while true # decision 104
          alt_104 = 2
          look_104_0 = @input.peek( 1 )

          if ( look_104_0 == ID || look_104_0 == T__28 || look_104_0 == T__55 || look_104_0 == T__59 )
            alt_104 = 1

          end
          case alt_104
          when 1
            # at line 451:22: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_namespace_1430 )
            constraint_statement246 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement246.tree )
            # --> action

            			key = self.to_ref(( path242 && @input.to_s( path242.start, path242.stop ) ) + '.' + ( constraint_statement246.nil? ? nil : constraint_statement246.key )[2,( constraint_statement246.nil? ? nil : constraint_statement246.key ).length])
            			@now[key] = ( constraint_statement246.nil? ? nil : constraint_statement246.val )
            		
            # <-- action
            # at file 456:3: ( NL )+
            match_count_103 = 0
            while true
              alt_103 = 2
              look_103_0 = @input.peek( 1 )

              if ( look_103_0 == NL )
                alt_103 = 1

              end
              case alt_103
              when 1
                # at line 456:3: NL
                __NL247__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1438 )

                tree_for_NL247 = @adaptor.create_with_payload( __NL247__ )
                @adaptor.add_child( root_0, tree_for_NL247 )


              else
                match_count_103 > 0 and break
                eee = EarlyExit(103)


                raise eee
              end
              match_count_103 += 1
            end


          else
            break # out of loop for decision 104
          end
        end # loop for decision 104
        char_literal248 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_namespace_1443 )

        tree_for_char_literal248 = @adaptor.create_with_payload( char_literal248 )
        @adaptor.add_child( root_0, tree_for_char_literal248 )

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
      string_literal249 = nil
      char_literal250 = nil
      string_literal252 = nil
      __ID253__ = nil
      char_literal254 = nil
      __NL255__ = nil
      char_literal256 = nil
      __NL257__ = nil
      __NL259__ = nil
      char_literal260 = nil
      path251 = nil
      constraint_statement258 = nil

      tree_for_string_literal249 = nil
      tree_for_char_literal250 = nil
      tree_for_string_literal252 = nil
      tree_for_ID253 = nil
      tree_for_char_literal254 = nil
      tree_for_NL255 = nil
      tree_for_char_literal256 = nil
      tree_for_NL257 = nil
      tree_for_NL259 = nil
      tree_for_char_literal260 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 460:4: 'foreach' '(' path 'as' ID ')' ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ )* '}'
        string_literal249 = match( T__48, TOKENS_FOLLOWING_T__48_IN_constraint_iterator_1454 )

        tree_for_string_literal249 = @adaptor.create_with_payload( string_literal249 )
        @adaptor.add_child( root_0, tree_for_string_literal249 )

        char_literal250 = match( T__36, TOKENS_FOLLOWING_T__36_IN_constraint_iterator_1456 )

        tree_for_char_literal250 = @adaptor.create_with_payload( char_literal250 )
        @adaptor.add_child( root_0, tree_for_char_literal250 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_iterator_1458 )
        path251 = path
        @state.following.pop
        @adaptor.add_child( root_0, path251.tree )
        string_literal252 = match( T__49, TOKENS_FOLLOWING_T__49_IN_constraint_iterator_1460 )

        tree_for_string_literal252 = @adaptor.create_with_payload( string_literal252 )
        @adaptor.add_child( root_0, tree_for_string_literal252 )

        __ID253__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_iterator_1462 )

        tree_for_ID253 = @adaptor.create_with_payload( __ID253__ )
        @adaptor.add_child( root_0, tree_for_ID253 )

        char_literal254 = match( T__38, TOKENS_FOLLOWING_T__38_IN_constraint_iterator_1464 )

        tree_for_char_literal254 = @adaptor.create_with_payload( char_literal254 )
        @adaptor.add_child( root_0, tree_for_char_literal254 )

        # at line 460:35: ( NL )*
        while true # decision 105
          alt_105 = 2
          look_105_0 = @input.peek( 1 )

          if ( look_105_0 == NL )
            alt_105 = 1

          end
          case alt_105
          when 1
            # at line 460:35: NL
            __NL255__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1466 )

            tree_for_NL255 = @adaptor.create_with_payload( __NL255__ )
            @adaptor.add_child( root_0, tree_for_NL255 )


          else
            break # out of loop for decision 105
          end
        end # loop for decision 105
        char_literal256 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_iterator_1469 )

        tree_for_char_literal256 = @adaptor.create_with_payload( char_literal256 )
        @adaptor.add_child( root_0, tree_for_char_literal256 )

        # at file 460:43: ( NL )+
        match_count_106 = 0
        while true
          alt_106 = 2
          look_106_0 = @input.peek( 1 )

          if ( look_106_0 == NL )
            alt_106 = 1

          end
          case alt_106
          when 1
            # at line 460:43: NL
            __NL257__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1471 )

            tree_for_NL257 = @adaptor.create_with_payload( __NL257__ )
            @adaptor.add_child( root_0, tree_for_NL257 )


          else
            match_count_106 > 0 and break
            eee = EarlyExit(106)


            raise eee
          end
          match_count_106 += 1
        end

        # --> action

        			id = self.next_id.to_s
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'iterator',
        				'_self' => id,
        				'_value' => '$.' + ( path251 && @input.to_s( path251.start, path251.stop ) ),
        				'_variable' => __ID253__.text
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
        while true # decision 108
          alt_108 = 2
          look_108_0 = @input.peek( 1 )

          if ( look_108_0 == ID || look_108_0 == T__28 || look_108_0 == T__55 || look_108_0 == T__59 )
            alt_108 = 1

          end
          case alt_108
          when 1
            # at line 480:4: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_iterator_1481 )
            constraint_statement258 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement258.tree )
            # --> action

            			@now[( constraint_statement258.nil? ? nil : constraint_statement258.key )] = ( constraint_statement258.nil? ? nil : constraint_statement258.val )
            		
            # <-- action
            # at file 484:3: ( NL )+
            match_count_107 = 0
            while true
              alt_107 = 2
              look_107_0 = @input.peek( 1 )

              if ( look_107_0 == NL )
                alt_107 = 1

              end
              case alt_107
              when 1
                # at line 484:3: NL
                __NL259__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1489 )

                tree_for_NL259 = @adaptor.create_with_payload( __NL259__ )
                @adaptor.add_child( root_0, tree_for_NL259 )


              else
                match_count_107 > 0 and break
                eee = EarlyExit(107)


                raise eee
              end
              match_count_107 += 1
            end


          else
            break # out of loop for decision 108
          end
        end # loop for decision 108
        char_literal260 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_iterator_1496 )

        tree_for_char_literal260 = @adaptor.create_with_payload( char_literal260 )
        @adaptor.add_child( root_0, tree_for_char_literal260 )

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
      set261 = nil

      tree_for_set261 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set261 = @input.look
        if @input.peek( 1 ).between?( T__50, T__52 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set261 ) )
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
      char_literal263 = nil
      string_literal265 = nil
      __ID266__ = nil
      char_literal267 = nil
      char_literal269 = nil
      __NUMBER270__ = nil
      __NL271__ = nil
      char_literal272 = nil
      __NL273__ = nil
      __NL275__ = nil
      __NL277__ = nil
      __NL279__ = nil
      char_literal280 = nil
      quantification_keyword262 = nil
      path264 = nil
      binary_comp268 = nil
      constraint_statement274 = nil
      constraint_different276 = nil
      constraint_iterator278 = nil

      tree_for_char_literal263 = nil
      tree_for_string_literal265 = nil
      tree_for_ID266 = nil
      tree_for_char_literal267 = nil
      tree_for_char_literal269 = nil
      tree_for_NUMBER270 = nil
      tree_for_NL271 = nil
      tree_for_char_literal272 = nil
      tree_for_NL273 = nil
      tree_for_NL275 = nil
      tree_for_NL277 = nil
      tree_for_NL279 = nil
      tree_for_char_literal280 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 499:4: quantification_keyword '(' path 'as' ID ')' ( ( binary_comp | '=' ) NUMBER )? ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ | constraint_different ( NL )+ | constraint_iterator ( NL )+ )* '}'
        @state.following.push( TOKENS_FOLLOWING_quantification_keyword_IN_constraint_class_quantification_1532 )
        quantification_keyword262 = quantification_keyword
        @state.following.pop
        @adaptor.add_child( root_0, quantification_keyword262.tree )
        char_literal263 = match( T__36, TOKENS_FOLLOWING_T__36_IN_constraint_class_quantification_1534 )

        tree_for_char_literal263 = @adaptor.create_with_payload( char_literal263 )
        @adaptor.add_child( root_0, tree_for_char_literal263 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_class_quantification_1536 )
        path264 = path
        @state.following.pop
        @adaptor.add_child( root_0, path264.tree )
        string_literal265 = match( T__49, TOKENS_FOLLOWING_T__49_IN_constraint_class_quantification_1538 )

        tree_for_string_literal265 = @adaptor.create_with_payload( string_literal265 )
        @adaptor.add_child( root_0, tree_for_string_literal265 )

        __ID266__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_class_quantification_1540 )

        tree_for_ID266 = @adaptor.create_with_payload( __ID266__ )
        @adaptor.add_child( root_0, tree_for_ID266 )

        char_literal267 = match( T__38, TOKENS_FOLLOWING_T__38_IN_constraint_class_quantification_1542 )

        tree_for_char_literal267 = @adaptor.create_with_payload( char_literal267 )
        @adaptor.add_child( root_0, tree_for_char_literal267 )

        # --> action

        			id = self.next_id.to_s
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => ( quantification_keyword262 && @input.to_s( quantification_keyword262.start, quantification_keyword262.stop ) ),
        				'_self' => id,
        				'_class' => ( path264 && @input.to_s( path264.start, path264.stop ) ),
        				'_variable' => __ID266__.text
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
        alt_110 = 2
        look_110_0 = @input.peek( 1 )

        if ( look_110_0 == T__53 || look_110_0.between?( T__71, T__74 ) )
          alt_110 = 1
        end
        case alt_110
        when 1
          # at line 519:5: ( binary_comp | '=' ) NUMBER
          # at line 519:5: ( binary_comp | '=' )
          alt_109 = 2
          look_109_0 = @input.peek( 1 )

          if ( look_109_0.between?( T__71, T__74 ) )
            alt_109 = 1
          elsif ( look_109_0 == T__53 )
            alt_109 = 2
          else
            raise NoViableAlternative( "", 109, 0 )
          end
          case alt_109
          when 1
            # at line 519:7: binary_comp
            @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_constraint_class_quantification_1554 )
            binary_comp268 = binary_comp
            @state.following.pop
            @adaptor.add_child( root_0, binary_comp268.tree )
            # --> action
            	@now['_count_operator'] = ( binary_comp268 && @input.to_s( binary_comp268.start, binary_comp268.stop ) )	
            # <-- action

          when 2
            # at line 521:6: '='
            char_literal269 = match( T__53, TOKENS_FOLLOWING_T__53_IN_constraint_class_quantification_1567 )

            tree_for_char_literal269 = @adaptor.create_with_payload( char_literal269 )
            @adaptor.add_child( root_0, tree_for_char_literal269 )

            # --> action
            	@now['_count_operator'] = '='	
            # <-- action

          end
          __NUMBER270__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_constraint_class_quantification_1583 )

          tree_for_NUMBER270 = @adaptor.create_with_payload( __NUMBER270__ )
          @adaptor.add_child( root_0, tree_for_NUMBER270 )

          # --> action
          	@now['_count_value'] = __NUMBER270__.text.to_i	
          # <-- action

        end
        # at line 527:3: ( NL )*
        while true # decision 111
          alt_111 = 2
          look_111_0 = @input.peek( 1 )

          if ( look_111_0 == NL )
            alt_111 = 1

          end
          case alt_111
          when 1
            # at line 527:3: NL
            __NL271__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1597 )

            tree_for_NL271 = @adaptor.create_with_payload( __NL271__ )
            @adaptor.add_child( root_0, tree_for_NL271 )


          else
            break # out of loop for decision 111
          end
        end # loop for decision 111
        char_literal272 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_class_quantification_1600 )

        tree_for_char_literal272 = @adaptor.create_with_payload( char_literal272 )
        @adaptor.add_child( root_0, tree_for_char_literal272 )

        # at file 527:11: ( NL )+
        match_count_112 = 0
        while true
          alt_112 = 2
          look_112_0 = @input.peek( 1 )

          if ( look_112_0 == NL )
            alt_112 = 1

          end
          case alt_112
          when 1
            # at line 527:11: NL
            __NL273__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1602 )

            tree_for_NL273 = @adaptor.create_with_payload( __NL273__ )
            @adaptor.add_child( root_0, tree_for_NL273 )


          else
            match_count_112 > 0 and break
            eee = EarlyExit(112)


            raise eee
          end
          match_count_112 += 1
        end

        # at line 528:3: ( constraint_statement ( NL )+ | constraint_different ( NL )+ | constraint_iterator ( NL )+ )*
        while true # decision 116
          alt_116 = 4
          case look_116 = @input.peek( 1 )
          when ID, T__28, T__55, T__59 then alt_116 = 1
          when T__54 then alt_116 = 2
          when T__48 then alt_116 = 3
          end
          case alt_116
          when 1
            # at line 528:5: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_class_quantification_1609 )
            constraint_statement274 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement274.tree )
            # --> action
            	@now[( constraint_statement274.nil? ? nil : constraint_statement274.key )] = ( constraint_statement274.nil? ? nil : constraint_statement274.val )	
            # <-- action
            # at file 530:4: ( NL )+
            match_count_113 = 0
            while true
              alt_113 = 2
              look_113_0 = @input.peek( 1 )

              if ( look_113_0 == NL )
                alt_113 = 1

              end
              case alt_113
              when 1
                # at line 530:4: NL
                __NL275__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1619 )

                tree_for_NL275 = @adaptor.create_with_payload( __NL275__ )
                @adaptor.add_child( root_0, tree_for_NL275 )


              else
                match_count_113 > 0 and break
                eee = EarlyExit(113)


                raise eee
              end
              match_count_113 += 1
            end


          when 2
            # at line 531:5: constraint_different ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_different_IN_constraint_class_quantification_1626 )
            constraint_different276 = constraint_different
            @state.following.pop
            @adaptor.add_child( root_0, constraint_different276.tree )
            # at file 531:26: ( NL )+
            match_count_114 = 0
            while true
              alt_114 = 2
              look_114_0 = @input.peek( 1 )

              if ( look_114_0 == NL )
                alt_114 = 1

              end
              case alt_114
              when 1
                # at line 531:26: NL
                __NL277__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1628 )

                tree_for_NL277 = @adaptor.create_with_payload( __NL277__ )
                @adaptor.add_child( root_0, tree_for_NL277 )


              else
                match_count_114 > 0 and break
                eee = EarlyExit(114)


                raise eee
              end
              match_count_114 += 1
            end


          when 3
            # at line 532:5: constraint_iterator ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_iterator_IN_constraint_class_quantification_1635 )
            constraint_iterator278 = constraint_iterator
            @state.following.pop
            @adaptor.add_child( root_0, constraint_iterator278.tree )
            # at file 532:25: ( NL )+
            match_count_115 = 0
            while true
              alt_115 = 2
              look_115_0 = @input.peek( 1 )

              if ( look_115_0 == NL )
                alt_115 = 1

              end
              case alt_115
              when 1
                # at line 532:25: NL
                __NL279__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1637 )

                tree_for_NL279 = @adaptor.create_with_payload( __NL279__ )
                @adaptor.add_child( root_0, tree_for_NL279 )


              else
                match_count_115 > 0 and break
                eee = EarlyExit(115)


                raise eee
              end
              match_count_115 += 1
            end


          else
            break # out of loop for decision 116
          end
        end # loop for decision 116
        char_literal280 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_class_quantification_1645 )

        tree_for_char_literal280 = @adaptor.create_with_payload( char_literal280 )
        @adaptor.add_child( root_0, tree_for_char_literal280 )

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
      string_literal281 = nil
      char_literal282 = nil
      char_literal284 = nil
      path283 = nil

      tree_for_string_literal281 = nil
      tree_for_char_literal282 = nil
      tree_for_char_literal284 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 539:4: ':different' '(' path ')'
        string_literal281 = match( T__54, TOKENS_FOLLOWING_T__54_IN_constraint_different_1664 )

        tree_for_string_literal281 = @adaptor.create_with_payload( string_literal281 )
        @adaptor.add_child( root_0, tree_for_string_literal281 )

        char_literal282 = match( T__36, TOKENS_FOLLOWING_T__36_IN_constraint_different_1666 )

        tree_for_char_literal282 = @adaptor.create_with_payload( char_literal282 )
        @adaptor.add_child( root_0, tree_for_char_literal282 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_different_1668 )
        path283 = path
        @state.following.pop
        @adaptor.add_child( root_0, path283.tree )
        char_literal284 = match( T__38, TOKENS_FOLLOWING_T__38_IN_constraint_different_1670 )

        tree_for_char_literal284 = @adaptor.create_with_payload( char_literal284 )
        @adaptor.add_child( root_0, tree_for_char_literal284 )

        # --> action

        			id = self.next_id.to_s
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'different',
        				'_self' => id,
        				'_path' => ( path283 && @input.to_s( path283.start, path283.stop ) )
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
      string_literal286 = nil
      __NULL293__ = nil
      __NULL299__ = nil
      string_literal302 = nil
      string_literal303 = nil
      set306 = nil
      string_literal307 = nil
      reference285 = nil
      reference287 = nil
      reference288 = nil
      equals_op289 = nil
      value290 = nil
      reference291 = nil
      equals_op292 = nil
      reference294 = nil
      not_equals_op295 = nil
      value296 = nil
      reference297 = nil
      not_equals_op298 = nil
      conditional_constraint300 = nil
      reference301 = nil
      set_value304 = nil
      reference305 = nil
      set_value308 = nil
      reference309 = nil
      binary_comp310 = nil
      comp_value311 = nil
      total_constraint312 = nil

      tree_for_string_literal286 = nil
      tree_for_NULL293 = nil
      tree_for_NULL299 = nil
      tree_for_string_literal302 = nil
      tree_for_string_literal303 = nil
      tree_for_set306 = nil
      tree_for_string_literal307 = nil

      begin
        # at line 552:2: ( reference | 'not' reference | reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | conditional_constraint | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | reference binary_comp comp_value | total_constraint )
        alt_118 = 11
        alt_118 = @dfa118.predict( @input )
        case alt_118
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 552:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1689 )
          reference285 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference285.tree )
          # --> action

          			return_value.key = ( reference285.nil? ? nil : reference285.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => true }
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 557:4: 'not' reference
          string_literal286 = match( T__55, TOKENS_FOLLOWING_T__55_IN_constraint_statement_1698 )

          tree_for_string_literal286 = @adaptor.create_with_payload( string_literal286 )
          @adaptor.add_child( root_0, tree_for_string_literal286 )

          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1700 )
          reference287 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference287.tree )
          # --> action

          			return_value.key = ( reference287.nil? ? nil : reference287.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => false }
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 562:4: reference equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1709 )
          reference288 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference288.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1711 )
          equals_op289 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op289.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_1713 )
          value290 = value
          @state.following.pop
          @adaptor.add_child( root_0, value290.tree )
          # --> action

          			return_value.key = ( reference288.nil? ? nil : reference288.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => ( value290.nil? ? nil : value290.val ) }
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 567:4: reference equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1722 )
          reference291 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference291.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1724 )
          equals_op292 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op292.tree )
          __NULL293__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_constraint_statement_1726 )

          tree_for_NULL293 = @adaptor.create_with_payload( __NULL293__ )
          @adaptor.add_child( root_0, tree_for_NULL293 )

          # --> action

          			return_value.key = ( reference291.nil? ? nil : reference291.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => self.null_value }
          		
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 572:4: reference not_equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1735 )
          reference294 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference294.tree )
          @state.following.push( TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1737 )
          not_equals_op295 = not_equals_op
          @state.following.pop
          @adaptor.add_child( root_0, not_equals_op295.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_1739 )
          value296 = value
          @state.following.pop
          @adaptor.add_child( root_0, value296.tree )
          # --> action

          			return_value.key = ( reference294.nil? ? nil : reference294.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-equals', '_value' => ( value296.nil? ? nil : value296.val ) }
          		
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 577:4: reference not_equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1748 )
          reference297 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference297.tree )
          @state.following.push( TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1750 )
          not_equals_op298 = not_equals_op
          @state.following.pop
          @adaptor.add_child( root_0, not_equals_op298.tree )
          __NULL299__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_constraint_statement_1752 )

          tree_for_NULL299 = @adaptor.create_with_payload( __NULL299__ )
          @adaptor.add_child( root_0, tree_for_NULL299 )

          # --> action

          			return_value.key = ( reference297.nil? ? nil : reference297.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-equals', '_value' => self.null_value }
          		
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 582:4: conditional_constraint
          @state.following.push( TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_1761 )
          conditional_constraint300 = conditional_constraint
          @state.following.pop
          @adaptor.add_child( root_0, conditional_constraint300.tree )
          # --> action

          			return_value.key = ( conditional_constraint300.nil? ? nil : conditional_constraint300.key )
          			return_value.val = ( conditional_constraint300.nil? ? nil : conditional_constraint300.val )
          		
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 587:4: reference ( 'is' )? 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1770 )
          reference301 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference301.tree )
          # at line 587:14: ( 'is' )?
          alt_117 = 2
          look_117_0 = @input.peek( 1 )

          if ( look_117_0 == T__56 )
            alt_117 = 1
          end
          case alt_117
          when 1
            # at line 587:14: 'is'
            string_literal302 = match( T__56, TOKENS_FOLLOWING_T__56_IN_constraint_statement_1772 )

            tree_for_string_literal302 = @adaptor.create_with_payload( string_literal302 )
            @adaptor.add_child( root_0, tree_for_string_literal302 )


          end
          string_literal303 = match( T__57, TOKENS_FOLLOWING_T__57_IN_constraint_statement_1775 )

          tree_for_string_literal303 = @adaptor.create_with_payload( string_literal303 )
          @adaptor.add_child( root_0, tree_for_string_literal303 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_1777 )
          set_value304 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value304.tree )
          # --> action

          			c_or = { '_context' => 'constraint', '_type' => 'or', '_parent' => @now }
          			( set_value304.nil? ? nil : set_value304.val ).each { |v|
          				id = self.next_id.to_s
          				item = { '_context' => 'constraint', '_type' => 'and', '_parent' => c_or }
          				item[( reference301.nil? ? nil : reference301.val )] = { '_context' => 'constraint', '_type' => 'equals', '_value' => v }
          				c_or[id] = item
          			}
          			return_value.key = self.next_id.to_s
          			return_value.val = c_or
          		
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 599:4: reference ( 'isnt' | 'not' ) 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1786 )
          reference305 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference305.tree )
          set306 = @input.look
          if @input.peek(1) == T__55 || @input.peek(1) == T__58
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set306 ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          string_literal307 = match( T__57, TOKENS_FOLLOWING_T__57_IN_constraint_statement_1794 )

          tree_for_string_literal307 = @adaptor.create_with_payload( string_literal307 )
          @adaptor.add_child( root_0, tree_for_string_literal307 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_1796 )
          set_value308 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value308.tree )
          # --> action

          			c_and = { '_context'=>'constraint', '_type'=>'and', '_parent'=>@now }
          			( set_value308.nil? ? nil : set_value308.val ).each { |v|
          				id = self.next_id.to_s
          				item = { '_context'=>'constraint', '_type'=>'and'}
          				item[( reference305.nil? ? nil : reference305.val )] = { '_context'=>'constraint', '_type'=>'not-equals', '_value'=>v }
          				c_and[id] = item
          			}
          			return_value.key = self.next_id.to_s
          			return_value.val = c_and

          			#return_value.key = ( reference305.nil? ? nil : reference305.val )
          			#return_value.val = { '_context' => 'constraint', '_type' => 'not-in', '_value' => ( set_value308.nil? ? nil : set_value308.val ) }
          		
          # <-- action

        when 10
          root_0 = @adaptor.create_flat_list


          # at line 614:4: reference binary_comp comp_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1805 )
          reference309 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference309.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_1807 )
          binary_comp310 = binary_comp
          @state.following.pop
          @adaptor.add_child( root_0, binary_comp310.tree )
          @state.following.push( TOKENS_FOLLOWING_comp_value_IN_constraint_statement_1809 )
          comp_value311 = comp_value
          @state.following.pop
          @adaptor.add_child( root_0, comp_value311.tree )
          # --> action

          			return_value.key = ( reference309.nil? ? nil : reference309.val )
          			return_value.val = { '_context' => 'constraint', '_type' => ( binary_comp310 && @input.to_s( binary_comp310.start, binary_comp310.stop ) ), '_value' => ( comp_value311.nil? ? nil : comp_value311.val ) }
          		
          # <-- action

        when 11
          root_0 = @adaptor.create_flat_list


          # at line 619:4: total_constraint
          @state.following.push( TOKENS_FOLLOWING_total_constraint_IN_constraint_statement_1818 )
          total_constraint312 = total_constraint
          @state.following.pop
          @adaptor.add_child( root_0, total_constraint312.tree )

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
      string_literal313 = nil
      char_literal315 = nil
      __NUMBER317__ = nil
      total_statement314 = nil
      binary_comp316 = nil

      tree_for_string_literal313 = nil
      tree_for_char_literal315 = nil
      tree_for_NUMBER317 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 623:4: 'total(' total_statement ')' binary_comp NUMBER
        string_literal313 = match( T__59, TOKENS_FOLLOWING_T__59_IN_total_constraint_1829 )

        tree_for_string_literal313 = @adaptor.create_with_payload( string_literal313 )
        @adaptor.add_child( root_0, tree_for_string_literal313 )

        @state.following.push( TOKENS_FOLLOWING_total_statement_IN_total_constraint_1831 )
        total_statement314 = total_statement
        @state.following.pop
        @adaptor.add_child( root_0, total_statement314.tree )
        char_literal315 = match( T__38, TOKENS_FOLLOWING_T__38_IN_total_constraint_1833 )

        tree_for_char_literal315 = @adaptor.create_with_payload( char_literal315 )
        @adaptor.add_child( root_0, tree_for_char_literal315 )

        @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_total_constraint_1835 )
        binary_comp316 = binary_comp
        @state.following.pop
        @adaptor.add_child( root_0, binary_comp316.tree )
        __NUMBER317__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_total_constraint_1837 )

        tree_for_NUMBER317 = @adaptor.create_with_payload( __NUMBER317__ )
        @adaptor.add_child( root_0, tree_for_NUMBER317 )

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
      reference318 = nil
      equals_op319 = nil
      value320 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 627:4: reference equals_op value
        @state.following.push( TOKENS_FOLLOWING_reference_IN_total_statement_1848 )
        reference318 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference318.tree )
        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_total_statement_1850 )
        equals_op319 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op319.tree )
        @state.following.push( TOKENS_FOLLOWING_value_IN_total_statement_1852 )
        value320 = value
        @state.following.pop
        @adaptor.add_child( root_0, value320.tree )
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
      __NUMBER321__ = nil
      reference322 = nil

      tree_for_NUMBER321 = nil

      begin
        # at line 631:2: ( NUMBER | reference )
        alt_119 = 2
        look_119_0 = @input.peek( 1 )

        if ( look_119_0 == NUMBER )
          alt_119 = 1
        elsif ( look_119_0 == ID )
          alt_119 = 2
        else
          raise NoViableAlternative( "", 119, 0 )
        end
        case alt_119
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 631:4: NUMBER
          __NUMBER321__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_comp_value_1867 )

          tree_for_NUMBER321 = @adaptor.create_with_payload( __NUMBER321__ )
          @adaptor.add_child( root_0, tree_for_NUMBER321 )

          # --> action
          	return_value.val = __NUMBER321__.text.to_i	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 633:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_comp_value_1876 )
          reference322 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference322.tree )
          # --> action
          	return_value.val = ( reference322.nil? ? nil : reference322.val )	
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
      string_literal323 = nil
      conditional_constraint_if_part324 = nil
      conditional_constraint_then_part325 = nil

      tree_for_string_literal323 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 638:4: 'if' conditional_constraint_if_part conditional_constraint_then_part
        string_literal323 = match( T__28, TOKENS_FOLLOWING_T__28_IN_conditional_constraint_1895 )

        tree_for_string_literal323 = @adaptor.create_with_payload( string_literal323 )
        @adaptor.add_child( root_0, tree_for_string_literal323 )

        # --> action

        			return_value.key = id = self.next_id.to_s
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'or'
        			}
        			@now = @now[id]
        		
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_conditional_constraint_if_part_IN_conditional_constraint_1903 )
        conditional_constraint_if_part324 = conditional_constraint_if_part
        @state.following.pop
        @adaptor.add_child( root_0, conditional_constraint_if_part324.tree )
        @state.following.push( TOKENS_FOLLOWING_conditional_constraint_then_part_IN_conditional_constraint_1907 )
        conditional_constraint_then_part325 = conditional_constraint_then_part
        @state.following.pop
        @adaptor.add_child( root_0, conditional_constraint_then_part325.tree )
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
      __NL327__ = nil
      char_literal328 = nil
      __NL329__ = nil
      char_literal331 = nil
      __NL332__ = nil
      constraint_statement326 = nil
      constraint_body330 = nil

      tree_for_NL327 = nil
      tree_for_char_literal328 = nil
      tree_for_NL329 = nil
      tree_for_char_literal331 = nil
      tree_for_NL332 = nil

      begin
        # at line 653:2: ( constraint_statement ( NL )* | '{' ( NL )+ constraint_body '}' ( NL )* )
        alt_123 = 2
        look_123_0 = @input.peek( 1 )

        if ( look_123_0 == ID || look_123_0 == T__28 || look_123_0 == T__55 || look_123_0 == T__59 )
          alt_123 = 1
        elsif ( look_123_0 == T__20 )
          alt_123 = 2
        else
          raise NoViableAlternative( "", 123, 0 )
        end
        case alt_123
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 653:4: constraint_statement ( NL )*
          @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_if_part_1922 )
          constraint_statement326 = constraint_statement
          @state.following.pop
          @adaptor.add_child( root_0, constraint_statement326.tree )
          # at line 653:25: ( NL )*
          while true # decision 120
            alt_120 = 2
            look_120_0 = @input.peek( 1 )

            if ( look_120_0 == NL )
              alt_120 = 1

            end
            case alt_120
            when 1
              # at line 653:25: NL
              __NL327__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditional_constraint_if_part_1924 )

              tree_for_NL327 = @adaptor.create_with_payload( __NL327__ )
              @adaptor.add_child( root_0, tree_for_NL327 )


            else
              break # out of loop for decision 120
            end
          end # loop for decision 120
          # --> action

          			id = self.next_id
          			@now[id] = { '_parent' => @now,
          				'_context' => 'constraint',
          				'_type' => 'not'
          			}
          			@now[id][( constraint_statement326.nil? ? nil : constraint_statement326.key )] = ( constraint_statement326.nil? ? nil : constraint_statement326.val )
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 662:4: '{' ( NL )+ constraint_body '}' ( NL )*
          char_literal328 = match( T__20, TOKENS_FOLLOWING_T__20_IN_conditional_constraint_if_part_1934 )

          tree_for_char_literal328 = @adaptor.create_with_payload( char_literal328 )
          @adaptor.add_child( root_0, tree_for_char_literal328 )

          # --> action

          			id = self.next_id
          			@now[id] = self.create_constraint(id, 'not')
          			@now = @now[id]
          		
          # <-- action
          # at file 668:3: ( NL )+
          match_count_121 = 0
          while true
            alt_121 = 2
            look_121_0 = @input.peek( 1 )

            if ( look_121_0 == NL )
              alt_121 = 1

            end
            case alt_121
            when 1
              # at line 668:3: NL
              __NL329__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditional_constraint_if_part_1942 )

              tree_for_NL329 = @adaptor.create_with_payload( __NL329__ )
              @adaptor.add_child( root_0, tree_for_NL329 )


            else
              match_count_121 > 0 and break
              eee = EarlyExit(121)


              raise eee
            end
            match_count_121 += 1
          end

          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_conditional_constraint_if_part_1945 )
          constraint_body330 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body330.tree )
          char_literal331 = match( T__21, TOKENS_FOLLOWING_T__21_IN_conditional_constraint_if_part_1949 )

          tree_for_char_literal331 = @adaptor.create_with_payload( char_literal331 )
          @adaptor.add_child( root_0, tree_for_char_literal331 )

          # at line 669:7: ( NL )*
          while true # decision 122
            alt_122 = 2
            look_122_0 = @input.peek( 1 )

            if ( look_122_0 == NL )
              alt_122 = 1

            end
            case alt_122
            when 1
              # at line 669:7: NL
              __NL332__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditional_constraint_if_part_1951 )

              tree_for_NL332 = @adaptor.create_with_payload( __NL332__ )
              @adaptor.add_child( root_0, tree_for_NL332 )


            else
              break # out of loop for decision 122
            end
          end # loop for decision 122
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
      string_literal333 = nil
      string_literal335 = nil
      char_literal336 = nil
      __NL337__ = nil
      char_literal339 = nil
      constraint_statement334 = nil
      constraint_body338 = nil

      tree_for_string_literal333 = nil
      tree_for_string_literal335 = nil
      tree_for_char_literal336 = nil
      tree_for_NL337 = nil
      tree_for_char_literal339 = nil

      begin
        # at line 674:2: ( 'then' constraint_statement | 'then' '{' ( NL )+ constraint_body '}' )
        alt_125 = 2
        look_125_0 = @input.peek( 1 )

        if ( look_125_0 == T__29 )
          look_125_1 = @input.peek( 2 )

          if ( look_125_1 == ID || look_125_1 == T__28 || look_125_1 == T__55 || look_125_1 == T__59 )
            alt_125 = 1
          elsif ( look_125_1 == T__20 )
            alt_125 = 2
          else
            raise NoViableAlternative( "", 125, 1 )
          end
        else
          raise NoViableAlternative( "", 125, 0 )
        end
        case alt_125
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 674:4: 'then' constraint_statement
          string_literal333 = match( T__29, TOKENS_FOLLOWING_T__29_IN_conditional_constraint_then_part_1967 )

          tree_for_string_literal333 = @adaptor.create_with_payload( string_literal333 )
          @adaptor.add_child( root_0, tree_for_string_literal333 )

          @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_part_1969 )
          constraint_statement334 = constraint_statement
          @state.following.pop
          @adaptor.add_child( root_0, constraint_statement334.tree )
          # --> action

          			id = self.next_id
          			@now[id] = { '_parent' => @now,
          				'_context' => 'constraint',
          				'_type' => 'and'
          			}
          			@now[id][( constraint_statement334.nil? ? nil : constraint_statement334.key )] = ( constraint_statement334.nil? ? nil : constraint_statement334.val )
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 683:4: 'then' '{' ( NL )+ constraint_body '}'
          string_literal335 = match( T__29, TOKENS_FOLLOWING_T__29_IN_conditional_constraint_then_part_1978 )

          tree_for_string_literal335 = @adaptor.create_with_payload( string_literal335 )
          @adaptor.add_child( root_0, tree_for_string_literal335 )

          # --> action

          			id = self.next_id
          			@now[id] = { '_parent' => @now,
          				'_context' => 'constraint',
          				'_type' => 'and'
          			}
          			@now = @now[id]
          		
          # <-- action
          char_literal336 = match( T__20, TOKENS_FOLLOWING_T__20_IN_conditional_constraint_then_part_1986 )

          tree_for_char_literal336 = @adaptor.create_with_payload( char_literal336 )
          @adaptor.add_child( root_0, tree_for_char_literal336 )

          # at file 692:7: ( NL )+
          match_count_124 = 0
          while true
            alt_124 = 2
            look_124_0 = @input.peek( 1 )

            if ( look_124_0 == NL )
              alt_124 = 1

            end
            case alt_124
            when 1
              # at line 692:7: NL
              __NL337__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditional_constraint_then_part_1988 )

              tree_for_NL337 = @adaptor.create_with_payload( __NL337__ )
              @adaptor.add_child( root_0, tree_for_NL337 )


            else
              match_count_124 > 0 and break
              eee = EarlyExit(124)


              raise eee
            end
            match_count_124 += 1
          end

          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_conditional_constraint_then_part_1991 )
          constraint_body338 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body338.tree )
          char_literal339 = match( T__21, TOKENS_FOLLOWING_T__21_IN_conditional_constraint_then_part_1993 )

          tree_for_char_literal339 = @adaptor.create_with_payload( char_literal339 )
          @adaptor.add_child( root_0, tree_for_char_literal339 )

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
      __NL342__ = nil
      mutation_statement340 = nil
      mutation_iterator341 = nil

      tree_for_NL342 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 697:4: ( ( mutation_statement | mutation_iterator ) ( NL )+ )*
        # at line 697:4: ( ( mutation_statement | mutation_iterator ) ( NL )+ )*
        while true # decision 128
          alt_128 = 2
          look_128_0 = @input.peek( 1 )

          if ( look_128_0 == ID || look_128_0 == T__48 || look_128_0 == T__61 )
            alt_128 = 1

          end
          case alt_128
          when 1
            # at line 698:4: ( mutation_statement | mutation_iterator ) ( NL )+
            # at line 698:4: ( mutation_statement | mutation_iterator )
            alt_126 = 2
            look_126_0 = @input.peek( 1 )

            if ( look_126_0 == ID || look_126_0 == T__61 )
              alt_126 = 1
            elsif ( look_126_0 == T__48 )
              alt_126 = 2
            else
              raise NoViableAlternative( "", 126, 0 )
            end
            case alt_126
            when 1
              # at line 698:6: mutation_statement
              @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_mutation_body_2015 )
              mutation_statement340 = mutation_statement
              @state.following.pop
              @adaptor.add_child( root_0, mutation_statement340.tree )
              # --> action
              	@now[( mutation_statement340.nil? ? nil : mutation_statement340.key )] = ( mutation_statement340.nil? ? nil : mutation_statement340.val )	
              # <-- action

            when 2
              # at line 700:6: mutation_iterator
              @state.following.push( TOKENS_FOLLOWING_mutation_iterator_IN_mutation_body_2028 )
              mutation_iterator341 = mutation_iterator
              @state.following.pop
              @adaptor.add_child( root_0, mutation_iterator341.tree )

            end
            # at file 702:3: ( NL )+
            match_count_127 = 0
            while true
              alt_127 = 2
              look_127_0 = @input.peek( 1 )

              if ( look_127_0 == NL )
                alt_127 = 1

              end
              case alt_127
              when 1
                # at line 702:3: NL
                __NL342__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_body_2037 )

                tree_for_NL342 = @adaptor.create_with_payload( __NL342__ )
                @adaptor.add_child( root_0, tree_for_NL342 )


              else
                match_count_127 > 0 and break
                eee = EarlyExit(127)


                raise eee
              end
              match_count_127 += 1
            end


          else
            break # out of loop for decision 128
          end
        end # loop for decision 128
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
      string_literal343 = nil
      string_literal345 = nil
      __ID346__ = nil
      __NL347__ = nil
      char_literal348 = nil
      __NL349__ = nil
      __NL351__ = nil
      char_literal352 = nil
      path344 = nil
      mutation_statement350 = nil

      tree_for_string_literal343 = nil
      tree_for_string_literal345 = nil
      tree_for_ID346 = nil
      tree_for_NL347 = nil
      tree_for_char_literal348 = nil
      tree_for_NL349 = nil
      tree_for_NL351 = nil
      tree_for_char_literal352 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 706:4: 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( mutation_statement ( NL )+ )* '}'
        string_literal343 = match( T__48, TOKENS_FOLLOWING_T__48_IN_mutation_iterator_2052 )

        tree_for_string_literal343 = @adaptor.create_with_payload( string_literal343 )
        @adaptor.add_child( root_0, tree_for_string_literal343 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_iterator_2054 )
        path344 = path
        @state.following.pop
        @adaptor.add_child( root_0, path344.tree )
        string_literal345 = match( T__49, TOKENS_FOLLOWING_T__49_IN_mutation_iterator_2056 )

        tree_for_string_literal345 = @adaptor.create_with_payload( string_literal345 )
        @adaptor.add_child( root_0, tree_for_string_literal345 )

        __ID346__ = match( ID, TOKENS_FOLLOWING_ID_IN_mutation_iterator_2058 )

        tree_for_ID346 = @adaptor.create_with_payload( __ID346__ )
        @adaptor.add_child( root_0, tree_for_ID346 )

        # at line 706:27: ( NL )*
        while true # decision 129
          alt_129 = 2
          look_129_0 = @input.peek( 1 )

          if ( look_129_0 == NL )
            alt_129 = 1

          end
          case alt_129
          when 1
            # at line 706:27: NL
            __NL347__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_2060 )

            tree_for_NL347 = @adaptor.create_with_payload( __NL347__ )
            @adaptor.add_child( root_0, tree_for_NL347 )


          else
            break # out of loop for decision 129
          end
        end # loop for decision 129
        char_literal348 = match( T__20, TOKENS_FOLLOWING_T__20_IN_mutation_iterator_2063 )

        tree_for_char_literal348 = @adaptor.create_with_payload( char_literal348 )
        @adaptor.add_child( root_0, tree_for_char_literal348 )

        # at file 706:35: ( NL )+
        match_count_130 = 0
        while true
          alt_130 = 2
          look_130_0 = @input.peek( 1 )

          if ( look_130_0 == NL )
            alt_130 = 1

          end
          case alt_130
          when 1
            # at line 706:35: NL
            __NL349__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_2065 )

            tree_for_NL349 = @adaptor.create_with_payload( __NL349__ )
            @adaptor.add_child( root_0, tree_for_NL349 )


          else
            match_count_130 > 0 and break
            eee = EarlyExit(130)


            raise eee
          end
          match_count_130 += 1
        end

        # --> action

        			id = self.to_ref(( path344 && @input.to_s( path344.start, path344.stop ) ))
        			@now[id] = { '_parent' => @now,
        				'_context' => 'iterator',
        				'_self' => id,
        				'_variable' => __ID346__.text
        			}
        			@now = @now[id]
        		
        # <-- action
        # at line 716:3: ( mutation_statement ( NL )+ )*
        while true # decision 132
          alt_132 = 2
          look_132_0 = @input.peek( 1 )

          if ( look_132_0 == ID || look_132_0 == T__61 )
            alt_132 = 1

          end
          case alt_132
          when 1
            # at line 716:4: mutation_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_mutation_iterator_2075 )
            mutation_statement350 = mutation_statement
            @state.following.pop
            @adaptor.add_child( root_0, mutation_statement350.tree )
            # --> action
            	@now[( mutation_statement350.nil? ? nil : mutation_statement350.key )] = ( mutation_statement350.nil? ? nil : mutation_statement350.val )	
            # <-- action
            # at file 718:3: ( NL )+
            match_count_131 = 0
            while true
              alt_131 = 2
              look_131_0 = @input.peek( 1 )

              if ( look_131_0 == NL )
                alt_131 = 1

              end
              case alt_131
              when 1
                # at line 718:3: NL
                __NL351__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_2083 )

                tree_for_NL351 = @adaptor.create_with_payload( __NL351__ )
                @adaptor.add_child( root_0, tree_for_NL351 )


              else
                match_count_131 > 0 and break
                eee = EarlyExit(131)


                raise eee
              end
              match_count_131 += 1
            end


          else
            break # out of loop for decision 132
          end
        end # loop for decision 132
        char_literal352 = match( T__21, TOKENS_FOLLOWING_T__21_IN_mutation_iterator_2090 )

        tree_for_char_literal352 = @adaptor.create_with_payload( char_literal352 )
        @adaptor.add_child( root_0, tree_for_char_literal352 )

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
      __NULL358__ = nil
      __NUMBER361__ = nil
      string_literal363 = nil
      string_literal364 = nil
      string_literal367 = nil
      string_literal370 = nil
      char_literal372 = nil
      string_literal374 = nil
      char_literal376 = nil
      reference353 = nil
      equals_op354 = nil
      value355 = nil
      reference356 = nil
      equals_op357 = nil
      reference359 = nil
      binary_op360 = nil
      reference362 = nil
      path365 = nil
      object_body366 = nil
      path368 = nil
      reference369 = nil
      value371 = nil
      reference373 = nil
      value375 = nil

      tree_for_NULL358 = nil
      tree_for_NUMBER361 = nil
      tree_for_string_literal363 = nil
      tree_for_string_literal364 = nil
      tree_for_string_literal367 = nil
      tree_for_string_literal370 = nil
      tree_for_char_literal372 = nil
      tree_for_string_literal374 = nil
      tree_for_char_literal376 = nil

      begin
        # at line 724:2: ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' )
        alt_134 = 7
        alt_134 = @dfa134.predict( @input )
        case alt_134
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 724:4: reference equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2109 )
          reference353 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference353.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_mutation_statement_2111 )
          equals_op354 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op354.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_2113 )
          value355 = value
          @state.following.pop
          @adaptor.add_child( root_0, value355.tree )
          # --> action

          			return_value.key = ( reference353.nil? ? nil : reference353.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'equals',
          				'_value' => ( value355.nil? ? nil : value355.val )
          			}
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 732:4: reference equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2122 )
          reference356 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference356.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_mutation_statement_2124 )
          equals_op357 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op357.tree )
          __NULL358__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_mutation_statement_2126 )

          tree_for_NULL358 = @adaptor.create_with_payload( __NULL358__ )
          @adaptor.add_child( root_0, tree_for_NULL358 )

          # --> action

          			return_value.key = ( reference356.nil? ? nil : reference356.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'equals',
          				'_value' => self.null_value
          			}
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 740:4: reference binary_op NUMBER
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2135 )
          reference359 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference359.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_op_IN_mutation_statement_2137 )
          binary_op360 = binary_op
          @state.following.pop
          @adaptor.add_child( root_0, binary_op360.tree )
          __NUMBER361__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_mutation_statement_2139 )

          tree_for_NUMBER361 = @adaptor.create_with_payload( __NUMBER361__ )
          @adaptor.add_child( root_0, tree_for_NUMBER361 )

          # --> action

          			return_value.key = ( reference359.nil? ? nil : reference359.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => ( binary_op360 && @input.to_s( binary_op360.start, binary_op360.stop ) ),
          				'_value' => __NUMBER361__.text.to_i
          			}
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 748:4: reference 'is' 'new' path ( object_body )?
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2148 )
          reference362 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference362.tree )
          string_literal363 = match( T__56, TOKENS_FOLLOWING_T__56_IN_mutation_statement_2150 )

          tree_for_string_literal363 = @adaptor.create_with_payload( string_literal363 )
          @adaptor.add_child( root_0, tree_for_string_literal363 )

          string_literal364 = match( T__60, TOKENS_FOLLOWING_T__60_IN_mutation_statement_2152 )

          tree_for_string_literal364 = @adaptor.create_with_payload( string_literal364 )
          @adaptor.add_child( root_0, tree_for_string_literal364 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_statement_2154 )
          path365 = path
          @state.following.pop
          @adaptor.add_child( root_0, path365.tree )
          # --> action

          			id = '_' + self.next_id
          			@now[id] = { '_self' => id,
          				'_context' => 'object',
          				'_isa' => self.to_ref(( path365 && @input.to_s( path365.start, path365.stop ) )),
          				'_parent' => @now
          			}
          			@now = @now[id]
          		
          # <-- action
          # at line 758:3: ( object_body )?
          alt_133 = 2
          look_133_0 = @input.peek( 1 )

          if ( look_133_0 == T__20 )
            alt_133 = 1
          end
          case alt_133
          when 1
            # at line 758:3: object_body
            @state.following.push( TOKENS_FOLLOWING_object_body_IN_mutation_statement_2162 )
            object_body366 = object_body
            @state.following.pop
            @adaptor.add_child( root_0, object_body366.tree )

          end
          # --> action

          			n = self.goto_parent()
          			@now.delete(n['_self'])
          			return_value.key = ( reference362.nil? ? nil : reference362.val )
          			return_value.val = n
          		
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 765:4: 'delete' path
          string_literal367 = match( T__61, TOKENS_FOLLOWING_T__61_IN_mutation_statement_2172 )

          tree_for_string_literal367 = @adaptor.create_with_payload( string_literal367 )
          @adaptor.add_child( root_0, tree_for_string_literal367 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_statement_2174 )
          path368 = path
          @state.following.pop
          @adaptor.add_child( root_0, path368.tree )
          # --> action

          			id = '_' + self.next_id
          			@now[id] = { '_self' => id,
          				'_context' => 'mutation',
          				'_type' => 'delete',
          				'_value' => self.to_ref(( path368 && @input.to_s( path368.start, path368.stop ) ))
          			}
          		
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 774:4: reference 'add(' value ')'
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2183 )
          reference369 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference369.tree )
          string_literal370 = match( T__62, TOKENS_FOLLOWING_T__62_IN_mutation_statement_2185 )

          tree_for_string_literal370 = @adaptor.create_with_payload( string_literal370 )
          @adaptor.add_child( root_0, tree_for_string_literal370 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_2187 )
          value371 = value
          @state.following.pop
          @adaptor.add_child( root_0, value371.tree )
          char_literal372 = match( T__38, TOKENS_FOLLOWING_T__38_IN_mutation_statement_2189 )

          tree_for_char_literal372 = @adaptor.create_with_payload( char_literal372 )
          @adaptor.add_child( root_0, tree_for_char_literal372 )

          # --> action

          			return_value.key = ( reference369.nil? ? nil : reference369.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'add',
          				'_value' => ( value371.nil? ? nil : value371.val )
          			}
          		
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 782:4: reference 'remove(' value ')'
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2198 )
          reference373 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference373.tree )
          string_literal374 = match( T__63, TOKENS_FOLLOWING_T__63_IN_mutation_statement_2200 )

          tree_for_string_literal374 = @adaptor.create_with_payload( string_literal374 )
          @adaptor.add_child( root_0, tree_for_string_literal374 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_2202 )
          value375 = value
          @state.following.pop
          @adaptor.add_child( root_0, value375.tree )
          char_literal376 = match( T__38, TOKENS_FOLLOWING_T__38_IN_mutation_statement_2204 )

          tree_for_char_literal376 = @adaptor.create_with_payload( char_literal376 )
          @adaptor.add_child( root_0, tree_for_char_literal376 )

          # --> action

          			return_value.key = ( reference373.nil? ? nil : reference373.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'remove',
          				'_value' => ( value375.nil? ? nil : value375.val )
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
      char_literal377 = nil
      char_literal379 = nil
      __NL380__ = nil
      char_literal382 = nil
      set_item378 = nil
      set_item381 = nil

      tree_for_char_literal377 = nil
      tree_for_char_literal379 = nil
      tree_for_NL380 = nil
      tree_for_char_literal382 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 793:4: '(' ( set_item ( ',' ( NL )* set_item )* )? ')'
        char_literal377 = match( T__36, TOKENS_FOLLOWING_T__36_IN_set_value_2223 )

        tree_for_char_literal377 = @adaptor.create_with_payload( char_literal377 )
        @adaptor.add_child( root_0, tree_for_char_literal377 )

        # --> action
        	@set = Array.new	
        # <-- action
        # at line 795:3: ( set_item ( ',' ( NL )* set_item )* )?
        alt_137 = 2
        look_137_0 = @input.peek( 1 )

        if ( look_137_0.between?( STRING, NUMBER ) || look_137_0.between?( BOOLEAN, MULTILINE_STRING ) || look_137_0 == T__36 )
          alt_137 = 1
        end
        case alt_137
        when 1
          # at line 795:4: set_item ( ',' ( NL )* set_item )*
          @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_2232 )
          set_item378 = set_item
          @state.following.pop
          @adaptor.add_child( root_0, set_item378.tree )
          # at line 795:13: ( ',' ( NL )* set_item )*
          while true # decision 136
            alt_136 = 2
            look_136_0 = @input.peek( 1 )

            if ( look_136_0 == T__37 )
              alt_136 = 1

            end
            case alt_136
            when 1
              # at line 795:14: ',' ( NL )* set_item
              char_literal379 = match( T__37, TOKENS_FOLLOWING_T__37_IN_set_value_2235 )

              tree_for_char_literal379 = @adaptor.create_with_payload( char_literal379 )
              @adaptor.add_child( root_0, tree_for_char_literal379 )

              # at line 795:18: ( NL )*
              while true # decision 135
                alt_135 = 2
                look_135_0 = @input.peek( 1 )

                if ( look_135_0 == NL )
                  alt_135 = 1

                end
                case alt_135
                when 1
                  # at line 795:18: NL
                  __NL380__ = match( NL, TOKENS_FOLLOWING_NL_IN_set_value_2237 )

                  tree_for_NL380 = @adaptor.create_with_payload( __NL380__ )
                  @adaptor.add_child( root_0, tree_for_NL380 )


                else
                  break # out of loop for decision 135
                end
              end # loop for decision 135
              @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_2240 )
              set_item381 = set_item
              @state.following.pop
              @adaptor.add_child( root_0, set_item381.tree )

            else
              break # out of loop for decision 136
            end
          end # loop for decision 136

        end
        # --> action
        	return_value.val = @set	
        # <-- action
        char_literal382 = match( T__38, TOKENS_FOLLOWING_T__38_IN_set_value_2252 )

        tree_for_char_literal382 = @adaptor.create_with_payload( char_literal382 )
        @adaptor.add_child( root_0, tree_for_char_literal382 )

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
      value383 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 801:4: value
        @state.following.push( TOKENS_FOLLOWING_value_IN_set_item_2263 )
        value383 = value
        @state.following.pop
        @adaptor.add_child( root_0, value383.tree )
        # --> action
        	@set.push(( value383.nil? ? nil : value383.val ))	
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
      primitive_value384 = nil
      reference385 = nil
      set_value386 = nil


      begin
        # at line 806:2: ( primitive_value | reference | set_value )
        alt_138 = 3
        case look_138 = @input.peek( 1 )
        when STRING, NUMBER, BOOLEAN, MULTILINE_STRING then alt_138 = 1
        when ID then alt_138 = 2
        when T__36 then alt_138 = 3
        else
          raise NoViableAlternative( "", 138, 0 )
        end
        case alt_138
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 806:4: primitive_value
          @state.following.push( TOKENS_FOLLOWING_primitive_value_IN_value_2282 )
          primitive_value384 = primitive_value
          @state.following.pop
          @adaptor.add_child( root_0, primitive_value384.tree )
          # --> action

          			return_value.val = ( primitive_value384.nil? ? nil : primitive_value384.val )
          			return_value.type = ( primitive_value384.nil? ? nil : primitive_value384.type )
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 811:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_value_2291 )
          reference385 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference385.tree )
          # --> action

          			return_value.val = ( reference385.nil? ? nil : reference385.val )
          			return_value.type = 'Reference'
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 816:4: set_value
          @state.following.push( TOKENS_FOLLOWING_set_value_IN_value_2300 )
          set_value386 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value386.tree )
          # --> action

          			return_value.val = ( set_value386.nil? ? nil : set_value386.val )
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
      __BOOLEAN387__ = nil
      __NUMBER388__ = nil
      __STRING389__ = nil
      __MULTILINE_STRING390__ = nil

      tree_for_BOOLEAN387 = nil
      tree_for_NUMBER388 = nil
      tree_for_STRING389 = nil
      tree_for_MULTILINE_STRING390 = nil

      begin
        # at line 824:2: ( BOOLEAN | NUMBER | STRING | MULTILINE_STRING )
        alt_139 = 4
        case look_139 = @input.peek( 1 )
        when BOOLEAN then alt_139 = 1
        when NUMBER then alt_139 = 2
        when STRING then alt_139 = 3
        when MULTILINE_STRING then alt_139 = 4
        else
          raise NoViableAlternative( "", 139, 0 )
        end
        case alt_139
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 824:4: BOOLEAN
          __BOOLEAN387__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_2319 )

          tree_for_BOOLEAN387 = @adaptor.create_with_payload( __BOOLEAN387__ )
          @adaptor.add_child( root_0, tree_for_BOOLEAN387 )

          # --> action

          			if __BOOLEAN387__.text == 'true' or __BOOLEAN387__.text == 'on' or __BOOLEAN387__.text == 'yes'
          				return_value.val = true
          			else  # 'false', 'no', 'off'
          				return_value.val = false
          			end
          			return_value.type = 'Boolean'
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 833:4: NUMBER
          __NUMBER388__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_primitive_value_2328 )

          tree_for_NUMBER388 = @adaptor.create_with_payload( __NUMBER388__ )
          @adaptor.add_child( root_0, tree_for_NUMBER388 )

          # --> action

          			return_value.val = __NUMBER388__.text.to_i
          			return_value.type = 'Number'
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 838:4: STRING
          __STRING389__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_primitive_value_2337 )

          tree_for_STRING389 = @adaptor.create_with_payload( __STRING389__ )
          @adaptor.add_child( root_0, tree_for_STRING389 )

          # --> action

          			return_value.val = __STRING389__.text[1,__STRING389__.text.length-2]
          			return_value.type = 'String'
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 843:4: MULTILINE_STRING
          __MULTILINE_STRING390__ = match( MULTILINE_STRING, TOKENS_FOLLOWING_MULTILINE_STRING_IN_primitive_value_2346 )

          tree_for_MULTILINE_STRING390 = @adaptor.create_with_payload( __MULTILINE_STRING390__ )
          @adaptor.add_child( root_0, tree_for_MULTILINE_STRING390 )

          # --> action

          			return_value.val = __MULTILINE_STRING390__.text[2, __MULTILINE_STRING390__.text.length-2]
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
      __ID391__ = nil
      char_literal392 = nil
      __ID393__ = nil

      tree_for_ID391 = nil
      tree_for_char_literal392 = nil
      tree_for_ID393 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 851:4: ID ( '.' ID )*
        __ID391__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_2361 )

        tree_for_ID391 = @adaptor.create_with_payload( __ID391__ )
        @adaptor.add_child( root_0, tree_for_ID391 )

        # at line 851:6: ( '.' ID )*
        while true # decision 140
          alt_140 = 2
          look_140_0 = @input.peek( 1 )

          if ( look_140_0 == T__64 )
            alt_140 = 1

          end
          case alt_140
          when 1
            # at line 851:7: '.' ID
            char_literal392 = match( T__64, TOKENS_FOLLOWING_T__64_IN_path_2363 )

            tree_for_char_literal392 = @adaptor.create_with_payload( char_literal392 )
            @adaptor.add_child( root_0, tree_for_char_literal392 )

            __ID393__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_2364 )

            tree_for_ID393 = @adaptor.create_with_payload( __ID393__ )
            @adaptor.add_child( root_0, tree_for_ID393 )


          else
            break # out of loop for decision 140
          end
        end # loop for decision 140
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
      char_literal395 = nil
      id_ref394 = nil
      id_ref396 = nil

      tree_for_char_literal395 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 855:4: id_ref ( '.' id_ref )*
        @state.following.push( TOKENS_FOLLOWING_id_ref_IN_path_with_index_2377 )
        id_ref394 = id_ref
        @state.following.pop
        @adaptor.add_child( root_0, id_ref394.tree )
        # at line 855:10: ( '.' id_ref )*
        while true # decision 141
          alt_141 = 2
          look_141_0 = @input.peek( 1 )

          if ( look_141_0 == T__64 )
            alt_141 = 1

          end
          case alt_141
          when 1
            # at line 855:11: '.' id_ref
            char_literal395 = match( T__64, TOKENS_FOLLOWING_T__64_IN_path_with_index_2379 )

            tree_for_char_literal395 = @adaptor.create_with_payload( char_literal395 )
            @adaptor.add_child( root_0, tree_for_char_literal395 )

            @state.following.push( TOKENS_FOLLOWING_id_ref_IN_path_with_index_2380 )
            id_ref396 = id_ref
            @state.following.pop
            @adaptor.add_child( root_0, id_ref396.tree )

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
      __ID397__ = nil
      char_literal398 = nil
      __NUMBER399__ = nil
      char_literal400 = nil

      tree_for_ID397 = nil
      tree_for_char_literal398 = nil
      tree_for_NUMBER399 = nil
      tree_for_char_literal400 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 859:4: ID ( '[' NUMBER ']' )?
        __ID397__ = match( ID, TOKENS_FOLLOWING_ID_IN_id_ref_2393 )

        tree_for_ID397 = @adaptor.create_with_payload( __ID397__ )
        @adaptor.add_child( root_0, tree_for_ID397 )

        # at line 859:6: ( '[' NUMBER ']' )?
        alt_142 = 2
        look_142_0 = @input.peek( 1 )

        if ( look_142_0 == T__26 )
          alt_142 = 1
        end
        case alt_142
        when 1
          # at line 859:7: '[' NUMBER ']'
          char_literal398 = match( T__26, TOKENS_FOLLOWING_T__26_IN_id_ref_2395 )

          tree_for_char_literal398 = @adaptor.create_with_payload( char_literal398 )
          @adaptor.add_child( root_0, tree_for_char_literal398 )

          __NUMBER399__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_id_ref_2397 )

          tree_for_NUMBER399 = @adaptor.create_with_payload( __NUMBER399__ )
          @adaptor.add_child( root_0, tree_for_NUMBER399 )

          char_literal400 = match( T__27, TOKENS_FOLLOWING_T__27_IN_id_ref_2399 )

          tree_for_char_literal400 = @adaptor.create_with_payload( char_literal400 )
          @adaptor.add_child( root_0, tree_for_char_literal400 )


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
      path_with_index401 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 863:4: path_with_index
        @state.following.push( TOKENS_FOLLOWING_path_with_index_IN_reference_2416 )
        path_with_index401 = path_with_index
        @state.following.pop
        @adaptor.add_child( root_0, path_with_index401.tree )
        # --> action
        	return_value.val = self.to_ref(( path_with_index401 && @input.to_s( path_with_index401.start, path_with_index401.stop ) ))	
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
      string_literal402 = nil
      path403 = nil

      tree_for_string_literal402 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 868:4: 'isref' path
        string_literal402 = match( T__65, TOKENS_FOLLOWING_T__65_IN_reference_type_2435 )

        tree_for_string_literal402 = @adaptor.create_with_payload( string_literal402 )
        @adaptor.add_child( root_0, tree_for_string_literal402 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_reference_type_2437 )
        path403 = path
        @state.following.pop
        @adaptor.add_child( root_0, path403.tree )
        # --> action

        			return_value.val = { '_context' => 'null',
        				'_isa' => self.to_ref(( path403 && @input.to_s( path403.start, path403.stop ) ))
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
      string_literal404 = nil
      path405 = nil

      tree_for_string_literal404 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 877:4: 'isset' path
        string_literal404 = match( T__40, TOKENS_FOLLOWING_T__40_IN_set_type_2456 )

        tree_for_string_literal404 = @adaptor.create_with_payload( string_literal404 )
        @adaptor.add_child( root_0, tree_for_string_literal404 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_set_type_2458 )
        path405 = path
        @state.following.pop
        @adaptor.add_child( root_0, path405.tree )
        # --> action

        			return_value.val = { '_context' => 'set',
        				'_isa' => self.to_ref(( path405 && @input.to_s( path405.start, path405.stop ) )),
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
      set406 = nil

      tree_for_set406 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set406 = @input.look
        if @input.peek(1) == T__53 || @input.peek(1) == T__56
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set406 ) )
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
      set407 = nil

      tree_for_set407 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set407 = @input.look
        if @input.peek(1) == T__58 || @input.peek(1) == T__66
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
      set408 = nil

      tree_for_set408 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set408 = @input.look
        if @input.peek( 1 ).between?( T__67, T__70 )
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
      set409 = nil

      tree_for_set409 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set409 = @input.look
        if @input.peek( 1 ).between?( T__71, T__74 )
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
    class DFA70 < ANTLR3::DFA
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
      
      @decision = 70
      

      def description
        <<-'__dfa_description__'.strip!
          334:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification )
        __dfa_description__
      end
    end
    class DFA98 < ANTLR3::DFA
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
      
      @decision = 98
      

      def description
        <<-'__dfa_description__'.strip!
          439:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification )
        __dfa_description__
      end
    end
    class DFA118 < ANTLR3::DFA
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
      
      @decision = 118
      

      def description
        <<-'__dfa_description__'.strip!
          551:1: constraint_statement returns [key, val] : ( reference | 'not' reference | reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | conditional_constraint | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | reference binary_comp comp_value | total_constraint );
        __dfa_description__
      end
    end
    class DFA134 < ANTLR3::DFA
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
      
      @decision = 134
      

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
      @dfa70 = DFA70.new( self, 70 )
      @dfa98 = DFA98.new( self, 98 )
      @dfa118 = DFA118.new( self, 118 )
      @dfa134 = DFA134.new( self, 134 )

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
    TOKENS_FOLLOWING_T__37_IN_parameters_832 = Set[ 6 ]
    TOKENS_FOLLOWING_parameter_IN_parameters_834 = Set[ 37, 38 ]
    TOKENS_FOLLOWING_T__38_IN_parameters_838 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_850 = Set[ 65 ]
    TOKENS_FOLLOWING_reference_type_IN_parameter_852 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_861 = Set[ 39 ]
    TOKENS_FOLLOWING_T__39_IN_parameter_863 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_parameter_865 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_874 = Set[ 40 ]
    TOKENS_FOLLOWING_T__40_IN_parameter_876 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_parameter_878 = Set[ 1 ]
    TOKENS_FOLLOWING_T__33_IN_conditions_893 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_conditions_901 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_conditions_903 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_conditions_906 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_conditions_908 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_conditions_910 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__34_IN_effects_927 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_effects_935 = Set[ 4, 6, 21, 48, 61 ]
    TOKENS_FOLLOWING_NL_IN_effects_937 = Set[ 4, 6, 21, 48, 61 ]
    TOKENS_FOLLOWING_mutation_body_IN_effects_943 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_effects_948 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_effects_950 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__41_IN_goal_constraint_966 = Set[ 4, 20, 42 ]
    TOKENS_FOLLOWING_T__42_IN_goal_constraint_968 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_constraint_971 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_constraint_980 = Set[ 4, 6, 21, 28, 43, 44, 45, 46, 47, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_constraint_982 = Set[ 4, 6, 21, 28, 43, 44, 45, 46, 47, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_goal_body_IN_goal_constraint_985 = Set[ 6, 21, 28, 43, 44, 45, 46, 47, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_T__21_IN_goal_constraint_988 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_constraint_990 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_constraint_statement_IN_goal_body_1013 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_namespace_IN_goal_body_1026 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_iterator_IN_goal_body_1033 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_class_quantification_IN_goal_body_1040 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1049 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__43_IN_goal_body_1056 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1058 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1067 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1069 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1072 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1074 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1076 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__44_IN_goal_body_1086 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1088 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1097 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1099 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1102 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1104 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1106 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__45_IN_goal_body_1120 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_goal_body_1122 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1124 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1133 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1135 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1138 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1140 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1142 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__46_IN_goal_body_1152 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1154 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1163 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1165 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1168 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1170 = Set[ 4, 29, 45 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1172 = Set[ 4, 29, 45 ]
    TOKENS_FOLLOWING_T__29_IN_goal_body_1183 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__45_IN_goal_body_1190 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_goal_body_1192 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1204 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1213 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1215 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1218 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1220 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1222 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__47_IN_goal_body_1240 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1242 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1251 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1253 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1256 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1258 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1260 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_T__29_IN_goal_body_1269 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1271 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1280 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1282 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1285 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1287 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1289 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__20_IN_nested_constraint_1309 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_nested_constraint_1311 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_nested_constraint_1314 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_nested_constraint_1316 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_constraint_1327 = Set[ 42 ]
    TOKENS_FOLLOWING_T__42_IN_constraint_1329 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_1337 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_constraint_1339 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_constraint_1342 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_1344 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_1346 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_1369 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_namespace_IN_constraint_body_1382 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_iterator_IN_constraint_body_1389 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_class_quantification_IN_constraint_body_1396 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_body_1405 = Set[ 1, 4, 6, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_path_IN_constraint_namespace_1419 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1421 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_namespace_1424 = Set[ 4, 6, 21, 28, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1426 = Set[ 4, 6, 21, 28, 55, 59 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_namespace_1430 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1438 = Set[ 4, 6, 21, 28, 55, 59 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_namespace_1443 = Set[ 1 ]
    TOKENS_FOLLOWING_T__48_IN_constraint_iterator_1454 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_constraint_iterator_1456 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_constraint_iterator_1458 = Set[ 49 ]
    TOKENS_FOLLOWING_T__49_IN_constraint_iterator_1460 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_constraint_iterator_1462 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_constraint_iterator_1464 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1466 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_iterator_1469 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1471 = Set[ 4, 6, 21, 28, 55, 59 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_iterator_1481 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1489 = Set[ 4, 6, 21, 28, 55, 59 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_iterator_1496 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_quantification_keyword_0 = Set[ 1 ]
    TOKENS_FOLLOWING_quantification_keyword_IN_constraint_class_quantification_1532 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_constraint_class_quantification_1534 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_constraint_class_quantification_1536 = Set[ 49 ]
    TOKENS_FOLLOWING_T__49_IN_constraint_class_quantification_1538 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_constraint_class_quantification_1540 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_constraint_class_quantification_1542 = Set[ 4, 20, 53, 71, 72, 73, 74 ]
    TOKENS_FOLLOWING_binary_comp_IN_constraint_class_quantification_1554 = Set[ 7 ]
    TOKENS_FOLLOWING_T__53_IN_constraint_class_quantification_1567 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_constraint_class_quantification_1583 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1597 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_class_quantification_1600 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1602 = Set[ 4, 6, 21, 28, 48, 54, 55, 59 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_class_quantification_1609 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1619 = Set[ 4, 6, 21, 28, 48, 54, 55, 59 ]
    TOKENS_FOLLOWING_constraint_different_IN_constraint_class_quantification_1626 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1628 = Set[ 4, 6, 21, 28, 48, 54, 55, 59 ]
    TOKENS_FOLLOWING_constraint_iterator_IN_constraint_class_quantification_1635 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1637 = Set[ 4, 6, 21, 28, 48, 54, 55, 59 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_class_quantification_1645 = Set[ 1 ]
    TOKENS_FOLLOWING_T__54_IN_constraint_different_1664 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_constraint_different_1666 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_constraint_different_1668 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_constraint_different_1670 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1689 = Set[ 1 ]
    TOKENS_FOLLOWING_T__55_IN_constraint_statement_1698 = Set[ 6 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1700 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1709 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1711 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_1713 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1722 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1724 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_1726 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1735 = Set[ 58, 66 ]
    TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1737 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_1739 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1748 = Set[ 58, 66 ]
    TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1750 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_1752 = Set[ 1 ]
    TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_1761 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1770 = Set[ 56, 57 ]
    TOKENS_FOLLOWING_T__56_IN_constraint_statement_1772 = Set[ 57 ]
    TOKENS_FOLLOWING_T__57_IN_constraint_statement_1775 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_1777 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1786 = Set[ 55, 58 ]
    TOKENS_FOLLOWING_set_IN_constraint_statement_1788 = Set[ 57 ]
    TOKENS_FOLLOWING_T__57_IN_constraint_statement_1794 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_1796 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1805 = Set[ 71, 72, 73, 74 ]
    TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_1807 = Set[ 6, 7 ]
    TOKENS_FOLLOWING_comp_value_IN_constraint_statement_1809 = Set[ 1 ]
    TOKENS_FOLLOWING_total_constraint_IN_constraint_statement_1818 = Set[ 1 ]
    TOKENS_FOLLOWING_T__59_IN_total_constraint_1829 = Set[ 6 ]
    TOKENS_FOLLOWING_total_statement_IN_total_constraint_1831 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_total_constraint_1833 = Set[ 71, 72, 73, 74 ]
    TOKENS_FOLLOWING_binary_comp_IN_total_constraint_1835 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_total_constraint_1837 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_total_statement_1848 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_total_statement_1850 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_total_statement_1852 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_comp_value_1867 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_comp_value_1876 = Set[ 1 ]
    TOKENS_FOLLOWING_T__28_IN_conditional_constraint_1895 = Set[ 6, 20, 28, 55, 59 ]
    TOKENS_FOLLOWING_conditional_constraint_if_part_IN_conditional_constraint_1903 = Set[ 29 ]
    TOKENS_FOLLOWING_conditional_constraint_then_part_IN_conditional_constraint_1907 = Set[ 1 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_if_part_1922 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_conditional_constraint_if_part_1924 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__20_IN_conditional_constraint_if_part_1934 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_conditional_constraint_if_part_1942 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_conditional_constraint_if_part_1945 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_conditional_constraint_if_part_1949 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_conditional_constraint_if_part_1951 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__29_IN_conditional_constraint_then_part_1967 = Set[ 6, 28, 55, 59 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_part_1969 = Set[ 1 ]
    TOKENS_FOLLOWING_T__29_IN_conditional_constraint_then_part_1978 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_conditional_constraint_then_part_1986 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_conditional_constraint_then_part_1988 = Set[ 4, 6, 21, 28, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_conditional_constraint_then_part_1991 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_conditional_constraint_then_part_1993 = Set[ 1 ]
    TOKENS_FOLLOWING_mutation_statement_IN_mutation_body_2015 = Set[ 4 ]
    TOKENS_FOLLOWING_mutation_iterator_IN_mutation_body_2028 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_body_2037 = Set[ 1, 4, 6, 48, 61 ]
    TOKENS_FOLLOWING_T__48_IN_mutation_iterator_2052 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_iterator_2054 = Set[ 49 ]
    TOKENS_FOLLOWING_T__49_IN_mutation_iterator_2056 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_mutation_iterator_2058 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_2060 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_mutation_iterator_2063 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_2065 = Set[ 4, 6, 21, 61 ]
    TOKENS_FOLLOWING_mutation_statement_IN_mutation_iterator_2075 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_2083 = Set[ 4, 6, 21, 61 ]
    TOKENS_FOLLOWING_T__21_IN_mutation_iterator_2090 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2109 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_mutation_statement_2111 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_2113 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2122 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_mutation_statement_2124 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_mutation_statement_2126 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2135 = Set[ 67, 68, 69, 70 ]
    TOKENS_FOLLOWING_binary_op_IN_mutation_statement_2137 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_mutation_statement_2139 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2148 = Set[ 56 ]
    TOKENS_FOLLOWING_T__56_IN_mutation_statement_2150 = Set[ 60 ]
    TOKENS_FOLLOWING_T__60_IN_mutation_statement_2152 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_statement_2154 = Set[ 1, 20 ]
    TOKENS_FOLLOWING_object_body_IN_mutation_statement_2162 = Set[ 1 ]
    TOKENS_FOLLOWING_T__61_IN_mutation_statement_2172 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_statement_2174 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2183 = Set[ 62 ]
    TOKENS_FOLLOWING_T__62_IN_mutation_statement_2185 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_2187 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_mutation_statement_2189 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2198 = Set[ 63 ]
    TOKENS_FOLLOWING_T__63_IN_mutation_statement_2200 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_2202 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_mutation_statement_2204 = Set[ 1 ]
    TOKENS_FOLLOWING_T__36_IN_set_value_2223 = Set[ 5, 6, 7, 9, 10, 36, 38 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_2232 = Set[ 37, 38 ]
    TOKENS_FOLLOWING_T__37_IN_set_value_2235 = Set[ 4, 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_NL_IN_set_value_2237 = Set[ 4, 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_2240 = Set[ 37, 38 ]
    TOKENS_FOLLOWING_T__38_IN_set_value_2252 = Set[ 1 ]
    TOKENS_FOLLOWING_value_IN_set_item_2263 = Set[ 1 ]
    TOKENS_FOLLOWING_primitive_value_IN_value_2282 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_value_2291 = Set[ 1 ]
    TOKENS_FOLLOWING_set_value_IN_value_2300 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_2319 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_primitive_value_2328 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_primitive_value_2337 = Set[ 1 ]
    TOKENS_FOLLOWING_MULTILINE_STRING_IN_primitive_value_2346 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_path_2361 = Set[ 1, 64 ]
    TOKENS_FOLLOWING_T__64_IN_path_2363 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_path_2364 = Set[ 1, 64 ]
    TOKENS_FOLLOWING_id_ref_IN_path_with_index_2377 = Set[ 1, 64 ]
    TOKENS_FOLLOWING_T__64_IN_path_with_index_2379 = Set[ 6 ]
    TOKENS_FOLLOWING_id_ref_IN_path_with_index_2380 = Set[ 1, 64 ]
    TOKENS_FOLLOWING_ID_IN_id_ref_2393 = Set[ 1, 26 ]
    TOKENS_FOLLOWING_T__26_IN_id_ref_2395 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_id_ref_2397 = Set[ 27 ]
    TOKENS_FOLLOWING_T__27_IN_id_ref_2399 = Set[ 1 ]
    TOKENS_FOLLOWING_path_with_index_IN_reference_2416 = Set[ 1 ]
    TOKENS_FOLLOWING_T__65_IN_reference_type_2435 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_reference_type_2437 = Set[ 1 ]
    TOKENS_FOLLOWING_T__40_IN_set_type_2456 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_set_type_2458 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_not_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_comp_0 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end

