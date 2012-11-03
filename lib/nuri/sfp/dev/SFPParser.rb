#!/usr/bin/env ruby
#
# SFP.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: SFP.g
# Generated at: 2012-11-03 20:01:49
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
                    "'isa'", "'['", "']'", "'public'", "'if'", "'then'", 
                    "'or'", "'operator'", "'cost'", "'condition'", "'effect'", 
                    "'procedure'", "'('", "','", "')'", "'areall'", "'goal'", 
                    "'constraint'", "'always'", "'sometime'", "'within'", 
                    "'after'", "'before'", "'foreach'", "'as'", "'forall'", 
                    "'exist'", "'forsome'", "'='", "':different'", "'not'", 
                    "'is'", "'in'", "'isnt'", "'total('", "'new'", "'delete'", 
                    "'add('", "'remove('", "'.'", "'isref'", "'isset'", 
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
                     :comp_value, :conditional_constraint, :conditional_constraint_then, 
                     :mutation_body, :mutation_iterator, :mutation_statement, 
                     :set_value, :set_item, :value, :primitive_value, :path, 
                     :path_with_index, :id_ref, :reference, :reference_type, 
                     :set_type, :equals_op, :not_equals_op, :binary_op, 
                     :binary_comp ].freeze


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

          if ( look_3_0 == T__23 || look_3_0 == T__36 )
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
        elsif ( look_6_0 == T__36 )
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
            elsif ( look_12_2 == NL || look_12_2 == T__20 || look_12_2 == T__25 || look_12_2 == T__53 || look_12_2 == T__56 || look_12_2.between?( T__65, T__66 ) )
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
            elsif ( look_16_0 == T__36 )
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
          when T__66 then alt_23 = 3
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
          when ID, T__28 then alt_28 = 1
          when T__29 then alt_28 = 2
          when T__32 then alt_28 = 3
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
    # 174:1: object_attribute : ( ( 'public' )? attribute | ( 'public' )? ID equals_op NULL ( NL )+ );
    # 
    def object_attribute
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )
      return_value = ObjectAttributeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal65 = nil
      string_literal67 = nil
      __ID68__ = nil
      __NULL70__ = nil
      __NL71__ = nil
      attribute66 = nil
      equals_op69 = nil

      tree_for_string_literal65 = nil
      tree_for_string_literal67 = nil
      tree_for_ID68 = nil
      tree_for_NULL70 = nil
      tree_for_NL71 = nil

      begin
        # at line 175:2: ( ( 'public' )? attribute | ( 'public' )? ID equals_op NULL ( NL )+ )
        alt_32 = 2
        look_32_0 = @input.peek( 1 )

        if ( look_32_0 == T__28 )
          look_32_1 = @input.peek( 2 )

          if ( look_32_1 == ID )
            look_32_2 = @input.peek( 3 )

            if ( look_32_2 == T__53 || look_32_2 == T__56 )
              look_32_3 = @input.peek( 4 )

              if ( look_32_3.between?( STRING, NUMBER ) || look_32_3.between?( BOOLEAN, MULTILINE_STRING ) || look_32_3 == T__37 )
                alt_32 = 1
              elsif ( look_32_3 == NULL )
                alt_32 = 2
              else
                raise NoViableAlternative( "", 32, 3 )
              end
            elsif ( look_32_2 == NL || look_32_2 == T__20 || look_32_2 == T__25 || look_32_2.between?( T__65, T__66 ) )
              alt_32 = 1
            else
              raise NoViableAlternative( "", 32, 2 )
            end
          else
            raise NoViableAlternative( "", 32, 1 )
          end
        elsif ( look_32_0 == ID )
          look_32_2 = @input.peek( 2 )

          if ( look_32_2 == T__53 || look_32_2 == T__56 )
            look_32_3 = @input.peek( 3 )

            if ( look_32_3.between?( STRING, NUMBER ) || look_32_3.between?( BOOLEAN, MULTILINE_STRING ) || look_32_3 == T__37 )
              alt_32 = 1
            elsif ( look_32_3 == NULL )
              alt_32 = 2
            else
              raise NoViableAlternative( "", 32, 3 )
            end
          elsif ( look_32_2 == NL || look_32_2 == T__20 || look_32_2 == T__25 || look_32_2.between?( T__65, T__66 ) )
            alt_32 = 1
          else
            raise NoViableAlternative( "", 32, 2 )
          end
        else
          raise NoViableAlternative( "", 32, 0 )
        end
        case alt_32
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 175:4: ( 'public' )? attribute
          # at line 175:4: ( 'public' )?
          alt_29 = 2
          look_29_0 = @input.peek( 1 )

          if ( look_29_0 == T__28 )
            alt_29 = 1
          end
          case alt_29
          when 1
            # at line 175:5: 'public'
            string_literal65 = match( T__28, TOKENS_FOLLOWING_T__28_IN_object_attribute_448 )

            tree_for_string_literal65 = @adaptor.create_with_payload( string_literal65 )
            @adaptor.add_child( root_0, tree_for_string_literal65 )

            # --> action
             puts 'public attr' 
            # <-- action

          end
          @state.following.push( TOKENS_FOLLOWING_attribute_IN_object_attribute_455 )
          attribute66 = attribute
          @state.following.pop
          @adaptor.add_child( root_0, attribute66.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 176:4: ( 'public' )? ID equals_op NULL ( NL )+
          # at line 176:4: ( 'public' )?
          alt_30 = 2
          look_30_0 = @input.peek( 1 )

          if ( look_30_0 == T__28 )
            alt_30 = 1
          end
          case alt_30
          when 1
            # at line 176:5: 'public'
            string_literal67 = match( T__28, TOKENS_FOLLOWING_T__28_IN_object_attribute_461 )

            tree_for_string_literal67 = @adaptor.create_with_payload( string_literal67 )
            @adaptor.add_child( root_0, tree_for_string_literal67 )

            # --> action
             puts 'public attr' 
            # <-- action

          end
          __ID68__ = match( ID, TOKENS_FOLLOWING_ID_IN_object_attribute_468 )

          tree_for_ID68 = @adaptor.create_with_payload( __ID68__ )
          @adaptor.add_child( root_0, tree_for_ID68 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_object_attribute_470 )
          equals_op69 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op69.tree )
          __NULL70__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_object_attribute_472 )

          tree_for_NULL70 = @adaptor.create_with_payload( __NULL70__ )
          @adaptor.add_child( root_0, tree_for_NULL70 )

          # at file 176:58: ( NL )+
          match_count_31 = 0
          while true
            alt_31 = 2
            look_31_0 = @input.peek( 1 )

            if ( look_31_0 == NL )
              alt_31 = 1

            end
            case alt_31
            when 1
              # at line 176:58: NL
              __NL71__ = match( NL, TOKENS_FOLLOWING_NL_IN_object_attribute_474 )

              tree_for_NL71 = @adaptor.create_with_payload( __NL71__ )
              @adaptor.add_child( root_0, tree_for_NL71 )


            else
              match_count_31 > 0 and break
              eee = EarlyExit(31)


              raise eee
            end
            match_count_31 += 1
          end

          # --> action
          	@now[__ID68__.text] = self.null_value	
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
      string_literal72 = nil
      __NL74__ = nil
      string_literal75 = nil
      __NL76__ = nil
      char_literal77 = nil
      __NL78__ = nil
      char_literal80 = nil
      __NL81__ = nil
      string_literal82 = nil
      __NL83__ = nil
      char_literal84 = nil
      __NL85__ = nil
      char_literal87 = nil
      __NL88__ = nil
      dep_effect73 = nil
      constraint_body79 = nil
      constraint_body86 = nil

      tree_for_string_literal72 = nil
      tree_for_NL74 = nil
      tree_for_string_literal75 = nil
      tree_for_NL76 = nil
      tree_for_char_literal77 = nil
      tree_for_NL78 = nil
      tree_for_char_literal80 = nil
      tree_for_NL81 = nil
      tree_for_string_literal82 = nil
      tree_for_NL83 = nil
      tree_for_char_literal84 = nil
      tree_for_NL85 = nil
      tree_for_char_literal87 = nil
      tree_for_NL88 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 181:4: 'if' dep_effect ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )* ( NL )+
        string_literal72 = match( T__29, TOKENS_FOLLOWING_T__29_IN_state_dependency_490 )

        tree_for_string_literal72 = @adaptor.create_with_payload( string_literal72 )
        @adaptor.add_child( root_0, tree_for_string_literal72 )

        @state.following.push( TOKENS_FOLLOWING_dep_effect_IN_state_dependency_494 )
        dep_effect73 = dep_effect
        @state.following.pop
        @adaptor.add_child( root_0, dep_effect73.tree )
        # at line 182:14: ( NL )*
        while true # decision 33
          alt_33 = 2
          look_33_0 = @input.peek( 1 )

          if ( look_33_0 == NL )
            alt_33 = 1

          end
          case alt_33
          when 1
            # at line 182:14: NL
            __NL74__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_496 )

            tree_for_NL74 = @adaptor.create_with_payload( __NL74__ )
            @adaptor.add_child( root_0, tree_for_NL74 )


          else
            break # out of loop for decision 33
          end
        end # loop for decision 33
        string_literal75 = match( T__30, TOKENS_FOLLOWING_T__30_IN_state_dependency_499 )

        tree_for_string_literal75 = @adaptor.create_with_payload( string_literal75 )
        @adaptor.add_child( root_0, tree_for_string_literal75 )

        # at line 182:25: ( NL )*
        while true # decision 34
          alt_34 = 2
          look_34_0 = @input.peek( 1 )

          if ( look_34_0 == NL )
            alt_34 = 1

          end
          case alt_34
          when 1
            # at line 182:25: NL
            __NL76__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_501 )

            tree_for_NL76 = @adaptor.create_with_payload( __NL76__ )
            @adaptor.add_child( root_0, tree_for_NL76 )


          else
            break # out of loop for decision 34
          end
        end # loop for decision 34
        char_literal77 = match( T__20, TOKENS_FOLLOWING_T__20_IN_state_dependency_504 )

        tree_for_char_literal77 = @adaptor.create_with_payload( char_literal77 )
        @adaptor.add_child( root_0, tree_for_char_literal77 )

        # at line 183:3: ( NL )*
        while true # decision 35
          alt_35 = 2
          look_35_0 = @input.peek( 1 )

          if ( look_35_0 == NL )
            alt_35 = 1

          end
          case alt_35
          when 1
            # at line 183:3: NL
            __NL78__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_508 )

            tree_for_NL78 = @adaptor.create_with_payload( __NL78__ )
            @adaptor.add_child( root_0, tree_for_NL78 )


          else
            break # out of loop for decision 35
          end
        end # loop for decision 35
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_state_dependency_511 )
        constraint_body79 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body79.tree )
        char_literal80 = match( T__21, TOKENS_FOLLOWING_T__21_IN_state_dependency_516 )

        tree_for_char_literal80 = @adaptor.create_with_payload( char_literal80 )
        @adaptor.add_child( root_0, tree_for_char_literal80 )

        # at line 185:3: ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )*
        while true # decision 39
          alt_39 = 2
          alt_39 = @dfa39.predict( @input )
          case alt_39
          when 1
            # at line 185:5: ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}'
            # at line 185:5: ( NL )*
            while true # decision 36
              alt_36 = 2
              look_36_0 = @input.peek( 1 )

              if ( look_36_0 == NL )
                alt_36 = 1

              end
              case alt_36
              when 1
                # at line 185:5: NL
                __NL81__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_522 )

                tree_for_NL81 = @adaptor.create_with_payload( __NL81__ )
                @adaptor.add_child( root_0, tree_for_NL81 )


              else
                break # out of loop for decision 36
              end
            end # loop for decision 36
            string_literal82 = match( T__31, TOKENS_FOLLOWING_T__31_IN_state_dependency_525 )

            tree_for_string_literal82 = @adaptor.create_with_payload( string_literal82 )
            @adaptor.add_child( root_0, tree_for_string_literal82 )

            # at line 185:14: ( NL )*
            while true # decision 37
              alt_37 = 2
              look_37_0 = @input.peek( 1 )

              if ( look_37_0 == NL )
                alt_37 = 1

              end
              case alt_37
              when 1
                # at line 185:14: NL
                __NL83__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_527 )

                tree_for_NL83 = @adaptor.create_with_payload( __NL83__ )
                @adaptor.add_child( root_0, tree_for_NL83 )


              else
                break # out of loop for decision 37
              end
            end # loop for decision 37
            char_literal84 = match( T__20, TOKENS_FOLLOWING_T__20_IN_state_dependency_530 )

            tree_for_char_literal84 = @adaptor.create_with_payload( char_literal84 )
            @adaptor.add_child( root_0, tree_for_char_literal84 )

            # at line 186:3: ( NL )*
            while true # decision 38
              alt_38 = 2
              look_38_0 = @input.peek( 1 )

              if ( look_38_0 == NL )
                alt_38 = 1

              end
              case alt_38
              when 1
                # at line 186:3: NL
                __NL85__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_534 )

                tree_for_NL85 = @adaptor.create_with_payload( __NL85__ )
                @adaptor.add_child( root_0, tree_for_NL85 )


              else
                break # out of loop for decision 38
              end
            end # loop for decision 38
            @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_state_dependency_537 )
            constraint_body86 = constraint_body
            @state.following.pop
            @adaptor.add_child( root_0, constraint_body86.tree )
            char_literal87 = match( T__21, TOKENS_FOLLOWING_T__21_IN_state_dependency_541 )

            tree_for_char_literal87 = @adaptor.create_with_payload( char_literal87 )
            @adaptor.add_child( root_0, tree_for_char_literal87 )


          else
            break # out of loop for decision 39
          end
        end # loop for decision 39
        # at file 188:3: ( NL )+
        match_count_40 = 0
        while true
          alt_40 = 2
          look_40_0 = @input.peek( 1 )

          if ( look_40_0 == NL )
            alt_40 = 1

          end
          case alt_40
          when 1
            # at line 188:3: NL
            __NL88__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_547 )

            tree_for_NL88 = @adaptor.create_with_payload( __NL88__ )
            @adaptor.add_child( root_0, tree_for_NL88 )


          else
            match_count_40 > 0 and break
            eee = EarlyExit(40)


            raise eee
          end
          match_count_40 += 1
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
      __NULL92__ = nil
      reference89 = nil
      equals_op90 = nil
      value91 = nil

      tree_for_NULL92 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 192:4: reference equals_op ( value | NULL )
        @state.following.push( TOKENS_FOLLOWING_reference_IN_dep_effect_559 )
        reference89 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference89.tree )
        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_dep_effect_561 )
        equals_op90 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op90.tree )
        # at line 193:3: ( value | NULL )
        alt_41 = 2
        look_41_0 = @input.peek( 1 )

        if ( look_41_0.between?( STRING, NUMBER ) || look_41_0.between?( BOOLEAN, MULTILINE_STRING ) || look_41_0 == T__37 )
          alt_41 = 1
        elsif ( look_41_0 == NULL )
          alt_41 = 2
        else
          raise NoViableAlternative( "", 41, 0 )
        end
        case alt_41
        when 1
          # at line 193:5: value
          @state.following.push( TOKENS_FOLLOWING_value_IN_dep_effect_568 )
          value91 = value
          @state.following.pop
          @adaptor.add_child( root_0, value91.tree )

        when 2
          # at line 194:5: NULL
          __NULL92__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_dep_effect_574 )

          tree_for_NULL92 = @adaptor.create_with_payload( __NULL92__ )
          @adaptor.add_child( root_0, tree_for_NULL92 )


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
      string_literal93 = nil
      __ID94__ = nil
      char_literal95 = nil
      __NL96__ = nil
      string_literal97 = nil
      __NUMBER99__ = nil
      __NL100__ = nil
      char_literal103 = nil
      __NL104__ = nil
      equals_op98 = nil
      op_conditions101 = nil
      op_effects102 = nil

      tree_for_string_literal93 = nil
      tree_for_ID94 = nil
      tree_for_char_literal95 = nil
      tree_for_NL96 = nil
      tree_for_string_literal97 = nil
      tree_for_NUMBER99 = nil
      tree_for_NL100 = nil
      tree_for_char_literal103 = nil
      tree_for_NL104 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 199:4: 'operator' ID '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( op_conditions )? op_effects '}' ( NL )+
        string_literal93 = match( T__32, TOKENS_FOLLOWING_T__32_IN_operator_590 )

        tree_for_string_literal93 = @adaptor.create_with_payload( string_literal93 )
        @adaptor.add_child( root_0, tree_for_string_literal93 )

        __ID94__ = match( ID, TOKENS_FOLLOWING_ID_IN_operator_592 )

        tree_for_ID94 = @adaptor.create_with_payload( __ID94__ )
        @adaptor.add_child( root_0, tree_for_ID94 )

        char_literal95 = match( T__20, TOKENS_FOLLOWING_T__20_IN_operator_594 )

        tree_for_char_literal95 = @adaptor.create_with_payload( char_literal95 )
        @adaptor.add_child( root_0, tree_for_char_literal95 )

        # at line 199:22: ( NL )*
        while true # decision 42
          alt_42 = 2
          look_42_0 = @input.peek( 1 )

          if ( look_42_0 == NL )
            alt_42 = 1

          end
          case alt_42
          when 1
            # at line 199:22: NL
            __NL96__ = match( NL, TOKENS_FOLLOWING_NL_IN_operator_596 )

            tree_for_NL96 = @adaptor.create_with_payload( __NL96__ )
            @adaptor.add_child( root_0, tree_for_NL96 )


          else
            break # out of loop for decision 42
          end
        end # loop for decision 42
        # --> action

        			@now[__ID94__.text] = { '_self' => __ID94__.text,
        				'_context' => 'operator',
        				'_parent' => @now,
        				'_cost' => 1,
        				'_condition' => { '_context' => 'constraint' },
        				'_effect' => { '_context' => 'mutation' }
        			}
        			@now = @now[__ID94__.text]
        		
        # <-- action
        # at line 210:3: ( 'cost' equals_op NUMBER ( NL )+ )?
        alt_44 = 2
        look_44_0 = @input.peek( 1 )

        if ( look_44_0 == T__33 )
          alt_44 = 1
        end
        case alt_44
        when 1
          # at line 210:5: 'cost' equals_op NUMBER ( NL )+
          string_literal97 = match( T__33, TOKENS_FOLLOWING_T__33_IN_operator_607 )

          tree_for_string_literal97 = @adaptor.create_with_payload( string_literal97 )
          @adaptor.add_child( root_0, tree_for_string_literal97 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_operator_609 )
          equals_op98 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op98.tree )
          __NUMBER99__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_operator_611 )

          tree_for_NUMBER99 = @adaptor.create_with_payload( __NUMBER99__ )
          @adaptor.add_child( root_0, tree_for_NUMBER99 )

          # at file 210:29: ( NL )+
          match_count_43 = 0
          while true
            alt_43 = 2
            look_43_0 = @input.peek( 1 )

            if ( look_43_0 == NL )
              alt_43 = 1

            end
            case alt_43
            when 1
              # at line 210:29: NL
              __NL100__ = match( NL, TOKENS_FOLLOWING_NL_IN_operator_613 )

              tree_for_NL100 = @adaptor.create_with_payload( __NL100__ )
              @adaptor.add_child( root_0, tree_for_NL100 )


            else
              match_count_43 > 0 and break
              eee = EarlyExit(43)


              raise eee
            end
            match_count_43 += 1
          end

          # --> action
          	@now['_cost'] = __NUMBER99__.text.to_i	
          # <-- action

        end
        # at line 214:3: ( op_conditions )?
        alt_45 = 2
        look_45_0 = @input.peek( 1 )

        if ( look_45_0 == T__34 )
          alt_45 = 1
        end
        case alt_45
        when 1
          # at line 214:3: op_conditions
          @state.following.push( TOKENS_FOLLOWING_op_conditions_IN_operator_632 )
          op_conditions101 = op_conditions
          @state.following.pop
          @adaptor.add_child( root_0, op_conditions101.tree )

        end
        @state.following.push( TOKENS_FOLLOWING_op_effects_IN_operator_635 )
        op_effects102 = op_effects
        @state.following.pop
        @adaptor.add_child( root_0, op_effects102.tree )
        char_literal103 = match( T__21, TOKENS_FOLLOWING_T__21_IN_operator_639 )

        tree_for_char_literal103 = @adaptor.create_with_payload( char_literal103 )
        @adaptor.add_child( root_0, tree_for_char_literal103 )

        # at file 215:7: ( NL )+
        match_count_46 = 0
        while true
          alt_46 = 2
          look_46_0 = @input.peek( 1 )

          if ( look_46_0 == NL )
            alt_46 = 1

          end
          case alt_46
          when 1
            # at line 215:7: NL
            __NL104__ = match( NL, TOKENS_FOLLOWING_NL_IN_operator_641 )

            tree_for_NL104 = @adaptor.create_with_payload( __NL104__ )
            @adaptor.add_child( root_0, tree_for_NL104 )


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
      __ID105__ = nil
      __NL108__ = nil
      equals_op106 = nil
      reference107 = nil

      tree_for_ID105 = nil
      tree_for_NL108 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 220:4: ID equals_op reference ( NL )+
        __ID105__ = match( ID, TOKENS_FOLLOWING_ID_IN_op_param_657 )

        tree_for_ID105 = @adaptor.create_with_payload( __ID105__ )
        @adaptor.add_child( root_0, tree_for_ID105 )

        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_op_param_659 )
        equals_op106 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op106.tree )
        @state.following.push( TOKENS_FOLLOWING_reference_IN_op_param_661 )
        reference107 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference107.tree )
        # at file 220:27: ( NL )+
        match_count_47 = 0
        while true
          alt_47 = 2
          look_47_0 = @input.peek( 1 )

          if ( look_47_0 == NL )
            alt_47 = 1

          end
          case alt_47
          when 1
            # at line 220:27: NL
            __NL108__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_param_663 )

            tree_for_NL108 = @adaptor.create_with_payload( __NL108__ )
            @adaptor.add_child( root_0, tree_for_NL108 )


          else
            match_count_47 > 0 and break
            eee = EarlyExit(47)


            raise eee
          end
          match_count_47 += 1
        end

        # --> action
        	@now[__ID105__.text] = ( reference107.nil? ? nil : reference107.val )	
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
      string_literal109 = nil
      char_literal110 = nil
      __NL111__ = nil
      char_literal113 = nil
      __NL114__ = nil
      op_statement112 = nil

      tree_for_string_literal109 = nil
      tree_for_char_literal110 = nil
      tree_for_NL111 = nil
      tree_for_char_literal113 = nil
      tree_for_NL114 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 225:4: 'condition' '{' ( NL )* ( op_statement )* '}' ( NL )+
        string_literal109 = match( T__34, TOKENS_FOLLOWING_T__34_IN_op_conditions_679 )

        tree_for_string_literal109 = @adaptor.create_with_payload( string_literal109 )
        @adaptor.add_child( root_0, tree_for_string_literal109 )

        char_literal110 = match( T__20, TOKENS_FOLLOWING_T__20_IN_op_conditions_681 )

        tree_for_char_literal110 = @adaptor.create_with_payload( char_literal110 )
        @adaptor.add_child( root_0, tree_for_char_literal110 )

        # at line 225:20: ( NL )*
        while true # decision 48
          alt_48 = 2
          look_48_0 = @input.peek( 1 )

          if ( look_48_0 == NL )
            alt_48 = 1

          end
          case alt_48
          when 1
            # at line 225:20: NL
            __NL111__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_conditions_683 )

            tree_for_NL111 = @adaptor.create_with_payload( __NL111__ )
            @adaptor.add_child( root_0, tree_for_NL111 )


          else
            break # out of loop for decision 48
          end
        end # loop for decision 48
        # --> action

        			@now['_condition']['_parent'] = @now
        			@now = @now['_condition']
        		
        # <-- action
        # at line 230:3: ( op_statement )*
        while true # decision 49
          alt_49 = 2
          look_49_0 = @input.peek( 1 )

          if ( look_49_0 == ID )
            alt_49 = 1

          end
          case alt_49
          when 1
            # at line 230:3: op_statement
            @state.following.push( TOKENS_FOLLOWING_op_statement_IN_op_conditions_692 )
            op_statement112 = op_statement
            @state.following.pop
            @adaptor.add_child( root_0, op_statement112.tree )

          else
            break # out of loop for decision 49
          end
        end # loop for decision 49
        char_literal113 = match( T__21, TOKENS_FOLLOWING_T__21_IN_op_conditions_697 )

        tree_for_char_literal113 = @adaptor.create_with_payload( char_literal113 )
        @adaptor.add_child( root_0, tree_for_char_literal113 )

        # at file 231:7: ( NL )+
        match_count_50 = 0
        while true
          alt_50 = 2
          look_50_0 = @input.peek( 1 )

          if ( look_50_0 == NL )
            alt_50 = 1

          end
          case alt_50
          when 1
            # at line 231:7: NL
            __NL114__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_conditions_699 )

            tree_for_NL114 = @adaptor.create_with_payload( __NL114__ )
            @adaptor.add_child( root_0, tree_for_NL114 )


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
      string_literal115 = nil
      char_literal116 = nil
      __NL117__ = nil
      char_literal119 = nil
      __NL120__ = nil
      op_statement118 = nil

      tree_for_string_literal115 = nil
      tree_for_char_literal116 = nil
      tree_for_NL117 = nil
      tree_for_char_literal119 = nil
      tree_for_NL120 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 236:4: 'effect' '{' ( NL )* ( op_statement )* '}' ( NL )+
        string_literal115 = match( T__35, TOKENS_FOLLOWING_T__35_IN_op_effects_715 )

        tree_for_string_literal115 = @adaptor.create_with_payload( string_literal115 )
        @adaptor.add_child( root_0, tree_for_string_literal115 )

        char_literal116 = match( T__20, TOKENS_FOLLOWING_T__20_IN_op_effects_717 )

        tree_for_char_literal116 = @adaptor.create_with_payload( char_literal116 )
        @adaptor.add_child( root_0, tree_for_char_literal116 )

        # at line 236:17: ( NL )*
        while true # decision 51
          alt_51 = 2
          look_51_0 = @input.peek( 1 )

          if ( look_51_0 == NL )
            alt_51 = 1

          end
          case alt_51
          when 1
            # at line 236:17: NL
            __NL117__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_effects_719 )

            tree_for_NL117 = @adaptor.create_with_payload( __NL117__ )
            @adaptor.add_child( root_0, tree_for_NL117 )


          else
            break # out of loop for decision 51
          end
        end # loop for decision 51
        # --> action

        			@now['_effect']['_parent'] = @now
        			@now = @now['_effect']
        		
        # <-- action
        # at line 241:3: ( op_statement )*
        while true # decision 52
          alt_52 = 2
          look_52_0 = @input.peek( 1 )

          if ( look_52_0 == ID )
            alt_52 = 1

          end
          case alt_52
          when 1
            # at line 241:3: op_statement
            @state.following.push( TOKENS_FOLLOWING_op_statement_IN_op_effects_728 )
            op_statement118 = op_statement
            @state.following.pop
            @adaptor.add_child( root_0, op_statement118.tree )

          else
            break # out of loop for decision 52
          end
        end # loop for decision 52
        char_literal119 = match( T__21, TOKENS_FOLLOWING_T__21_IN_op_effects_733 )

        tree_for_char_literal119 = @adaptor.create_with_payload( char_literal119 )
        @adaptor.add_child( root_0, tree_for_char_literal119 )

        # at file 242:7: ( NL )+
        match_count_53 = 0
        while true
          alt_53 = 2
          look_53_0 = @input.peek( 1 )

          if ( look_53_0 == NL )
            alt_53 = 1

          end
          case alt_53
          when 1
            # at line 242:7: NL
            __NL120__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_effects_735 )

            tree_for_NL120 = @adaptor.create_with_payload( __NL120__ )
            @adaptor.add_child( root_0, tree_for_NL120 )


          else
            match_count_53 > 0 and break
            eee = EarlyExit(53)


            raise eee
          end
          match_count_53 += 1
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
      __NL124__ = nil
      reference121 = nil
      equals_op122 = nil
      value123 = nil

      tree_for_NL124 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 247:4: reference equals_op value ( NL )+
        @state.following.push( TOKENS_FOLLOWING_reference_IN_op_statement_751 )
        reference121 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference121.tree )
        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_op_statement_753 )
        equals_op122 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op122.tree )
        @state.following.push( TOKENS_FOLLOWING_value_IN_op_statement_755 )
        value123 = value
        @state.following.pop
        @adaptor.add_child( root_0, value123.tree )
        # at file 247:30: ( NL )+
        match_count_54 = 0
        while true
          alt_54 = 2
          look_54_0 = @input.peek( 1 )

          if ( look_54_0 == NL )
            alt_54 = 1

          end
          case alt_54
          when 1
            # at line 247:30: NL
            __NL124__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_statement_757 )

            tree_for_NL124 = @adaptor.create_with_payload( __NL124__ )
            @adaptor.add_child( root_0, tree_for_NL124 )


          else
            match_count_54 > 0 and break
            eee = EarlyExit(54)


            raise eee
          end
          match_count_54 += 1
        end

        # --> action
        	@now[( reference121.nil? ? nil : reference121.val )] = ( value123.nil? ? nil : value123.val )	
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
      string_literal125 = nil
      __ID126__ = nil
      char_literal128 = nil
      __NL129__ = nil
      string_literal130 = nil
      __NUMBER132__ = nil
      __NL133__ = nil
      char_literal136 = nil
      __NL137__ = nil
      parameters127 = nil
      equals_op131 = nil
      conditions134 = nil
      effects135 = nil

      tree_for_string_literal125 = nil
      tree_for_ID126 = nil
      tree_for_char_literal128 = nil
      tree_for_NL129 = nil
      tree_for_string_literal130 = nil
      tree_for_NUMBER132 = nil
      tree_for_NL133 = nil
      tree_for_char_literal136 = nil
      tree_for_NL137 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 252:4: 'procedure' ID ( parameters )? '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( conditions )? effects '}' ( NL )+
        string_literal125 = match( T__36, TOKENS_FOLLOWING_T__36_IN_procedure_773 )

        tree_for_string_literal125 = @adaptor.create_with_payload( string_literal125 )
        @adaptor.add_child( root_0, tree_for_string_literal125 )

        __ID126__ = match( ID, TOKENS_FOLLOWING_ID_IN_procedure_775 )

        tree_for_ID126 = @adaptor.create_with_payload( __ID126__ )
        @adaptor.add_child( root_0, tree_for_ID126 )

        # --> action

        			@now[__ID126__.text] = { '_self' => __ID126__.text,
        				'_context' => 'procedure',
        				'_parent' => @now,
        				'_cost' => 1,
        				'_condition' => { '_context' => 'constraint', '_type' => 'and' },
        				'_effect' => { '_context' => 'mutation', '_type' => 'and' }
        			}
        			@now = @now[__ID126__.text]
        		
        # <-- action
        # at line 263:3: ( parameters )?
        alt_55 = 2
        look_55_0 = @input.peek( 1 )

        if ( look_55_0 == T__37 )
          alt_55 = 1
        end
        case alt_55
        when 1
          # at line 263:3: parameters
          @state.following.push( TOKENS_FOLLOWING_parameters_IN_procedure_783 )
          parameters127 = parameters
          @state.following.pop
          @adaptor.add_child( root_0, parameters127.tree )

        end
        char_literal128 = match( T__20, TOKENS_FOLLOWING_T__20_IN_procedure_786 )

        tree_for_char_literal128 = @adaptor.create_with_payload( char_literal128 )
        @adaptor.add_child( root_0, tree_for_char_literal128 )

        # at line 263:19: ( NL )*
        while true # decision 56
          alt_56 = 2
          look_56_0 = @input.peek( 1 )

          if ( look_56_0 == NL )
            alt_56 = 1

          end
          case alt_56
          when 1
            # at line 263:19: NL
            __NL129__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_788 )

            tree_for_NL129 = @adaptor.create_with_payload( __NL129__ )
            @adaptor.add_child( root_0, tree_for_NL129 )


          else
            break # out of loop for decision 56
          end
        end # loop for decision 56
        # at line 264:3: ( 'cost' equals_op NUMBER ( NL )+ )?
        alt_58 = 2
        look_58_0 = @input.peek( 1 )

        if ( look_58_0 == T__33 )
          alt_58 = 1
        end
        case alt_58
        when 1
          # at line 264:5: 'cost' equals_op NUMBER ( NL )+
          string_literal130 = match( T__33, TOKENS_FOLLOWING_T__33_IN_procedure_796 )

          tree_for_string_literal130 = @adaptor.create_with_payload( string_literal130 )
          @adaptor.add_child( root_0, tree_for_string_literal130 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_procedure_798 )
          equals_op131 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op131.tree )
          __NUMBER132__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_procedure_800 )

          tree_for_NUMBER132 = @adaptor.create_with_payload( __NUMBER132__ )
          @adaptor.add_child( root_0, tree_for_NUMBER132 )

          # --> action
          	@now['_cost'] = __NUMBER132__.text.to_i	
          # <-- action
          # at file 266:4: ( NL )+
          match_count_57 = 0
          while true
            alt_57 = 2
            look_57_0 = @input.peek( 1 )

            if ( look_57_0 == NL )
              alt_57 = 1

            end
            case alt_57
            when 1
              # at line 266:4: NL
              __NL133__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_810 )

              tree_for_NL133 = @adaptor.create_with_payload( __NL133__ )
              @adaptor.add_child( root_0, tree_for_NL133 )


            else
              match_count_57 > 0 and break
              eee = EarlyExit(57)


              raise eee
            end
            match_count_57 += 1
          end


        end
        # at line 268:3: ( conditions )?
        alt_59 = 2
        look_59_0 = @input.peek( 1 )

        if ( look_59_0 == T__34 )
          alt_59 = 1
        end
        case alt_59
        when 1
          # at line 268:3: conditions
          @state.following.push( TOKENS_FOLLOWING_conditions_IN_procedure_820 )
          conditions134 = conditions
          @state.following.pop
          @adaptor.add_child( root_0, conditions134.tree )

        end
        @state.following.push( TOKENS_FOLLOWING_effects_IN_procedure_823 )
        effects135 = effects
        @state.following.pop
        @adaptor.add_child( root_0, effects135.tree )
        char_literal136 = match( T__21, TOKENS_FOLLOWING_T__21_IN_procedure_825 )

        tree_for_char_literal136 = @adaptor.create_with_payload( char_literal136 )
        @adaptor.add_child( root_0, tree_for_char_literal136 )

        # at file 268:27: ( NL )+
        match_count_60 = 0
        while true
          alt_60 = 2
          look_60_0 = @input.peek( 1 )

          if ( look_60_0 == NL )
            alt_60 = 1

          end
          case alt_60
          when 1
            # at line 268:27: NL
            __NL137__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_827 )

            tree_for_NL137 = @adaptor.create_with_payload( __NL137__ )
            @adaptor.add_child( root_0, tree_for_NL137 )


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
      char_literal138 = nil
      char_literal140 = nil
      char_literal142 = nil
      parameter139 = nil
      parameter141 = nil

      tree_for_char_literal138 = nil
      tree_for_char_literal140 = nil
      tree_for_char_literal142 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 273:4: '(' parameter ( ',' parameter )* ')'
        char_literal138 = match( T__37, TOKENS_FOLLOWING_T__37_IN_parameters_843 )

        tree_for_char_literal138 = @adaptor.create_with_payload( char_literal138 )
        @adaptor.add_child( root_0, tree_for_char_literal138 )

        @state.following.push( TOKENS_FOLLOWING_parameter_IN_parameters_845 )
        parameter139 = parameter
        @state.following.pop
        @adaptor.add_child( root_0, parameter139.tree )
        # at line 273:18: ( ',' parameter )*
        while true # decision 61
          alt_61 = 2
          look_61_0 = @input.peek( 1 )

          if ( look_61_0 == T__38 )
            alt_61 = 1

          end
          case alt_61
          when 1
            # at line 273:19: ',' parameter
            char_literal140 = match( T__38, TOKENS_FOLLOWING_T__38_IN_parameters_848 )

            tree_for_char_literal140 = @adaptor.create_with_payload( char_literal140 )
            @adaptor.add_child( root_0, tree_for_char_literal140 )

            @state.following.push( TOKENS_FOLLOWING_parameter_IN_parameters_850 )
            parameter141 = parameter
            @state.following.pop
            @adaptor.add_child( root_0, parameter141.tree )

          else
            break # out of loop for decision 61
          end
        end # loop for decision 61
        char_literal142 = match( T__39, TOKENS_FOLLOWING_T__39_IN_parameters_854 )

        tree_for_char_literal142 = @adaptor.create_with_payload( char_literal142 )
        @adaptor.add_child( root_0, tree_for_char_literal142 )

        # - - - - - - - rule clean up - - - - - - - -
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
    # 276:1: parameter : ( ID reference_type | ID 'areall' path );
    # 
    def parameter
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = ParameterReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID143__ = nil
      __ID145__ = nil
      string_literal146 = nil
      reference_type144 = nil
      path147 = nil

      tree_for_ID143 = nil
      tree_for_ID145 = nil
      tree_for_string_literal146 = nil

      begin
        # at line 277:2: ( ID reference_type | ID 'areall' path )
        alt_62 = 2
        look_62_0 = @input.peek( 1 )

        if ( look_62_0 == ID )
          look_62_1 = @input.peek( 2 )

          if ( look_62_1 == T__40 )
            alt_62 = 2
          elsif ( look_62_1 == T__65 )
            alt_62 = 1
          else
            raise NoViableAlternative( "", 62, 1 )
          end
        else
          raise NoViableAlternative( "", 62, 0 )
        end
        case alt_62
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 277:4: ID reference_type
          __ID143__ = match( ID, TOKENS_FOLLOWING_ID_IN_parameter_866 )

          tree_for_ID143 = @adaptor.create_with_payload( __ID143__ )
          @adaptor.add_child( root_0, tree_for_ID143 )

          @state.following.push( TOKENS_FOLLOWING_reference_type_IN_parameter_868 )
          reference_type144 = reference_type
          @state.following.pop
          @adaptor.add_child( root_0, reference_type144.tree )
          # --> action
          	@now[__ID143__.text] = ( reference_type144.nil? ? nil : reference_type144.val )	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 279:4: ID 'areall' path
          __ID145__ = match( ID, TOKENS_FOLLOWING_ID_IN_parameter_877 )

          tree_for_ID145 = @adaptor.create_with_payload( __ID145__ )
          @adaptor.add_child( root_0, tree_for_ID145 )

          string_literal146 = match( T__40, TOKENS_FOLLOWING_T__40_IN_parameter_879 )

          tree_for_string_literal146 = @adaptor.create_with_payload( string_literal146 )
          @adaptor.add_child( root_0, tree_for_string_literal146 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_parameter_881 )
          path147 = path
          @state.following.pop
          @adaptor.add_child( root_0, path147.tree )
          # --> action

          			@now[__ID145__.text] = { '_context' => 'all',
          				'_isa' => self.to_ref(( path147 && @input.to_s( path147.start, path147.stop ) )),
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
    # 288:1: conditions : 'condition' '{' ( NL )* constraint_body '}' ( NL )+ ;
    # 
    def conditions
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
      return_value = ConditionsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal148 = nil
      char_literal149 = nil
      __NL150__ = nil
      char_literal152 = nil
      __NL153__ = nil
      constraint_body151 = nil

      tree_for_string_literal148 = nil
      tree_for_char_literal149 = nil
      tree_for_NL150 = nil
      tree_for_char_literal152 = nil
      tree_for_NL153 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 289:4: 'condition' '{' ( NL )* constraint_body '}' ( NL )+
        string_literal148 = match( T__34, TOKENS_FOLLOWING_T__34_IN_conditions_896 )

        tree_for_string_literal148 = @adaptor.create_with_payload( string_literal148 )
        @adaptor.add_child( root_0, tree_for_string_literal148 )

        # --> action

        			@now['_condition']['_parent'] = @now
        			@now = @now['_condition']
        		
        # <-- action
        char_literal149 = match( T__20, TOKENS_FOLLOWING_T__20_IN_conditions_904 )

        tree_for_char_literal149 = @adaptor.create_with_payload( char_literal149 )
        @adaptor.add_child( root_0, tree_for_char_literal149 )

        # at line 294:7: ( NL )*
        while true # decision 63
          alt_63 = 2
          look_63_0 = @input.peek( 1 )

          if ( look_63_0 == NL )
            alt_63 = 1

          end
          case alt_63
          when 1
            # at line 294:7: NL
            __NL150__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditions_906 )

            tree_for_NL150 = @adaptor.create_with_payload( __NL150__ )
            @adaptor.add_child( root_0, tree_for_NL150 )


          else
            break # out of loop for decision 63
          end
        end # loop for decision 63
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_conditions_909 )
        constraint_body151 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body151.tree )
        char_literal152 = match( T__21, TOKENS_FOLLOWING_T__21_IN_conditions_911 )

        tree_for_char_literal152 = @adaptor.create_with_payload( char_literal152 )
        @adaptor.add_child( root_0, tree_for_char_literal152 )

        # at file 294:31: ( NL )+
        match_count_64 = 0
        while true
          alt_64 = 2
          look_64_0 = @input.peek( 1 )

          if ( look_64_0 == NL )
            alt_64 = 1

          end
          case alt_64
          when 1
            # at line 294:31: NL
            __NL153__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditions_913 )

            tree_for_NL153 = @adaptor.create_with_payload( __NL153__ )
            @adaptor.add_child( root_0, tree_for_NL153 )


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
    # 299:1: effects : 'effect' '{' ( NL )* mutation_body '}' ( NL )+ ;
    # 
    def effects
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = EffectsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal154 = nil
      char_literal155 = nil
      __NL156__ = nil
      char_literal158 = nil
      __NL159__ = nil
      mutation_body157 = nil

      tree_for_string_literal154 = nil
      tree_for_char_literal155 = nil
      tree_for_NL156 = nil
      tree_for_char_literal158 = nil
      tree_for_NL159 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 300:4: 'effect' '{' ( NL )* mutation_body '}' ( NL )+
        string_literal154 = match( T__35, TOKENS_FOLLOWING_T__35_IN_effects_930 )

        tree_for_string_literal154 = @adaptor.create_with_payload( string_literal154 )
        @adaptor.add_child( root_0, tree_for_string_literal154 )

        # --> action

        			@now['_effect']['_parent'] = @now
        			@now = @now['_effect']
        		
        # <-- action
        char_literal155 = match( T__20, TOKENS_FOLLOWING_T__20_IN_effects_938 )

        tree_for_char_literal155 = @adaptor.create_with_payload( char_literal155 )
        @adaptor.add_child( root_0, tree_for_char_literal155 )

        # at line 305:7: ( NL )*
        while true # decision 65
          alt_65 = 2
          look_65_0 = @input.peek( 1 )

          if ( look_65_0 == NL )
            alt_65 = 1

          end
          case alt_65
          when 1
            # at line 305:7: NL
            __NL156__ = match( NL, TOKENS_FOLLOWING_NL_IN_effects_940 )

            tree_for_NL156 = @adaptor.create_with_payload( __NL156__ )
            @adaptor.add_child( root_0, tree_for_NL156 )


          else
            break # out of loop for decision 65
          end
        end # loop for decision 65
        @state.following.push( TOKENS_FOLLOWING_mutation_body_IN_effects_946 )
        mutation_body157 = mutation_body
        @state.following.pop
        @adaptor.add_child( root_0, mutation_body157.tree )
        char_literal158 = match( T__21, TOKENS_FOLLOWING_T__21_IN_effects_951 )

        tree_for_char_literal158 = @adaptor.create_with_payload( char_literal158 )
        @adaptor.add_child( root_0, tree_for_char_literal158 )

        # at file 307:7: ( NL )+
        match_count_66 = 0
        while true
          alt_66 = 2
          look_66_0 = @input.peek( 1 )

          if ( look_66_0 == NL )
            alt_66 = 1

          end
          case alt_66
          when 1
            # at line 307:7: NL
            __NL159__ = match( NL, TOKENS_FOLLOWING_NL_IN_effects_953 )

            tree_for_NL159 = @adaptor.create_with_payload( __NL159__ )
            @adaptor.add_child( root_0, tree_for_NL159 )


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
    # 311:1: goal_constraint : 'goal' ( 'constraint' )? ( NL )* '{' ( NL )* ( goal_body )* '}' ( NL )+ ;
    # 
    def goal_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = GoalConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal160 = nil
      string_literal161 = nil
      __NL162__ = nil
      char_literal163 = nil
      __NL164__ = nil
      char_literal166 = nil
      __NL167__ = nil
      goal_body165 = nil

      tree_for_string_literal160 = nil
      tree_for_string_literal161 = nil
      tree_for_NL162 = nil
      tree_for_char_literal163 = nil
      tree_for_NL164 = nil
      tree_for_char_literal166 = nil
      tree_for_NL167 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 312:4: 'goal' ( 'constraint' )? ( NL )* '{' ( NL )* ( goal_body )* '}' ( NL )+
        string_literal160 = match( T__41, TOKENS_FOLLOWING_T__41_IN_goal_constraint_969 )

        tree_for_string_literal160 = @adaptor.create_with_payload( string_literal160 )
        @adaptor.add_child( root_0, tree_for_string_literal160 )

        # at line 312:11: ( 'constraint' )?
        alt_67 = 2
        look_67_0 = @input.peek( 1 )

        if ( look_67_0 == T__42 )
          alt_67 = 1
        end
        case alt_67
        when 1
          # at line 312:11: 'constraint'
          string_literal161 = match( T__42, TOKENS_FOLLOWING_T__42_IN_goal_constraint_971 )

          tree_for_string_literal161 = @adaptor.create_with_payload( string_literal161 )
          @adaptor.add_child( root_0, tree_for_string_literal161 )


        end
        # at line 312:25: ( NL )*
        while true # decision 68
          alt_68 = 2
          look_68_0 = @input.peek( 1 )

          if ( look_68_0 == NL )
            alt_68 = 1

          end
          case alt_68
          when 1
            # at line 312:25: NL
            __NL162__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_constraint_974 )

            tree_for_NL162 = @adaptor.create_with_payload( __NL162__ )
            @adaptor.add_child( root_0, tree_for_NL162 )


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
        char_literal163 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_constraint_983 )

        tree_for_char_literal163 = @adaptor.create_with_payload( char_literal163 )
        @adaptor.add_child( root_0, tree_for_char_literal163 )

        # at line 321:7: ( NL )*
        while true # decision 69
          alt_69 = 2
          look_69_0 = @input.peek( 1 )

          if ( look_69_0 == NL )
            alt_69 = 1

          end
          case alt_69
          when 1
            # at line 321:7: NL
            __NL164__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_constraint_985 )

            tree_for_NL164 = @adaptor.create_with_payload( __NL164__ )
            @adaptor.add_child( root_0, tree_for_NL164 )


          else
            break # out of loop for decision 69
          end
        end # loop for decision 69
        # at line 321:11: ( goal_body )*
        while true # decision 70
          alt_70 = 2
          look_70_0 = @input.peek( 1 )

          if ( look_70_0 == ID || look_70_0 == T__29 || look_70_0.between?( T__43, T__48 ) || look_70_0.between?( T__50, T__52 ) || look_70_0 == T__55 || look_70_0 == T__59 )
            alt_70 = 1

          end
          case alt_70
          when 1
            # at line 321:11: goal_body
            @state.following.push( TOKENS_FOLLOWING_goal_body_IN_goal_constraint_988 )
            goal_body165 = goal_body
            @state.following.pop
            @adaptor.add_child( root_0, goal_body165.tree )

          else
            break # out of loop for decision 70
          end
        end # loop for decision 70
        char_literal166 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_constraint_991 )

        tree_for_char_literal166 = @adaptor.create_with_payload( char_literal166 )
        @adaptor.add_child( root_0, tree_for_char_literal166 )

        # at file 321:26: ( NL )+
        match_count_71 = 0
        while true
          alt_71 = 2
          look_71_0 = @input.peek( 1 )

          if ( look_71_0 == NL )
            alt_71 = 1

          end
          case alt_71
          when 1
            # at line 321:26: NL
            __NL167__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_constraint_993 )

            tree_for_NL167 = @adaptor.create_with_payload( __NL167__ )
            @adaptor.add_child( root_0, tree_for_NL167 )


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
    # 325:1: goal_body : ( ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ ) | 'always' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'sometime' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'within' NUMBER ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'after' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* ( 'then' | 'within' NUMBER ) ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'before' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ );
    # 
    def goal_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = GoalBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL172__ = nil
      string_literal173 = nil
      __NL174__ = nil
      char_literal175 = nil
      __NL176__ = nil
      char_literal178 = nil
      __NL179__ = nil
      string_literal180 = nil
      __NL181__ = nil
      char_literal182 = nil
      __NL183__ = nil
      char_literal185 = nil
      __NL186__ = nil
      string_literal187 = nil
      __NUMBER188__ = nil
      __NL189__ = nil
      char_literal190 = nil
      __NL191__ = nil
      char_literal193 = nil
      __NL194__ = nil
      string_literal195 = nil
      __NL196__ = nil
      char_literal197 = nil
      __NL198__ = nil
      char_literal200 = nil
      __NL201__ = nil
      string_literal202 = nil
      string_literal203 = nil
      __NUMBER204__ = nil
      __NL205__ = nil
      char_literal206 = nil
      __NL207__ = nil
      char_literal209 = nil
      __NL210__ = nil
      string_literal211 = nil
      __NL212__ = nil
      char_literal213 = nil
      __NL214__ = nil
      char_literal216 = nil
      __NL217__ = nil
      string_literal218 = nil
      __NL219__ = nil
      char_literal220 = nil
      __NL221__ = nil
      char_literal223 = nil
      __NL224__ = nil
      constraint_statement168 = nil
      constraint_namespace169 = nil
      constraint_iterator170 = nil
      constraint_class_quantification171 = nil
      constraint_body177 = nil
      constraint_body184 = nil
      constraint_body192 = nil
      constraint_body199 = nil
      constraint_body208 = nil
      constraint_body215 = nil
      constraint_body222 = nil

      tree_for_NL172 = nil
      tree_for_string_literal173 = nil
      tree_for_NL174 = nil
      tree_for_char_literal175 = nil
      tree_for_NL176 = nil
      tree_for_char_literal178 = nil
      tree_for_NL179 = nil
      tree_for_string_literal180 = nil
      tree_for_NL181 = nil
      tree_for_char_literal182 = nil
      tree_for_NL183 = nil
      tree_for_char_literal185 = nil
      tree_for_NL186 = nil
      tree_for_string_literal187 = nil
      tree_for_NUMBER188 = nil
      tree_for_NL189 = nil
      tree_for_char_literal190 = nil
      tree_for_NL191 = nil
      tree_for_char_literal193 = nil
      tree_for_NL194 = nil
      tree_for_string_literal195 = nil
      tree_for_NL196 = nil
      tree_for_char_literal197 = nil
      tree_for_NL198 = nil
      tree_for_char_literal200 = nil
      tree_for_NL201 = nil
      tree_for_string_literal202 = nil
      tree_for_string_literal203 = nil
      tree_for_NUMBER204 = nil
      tree_for_NL205 = nil
      tree_for_char_literal206 = nil
      tree_for_NL207 = nil
      tree_for_char_literal209 = nil
      tree_for_NL210 = nil
      tree_for_string_literal211 = nil
      tree_for_NL212 = nil
      tree_for_char_literal213 = nil
      tree_for_NL214 = nil
      tree_for_char_literal216 = nil
      tree_for_NL217 = nil
      tree_for_string_literal218 = nil
      tree_for_NL219 = nil
      tree_for_char_literal220 = nil
      tree_for_NL221 = nil
      tree_for_char_literal223 = nil
      tree_for_NL224 = nil

      begin
        # at line 326:2: ( ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ ) | 'always' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'sometime' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'within' NUMBER ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'after' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* ( 'then' | 'within' NUMBER ) ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'before' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ )
        alt_96 = 6
        case look_96 = @input.peek( 1 )
        when ID, T__29, T__48, T__50, T__51, T__52, T__55, T__59 then alt_96 = 1
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


          # at line 326:4: ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )
          # at line 326:4: ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )
          # at line 327:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+
          # at line 327:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification )
          alt_72 = 4
          alt_72 = @dfa72.predict( @input )
          case alt_72
          when 1
            # at line 327:6: constraint_statement
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_goal_body_1016 )
            constraint_statement168 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement168.tree )
            # --> action

            					@now[( constraint_statement168.nil? ? nil : constraint_statement168.key )] = ( constraint_statement168.nil? ? nil : constraint_statement168.val )
            				
            # <-- action

          when 2
            # at line 331:6: constraint_namespace
            @state.following.push( TOKENS_FOLLOWING_constraint_namespace_IN_goal_body_1029 )
            constraint_namespace169 = constraint_namespace
            @state.following.pop
            @adaptor.add_child( root_0, constraint_namespace169.tree )

          when 3
            # at line 332:6: constraint_iterator
            @state.following.push( TOKENS_FOLLOWING_constraint_iterator_IN_goal_body_1036 )
            constraint_iterator170 = constraint_iterator
            @state.following.pop
            @adaptor.add_child( root_0, constraint_iterator170.tree )

          when 4
            # at line 333:6: constraint_class_quantification
            @state.following.push( TOKENS_FOLLOWING_constraint_class_quantification_IN_goal_body_1043 )
            constraint_class_quantification171 = constraint_class_quantification
            @state.following.pop
            @adaptor.add_child( root_0, constraint_class_quantification171.tree )

          end
          # at file 335:3: ( NL )+
          match_count_73 = 0
          while true
            alt_73 = 2
            look_73_0 = @input.peek( 1 )

            if ( look_73_0 == NL )
              alt_73 = 1

            end
            case alt_73
            when 1
              # at line 335:3: NL
              __NL172__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1052 )

              tree_for_NL172 = @adaptor.create_with_payload( __NL172__ )
              @adaptor.add_child( root_0, tree_for_NL172 )


            else
              match_count_73 > 0 and break
              eee = EarlyExit(73)


              raise eee
            end
            match_count_73 += 1
          end



        when 2
          root_0 = @adaptor.create_flat_list


          # at line 336:4: 'always' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal173 = match( T__43, TOKENS_FOLLOWING_T__43_IN_goal_body_1059 )

          tree_for_string_literal173 = @adaptor.create_with_payload( string_literal173 )
          @adaptor.add_child( root_0, tree_for_string_literal173 )

          # at line 336:13: ( NL )*
          while true # decision 74
            alt_74 = 2
            look_74_0 = @input.peek( 1 )

            if ( look_74_0 == NL )
              alt_74 = 1

            end
            case alt_74
            when 1
              # at line 336:13: NL
              __NL174__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1061 )

              tree_for_NL174 = @adaptor.create_with_payload( __NL174__ )
              @adaptor.add_child( root_0, tree_for_NL174 )


            else
              break # out of loop for decision 74
            end
          end # loop for decision 74
          # --> action

          			@now['always'] = self.create_constraint('always', 'and') if
          				not @now.has_key?('always')
          			@now = @now['always']
          		
          # <-- action
          char_literal175 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1070 )

          tree_for_char_literal175 = @adaptor.create_with_payload( char_literal175 )
          @adaptor.add_child( root_0, tree_for_char_literal175 )

          # at line 342:7: ( NL )*
          while true # decision 75
            alt_75 = 2
            look_75_0 = @input.peek( 1 )

            if ( look_75_0 == NL )
              alt_75 = 1

            end
            case alt_75
            when 1
              # at line 342:7: NL
              __NL176__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1072 )

              tree_for_NL176 = @adaptor.create_with_payload( __NL176__ )
              @adaptor.add_child( root_0, tree_for_NL176 )


            else
              break # out of loop for decision 75
            end
          end # loop for decision 75
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1075 )
          constraint_body177 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body177.tree )
          char_literal178 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1077 )

          tree_for_char_literal178 = @adaptor.create_with_payload( char_literal178 )
          @adaptor.add_child( root_0, tree_for_char_literal178 )

          # at file 342:31: ( NL )+
          match_count_76 = 0
          while true
            alt_76 = 2
            look_76_0 = @input.peek( 1 )

            if ( look_76_0 == NL )
              alt_76 = 1

            end
            case alt_76
            when 1
              # at line 342:31: NL
              __NL179__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1079 )

              tree_for_NL179 = @adaptor.create_with_payload( __NL179__ )
              @adaptor.add_child( root_0, tree_for_NL179 )


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


          # at line 344:4: 'sometime' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal180 = match( T__44, TOKENS_FOLLOWING_T__44_IN_goal_body_1089 )

          tree_for_string_literal180 = @adaptor.create_with_payload( string_literal180 )
          @adaptor.add_child( root_0, tree_for_string_literal180 )

          # at line 344:15: ( NL )*
          while true # decision 77
            alt_77 = 2
            look_77_0 = @input.peek( 1 )

            if ( look_77_0 == NL )
              alt_77 = 1

            end
            case alt_77
            when 1
              # at line 344:15: NL
              __NL181__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1091 )

              tree_for_NL181 = @adaptor.create_with_payload( __NL181__ )
              @adaptor.add_child( root_0, tree_for_NL181 )


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
          char_literal182 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1100 )

          tree_for_char_literal182 = @adaptor.create_with_payload( char_literal182 )
          @adaptor.add_child( root_0, tree_for_char_literal182 )

          # at line 353:7: ( NL )*
          while true # decision 78
            alt_78 = 2
            look_78_0 = @input.peek( 1 )

            if ( look_78_0 == NL )
              alt_78 = 1

            end
            case alt_78
            when 1
              # at line 353:7: NL
              __NL183__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1102 )

              tree_for_NL183 = @adaptor.create_with_payload( __NL183__ )
              @adaptor.add_child( root_0, tree_for_NL183 )


            else
              break # out of loop for decision 78
            end
          end # loop for decision 78
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1105 )
          constraint_body184 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body184.tree )
          char_literal185 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1107 )

          tree_for_char_literal185 = @adaptor.create_with_payload( char_literal185 )
          @adaptor.add_child( root_0, tree_for_char_literal185 )

          # at file 353:31: ( NL )+
          match_count_79 = 0
          while true
            alt_79 = 2
            look_79_0 = @input.peek( 1 )

            if ( look_79_0 == NL )
              alt_79 = 1

            end
            case alt_79
            when 1
              # at line 353:31: NL
              __NL186__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1109 )

              tree_for_NL186 = @adaptor.create_with_payload( __NL186__ )
              @adaptor.add_child( root_0, tree_for_NL186 )


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


          # at line 356:4: 'within' NUMBER ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal187 = match( T__45, TOKENS_FOLLOWING_T__45_IN_goal_body_1123 )

          tree_for_string_literal187 = @adaptor.create_with_payload( string_literal187 )
          @adaptor.add_child( root_0, tree_for_string_literal187 )

          __NUMBER188__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_goal_body_1125 )

          tree_for_NUMBER188 = @adaptor.create_with_payload( __NUMBER188__ )
          @adaptor.add_child( root_0, tree_for_NUMBER188 )

          # at line 356:20: ( NL )*
          while true # decision 80
            alt_80 = 2
            look_80_0 = @input.peek( 1 )

            if ( look_80_0 == NL )
              alt_80 = 1

            end
            case alt_80
            when 1
              # at line 356:20: NL
              __NL189__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1127 )

              tree_for_NL189 = @adaptor.create_with_payload( __NL189__ )
              @adaptor.add_child( root_0, tree_for_NL189 )


            else
              break # out of loop for decision 80
            end
          end # loop for decision 80
          # --> action

          			id = self.next_id.to_s
          			@now[id] = self.create_constraint(id, 'within')
          			@now = @now[id]
          			@now['deadline'] = __NUMBER188__.text.to_s.to_i
          		
          # <-- action
          char_literal190 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1136 )

          tree_for_char_literal190 = @adaptor.create_with_payload( char_literal190 )
          @adaptor.add_child( root_0, tree_for_char_literal190 )

          # at line 363:7: ( NL )*
          while true # decision 81
            alt_81 = 2
            look_81_0 = @input.peek( 1 )

            if ( look_81_0 == NL )
              alt_81 = 1

            end
            case alt_81
            when 1
              # at line 363:7: NL
              __NL191__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1138 )

              tree_for_NL191 = @adaptor.create_with_payload( __NL191__ )
              @adaptor.add_child( root_0, tree_for_NL191 )


            else
              break # out of loop for decision 81
            end
          end # loop for decision 81
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1141 )
          constraint_body192 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body192.tree )
          char_literal193 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1143 )

          tree_for_char_literal193 = @adaptor.create_with_payload( char_literal193 )
          @adaptor.add_child( root_0, tree_for_char_literal193 )

          # at file 363:31: ( NL )+
          match_count_82 = 0
          while true
            alt_82 = 2
            look_82_0 = @input.peek( 1 )

            if ( look_82_0 == NL )
              alt_82 = 1

            end
            case alt_82
            when 1
              # at line 363:31: NL
              __NL194__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1145 )

              tree_for_NL194 = @adaptor.create_with_payload( __NL194__ )
              @adaptor.add_child( root_0, tree_for_NL194 )


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


          # at line 365:4: 'after' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* ( 'then' | 'within' NUMBER ) ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal195 = match( T__46, TOKENS_FOLLOWING_T__46_IN_goal_body_1155 )

          tree_for_string_literal195 = @adaptor.create_with_payload( string_literal195 )
          @adaptor.add_child( root_0, tree_for_string_literal195 )

          # at line 365:12: ( NL )*
          while true # decision 83
            alt_83 = 2
            look_83_0 = @input.peek( 1 )

            if ( look_83_0 == NL )
              alt_83 = 1

            end
            case alt_83
            when 1
              # at line 365:12: NL
              __NL196__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1157 )

              tree_for_NL196 = @adaptor.create_with_payload( __NL196__ )
              @adaptor.add_child( root_0, tree_for_NL196 )


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
          char_literal197 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1166 )

          tree_for_char_literal197 = @adaptor.create_with_payload( char_literal197 )
          @adaptor.add_child( root_0, tree_for_char_literal197 )

          # at line 378:7: ( NL )*
          while true # decision 84
            alt_84 = 2
            look_84_0 = @input.peek( 1 )

            if ( look_84_0 == NL )
              alt_84 = 1

            end
            case alt_84
            when 1
              # at line 378:7: NL
              __NL198__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1168 )

              tree_for_NL198 = @adaptor.create_with_payload( __NL198__ )
              @adaptor.add_child( root_0, tree_for_NL198 )


            else
              break # out of loop for decision 84
            end
          end # loop for decision 84
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1171 )
          constraint_body199 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body199.tree )
          char_literal200 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1173 )

          tree_for_char_literal200 = @adaptor.create_with_payload( char_literal200 )
          @adaptor.add_child( root_0, tree_for_char_literal200 )

          # at line 378:31: ( NL )*
          while true # decision 85
            alt_85 = 2
            look_85_0 = @input.peek( 1 )

            if ( look_85_0 == NL )
              alt_85 = 1

            end
            case alt_85
            when 1
              # at line 378:31: NL
              __NL201__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1175 )

              tree_for_NL201 = @adaptor.create_with_payload( __NL201__ )
              @adaptor.add_child( root_0, tree_for_NL201 )


            else
              break # out of loop for decision 85
            end
          end # loop for decision 85
          # --> action
          	self.goto_parent()	
          # <-- action
          # at line 380:3: ( 'then' | 'within' NUMBER )
          alt_86 = 2
          look_86_0 = @input.peek( 1 )

          if ( look_86_0 == T__30 )
            alt_86 = 1
          elsif ( look_86_0 == T__45 )
            alt_86 = 2
          else
            raise NoViableAlternative( "", 86, 0 )
          end
          case alt_86
          when 1
            # at line 380:5: 'then'
            string_literal202 = match( T__30, TOKENS_FOLLOWING_T__30_IN_goal_body_1186 )

            tree_for_string_literal202 = @adaptor.create_with_payload( string_literal202 )
            @adaptor.add_child( root_0, tree_for_string_literal202 )


          when 2
            # at line 381:6: 'within' NUMBER
            string_literal203 = match( T__45, TOKENS_FOLLOWING_T__45_IN_goal_body_1193 )

            tree_for_string_literal203 = @adaptor.create_with_payload( string_literal203 )
            @adaptor.add_child( root_0, tree_for_string_literal203 )

            __NUMBER204__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_goal_body_1195 )

            tree_for_NUMBER204 = @adaptor.create_with_payload( __NUMBER204__ )
            @adaptor.add_child( root_0, tree_for_NUMBER204 )

            # --> action
             @now['deadline'] = __NUMBER204__.text.to_s.to_i 
            # <-- action

          end
          # at line 383:5: ( NL )*
          while true # decision 87
            alt_87 = 2
            look_87_0 = @input.peek( 1 )

            if ( look_87_0 == NL )
              alt_87 = 1

            end
            case alt_87
            when 1
              # at line 383:5: NL
              __NL205__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1207 )

              tree_for_NL205 = @adaptor.create_with_payload( __NL205__ )
              @adaptor.add_child( root_0, tree_for_NL205 )


            else
              break # out of loop for decision 87
            end
          end # loop for decision 87
          # --> action

          			@now['then'] = self.create_constraint('then')
          			@now = @now['then']
          		
          # <-- action
          char_literal206 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1216 )

          tree_for_char_literal206 = @adaptor.create_with_payload( char_literal206 )
          @adaptor.add_child( root_0, tree_for_char_literal206 )

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
              __NL207__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1218 )

              tree_for_NL207 = @adaptor.create_with_payload( __NL207__ )
              @adaptor.add_child( root_0, tree_for_NL207 )


            else
              break # out of loop for decision 88
            end
          end # loop for decision 88
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1221 )
          constraint_body208 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body208.tree )
          char_literal209 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1223 )

          tree_for_char_literal209 = @adaptor.create_with_payload( char_literal209 )
          @adaptor.add_child( root_0, tree_for_char_literal209 )

          # at file 388:31: ( NL )+
          match_count_89 = 0
          while true
            alt_89 = 2
            look_89_0 = @input.peek( 1 )

            if ( look_89_0 == NL )
              alt_89 = 1

            end
            case alt_89
            when 1
              # at line 388:31: NL
              __NL210__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1225 )

              tree_for_NL210 = @adaptor.create_with_payload( __NL210__ )
              @adaptor.add_child( root_0, tree_for_NL210 )


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


          # at line 392:4: 'before' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal211 = match( T__47, TOKENS_FOLLOWING_T__47_IN_goal_body_1243 )

          tree_for_string_literal211 = @adaptor.create_with_payload( string_literal211 )
          @adaptor.add_child( root_0, tree_for_string_literal211 )

          # at line 392:13: ( NL )*
          while true # decision 90
            alt_90 = 2
            look_90_0 = @input.peek( 1 )

            if ( look_90_0 == NL )
              alt_90 = 1

            end
            case alt_90
            when 1
              # at line 392:13: NL
              __NL212__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1245 )

              tree_for_NL212 = @adaptor.create_with_payload( __NL212__ )
              @adaptor.add_child( root_0, tree_for_NL212 )


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
          char_literal213 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1254 )

          tree_for_char_literal213 = @adaptor.create_with_payload( char_literal213 )
          @adaptor.add_child( root_0, tree_for_char_literal213 )

          # at line 400:7: ( NL )*
          while true # decision 91
            alt_91 = 2
            look_91_0 = @input.peek( 1 )

            if ( look_91_0 == NL )
              alt_91 = 1

            end
            case alt_91
            when 1
              # at line 400:7: NL
              __NL214__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1256 )

              tree_for_NL214 = @adaptor.create_with_payload( __NL214__ )
              @adaptor.add_child( root_0, tree_for_NL214 )


            else
              break # out of loop for decision 91
            end
          end # loop for decision 91
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1259 )
          constraint_body215 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body215.tree )
          char_literal216 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1261 )

          tree_for_char_literal216 = @adaptor.create_with_payload( char_literal216 )
          @adaptor.add_child( root_0, tree_for_char_literal216 )

          # at line 400:31: ( NL )*
          while true # decision 92
            alt_92 = 2
            look_92_0 = @input.peek( 1 )

            if ( look_92_0 == NL )
              alt_92 = 1

            end
            case alt_92
            when 1
              # at line 400:31: NL
              __NL217__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1263 )

              tree_for_NL217 = @adaptor.create_with_payload( __NL217__ )
              @adaptor.add_child( root_0, tree_for_NL217 )


            else
              break # out of loop for decision 92
            end
          end # loop for decision 92
          # --> action
          	self.goto_parent()	
          # <-- action
          string_literal218 = match( T__30, TOKENS_FOLLOWING_T__30_IN_goal_body_1272 )

          tree_for_string_literal218 = @adaptor.create_with_payload( string_literal218 )
          @adaptor.add_child( root_0, tree_for_string_literal218 )

          # at line 402:10: ( NL )*
          while true # decision 93
            alt_93 = 2
            look_93_0 = @input.peek( 1 )

            if ( look_93_0 == NL )
              alt_93 = 1

            end
            case alt_93
            when 1
              # at line 402:10: NL
              __NL219__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1274 )

              tree_for_NL219 = @adaptor.create_with_payload( __NL219__ )
              @adaptor.add_child( root_0, tree_for_NL219 )


            else
              break # out of loop for decision 93
            end
          end # loop for decision 93
          # --> action

          			@now['then'] = self.create_constraint('then')
          			@now = @now['then']
          		
          # <-- action
          char_literal220 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1283 )

          tree_for_char_literal220 = @adaptor.create_with_payload( char_literal220 )
          @adaptor.add_child( root_0, tree_for_char_literal220 )

          # at line 407:7: ( NL )*
          while true # decision 94
            alt_94 = 2
            look_94_0 = @input.peek( 1 )

            if ( look_94_0 == NL )
              alt_94 = 1

            end
            case alt_94
            when 1
              # at line 407:7: NL
              __NL221__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1285 )

              tree_for_NL221 = @adaptor.create_with_payload( __NL221__ )
              @adaptor.add_child( root_0, tree_for_NL221 )


            else
              break # out of loop for decision 94
            end
          end # loop for decision 94
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1288 )
          constraint_body222 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body222.tree )
          char_literal223 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1290 )

          tree_for_char_literal223 = @adaptor.create_with_payload( char_literal223 )
          @adaptor.add_child( root_0, tree_for_char_literal223 )

          # at file 407:31: ( NL )+
          match_count_95 = 0
          while true
            alt_95 = 2
            look_95_0 = @input.peek( 1 )

            if ( look_95_0 == NL )
              alt_95 = 1

            end
            case alt_95
            when 1
              # at line 407:31: NL
              __NL224__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1292 )

              tree_for_NL224 = @adaptor.create_with_payload( __NL224__ )
              @adaptor.add_child( root_0, tree_for_NL224 )


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
    # 412:1: nested_constraint : '{' ( NL )* constraint_body '}' ;
    # 
    def nested_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = NestedConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal225 = nil
      __NL226__ = nil
      char_literal228 = nil
      constraint_body227 = nil

      tree_for_char_literal225 = nil
      tree_for_NL226 = nil
      tree_for_char_literal228 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 413:4: '{' ( NL )* constraint_body '}'
        char_literal225 = match( T__20, TOKENS_FOLLOWING_T__20_IN_nested_constraint_1312 )

        tree_for_char_literal225 = @adaptor.create_with_payload( char_literal225 )
        @adaptor.add_child( root_0, tree_for_char_literal225 )

        # at line 413:8: ( NL )*
        while true # decision 97
          alt_97 = 2
          look_97_0 = @input.peek( 1 )

          if ( look_97_0 == NL )
            alt_97 = 1

          end
          case alt_97
          when 1
            # at line 413:8: NL
            __NL226__ = match( NL, TOKENS_FOLLOWING_NL_IN_nested_constraint_1314 )

            tree_for_NL226 = @adaptor.create_with_payload( __NL226__ )
            @adaptor.add_child( root_0, tree_for_NL226 )


          else
            break # out of loop for decision 97
          end
        end # loop for decision 97
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_nested_constraint_1317 )
        constraint_body227 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body227.tree )
        char_literal228 = match( T__21, TOKENS_FOLLOWING_T__21_IN_nested_constraint_1319 )

        tree_for_char_literal228 = @adaptor.create_with_payload( char_literal228 )
        @adaptor.add_child( root_0, tree_for_char_literal228 )

        # - - - - - - - rule clean up - - - - - - - -
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
    # 416:1: constraint : ID 'constraint' '{' ( NL )* constraint_body '}' ( NL )+ ;
    # 
    def constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = ConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID229__ = nil
      string_literal230 = nil
      char_literal231 = nil
      __NL232__ = nil
      char_literal234 = nil
      __NL235__ = nil
      constraint_body233 = nil

      tree_for_ID229 = nil
      tree_for_string_literal230 = nil
      tree_for_char_literal231 = nil
      tree_for_NL232 = nil
      tree_for_char_literal234 = nil
      tree_for_NL235 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 417:4: ID 'constraint' '{' ( NL )* constraint_body '}' ( NL )+
        __ID229__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_1330 )

        tree_for_ID229 = @adaptor.create_with_payload( __ID229__ )
        @adaptor.add_child( root_0, tree_for_ID229 )

        string_literal230 = match( T__42, TOKENS_FOLLOWING_T__42_IN_constraint_1332 )

        tree_for_string_literal230 = @adaptor.create_with_payload( string_literal230 )
        @adaptor.add_child( root_0, tree_for_string_literal230 )

        # --> action

        			@now[__ID229__.text] = { '_self' => __ID229__.text,
        				'_context' => 'constraint',
        				'_type' => 'and',
        				'_parent' => @now
        			}
        			@now = @now[__ID229__.text]
        		
        # <-- action
        char_literal231 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_1340 )

        tree_for_char_literal231 = @adaptor.create_with_payload( char_literal231 )
        @adaptor.add_child( root_0, tree_for_char_literal231 )

        # at line 426:7: ( NL )*
        while true # decision 98
          alt_98 = 2
          look_98_0 = @input.peek( 1 )

          if ( look_98_0 == NL )
            alt_98 = 1

          end
          case alt_98
          when 1
            # at line 426:7: NL
            __NL232__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_1342 )

            tree_for_NL232 = @adaptor.create_with_payload( __NL232__ )
            @adaptor.add_child( root_0, tree_for_NL232 )


          else
            break # out of loop for decision 98
          end
        end # loop for decision 98
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_constraint_1345 )
        constraint_body233 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body233.tree )
        char_literal234 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_1347 )

        tree_for_char_literal234 = @adaptor.create_with_payload( char_literal234 )
        @adaptor.add_child( root_0, tree_for_char_literal234 )

        # at file 426:31: ( NL )+
        match_count_99 = 0
        while true
          alt_99 = 2
          look_99_0 = @input.peek( 1 )

          if ( look_99_0 == NL )
            alt_99 = 1

          end
          case alt_99
          when 1
            # at line 426:31: NL
            __NL235__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_1349 )

            tree_for_NL235 = @adaptor.create_with_payload( __NL235__ )
            @adaptor.add_child( root_0, tree_for_NL235 )


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
    # 430:1: constraint_body : ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )* ;
    # 
    def constraint_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = ConstraintBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL240__ = nil
      constraint_statement236 = nil
      constraint_namespace237 = nil
      constraint_iterator238 = nil
      constraint_class_quantification239 = nil

      tree_for_NL240 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 431:4: ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )*
        # at line 431:4: ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )*
        while true # decision 102
          alt_102 = 2
          look_102_0 = @input.peek( 1 )

          if ( look_102_0 == ID || look_102_0 == T__29 || look_102_0 == T__48 || look_102_0.between?( T__50, T__52 ) || look_102_0 == T__55 || look_102_0 == T__59 )
            alt_102 = 1

          end
          case alt_102
          when 1
            # at line 432:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+
            # at line 432:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification )
            alt_100 = 4
            alt_100 = @dfa100.predict( @input )
            case alt_100
            when 1
              # at line 432:6: constraint_statement
              @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_1372 )
              constraint_statement236 = constraint_statement
              @state.following.pop
              @adaptor.add_child( root_0, constraint_statement236.tree )
              # --> action

              					@now[( constraint_statement236.nil? ? nil : constraint_statement236.key )] = ( constraint_statement236.nil? ? nil : constraint_statement236.val )
              				
              # <-- action

            when 2
              # at line 436:6: constraint_namespace
              @state.following.push( TOKENS_FOLLOWING_constraint_namespace_IN_constraint_body_1385 )
              constraint_namespace237 = constraint_namespace
              @state.following.pop
              @adaptor.add_child( root_0, constraint_namespace237.tree )

            when 3
              # at line 437:6: constraint_iterator
              @state.following.push( TOKENS_FOLLOWING_constraint_iterator_IN_constraint_body_1392 )
              constraint_iterator238 = constraint_iterator
              @state.following.pop
              @adaptor.add_child( root_0, constraint_iterator238.tree )

            when 4
              # at line 438:6: constraint_class_quantification
              @state.following.push( TOKENS_FOLLOWING_constraint_class_quantification_IN_constraint_body_1399 )
              constraint_class_quantification239 = constraint_class_quantification
              @state.following.pop
              @adaptor.add_child( root_0, constraint_class_quantification239.tree )

            end
            # at file 440:3: ( NL )+
            match_count_101 = 0
            while true
              alt_101 = 2
              look_101_0 = @input.peek( 1 )

              if ( look_101_0 == NL )
                alt_101 = 1

              end
              case alt_101
              when 1
                # at line 440:3: NL
                __NL240__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_body_1408 )

                tree_for_NL240 = @adaptor.create_with_payload( __NL240__ )
                @adaptor.add_child( root_0, tree_for_NL240 )


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
    # 443:1: constraint_namespace : path ( NL )* '{' ( NL )* ( constraint_statement ( NL )+ )* '}' ;
    # 
    def constraint_namespace
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = ConstraintNamespaceReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL242__ = nil
      char_literal243 = nil
      __NL244__ = nil
      __NL246__ = nil
      char_literal247 = nil
      path241 = nil
      constraint_statement245 = nil

      tree_for_NL242 = nil
      tree_for_char_literal243 = nil
      tree_for_NL244 = nil
      tree_for_NL246 = nil
      tree_for_char_literal247 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 444:4: path ( NL )* '{' ( NL )* ( constraint_statement ( NL )+ )* '}'
        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_namespace_1422 )
        path241 = path
        @state.following.pop
        @adaptor.add_child( root_0, path241.tree )
        # at line 444:9: ( NL )*
        while true # decision 103
          alt_103 = 2
          look_103_0 = @input.peek( 1 )

          if ( look_103_0 == NL )
            alt_103 = 1

          end
          case alt_103
          when 1
            # at line 444:9: NL
            __NL242__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1424 )

            tree_for_NL242 = @adaptor.create_with_payload( __NL242__ )
            @adaptor.add_child( root_0, tree_for_NL242 )


          else
            break # out of loop for decision 103
          end
        end # loop for decision 103
        char_literal243 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_namespace_1427 )

        tree_for_char_literal243 = @adaptor.create_with_payload( char_literal243 )
        @adaptor.add_child( root_0, tree_for_char_literal243 )

        # at line 444:17: ( NL )*
        while true # decision 104
          alt_104 = 2
          look_104_0 = @input.peek( 1 )

          if ( look_104_0 == NL )
            alt_104 = 1

          end
          case alt_104
          when 1
            # at line 444:17: NL
            __NL244__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1429 )

            tree_for_NL244 = @adaptor.create_with_payload( __NL244__ )
            @adaptor.add_child( root_0, tree_for_NL244 )


          else
            break # out of loop for decision 104
          end
        end # loop for decision 104
        # at line 444:21: ( constraint_statement ( NL )+ )*
        while true # decision 106
          alt_106 = 2
          look_106_0 = @input.peek( 1 )

          if ( look_106_0 == ID || look_106_0 == T__29 || look_106_0 == T__55 || look_106_0 == T__59 )
            alt_106 = 1

          end
          case alt_106
          when 1
            # at line 444:22: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_namespace_1433 )
            constraint_statement245 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement245.tree )
            # --> action

            			key = self.to_ref(( path241 && @input.to_s( path241.start, path241.stop ) ) + '.' + ( constraint_statement245.nil? ? nil : constraint_statement245.key )[2,( constraint_statement245.nil? ? nil : constraint_statement245.key ).length])
            			@now[key] = ( constraint_statement245.nil? ? nil : constraint_statement245.val )
            		
            # <-- action
            # at file 449:3: ( NL )+
            match_count_105 = 0
            while true
              alt_105 = 2
              look_105_0 = @input.peek( 1 )

              if ( look_105_0 == NL )
                alt_105 = 1

              end
              case alt_105
              when 1
                # at line 449:3: NL
                __NL246__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1441 )

                tree_for_NL246 = @adaptor.create_with_payload( __NL246__ )
                @adaptor.add_child( root_0, tree_for_NL246 )


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
        char_literal247 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_namespace_1446 )

        tree_for_char_literal247 = @adaptor.create_with_payload( char_literal247 )
        @adaptor.add_child( root_0, tree_for_char_literal247 )

        # - - - - - - - rule clean up - - - - - - - -
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
    # 452:1: constraint_iterator : 'foreach' '(' path 'as' ID ')' ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ )* '}' ;
    # 
    def constraint_iterator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
      return_value = ConstraintIteratorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal248 = nil
      char_literal249 = nil
      string_literal251 = nil
      __ID252__ = nil
      char_literal253 = nil
      __NL254__ = nil
      char_literal255 = nil
      __NL256__ = nil
      __NL258__ = nil
      char_literal259 = nil
      path250 = nil
      constraint_statement257 = nil

      tree_for_string_literal248 = nil
      tree_for_char_literal249 = nil
      tree_for_string_literal251 = nil
      tree_for_ID252 = nil
      tree_for_char_literal253 = nil
      tree_for_NL254 = nil
      tree_for_char_literal255 = nil
      tree_for_NL256 = nil
      tree_for_NL258 = nil
      tree_for_char_literal259 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 453:4: 'foreach' '(' path 'as' ID ')' ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ )* '}'
        string_literal248 = match( T__48, TOKENS_FOLLOWING_T__48_IN_constraint_iterator_1457 )

        tree_for_string_literal248 = @adaptor.create_with_payload( string_literal248 )
        @adaptor.add_child( root_0, tree_for_string_literal248 )

        char_literal249 = match( T__37, TOKENS_FOLLOWING_T__37_IN_constraint_iterator_1459 )

        tree_for_char_literal249 = @adaptor.create_with_payload( char_literal249 )
        @adaptor.add_child( root_0, tree_for_char_literal249 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_iterator_1461 )
        path250 = path
        @state.following.pop
        @adaptor.add_child( root_0, path250.tree )
        string_literal251 = match( T__49, TOKENS_FOLLOWING_T__49_IN_constraint_iterator_1463 )

        tree_for_string_literal251 = @adaptor.create_with_payload( string_literal251 )
        @adaptor.add_child( root_0, tree_for_string_literal251 )

        __ID252__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_iterator_1465 )

        tree_for_ID252 = @adaptor.create_with_payload( __ID252__ )
        @adaptor.add_child( root_0, tree_for_ID252 )

        char_literal253 = match( T__39, TOKENS_FOLLOWING_T__39_IN_constraint_iterator_1467 )

        tree_for_char_literal253 = @adaptor.create_with_payload( char_literal253 )
        @adaptor.add_child( root_0, tree_for_char_literal253 )

        # at line 453:35: ( NL )*
        while true # decision 107
          alt_107 = 2
          look_107_0 = @input.peek( 1 )

          if ( look_107_0 == NL )
            alt_107 = 1

          end
          case alt_107
          when 1
            # at line 453:35: NL
            __NL254__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1469 )

            tree_for_NL254 = @adaptor.create_with_payload( __NL254__ )
            @adaptor.add_child( root_0, tree_for_NL254 )


          else
            break # out of loop for decision 107
          end
        end # loop for decision 107
        char_literal255 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_iterator_1472 )

        tree_for_char_literal255 = @adaptor.create_with_payload( char_literal255 )
        @adaptor.add_child( root_0, tree_for_char_literal255 )

        # at file 453:43: ( NL )+
        match_count_108 = 0
        while true
          alt_108 = 2
          look_108_0 = @input.peek( 1 )

          if ( look_108_0 == NL )
            alt_108 = 1

          end
          case alt_108
          when 1
            # at line 453:43: NL
            __NL256__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1474 )

            tree_for_NL256 = @adaptor.create_with_payload( __NL256__ )
            @adaptor.add_child( root_0, tree_for_NL256 )


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
        				'_value' => '$.' + ( path250 && @input.to_s( path250.start, path250.stop ) ),
        				'_variable' => __ID252__.text
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
        # at line 473:3: ( constraint_statement ( NL )+ )*
        while true # decision 110
          alt_110 = 2
          look_110_0 = @input.peek( 1 )

          if ( look_110_0 == ID || look_110_0 == T__29 || look_110_0 == T__55 || look_110_0 == T__59 )
            alt_110 = 1

          end
          case alt_110
          when 1
            # at line 473:4: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_iterator_1484 )
            constraint_statement257 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement257.tree )
            # --> action

            			@now[( constraint_statement257.nil? ? nil : constraint_statement257.key )] = ( constraint_statement257.nil? ? nil : constraint_statement257.val )
            		
            # <-- action
            # at file 477:3: ( NL )+
            match_count_109 = 0
            while true
              alt_109 = 2
              look_109_0 = @input.peek( 1 )

              if ( look_109_0 == NL )
                alt_109 = 1

              end
              case alt_109
              when 1
                # at line 477:3: NL
                __NL258__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1492 )

                tree_for_NL258 = @adaptor.create_with_payload( __NL258__ )
                @adaptor.add_child( root_0, tree_for_NL258 )


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
        char_literal259 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_iterator_1499 )

        tree_for_char_literal259 = @adaptor.create_with_payload( char_literal259 )
        @adaptor.add_child( root_0, tree_for_char_literal259 )

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
    # 485:1: quantification_keyword : ( 'forall' | 'exist' | 'forsome' );
    # 
    def quantification_keyword
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = QuantificationKeywordReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set260 = nil

      tree_for_set260 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set260 = @input.look
        if @input.peek( 1 ).between?( T__50, T__52 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set260 ) )
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
    # 491:1: constraint_class_quantification : quantification_keyword '(' path 'as' ID ')' ( ( binary_comp | '=' ) NUMBER )? ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ | constraint_different ( NL )+ | constraint_iterator ( NL )+ )* '}' ;
    # 
    def constraint_class_quantification
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
      return_value = ConstraintClassQuantificationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal262 = nil
      string_literal264 = nil
      __ID265__ = nil
      char_literal266 = nil
      char_literal268 = nil
      __NUMBER269__ = nil
      __NL270__ = nil
      char_literal271 = nil
      __NL272__ = nil
      __NL274__ = nil
      __NL276__ = nil
      __NL278__ = nil
      char_literal279 = nil
      quantification_keyword261 = nil
      path263 = nil
      binary_comp267 = nil
      constraint_statement273 = nil
      constraint_different275 = nil
      constraint_iterator277 = nil

      tree_for_char_literal262 = nil
      tree_for_string_literal264 = nil
      tree_for_ID265 = nil
      tree_for_char_literal266 = nil
      tree_for_char_literal268 = nil
      tree_for_NUMBER269 = nil
      tree_for_NL270 = nil
      tree_for_char_literal271 = nil
      tree_for_NL272 = nil
      tree_for_NL274 = nil
      tree_for_NL276 = nil
      tree_for_NL278 = nil
      tree_for_char_literal279 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 492:4: quantification_keyword '(' path 'as' ID ')' ( ( binary_comp | '=' ) NUMBER )? ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ | constraint_different ( NL )+ | constraint_iterator ( NL )+ )* '}'
        @state.following.push( TOKENS_FOLLOWING_quantification_keyword_IN_constraint_class_quantification_1535 )
        quantification_keyword261 = quantification_keyword
        @state.following.pop
        @adaptor.add_child( root_0, quantification_keyword261.tree )
        char_literal262 = match( T__37, TOKENS_FOLLOWING_T__37_IN_constraint_class_quantification_1537 )

        tree_for_char_literal262 = @adaptor.create_with_payload( char_literal262 )
        @adaptor.add_child( root_0, tree_for_char_literal262 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_class_quantification_1539 )
        path263 = path
        @state.following.pop
        @adaptor.add_child( root_0, path263.tree )
        string_literal264 = match( T__49, TOKENS_FOLLOWING_T__49_IN_constraint_class_quantification_1541 )

        tree_for_string_literal264 = @adaptor.create_with_payload( string_literal264 )
        @adaptor.add_child( root_0, tree_for_string_literal264 )

        __ID265__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_class_quantification_1543 )

        tree_for_ID265 = @adaptor.create_with_payload( __ID265__ )
        @adaptor.add_child( root_0, tree_for_ID265 )

        char_literal266 = match( T__39, TOKENS_FOLLOWING_T__39_IN_constraint_class_quantification_1545 )

        tree_for_char_literal266 = @adaptor.create_with_payload( char_literal266 )
        @adaptor.add_child( root_0, tree_for_char_literal266 )

        # --> action

        			id = self.next_id.to_s
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => ( quantification_keyword261 && @input.to_s( quantification_keyword261.start, quantification_keyword261.stop ) ),
        				'_self' => id,
        				'_class' => ( path263 && @input.to_s( path263.start, path263.stop ) ),
        				'_variable' => __ID265__.text
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
        # at line 512:3: ( ( binary_comp | '=' ) NUMBER )?
        alt_112 = 2
        look_112_0 = @input.peek( 1 )

        if ( look_112_0 == T__53 || look_112_0.between?( T__72, T__75 ) )
          alt_112 = 1
        end
        case alt_112
        when 1
          # at line 512:5: ( binary_comp | '=' ) NUMBER
          # at line 512:5: ( binary_comp | '=' )
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
            # at line 512:7: binary_comp
            @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_constraint_class_quantification_1557 )
            binary_comp267 = binary_comp
            @state.following.pop
            @adaptor.add_child( root_0, binary_comp267.tree )
            # --> action
            	@now['_count_operator'] = ( binary_comp267 && @input.to_s( binary_comp267.start, binary_comp267.stop ) )	
            # <-- action

          when 2
            # at line 514:6: '='
            char_literal268 = match( T__53, TOKENS_FOLLOWING_T__53_IN_constraint_class_quantification_1570 )

            tree_for_char_literal268 = @adaptor.create_with_payload( char_literal268 )
            @adaptor.add_child( root_0, tree_for_char_literal268 )

            # --> action
            	@now['_count_operator'] = '='	
            # <-- action

          end
          __NUMBER269__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_constraint_class_quantification_1586 )

          tree_for_NUMBER269 = @adaptor.create_with_payload( __NUMBER269__ )
          @adaptor.add_child( root_0, tree_for_NUMBER269 )

          # --> action
          	@now['_count_value'] = __NUMBER269__.text.to_i	
          # <-- action

        end
        # at line 520:3: ( NL )*
        while true # decision 113
          alt_113 = 2
          look_113_0 = @input.peek( 1 )

          if ( look_113_0 == NL )
            alt_113 = 1

          end
          case alt_113
          when 1
            # at line 520:3: NL
            __NL270__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1600 )

            tree_for_NL270 = @adaptor.create_with_payload( __NL270__ )
            @adaptor.add_child( root_0, tree_for_NL270 )


          else
            break # out of loop for decision 113
          end
        end # loop for decision 113
        char_literal271 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_class_quantification_1603 )

        tree_for_char_literal271 = @adaptor.create_with_payload( char_literal271 )
        @adaptor.add_child( root_0, tree_for_char_literal271 )

        # at file 520:11: ( NL )+
        match_count_114 = 0
        while true
          alt_114 = 2
          look_114_0 = @input.peek( 1 )

          if ( look_114_0 == NL )
            alt_114 = 1

          end
          case alt_114
          when 1
            # at line 520:11: NL
            __NL272__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1605 )

            tree_for_NL272 = @adaptor.create_with_payload( __NL272__ )
            @adaptor.add_child( root_0, tree_for_NL272 )


          else
            match_count_114 > 0 and break
            eee = EarlyExit(114)


            raise eee
          end
          match_count_114 += 1
        end

        # at line 521:3: ( constraint_statement ( NL )+ | constraint_different ( NL )+ | constraint_iterator ( NL )+ )*
        while true # decision 118
          alt_118 = 4
          case look_118 = @input.peek( 1 )
          when ID, T__29, T__55, T__59 then alt_118 = 1
          when T__54 then alt_118 = 2
          when T__48 then alt_118 = 3
          end
          case alt_118
          when 1
            # at line 521:5: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_class_quantification_1612 )
            constraint_statement273 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement273.tree )
            # --> action
            	@now[( constraint_statement273.nil? ? nil : constraint_statement273.key )] = ( constraint_statement273.nil? ? nil : constraint_statement273.val )	
            # <-- action
            # at file 523:4: ( NL )+
            match_count_115 = 0
            while true
              alt_115 = 2
              look_115_0 = @input.peek( 1 )

              if ( look_115_0 == NL )
                alt_115 = 1

              end
              case alt_115
              when 1
                # at line 523:4: NL
                __NL274__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1622 )

                tree_for_NL274 = @adaptor.create_with_payload( __NL274__ )
                @adaptor.add_child( root_0, tree_for_NL274 )


              else
                match_count_115 > 0 and break
                eee = EarlyExit(115)


                raise eee
              end
              match_count_115 += 1
            end


          when 2
            # at line 524:5: constraint_different ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_different_IN_constraint_class_quantification_1629 )
            constraint_different275 = constraint_different
            @state.following.pop
            @adaptor.add_child( root_0, constraint_different275.tree )
            # at file 524:26: ( NL )+
            match_count_116 = 0
            while true
              alt_116 = 2
              look_116_0 = @input.peek( 1 )

              if ( look_116_0 == NL )
                alt_116 = 1

              end
              case alt_116
              when 1
                # at line 524:26: NL
                __NL276__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1631 )

                tree_for_NL276 = @adaptor.create_with_payload( __NL276__ )
                @adaptor.add_child( root_0, tree_for_NL276 )


              else
                match_count_116 > 0 and break
                eee = EarlyExit(116)


                raise eee
              end
              match_count_116 += 1
            end


          when 3
            # at line 525:5: constraint_iterator ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_iterator_IN_constraint_class_quantification_1638 )
            constraint_iterator277 = constraint_iterator
            @state.following.pop
            @adaptor.add_child( root_0, constraint_iterator277.tree )
            # at file 525:25: ( NL )+
            match_count_117 = 0
            while true
              alt_117 = 2
              look_117_0 = @input.peek( 1 )

              if ( look_117_0 == NL )
                alt_117 = 1

              end
              case alt_117
              when 1
                # at line 525:25: NL
                __NL278__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1640 )

                tree_for_NL278 = @adaptor.create_with_payload( __NL278__ )
                @adaptor.add_child( root_0, tree_for_NL278 )


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
        char_literal279 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_class_quantification_1648 )

        tree_for_char_literal279 = @adaptor.create_with_payload( char_literal279 )
        @adaptor.add_child( root_0, tree_for_char_literal279 )

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
    # 531:1: constraint_different : ':different' '(' path ')' ;
    # 
    def constraint_different
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )
      return_value = ConstraintDifferentReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal280 = nil
      char_literal281 = nil
      char_literal283 = nil
      path282 = nil

      tree_for_string_literal280 = nil
      tree_for_char_literal281 = nil
      tree_for_char_literal283 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 532:4: ':different' '(' path ')'
        string_literal280 = match( T__54, TOKENS_FOLLOWING_T__54_IN_constraint_different_1667 )

        tree_for_string_literal280 = @adaptor.create_with_payload( string_literal280 )
        @adaptor.add_child( root_0, tree_for_string_literal280 )

        char_literal281 = match( T__37, TOKENS_FOLLOWING_T__37_IN_constraint_different_1669 )

        tree_for_char_literal281 = @adaptor.create_with_payload( char_literal281 )
        @adaptor.add_child( root_0, tree_for_char_literal281 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_different_1671 )
        path282 = path
        @state.following.pop
        @adaptor.add_child( root_0, path282.tree )
        char_literal283 = match( T__39, TOKENS_FOLLOWING_T__39_IN_constraint_different_1673 )

        tree_for_char_literal283 = @adaptor.create_with_payload( char_literal283 )
        @adaptor.add_child( root_0, tree_for_char_literal283 )

        # --> action

        			id = self.next_id.to_s
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'different',
        				'_self' => id,
        				'_path' => ( path282 && @input.to_s( path282.start, path282.stop ) )
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
    # 544:1: constraint_statement returns [key, val] : ( reference | 'not' reference | reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | conditional_constraint | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | reference binary_comp comp_value | total_constraint );
    # 
    def constraint_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
      return_value = ConstraintStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal285 = nil
      __NULL292__ = nil
      __NULL298__ = nil
      string_literal301 = nil
      string_literal302 = nil
      set305 = nil
      string_literal306 = nil
      reference284 = nil
      reference286 = nil
      reference287 = nil
      equals_op288 = nil
      value289 = nil
      reference290 = nil
      equals_op291 = nil
      reference293 = nil
      not_equals_op294 = nil
      value295 = nil
      reference296 = nil
      not_equals_op297 = nil
      conditional_constraint299 = nil
      reference300 = nil
      set_value303 = nil
      reference304 = nil
      set_value307 = nil
      reference308 = nil
      binary_comp309 = nil
      comp_value310 = nil
      total_constraint311 = nil

      tree_for_string_literal285 = nil
      tree_for_NULL292 = nil
      tree_for_NULL298 = nil
      tree_for_string_literal301 = nil
      tree_for_string_literal302 = nil
      tree_for_set305 = nil
      tree_for_string_literal306 = nil

      begin
        # at line 545:2: ( reference | 'not' reference | reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | conditional_constraint | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | reference binary_comp comp_value | total_constraint )
        alt_120 = 11
        alt_120 = @dfa120.predict( @input )
        case alt_120
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 545:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1692 )
          reference284 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference284.tree )
          # --> action

          			return_value.key = ( reference284.nil? ? nil : reference284.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => true }
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 550:4: 'not' reference
          string_literal285 = match( T__55, TOKENS_FOLLOWING_T__55_IN_constraint_statement_1701 )

          tree_for_string_literal285 = @adaptor.create_with_payload( string_literal285 )
          @adaptor.add_child( root_0, tree_for_string_literal285 )

          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1703 )
          reference286 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference286.tree )
          # --> action

          			return_value.key = ( reference286.nil? ? nil : reference286.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => false }
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 555:4: reference equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1712 )
          reference287 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference287.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1714 )
          equals_op288 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op288.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_1716 )
          value289 = value
          @state.following.pop
          @adaptor.add_child( root_0, value289.tree )
          # --> action

          			return_value.key = ( reference287.nil? ? nil : reference287.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => ( value289.nil? ? nil : value289.val ) }
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 560:4: reference equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1725 )
          reference290 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference290.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1727 )
          equals_op291 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op291.tree )
          __NULL292__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_constraint_statement_1729 )

          tree_for_NULL292 = @adaptor.create_with_payload( __NULL292__ )
          @adaptor.add_child( root_0, tree_for_NULL292 )

          # --> action

          			return_value.key = ( reference290.nil? ? nil : reference290.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => self.null_value }
          		
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 565:4: reference not_equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1738 )
          reference293 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference293.tree )
          @state.following.push( TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1740 )
          not_equals_op294 = not_equals_op
          @state.following.pop
          @adaptor.add_child( root_0, not_equals_op294.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_1742 )
          value295 = value
          @state.following.pop
          @adaptor.add_child( root_0, value295.tree )
          # --> action

          			return_value.key = ( reference293.nil? ? nil : reference293.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-equals', '_value' => ( value295.nil? ? nil : value295.val ) }
          		
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 570:4: reference not_equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1751 )
          reference296 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference296.tree )
          @state.following.push( TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1753 )
          not_equals_op297 = not_equals_op
          @state.following.pop
          @adaptor.add_child( root_0, not_equals_op297.tree )
          __NULL298__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_constraint_statement_1755 )

          tree_for_NULL298 = @adaptor.create_with_payload( __NULL298__ )
          @adaptor.add_child( root_0, tree_for_NULL298 )

          # --> action

          			return_value.key = ( reference296.nil? ? nil : reference296.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-equals', '_value' => self.null_value }
          		
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 575:4: conditional_constraint
          @state.following.push( TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_1764 )
          conditional_constraint299 = conditional_constraint
          @state.following.pop
          @adaptor.add_child( root_0, conditional_constraint299.tree )
          # --> action

          			return_value.key = ( conditional_constraint299.nil? ? nil : conditional_constraint299.key )
          			return_value.val = ( conditional_constraint299.nil? ? nil : conditional_constraint299.val )
          		
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 580:4: reference ( 'is' )? 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1773 )
          reference300 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference300.tree )
          # at line 580:14: ( 'is' )?
          alt_119 = 2
          look_119_0 = @input.peek( 1 )

          if ( look_119_0 == T__56 )
            alt_119 = 1
          end
          case alt_119
          when 1
            # at line 580:14: 'is'
            string_literal301 = match( T__56, TOKENS_FOLLOWING_T__56_IN_constraint_statement_1775 )

            tree_for_string_literal301 = @adaptor.create_with_payload( string_literal301 )
            @adaptor.add_child( root_0, tree_for_string_literal301 )


          end
          string_literal302 = match( T__57, TOKENS_FOLLOWING_T__57_IN_constraint_statement_1778 )

          tree_for_string_literal302 = @adaptor.create_with_payload( string_literal302 )
          @adaptor.add_child( root_0, tree_for_string_literal302 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_1780 )
          set_value303 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value303.tree )
          # --> action

          			c_or = { '_context' => 'constraint', '_type' => 'or', '_parent' => @now }
          			( set_value303.nil? ? nil : set_value303.val ).each { |v|
          				id = self.next_id.to_s
          				item = { '_context' => 'constraint', '_type' => 'and', '_parent' => c_or }
          				item[( reference300.nil? ? nil : reference300.val )] = { '_context' => 'constraint', '_type' => 'equals', '_value' => v }
          				c_or[id] = item
          			}
          			return_value.key = self.next_id.to_s
          			return_value.val = c_or
          		
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 592:4: reference ( 'isnt' | 'not' ) 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1789 )
          reference304 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference304.tree )
          set305 = @input.look
          if @input.peek(1) == T__55 || @input.peek(1) == T__58
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set305 ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          string_literal306 = match( T__57, TOKENS_FOLLOWING_T__57_IN_constraint_statement_1797 )

          tree_for_string_literal306 = @adaptor.create_with_payload( string_literal306 )
          @adaptor.add_child( root_0, tree_for_string_literal306 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_1799 )
          set_value307 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value307.tree )
          # --> action

          			c_and = { '_context'=>'constraint', '_type'=>'and', '_parent'=>@now }
          			( set_value307.nil? ? nil : set_value307.val ).each { |v|
          				id = self.next_id.to_s
          				item = { '_context'=>'constraint', '_type'=>'and'}
          				item[( reference304.nil? ? nil : reference304.val )] = { '_context'=>'constraint', '_type'=>'not-equals', '_value'=>v }
          				c_and[id] = item
          			}
          			return_value.key = self.next_id.to_s
          			return_value.val = c_and

          			#return_value.key = ( reference304.nil? ? nil : reference304.val )
          			#return_value.val = { '_context' => 'constraint', '_type' => 'not-in', '_value' => ( set_value307.nil? ? nil : set_value307.val ) }
          		
          # <-- action

        when 10
          root_0 = @adaptor.create_flat_list


          # at line 607:4: reference binary_comp comp_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1808 )
          reference308 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference308.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_1810 )
          binary_comp309 = binary_comp
          @state.following.pop
          @adaptor.add_child( root_0, binary_comp309.tree )
          @state.following.push( TOKENS_FOLLOWING_comp_value_IN_constraint_statement_1812 )
          comp_value310 = comp_value
          @state.following.pop
          @adaptor.add_child( root_0, comp_value310.tree )
          # --> action

          			return_value.key = ( reference308.nil? ? nil : reference308.val )
          			return_value.val = { '_context' => 'constraint', '_type' => ( binary_comp309 && @input.to_s( binary_comp309.start, binary_comp309.stop ) ), '_value' => ( comp_value310.nil? ? nil : comp_value310.val ) }
          		
          # <-- action

        when 11
          root_0 = @adaptor.create_flat_list


          # at line 612:4: total_constraint
          @state.following.push( TOKENS_FOLLOWING_total_constraint_IN_constraint_statement_1821 )
          total_constraint311 = total_constraint
          @state.following.pop
          @adaptor.add_child( root_0, total_constraint311.tree )

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
    # 615:1: total_constraint : 'total(' total_statement ')' binary_comp NUMBER ;
    # 
    def total_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
      return_value = TotalConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal312 = nil
      char_literal314 = nil
      __NUMBER316__ = nil
      total_statement313 = nil
      binary_comp315 = nil

      tree_for_string_literal312 = nil
      tree_for_char_literal314 = nil
      tree_for_NUMBER316 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 616:4: 'total(' total_statement ')' binary_comp NUMBER
        string_literal312 = match( T__59, TOKENS_FOLLOWING_T__59_IN_total_constraint_1832 )

        tree_for_string_literal312 = @adaptor.create_with_payload( string_literal312 )
        @adaptor.add_child( root_0, tree_for_string_literal312 )

        @state.following.push( TOKENS_FOLLOWING_total_statement_IN_total_constraint_1834 )
        total_statement313 = total_statement
        @state.following.pop
        @adaptor.add_child( root_0, total_statement313.tree )
        char_literal314 = match( T__39, TOKENS_FOLLOWING_T__39_IN_total_constraint_1836 )

        tree_for_char_literal314 = @adaptor.create_with_payload( char_literal314 )
        @adaptor.add_child( root_0, tree_for_char_literal314 )

        @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_total_constraint_1838 )
        binary_comp315 = binary_comp
        @state.following.pop
        @adaptor.add_child( root_0, binary_comp315.tree )
        __NUMBER316__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_total_constraint_1840 )

        tree_for_NUMBER316 = @adaptor.create_with_payload( __NUMBER316__ )
        @adaptor.add_child( root_0, tree_for_NUMBER316 )

        # - - - - - - - rule clean up - - - - - - - -
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
    # 619:1: total_statement : reference equals_op value ;
    # 
    def total_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )
      return_value = TotalStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      reference317 = nil
      equals_op318 = nil
      value319 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 620:4: reference equals_op value
        @state.following.push( TOKENS_FOLLOWING_reference_IN_total_statement_1851 )
        reference317 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference317.tree )
        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_total_statement_1853 )
        equals_op318 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op318.tree )
        @state.following.push( TOKENS_FOLLOWING_value_IN_total_statement_1855 )
        value319 = value
        @state.following.pop
        @adaptor.add_child( root_0, value319.tree )
        # - - - - - - - rule clean up - - - - - - - -
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
    # 623:1: comp_value returns [val] : ( NUMBER | reference );
    # 
    def comp_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )
      return_value = CompValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NUMBER320__ = nil
      reference321 = nil

      tree_for_NUMBER320 = nil

      begin
        # at line 624:2: ( NUMBER | reference )
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


          # at line 624:4: NUMBER
          __NUMBER320__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_comp_value_1870 )

          tree_for_NUMBER320 = @adaptor.create_with_payload( __NUMBER320__ )
          @adaptor.add_child( root_0, tree_for_NUMBER320 )

          # --> action
          	return_value.val = __NUMBER320__.text.to_i	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 626:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_comp_value_1879 )
          reference321 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference321.tree )
          # --> action
          	return_value.val = ( reference321.nil? ? nil : reference321.val )	
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
    # 630:1: conditional_constraint returns [key, val] : 'if' constraint_statement ( NL )* conditional_constraint_then ;
    # 
    def conditional_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )
      return_value = ConditionalConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal322 = nil
      __NL324__ = nil
      constraint_statement323 = nil
      conditional_constraint_then325 = nil

      tree_for_string_literal322 = nil
      tree_for_NL324 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 631:4: 'if' constraint_statement ( NL )* conditional_constraint_then
        string_literal322 = match( T__29, TOKENS_FOLLOWING_T__29_IN_conditional_constraint_1898 )

        tree_for_string_literal322 = @adaptor.create_with_payload( string_literal322 )
        @adaptor.add_child( root_0, tree_for_string_literal322 )

        # --> action

        			return_value.key = id = self.next_id.to_s
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'or'
        			}
        			@now = @now[id]
        		
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_1906 )
        constraint_statement323 = constraint_statement
        @state.following.pop
        @adaptor.add_child( root_0, constraint_statement323.tree )
        # at line 640:24: ( NL )*
        while true # decision 122
          alt_122 = 2
          look_122_0 = @input.peek( 1 )

          if ( look_122_0 == NL )
            alt_122 = 1

          end
          case alt_122
          when 1
            # at line 640:24: NL
            __NL324__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditional_constraint_1908 )

            tree_for_NL324 = @adaptor.create_with_payload( __NL324__ )
            @adaptor.add_child( root_0, tree_for_NL324 )


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
        			@now[id][( constraint_statement323.nil? ? nil : constraint_statement323.key )] = ( constraint_statement323.nil? ? nil : constraint_statement323.val )
        		
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_conditional_constraint_then_IN_conditional_constraint_1917 )
        conditional_constraint_then325 = conditional_constraint_then
        @state.following.pop
        @adaptor.add_child( root_0, conditional_constraint_then325.tree )
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
    # 653:1: conditional_constraint_then : 'then' constraint_statement ;
    # 
    def conditional_constraint_then
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )
      return_value = ConditionalConstraintThenReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal326 = nil
      constraint_statement327 = nil

      tree_for_string_literal326 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 654:4: 'then' constraint_statement
        string_literal326 = match( T__30, TOKENS_FOLLOWING_T__30_IN_conditional_constraint_then_1932 )

        tree_for_string_literal326 = @adaptor.create_with_payload( string_literal326 )
        @adaptor.add_child( root_0, tree_for_string_literal326 )

        @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_1934 )
        constraint_statement327 = constraint_statement
        @state.following.pop
        @adaptor.add_child( root_0, constraint_statement327.tree )
        # --> action

        			id = self.next_id
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'and'
        			}
        			@now[id][( constraint_statement327.nil? ? nil : constraint_statement327.key )] = ( constraint_statement327.nil? ? nil : constraint_statement327.val )
        		
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
    # 665:1: mutation_body : ( ( mutation_statement | mutation_iterator ) ( NL )+ )* ;
    # 
    def mutation_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )
      return_value = MutationBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL330__ = nil
      mutation_statement328 = nil
      mutation_iterator329 = nil

      tree_for_NL330 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 666:4: ( ( mutation_statement | mutation_iterator ) ( NL )+ )*
        # at line 666:4: ( ( mutation_statement | mutation_iterator ) ( NL )+ )*
        while true # decision 125
          alt_125 = 2
          look_125_0 = @input.peek( 1 )

          if ( look_125_0 == ID || look_125_0 == T__48 || look_125_0 == T__61 )
            alt_125 = 1

          end
          case alt_125
          when 1
            # at line 667:4: ( mutation_statement | mutation_iterator ) ( NL )+
            # at line 667:4: ( mutation_statement | mutation_iterator )
            alt_123 = 2
            look_123_0 = @input.peek( 1 )

            if ( look_123_0 == ID || look_123_0 == T__61 )
              alt_123 = 1
            elsif ( look_123_0 == T__48 )
              alt_123 = 2
            else
              raise NoViableAlternative( "", 123, 0 )
            end
            case alt_123
            when 1
              # at line 667:6: mutation_statement
              @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_mutation_body_1956 )
              mutation_statement328 = mutation_statement
              @state.following.pop
              @adaptor.add_child( root_0, mutation_statement328.tree )
              # --> action
              	@now[( mutation_statement328.nil? ? nil : mutation_statement328.key )] = ( mutation_statement328.nil? ? nil : mutation_statement328.val )	
              # <-- action

            when 2
              # at line 669:6: mutation_iterator
              @state.following.push( TOKENS_FOLLOWING_mutation_iterator_IN_mutation_body_1969 )
              mutation_iterator329 = mutation_iterator
              @state.following.pop
              @adaptor.add_child( root_0, mutation_iterator329.tree )

            end
            # at file 671:3: ( NL )+
            match_count_124 = 0
            while true
              alt_124 = 2
              look_124_0 = @input.peek( 1 )

              if ( look_124_0 == NL )
                alt_124 = 1

              end
              case alt_124
              when 1
                # at line 671:3: NL
                __NL330__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_body_1978 )

                tree_for_NL330 = @adaptor.create_with_payload( __NL330__ )
                @adaptor.add_child( root_0, tree_for_NL330 )


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
        # - - - - - - - rule clean up - - - - - - - -
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
    # 674:1: mutation_iterator : 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( mutation_statement ( NL )+ )* '}' ;
    # 
    def mutation_iterator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )
      return_value = MutationIteratorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal331 = nil
      string_literal333 = nil
      __ID334__ = nil
      __NL335__ = nil
      char_literal336 = nil
      __NL337__ = nil
      __NL339__ = nil
      char_literal340 = nil
      path332 = nil
      mutation_statement338 = nil

      tree_for_string_literal331 = nil
      tree_for_string_literal333 = nil
      tree_for_ID334 = nil
      tree_for_NL335 = nil
      tree_for_char_literal336 = nil
      tree_for_NL337 = nil
      tree_for_NL339 = nil
      tree_for_char_literal340 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 675:4: 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( mutation_statement ( NL )+ )* '}'
        string_literal331 = match( T__48, TOKENS_FOLLOWING_T__48_IN_mutation_iterator_1993 )

        tree_for_string_literal331 = @adaptor.create_with_payload( string_literal331 )
        @adaptor.add_child( root_0, tree_for_string_literal331 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_iterator_1995 )
        path332 = path
        @state.following.pop
        @adaptor.add_child( root_0, path332.tree )
        string_literal333 = match( T__49, TOKENS_FOLLOWING_T__49_IN_mutation_iterator_1997 )

        tree_for_string_literal333 = @adaptor.create_with_payload( string_literal333 )
        @adaptor.add_child( root_0, tree_for_string_literal333 )

        __ID334__ = match( ID, TOKENS_FOLLOWING_ID_IN_mutation_iterator_1999 )

        tree_for_ID334 = @adaptor.create_with_payload( __ID334__ )
        @adaptor.add_child( root_0, tree_for_ID334 )

        # at line 675:27: ( NL )*
        while true # decision 126
          alt_126 = 2
          look_126_0 = @input.peek( 1 )

          if ( look_126_0 == NL )
            alt_126 = 1

          end
          case alt_126
          when 1
            # at line 675:27: NL
            __NL335__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_2001 )

            tree_for_NL335 = @adaptor.create_with_payload( __NL335__ )
            @adaptor.add_child( root_0, tree_for_NL335 )


          else
            break # out of loop for decision 126
          end
        end # loop for decision 126
        char_literal336 = match( T__20, TOKENS_FOLLOWING_T__20_IN_mutation_iterator_2004 )

        tree_for_char_literal336 = @adaptor.create_with_payload( char_literal336 )
        @adaptor.add_child( root_0, tree_for_char_literal336 )

        # at file 675:35: ( NL )+
        match_count_127 = 0
        while true
          alt_127 = 2
          look_127_0 = @input.peek( 1 )

          if ( look_127_0 == NL )
            alt_127 = 1

          end
          case alt_127
          when 1
            # at line 675:35: NL
            __NL337__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_2006 )

            tree_for_NL337 = @adaptor.create_with_payload( __NL337__ )
            @adaptor.add_child( root_0, tree_for_NL337 )


          else
            match_count_127 > 0 and break
            eee = EarlyExit(127)


            raise eee
          end
          match_count_127 += 1
        end

        # --> action

        			id = self.to_ref(( path332 && @input.to_s( path332.start, path332.stop ) ))
        			@now[id] = { '_parent' => @now,
        				'_context' => 'iterator',
        				'_self' => id,
        				'_variable' => __ID334__.text
        			}
        			@now = @now[id]
        		
        # <-- action
        # at line 685:3: ( mutation_statement ( NL )+ )*
        while true # decision 129
          alt_129 = 2
          look_129_0 = @input.peek( 1 )

          if ( look_129_0 == ID || look_129_0 == T__61 )
            alt_129 = 1

          end
          case alt_129
          when 1
            # at line 685:4: mutation_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_mutation_iterator_2016 )
            mutation_statement338 = mutation_statement
            @state.following.pop
            @adaptor.add_child( root_0, mutation_statement338.tree )
            # --> action
            	@now[( mutation_statement338.nil? ? nil : mutation_statement338.key )] = ( mutation_statement338.nil? ? nil : mutation_statement338.val )	
            # <-- action
            # at file 687:3: ( NL )+
            match_count_128 = 0
            while true
              alt_128 = 2
              look_128_0 = @input.peek( 1 )

              if ( look_128_0 == NL )
                alt_128 = 1

              end
              case alt_128
              when 1
                # at line 687:3: NL
                __NL339__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_2024 )

                tree_for_NL339 = @adaptor.create_with_payload( __NL339__ )
                @adaptor.add_child( root_0, tree_for_NL339 )


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
        char_literal340 = match( T__21, TOKENS_FOLLOWING_T__21_IN_mutation_iterator_2031 )

        tree_for_char_literal340 = @adaptor.create_with_payload( char_literal340 )
        @adaptor.add_child( root_0, tree_for_char_literal340 )

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
    # 692:1: mutation_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' );
    # 
    def mutation_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )
      return_value = MutationStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL346__ = nil
      __NUMBER349__ = nil
      string_literal351 = nil
      string_literal352 = nil
      string_literal355 = nil
      string_literal358 = nil
      char_literal360 = nil
      string_literal362 = nil
      char_literal364 = nil
      reference341 = nil
      equals_op342 = nil
      value343 = nil
      reference344 = nil
      equals_op345 = nil
      reference347 = nil
      binary_op348 = nil
      reference350 = nil
      path353 = nil
      object_body354 = nil
      path356 = nil
      reference357 = nil
      value359 = nil
      reference361 = nil
      value363 = nil

      tree_for_NULL346 = nil
      tree_for_NUMBER349 = nil
      tree_for_string_literal351 = nil
      tree_for_string_literal352 = nil
      tree_for_string_literal355 = nil
      tree_for_string_literal358 = nil
      tree_for_char_literal360 = nil
      tree_for_string_literal362 = nil
      tree_for_char_literal364 = nil

      begin
        # at line 693:2: ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' )
        alt_131 = 7
        alt_131 = @dfa131.predict( @input )
        case alt_131
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 693:4: reference equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2050 )
          reference341 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference341.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_mutation_statement_2052 )
          equals_op342 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op342.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_2054 )
          value343 = value
          @state.following.pop
          @adaptor.add_child( root_0, value343.tree )
          # --> action

          			return_value.key = ( reference341.nil? ? nil : reference341.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'equals',
          				'_value' => ( value343.nil? ? nil : value343.val )
          			}
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 701:4: reference equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2063 )
          reference344 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference344.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_mutation_statement_2065 )
          equals_op345 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op345.tree )
          __NULL346__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_mutation_statement_2067 )

          tree_for_NULL346 = @adaptor.create_with_payload( __NULL346__ )
          @adaptor.add_child( root_0, tree_for_NULL346 )

          # --> action

          			return_value.key = ( reference344.nil? ? nil : reference344.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'equals',
          				'_value' => self.null_value
          			}
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 709:4: reference binary_op NUMBER
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2076 )
          reference347 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference347.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_op_IN_mutation_statement_2078 )
          binary_op348 = binary_op
          @state.following.pop
          @adaptor.add_child( root_0, binary_op348.tree )
          __NUMBER349__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_mutation_statement_2080 )

          tree_for_NUMBER349 = @adaptor.create_with_payload( __NUMBER349__ )
          @adaptor.add_child( root_0, tree_for_NUMBER349 )

          # --> action

          			return_value.key = ( reference347.nil? ? nil : reference347.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => ( binary_op348 && @input.to_s( binary_op348.start, binary_op348.stop ) ),
          				'_value' => __NUMBER349__.text.to_i
          			}
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 717:4: reference 'is' 'new' path ( object_body )?
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2089 )
          reference350 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference350.tree )
          string_literal351 = match( T__56, TOKENS_FOLLOWING_T__56_IN_mutation_statement_2091 )

          tree_for_string_literal351 = @adaptor.create_with_payload( string_literal351 )
          @adaptor.add_child( root_0, tree_for_string_literal351 )

          string_literal352 = match( T__60, TOKENS_FOLLOWING_T__60_IN_mutation_statement_2093 )

          tree_for_string_literal352 = @adaptor.create_with_payload( string_literal352 )
          @adaptor.add_child( root_0, tree_for_string_literal352 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_statement_2095 )
          path353 = path
          @state.following.pop
          @adaptor.add_child( root_0, path353.tree )
          # --> action

          			id = '_' + self.next_id
          			@now[id] = { '_self' => id,
          				'_context' => 'object',
          				'_isa' => self.to_ref(( path353 && @input.to_s( path353.start, path353.stop ) )),
          				'_parent' => @now
          			}
          			@now = @now[id]
          		
          # <-- action
          # at line 727:3: ( object_body )?
          alt_130 = 2
          look_130_0 = @input.peek( 1 )

          if ( look_130_0 == T__20 )
            alt_130 = 1
          end
          case alt_130
          when 1
            # at line 727:3: object_body
            @state.following.push( TOKENS_FOLLOWING_object_body_IN_mutation_statement_2103 )
            object_body354 = object_body
            @state.following.pop
            @adaptor.add_child( root_0, object_body354.tree )

          end
          # --> action

          			n = self.goto_parent()
          			@now.delete(n['_self'])
          			return_value.key = ( reference350.nil? ? nil : reference350.val )
          			return_value.val = n
          		
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 734:4: 'delete' path
          string_literal355 = match( T__61, TOKENS_FOLLOWING_T__61_IN_mutation_statement_2113 )

          tree_for_string_literal355 = @adaptor.create_with_payload( string_literal355 )
          @adaptor.add_child( root_0, tree_for_string_literal355 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_statement_2115 )
          path356 = path
          @state.following.pop
          @adaptor.add_child( root_0, path356.tree )
          # --> action

          			id = '_' + self.next_id
          			@now[id] = { '_self' => id,
          				'_context' => 'mutation',
          				'_type' => 'delete',
          				'_value' => self.to_ref(( path356 && @input.to_s( path356.start, path356.stop ) ))
          			}
          		
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 743:4: reference 'add(' value ')'
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2124 )
          reference357 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference357.tree )
          string_literal358 = match( T__62, TOKENS_FOLLOWING_T__62_IN_mutation_statement_2126 )

          tree_for_string_literal358 = @adaptor.create_with_payload( string_literal358 )
          @adaptor.add_child( root_0, tree_for_string_literal358 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_2128 )
          value359 = value
          @state.following.pop
          @adaptor.add_child( root_0, value359.tree )
          char_literal360 = match( T__39, TOKENS_FOLLOWING_T__39_IN_mutation_statement_2130 )

          tree_for_char_literal360 = @adaptor.create_with_payload( char_literal360 )
          @adaptor.add_child( root_0, tree_for_char_literal360 )

          # --> action

          			return_value.key = ( reference357.nil? ? nil : reference357.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'add',
          				'_value' => ( value359.nil? ? nil : value359.val )
          			}
          		
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 751:4: reference 'remove(' value ')'
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2139 )
          reference361 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference361.tree )
          string_literal362 = match( T__63, TOKENS_FOLLOWING_T__63_IN_mutation_statement_2141 )

          tree_for_string_literal362 = @adaptor.create_with_payload( string_literal362 )
          @adaptor.add_child( root_0, tree_for_string_literal362 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_2143 )
          value363 = value
          @state.following.pop
          @adaptor.add_child( root_0, value363.tree )
          char_literal364 = match( T__39, TOKENS_FOLLOWING_T__39_IN_mutation_statement_2145 )

          tree_for_char_literal364 = @adaptor.create_with_payload( char_literal364 )
          @adaptor.add_child( root_0, tree_for_char_literal364 )

          # --> action

          			return_value.key = ( reference361.nil? ? nil : reference361.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'remove',
          				'_value' => ( value363.nil? ? nil : value363.val )
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
    # 761:1: set_value returns [val] : '(' ( set_item ( ',' set_item )* )? ')' ;
    # 
    def set_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )
      return_value = SetValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal365 = nil
      char_literal367 = nil
      char_literal369 = nil
      set_item366 = nil
      set_item368 = nil

      tree_for_char_literal365 = nil
      tree_for_char_literal367 = nil
      tree_for_char_literal369 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 762:4: '(' ( set_item ( ',' set_item )* )? ')'
        char_literal365 = match( T__37, TOKENS_FOLLOWING_T__37_IN_set_value_2164 )

        tree_for_char_literal365 = @adaptor.create_with_payload( char_literal365 )
        @adaptor.add_child( root_0, tree_for_char_literal365 )

        # --> action
        	@set = Array.new	
        # <-- action
        # at line 764:3: ( set_item ( ',' set_item )* )?
        alt_133 = 2
        look_133_0 = @input.peek( 1 )

        if ( look_133_0.between?( STRING, NUMBER ) || look_133_0.between?( BOOLEAN, MULTILINE_STRING ) || look_133_0 == T__37 )
          alt_133 = 1
        end
        case alt_133
        when 1
          # at line 764:4: set_item ( ',' set_item )*
          @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_2173 )
          set_item366 = set_item
          @state.following.pop
          @adaptor.add_child( root_0, set_item366.tree )
          # at line 764:13: ( ',' set_item )*
          while true # decision 132
            alt_132 = 2
            look_132_0 = @input.peek( 1 )

            if ( look_132_0 == T__38 )
              alt_132 = 1

            end
            case alt_132
            when 1
              # at line 764:14: ',' set_item
              char_literal367 = match( T__38, TOKENS_FOLLOWING_T__38_IN_set_value_2176 )

              tree_for_char_literal367 = @adaptor.create_with_payload( char_literal367 )
              @adaptor.add_child( root_0, tree_for_char_literal367 )

              @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_2178 )
              set_item368 = set_item
              @state.following.pop
              @adaptor.add_child( root_0, set_item368.tree )

            else
              break # out of loop for decision 132
            end
          end # loop for decision 132

        end
        # --> action
        	return_value.val = @set	
        # <-- action
        char_literal369 = match( T__39, TOKENS_FOLLOWING_T__39_IN_set_value_2190 )

        tree_for_char_literal369 = @adaptor.create_with_payload( char_literal369 )
        @adaptor.add_child( root_0, tree_for_char_literal369 )

        # - - - - - - - rule clean up - - - - - - - -
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
    # 769:1: set_item : value ;
    # 
    def set_item
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )
      return_value = SetItemReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      value370 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 770:4: value
        @state.following.push( TOKENS_FOLLOWING_value_IN_set_item_2201 )
        value370 = value
        @state.following.pop
        @adaptor.add_child( root_0, value370.tree )
        # --> action
        	@set.push(( value370.nil? ? nil : value370.val ))	
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

    ValueReturnValue = define_return_scope :val, :type

    # 
    # parser rule value
    # 
    # (in SFP.g)
    # 774:1: value returns [val, type] : ( primitive_value | reference | set_value );
    # 
    def value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )
      return_value = ValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      primitive_value371 = nil
      reference372 = nil
      set_value373 = nil


      begin
        # at line 775:2: ( primitive_value | reference | set_value )
        alt_134 = 3
        case look_134 = @input.peek( 1 )
        when STRING, NUMBER, BOOLEAN, MULTILINE_STRING then alt_134 = 1
        when ID then alt_134 = 2
        when T__37 then alt_134 = 3
        else
          raise NoViableAlternative( "", 134, 0 )
        end
        case alt_134
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 775:4: primitive_value
          @state.following.push( TOKENS_FOLLOWING_primitive_value_IN_value_2220 )
          primitive_value371 = primitive_value
          @state.following.pop
          @adaptor.add_child( root_0, primitive_value371.tree )
          # --> action

          			return_value.val = ( primitive_value371.nil? ? nil : primitive_value371.val )
          			return_value.type = ( primitive_value371.nil? ? nil : primitive_value371.type )
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 780:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_value_2229 )
          reference372 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference372.tree )
          # --> action

          			return_value.val = ( reference372.nil? ? nil : reference372.val )
          			return_value.type = 'Reference'
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 785:4: set_value
          @state.following.push( TOKENS_FOLLOWING_set_value_IN_value_2238 )
          set_value373 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value373.tree )
          # --> action

          			return_value.val = ( set_value373.nil? ? nil : set_value373.val )
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
        # trace_out( __method__, 46 )

      end
      
      return return_value
    end

    PrimitiveValueReturnValue = define_return_scope :val, :type

    # 
    # parser rule primitive_value
    # 
    # (in SFP.g)
    # 792:1: primitive_value returns [val, type] : ( BOOLEAN | NUMBER | STRING | MULTILINE_STRING );
    # 
    def primitive_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 47 )
      return_value = PrimitiveValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __BOOLEAN374__ = nil
      __NUMBER375__ = nil
      __STRING376__ = nil
      __MULTILINE_STRING377__ = nil

      tree_for_BOOLEAN374 = nil
      tree_for_NUMBER375 = nil
      tree_for_STRING376 = nil
      tree_for_MULTILINE_STRING377 = nil

      begin
        # at line 793:2: ( BOOLEAN | NUMBER | STRING | MULTILINE_STRING )
        alt_135 = 4
        case look_135 = @input.peek( 1 )
        when BOOLEAN then alt_135 = 1
        when NUMBER then alt_135 = 2
        when STRING then alt_135 = 3
        when MULTILINE_STRING then alt_135 = 4
        else
          raise NoViableAlternative( "", 135, 0 )
        end
        case alt_135
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 793:4: BOOLEAN
          __BOOLEAN374__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_2257 )

          tree_for_BOOLEAN374 = @adaptor.create_with_payload( __BOOLEAN374__ )
          @adaptor.add_child( root_0, tree_for_BOOLEAN374 )

          # --> action

          			if __BOOLEAN374__.text == 'true' or __BOOLEAN374__.text == 'on' or __BOOLEAN374__.text == 'yes'
          				return_value.val = true
          			else  # 'false', 'no', 'off'
          				return_value.val = false
          			end
          			return_value.type = 'Boolean'
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 802:4: NUMBER
          __NUMBER375__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_primitive_value_2266 )

          tree_for_NUMBER375 = @adaptor.create_with_payload( __NUMBER375__ )
          @adaptor.add_child( root_0, tree_for_NUMBER375 )

          # --> action

          			return_value.val = __NUMBER375__.text.to_i
          			return_value.type = 'Number'
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 807:4: STRING
          __STRING376__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_primitive_value_2275 )

          tree_for_STRING376 = @adaptor.create_with_payload( __STRING376__ )
          @adaptor.add_child( root_0, tree_for_STRING376 )

          # --> action

          			return_value.val = __STRING376__.text[1,__STRING376__.text.length-2]
          			return_value.type = 'String'
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 812:4: MULTILINE_STRING
          __MULTILINE_STRING377__ = match( MULTILINE_STRING, TOKENS_FOLLOWING_MULTILINE_STRING_IN_primitive_value_2284 )

          tree_for_MULTILINE_STRING377 = @adaptor.create_with_payload( __MULTILINE_STRING377__ )
          @adaptor.add_child( root_0, tree_for_MULTILINE_STRING377 )

          # --> action

          			return_value.val = __MULTILINE_STRING377__.text[2, __MULTILINE_STRING377__.text.length-2]
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
        # trace_out( __method__, 47 )

      end
      
      return return_value
    end

    PathReturnValue = define_return_scope 

    # 
    # parser rule path
    # 
    # (in SFP.g)
    # 819:1: path : ID ( '.' ID )* ;
    # 
    def path
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 48 )
      return_value = PathReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID378__ = nil
      char_literal379 = nil
      __ID380__ = nil

      tree_for_ID378 = nil
      tree_for_char_literal379 = nil
      tree_for_ID380 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 820:4: ID ( '.' ID )*
        __ID378__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_2299 )

        tree_for_ID378 = @adaptor.create_with_payload( __ID378__ )
        @adaptor.add_child( root_0, tree_for_ID378 )

        # at line 820:6: ( '.' ID )*
        while true # decision 136
          alt_136 = 2
          look_136_0 = @input.peek( 1 )

          if ( look_136_0 == T__64 )
            alt_136 = 1

          end
          case alt_136
          when 1
            # at line 820:7: '.' ID
            char_literal379 = match( T__64, TOKENS_FOLLOWING_T__64_IN_path_2301 )

            tree_for_char_literal379 = @adaptor.create_with_payload( char_literal379 )
            @adaptor.add_child( root_0, tree_for_char_literal379 )

            __ID380__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_2302 )

            tree_for_ID380 = @adaptor.create_with_payload( __ID380__ )
            @adaptor.add_child( root_0, tree_for_ID380 )


          else
            break # out of loop for decision 136
          end
        end # loop for decision 136
        # - - - - - - - rule clean up - - - - - - - -
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
    # 823:1: path_with_index : id_ref ( '.' id_ref )* ;
    # 
    def path_with_index
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 49 )
      return_value = PathWithIndexReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal382 = nil
      id_ref381 = nil
      id_ref383 = nil

      tree_for_char_literal382 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 824:4: id_ref ( '.' id_ref )*
        @state.following.push( TOKENS_FOLLOWING_id_ref_IN_path_with_index_2315 )
        id_ref381 = id_ref
        @state.following.pop
        @adaptor.add_child( root_0, id_ref381.tree )
        # at line 824:10: ( '.' id_ref )*
        while true # decision 137
          alt_137 = 2
          look_137_0 = @input.peek( 1 )

          if ( look_137_0 == T__64 )
            alt_137 = 1

          end
          case alt_137
          when 1
            # at line 824:11: '.' id_ref
            char_literal382 = match( T__64, TOKENS_FOLLOWING_T__64_IN_path_with_index_2317 )

            tree_for_char_literal382 = @adaptor.create_with_payload( char_literal382 )
            @adaptor.add_child( root_0, tree_for_char_literal382 )

            @state.following.push( TOKENS_FOLLOWING_id_ref_IN_path_with_index_2318 )
            id_ref383 = id_ref
            @state.following.pop
            @adaptor.add_child( root_0, id_ref383.tree )

          else
            break # out of loop for decision 137
          end
        end # loop for decision 137
        # - - - - - - - rule clean up - - - - - - - -
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
    # 827:1: id_ref : ID ( '[' NUMBER ']' )? ;
    # 
    def id_ref
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 50 )
      return_value = IdRefReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID384__ = nil
      char_literal385 = nil
      __NUMBER386__ = nil
      char_literal387 = nil

      tree_for_ID384 = nil
      tree_for_char_literal385 = nil
      tree_for_NUMBER386 = nil
      tree_for_char_literal387 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 828:4: ID ( '[' NUMBER ']' )?
        __ID384__ = match( ID, TOKENS_FOLLOWING_ID_IN_id_ref_2331 )

        tree_for_ID384 = @adaptor.create_with_payload( __ID384__ )
        @adaptor.add_child( root_0, tree_for_ID384 )

        # at line 828:6: ( '[' NUMBER ']' )?
        alt_138 = 2
        look_138_0 = @input.peek( 1 )

        if ( look_138_0 == T__26 )
          alt_138 = 1
        end
        case alt_138
        when 1
          # at line 828:7: '[' NUMBER ']'
          char_literal385 = match( T__26, TOKENS_FOLLOWING_T__26_IN_id_ref_2333 )

          tree_for_char_literal385 = @adaptor.create_with_payload( char_literal385 )
          @adaptor.add_child( root_0, tree_for_char_literal385 )

          __NUMBER386__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_id_ref_2335 )

          tree_for_NUMBER386 = @adaptor.create_with_payload( __NUMBER386__ )
          @adaptor.add_child( root_0, tree_for_NUMBER386 )

          char_literal387 = match( T__27, TOKENS_FOLLOWING_T__27_IN_id_ref_2337 )

          tree_for_char_literal387 = @adaptor.create_with_payload( char_literal387 )
          @adaptor.add_child( root_0, tree_for_char_literal387 )


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
    # 831:1: reference returns [val] : path_with_index ;
    # 
    def reference
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 51 )
      return_value = ReferenceReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      path_with_index388 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 832:4: path_with_index
        @state.following.push( TOKENS_FOLLOWING_path_with_index_IN_reference_2354 )
        path_with_index388 = path_with_index
        @state.following.pop
        @adaptor.add_child( root_0, path_with_index388.tree )
        # --> action
        	return_value.val = self.to_ref(( path_with_index388 && @input.to_s( path_with_index388.start, path_with_index388.stop ) ))	
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
    # 836:1: reference_type returns [val] : 'isref' path ;
    # 
    def reference_type
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 52 )
      return_value = ReferenceTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal389 = nil
      path390 = nil

      tree_for_string_literal389 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 837:4: 'isref' path
        string_literal389 = match( T__65, TOKENS_FOLLOWING_T__65_IN_reference_type_2373 )

        tree_for_string_literal389 = @adaptor.create_with_payload( string_literal389 )
        @adaptor.add_child( root_0, tree_for_string_literal389 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_reference_type_2375 )
        path390 = path
        @state.following.pop
        @adaptor.add_child( root_0, path390.tree )
        # --> action

        			return_value.val = { '_context' => 'null',
        				'_isa' => self.to_ref(( path390 && @input.to_s( path390.start, path390.stop ) ))
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

    SetTypeReturnValue = define_return_scope :val

    # 
    # parser rule set_type
    # 
    # (in SFP.g)
    # 845:1: set_type returns [val] : 'isset' path ;
    # 
    def set_type
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 53 )
      return_value = SetTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal391 = nil
      path392 = nil

      tree_for_string_literal391 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 846:4: 'isset' path
        string_literal391 = match( T__66, TOKENS_FOLLOWING_T__66_IN_set_type_2394 )

        tree_for_string_literal391 = @adaptor.create_with_payload( string_literal391 )
        @adaptor.add_child( root_0, tree_for_string_literal391 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_set_type_2396 )
        path392 = path
        @state.following.pop
        @adaptor.add_child( root_0, path392.tree )
        # --> action

        			return_value.val = { '_context' => 'set',
        				'_isa' => self.to_ref(( path392 && @input.to_s( path392.start, path392.stop ) )),
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
        # trace_out( __method__, 53 )

      end
      
      return return_value
    end

    EqualsOpReturnValue = define_return_scope 

    # 
    # parser rule equals_op
    # 
    # (in SFP.g)
    # 855:1: equals_op : ( '=' | 'is' );
    # 
    def equals_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 54 )
      return_value = EqualsOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set393 = nil

      tree_for_set393 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set393 = @input.look
        if @input.peek(1) == T__53 || @input.peek(1) == T__56
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set393 ) )
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

    NotEqualsOpReturnValue = define_return_scope 

    # 
    # parser rule not_equals_op
    # 
    # (in SFP.g)
    # 860:1: not_equals_op : ( '!=' | 'isnt' );
    # 
    def not_equals_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 55 )
      return_value = NotEqualsOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set394 = nil

      tree_for_set394 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set394 = @input.look
        if @input.peek(1) == T__58 || @input.peek(1) == T__67
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set394 ) )
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

    BinaryOpReturnValue = define_return_scope 

    # 
    # parser rule binary_op
    # 
    # (in SFP.g)
    # 865:1: binary_op : ( '+=' | '-=' | '*=' | '/=' );
    # 
    def binary_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 56 )
      return_value = BinaryOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set395 = nil

      tree_for_set395 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set395 = @input.look
        if @input.peek( 1 ).between?( T__68, T__71 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set395 ) )
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

    BinaryCompReturnValue = define_return_scope 

    # 
    # parser rule binary_comp
    # 
    # (in SFP.g)
    # 872:1: binary_comp : ( '>' | '>=' | '<' | '<=' );
    # 
    def binary_comp
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 57 )
      return_value = BinaryCompReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set396 = nil

      tree_for_set396 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set396 = @input.look
        if @input.peek( 1 ).between?( T__72, T__75 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set396 ) )
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



    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA39 < ANTLR3::DFA
      EOT = unpack( 4, -1 )
      EOF = unpack( 4, -1 )
      MIN = unpack( 2, 4, 2, -1 )
      MAX = unpack( 1, 31, 1, 32, 2, -1 )
      ACCEPT = unpack( 2, -1, 1, 1, 1, 2 )
      SPECIAL = unpack( 4, -1 )
      TRANSITION = [
        unpack( 1, 1, 26, -1, 1, 2 ),
        unpack( 1, 1, 1, -1, 1, 3, 14, -1, 1, 3, 6, -1, 2, 3, 1, -1, 1, 
                 2, 1, 3 ),
        unpack(  ),
        unpack(  )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 39
      

      def description
        <<-'__dfa_description__'.strip!
          ()* loopback of 185:3: ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )*
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
        unpack( 1, 1, 22, -1, 1, 2, 18, -1, 1, 3, 1, -1, 3, 4, 2, -1, 1, 
                2, 3, -1, 1, 2 ),
        unpack( 1, 6, 15, -1, 1, 7, 5, -1, 1, 2, 26, -1, 1, 2, 1, -1, 4, 
                 2, 5, -1, 1, 5, 2, -1, 1, 2, 4, -1, 4, 2 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 8 ),
        unpack( 1, 6, 1, -1, 1, 2, 13, -1, 1, 7, 1, 2, 7, -1, 1, 2, 13, 
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
          327:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification )
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
        unpack( 1, 1, 22, -1, 1, 2, 18, -1, 1, 3, 1, -1, 3, 4, 2, -1, 1, 
                2, 3, -1, 1, 2 ),
        unpack( 1, 6, 15, -1, 1, 7, 5, -1, 1, 2, 26, -1, 1, 2, 1, -1, 4, 
                 2, 5, -1, 1, 5, 2, -1, 1, 2, 4, -1, 4, 2 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 8 ),
        unpack( 1, 6, 1, -1, 1, 2, 13, -1, 1, 7, 1, 2, 7, -1, 1, 2, 18, 
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
          432:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification )
        __dfa_description__
      end
    end
    class DFA120 < ANTLR3::DFA
      EOT = unpack( 25, -1 )
      EOF = unpack( 25, -1 )
      MIN = unpack( 1, 6, 1, 4, 3, -1, 1, 7, 1, 6, 1, -1, 3, 5, 1, -1, 1, 
                    5, 2, -1, 1, 27, 1, 4, 4, -1, 1, 4, 1, 7, 1, 27, 1, 
                    4 )
      MAX = unpack( 1, 59, 1, 75, 3, -1, 1, 7, 1, 6, 1, -1, 2, 57, 1, 37, 
                    1, -1, 1, 37, 2, -1, 1, 27, 1, 75, 4, -1, 1, 75, 1, 
                    7, 1, 27, 1, 75 )
      ACCEPT = unpack( 2, -1, 1, 2, 1, 7, 1, 11, 2, -1, 1, 1, 3, -1, 1, 
                       8, 1, -1, 1, 9, 1, 10, 2, -1, 1, 3, 1, 4, 1, 5, 1, 
                       6, 4, -1 )
      SPECIAL = unpack( 25, -1 )
      TRANSITION = [
        unpack( 1, 1, 22, -1, 1, 3, 25, -1, 1, 2, 3, -1, 1, 4 ),
        unpack( 1, 7, 21, -1, 1, 5, 3, -1, 1, 7, 22, -1, 1, 10, 1, -1, 
                 1, 13, 1, 8, 1, 11, 1, 9, 5, -1, 1, 6, 2, -1, 1, 12, 4, 
                 -1, 4, 14 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 15 ),
        unpack( 1, 16 ),
        unpack(  ),
        unpack( 3, 17, 1, 18, 2, 17, 26, -1, 1, 17, 19, -1, 1, 11 ),
        unpack( 3, 19, 1, 20, 2, 19, 26, -1, 1, 19, 19, -1, 1, 13 ),
        unpack( 3, 17, 1, 18, 2, 17, 26, -1, 1, 17 ),
        unpack(  ),
        unpack( 3, 19, 1, 20, 2, 19, 26, -1, 1, 19 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 21 ),
        unpack( 1, 7, 21, -1, 1, 22, 3, -1, 1, 7, 22, -1, 1, 10, 1, -1, 
                 1, 13, 1, 8, 1, 11, 1, 9, 5, -1, 1, 6, 2, -1, 1, 12, 4, 
                 -1, 4, 14 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 7, 25, -1, 1, 7, 22, -1, 1, 10, 1, -1, 1, 13, 1, 8, 
                 1, 11, 1, 9, 5, -1, 1, 6, 2, -1, 1, 12, 4, -1, 4, 14 ),
        unpack( 1, 23 ),
        unpack( 1, 24 ),
        unpack( 1, 7, 25, -1, 1, 7, 22, -1, 1, 10, 1, -1, 1, 13, 1, 8, 
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
          544:1: constraint_statement returns [key, val] : ( reference | 'not' reference | reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | conditional_constraint | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | reference binary_comp comp_value | total_constraint );
        __dfa_description__
      end
    end
    class DFA131 < ANTLR3::DFA
      EOT = unpack( 19, -1 )
      EOF = unpack( 19, -1 )
      MIN = unpack( 1, 6, 1, 26, 1, -1, 1, 7, 1, 6, 1, 5, 1, -1, 1, 5, 2, 
                    -1, 1, 27, 1, 26, 3, -1, 1, 53, 1, 7, 1, 27, 1, 53 )
      MAX = unpack( 1, 61, 1, 71, 1, -1, 1, 7, 1, 6, 1, 60, 1, -1, 1, 37, 
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
        unpack( 3, 13, 1, 14, 2, 13, 26, -1, 1, 13, 22, -1, 1, 12 ),
        unpack(  ),
        unpack( 3, 13, 1, 14, 2, 13, 26, -1, 1, 13 ),
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
      
      @decision = 131
      

      def description
        <<-'__dfa_description__'.strip!
          692:1: mutation_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' );
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa39 = DFA39.new( self, 39 )
      @dfa72 = DFA72.new( self, 72 )
      @dfa100 = DFA100.new( self, 100 )
      @dfa120 = DFA120.new( self, 120 )
      @dfa131 = DFA131.new( self, 131 )

    end
    TOKENS_FOLLOWING_NL_IN_sfp_49 = Set[ 1, 4, 6, 18, 22, 23, 36, 41 ]
    TOKENS_FOLLOWING_include_IN_sfp_52 = Set[ 1, 6, 18, 22, 23, 36, 41 ]
    TOKENS_FOLLOWING_header_IN_sfp_55 = Set[ 1, 6, 22, 23, 36, 41 ]
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
    TOKENS_FOLLOWING_T__20_IN_class_definition_250 = Set[ 4, 6, 21, 23, 36 ]
    TOKENS_FOLLOWING_NL_IN_class_definition_252 = Set[ 4, 6, 21, 23, 36 ]
    TOKENS_FOLLOWING_attribute_IN_class_definition_257 = Set[ 6, 21, 23, 36 ]
    TOKENS_FOLLOWING_procedure_IN_class_definition_261 = Set[ 6, 21, 23, 36 ]
    TOKENS_FOLLOWING_T__21_IN_class_definition_266 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_class_definition_270 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__24_IN_extends_class_291 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_extends_class_293 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_attribute_308 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_attribute_310 = Set[ 5, 6, 7, 9, 10, 37 ]
    TOKENS_FOLLOWING_value_IN_attribute_312 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_314 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_attribute_324 = Set[ 65 ]
    TOKENS_FOLLOWING_reference_type_IN_attribute_326 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_328 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_attribute_338 = Set[ 66 ]
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
    TOKENS_FOLLOWING_T__20_IN_object_body_416 = Set[ 4, 6, 21, 28, 29, 32 ]
    TOKENS_FOLLOWING_NL_IN_object_body_418 = Set[ 4, 6, 21, 28, 29, 32 ]
    TOKENS_FOLLOWING_object_attribute_IN_object_body_423 = Set[ 6, 21, 28, 29, 32 ]
    TOKENS_FOLLOWING_state_dependency_IN_object_body_427 = Set[ 6, 21, 28, 29, 32 ]
    TOKENS_FOLLOWING_operator_IN_object_body_431 = Set[ 6, 21, 28, 29, 32 ]
    TOKENS_FOLLOWING_T__21_IN_object_body_436 = Set[ 1 ]
    TOKENS_FOLLOWING_T__28_IN_object_attribute_448 = Set[ 6 ]
    TOKENS_FOLLOWING_attribute_IN_object_attribute_455 = Set[ 1 ]
    TOKENS_FOLLOWING_T__28_IN_object_attribute_461 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_object_attribute_468 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_object_attribute_470 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_object_attribute_472 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_object_attribute_474 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__29_IN_state_dependency_490 = Set[ 6 ]
    TOKENS_FOLLOWING_dep_effect_IN_state_dependency_494 = Set[ 4, 30 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_496 = Set[ 4, 30 ]
    TOKENS_FOLLOWING_T__30_IN_state_dependency_499 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_501 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_dependency_504 = Set[ 4, 6, 21, 29, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_508 = Set[ 4, 6, 21, 29, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_state_dependency_511 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_dependency_516 = Set[ 4, 31 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_522 = Set[ 4, 31 ]
    TOKENS_FOLLOWING_T__31_IN_state_dependency_525 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_527 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_dependency_530 = Set[ 4, 6, 21, 29, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_534 = Set[ 4, 6, 21, 29, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_state_dependency_537 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_dependency_541 = Set[ 4, 31 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_547 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_reference_IN_dep_effect_559 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_dep_effect_561 = Set[ 5, 6, 7, 8, 9, 10, 37 ]
    TOKENS_FOLLOWING_value_IN_dep_effect_568 = Set[ 1 ]
    TOKENS_FOLLOWING_NULL_IN_dep_effect_574 = Set[ 1 ]
    TOKENS_FOLLOWING_T__32_IN_operator_590 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_operator_592 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_operator_594 = Set[ 4, 33, 34, 35 ]
    TOKENS_FOLLOWING_NL_IN_operator_596 = Set[ 4, 33, 34, 35 ]
    TOKENS_FOLLOWING_T__33_IN_operator_607 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_operator_609 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_operator_611 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_operator_613 = Set[ 4, 33, 34, 35 ]
    TOKENS_FOLLOWING_op_conditions_IN_operator_632 = Set[ 4, 33, 34, 35 ]
    TOKENS_FOLLOWING_op_effects_IN_operator_635 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_operator_639 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_operator_641 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_op_param_657 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_op_param_659 = Set[ 6 ]
    TOKENS_FOLLOWING_reference_IN_op_param_661 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_param_663 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__34_IN_op_conditions_679 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_op_conditions_681 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_NL_IN_op_conditions_683 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_op_statement_IN_op_conditions_692 = Set[ 6, 21 ]
    TOKENS_FOLLOWING_T__21_IN_op_conditions_697 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_conditions_699 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__35_IN_op_effects_715 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_op_effects_717 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_NL_IN_op_effects_719 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_op_statement_IN_op_effects_728 = Set[ 6, 21 ]
    TOKENS_FOLLOWING_T__21_IN_op_effects_733 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_effects_735 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_reference_IN_op_statement_751 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_op_statement_753 = Set[ 5, 6, 7, 9, 10, 37 ]
    TOKENS_FOLLOWING_value_IN_op_statement_755 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_statement_757 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__36_IN_procedure_773 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_procedure_775 = Set[ 20, 37 ]
    TOKENS_FOLLOWING_parameters_IN_procedure_783 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_procedure_786 = Set[ 4, 33, 34, 35 ]
    TOKENS_FOLLOWING_NL_IN_procedure_788 = Set[ 4, 33, 34, 35 ]
    TOKENS_FOLLOWING_T__33_IN_procedure_796 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_procedure_798 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_procedure_800 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_procedure_810 = Set[ 4, 33, 34, 35 ]
    TOKENS_FOLLOWING_conditions_IN_procedure_820 = Set[ 4, 33, 34, 35 ]
    TOKENS_FOLLOWING_effects_IN_procedure_823 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_procedure_825 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_procedure_827 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__37_IN_parameters_843 = Set[ 6 ]
    TOKENS_FOLLOWING_parameter_IN_parameters_845 = Set[ 38, 39 ]
    TOKENS_FOLLOWING_T__38_IN_parameters_848 = Set[ 6 ]
    TOKENS_FOLLOWING_parameter_IN_parameters_850 = Set[ 38, 39 ]
    TOKENS_FOLLOWING_T__39_IN_parameters_854 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_866 = Set[ 65 ]
    TOKENS_FOLLOWING_reference_type_IN_parameter_868 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_877 = Set[ 40 ]
    TOKENS_FOLLOWING_T__40_IN_parameter_879 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_parameter_881 = Set[ 1 ]
    TOKENS_FOLLOWING_T__34_IN_conditions_896 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_conditions_904 = Set[ 4, 6, 21, 29, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_conditions_906 = Set[ 4, 6, 21, 29, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_conditions_909 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_conditions_911 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_conditions_913 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__35_IN_effects_930 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_effects_938 = Set[ 4, 6, 21, 48, 61 ]
    TOKENS_FOLLOWING_NL_IN_effects_940 = Set[ 4, 6, 21, 48, 61 ]
    TOKENS_FOLLOWING_mutation_body_IN_effects_946 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_effects_951 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_effects_953 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__41_IN_goal_constraint_969 = Set[ 4, 20, 42 ]
    TOKENS_FOLLOWING_T__42_IN_goal_constraint_971 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_constraint_974 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_constraint_983 = Set[ 4, 6, 21, 29, 43, 44, 45, 46, 47, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_constraint_985 = Set[ 4, 6, 21, 29, 43, 44, 45, 46, 47, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_goal_body_IN_goal_constraint_988 = Set[ 6, 21, 29, 43, 44, 45, 46, 47, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_T__21_IN_goal_constraint_991 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_constraint_993 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_constraint_statement_IN_goal_body_1016 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_namespace_IN_goal_body_1029 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_iterator_IN_goal_body_1036 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_class_quantification_IN_goal_body_1043 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1052 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__43_IN_goal_body_1059 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1061 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1070 = Set[ 4, 6, 21, 29, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1072 = Set[ 4, 6, 21, 29, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1075 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1077 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1079 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__44_IN_goal_body_1089 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1091 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1100 = Set[ 4, 6, 21, 29, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1102 = Set[ 4, 6, 21, 29, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1105 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1107 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1109 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__45_IN_goal_body_1123 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_goal_body_1125 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1127 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1136 = Set[ 4, 6, 21, 29, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1138 = Set[ 4, 6, 21, 29, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1141 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1143 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1145 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__46_IN_goal_body_1155 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1157 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1166 = Set[ 4, 6, 21, 29, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1168 = Set[ 4, 6, 21, 29, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1171 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1173 = Set[ 4, 30, 45 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1175 = Set[ 4, 30, 45 ]
    TOKENS_FOLLOWING_T__30_IN_goal_body_1186 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__45_IN_goal_body_1193 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_goal_body_1195 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1207 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1216 = Set[ 4, 6, 21, 29, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1218 = Set[ 4, 6, 21, 29, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1221 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1223 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1225 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__47_IN_goal_body_1243 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1245 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1254 = Set[ 4, 6, 21, 29, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1256 = Set[ 4, 6, 21, 29, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1259 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1261 = Set[ 4, 30 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1263 = Set[ 4, 30 ]
    TOKENS_FOLLOWING_T__30_IN_goal_body_1272 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1274 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1283 = Set[ 4, 6, 21, 29, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1285 = Set[ 4, 6, 21, 29, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1288 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1290 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1292 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__20_IN_nested_constraint_1312 = Set[ 4, 6, 21, 29, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_nested_constraint_1314 = Set[ 4, 6, 21, 29, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_nested_constraint_1317 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_nested_constraint_1319 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_constraint_1330 = Set[ 42 ]
    TOKENS_FOLLOWING_T__42_IN_constraint_1332 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_1340 = Set[ 4, 6, 21, 29, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_constraint_1342 = Set[ 4, 6, 21, 29, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_constraint_body_IN_constraint_1345 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_1347 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_1349 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_1372 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_namespace_IN_constraint_body_1385 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_iterator_IN_constraint_body_1392 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_class_quantification_IN_constraint_body_1399 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_body_1408 = Set[ 1, 4, 6, 29, 48, 50, 51, 52, 55, 59 ]
    TOKENS_FOLLOWING_path_IN_constraint_namespace_1422 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1424 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_namespace_1427 = Set[ 4, 6, 21, 29, 55, 59 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1429 = Set[ 4, 6, 21, 29, 55, 59 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_namespace_1433 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1441 = Set[ 4, 6, 21, 29, 55, 59 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_namespace_1446 = Set[ 1 ]
    TOKENS_FOLLOWING_T__48_IN_constraint_iterator_1457 = Set[ 37 ]
    TOKENS_FOLLOWING_T__37_IN_constraint_iterator_1459 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_constraint_iterator_1461 = Set[ 49 ]
    TOKENS_FOLLOWING_T__49_IN_constraint_iterator_1463 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_constraint_iterator_1465 = Set[ 39 ]
    TOKENS_FOLLOWING_T__39_IN_constraint_iterator_1467 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1469 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_iterator_1472 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1474 = Set[ 4, 6, 21, 29, 55, 59 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_iterator_1484 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1492 = Set[ 4, 6, 21, 29, 55, 59 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_iterator_1499 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_quantification_keyword_0 = Set[ 1 ]
    TOKENS_FOLLOWING_quantification_keyword_IN_constraint_class_quantification_1535 = Set[ 37 ]
    TOKENS_FOLLOWING_T__37_IN_constraint_class_quantification_1537 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_constraint_class_quantification_1539 = Set[ 49 ]
    TOKENS_FOLLOWING_T__49_IN_constraint_class_quantification_1541 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_constraint_class_quantification_1543 = Set[ 39 ]
    TOKENS_FOLLOWING_T__39_IN_constraint_class_quantification_1545 = Set[ 4, 20, 53, 72, 73, 74, 75 ]
    TOKENS_FOLLOWING_binary_comp_IN_constraint_class_quantification_1557 = Set[ 7 ]
    TOKENS_FOLLOWING_T__53_IN_constraint_class_quantification_1570 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_constraint_class_quantification_1586 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1600 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_class_quantification_1603 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1605 = Set[ 4, 6, 21, 29, 48, 54, 55, 59 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_class_quantification_1612 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1622 = Set[ 4, 6, 21, 29, 48, 54, 55, 59 ]
    TOKENS_FOLLOWING_constraint_different_IN_constraint_class_quantification_1629 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1631 = Set[ 4, 6, 21, 29, 48, 54, 55, 59 ]
    TOKENS_FOLLOWING_constraint_iterator_IN_constraint_class_quantification_1638 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1640 = Set[ 4, 6, 21, 29, 48, 54, 55, 59 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_class_quantification_1648 = Set[ 1 ]
    TOKENS_FOLLOWING_T__54_IN_constraint_different_1667 = Set[ 37 ]
    TOKENS_FOLLOWING_T__37_IN_constraint_different_1669 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_constraint_different_1671 = Set[ 39 ]
    TOKENS_FOLLOWING_T__39_IN_constraint_different_1673 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1692 = Set[ 1 ]
    TOKENS_FOLLOWING_T__55_IN_constraint_statement_1701 = Set[ 6 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1703 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1712 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1714 = Set[ 5, 6, 7, 9, 10, 37 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_1716 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1725 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1727 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_1729 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1738 = Set[ 58, 67 ]
    TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1740 = Set[ 5, 6, 7, 9, 10, 37 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_1742 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1751 = Set[ 58, 67 ]
    TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1753 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_1755 = Set[ 1 ]
    TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_1764 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1773 = Set[ 56, 57 ]
    TOKENS_FOLLOWING_T__56_IN_constraint_statement_1775 = Set[ 57 ]
    TOKENS_FOLLOWING_T__57_IN_constraint_statement_1778 = Set[ 5, 6, 7, 9, 10, 37 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_1780 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1789 = Set[ 55, 58 ]
    TOKENS_FOLLOWING_set_IN_constraint_statement_1791 = Set[ 57 ]
    TOKENS_FOLLOWING_T__57_IN_constraint_statement_1797 = Set[ 5, 6, 7, 9, 10, 37 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_1799 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1808 = Set[ 72, 73, 74, 75 ]
    TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_1810 = Set[ 6, 7 ]
    TOKENS_FOLLOWING_comp_value_IN_constraint_statement_1812 = Set[ 1 ]
    TOKENS_FOLLOWING_total_constraint_IN_constraint_statement_1821 = Set[ 1 ]
    TOKENS_FOLLOWING_T__59_IN_total_constraint_1832 = Set[ 6 ]
    TOKENS_FOLLOWING_total_statement_IN_total_constraint_1834 = Set[ 39 ]
    TOKENS_FOLLOWING_T__39_IN_total_constraint_1836 = Set[ 72, 73, 74, 75 ]
    TOKENS_FOLLOWING_binary_comp_IN_total_constraint_1838 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_total_constraint_1840 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_total_statement_1851 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_total_statement_1853 = Set[ 5, 6, 7, 9, 10, 37 ]
    TOKENS_FOLLOWING_value_IN_total_statement_1855 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_comp_value_1870 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_comp_value_1879 = Set[ 1 ]
    TOKENS_FOLLOWING_T__29_IN_conditional_constraint_1898 = Set[ 6, 29, 55, 59 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_1906 = Set[ 4, 30 ]
    TOKENS_FOLLOWING_NL_IN_conditional_constraint_1908 = Set[ 4, 30 ]
    TOKENS_FOLLOWING_conditional_constraint_then_IN_conditional_constraint_1917 = Set[ 1 ]
    TOKENS_FOLLOWING_T__30_IN_conditional_constraint_then_1932 = Set[ 6, 29, 55, 59 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_1934 = Set[ 1 ]
    TOKENS_FOLLOWING_mutation_statement_IN_mutation_body_1956 = Set[ 4 ]
    TOKENS_FOLLOWING_mutation_iterator_IN_mutation_body_1969 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_body_1978 = Set[ 1, 4, 6, 48, 61 ]
    TOKENS_FOLLOWING_T__48_IN_mutation_iterator_1993 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_iterator_1995 = Set[ 49 ]
    TOKENS_FOLLOWING_T__49_IN_mutation_iterator_1997 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_mutation_iterator_1999 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_2001 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_mutation_iterator_2004 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_2006 = Set[ 4, 6, 21, 61 ]
    TOKENS_FOLLOWING_mutation_statement_IN_mutation_iterator_2016 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_2024 = Set[ 4, 6, 21, 61 ]
    TOKENS_FOLLOWING_T__21_IN_mutation_iterator_2031 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2050 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_mutation_statement_2052 = Set[ 5, 6, 7, 9, 10, 37 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_2054 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2063 = Set[ 53, 56 ]
    TOKENS_FOLLOWING_equals_op_IN_mutation_statement_2065 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_mutation_statement_2067 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2076 = Set[ 68, 69, 70, 71 ]
    TOKENS_FOLLOWING_binary_op_IN_mutation_statement_2078 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_mutation_statement_2080 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2089 = Set[ 56 ]
    TOKENS_FOLLOWING_T__56_IN_mutation_statement_2091 = Set[ 60 ]
    TOKENS_FOLLOWING_T__60_IN_mutation_statement_2093 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_statement_2095 = Set[ 1, 20 ]
    TOKENS_FOLLOWING_object_body_IN_mutation_statement_2103 = Set[ 1 ]
    TOKENS_FOLLOWING_T__61_IN_mutation_statement_2113 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_statement_2115 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2124 = Set[ 62 ]
    TOKENS_FOLLOWING_T__62_IN_mutation_statement_2126 = Set[ 5, 6, 7, 9, 10, 37 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_2128 = Set[ 39 ]
    TOKENS_FOLLOWING_T__39_IN_mutation_statement_2130 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2139 = Set[ 63 ]
    TOKENS_FOLLOWING_T__63_IN_mutation_statement_2141 = Set[ 5, 6, 7, 9, 10, 37 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_2143 = Set[ 39 ]
    TOKENS_FOLLOWING_T__39_IN_mutation_statement_2145 = Set[ 1 ]
    TOKENS_FOLLOWING_T__37_IN_set_value_2164 = Set[ 5, 6, 7, 9, 10, 37, 39 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_2173 = Set[ 38, 39 ]
    TOKENS_FOLLOWING_T__38_IN_set_value_2176 = Set[ 5, 6, 7, 9, 10, 37 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_2178 = Set[ 38, 39 ]
    TOKENS_FOLLOWING_T__39_IN_set_value_2190 = Set[ 1 ]
    TOKENS_FOLLOWING_value_IN_set_item_2201 = Set[ 1 ]
    TOKENS_FOLLOWING_primitive_value_IN_value_2220 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_value_2229 = Set[ 1 ]
    TOKENS_FOLLOWING_set_value_IN_value_2238 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_2257 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_primitive_value_2266 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_primitive_value_2275 = Set[ 1 ]
    TOKENS_FOLLOWING_MULTILINE_STRING_IN_primitive_value_2284 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_path_2299 = Set[ 1, 64 ]
    TOKENS_FOLLOWING_T__64_IN_path_2301 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_path_2302 = Set[ 1, 64 ]
    TOKENS_FOLLOWING_id_ref_IN_path_with_index_2315 = Set[ 1, 64 ]
    TOKENS_FOLLOWING_T__64_IN_path_with_index_2317 = Set[ 6 ]
    TOKENS_FOLLOWING_id_ref_IN_path_with_index_2318 = Set[ 1, 64 ]
    TOKENS_FOLLOWING_ID_IN_id_ref_2331 = Set[ 1, 26 ]
    TOKENS_FOLLOWING_T__26_IN_id_ref_2333 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_id_ref_2335 = Set[ 27 ]
    TOKENS_FOLLOWING_T__27_IN_id_ref_2337 = Set[ 1 ]
    TOKENS_FOLLOWING_path_with_index_IN_reference_2354 = Set[ 1 ]
    TOKENS_FOLLOWING_T__65_IN_reference_type_2373 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_reference_type_2375 = Set[ 1 ]
    TOKENS_FOLLOWING_T__66_IN_set_type_2394 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_set_type_2396 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_not_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_comp_0 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end

