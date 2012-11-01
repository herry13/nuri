#!/usr/bin/env ruby
#
# SFP.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: SFP.g
# Generated at: 2012-11-01 23:26:06
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
                    "'('", "','", "')'", "'areall'", "'goal'", "'constraint'", 
                    "'always'", "'sometime'", "'within'", "'after'", "'before'", 
                    "'foreach'", "'as'", "'forall'", "'exist'", "'forsome'", 
                    "'='", "':different'", "'not'", "'is'", "'in'", "'isnt'", 
                    "'total('", "'new'", "'delete'", "'add('", "'remove('", 
                    "'.'", "'isref'", "'isset'", "'!='", "'+='", "'-='", 
                    "'*='", "'/='", "'>'", "'>='", "'<'", "'<='" )
    
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
            elsif ( look_12_2 == NL || look_12_2 == T__20 || look_12_2 == T__25 || look_12_2 == T__52 || look_12_2 == T__55 || look_12_2.between?( T__64, T__65 ) )
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
          when T__52, T__55 then alt_23 = 1
          when T__64 then alt_23 = 2
          when T__65 then alt_23 = 3
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

          if ( look_30_1 == T__52 || look_30_1 == T__55 )
            look_30_2 = @input.peek( 3 )

            if ( look_30_2.between?( STRING, NUMBER ) || look_30_2.between?( BOOLEAN, MULTILINE_STRING ) || look_30_2 == T__36 )
              alt_30 = 1
            elsif ( look_30_2 == NULL )
              alt_30 = 2
            else
              raise NoViableAlternative( "", 30, 2 )
            end
          elsif ( look_30_1 == NL || look_30_1 == T__20 || look_30_1 == T__25 || look_30_1.between?( T__64, T__65 ) )
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
    # 276:1: parameter : ( ID reference_type | ID 'areall' path );
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
      reference_type142 = nil
      path145 = nil

      tree_for_ID141 = nil
      tree_for_ID143 = nil
      tree_for_string_literal144 = nil

      begin
        # at line 277:2: ( ID reference_type | ID 'areall' path )
        alt_60 = 2
        look_60_0 = @input.peek( 1 )

        if ( look_60_0 == ID )
          look_60_1 = @input.peek( 2 )

          if ( look_60_1 == T__39 )
            alt_60 = 2
          elsif ( look_60_1 == T__64 )
            alt_60 = 1
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
      string_literal146 = nil
      char_literal147 = nil
      __NL148__ = nil
      char_literal150 = nil
      __NL151__ = nil
      constraint_body149 = nil

      tree_for_string_literal146 = nil
      tree_for_char_literal147 = nil
      tree_for_NL148 = nil
      tree_for_char_literal150 = nil
      tree_for_NL151 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 289:4: 'condition' '{' ( NL )* constraint_body '}' ( NL )+
        string_literal146 = match( T__33, TOKENS_FOLLOWING_T__33_IN_conditions_880 )

        tree_for_string_literal146 = @adaptor.create_with_payload( string_literal146 )
        @adaptor.add_child( root_0, tree_for_string_literal146 )

        # --> action

        			@now['_condition']['_parent'] = @now
        			@now = @now['_condition']
        		
        # <-- action
        char_literal147 = match( T__20, TOKENS_FOLLOWING_T__20_IN_conditions_888 )

        tree_for_char_literal147 = @adaptor.create_with_payload( char_literal147 )
        @adaptor.add_child( root_0, tree_for_char_literal147 )

        # at line 294:7: ( NL )*
        while true # decision 61
          alt_61 = 2
          look_61_0 = @input.peek( 1 )

          if ( look_61_0 == NL )
            alt_61 = 1

          end
          case alt_61
          when 1
            # at line 294:7: NL
            __NL148__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditions_890 )

            tree_for_NL148 = @adaptor.create_with_payload( __NL148__ )
            @adaptor.add_child( root_0, tree_for_NL148 )


          else
            break # out of loop for decision 61
          end
        end # loop for decision 61
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_conditions_893 )
        constraint_body149 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body149.tree )
        char_literal150 = match( T__21, TOKENS_FOLLOWING_T__21_IN_conditions_895 )

        tree_for_char_literal150 = @adaptor.create_with_payload( char_literal150 )
        @adaptor.add_child( root_0, tree_for_char_literal150 )

        # at file 294:31: ( NL )+
        match_count_62 = 0
        while true
          alt_62 = 2
          look_62_0 = @input.peek( 1 )

          if ( look_62_0 == NL )
            alt_62 = 1

          end
          case alt_62
          when 1
            # at line 294:31: NL
            __NL151__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditions_897 )

            tree_for_NL151 = @adaptor.create_with_payload( __NL151__ )
            @adaptor.add_child( root_0, tree_for_NL151 )


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
    # 299:1: effects : 'effect' '{' ( NL )* mutation_body '}' ( NL )+ ;
    # 
    def effects
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = EffectsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal152 = nil
      char_literal153 = nil
      __NL154__ = nil
      char_literal156 = nil
      __NL157__ = nil
      mutation_body155 = nil

      tree_for_string_literal152 = nil
      tree_for_char_literal153 = nil
      tree_for_NL154 = nil
      tree_for_char_literal156 = nil
      tree_for_NL157 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 300:4: 'effect' '{' ( NL )* mutation_body '}' ( NL )+
        string_literal152 = match( T__34, TOKENS_FOLLOWING_T__34_IN_effects_914 )

        tree_for_string_literal152 = @adaptor.create_with_payload( string_literal152 )
        @adaptor.add_child( root_0, tree_for_string_literal152 )

        # --> action

        			@now['_effect']['_parent'] = @now
        			@now = @now['_effect']
        		
        # <-- action
        char_literal153 = match( T__20, TOKENS_FOLLOWING_T__20_IN_effects_922 )

        tree_for_char_literal153 = @adaptor.create_with_payload( char_literal153 )
        @adaptor.add_child( root_0, tree_for_char_literal153 )

        # at line 305:7: ( NL )*
        while true # decision 63
          alt_63 = 2
          look_63_0 = @input.peek( 1 )

          if ( look_63_0 == NL )
            alt_63 = 1

          end
          case alt_63
          when 1
            # at line 305:7: NL
            __NL154__ = match( NL, TOKENS_FOLLOWING_NL_IN_effects_924 )

            tree_for_NL154 = @adaptor.create_with_payload( __NL154__ )
            @adaptor.add_child( root_0, tree_for_NL154 )


          else
            break # out of loop for decision 63
          end
        end # loop for decision 63
        @state.following.push( TOKENS_FOLLOWING_mutation_body_IN_effects_930 )
        mutation_body155 = mutation_body
        @state.following.pop
        @adaptor.add_child( root_0, mutation_body155.tree )
        char_literal156 = match( T__21, TOKENS_FOLLOWING_T__21_IN_effects_935 )

        tree_for_char_literal156 = @adaptor.create_with_payload( char_literal156 )
        @adaptor.add_child( root_0, tree_for_char_literal156 )

        # at file 307:7: ( NL )+
        match_count_64 = 0
        while true
          alt_64 = 2
          look_64_0 = @input.peek( 1 )

          if ( look_64_0 == NL )
            alt_64 = 1

          end
          case alt_64
          when 1
            # at line 307:7: NL
            __NL157__ = match( NL, TOKENS_FOLLOWING_NL_IN_effects_937 )

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
      string_literal158 = nil
      string_literal159 = nil
      __NL160__ = nil
      char_literal161 = nil
      __NL162__ = nil
      char_literal164 = nil
      __NL165__ = nil
      goal_body163 = nil

      tree_for_string_literal158 = nil
      tree_for_string_literal159 = nil
      tree_for_NL160 = nil
      tree_for_char_literal161 = nil
      tree_for_NL162 = nil
      tree_for_char_literal164 = nil
      tree_for_NL165 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 312:4: 'goal' ( 'constraint' )? ( NL )* '{' ( NL )* ( goal_body )* '}' ( NL )+
        string_literal158 = match( T__40, TOKENS_FOLLOWING_T__40_IN_goal_constraint_953 )

        tree_for_string_literal158 = @adaptor.create_with_payload( string_literal158 )
        @adaptor.add_child( root_0, tree_for_string_literal158 )

        # at line 312:11: ( 'constraint' )?
        alt_65 = 2
        look_65_0 = @input.peek( 1 )

        if ( look_65_0 == T__41 )
          alt_65 = 1
        end
        case alt_65
        when 1
          # at line 312:11: 'constraint'
          string_literal159 = match( T__41, TOKENS_FOLLOWING_T__41_IN_goal_constraint_955 )

          tree_for_string_literal159 = @adaptor.create_with_payload( string_literal159 )
          @adaptor.add_child( root_0, tree_for_string_literal159 )


        end
        # at line 312:25: ( NL )*
        while true # decision 66
          alt_66 = 2
          look_66_0 = @input.peek( 1 )

          if ( look_66_0 == NL )
            alt_66 = 1

          end
          case alt_66
          when 1
            # at line 312:25: NL
            __NL160__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_constraint_958 )

            tree_for_NL160 = @adaptor.create_with_payload( __NL160__ )
            @adaptor.add_child( root_0, tree_for_NL160 )


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
        char_literal161 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_constraint_967 )

        tree_for_char_literal161 = @adaptor.create_with_payload( char_literal161 )
        @adaptor.add_child( root_0, tree_for_char_literal161 )

        # at line 321:7: ( NL )*
        while true # decision 67
          alt_67 = 2
          look_67_0 = @input.peek( 1 )

          if ( look_67_0 == NL )
            alt_67 = 1

          end
          case alt_67
          when 1
            # at line 321:7: NL
            __NL162__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_constraint_969 )

            tree_for_NL162 = @adaptor.create_with_payload( __NL162__ )
            @adaptor.add_child( root_0, tree_for_NL162 )


          else
            break # out of loop for decision 67
          end
        end # loop for decision 67
        # at line 321:11: ( goal_body )*
        while true # decision 68
          alt_68 = 2
          look_68_0 = @input.peek( 1 )

          if ( look_68_0 == ID || look_68_0 == T__28 || look_68_0.between?( T__42, T__47 ) || look_68_0.between?( T__49, T__51 ) || look_68_0 == T__54 || look_68_0 == T__58 )
            alt_68 = 1

          end
          case alt_68
          when 1
            # at line 321:11: goal_body
            @state.following.push( TOKENS_FOLLOWING_goal_body_IN_goal_constraint_972 )
            goal_body163 = goal_body
            @state.following.pop
            @adaptor.add_child( root_0, goal_body163.tree )

          else
            break # out of loop for decision 68
          end
        end # loop for decision 68
        char_literal164 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_constraint_975 )

        tree_for_char_literal164 = @adaptor.create_with_payload( char_literal164 )
        @adaptor.add_child( root_0, tree_for_char_literal164 )

        # at file 321:26: ( NL )+
        match_count_69 = 0
        while true
          alt_69 = 2
          look_69_0 = @input.peek( 1 )

          if ( look_69_0 == NL )
            alt_69 = 1

          end
          case alt_69
          when 1
            # at line 321:26: NL
            __NL165__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_constraint_977 )

            tree_for_NL165 = @adaptor.create_with_payload( __NL165__ )
            @adaptor.add_child( root_0, tree_for_NL165 )


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
    # 325:1: goal_body : ( ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ ) | 'always' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'sometime' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'within' NUMBER ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'after' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* ( 'then' | 'within' NUMBER ) ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'before' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ );
    # 
    def goal_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = GoalBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL170__ = nil
      string_literal171 = nil
      __NL172__ = nil
      char_literal173 = nil
      __NL174__ = nil
      char_literal176 = nil
      __NL177__ = nil
      string_literal178 = nil
      __NL179__ = nil
      char_literal180 = nil
      __NL181__ = nil
      char_literal183 = nil
      __NL184__ = nil
      string_literal185 = nil
      __NUMBER186__ = nil
      __NL187__ = nil
      char_literal188 = nil
      __NL189__ = nil
      char_literal191 = nil
      __NL192__ = nil
      string_literal193 = nil
      __NL194__ = nil
      char_literal195 = nil
      __NL196__ = nil
      char_literal198 = nil
      __NL199__ = nil
      string_literal200 = nil
      string_literal201 = nil
      __NUMBER202__ = nil
      __NL203__ = nil
      char_literal204 = nil
      __NL205__ = nil
      char_literal207 = nil
      __NL208__ = nil
      string_literal209 = nil
      __NL210__ = nil
      char_literal211 = nil
      __NL212__ = nil
      char_literal214 = nil
      __NL215__ = nil
      string_literal216 = nil
      __NL217__ = nil
      char_literal218 = nil
      __NL219__ = nil
      char_literal221 = nil
      __NL222__ = nil
      constraint_statement166 = nil
      constraint_namespace167 = nil
      constraint_iterator168 = nil
      constraint_class_quantification169 = nil
      constraint_body175 = nil
      constraint_body182 = nil
      constraint_body190 = nil
      constraint_body197 = nil
      constraint_body206 = nil
      constraint_body213 = nil
      constraint_body220 = nil

      tree_for_NL170 = nil
      tree_for_string_literal171 = nil
      tree_for_NL172 = nil
      tree_for_char_literal173 = nil
      tree_for_NL174 = nil
      tree_for_char_literal176 = nil
      tree_for_NL177 = nil
      tree_for_string_literal178 = nil
      tree_for_NL179 = nil
      tree_for_char_literal180 = nil
      tree_for_NL181 = nil
      tree_for_char_literal183 = nil
      tree_for_NL184 = nil
      tree_for_string_literal185 = nil
      tree_for_NUMBER186 = nil
      tree_for_NL187 = nil
      tree_for_char_literal188 = nil
      tree_for_NL189 = nil
      tree_for_char_literal191 = nil
      tree_for_NL192 = nil
      tree_for_string_literal193 = nil
      tree_for_NL194 = nil
      tree_for_char_literal195 = nil
      tree_for_NL196 = nil
      tree_for_char_literal198 = nil
      tree_for_NL199 = nil
      tree_for_string_literal200 = nil
      tree_for_string_literal201 = nil
      tree_for_NUMBER202 = nil
      tree_for_NL203 = nil
      tree_for_char_literal204 = nil
      tree_for_NL205 = nil
      tree_for_char_literal207 = nil
      tree_for_NL208 = nil
      tree_for_string_literal209 = nil
      tree_for_NL210 = nil
      tree_for_char_literal211 = nil
      tree_for_NL212 = nil
      tree_for_char_literal214 = nil
      tree_for_NL215 = nil
      tree_for_string_literal216 = nil
      tree_for_NL217 = nil
      tree_for_char_literal218 = nil
      tree_for_NL219 = nil
      tree_for_char_literal221 = nil
      tree_for_NL222 = nil

      begin
        # at line 326:2: ( ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ ) | 'always' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'sometime' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'within' NUMBER ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'after' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* ( 'then' | 'within' NUMBER ) ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | 'before' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ )
        alt_94 = 6
        case look_94 = @input.peek( 1 )
        when ID, T__28, T__47, T__49, T__50, T__51, T__54, T__58 then alt_94 = 1
        when T__42 then alt_94 = 2
        when T__43 then alt_94 = 3
        when T__44 then alt_94 = 4
        when T__45 then alt_94 = 5
        when T__46 then alt_94 = 6
        else
          raise NoViableAlternative( "", 94, 0 )
        end
        case alt_94
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 326:4: ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )
          # at line 326:4: ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )
          # at line 327:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+
          # at line 327:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification )
          alt_70 = 4
          alt_70 = @dfa70.predict( @input )
          case alt_70
          when 1
            # at line 327:6: constraint_statement
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_goal_body_1000 )
            constraint_statement166 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement166.tree )
            # --> action

            					@now[( constraint_statement166.nil? ? nil : constraint_statement166.key )] = ( constraint_statement166.nil? ? nil : constraint_statement166.val )
            				
            # <-- action

          when 2
            # at line 331:6: constraint_namespace
            @state.following.push( TOKENS_FOLLOWING_constraint_namespace_IN_goal_body_1013 )
            constraint_namespace167 = constraint_namespace
            @state.following.pop
            @adaptor.add_child( root_0, constraint_namespace167.tree )

          when 3
            # at line 332:6: constraint_iterator
            @state.following.push( TOKENS_FOLLOWING_constraint_iterator_IN_goal_body_1020 )
            constraint_iterator168 = constraint_iterator
            @state.following.pop
            @adaptor.add_child( root_0, constraint_iterator168.tree )

          when 4
            # at line 333:6: constraint_class_quantification
            @state.following.push( TOKENS_FOLLOWING_constraint_class_quantification_IN_goal_body_1027 )
            constraint_class_quantification169 = constraint_class_quantification
            @state.following.pop
            @adaptor.add_child( root_0, constraint_class_quantification169.tree )

          end
          # at file 335:3: ( NL )+
          match_count_71 = 0
          while true
            alt_71 = 2
            look_71_0 = @input.peek( 1 )

            if ( look_71_0 == NL )
              alt_71 = 1

            end
            case alt_71
            when 1
              # at line 335:3: NL
              __NL170__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1036 )

              tree_for_NL170 = @adaptor.create_with_payload( __NL170__ )
              @adaptor.add_child( root_0, tree_for_NL170 )


            else
              match_count_71 > 0 and break
              eee = EarlyExit(71)


              raise eee
            end
            match_count_71 += 1
          end



        when 2
          root_0 = @adaptor.create_flat_list


          # at line 336:4: 'always' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal171 = match( T__42, TOKENS_FOLLOWING_T__42_IN_goal_body_1043 )

          tree_for_string_literal171 = @adaptor.create_with_payload( string_literal171 )
          @adaptor.add_child( root_0, tree_for_string_literal171 )

          # at line 336:13: ( NL )*
          while true # decision 72
            alt_72 = 2
            look_72_0 = @input.peek( 1 )

            if ( look_72_0 == NL )
              alt_72 = 1

            end
            case alt_72
            when 1
              # at line 336:13: NL
              __NL172__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1045 )

              tree_for_NL172 = @adaptor.create_with_payload( __NL172__ )
              @adaptor.add_child( root_0, tree_for_NL172 )


            else
              break # out of loop for decision 72
            end
          end # loop for decision 72
          # --> action

          			@now['always'] = self.create_constraint('always', 'and') if
          				not @now.has_key?('always')
          			@now = @now['always']
          		
          # <-- action
          char_literal173 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1054 )

          tree_for_char_literal173 = @adaptor.create_with_payload( char_literal173 )
          @adaptor.add_child( root_0, tree_for_char_literal173 )

          # at line 342:7: ( NL )*
          while true # decision 73
            alt_73 = 2
            look_73_0 = @input.peek( 1 )

            if ( look_73_0 == NL )
              alt_73 = 1

            end
            case alt_73
            when 1
              # at line 342:7: NL
              __NL174__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1056 )

              tree_for_NL174 = @adaptor.create_with_payload( __NL174__ )
              @adaptor.add_child( root_0, tree_for_NL174 )


            else
              break # out of loop for decision 73
            end
          end # loop for decision 73
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1059 )
          constraint_body175 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body175.tree )
          char_literal176 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1061 )

          tree_for_char_literal176 = @adaptor.create_with_payload( char_literal176 )
          @adaptor.add_child( root_0, tree_for_char_literal176 )

          # at file 342:31: ( NL )+
          match_count_74 = 0
          while true
            alt_74 = 2
            look_74_0 = @input.peek( 1 )

            if ( look_74_0 == NL )
              alt_74 = 1

            end
            case alt_74
            when 1
              # at line 342:31: NL
              __NL177__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1063 )

              tree_for_NL177 = @adaptor.create_with_payload( __NL177__ )
              @adaptor.add_child( root_0, tree_for_NL177 )


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


          # at line 344:4: 'sometime' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal178 = match( T__43, TOKENS_FOLLOWING_T__43_IN_goal_body_1073 )

          tree_for_string_literal178 = @adaptor.create_with_payload( string_literal178 )
          @adaptor.add_child( root_0, tree_for_string_literal178 )

          # at line 344:15: ( NL )*
          while true # decision 75
            alt_75 = 2
            look_75_0 = @input.peek( 1 )

            if ( look_75_0 == NL )
              alt_75 = 1

            end
            case alt_75
            when 1
              # at line 344:15: NL
              __NL179__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1075 )

              tree_for_NL179 = @adaptor.create_with_payload( __NL179__ )
              @adaptor.add_child( root_0, tree_for_NL179 )


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
          char_literal180 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1084 )

          tree_for_char_literal180 = @adaptor.create_with_payload( char_literal180 )
          @adaptor.add_child( root_0, tree_for_char_literal180 )

          # at line 353:7: ( NL )*
          while true # decision 76
            alt_76 = 2
            look_76_0 = @input.peek( 1 )

            if ( look_76_0 == NL )
              alt_76 = 1

            end
            case alt_76
            when 1
              # at line 353:7: NL
              __NL181__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1086 )

              tree_for_NL181 = @adaptor.create_with_payload( __NL181__ )
              @adaptor.add_child( root_0, tree_for_NL181 )


            else
              break # out of loop for decision 76
            end
          end # loop for decision 76
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1089 )
          constraint_body182 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body182.tree )
          char_literal183 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1091 )

          tree_for_char_literal183 = @adaptor.create_with_payload( char_literal183 )
          @adaptor.add_child( root_0, tree_for_char_literal183 )

          # at file 353:31: ( NL )+
          match_count_77 = 0
          while true
            alt_77 = 2
            look_77_0 = @input.peek( 1 )

            if ( look_77_0 == NL )
              alt_77 = 1

            end
            case alt_77
            when 1
              # at line 353:31: NL
              __NL184__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1093 )

              tree_for_NL184 = @adaptor.create_with_payload( __NL184__ )
              @adaptor.add_child( root_0, tree_for_NL184 )


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


          # at line 356:4: 'within' NUMBER ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal185 = match( T__44, TOKENS_FOLLOWING_T__44_IN_goal_body_1107 )

          tree_for_string_literal185 = @adaptor.create_with_payload( string_literal185 )
          @adaptor.add_child( root_0, tree_for_string_literal185 )

          __NUMBER186__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_goal_body_1109 )

          tree_for_NUMBER186 = @adaptor.create_with_payload( __NUMBER186__ )
          @adaptor.add_child( root_0, tree_for_NUMBER186 )

          # at line 356:20: ( NL )*
          while true # decision 78
            alt_78 = 2
            look_78_0 = @input.peek( 1 )

            if ( look_78_0 == NL )
              alt_78 = 1

            end
            case alt_78
            when 1
              # at line 356:20: NL
              __NL187__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1111 )

              tree_for_NL187 = @adaptor.create_with_payload( __NL187__ )
              @adaptor.add_child( root_0, tree_for_NL187 )


            else
              break # out of loop for decision 78
            end
          end # loop for decision 78
          # --> action

          			id = self.next_id.to_s
          			@now[id] = self.create_constraint(id, 'within')
          			@now = @now[id]
          			@now['deadline'] = __NUMBER186__.text.to_s.to_i
          		
          # <-- action
          char_literal188 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1120 )

          tree_for_char_literal188 = @adaptor.create_with_payload( char_literal188 )
          @adaptor.add_child( root_0, tree_for_char_literal188 )

          # at line 363:7: ( NL )*
          while true # decision 79
            alt_79 = 2
            look_79_0 = @input.peek( 1 )

            if ( look_79_0 == NL )
              alt_79 = 1

            end
            case alt_79
            when 1
              # at line 363:7: NL
              __NL189__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1122 )

              tree_for_NL189 = @adaptor.create_with_payload( __NL189__ )
              @adaptor.add_child( root_0, tree_for_NL189 )


            else
              break # out of loop for decision 79
            end
          end # loop for decision 79
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1125 )
          constraint_body190 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body190.tree )
          char_literal191 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1127 )

          tree_for_char_literal191 = @adaptor.create_with_payload( char_literal191 )
          @adaptor.add_child( root_0, tree_for_char_literal191 )

          # at file 363:31: ( NL )+
          match_count_80 = 0
          while true
            alt_80 = 2
            look_80_0 = @input.peek( 1 )

            if ( look_80_0 == NL )
              alt_80 = 1

            end
            case alt_80
            when 1
              # at line 363:31: NL
              __NL192__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1129 )

              tree_for_NL192 = @adaptor.create_with_payload( __NL192__ )
              @adaptor.add_child( root_0, tree_for_NL192 )


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


          # at line 365:4: 'after' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* ( 'then' | 'within' NUMBER ) ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal193 = match( T__45, TOKENS_FOLLOWING_T__45_IN_goal_body_1139 )

          tree_for_string_literal193 = @adaptor.create_with_payload( string_literal193 )
          @adaptor.add_child( root_0, tree_for_string_literal193 )

          # at line 365:12: ( NL )*
          while true # decision 81
            alt_81 = 2
            look_81_0 = @input.peek( 1 )

            if ( look_81_0 == NL )
              alt_81 = 1

            end
            case alt_81
            when 1
              # at line 365:12: NL
              __NL194__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1141 )

              tree_for_NL194 = @adaptor.create_with_payload( __NL194__ )
              @adaptor.add_child( root_0, tree_for_NL194 )


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
          char_literal195 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1150 )

          tree_for_char_literal195 = @adaptor.create_with_payload( char_literal195 )
          @adaptor.add_child( root_0, tree_for_char_literal195 )

          # at line 378:7: ( NL )*
          while true # decision 82
            alt_82 = 2
            look_82_0 = @input.peek( 1 )

            if ( look_82_0 == NL )
              alt_82 = 1

            end
            case alt_82
            when 1
              # at line 378:7: NL
              __NL196__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1152 )

              tree_for_NL196 = @adaptor.create_with_payload( __NL196__ )
              @adaptor.add_child( root_0, tree_for_NL196 )


            else
              break # out of loop for decision 82
            end
          end # loop for decision 82
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1155 )
          constraint_body197 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body197.tree )
          char_literal198 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1157 )

          tree_for_char_literal198 = @adaptor.create_with_payload( char_literal198 )
          @adaptor.add_child( root_0, tree_for_char_literal198 )

          # at line 378:31: ( NL )*
          while true # decision 83
            alt_83 = 2
            look_83_0 = @input.peek( 1 )

            if ( look_83_0 == NL )
              alt_83 = 1

            end
            case alt_83
            when 1
              # at line 378:31: NL
              __NL199__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1159 )

              tree_for_NL199 = @adaptor.create_with_payload( __NL199__ )
              @adaptor.add_child( root_0, tree_for_NL199 )


            else
              break # out of loop for decision 83
            end
          end # loop for decision 83
          # --> action
          	self.goto_parent()	
          # <-- action
          # at line 380:3: ( 'then' | 'within' NUMBER )
          alt_84 = 2
          look_84_0 = @input.peek( 1 )

          if ( look_84_0 == T__29 )
            alt_84 = 1
          elsif ( look_84_0 == T__44 )
            alt_84 = 2
          else
            raise NoViableAlternative( "", 84, 0 )
          end
          case alt_84
          when 1
            # at line 380:5: 'then'
            string_literal200 = match( T__29, TOKENS_FOLLOWING_T__29_IN_goal_body_1170 )

            tree_for_string_literal200 = @adaptor.create_with_payload( string_literal200 )
            @adaptor.add_child( root_0, tree_for_string_literal200 )


          when 2
            # at line 381:6: 'within' NUMBER
            string_literal201 = match( T__44, TOKENS_FOLLOWING_T__44_IN_goal_body_1177 )

            tree_for_string_literal201 = @adaptor.create_with_payload( string_literal201 )
            @adaptor.add_child( root_0, tree_for_string_literal201 )

            __NUMBER202__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_goal_body_1179 )

            tree_for_NUMBER202 = @adaptor.create_with_payload( __NUMBER202__ )
            @adaptor.add_child( root_0, tree_for_NUMBER202 )

            # --> action
             @now['deadline'] = __NUMBER202__.text.to_s.to_i 
            # <-- action

          end
          # at line 383:5: ( NL )*
          while true # decision 85
            alt_85 = 2
            look_85_0 = @input.peek( 1 )

            if ( look_85_0 == NL )
              alt_85 = 1

            end
            case alt_85
            when 1
              # at line 383:5: NL
              __NL203__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1191 )

              tree_for_NL203 = @adaptor.create_with_payload( __NL203__ )
              @adaptor.add_child( root_0, tree_for_NL203 )


            else
              break # out of loop for decision 85
            end
          end # loop for decision 85
          # --> action

          			@now['then'] = self.create_constraint('then')
          			@now = @now['then']
          		
          # <-- action
          char_literal204 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1200 )

          tree_for_char_literal204 = @adaptor.create_with_payload( char_literal204 )
          @adaptor.add_child( root_0, tree_for_char_literal204 )

          # at line 388:7: ( NL )*
          while true # decision 86
            alt_86 = 2
            look_86_0 = @input.peek( 1 )

            if ( look_86_0 == NL )
              alt_86 = 1

            end
            case alt_86
            when 1
              # at line 388:7: NL
              __NL205__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1202 )

              tree_for_NL205 = @adaptor.create_with_payload( __NL205__ )
              @adaptor.add_child( root_0, tree_for_NL205 )


            else
              break # out of loop for decision 86
            end
          end # loop for decision 86
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1205 )
          constraint_body206 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body206.tree )
          char_literal207 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1207 )

          tree_for_char_literal207 = @adaptor.create_with_payload( char_literal207 )
          @adaptor.add_child( root_0, tree_for_char_literal207 )

          # at file 388:31: ( NL )+
          match_count_87 = 0
          while true
            alt_87 = 2
            look_87_0 = @input.peek( 1 )

            if ( look_87_0 == NL )
              alt_87 = 1

            end
            case alt_87
            when 1
              # at line 388:31: NL
              __NL208__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1209 )

              tree_for_NL208 = @adaptor.create_with_payload( __NL208__ )
              @adaptor.add_child( root_0, tree_for_NL208 )


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


          # at line 392:4: 'before' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal209 = match( T__46, TOKENS_FOLLOWING_T__46_IN_goal_body_1227 )

          tree_for_string_literal209 = @adaptor.create_with_payload( string_literal209 )
          @adaptor.add_child( root_0, tree_for_string_literal209 )

          # at line 392:13: ( NL )*
          while true # decision 88
            alt_88 = 2
            look_88_0 = @input.peek( 1 )

            if ( look_88_0 == NL )
              alt_88 = 1

            end
            case alt_88
            when 1
              # at line 392:13: NL
              __NL210__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1229 )

              tree_for_NL210 = @adaptor.create_with_payload( __NL210__ )
              @adaptor.add_child( root_0, tree_for_NL210 )


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
          char_literal211 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1238 )

          tree_for_char_literal211 = @adaptor.create_with_payload( char_literal211 )
          @adaptor.add_child( root_0, tree_for_char_literal211 )

          # at line 400:7: ( NL )*
          while true # decision 89
            alt_89 = 2
            look_89_0 = @input.peek( 1 )

            if ( look_89_0 == NL )
              alt_89 = 1

            end
            case alt_89
            when 1
              # at line 400:7: NL
              __NL212__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1240 )

              tree_for_NL212 = @adaptor.create_with_payload( __NL212__ )
              @adaptor.add_child( root_0, tree_for_NL212 )


            else
              break # out of loop for decision 89
            end
          end # loop for decision 89
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1243 )
          constraint_body213 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body213.tree )
          char_literal214 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1245 )

          tree_for_char_literal214 = @adaptor.create_with_payload( char_literal214 )
          @adaptor.add_child( root_0, tree_for_char_literal214 )

          # at line 400:31: ( NL )*
          while true # decision 90
            alt_90 = 2
            look_90_0 = @input.peek( 1 )

            if ( look_90_0 == NL )
              alt_90 = 1

            end
            case alt_90
            when 1
              # at line 400:31: NL
              __NL215__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1247 )

              tree_for_NL215 = @adaptor.create_with_payload( __NL215__ )
              @adaptor.add_child( root_0, tree_for_NL215 )


            else
              break # out of loop for decision 90
            end
          end # loop for decision 90
          # --> action
          	self.goto_parent()	
          # <-- action
          string_literal216 = match( T__29, TOKENS_FOLLOWING_T__29_IN_goal_body_1256 )

          tree_for_string_literal216 = @adaptor.create_with_payload( string_literal216 )
          @adaptor.add_child( root_0, tree_for_string_literal216 )

          # at line 402:10: ( NL )*
          while true # decision 91
            alt_91 = 2
            look_91_0 = @input.peek( 1 )

            if ( look_91_0 == NL )
              alt_91 = 1

            end
            case alt_91
            when 1
              # at line 402:10: NL
              __NL217__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1258 )

              tree_for_NL217 = @adaptor.create_with_payload( __NL217__ )
              @adaptor.add_child( root_0, tree_for_NL217 )


            else
              break # out of loop for decision 91
            end
          end # loop for decision 91
          # --> action

          			@now['then'] = self.create_constraint('then')
          			@now = @now['then']
          		
          # <-- action
          char_literal218 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1267 )

          tree_for_char_literal218 = @adaptor.create_with_payload( char_literal218 )
          @adaptor.add_child( root_0, tree_for_char_literal218 )

          # at line 407:7: ( NL )*
          while true # decision 92
            alt_92 = 2
            look_92_0 = @input.peek( 1 )

            if ( look_92_0 == NL )
              alt_92 = 1

            end
            case alt_92
            when 1
              # at line 407:7: NL
              __NL219__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1269 )

              tree_for_NL219 = @adaptor.create_with_payload( __NL219__ )
              @adaptor.add_child( root_0, tree_for_NL219 )


            else
              break # out of loop for decision 92
            end
          end # loop for decision 92
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1272 )
          constraint_body220 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body220.tree )
          char_literal221 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1274 )

          tree_for_char_literal221 = @adaptor.create_with_payload( char_literal221 )
          @adaptor.add_child( root_0, tree_for_char_literal221 )

          # at file 407:31: ( NL )+
          match_count_93 = 0
          while true
            alt_93 = 2
            look_93_0 = @input.peek( 1 )

            if ( look_93_0 == NL )
              alt_93 = 1

            end
            case alt_93
            when 1
              # at line 407:31: NL
              __NL222__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1276 )

              tree_for_NL222 = @adaptor.create_with_payload( __NL222__ )
              @adaptor.add_child( root_0, tree_for_NL222 )


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
    # 412:1: nested_constraint : '{' ( NL )* constraint_body '}' ;
    # 
    def nested_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = NestedConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal223 = nil
      __NL224__ = nil
      char_literal226 = nil
      constraint_body225 = nil

      tree_for_char_literal223 = nil
      tree_for_NL224 = nil
      tree_for_char_literal226 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 413:4: '{' ( NL )* constraint_body '}'
        char_literal223 = match( T__20, TOKENS_FOLLOWING_T__20_IN_nested_constraint_1296 )

        tree_for_char_literal223 = @adaptor.create_with_payload( char_literal223 )
        @adaptor.add_child( root_0, tree_for_char_literal223 )

        # at line 413:8: ( NL )*
        while true # decision 95
          alt_95 = 2
          look_95_0 = @input.peek( 1 )

          if ( look_95_0 == NL )
            alt_95 = 1

          end
          case alt_95
          when 1
            # at line 413:8: NL
            __NL224__ = match( NL, TOKENS_FOLLOWING_NL_IN_nested_constraint_1298 )

            tree_for_NL224 = @adaptor.create_with_payload( __NL224__ )
            @adaptor.add_child( root_0, tree_for_NL224 )


          else
            break # out of loop for decision 95
          end
        end # loop for decision 95
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_nested_constraint_1301 )
        constraint_body225 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body225.tree )
        char_literal226 = match( T__21, TOKENS_FOLLOWING_T__21_IN_nested_constraint_1303 )

        tree_for_char_literal226 = @adaptor.create_with_payload( char_literal226 )
        @adaptor.add_child( root_0, tree_for_char_literal226 )

        # - - - - - - - rule clean up - - - - - - - -
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
      __ID227__ = nil
      string_literal228 = nil
      char_literal229 = nil
      __NL230__ = nil
      char_literal232 = nil
      __NL233__ = nil
      constraint_body231 = nil

      tree_for_ID227 = nil
      tree_for_string_literal228 = nil
      tree_for_char_literal229 = nil
      tree_for_NL230 = nil
      tree_for_char_literal232 = nil
      tree_for_NL233 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 417:4: ID 'constraint' '{' ( NL )* constraint_body '}' ( NL )+
        __ID227__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_1314 )

        tree_for_ID227 = @adaptor.create_with_payload( __ID227__ )
        @adaptor.add_child( root_0, tree_for_ID227 )

        string_literal228 = match( T__41, TOKENS_FOLLOWING_T__41_IN_constraint_1316 )

        tree_for_string_literal228 = @adaptor.create_with_payload( string_literal228 )
        @adaptor.add_child( root_0, tree_for_string_literal228 )

        # --> action

        			@now[__ID227__.text] = { '_self' => __ID227__.text,
        				'_context' => 'constraint',
        				'_type' => 'and',
        				'_parent' => @now
        			}
        			@now = @now[__ID227__.text]
        		
        # <-- action
        char_literal229 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_1324 )

        tree_for_char_literal229 = @adaptor.create_with_payload( char_literal229 )
        @adaptor.add_child( root_0, tree_for_char_literal229 )

        # at line 426:7: ( NL )*
        while true # decision 96
          alt_96 = 2
          look_96_0 = @input.peek( 1 )

          if ( look_96_0 == NL )
            alt_96 = 1

          end
          case alt_96
          when 1
            # at line 426:7: NL
            __NL230__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_1326 )

            tree_for_NL230 = @adaptor.create_with_payload( __NL230__ )
            @adaptor.add_child( root_0, tree_for_NL230 )


          else
            break # out of loop for decision 96
          end
        end # loop for decision 96
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_constraint_1329 )
        constraint_body231 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body231.tree )
        char_literal232 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_1331 )

        tree_for_char_literal232 = @adaptor.create_with_payload( char_literal232 )
        @adaptor.add_child( root_0, tree_for_char_literal232 )

        # at file 426:31: ( NL )+
        match_count_97 = 0
        while true
          alt_97 = 2
          look_97_0 = @input.peek( 1 )

          if ( look_97_0 == NL )
            alt_97 = 1

          end
          case alt_97
          when 1
            # at line 426:31: NL
            __NL233__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_1333 )

            tree_for_NL233 = @adaptor.create_with_payload( __NL233__ )
            @adaptor.add_child( root_0, tree_for_NL233 )


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
    # 430:1: constraint_body : ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )* ;
    # 
    def constraint_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = ConstraintBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL238__ = nil
      constraint_statement234 = nil
      constraint_namespace235 = nil
      constraint_iterator236 = nil
      constraint_class_quantification237 = nil

      tree_for_NL238 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 431:4: ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )*
        # at line 431:4: ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )*
        while true # decision 100
          alt_100 = 2
          look_100_0 = @input.peek( 1 )

          if ( look_100_0 == ID || look_100_0 == T__28 || look_100_0 == T__47 || look_100_0.between?( T__49, T__51 ) || look_100_0 == T__54 || look_100_0 == T__58 )
            alt_100 = 1

          end
          case alt_100
          when 1
            # at line 432:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+
            # at line 432:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification )
            alt_98 = 4
            alt_98 = @dfa98.predict( @input )
            case alt_98
            when 1
              # at line 432:6: constraint_statement
              @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_1356 )
              constraint_statement234 = constraint_statement
              @state.following.pop
              @adaptor.add_child( root_0, constraint_statement234.tree )
              # --> action

              					@now[( constraint_statement234.nil? ? nil : constraint_statement234.key )] = ( constraint_statement234.nil? ? nil : constraint_statement234.val )
              				
              # <-- action

            when 2
              # at line 436:6: constraint_namespace
              @state.following.push( TOKENS_FOLLOWING_constraint_namespace_IN_constraint_body_1369 )
              constraint_namespace235 = constraint_namespace
              @state.following.pop
              @adaptor.add_child( root_0, constraint_namespace235.tree )

            when 3
              # at line 437:6: constraint_iterator
              @state.following.push( TOKENS_FOLLOWING_constraint_iterator_IN_constraint_body_1376 )
              constraint_iterator236 = constraint_iterator
              @state.following.pop
              @adaptor.add_child( root_0, constraint_iterator236.tree )

            when 4
              # at line 438:6: constraint_class_quantification
              @state.following.push( TOKENS_FOLLOWING_constraint_class_quantification_IN_constraint_body_1383 )
              constraint_class_quantification237 = constraint_class_quantification
              @state.following.pop
              @adaptor.add_child( root_0, constraint_class_quantification237.tree )

            end
            # at file 440:3: ( NL )+
            match_count_99 = 0
            while true
              alt_99 = 2
              look_99_0 = @input.peek( 1 )

              if ( look_99_0 == NL )
                alt_99 = 1

              end
              case alt_99
              when 1
                # at line 440:3: NL
                __NL238__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_body_1392 )

                tree_for_NL238 = @adaptor.create_with_payload( __NL238__ )
                @adaptor.add_child( root_0, tree_for_NL238 )


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
    # 443:1: constraint_namespace : path ( NL )* '{' ( NL )* ( constraint_statement ( NL )+ )* '}' ;
    # 
    def constraint_namespace
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = ConstraintNamespaceReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL240__ = nil
      char_literal241 = nil
      __NL242__ = nil
      __NL244__ = nil
      char_literal245 = nil
      path239 = nil
      constraint_statement243 = nil

      tree_for_NL240 = nil
      tree_for_char_literal241 = nil
      tree_for_NL242 = nil
      tree_for_NL244 = nil
      tree_for_char_literal245 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 444:4: path ( NL )* '{' ( NL )* ( constraint_statement ( NL )+ )* '}'
        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_namespace_1406 )
        path239 = path
        @state.following.pop
        @adaptor.add_child( root_0, path239.tree )
        # at line 444:9: ( NL )*
        while true # decision 101
          alt_101 = 2
          look_101_0 = @input.peek( 1 )

          if ( look_101_0 == NL )
            alt_101 = 1

          end
          case alt_101
          when 1
            # at line 444:9: NL
            __NL240__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1408 )

            tree_for_NL240 = @adaptor.create_with_payload( __NL240__ )
            @adaptor.add_child( root_0, tree_for_NL240 )


          else
            break # out of loop for decision 101
          end
        end # loop for decision 101
        char_literal241 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_namespace_1411 )

        tree_for_char_literal241 = @adaptor.create_with_payload( char_literal241 )
        @adaptor.add_child( root_0, tree_for_char_literal241 )

        # at line 444:17: ( NL )*
        while true # decision 102
          alt_102 = 2
          look_102_0 = @input.peek( 1 )

          if ( look_102_0 == NL )
            alt_102 = 1

          end
          case alt_102
          when 1
            # at line 444:17: NL
            __NL242__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1413 )

            tree_for_NL242 = @adaptor.create_with_payload( __NL242__ )
            @adaptor.add_child( root_0, tree_for_NL242 )


          else
            break # out of loop for decision 102
          end
        end # loop for decision 102
        # at line 444:21: ( constraint_statement ( NL )+ )*
        while true # decision 104
          alt_104 = 2
          look_104_0 = @input.peek( 1 )

          if ( look_104_0 == ID || look_104_0 == T__28 || look_104_0 == T__54 || look_104_0 == T__58 )
            alt_104 = 1

          end
          case alt_104
          when 1
            # at line 444:22: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_namespace_1417 )
            constraint_statement243 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement243.tree )
            # --> action

            			key = self.to_ref(( path239 && @input.to_s( path239.start, path239.stop ) ) + '.' + ( constraint_statement243.nil? ? nil : constraint_statement243.key )[2,( constraint_statement243.nil? ? nil : constraint_statement243.key ).length])
            			@now[key] = ( constraint_statement243.nil? ? nil : constraint_statement243.val )
            		
            # <-- action
            # at file 449:3: ( NL )+
            match_count_103 = 0
            while true
              alt_103 = 2
              look_103_0 = @input.peek( 1 )

              if ( look_103_0 == NL )
                alt_103 = 1

              end
              case alt_103
              when 1
                # at line 449:3: NL
                __NL244__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1425 )

                tree_for_NL244 = @adaptor.create_with_payload( __NL244__ )
                @adaptor.add_child( root_0, tree_for_NL244 )


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
        char_literal245 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_namespace_1430 )

        tree_for_char_literal245 = @adaptor.create_with_payload( char_literal245 )
        @adaptor.add_child( root_0, tree_for_char_literal245 )

        # - - - - - - - rule clean up - - - - - - - -
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
      string_literal246 = nil
      char_literal247 = nil
      string_literal249 = nil
      __ID250__ = nil
      char_literal251 = nil
      __NL252__ = nil
      char_literal253 = nil
      __NL254__ = nil
      __NL256__ = nil
      char_literal257 = nil
      path248 = nil
      constraint_statement255 = nil

      tree_for_string_literal246 = nil
      tree_for_char_literal247 = nil
      tree_for_string_literal249 = nil
      tree_for_ID250 = nil
      tree_for_char_literal251 = nil
      tree_for_NL252 = nil
      tree_for_char_literal253 = nil
      tree_for_NL254 = nil
      tree_for_NL256 = nil
      tree_for_char_literal257 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 453:4: 'foreach' '(' path 'as' ID ')' ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ )* '}'
        string_literal246 = match( T__47, TOKENS_FOLLOWING_T__47_IN_constraint_iterator_1441 )

        tree_for_string_literal246 = @adaptor.create_with_payload( string_literal246 )
        @adaptor.add_child( root_0, tree_for_string_literal246 )

        char_literal247 = match( T__36, TOKENS_FOLLOWING_T__36_IN_constraint_iterator_1443 )

        tree_for_char_literal247 = @adaptor.create_with_payload( char_literal247 )
        @adaptor.add_child( root_0, tree_for_char_literal247 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_iterator_1445 )
        path248 = path
        @state.following.pop
        @adaptor.add_child( root_0, path248.tree )
        string_literal249 = match( T__48, TOKENS_FOLLOWING_T__48_IN_constraint_iterator_1447 )

        tree_for_string_literal249 = @adaptor.create_with_payload( string_literal249 )
        @adaptor.add_child( root_0, tree_for_string_literal249 )

        __ID250__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_iterator_1449 )

        tree_for_ID250 = @adaptor.create_with_payload( __ID250__ )
        @adaptor.add_child( root_0, tree_for_ID250 )

        char_literal251 = match( T__38, TOKENS_FOLLOWING_T__38_IN_constraint_iterator_1451 )

        tree_for_char_literal251 = @adaptor.create_with_payload( char_literal251 )
        @adaptor.add_child( root_0, tree_for_char_literal251 )

        # at line 453:35: ( NL )*
        while true # decision 105
          alt_105 = 2
          look_105_0 = @input.peek( 1 )

          if ( look_105_0 == NL )
            alt_105 = 1

          end
          case alt_105
          when 1
            # at line 453:35: NL
            __NL252__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1453 )

            tree_for_NL252 = @adaptor.create_with_payload( __NL252__ )
            @adaptor.add_child( root_0, tree_for_NL252 )


          else
            break # out of loop for decision 105
          end
        end # loop for decision 105
        char_literal253 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_iterator_1456 )

        tree_for_char_literal253 = @adaptor.create_with_payload( char_literal253 )
        @adaptor.add_child( root_0, tree_for_char_literal253 )

        # at file 453:43: ( NL )+
        match_count_106 = 0
        while true
          alt_106 = 2
          look_106_0 = @input.peek( 1 )

          if ( look_106_0 == NL )
            alt_106 = 1

          end
          case alt_106
          when 1
            # at line 453:43: NL
            __NL254__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1458 )

            tree_for_NL254 = @adaptor.create_with_payload( __NL254__ )
            @adaptor.add_child( root_0, tree_for_NL254 )


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
        				'_value' => '$.' + ( path248 && @input.to_s( path248.start, path248.stop ) ),
        				'_variable' => __ID250__.text
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
        while true # decision 108
          alt_108 = 2
          look_108_0 = @input.peek( 1 )

          if ( look_108_0 == ID || look_108_0 == T__28 || look_108_0 == T__54 || look_108_0 == T__58 )
            alt_108 = 1

          end
          case alt_108
          when 1
            # at line 473:4: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_iterator_1468 )
            constraint_statement255 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement255.tree )
            # --> action

            			@now[( constraint_statement255.nil? ? nil : constraint_statement255.key )] = ( constraint_statement255.nil? ? nil : constraint_statement255.val )
            		
            # <-- action
            # at file 477:3: ( NL )+
            match_count_107 = 0
            while true
              alt_107 = 2
              look_107_0 = @input.peek( 1 )

              if ( look_107_0 == NL )
                alt_107 = 1

              end
              case alt_107
              when 1
                # at line 477:3: NL
                __NL256__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1476 )

                tree_for_NL256 = @adaptor.create_with_payload( __NL256__ )
                @adaptor.add_child( root_0, tree_for_NL256 )


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
        char_literal257 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_iterator_1483 )

        tree_for_char_literal257 = @adaptor.create_with_payload( char_literal257 )
        @adaptor.add_child( root_0, tree_for_char_literal257 )

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
      set258 = nil

      tree_for_set258 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set258 = @input.look
        if @input.peek( 1 ).between?( T__49, T__51 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set258 ) )
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
      char_literal260 = nil
      string_literal262 = nil
      __ID263__ = nil
      char_literal264 = nil
      char_literal266 = nil
      __NUMBER267__ = nil
      __NL268__ = nil
      char_literal269 = nil
      __NL270__ = nil
      __NL272__ = nil
      __NL274__ = nil
      __NL276__ = nil
      char_literal277 = nil
      quantification_keyword259 = nil
      path261 = nil
      binary_comp265 = nil
      constraint_statement271 = nil
      constraint_different273 = nil
      constraint_iterator275 = nil

      tree_for_char_literal260 = nil
      tree_for_string_literal262 = nil
      tree_for_ID263 = nil
      tree_for_char_literal264 = nil
      tree_for_char_literal266 = nil
      tree_for_NUMBER267 = nil
      tree_for_NL268 = nil
      tree_for_char_literal269 = nil
      tree_for_NL270 = nil
      tree_for_NL272 = nil
      tree_for_NL274 = nil
      tree_for_NL276 = nil
      tree_for_char_literal277 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 492:4: quantification_keyword '(' path 'as' ID ')' ( ( binary_comp | '=' ) NUMBER )? ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ | constraint_different ( NL )+ | constraint_iterator ( NL )+ )* '}'
        @state.following.push( TOKENS_FOLLOWING_quantification_keyword_IN_constraint_class_quantification_1519 )
        quantification_keyword259 = quantification_keyword
        @state.following.pop
        @adaptor.add_child( root_0, quantification_keyword259.tree )
        char_literal260 = match( T__36, TOKENS_FOLLOWING_T__36_IN_constraint_class_quantification_1521 )

        tree_for_char_literal260 = @adaptor.create_with_payload( char_literal260 )
        @adaptor.add_child( root_0, tree_for_char_literal260 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_class_quantification_1523 )
        path261 = path
        @state.following.pop
        @adaptor.add_child( root_0, path261.tree )
        string_literal262 = match( T__48, TOKENS_FOLLOWING_T__48_IN_constraint_class_quantification_1525 )

        tree_for_string_literal262 = @adaptor.create_with_payload( string_literal262 )
        @adaptor.add_child( root_0, tree_for_string_literal262 )

        __ID263__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_class_quantification_1527 )

        tree_for_ID263 = @adaptor.create_with_payload( __ID263__ )
        @adaptor.add_child( root_0, tree_for_ID263 )

        char_literal264 = match( T__38, TOKENS_FOLLOWING_T__38_IN_constraint_class_quantification_1529 )

        tree_for_char_literal264 = @adaptor.create_with_payload( char_literal264 )
        @adaptor.add_child( root_0, tree_for_char_literal264 )

        # --> action

        			id = self.next_id.to_s
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => ( quantification_keyword259 && @input.to_s( quantification_keyword259.start, quantification_keyword259.stop ) ),
        				'_self' => id,
        				'_class' => ( path261 && @input.to_s( path261.start, path261.stop ) ),
        				'_variable' => __ID263__.text
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
        alt_110 = 2
        look_110_0 = @input.peek( 1 )

        if ( look_110_0 == T__52 || look_110_0.between?( T__71, T__74 ) )
          alt_110 = 1
        end
        case alt_110
        when 1
          # at line 512:5: ( binary_comp | '=' ) NUMBER
          # at line 512:5: ( binary_comp | '=' )
          alt_109 = 2
          look_109_0 = @input.peek( 1 )

          if ( look_109_0.between?( T__71, T__74 ) )
            alt_109 = 1
          elsif ( look_109_0 == T__52 )
            alt_109 = 2
          else
            raise NoViableAlternative( "", 109, 0 )
          end
          case alt_109
          when 1
            # at line 512:7: binary_comp
            @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_constraint_class_quantification_1541 )
            binary_comp265 = binary_comp
            @state.following.pop
            @adaptor.add_child( root_0, binary_comp265.tree )
            # --> action
            	@now['_count_operator'] = ( binary_comp265 && @input.to_s( binary_comp265.start, binary_comp265.stop ) )	
            # <-- action

          when 2
            # at line 514:6: '='
            char_literal266 = match( T__52, TOKENS_FOLLOWING_T__52_IN_constraint_class_quantification_1554 )

            tree_for_char_literal266 = @adaptor.create_with_payload( char_literal266 )
            @adaptor.add_child( root_0, tree_for_char_literal266 )

            # --> action
            	@now['_count_operator'] = '='	
            # <-- action

          end
          __NUMBER267__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_constraint_class_quantification_1570 )

          tree_for_NUMBER267 = @adaptor.create_with_payload( __NUMBER267__ )
          @adaptor.add_child( root_0, tree_for_NUMBER267 )

          # --> action
          	@now['_count_value'] = __NUMBER267__.text.to_i	
          # <-- action

        end
        # at line 520:3: ( NL )*
        while true # decision 111
          alt_111 = 2
          look_111_0 = @input.peek( 1 )

          if ( look_111_0 == NL )
            alt_111 = 1

          end
          case alt_111
          when 1
            # at line 520:3: NL
            __NL268__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1584 )

            tree_for_NL268 = @adaptor.create_with_payload( __NL268__ )
            @adaptor.add_child( root_0, tree_for_NL268 )


          else
            break # out of loop for decision 111
          end
        end # loop for decision 111
        char_literal269 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_class_quantification_1587 )

        tree_for_char_literal269 = @adaptor.create_with_payload( char_literal269 )
        @adaptor.add_child( root_0, tree_for_char_literal269 )

        # at file 520:11: ( NL )+
        match_count_112 = 0
        while true
          alt_112 = 2
          look_112_0 = @input.peek( 1 )

          if ( look_112_0 == NL )
            alt_112 = 1

          end
          case alt_112
          when 1
            # at line 520:11: NL
            __NL270__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1589 )

            tree_for_NL270 = @adaptor.create_with_payload( __NL270__ )
            @adaptor.add_child( root_0, tree_for_NL270 )


          else
            match_count_112 > 0 and break
            eee = EarlyExit(112)


            raise eee
          end
          match_count_112 += 1
        end

        # at line 521:3: ( constraint_statement ( NL )+ | constraint_different ( NL )+ | constraint_iterator ( NL )+ )*
        while true # decision 116
          alt_116 = 4
          case look_116 = @input.peek( 1 )
          when ID, T__28, T__54, T__58 then alt_116 = 1
          when T__53 then alt_116 = 2
          when T__47 then alt_116 = 3
          end
          case alt_116
          when 1
            # at line 521:5: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_class_quantification_1596 )
            constraint_statement271 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement271.tree )
            # --> action
            	@now[( constraint_statement271.nil? ? nil : constraint_statement271.key )] = ( constraint_statement271.nil? ? nil : constraint_statement271.val )	
            # <-- action
            # at file 523:4: ( NL )+
            match_count_113 = 0
            while true
              alt_113 = 2
              look_113_0 = @input.peek( 1 )

              if ( look_113_0 == NL )
                alt_113 = 1

              end
              case alt_113
              when 1
                # at line 523:4: NL
                __NL272__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1606 )

                tree_for_NL272 = @adaptor.create_with_payload( __NL272__ )
                @adaptor.add_child( root_0, tree_for_NL272 )


              else
                match_count_113 > 0 and break
                eee = EarlyExit(113)


                raise eee
              end
              match_count_113 += 1
            end


          when 2
            # at line 524:5: constraint_different ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_different_IN_constraint_class_quantification_1613 )
            constraint_different273 = constraint_different
            @state.following.pop
            @adaptor.add_child( root_0, constraint_different273.tree )
            # at file 524:26: ( NL )+
            match_count_114 = 0
            while true
              alt_114 = 2
              look_114_0 = @input.peek( 1 )

              if ( look_114_0 == NL )
                alt_114 = 1

              end
              case alt_114
              when 1
                # at line 524:26: NL
                __NL274__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1615 )

                tree_for_NL274 = @adaptor.create_with_payload( __NL274__ )
                @adaptor.add_child( root_0, tree_for_NL274 )


              else
                match_count_114 > 0 and break
                eee = EarlyExit(114)


                raise eee
              end
              match_count_114 += 1
            end


          when 3
            # at line 525:5: constraint_iterator ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_iterator_IN_constraint_class_quantification_1622 )
            constraint_iterator275 = constraint_iterator
            @state.following.pop
            @adaptor.add_child( root_0, constraint_iterator275.tree )
            # at file 525:25: ( NL )+
            match_count_115 = 0
            while true
              alt_115 = 2
              look_115_0 = @input.peek( 1 )

              if ( look_115_0 == NL )
                alt_115 = 1

              end
              case alt_115
              when 1
                # at line 525:25: NL
                __NL276__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1624 )

                tree_for_NL276 = @adaptor.create_with_payload( __NL276__ )
                @adaptor.add_child( root_0, tree_for_NL276 )


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
        char_literal277 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_class_quantification_1632 )

        tree_for_char_literal277 = @adaptor.create_with_payload( char_literal277 )
        @adaptor.add_child( root_0, tree_for_char_literal277 )

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
      string_literal278 = nil
      char_literal279 = nil
      char_literal281 = nil
      path280 = nil

      tree_for_string_literal278 = nil
      tree_for_char_literal279 = nil
      tree_for_char_literal281 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 532:4: ':different' '(' path ')'
        string_literal278 = match( T__53, TOKENS_FOLLOWING_T__53_IN_constraint_different_1651 )

        tree_for_string_literal278 = @adaptor.create_with_payload( string_literal278 )
        @adaptor.add_child( root_0, tree_for_string_literal278 )

        char_literal279 = match( T__36, TOKENS_FOLLOWING_T__36_IN_constraint_different_1653 )

        tree_for_char_literal279 = @adaptor.create_with_payload( char_literal279 )
        @adaptor.add_child( root_0, tree_for_char_literal279 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_different_1655 )
        path280 = path
        @state.following.pop
        @adaptor.add_child( root_0, path280.tree )
        char_literal281 = match( T__38, TOKENS_FOLLOWING_T__38_IN_constraint_different_1657 )

        tree_for_char_literal281 = @adaptor.create_with_payload( char_literal281 )
        @adaptor.add_child( root_0, tree_for_char_literal281 )

        # --> action

        			id = self.next_id.to_s
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'different',
        				'_self' => id,
        				'_path' => ( path280 && @input.to_s( path280.start, path280.stop ) )
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
      string_literal283 = nil
      __NULL290__ = nil
      __NULL296__ = nil
      string_literal299 = nil
      string_literal300 = nil
      set303 = nil
      string_literal304 = nil
      reference282 = nil
      reference284 = nil
      reference285 = nil
      equals_op286 = nil
      value287 = nil
      reference288 = nil
      equals_op289 = nil
      reference291 = nil
      not_equals_op292 = nil
      value293 = nil
      reference294 = nil
      not_equals_op295 = nil
      conditional_constraint297 = nil
      reference298 = nil
      set_value301 = nil
      reference302 = nil
      set_value305 = nil
      reference306 = nil
      binary_comp307 = nil
      comp_value308 = nil
      total_constraint309 = nil

      tree_for_string_literal283 = nil
      tree_for_NULL290 = nil
      tree_for_NULL296 = nil
      tree_for_string_literal299 = nil
      tree_for_string_literal300 = nil
      tree_for_set303 = nil
      tree_for_string_literal304 = nil

      begin
        # at line 545:2: ( reference | 'not' reference | reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | conditional_constraint | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | reference binary_comp comp_value | total_constraint )
        alt_118 = 11
        alt_118 = @dfa118.predict( @input )
        case alt_118
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 545:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1676 )
          reference282 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference282.tree )
          # --> action

          			return_value.key = ( reference282.nil? ? nil : reference282.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => true }
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 550:4: 'not' reference
          string_literal283 = match( T__54, TOKENS_FOLLOWING_T__54_IN_constraint_statement_1685 )

          tree_for_string_literal283 = @adaptor.create_with_payload( string_literal283 )
          @adaptor.add_child( root_0, tree_for_string_literal283 )

          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1687 )
          reference284 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference284.tree )
          # --> action

          			return_value.key = ( reference284.nil? ? nil : reference284.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => false }
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 555:4: reference equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1696 )
          reference285 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference285.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1698 )
          equals_op286 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op286.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_1700 )
          value287 = value
          @state.following.pop
          @adaptor.add_child( root_0, value287.tree )
          # --> action

          			return_value.key = ( reference285.nil? ? nil : reference285.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => ( value287.nil? ? nil : value287.val ) }
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 560:4: reference equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1709 )
          reference288 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference288.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1711 )
          equals_op289 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op289.tree )
          __NULL290__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_constraint_statement_1713 )

          tree_for_NULL290 = @adaptor.create_with_payload( __NULL290__ )
          @adaptor.add_child( root_0, tree_for_NULL290 )

          # --> action

          			return_value.key = ( reference288.nil? ? nil : reference288.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => self.null_value }
          		
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 565:4: reference not_equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1722 )
          reference291 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference291.tree )
          @state.following.push( TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1724 )
          not_equals_op292 = not_equals_op
          @state.following.pop
          @adaptor.add_child( root_0, not_equals_op292.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_1726 )
          value293 = value
          @state.following.pop
          @adaptor.add_child( root_0, value293.tree )
          # --> action

          			return_value.key = ( reference291.nil? ? nil : reference291.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-equals', '_value' => ( value293.nil? ? nil : value293.val ) }
          		
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 570:4: reference not_equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1735 )
          reference294 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference294.tree )
          @state.following.push( TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1737 )
          not_equals_op295 = not_equals_op
          @state.following.pop
          @adaptor.add_child( root_0, not_equals_op295.tree )
          __NULL296__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_constraint_statement_1739 )

          tree_for_NULL296 = @adaptor.create_with_payload( __NULL296__ )
          @adaptor.add_child( root_0, tree_for_NULL296 )

          # --> action

          			return_value.key = ( reference294.nil? ? nil : reference294.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-equals', '_value' => self.null_value }
          		
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 575:4: conditional_constraint
          @state.following.push( TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_1748 )
          conditional_constraint297 = conditional_constraint
          @state.following.pop
          @adaptor.add_child( root_0, conditional_constraint297.tree )
          # --> action

          			return_value.key = ( conditional_constraint297.nil? ? nil : conditional_constraint297.key )
          			return_value.val = ( conditional_constraint297.nil? ? nil : conditional_constraint297.val )
          		
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 580:4: reference ( 'is' )? 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1757 )
          reference298 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference298.tree )
          # at line 580:14: ( 'is' )?
          alt_117 = 2
          look_117_0 = @input.peek( 1 )

          if ( look_117_0 == T__55 )
            alt_117 = 1
          end
          case alt_117
          when 1
            # at line 580:14: 'is'
            string_literal299 = match( T__55, TOKENS_FOLLOWING_T__55_IN_constraint_statement_1759 )

            tree_for_string_literal299 = @adaptor.create_with_payload( string_literal299 )
            @adaptor.add_child( root_0, tree_for_string_literal299 )


          end
          string_literal300 = match( T__56, TOKENS_FOLLOWING_T__56_IN_constraint_statement_1762 )

          tree_for_string_literal300 = @adaptor.create_with_payload( string_literal300 )
          @adaptor.add_child( root_0, tree_for_string_literal300 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_1764 )
          set_value301 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value301.tree )
          # --> action

          			c_or = { '_context' => 'constraint', '_type' => 'or', '_parent' => @now }
          			( set_value301.nil? ? nil : set_value301.val ).each { |v|
          				id = self.next_id.to_s
          				item = { '_context' => 'constraint', '_type' => 'and', '_parent' => c_or }
          				item[( reference298.nil? ? nil : reference298.val )] = { '_context' => 'constraint', '_type' => 'equals', '_value' => v }
          				c_or[id] = item
          			}
          			return_value.key = self.next_id.to_s
          			return_value.val = c_or
          		
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 592:4: reference ( 'isnt' | 'not' ) 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1773 )
          reference302 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference302.tree )
          set303 = @input.look
          if @input.peek(1) == T__54 || @input.peek(1) == T__57
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set303 ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          string_literal304 = match( T__56, TOKENS_FOLLOWING_T__56_IN_constraint_statement_1781 )

          tree_for_string_literal304 = @adaptor.create_with_payload( string_literal304 )
          @adaptor.add_child( root_0, tree_for_string_literal304 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_1783 )
          set_value305 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value305.tree )
          # --> action

          			c_and = { '_context'=>'constraint', '_type'=>'and', '_parent'=>@now }
          			( set_value305.nil? ? nil : set_value305.val ).each { |v|
          				id = self.next_id.to_s
          				item = { '_context'=>'constraint', '_type'=>'and'}
          				item[( reference302.nil? ? nil : reference302.val )] = { '_context'=>'constraint', '_type'=>'not-equals', '_value'=>v }
          				c_and[id] = item
          			}
          			return_value.key = self.next_id.to_s
          			return_value.val = c_and

          			#return_value.key = ( reference302.nil? ? nil : reference302.val )
          			#return_value.val = { '_context' => 'constraint', '_type' => 'not-in', '_value' => ( set_value305.nil? ? nil : set_value305.val ) }
          		
          # <-- action

        when 10
          root_0 = @adaptor.create_flat_list


          # at line 607:4: reference binary_comp comp_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1792 )
          reference306 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference306.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_1794 )
          binary_comp307 = binary_comp
          @state.following.pop
          @adaptor.add_child( root_0, binary_comp307.tree )
          @state.following.push( TOKENS_FOLLOWING_comp_value_IN_constraint_statement_1796 )
          comp_value308 = comp_value
          @state.following.pop
          @adaptor.add_child( root_0, comp_value308.tree )
          # --> action

          			return_value.key = ( reference306.nil? ? nil : reference306.val )
          			return_value.val = { '_context' => 'constraint', '_type' => ( binary_comp307 && @input.to_s( binary_comp307.start, binary_comp307.stop ) ), '_value' => ( comp_value308.nil? ? nil : comp_value308.val ) }
          		
          # <-- action

        when 11
          root_0 = @adaptor.create_flat_list


          # at line 612:4: total_constraint
          @state.following.push( TOKENS_FOLLOWING_total_constraint_IN_constraint_statement_1805 )
          total_constraint309 = total_constraint
          @state.following.pop
          @adaptor.add_child( root_0, total_constraint309.tree )

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
      string_literal310 = nil
      char_literal312 = nil
      __NUMBER314__ = nil
      total_statement311 = nil
      binary_comp313 = nil

      tree_for_string_literal310 = nil
      tree_for_char_literal312 = nil
      tree_for_NUMBER314 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 616:4: 'total(' total_statement ')' binary_comp NUMBER
        string_literal310 = match( T__58, TOKENS_FOLLOWING_T__58_IN_total_constraint_1816 )

        tree_for_string_literal310 = @adaptor.create_with_payload( string_literal310 )
        @adaptor.add_child( root_0, tree_for_string_literal310 )

        @state.following.push( TOKENS_FOLLOWING_total_statement_IN_total_constraint_1818 )
        total_statement311 = total_statement
        @state.following.pop
        @adaptor.add_child( root_0, total_statement311.tree )
        char_literal312 = match( T__38, TOKENS_FOLLOWING_T__38_IN_total_constraint_1820 )

        tree_for_char_literal312 = @adaptor.create_with_payload( char_literal312 )
        @adaptor.add_child( root_0, tree_for_char_literal312 )

        @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_total_constraint_1822 )
        binary_comp313 = binary_comp
        @state.following.pop
        @adaptor.add_child( root_0, binary_comp313.tree )
        __NUMBER314__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_total_constraint_1824 )

        tree_for_NUMBER314 = @adaptor.create_with_payload( __NUMBER314__ )
        @adaptor.add_child( root_0, tree_for_NUMBER314 )

        # - - - - - - - rule clean up - - - - - - - -
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
      reference315 = nil
      equals_op316 = nil
      value317 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 620:4: reference equals_op value
        @state.following.push( TOKENS_FOLLOWING_reference_IN_total_statement_1835 )
        reference315 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference315.tree )
        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_total_statement_1837 )
        equals_op316 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op316.tree )
        @state.following.push( TOKENS_FOLLOWING_value_IN_total_statement_1839 )
        value317 = value
        @state.following.pop
        @adaptor.add_child( root_0, value317.tree )
        # - - - - - - - rule clean up - - - - - - - -
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
      __NUMBER318__ = nil
      reference319 = nil

      tree_for_NUMBER318 = nil

      begin
        # at line 624:2: ( NUMBER | reference )
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


          # at line 624:4: NUMBER
          __NUMBER318__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_comp_value_1854 )

          tree_for_NUMBER318 = @adaptor.create_with_payload( __NUMBER318__ )
          @adaptor.add_child( root_0, tree_for_NUMBER318 )

          # --> action
          	return_value.val = __NUMBER318__.text.to_i	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 626:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_comp_value_1863 )
          reference319 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference319.tree )
          # --> action
          	return_value.val = ( reference319.nil? ? nil : reference319.val )	
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
      string_literal320 = nil
      __NL322__ = nil
      constraint_statement321 = nil
      conditional_constraint_then323 = nil

      tree_for_string_literal320 = nil
      tree_for_NL322 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 631:4: 'if' constraint_statement ( NL )* conditional_constraint_then
        string_literal320 = match( T__28, TOKENS_FOLLOWING_T__28_IN_conditional_constraint_1882 )

        tree_for_string_literal320 = @adaptor.create_with_payload( string_literal320 )
        @adaptor.add_child( root_0, tree_for_string_literal320 )

        # --> action

        			return_value.key = id = self.next_id.to_s
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'or'
        			}
        			@now = @now[id]
        		
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_1890 )
        constraint_statement321 = constraint_statement
        @state.following.pop
        @adaptor.add_child( root_0, constraint_statement321.tree )
        # at line 640:24: ( NL )*
        while true # decision 120
          alt_120 = 2
          look_120_0 = @input.peek( 1 )

          if ( look_120_0 == NL )
            alt_120 = 1

          end
          case alt_120
          when 1
            # at line 640:24: NL
            __NL322__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditional_constraint_1892 )

            tree_for_NL322 = @adaptor.create_with_payload( __NL322__ )
            @adaptor.add_child( root_0, tree_for_NL322 )


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
        			@now[id][( constraint_statement321.nil? ? nil : constraint_statement321.key )] = ( constraint_statement321.nil? ? nil : constraint_statement321.val )
        		
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_conditional_constraint_then_IN_conditional_constraint_1901 )
        conditional_constraint_then323 = conditional_constraint_then
        @state.following.pop
        @adaptor.add_child( root_0, conditional_constraint_then323.tree )
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
      string_literal324 = nil
      constraint_statement325 = nil

      tree_for_string_literal324 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 654:4: 'then' constraint_statement
        string_literal324 = match( T__29, TOKENS_FOLLOWING_T__29_IN_conditional_constraint_then_1916 )

        tree_for_string_literal324 = @adaptor.create_with_payload( string_literal324 )
        @adaptor.add_child( root_0, tree_for_string_literal324 )

        @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_1918 )
        constraint_statement325 = constraint_statement
        @state.following.pop
        @adaptor.add_child( root_0, constraint_statement325.tree )
        # --> action

        			id = self.next_id
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'and'
        			}
        			@now[id][( constraint_statement325.nil? ? nil : constraint_statement325.key )] = ( constraint_statement325.nil? ? nil : constraint_statement325.val )
        		
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
      __NL328__ = nil
      mutation_statement326 = nil
      mutation_iterator327 = nil

      tree_for_NL328 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 666:4: ( ( mutation_statement | mutation_iterator ) ( NL )+ )*
        # at line 666:4: ( ( mutation_statement | mutation_iterator ) ( NL )+ )*
        while true # decision 123
          alt_123 = 2
          look_123_0 = @input.peek( 1 )

          if ( look_123_0 == ID || look_123_0 == T__47 || look_123_0 == T__60 )
            alt_123 = 1

          end
          case alt_123
          when 1
            # at line 667:4: ( mutation_statement | mutation_iterator ) ( NL )+
            # at line 667:4: ( mutation_statement | mutation_iterator )
            alt_121 = 2
            look_121_0 = @input.peek( 1 )

            if ( look_121_0 == ID || look_121_0 == T__60 )
              alt_121 = 1
            elsif ( look_121_0 == T__47 )
              alt_121 = 2
            else
              raise NoViableAlternative( "", 121, 0 )
            end
            case alt_121
            when 1
              # at line 667:6: mutation_statement
              @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_mutation_body_1940 )
              mutation_statement326 = mutation_statement
              @state.following.pop
              @adaptor.add_child( root_0, mutation_statement326.tree )
              # --> action
              	@now[( mutation_statement326.nil? ? nil : mutation_statement326.key )] = ( mutation_statement326.nil? ? nil : mutation_statement326.val )	
              # <-- action

            when 2
              # at line 669:6: mutation_iterator
              @state.following.push( TOKENS_FOLLOWING_mutation_iterator_IN_mutation_body_1953 )
              mutation_iterator327 = mutation_iterator
              @state.following.pop
              @adaptor.add_child( root_0, mutation_iterator327.tree )

            end
            # at file 671:3: ( NL )+
            match_count_122 = 0
            while true
              alt_122 = 2
              look_122_0 = @input.peek( 1 )

              if ( look_122_0 == NL )
                alt_122 = 1

              end
              case alt_122
              when 1
                # at line 671:3: NL
                __NL328__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_body_1962 )

                tree_for_NL328 = @adaptor.create_with_payload( __NL328__ )
                @adaptor.add_child( root_0, tree_for_NL328 )


              else
                match_count_122 > 0 and break
                eee = EarlyExit(122)


                raise eee
              end
              match_count_122 += 1
            end


          else
            break # out of loop for decision 123
          end
        end # loop for decision 123
        # - - - - - - - rule clean up - - - - - - - -
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
      string_literal329 = nil
      string_literal331 = nil
      __ID332__ = nil
      __NL333__ = nil
      char_literal334 = nil
      __NL335__ = nil
      __NL337__ = nil
      char_literal338 = nil
      path330 = nil
      mutation_statement336 = nil

      tree_for_string_literal329 = nil
      tree_for_string_literal331 = nil
      tree_for_ID332 = nil
      tree_for_NL333 = nil
      tree_for_char_literal334 = nil
      tree_for_NL335 = nil
      tree_for_NL337 = nil
      tree_for_char_literal338 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 675:4: 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( mutation_statement ( NL )+ )* '}'
        string_literal329 = match( T__47, TOKENS_FOLLOWING_T__47_IN_mutation_iterator_1977 )

        tree_for_string_literal329 = @adaptor.create_with_payload( string_literal329 )
        @adaptor.add_child( root_0, tree_for_string_literal329 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_iterator_1979 )
        path330 = path
        @state.following.pop
        @adaptor.add_child( root_0, path330.tree )
        string_literal331 = match( T__48, TOKENS_FOLLOWING_T__48_IN_mutation_iterator_1981 )

        tree_for_string_literal331 = @adaptor.create_with_payload( string_literal331 )
        @adaptor.add_child( root_0, tree_for_string_literal331 )

        __ID332__ = match( ID, TOKENS_FOLLOWING_ID_IN_mutation_iterator_1983 )

        tree_for_ID332 = @adaptor.create_with_payload( __ID332__ )
        @adaptor.add_child( root_0, tree_for_ID332 )

        # at line 675:27: ( NL )*
        while true # decision 124
          alt_124 = 2
          look_124_0 = @input.peek( 1 )

          if ( look_124_0 == NL )
            alt_124 = 1

          end
          case alt_124
          when 1
            # at line 675:27: NL
            __NL333__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_1985 )

            tree_for_NL333 = @adaptor.create_with_payload( __NL333__ )
            @adaptor.add_child( root_0, tree_for_NL333 )


          else
            break # out of loop for decision 124
          end
        end # loop for decision 124
        char_literal334 = match( T__20, TOKENS_FOLLOWING_T__20_IN_mutation_iterator_1988 )

        tree_for_char_literal334 = @adaptor.create_with_payload( char_literal334 )
        @adaptor.add_child( root_0, tree_for_char_literal334 )

        # at file 675:35: ( NL )+
        match_count_125 = 0
        while true
          alt_125 = 2
          look_125_0 = @input.peek( 1 )

          if ( look_125_0 == NL )
            alt_125 = 1

          end
          case alt_125
          when 1
            # at line 675:35: NL
            __NL335__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_1990 )

            tree_for_NL335 = @adaptor.create_with_payload( __NL335__ )
            @adaptor.add_child( root_0, tree_for_NL335 )


          else
            match_count_125 > 0 and break
            eee = EarlyExit(125)


            raise eee
          end
          match_count_125 += 1
        end

        # --> action

        			id = self.to_ref(( path330 && @input.to_s( path330.start, path330.stop ) ))
        			@now[id] = { '_parent' => @now,
        				'_context' => 'iterator',
        				'_self' => id,
        				'_variable' => __ID332__.text
        			}
        			@now = @now[id]
        		
        # <-- action
        # at line 685:3: ( mutation_statement ( NL )+ )*
        while true # decision 127
          alt_127 = 2
          look_127_0 = @input.peek( 1 )

          if ( look_127_0 == ID || look_127_0 == T__60 )
            alt_127 = 1

          end
          case alt_127
          when 1
            # at line 685:4: mutation_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_mutation_iterator_2000 )
            mutation_statement336 = mutation_statement
            @state.following.pop
            @adaptor.add_child( root_0, mutation_statement336.tree )
            # --> action
            	@now[( mutation_statement336.nil? ? nil : mutation_statement336.key )] = ( mutation_statement336.nil? ? nil : mutation_statement336.val )	
            # <-- action
            # at file 687:3: ( NL )+
            match_count_126 = 0
            while true
              alt_126 = 2
              look_126_0 = @input.peek( 1 )

              if ( look_126_0 == NL )
                alt_126 = 1

              end
              case alt_126
              when 1
                # at line 687:3: NL
                __NL337__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_2008 )

                tree_for_NL337 = @adaptor.create_with_payload( __NL337__ )
                @adaptor.add_child( root_0, tree_for_NL337 )


              else
                match_count_126 > 0 and break
                eee = EarlyExit(126)


                raise eee
              end
              match_count_126 += 1
            end


          else
            break # out of loop for decision 127
          end
        end # loop for decision 127
        char_literal338 = match( T__21, TOKENS_FOLLOWING_T__21_IN_mutation_iterator_2015 )

        tree_for_char_literal338 = @adaptor.create_with_payload( char_literal338 )
        @adaptor.add_child( root_0, tree_for_char_literal338 )

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
      __NULL344__ = nil
      __NUMBER347__ = nil
      string_literal349 = nil
      string_literal350 = nil
      string_literal353 = nil
      string_literal356 = nil
      char_literal358 = nil
      string_literal360 = nil
      char_literal362 = nil
      reference339 = nil
      equals_op340 = nil
      value341 = nil
      reference342 = nil
      equals_op343 = nil
      reference345 = nil
      binary_op346 = nil
      reference348 = nil
      path351 = nil
      object_body352 = nil
      path354 = nil
      reference355 = nil
      value357 = nil
      reference359 = nil
      value361 = nil

      tree_for_NULL344 = nil
      tree_for_NUMBER347 = nil
      tree_for_string_literal349 = nil
      tree_for_string_literal350 = nil
      tree_for_string_literal353 = nil
      tree_for_string_literal356 = nil
      tree_for_char_literal358 = nil
      tree_for_string_literal360 = nil
      tree_for_char_literal362 = nil

      begin
        # at line 693:2: ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' )
        alt_129 = 7
        alt_129 = @dfa129.predict( @input )
        case alt_129
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 693:4: reference equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2034 )
          reference339 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference339.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_mutation_statement_2036 )
          equals_op340 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op340.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_2038 )
          value341 = value
          @state.following.pop
          @adaptor.add_child( root_0, value341.tree )
          # --> action

          			return_value.key = ( reference339.nil? ? nil : reference339.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'equals',
          				'_value' => ( value341.nil? ? nil : value341.val )
          			}
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 701:4: reference equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2047 )
          reference342 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference342.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_mutation_statement_2049 )
          equals_op343 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op343.tree )
          __NULL344__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_mutation_statement_2051 )

          tree_for_NULL344 = @adaptor.create_with_payload( __NULL344__ )
          @adaptor.add_child( root_0, tree_for_NULL344 )

          # --> action

          			return_value.key = ( reference342.nil? ? nil : reference342.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'equals',
          				'_value' => self.null_value
          			}
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 709:4: reference binary_op NUMBER
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2060 )
          reference345 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference345.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_op_IN_mutation_statement_2062 )
          binary_op346 = binary_op
          @state.following.pop
          @adaptor.add_child( root_0, binary_op346.tree )
          __NUMBER347__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_mutation_statement_2064 )

          tree_for_NUMBER347 = @adaptor.create_with_payload( __NUMBER347__ )
          @adaptor.add_child( root_0, tree_for_NUMBER347 )

          # --> action

          			return_value.key = ( reference345.nil? ? nil : reference345.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => ( binary_op346 && @input.to_s( binary_op346.start, binary_op346.stop ) ),
          				'_value' => __NUMBER347__.text.to_i
          			}
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 717:4: reference 'is' 'new' path ( object_body )?
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2073 )
          reference348 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference348.tree )
          string_literal349 = match( T__55, TOKENS_FOLLOWING_T__55_IN_mutation_statement_2075 )

          tree_for_string_literal349 = @adaptor.create_with_payload( string_literal349 )
          @adaptor.add_child( root_0, tree_for_string_literal349 )

          string_literal350 = match( T__59, TOKENS_FOLLOWING_T__59_IN_mutation_statement_2077 )

          tree_for_string_literal350 = @adaptor.create_with_payload( string_literal350 )
          @adaptor.add_child( root_0, tree_for_string_literal350 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_statement_2079 )
          path351 = path
          @state.following.pop
          @adaptor.add_child( root_0, path351.tree )
          # --> action

          			id = '_' + self.next_id
          			@now[id] = { '_self' => id,
          				'_context' => 'object',
          				'_isa' => self.to_ref(( path351 && @input.to_s( path351.start, path351.stop ) )),
          				'_parent' => @now
          			}
          			@now = @now[id]
          		
          # <-- action
          # at line 727:3: ( object_body )?
          alt_128 = 2
          look_128_0 = @input.peek( 1 )

          if ( look_128_0 == T__20 )
            alt_128 = 1
          end
          case alt_128
          when 1
            # at line 727:3: object_body
            @state.following.push( TOKENS_FOLLOWING_object_body_IN_mutation_statement_2087 )
            object_body352 = object_body
            @state.following.pop
            @adaptor.add_child( root_0, object_body352.tree )

          end
          # --> action

          			n = self.goto_parent()
          			@now.delete(n['_self'])
          			return_value.key = ( reference348.nil? ? nil : reference348.val )
          			return_value.val = n
          		
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 734:4: 'delete' path
          string_literal353 = match( T__60, TOKENS_FOLLOWING_T__60_IN_mutation_statement_2097 )

          tree_for_string_literal353 = @adaptor.create_with_payload( string_literal353 )
          @adaptor.add_child( root_0, tree_for_string_literal353 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_statement_2099 )
          path354 = path
          @state.following.pop
          @adaptor.add_child( root_0, path354.tree )
          # --> action

          			id = '_' + self.next_id
          			@now[id] = { '_self' => id,
          				'_context' => 'mutation',
          				'_type' => 'delete',
          				'_value' => self.to_ref(( path354 && @input.to_s( path354.start, path354.stop ) ))
          			}
          		
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 743:4: reference 'add(' value ')'
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2108 )
          reference355 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference355.tree )
          string_literal356 = match( T__61, TOKENS_FOLLOWING_T__61_IN_mutation_statement_2110 )

          tree_for_string_literal356 = @adaptor.create_with_payload( string_literal356 )
          @adaptor.add_child( root_0, tree_for_string_literal356 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_2112 )
          value357 = value
          @state.following.pop
          @adaptor.add_child( root_0, value357.tree )
          char_literal358 = match( T__38, TOKENS_FOLLOWING_T__38_IN_mutation_statement_2114 )

          tree_for_char_literal358 = @adaptor.create_with_payload( char_literal358 )
          @adaptor.add_child( root_0, tree_for_char_literal358 )

          # --> action

          			return_value.key = ( reference355.nil? ? nil : reference355.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'add',
          				'_value' => ( value357.nil? ? nil : value357.val )
          			}
          		
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 751:4: reference 'remove(' value ')'
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2123 )
          reference359 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference359.tree )
          string_literal360 = match( T__62, TOKENS_FOLLOWING_T__62_IN_mutation_statement_2125 )

          tree_for_string_literal360 = @adaptor.create_with_payload( string_literal360 )
          @adaptor.add_child( root_0, tree_for_string_literal360 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_2127 )
          value361 = value
          @state.following.pop
          @adaptor.add_child( root_0, value361.tree )
          char_literal362 = match( T__38, TOKENS_FOLLOWING_T__38_IN_mutation_statement_2129 )

          tree_for_char_literal362 = @adaptor.create_with_payload( char_literal362 )
          @adaptor.add_child( root_0, tree_for_char_literal362 )

          # --> action

          			return_value.key = ( reference359.nil? ? nil : reference359.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'remove',
          				'_value' => ( value361.nil? ? nil : value361.val )
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
      char_literal363 = nil
      char_literal365 = nil
      char_literal367 = nil
      set_item364 = nil
      set_item366 = nil

      tree_for_char_literal363 = nil
      tree_for_char_literal365 = nil
      tree_for_char_literal367 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 762:4: '(' ( set_item ( ',' set_item )* )? ')'
        char_literal363 = match( T__36, TOKENS_FOLLOWING_T__36_IN_set_value_2148 )

        tree_for_char_literal363 = @adaptor.create_with_payload( char_literal363 )
        @adaptor.add_child( root_0, tree_for_char_literal363 )

        # --> action
        	@set = Array.new	
        # <-- action
        # at line 764:3: ( set_item ( ',' set_item )* )?
        alt_131 = 2
        look_131_0 = @input.peek( 1 )

        if ( look_131_0.between?( STRING, NUMBER ) || look_131_0.between?( BOOLEAN, MULTILINE_STRING ) || look_131_0 == T__36 )
          alt_131 = 1
        end
        case alt_131
        when 1
          # at line 764:4: set_item ( ',' set_item )*
          @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_2157 )
          set_item364 = set_item
          @state.following.pop
          @adaptor.add_child( root_0, set_item364.tree )
          # at line 764:13: ( ',' set_item )*
          while true # decision 130
            alt_130 = 2
            look_130_0 = @input.peek( 1 )

            if ( look_130_0 == T__37 )
              alt_130 = 1

            end
            case alt_130
            when 1
              # at line 764:14: ',' set_item
              char_literal365 = match( T__37, TOKENS_FOLLOWING_T__37_IN_set_value_2160 )

              tree_for_char_literal365 = @adaptor.create_with_payload( char_literal365 )
              @adaptor.add_child( root_0, tree_for_char_literal365 )

              @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_2162 )
              set_item366 = set_item
              @state.following.pop
              @adaptor.add_child( root_0, set_item366.tree )

            else
              break # out of loop for decision 130
            end
          end # loop for decision 130

        end
        # --> action
        	return_value.val = @set	
        # <-- action
        char_literal367 = match( T__38, TOKENS_FOLLOWING_T__38_IN_set_value_2174 )

        tree_for_char_literal367 = @adaptor.create_with_payload( char_literal367 )
        @adaptor.add_child( root_0, tree_for_char_literal367 )

        # - - - - - - - rule clean up - - - - - - - -
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
      value368 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 770:4: value
        @state.following.push( TOKENS_FOLLOWING_value_IN_set_item_2185 )
        value368 = value
        @state.following.pop
        @adaptor.add_child( root_0, value368.tree )
        # --> action
        	@set.push(( value368.nil? ? nil : value368.val ))	
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
      primitive_value369 = nil
      reference370 = nil
      set_value371 = nil


      begin
        # at line 775:2: ( primitive_value | reference | set_value )
        alt_132 = 3
        case look_132 = @input.peek( 1 )
        when STRING, NUMBER, BOOLEAN, MULTILINE_STRING then alt_132 = 1
        when ID then alt_132 = 2
        when T__36 then alt_132 = 3
        else
          raise NoViableAlternative( "", 132, 0 )
        end
        case alt_132
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 775:4: primitive_value
          @state.following.push( TOKENS_FOLLOWING_primitive_value_IN_value_2204 )
          primitive_value369 = primitive_value
          @state.following.pop
          @adaptor.add_child( root_0, primitive_value369.tree )
          # --> action

          			return_value.val = ( primitive_value369.nil? ? nil : primitive_value369.val )
          			return_value.type = ( primitive_value369.nil? ? nil : primitive_value369.type )
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 780:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_value_2213 )
          reference370 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference370.tree )
          # --> action

          			return_value.val = ( reference370.nil? ? nil : reference370.val )
          			return_value.type = 'Reference'
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 785:4: set_value
          @state.following.push( TOKENS_FOLLOWING_set_value_IN_value_2222 )
          set_value371 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value371.tree )
          # --> action

          			return_value.val = ( set_value371.nil? ? nil : set_value371.val )
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
      __BOOLEAN372__ = nil
      __NUMBER373__ = nil
      __STRING374__ = nil
      __MULTILINE_STRING375__ = nil

      tree_for_BOOLEAN372 = nil
      tree_for_NUMBER373 = nil
      tree_for_STRING374 = nil
      tree_for_MULTILINE_STRING375 = nil

      begin
        # at line 793:2: ( BOOLEAN | NUMBER | STRING | MULTILINE_STRING )
        alt_133 = 4
        case look_133 = @input.peek( 1 )
        when BOOLEAN then alt_133 = 1
        when NUMBER then alt_133 = 2
        when STRING then alt_133 = 3
        when MULTILINE_STRING then alt_133 = 4
        else
          raise NoViableAlternative( "", 133, 0 )
        end
        case alt_133
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 793:4: BOOLEAN
          __BOOLEAN372__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_2241 )

          tree_for_BOOLEAN372 = @adaptor.create_with_payload( __BOOLEAN372__ )
          @adaptor.add_child( root_0, tree_for_BOOLEAN372 )

          # --> action

          			if __BOOLEAN372__.text == 'true' or __BOOLEAN372__.text == 'on' or __BOOLEAN372__.text == 'yes'
          				return_value.val = true
          			else  # 'false', 'no', 'off'
          				return_value.val = false
          			end
          			return_value.type = 'Boolean'
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 802:4: NUMBER
          __NUMBER373__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_primitive_value_2250 )

          tree_for_NUMBER373 = @adaptor.create_with_payload( __NUMBER373__ )
          @adaptor.add_child( root_0, tree_for_NUMBER373 )

          # --> action

          			return_value.val = __NUMBER373__.text.to_i
          			return_value.type = 'Number'
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 807:4: STRING
          __STRING374__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_primitive_value_2259 )

          tree_for_STRING374 = @adaptor.create_with_payload( __STRING374__ )
          @adaptor.add_child( root_0, tree_for_STRING374 )

          # --> action

          			return_value.val = __STRING374__.text[1,__STRING374__.text.length-2]
          			return_value.type = 'String'
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 812:4: MULTILINE_STRING
          __MULTILINE_STRING375__ = match( MULTILINE_STRING, TOKENS_FOLLOWING_MULTILINE_STRING_IN_primitive_value_2268 )

          tree_for_MULTILINE_STRING375 = @adaptor.create_with_payload( __MULTILINE_STRING375__ )
          @adaptor.add_child( root_0, tree_for_MULTILINE_STRING375 )

          # --> action

          			return_value.val = __MULTILINE_STRING375__.text[2, __MULTILINE_STRING375__.text.length-2]
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
      __ID376__ = nil
      char_literal377 = nil
      __ID378__ = nil

      tree_for_ID376 = nil
      tree_for_char_literal377 = nil
      tree_for_ID378 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 820:4: ID ( '.' ID )*
        __ID376__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_2283 )

        tree_for_ID376 = @adaptor.create_with_payload( __ID376__ )
        @adaptor.add_child( root_0, tree_for_ID376 )

        # at line 820:6: ( '.' ID )*
        while true # decision 134
          alt_134 = 2
          look_134_0 = @input.peek( 1 )

          if ( look_134_0 == T__63 )
            alt_134 = 1

          end
          case alt_134
          when 1
            # at line 820:7: '.' ID
            char_literal377 = match( T__63, TOKENS_FOLLOWING_T__63_IN_path_2285 )

            tree_for_char_literal377 = @adaptor.create_with_payload( char_literal377 )
            @adaptor.add_child( root_0, tree_for_char_literal377 )

            __ID378__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_2286 )

            tree_for_ID378 = @adaptor.create_with_payload( __ID378__ )
            @adaptor.add_child( root_0, tree_for_ID378 )


          else
            break # out of loop for decision 134
          end
        end # loop for decision 134
        # - - - - - - - rule clean up - - - - - - - -
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
      char_literal380 = nil
      id_ref379 = nil
      id_ref381 = nil

      tree_for_char_literal380 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 824:4: id_ref ( '.' id_ref )*
        @state.following.push( TOKENS_FOLLOWING_id_ref_IN_path_with_index_2299 )
        id_ref379 = id_ref
        @state.following.pop
        @adaptor.add_child( root_0, id_ref379.tree )
        # at line 824:10: ( '.' id_ref )*
        while true # decision 135
          alt_135 = 2
          look_135_0 = @input.peek( 1 )

          if ( look_135_0 == T__63 )
            alt_135 = 1

          end
          case alt_135
          when 1
            # at line 824:11: '.' id_ref
            char_literal380 = match( T__63, TOKENS_FOLLOWING_T__63_IN_path_with_index_2301 )

            tree_for_char_literal380 = @adaptor.create_with_payload( char_literal380 )
            @adaptor.add_child( root_0, tree_for_char_literal380 )

            @state.following.push( TOKENS_FOLLOWING_id_ref_IN_path_with_index_2302 )
            id_ref381 = id_ref
            @state.following.pop
            @adaptor.add_child( root_0, id_ref381.tree )

          else
            break # out of loop for decision 135
          end
        end # loop for decision 135
        # - - - - - - - rule clean up - - - - - - - -
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
      __ID382__ = nil
      char_literal383 = nil
      __NUMBER384__ = nil
      char_literal385 = nil

      tree_for_ID382 = nil
      tree_for_char_literal383 = nil
      tree_for_NUMBER384 = nil
      tree_for_char_literal385 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 828:4: ID ( '[' NUMBER ']' )?
        __ID382__ = match( ID, TOKENS_FOLLOWING_ID_IN_id_ref_2315 )

        tree_for_ID382 = @adaptor.create_with_payload( __ID382__ )
        @adaptor.add_child( root_0, tree_for_ID382 )

        # at line 828:6: ( '[' NUMBER ']' )?
        alt_136 = 2
        look_136_0 = @input.peek( 1 )

        if ( look_136_0 == T__26 )
          alt_136 = 1
        end
        case alt_136
        when 1
          # at line 828:7: '[' NUMBER ']'
          char_literal383 = match( T__26, TOKENS_FOLLOWING_T__26_IN_id_ref_2317 )

          tree_for_char_literal383 = @adaptor.create_with_payload( char_literal383 )
          @adaptor.add_child( root_0, tree_for_char_literal383 )

          __NUMBER384__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_id_ref_2319 )

          tree_for_NUMBER384 = @adaptor.create_with_payload( __NUMBER384__ )
          @adaptor.add_child( root_0, tree_for_NUMBER384 )

          char_literal385 = match( T__27, TOKENS_FOLLOWING_T__27_IN_id_ref_2321 )

          tree_for_char_literal385 = @adaptor.create_with_payload( char_literal385 )
          @adaptor.add_child( root_0, tree_for_char_literal385 )


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
      path_with_index386 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 832:4: path_with_index
        @state.following.push( TOKENS_FOLLOWING_path_with_index_IN_reference_2338 )
        path_with_index386 = path_with_index
        @state.following.pop
        @adaptor.add_child( root_0, path_with_index386.tree )
        # --> action
        	return_value.val = self.to_ref(( path_with_index386 && @input.to_s( path_with_index386.start, path_with_index386.stop ) ))	
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
      string_literal387 = nil
      path388 = nil

      tree_for_string_literal387 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 837:4: 'isref' path
        string_literal387 = match( T__64, TOKENS_FOLLOWING_T__64_IN_reference_type_2357 )

        tree_for_string_literal387 = @adaptor.create_with_payload( string_literal387 )
        @adaptor.add_child( root_0, tree_for_string_literal387 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_reference_type_2359 )
        path388 = path
        @state.following.pop
        @adaptor.add_child( root_0, path388.tree )
        # --> action

        			return_value.val = { '_context' => 'null',
        				'_isa' => self.to_ref(( path388 && @input.to_s( path388.start, path388.stop ) ))
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
      string_literal389 = nil
      path390 = nil

      tree_for_string_literal389 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 846:4: 'isset' path
        string_literal389 = match( T__65, TOKENS_FOLLOWING_T__65_IN_set_type_2378 )

        tree_for_string_literal389 = @adaptor.create_with_payload( string_literal389 )
        @adaptor.add_child( root_0, tree_for_string_literal389 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_set_type_2380 )
        path390 = path
        @state.following.pop
        @adaptor.add_child( root_0, path390.tree )
        # --> action

        			return_value.val = { '_context' => 'set',
        				'_isa' => self.to_ref(( path390 && @input.to_s( path390.start, path390.stop ) )),
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
      set391 = nil

      tree_for_set391 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set391 = @input.look
        if @input.peek(1) == T__52 || @input.peek(1) == T__55
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set391 ) )
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
      set392 = nil

      tree_for_set392 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set392 = @input.look
        if @input.peek(1) == T__57 || @input.peek(1) == T__66
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set392 ) )
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
      set393 = nil

      tree_for_set393 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set393 = @input.look
        if @input.peek( 1 ).between?( T__67, T__70 )
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
      set394 = nil

      tree_for_set394 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set394 = @input.look
        if @input.peek( 1 ).between?( T__71, T__74 )
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
        # trace_out( __method__, 57 )

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
      MAX = unpack( 1, 58, 1, 74, 3, -1, 1, 6, 1, 58, 1, -1, 1, 74 )
      ACCEPT = unpack( 2, -1, 1, 1, 1, 3, 1, 4, 2, -1, 1, 2, 1, -1 )
      SPECIAL = unpack( 9, -1 )
      TRANSITION = [
        unpack( 1, 1, 21, -1, 1, 2, 18, -1, 1, 3, 1, -1, 3, 4, 2, -1, 1, 
                2, 3, -1, 1, 2 ),
        unpack( 1, 6, 15, -1, 1, 7, 5, -1, 1, 2, 25, -1, 1, 2, 1, -1, 4, 
                 2, 5, -1, 1, 5, 2, -1, 1, 2, 4, -1, 4, 2 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 8 ),
        unpack( 1, 6, 1, -1, 1, 2, 13, -1, 1, 7, 1, 2, 6, -1, 1, 2, 13, 
                 -1, 6, 2, 1, -1, 3, 2, 2, -1, 1, 2, 3, -1, 1, 2 ),
        unpack(  ),
        unpack( 1, 6, 15, -1, 1, 7, 5, -1, 1, 2, 25, -1, 1, 2, 1, -1, 4, 
                 2, 5, -1, 1, 5, 2, -1, 1, 2, 4, -1, 4, 2 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 70
      

      def description
        <<-'__dfa_description__'.strip!
          327:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification )
        __dfa_description__
      end
    end
    class DFA98 < ANTLR3::DFA
      EOT = unpack( 9, -1 )
      EOF = unpack( 9, -1 )
      MIN = unpack( 1, 6, 1, 4, 3, -1, 1, 6, 1, 4, 1, -1, 1, 4 )
      MAX = unpack( 1, 58, 1, 74, 3, -1, 1, 6, 1, 58, 1, -1, 1, 74 )
      ACCEPT = unpack( 2, -1, 1, 1, 1, 3, 1, 4, 2, -1, 1, 2, 1, -1 )
      SPECIAL = unpack( 9, -1 )
      TRANSITION = [
        unpack( 1, 1, 21, -1, 1, 2, 18, -1, 1, 3, 1, -1, 3, 4, 2, -1, 1, 
                2, 3, -1, 1, 2 ),
        unpack( 1, 6, 15, -1, 1, 7, 5, -1, 1, 2, 25, -1, 1, 2, 1, -1, 4, 
                 2, 5, -1, 1, 5, 2, -1, 1, 2, 4, -1, 4, 2 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 8 ),
        unpack( 1, 6, 1, -1, 1, 2, 13, -1, 1, 7, 1, 2, 6, -1, 1, 2, 18, 
                 -1, 1, 2, 1, -1, 3, 2, 2, -1, 1, 2, 3, -1, 1, 2 ),
        unpack(  ),
        unpack( 1, 6, 15, -1, 1, 7, 5, -1, 1, 2, 25, -1, 1, 2, 1, -1, 4, 
                 2, 5, -1, 1, 5, 2, -1, 1, 2, 4, -1, 4, 2 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 98
      

      def description
        <<-'__dfa_description__'.strip!
          432:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification )
        __dfa_description__
      end
    end
    class DFA118 < ANTLR3::DFA
      EOT = unpack( 25, -1 )
      EOF = unpack( 25, -1 )
      MIN = unpack( 1, 6, 1, 4, 3, -1, 1, 7, 1, 6, 1, -1, 3, 5, 1, -1, 1, 
                    5, 2, -1, 1, 27, 1, 4, 4, -1, 1, 4, 1, 7, 1, 27, 1, 
                    4 )
      MAX = unpack( 1, 58, 1, 74, 3, -1, 1, 7, 1, 6, 1, -1, 2, 56, 1, 36, 
                    1, -1, 1, 36, 2, -1, 1, 27, 1, 74, 4, -1, 1, 74, 1, 
                    7, 1, 27, 1, 74 )
      ACCEPT = unpack( 2, -1, 1, 2, 1, 7, 1, 11, 2, -1, 1, 1, 3, -1, 1, 
                       8, 1, -1, 1, 9, 1, 10, 2, -1, 1, 3, 1, 4, 1, 5, 1, 
                       6, 4, -1 )
      SPECIAL = unpack( 25, -1 )
      TRANSITION = [
        unpack( 1, 1, 21, -1, 1, 3, 25, -1, 1, 2, 3, -1, 1, 4 ),
        unpack( 1, 7, 21, -1, 1, 5, 2, -1, 1, 7, 22, -1, 1, 10, 1, -1, 
                 1, 13, 1, 8, 1, 11, 1, 9, 5, -1, 1, 6, 2, -1, 1, 12, 4, 
                 -1, 4, 14 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 15 ),
        unpack( 1, 16 ),
        unpack(  ),
        unpack( 3, 17, 1, 18, 2, 17, 25, -1, 1, 17, 19, -1, 1, 11 ),
        unpack( 3, 19, 1, 20, 2, 19, 25, -1, 1, 19, 19, -1, 1, 13 ),
        unpack( 3, 17, 1, 18, 2, 17, 25, -1, 1, 17 ),
        unpack(  ),
        unpack( 3, 19, 1, 20, 2, 19, 25, -1, 1, 19 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 21 ),
        unpack( 1, 7, 21, -1, 1, 22, 2, -1, 1, 7, 22, -1, 1, 10, 1, -1, 
                 1, 13, 1, 8, 1, 11, 1, 9, 5, -1, 1, 6, 2, -1, 1, 12, 4, 
                 -1, 4, 14 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 7, 24, -1, 1, 7, 22, -1, 1, 10, 1, -1, 1, 13, 1, 8, 
                 1, 11, 1, 9, 5, -1, 1, 6, 2, -1, 1, 12, 4, -1, 4, 14 ),
        unpack( 1, 23 ),
        unpack( 1, 24 ),
        unpack( 1, 7, 24, -1, 1, 7, 22, -1, 1, 10, 1, -1, 1, 13, 1, 8, 
                 1, 11, 1, 9, 5, -1, 1, 6, 2, -1, 1, 12, 4, -1, 4, 14 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 118
      

      def description
        <<-'__dfa_description__'.strip!
          544:1: constraint_statement returns [key, val] : ( reference | 'not' reference | reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | conditional_constraint | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | reference binary_comp comp_value | total_constraint );
        __dfa_description__
      end
    end
    class DFA129 < ANTLR3::DFA
      EOT = unpack( 19, -1 )
      EOF = unpack( 19, -1 )
      MIN = unpack( 1, 6, 1, 26, 1, -1, 1, 7, 1, 6, 1, 5, 1, -1, 1, 5, 2, 
                    -1, 1, 27, 1, 26, 3, -1, 1, 52, 1, 7, 1, 27, 1, 52 )
      MAX = unpack( 1, 60, 1, 70, 1, -1, 1, 7, 1, 6, 1, 59, 1, -1, 1, 36, 
                    2, -1, 1, 27, 1, 70, 3, -1, 1, 70, 1, 7, 1, 27, 1, 70 )
      ACCEPT = unpack( 2, -1, 1, 5, 3, -1, 1, 3, 1, -1, 1, 6, 1, 7, 2, -1, 
                       1, 4, 1, 1, 1, 2, 4, -1 )
      SPECIAL = unpack( 19, -1 )
      TRANSITION = [
        unpack( 1, 1, 53, -1, 1, 2 ),
        unpack( 1, 3, 25, -1, 1, 7, 2, -1, 1, 5, 5, -1, 1, 8, 1, 9, 1, 
                 4, 3, -1, 4, 6 ),
        unpack(  ),
        unpack( 1, 10 ),
        unpack( 1, 11 ),
        unpack( 3, 13, 1, 14, 2, 13, 25, -1, 1, 13, 22, -1, 1, 12 ),
        unpack(  ),
        unpack( 3, 13, 1, 14, 2, 13, 25, -1, 1, 13 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 15 ),
        unpack( 1, 16, 25, -1, 1, 7, 2, -1, 1, 5, 5, -1, 1, 8, 1, 9, 1, 
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
      
      @decision = 129
      

      def description
        <<-'__dfa_description__'.strip!
          692:1: mutation_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' );
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
      @dfa129 = DFA129.new( self, 129 )

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
    TOKENS_FOLLOWING_ID_IN_attribute_308 = Set[ 52, 55 ]
    TOKENS_FOLLOWING_equals_op_IN_attribute_310 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_attribute_312 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_314 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_attribute_324 = Set[ 64 ]
    TOKENS_FOLLOWING_reference_type_IN_attribute_326 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_328 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_attribute_338 = Set[ 65 ]
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
    TOKENS_FOLLOWING_ID_IN_object_attribute_452 = Set[ 52, 55 ]
    TOKENS_FOLLOWING_equals_op_IN_object_attribute_454 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_object_attribute_456 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_object_attribute_458 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__28_IN_state_dependency_474 = Set[ 6 ]
    TOKENS_FOLLOWING_dep_effect_IN_state_dependency_478 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_480 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_T__29_IN_state_dependency_483 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_485 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_dependency_488 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 54, 58 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_492 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 54, 58 ]
    TOKENS_FOLLOWING_constraint_body_IN_state_dependency_495 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_dependency_500 = Set[ 4, 30 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_506 = Set[ 4, 30 ]
    TOKENS_FOLLOWING_T__30_IN_state_dependency_509 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_511 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_dependency_514 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 54, 58 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_518 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 54, 58 ]
    TOKENS_FOLLOWING_constraint_body_IN_state_dependency_521 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_dependency_525 = Set[ 4, 30 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_531 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_reference_IN_dep_effect_543 = Set[ 52, 55 ]
    TOKENS_FOLLOWING_equals_op_IN_dep_effect_545 = Set[ 5, 6, 7, 8, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_dep_effect_552 = Set[ 1 ]
    TOKENS_FOLLOWING_NULL_IN_dep_effect_558 = Set[ 1 ]
    TOKENS_FOLLOWING_T__31_IN_operator_574 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_operator_576 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_operator_578 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_NL_IN_operator_580 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_T__32_IN_operator_591 = Set[ 52, 55 ]
    TOKENS_FOLLOWING_equals_op_IN_operator_593 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_operator_595 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_operator_597 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_op_conditions_IN_operator_616 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_op_effects_IN_operator_619 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_operator_623 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_operator_625 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_op_param_641 = Set[ 52, 55 ]
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
    TOKENS_FOLLOWING_reference_IN_op_statement_735 = Set[ 52, 55 ]
    TOKENS_FOLLOWING_equals_op_IN_op_statement_737 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_op_statement_739 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_statement_741 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__35_IN_procedure_757 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_procedure_759 = Set[ 20, 36 ]
    TOKENS_FOLLOWING_parameters_IN_procedure_767 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_procedure_770 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_NL_IN_procedure_772 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_T__32_IN_procedure_780 = Set[ 52, 55 ]
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
    TOKENS_FOLLOWING_ID_IN_parameter_850 = Set[ 64 ]
    TOKENS_FOLLOWING_reference_type_IN_parameter_852 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_861 = Set[ 39 ]
    TOKENS_FOLLOWING_T__39_IN_parameter_863 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_parameter_865 = Set[ 1 ]
    TOKENS_FOLLOWING_T__33_IN_conditions_880 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_conditions_888 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 54, 58 ]
    TOKENS_FOLLOWING_NL_IN_conditions_890 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 54, 58 ]
    TOKENS_FOLLOWING_constraint_body_IN_conditions_893 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_conditions_895 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_conditions_897 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__34_IN_effects_914 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_effects_922 = Set[ 4, 6, 21, 47, 60 ]
    TOKENS_FOLLOWING_NL_IN_effects_924 = Set[ 4, 6, 21, 47, 60 ]
    TOKENS_FOLLOWING_mutation_body_IN_effects_930 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_effects_935 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_effects_937 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__40_IN_goal_constraint_953 = Set[ 4, 20, 41 ]
    TOKENS_FOLLOWING_T__41_IN_goal_constraint_955 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_constraint_958 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_constraint_967 = Set[ 4, 6, 21, 28, 42, 43, 44, 45, 46, 47, 49, 50, 51, 54, 58 ]
    TOKENS_FOLLOWING_NL_IN_goal_constraint_969 = Set[ 4, 6, 21, 28, 42, 43, 44, 45, 46, 47, 49, 50, 51, 54, 58 ]
    TOKENS_FOLLOWING_goal_body_IN_goal_constraint_972 = Set[ 6, 21, 28, 42, 43, 44, 45, 46, 47, 49, 50, 51, 54, 58 ]
    TOKENS_FOLLOWING_T__21_IN_goal_constraint_975 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_constraint_977 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_constraint_statement_IN_goal_body_1000 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_namespace_IN_goal_body_1013 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_iterator_IN_goal_body_1020 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_class_quantification_IN_goal_body_1027 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1036 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__42_IN_goal_body_1043 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1045 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1054 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 54, 58 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1056 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 54, 58 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1059 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1061 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1063 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__43_IN_goal_body_1073 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1075 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1084 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 54, 58 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1086 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 54, 58 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1089 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1091 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1093 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__44_IN_goal_body_1107 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_goal_body_1109 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1111 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1120 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 54, 58 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1122 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 54, 58 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1125 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1127 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1129 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__45_IN_goal_body_1139 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1141 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1150 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 54, 58 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1152 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 54, 58 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1155 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1157 = Set[ 4, 29, 44 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1159 = Set[ 4, 29, 44 ]
    TOKENS_FOLLOWING_T__29_IN_goal_body_1170 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__44_IN_goal_body_1177 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_goal_body_1179 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1191 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1200 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 54, 58 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1202 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 54, 58 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1205 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1207 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1209 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__46_IN_goal_body_1227 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1229 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1238 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 54, 58 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1240 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 54, 58 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1243 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1245 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1247 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_T__29_IN_goal_body_1256 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1258 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1267 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 54, 58 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1269 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 54, 58 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1272 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1274 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1276 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__20_IN_nested_constraint_1296 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 54, 58 ]
    TOKENS_FOLLOWING_NL_IN_nested_constraint_1298 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 54, 58 ]
    TOKENS_FOLLOWING_constraint_body_IN_nested_constraint_1301 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_nested_constraint_1303 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_constraint_1314 = Set[ 41 ]
    TOKENS_FOLLOWING_T__41_IN_constraint_1316 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_1324 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 54, 58 ]
    TOKENS_FOLLOWING_NL_IN_constraint_1326 = Set[ 4, 6, 21, 28, 47, 49, 50, 51, 54, 58 ]
    TOKENS_FOLLOWING_constraint_body_IN_constraint_1329 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_1331 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_1333 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_1356 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_namespace_IN_constraint_body_1369 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_iterator_IN_constraint_body_1376 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_class_quantification_IN_constraint_body_1383 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_body_1392 = Set[ 1, 4, 6, 28, 47, 49, 50, 51, 54, 58 ]
    TOKENS_FOLLOWING_path_IN_constraint_namespace_1406 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1408 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_namespace_1411 = Set[ 4, 6, 21, 28, 54, 58 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1413 = Set[ 4, 6, 21, 28, 54, 58 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_namespace_1417 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1425 = Set[ 4, 6, 21, 28, 54, 58 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_namespace_1430 = Set[ 1 ]
    TOKENS_FOLLOWING_T__47_IN_constraint_iterator_1441 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_constraint_iterator_1443 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_constraint_iterator_1445 = Set[ 48 ]
    TOKENS_FOLLOWING_T__48_IN_constraint_iterator_1447 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_constraint_iterator_1449 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_constraint_iterator_1451 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1453 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_iterator_1456 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1458 = Set[ 4, 6, 21, 28, 54, 58 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_iterator_1468 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1476 = Set[ 4, 6, 21, 28, 54, 58 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_iterator_1483 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_quantification_keyword_0 = Set[ 1 ]
    TOKENS_FOLLOWING_quantification_keyword_IN_constraint_class_quantification_1519 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_constraint_class_quantification_1521 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_constraint_class_quantification_1523 = Set[ 48 ]
    TOKENS_FOLLOWING_T__48_IN_constraint_class_quantification_1525 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_constraint_class_quantification_1527 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_constraint_class_quantification_1529 = Set[ 4, 20, 52, 71, 72, 73, 74 ]
    TOKENS_FOLLOWING_binary_comp_IN_constraint_class_quantification_1541 = Set[ 7 ]
    TOKENS_FOLLOWING_T__52_IN_constraint_class_quantification_1554 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_constraint_class_quantification_1570 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1584 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_class_quantification_1587 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1589 = Set[ 4, 6, 21, 28, 47, 53, 54, 58 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_class_quantification_1596 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1606 = Set[ 4, 6, 21, 28, 47, 53, 54, 58 ]
    TOKENS_FOLLOWING_constraint_different_IN_constraint_class_quantification_1613 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1615 = Set[ 4, 6, 21, 28, 47, 53, 54, 58 ]
    TOKENS_FOLLOWING_constraint_iterator_IN_constraint_class_quantification_1622 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1624 = Set[ 4, 6, 21, 28, 47, 53, 54, 58 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_class_quantification_1632 = Set[ 1 ]
    TOKENS_FOLLOWING_T__53_IN_constraint_different_1651 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_constraint_different_1653 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_constraint_different_1655 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_constraint_different_1657 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1676 = Set[ 1 ]
    TOKENS_FOLLOWING_T__54_IN_constraint_statement_1685 = Set[ 6 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1687 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1696 = Set[ 52, 55 ]
    TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1698 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_1700 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1709 = Set[ 52, 55 ]
    TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1711 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_1713 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1722 = Set[ 57, 66 ]
    TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1724 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_1726 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1735 = Set[ 57, 66 ]
    TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1737 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_1739 = Set[ 1 ]
    TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_1748 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1757 = Set[ 55, 56 ]
    TOKENS_FOLLOWING_T__55_IN_constraint_statement_1759 = Set[ 56 ]
    TOKENS_FOLLOWING_T__56_IN_constraint_statement_1762 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_1764 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1773 = Set[ 54, 57 ]
    TOKENS_FOLLOWING_set_IN_constraint_statement_1775 = Set[ 56 ]
    TOKENS_FOLLOWING_T__56_IN_constraint_statement_1781 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_1783 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1792 = Set[ 71, 72, 73, 74 ]
    TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_1794 = Set[ 6, 7 ]
    TOKENS_FOLLOWING_comp_value_IN_constraint_statement_1796 = Set[ 1 ]
    TOKENS_FOLLOWING_total_constraint_IN_constraint_statement_1805 = Set[ 1 ]
    TOKENS_FOLLOWING_T__58_IN_total_constraint_1816 = Set[ 6 ]
    TOKENS_FOLLOWING_total_statement_IN_total_constraint_1818 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_total_constraint_1820 = Set[ 71, 72, 73, 74 ]
    TOKENS_FOLLOWING_binary_comp_IN_total_constraint_1822 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_total_constraint_1824 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_total_statement_1835 = Set[ 52, 55 ]
    TOKENS_FOLLOWING_equals_op_IN_total_statement_1837 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_total_statement_1839 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_comp_value_1854 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_comp_value_1863 = Set[ 1 ]
    TOKENS_FOLLOWING_T__28_IN_conditional_constraint_1882 = Set[ 6, 28, 54, 58 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_1890 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_NL_IN_conditional_constraint_1892 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_conditional_constraint_then_IN_conditional_constraint_1901 = Set[ 1 ]
    TOKENS_FOLLOWING_T__29_IN_conditional_constraint_then_1916 = Set[ 6, 28, 54, 58 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_1918 = Set[ 1 ]
    TOKENS_FOLLOWING_mutation_statement_IN_mutation_body_1940 = Set[ 4 ]
    TOKENS_FOLLOWING_mutation_iterator_IN_mutation_body_1953 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_body_1962 = Set[ 1, 4, 6, 47, 60 ]
    TOKENS_FOLLOWING_T__47_IN_mutation_iterator_1977 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_iterator_1979 = Set[ 48 ]
    TOKENS_FOLLOWING_T__48_IN_mutation_iterator_1981 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_mutation_iterator_1983 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_1985 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_mutation_iterator_1988 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_1990 = Set[ 4, 6, 21, 60 ]
    TOKENS_FOLLOWING_mutation_statement_IN_mutation_iterator_2000 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_2008 = Set[ 4, 6, 21, 60 ]
    TOKENS_FOLLOWING_T__21_IN_mutation_iterator_2015 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2034 = Set[ 52, 55 ]
    TOKENS_FOLLOWING_equals_op_IN_mutation_statement_2036 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_2038 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2047 = Set[ 52, 55 ]
    TOKENS_FOLLOWING_equals_op_IN_mutation_statement_2049 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_mutation_statement_2051 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2060 = Set[ 67, 68, 69, 70 ]
    TOKENS_FOLLOWING_binary_op_IN_mutation_statement_2062 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_mutation_statement_2064 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2073 = Set[ 55 ]
    TOKENS_FOLLOWING_T__55_IN_mutation_statement_2075 = Set[ 59 ]
    TOKENS_FOLLOWING_T__59_IN_mutation_statement_2077 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_statement_2079 = Set[ 1, 20 ]
    TOKENS_FOLLOWING_object_body_IN_mutation_statement_2087 = Set[ 1 ]
    TOKENS_FOLLOWING_T__60_IN_mutation_statement_2097 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_statement_2099 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2108 = Set[ 61 ]
    TOKENS_FOLLOWING_T__61_IN_mutation_statement_2110 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_2112 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_mutation_statement_2114 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2123 = Set[ 62 ]
    TOKENS_FOLLOWING_T__62_IN_mutation_statement_2125 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_2127 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_mutation_statement_2129 = Set[ 1 ]
    TOKENS_FOLLOWING_T__36_IN_set_value_2148 = Set[ 5, 6, 7, 9, 10, 36, 38 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_2157 = Set[ 37, 38 ]
    TOKENS_FOLLOWING_T__37_IN_set_value_2160 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_2162 = Set[ 37, 38 ]
    TOKENS_FOLLOWING_T__38_IN_set_value_2174 = Set[ 1 ]
    TOKENS_FOLLOWING_value_IN_set_item_2185 = Set[ 1 ]
    TOKENS_FOLLOWING_primitive_value_IN_value_2204 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_value_2213 = Set[ 1 ]
    TOKENS_FOLLOWING_set_value_IN_value_2222 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_2241 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_primitive_value_2250 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_primitive_value_2259 = Set[ 1 ]
    TOKENS_FOLLOWING_MULTILINE_STRING_IN_primitive_value_2268 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_path_2283 = Set[ 1, 63 ]
    TOKENS_FOLLOWING_T__63_IN_path_2285 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_path_2286 = Set[ 1, 63 ]
    TOKENS_FOLLOWING_id_ref_IN_path_with_index_2299 = Set[ 1, 63 ]
    TOKENS_FOLLOWING_T__63_IN_path_with_index_2301 = Set[ 6 ]
    TOKENS_FOLLOWING_id_ref_IN_path_with_index_2302 = Set[ 1, 63 ]
    TOKENS_FOLLOWING_ID_IN_id_ref_2315 = Set[ 1, 26 ]
    TOKENS_FOLLOWING_T__26_IN_id_ref_2317 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_id_ref_2319 = Set[ 27 ]
    TOKENS_FOLLOWING_T__27_IN_id_ref_2321 = Set[ 1 ]
    TOKENS_FOLLOWING_path_with_index_IN_reference_2338 = Set[ 1 ]
    TOKENS_FOLLOWING_T__64_IN_reference_type_2357 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_reference_type_2359 = Set[ 1 ]
    TOKENS_FOLLOWING_T__65_IN_set_type_2378 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_set_type_2380 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_not_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_comp_0 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end

