#!/usr/bin/env ruby
#
# SFP.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: SFP.g
# Generated at: 2012-10-05 15:39:44
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
                   :T__39 => 39, :T__76 => 76, :T__75 => 75, :T__74 => 74, 
                   :T__73 => 73, :STRING => 5, :T__78 => 78, :T__77 => 77 )

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
                    "'('", "','", "')'", "'areall'", "'goal'", "'always'", 
                    "'sometime'", "'within'", "'sometime-after'", "'sometime-before'", 
                    "'always-within'", "'constraint'", "':always'", "':sometime'", 
                    "':within'", "':after'", "':before'", "'foreach'", "'as'", 
                    "'forall'", "'exist'", "'forsome'", "'='", "'is'", "'in'", 
                    "'isnt'", "'not'", "'total('", "'new'", "'delete'", 
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
                     :parameter, :conditions, :effects, :trajectory_head, 
                     :trajectory_constraint, :trajectory_constraint_tail, 
                     :goal_constraint, :goal_body, :nested_constraint, :constraint, 
                     :constraint_body, :constraint_namespace, :constraint_iterator, 
                     :quantification_keyword, :constraint_class_quantification, 
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

          if ( look_4_2 == T__47 )
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

            if ( look_12_2 == T__47 )
              alt_12 = 2
            elsif ( look_12_2 == NL || look_12_2 == T__20 || look_12_2 == T__25 || look_12_2.between?( T__58, T__59 ) || look_12_2 == T__69 )
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
          when T__58, T__59 then alt_22 = 1
          when T__69 then alt_22 = 2
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

          if ( look_29_1.between?( T__58, T__59 ) )
            look_29_2 = @input.peek( 3 )

            if ( look_29_2.between?( STRING, NUMBER ) || look_29_2.between?( BOOLEAN, MULTILINE_STRING ) || look_29_2 == T__36 )
              alt_29 = 1
            elsif ( look_29_2 == NULL )
              alt_29 = 2
            else
              raise NoViableAlternative( "", 29, 2 )
            end
          elsif ( look_29_1 == NL || look_29_1 == T__20 || look_29_1 == T__25 || look_29_1 == T__69 )
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
          elsif ( look_59_1 == T__69 )
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

    TrajectoryHeadReturnValue = define_return_scope :id, :time, :nested

    # 
    # parser rule trajectory_head
    # 
    # (in SFP.g)
    # 299:1: trajectory_head returns [id, time, nested] : ( 'goal' | 'always' | 'sometime' | 'within' '(' NUMBER ')' | 'sometime-after' | 'sometime-before' | 'always-within' '(' NUMBER ')' );
    # 
    def trajectory_head
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = TrajectoryHeadReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal155 = nil
      string_literal156 = nil
      string_literal157 = nil
      string_literal158 = nil
      char_literal159 = nil
      __NUMBER160__ = nil
      char_literal161 = nil
      string_literal162 = nil
      string_literal163 = nil
      string_literal164 = nil
      char_literal165 = nil
      __NUMBER166__ = nil
      char_literal167 = nil

      tree_for_string_literal155 = nil
      tree_for_string_literal156 = nil
      tree_for_string_literal157 = nil
      tree_for_string_literal158 = nil
      tree_for_char_literal159 = nil
      tree_for_NUMBER160 = nil
      tree_for_char_literal161 = nil
      tree_for_string_literal162 = nil
      tree_for_string_literal163 = nil
      tree_for_string_literal164 = nil
      tree_for_char_literal165 = nil
      tree_for_NUMBER166 = nil
      tree_for_char_literal167 = nil

      begin
        # at line 300:2: ( 'goal' | 'always' | 'sometime' | 'within' '(' NUMBER ')' | 'sometime-after' | 'sometime-before' | 'always-within' '(' NUMBER ')' )
        alt_64 = 7
        case look_64 = @input.peek( 1 )
        when T__40 then alt_64 = 1
        when T__41 then alt_64 = 2
        when T__42 then alt_64 = 3
        when T__43 then alt_64 = 4
        when T__44 then alt_64 = 5
        when T__45 then alt_64 = 6
        when T__46 then alt_64 = 7
        else
          raise NoViableAlternative( "", 64, 0 )
        end
        case alt_64
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 300:4: 'goal'
          string_literal155 = match( T__40, TOKENS_FOLLOWING_T__40_IN_trajectory_head_943 )

          tree_for_string_literal155 = @adaptor.create_with_payload( string_literal155 )
          @adaptor.add_child( root_0, tree_for_string_literal155 )

          # --> action

          			return_value.id = 'goal'
          			return_value.time = 0
          			return_value.nested = false
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 306:4: 'always'
          string_literal156 = match( T__41, TOKENS_FOLLOWING_T__41_IN_trajectory_head_952 )

          tree_for_string_literal156 = @adaptor.create_with_payload( string_literal156 )
          @adaptor.add_child( root_0, tree_for_string_literal156 )

          # --> action

          			return_value.id = 'always'
          			return_value.time = 0
          			return_value.nested = false
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 312:4: 'sometime'
          string_literal157 = match( T__42, TOKENS_FOLLOWING_T__42_IN_trajectory_head_961 )

          tree_for_string_literal157 = @adaptor.create_with_payload( string_literal157 )
          @adaptor.add_child( root_0, tree_for_string_literal157 )

          # --> action

          			return_value.id = 'sometime'
          			return_value.time = 0
          			return_value.nested = false
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 318:4: 'within' '(' NUMBER ')'
          string_literal158 = match( T__43, TOKENS_FOLLOWING_T__43_IN_trajectory_head_970 )

          tree_for_string_literal158 = @adaptor.create_with_payload( string_literal158 )
          @adaptor.add_child( root_0, tree_for_string_literal158 )

          char_literal159 = match( T__36, TOKENS_FOLLOWING_T__36_IN_trajectory_head_972 )

          tree_for_char_literal159 = @adaptor.create_with_payload( char_literal159 )
          @adaptor.add_child( root_0, tree_for_char_literal159 )

          __NUMBER160__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_trajectory_head_974 )

          tree_for_NUMBER160 = @adaptor.create_with_payload( __NUMBER160__ )
          @adaptor.add_child( root_0, tree_for_NUMBER160 )

          char_literal161 = match( T__38, TOKENS_FOLLOWING_T__38_IN_trajectory_head_976 )

          tree_for_char_literal161 = @adaptor.create_with_payload( char_literal161 )
          @adaptor.add_child( root_0, tree_for_char_literal161 )

          # --> action

          			return_value.id = 'within'
          			return_value.time = __NUMBER160__.text.to_s.to_i
          			return_value.nested = false
          		
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 324:4: 'sometime-after'
          string_literal162 = match( T__44, TOKENS_FOLLOWING_T__44_IN_trajectory_head_985 )

          tree_for_string_literal162 = @adaptor.create_with_payload( string_literal162 )
          @adaptor.add_child( root_0, tree_for_string_literal162 )

          # --> action

          			return_value.id = 'sometime-after'
          			return_value.time = 0
          			return_value.nested = true
          		
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 330:4: 'sometime-before'
          string_literal163 = match( T__45, TOKENS_FOLLOWING_T__45_IN_trajectory_head_994 )

          tree_for_string_literal163 = @adaptor.create_with_payload( string_literal163 )
          @adaptor.add_child( root_0, tree_for_string_literal163 )

          # --> action

          			return_value.id = 'sometime-before'
          			return_value.time = 0
          			return_value.nested = true
          		
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 336:4: 'always-within' '(' NUMBER ')'
          string_literal164 = match( T__46, TOKENS_FOLLOWING_T__46_IN_trajectory_head_1003 )

          tree_for_string_literal164 = @adaptor.create_with_payload( string_literal164 )
          @adaptor.add_child( root_0, tree_for_string_literal164 )

          char_literal165 = match( T__36, TOKENS_FOLLOWING_T__36_IN_trajectory_head_1005 )

          tree_for_char_literal165 = @adaptor.create_with_payload( char_literal165 )
          @adaptor.add_child( root_0, tree_for_char_literal165 )

          __NUMBER166__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_trajectory_head_1007 )

          tree_for_NUMBER166 = @adaptor.create_with_payload( __NUMBER166__ )
          @adaptor.add_child( root_0, tree_for_NUMBER166 )

          char_literal167 = match( T__38, TOKENS_FOLLOWING_T__38_IN_trajectory_head_1009 )

          tree_for_char_literal167 = @adaptor.create_with_payload( char_literal167 )
          @adaptor.add_child( root_0, tree_for_char_literal167 )

          # --> action

          			return_value.id = 'always-within'
          			return_value.time = __NUMBER166__.text.to_s.to_i
          			return_value.nested = true
          		
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
        # trace_out( __method__, 25 )

      end
      
      return return_value
    end

    TrajectoryConstraintReturnValue = define_return_scope 

    # 
    # parser rule trajectory_constraint
    # 
    # (in SFP.g)
    # 344:1: trajectory_constraint : trajectory_head ( NL )* '{' ( NL )* constraint_body '}' ( trajectory_constraint_tail )? ( NL )+ ;
    # 
    def trajectory_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = TrajectoryConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL169__ = nil
      char_literal170 = nil
      __NL171__ = nil
      char_literal173 = nil
      __NL175__ = nil
      trajectory_head168 = nil
      constraint_body172 = nil
      trajectory_constraint_tail174 = nil

      tree_for_NL169 = nil
      tree_for_char_literal170 = nil
      tree_for_NL171 = nil
      tree_for_char_literal173 = nil
      tree_for_NL175 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 345:4: trajectory_head ( NL )* '{' ( NL )* constraint_body '}' ( trajectory_constraint_tail )? ( NL )+
        @state.following.push( TOKENS_FOLLOWING_trajectory_head_IN_trajectory_constraint_1024 )
        trajectory_head168 = trajectory_head
        @state.following.pop
        @adaptor.add_child( root_0, trajectory_head168.tree )
        # at line 345:20: ( NL )*
        while true # decision 65
          alt_65 = 2
          look_65_0 = @input.peek( 1 )

          if ( look_65_0 == NL )
            alt_65 = 1

          end
          case alt_65
          when 1
            # at line 345:20: NL
            __NL169__ = match( NL, TOKENS_FOLLOWING_NL_IN_trajectory_constraint_1026 )

            tree_for_NL169 = @adaptor.create_with_payload( __NL169__ )
            @adaptor.add_child( root_0, tree_for_NL169 )


          else
            break # out of loop for decision 65
          end
        end # loop for decision 65
        # --> action

        			#id = self.next_id.to_s
        			id = ( trajectory_head168.nil? ? nil : trajectory_head168.id )
        			@now[id] = { '_self' => id,
        				'_context' => 'constraint',
        				'_type' => 'and',
        				'_parent' => @now,
        				'_time' => ( trajectory_head168.nil? ? nil : trajectory_head168.time )
        			}
        			@now = @now[id]
        		
        # <-- action
        char_literal170 = match( T__20, TOKENS_FOLLOWING_T__20_IN_trajectory_constraint_1035 )

        tree_for_char_literal170 = @adaptor.create_with_payload( char_literal170 )
        @adaptor.add_child( root_0, tree_for_char_literal170 )

        # at line 357:7: ( NL )*
        while true # decision 66
          alt_66 = 2
          look_66_0 = @input.peek( 1 )

          if ( look_66_0 == NL )
            alt_66 = 1

          end
          case alt_66
          when 1
            # at line 357:7: NL
            __NL171__ = match( NL, TOKENS_FOLLOWING_NL_IN_trajectory_constraint_1037 )

            tree_for_NL171 = @adaptor.create_with_payload( __NL171__ )
            @adaptor.add_child( root_0, tree_for_NL171 )


          else
            break # out of loop for decision 66
          end
        end # loop for decision 66
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_trajectory_constraint_1040 )
        constraint_body172 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body172.tree )
        char_literal173 = match( T__21, TOKENS_FOLLOWING_T__21_IN_trajectory_constraint_1042 )

        tree_for_char_literal173 = @adaptor.create_with_payload( char_literal173 )
        @adaptor.add_child( root_0, tree_for_char_literal173 )

        # at line 358:3: ( trajectory_constraint_tail )?
        alt_67 = 2
        alt_67 = @dfa67.predict( @input )
        case alt_67
        when 1
          # at line 358:3: trajectory_constraint_tail
          @state.following.push( TOKENS_FOLLOWING_trajectory_constraint_tail_IN_trajectory_constraint_1046 )
          trajectory_constraint_tail174 = trajectory_constraint_tail
          @state.following.pop
          @adaptor.add_child( root_0, trajectory_constraint_tail174.tree )

        end
        # at file 358:31: ( NL )+
        match_count_68 = 0
        while true
          alt_68 = 2
          look_68_0 = @input.peek( 1 )

          if ( look_68_0 == NL )
            alt_68 = 1

          end
          case alt_68
          when 1
            # at line 358:31: NL
            __NL175__ = match( NL, TOKENS_FOLLOWING_NL_IN_trajectory_constraint_1049 )

            tree_for_NL175 = @adaptor.create_with_payload( __NL175__ )
            @adaptor.add_child( root_0, tree_for_NL175 )


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
        # trace_out( __method__, 26 )

      end
      
      return return_value
    end

    TrajectoryConstraintTailReturnValue = define_return_scope 

    # 
    # parser rule trajectory_constraint_tail
    # 
    # (in SFP.g)
    # 362:1: trajectory_constraint_tail : ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ;
    # 
    def trajectory_constraint_tail
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = TrajectoryConstraintTailReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL176__ = nil
      string_literal177 = nil
      __NL178__ = nil
      char_literal179 = nil
      __NL180__ = nil
      char_literal182 = nil
      constraint_body181 = nil

      tree_for_NL176 = nil
      tree_for_string_literal177 = nil
      tree_for_NL178 = nil
      tree_for_char_literal179 = nil
      tree_for_NL180 = nil
      tree_for_char_literal182 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 363:4: ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}'
        # at line 363:4: ( NL )*
        while true # decision 69
          alt_69 = 2
          look_69_0 = @input.peek( 1 )

          if ( look_69_0 == NL )
            alt_69 = 1

          end
          case alt_69
          when 1
            # at line 363:4: NL
            __NL176__ = match( NL, TOKENS_FOLLOWING_NL_IN_trajectory_constraint_tail_1065 )

            tree_for_NL176 = @adaptor.create_with_payload( __NL176__ )
            @adaptor.add_child( root_0, tree_for_NL176 )


          else
            break # out of loop for decision 69
          end
        end # loop for decision 69
        string_literal177 = match( T__29, TOKENS_FOLLOWING_T__29_IN_trajectory_constraint_tail_1068 )

        tree_for_string_literal177 = @adaptor.create_with_payload( string_literal177 )
        @adaptor.add_child( root_0, tree_for_string_literal177 )

        # at line 363:15: ( NL )*
        while true # decision 70
          alt_70 = 2
          look_70_0 = @input.peek( 1 )

          if ( look_70_0 == NL )
            alt_70 = 1

          end
          case alt_70
          when 1
            # at line 363:15: NL
            __NL178__ = match( NL, TOKENS_FOLLOWING_NL_IN_trajectory_constraint_tail_1070 )

            tree_for_NL178 = @adaptor.create_with_payload( __NL178__ )
            @adaptor.add_child( root_0, tree_for_NL178 )


          else
            break # out of loop for decision 70
          end
        end # loop for decision 70
        char_literal179 = match( T__20, TOKENS_FOLLOWING_T__20_IN_trajectory_constraint_tail_1075 )

        tree_for_char_literal179 = @adaptor.create_with_payload( char_literal179 )
        @adaptor.add_child( root_0, tree_for_char_literal179 )

        # at line 364:7: ( NL )*
        while true # decision 71
          alt_71 = 2
          look_71_0 = @input.peek( 1 )

          if ( look_71_0 == NL )
            alt_71 = 1

          end
          case alt_71
          when 1
            # at line 364:7: NL
            __NL180__ = match( NL, TOKENS_FOLLOWING_NL_IN_trajectory_constraint_tail_1077 )

            tree_for_NL180 = @adaptor.create_with_payload( __NL180__ )
            @adaptor.add_child( root_0, tree_for_NL180 )


          else
            break # out of loop for decision 71
          end
        end # loop for decision 71
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_trajectory_constraint_tail_1080 )
        constraint_body181 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body181.tree )
        char_literal182 = match( T__21, TOKENS_FOLLOWING_T__21_IN_trajectory_constraint_tail_1082 )

        tree_for_char_literal182 = @adaptor.create_with_payload( char_literal182 )
        @adaptor.add_child( root_0, tree_for_char_literal182 )

        # - - - - - - - rule clean up - - - - - - - -
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

    GoalConstraintReturnValue = define_return_scope 

    # 
    # parser rule goal_constraint
    # 
    # (in SFP.g)
    # 367:1: goal_constraint : 'goal' ( 'constraint' )? ( NL )* '{' ( NL )* ( goal_body )* '}' ( NL )+ ;
    # 
    def goal_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = GoalConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal183 = nil
      string_literal184 = nil
      __NL185__ = nil
      char_literal186 = nil
      __NL187__ = nil
      char_literal189 = nil
      __NL190__ = nil
      goal_body188 = nil

      tree_for_string_literal183 = nil
      tree_for_string_literal184 = nil
      tree_for_NL185 = nil
      tree_for_char_literal186 = nil
      tree_for_NL187 = nil
      tree_for_char_literal189 = nil
      tree_for_NL190 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 368:4: 'goal' ( 'constraint' )? ( NL )* '{' ( NL )* ( goal_body )* '}' ( NL )+
        string_literal183 = match( T__40, TOKENS_FOLLOWING_T__40_IN_goal_constraint_1093 )

        tree_for_string_literal183 = @adaptor.create_with_payload( string_literal183 )
        @adaptor.add_child( root_0, tree_for_string_literal183 )

        # at line 368:11: ( 'constraint' )?
        alt_72 = 2
        look_72_0 = @input.peek( 1 )

        if ( look_72_0 == T__47 )
          alt_72 = 1
        end
        case alt_72
        when 1
          # at line 368:11: 'constraint'
          string_literal184 = match( T__47, TOKENS_FOLLOWING_T__47_IN_goal_constraint_1095 )

          tree_for_string_literal184 = @adaptor.create_with_payload( string_literal184 )
          @adaptor.add_child( root_0, tree_for_string_literal184 )


        end
        # at line 368:25: ( NL )*
        while true # decision 73
          alt_73 = 2
          look_73_0 = @input.peek( 1 )

          if ( look_73_0 == NL )
            alt_73 = 1

          end
          case alt_73
          when 1
            # at line 368:25: NL
            __NL185__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_constraint_1098 )

            tree_for_NL185 = @adaptor.create_with_payload( __NL185__ )
            @adaptor.add_child( root_0, tree_for_NL185 )


          else
            break # out of loop for decision 73
          end
        end # loop for decision 73
        # --> action

        			@now['goal'] = { '_self' => 'goal',
        				'_context' => 'constraint',
        				'_type' => 'and',
        				'_parent' => @now
        			}
        			@now = @now['goal']
        		
        # <-- action
        char_literal186 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_constraint_1107 )

        tree_for_char_literal186 = @adaptor.create_with_payload( char_literal186 )
        @adaptor.add_child( root_0, tree_for_char_literal186 )

        # at line 377:7: ( NL )*
        while true # decision 74
          alt_74 = 2
          look_74_0 = @input.peek( 1 )

          if ( look_74_0 == NL )
            alt_74 = 1

          end
          case alt_74
          when 1
            # at line 377:7: NL
            __NL187__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_constraint_1109 )

            tree_for_NL187 = @adaptor.create_with_payload( __NL187__ )
            @adaptor.add_child( root_0, tree_for_NL187 )


          else
            break # out of loop for decision 74
          end
        end # loop for decision 74
        # at line 377:11: ( goal_body )*
        while true # decision 75
          alt_75 = 2
          look_75_0 = @input.peek( 1 )

          if ( look_75_0 == ID || look_75_0 == T__28 || look_75_0.between?( T__48, T__53 ) || look_75_0.between?( T__55, T__57 ) || look_75_0 == T__63 )
            alt_75 = 1

          end
          case alt_75
          when 1
            # at line 377:11: goal_body
            @state.following.push( TOKENS_FOLLOWING_goal_body_IN_goal_constraint_1112 )
            goal_body188 = goal_body
            @state.following.pop
            @adaptor.add_child( root_0, goal_body188.tree )

          else
            break # out of loop for decision 75
          end
        end # loop for decision 75
        char_literal189 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_constraint_1115 )

        tree_for_char_literal189 = @adaptor.create_with_payload( char_literal189 )
        @adaptor.add_child( root_0, tree_for_char_literal189 )

        # at file 377:26: ( NL )+
        match_count_76 = 0
        while true
          alt_76 = 2
          look_76_0 = @input.peek( 1 )

          if ( look_76_0 == NL )
            alt_76 = 1

          end
          case alt_76
          when 1
            # at line 377:26: NL
            __NL190__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_constraint_1117 )

            tree_for_NL190 = @adaptor.create_with_payload( __NL190__ )
            @adaptor.add_child( root_0, tree_for_NL190 )


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
        # - - - - - - - rule clean up - - - - - - - -
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

    GoalBodyReturnValue = define_return_scope 

    # 
    # parser rule goal_body
    # 
    # (in SFP.g)
    # 381:1: goal_body : ( ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ ) | ':always' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | ':sometime' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | ':within' NUMBER ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | ':after' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* ( 'then' | 'within' NUMBER ) ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | ':before' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ );
    # 
    def goal_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = GoalBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL195__ = nil
      string_literal196 = nil
      __NL197__ = nil
      char_literal198 = nil
      __NL199__ = nil
      char_literal201 = nil
      __NL202__ = nil
      string_literal203 = nil
      __NL204__ = nil
      char_literal205 = nil
      __NL206__ = nil
      char_literal208 = nil
      __NL209__ = nil
      string_literal210 = nil
      __NUMBER211__ = nil
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
      string_literal225 = nil
      string_literal226 = nil
      __NUMBER227__ = nil
      __NL228__ = nil
      char_literal229 = nil
      __NL230__ = nil
      char_literal232 = nil
      __NL233__ = nil
      string_literal234 = nil
      __NL235__ = nil
      char_literal236 = nil
      __NL237__ = nil
      char_literal239 = nil
      __NL240__ = nil
      string_literal241 = nil
      __NL242__ = nil
      char_literal243 = nil
      __NL244__ = nil
      char_literal246 = nil
      __NL247__ = nil
      constraint_statement191 = nil
      constraint_namespace192 = nil
      constraint_iterator193 = nil
      constraint_class_quantification194 = nil
      constraint_body200 = nil
      constraint_body207 = nil
      constraint_body215 = nil
      constraint_body222 = nil
      constraint_body231 = nil
      constraint_body238 = nil
      constraint_body245 = nil

      tree_for_NL195 = nil
      tree_for_string_literal196 = nil
      tree_for_NL197 = nil
      tree_for_char_literal198 = nil
      tree_for_NL199 = nil
      tree_for_char_literal201 = nil
      tree_for_NL202 = nil
      tree_for_string_literal203 = nil
      tree_for_NL204 = nil
      tree_for_char_literal205 = nil
      tree_for_NL206 = nil
      tree_for_char_literal208 = nil
      tree_for_NL209 = nil
      tree_for_string_literal210 = nil
      tree_for_NUMBER211 = nil
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
      tree_for_string_literal225 = nil
      tree_for_string_literal226 = nil
      tree_for_NUMBER227 = nil
      tree_for_NL228 = nil
      tree_for_char_literal229 = nil
      tree_for_NL230 = nil
      tree_for_char_literal232 = nil
      tree_for_NL233 = nil
      tree_for_string_literal234 = nil
      tree_for_NL235 = nil
      tree_for_char_literal236 = nil
      tree_for_NL237 = nil
      tree_for_char_literal239 = nil
      tree_for_NL240 = nil
      tree_for_string_literal241 = nil
      tree_for_NL242 = nil
      tree_for_char_literal243 = nil
      tree_for_NL244 = nil
      tree_for_char_literal246 = nil
      tree_for_NL247 = nil

      begin
        # at line 382:2: ( ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ ) | ':always' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | ':sometime' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | ':within' NUMBER ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | ':after' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* ( 'then' | 'within' NUMBER ) ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ | ':before' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+ )
        alt_101 = 6
        case look_101 = @input.peek( 1 )
        when ID, T__28, T__53, T__55, T__56, T__57, T__63 then alt_101 = 1
        when T__48 then alt_101 = 2
        when T__49 then alt_101 = 3
        when T__50 then alt_101 = 4
        when T__51 then alt_101 = 5
        when T__52 then alt_101 = 6
        else
          raise NoViableAlternative( "", 101, 0 )
        end
        case alt_101
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 382:4: ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )
          # at line 382:4: ( ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+ )
          # at line 383:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification ) ( NL )+
          # at line 383:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification )
          alt_77 = 4
          alt_77 = @dfa77.predict( @input )
          case alt_77
          when 1
            # at line 383:6: constraint_statement
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_goal_body_1140 )
            constraint_statement191 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement191.tree )
            # --> action

            					@now[( constraint_statement191.nil? ? nil : constraint_statement191.key )] = ( constraint_statement191.nil? ? nil : constraint_statement191.val )
            				
            # <-- action

          when 2
            # at line 387:6: constraint_namespace
            @state.following.push( TOKENS_FOLLOWING_constraint_namespace_IN_goal_body_1153 )
            constraint_namespace192 = constraint_namespace
            @state.following.pop
            @adaptor.add_child( root_0, constraint_namespace192.tree )

          when 3
            # at line 388:6: constraint_iterator
            @state.following.push( TOKENS_FOLLOWING_constraint_iterator_IN_goal_body_1160 )
            constraint_iterator193 = constraint_iterator
            @state.following.pop
            @adaptor.add_child( root_0, constraint_iterator193.tree )

          when 4
            # at line 389:6: constraint_class_quantification
            @state.following.push( TOKENS_FOLLOWING_constraint_class_quantification_IN_goal_body_1167 )
            constraint_class_quantification194 = constraint_class_quantification
            @state.following.pop
            @adaptor.add_child( root_0, constraint_class_quantification194.tree )

          end
          # at file 391:3: ( NL )+
          match_count_78 = 0
          while true
            alt_78 = 2
            look_78_0 = @input.peek( 1 )

            if ( look_78_0 == NL )
              alt_78 = 1

            end
            case alt_78
            when 1
              # at line 391:3: NL
              __NL195__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1176 )

              tree_for_NL195 = @adaptor.create_with_payload( __NL195__ )
              @adaptor.add_child( root_0, tree_for_NL195 )


            else
              match_count_78 > 0 and break
              eee = EarlyExit(78)


              raise eee
            end
            match_count_78 += 1
          end



        when 2
          root_0 = @adaptor.create_flat_list


          # at line 392:4: ':always' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal196 = match( T__48, TOKENS_FOLLOWING_T__48_IN_goal_body_1183 )

          tree_for_string_literal196 = @adaptor.create_with_payload( string_literal196 )
          @adaptor.add_child( root_0, tree_for_string_literal196 )

          # at line 392:14: ( NL )*
          while true # decision 79
            alt_79 = 2
            look_79_0 = @input.peek( 1 )

            if ( look_79_0 == NL )
              alt_79 = 1

            end
            case alt_79
            when 1
              # at line 392:14: NL
              __NL197__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1185 )

              tree_for_NL197 = @adaptor.create_with_payload( __NL197__ )
              @adaptor.add_child( root_0, tree_for_NL197 )


            else
              break # out of loop for decision 79
            end
          end # loop for decision 79
          # --> action

          			@now['always'] = self.create_constraint('always', 'always') if
          				not @now.has_key?('always')
          			@now = @now['always']
          		
          # <-- action
          char_literal198 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1194 )

          tree_for_char_literal198 = @adaptor.create_with_payload( char_literal198 )
          @adaptor.add_child( root_0, tree_for_char_literal198 )

          # at line 398:7: ( NL )*
          while true # decision 80
            alt_80 = 2
            look_80_0 = @input.peek( 1 )

            if ( look_80_0 == NL )
              alt_80 = 1

            end
            case alt_80
            when 1
              # at line 398:7: NL
              __NL199__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1196 )

              tree_for_NL199 = @adaptor.create_with_payload( __NL199__ )
              @adaptor.add_child( root_0, tree_for_NL199 )


            else
              break # out of loop for decision 80
            end
          end # loop for decision 80
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1199 )
          constraint_body200 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body200.tree )
          char_literal201 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1201 )

          tree_for_char_literal201 = @adaptor.create_with_payload( char_literal201 )
          @adaptor.add_child( root_0, tree_for_char_literal201 )

          # at file 398:31: ( NL )+
          match_count_81 = 0
          while true
            alt_81 = 2
            look_81_0 = @input.peek( 1 )

            if ( look_81_0 == NL )
              alt_81 = 1

            end
            case alt_81
            when 1
              # at line 398:31: NL
              __NL202__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1203 )

              tree_for_NL202 = @adaptor.create_with_payload( __NL202__ )
              @adaptor.add_child( root_0, tree_for_NL202 )


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

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 400:4: ':sometime' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal203 = match( T__49, TOKENS_FOLLOWING_T__49_IN_goal_body_1213 )

          tree_for_string_literal203 = @adaptor.create_with_payload( string_literal203 )
          @adaptor.add_child( root_0, tree_for_string_literal203 )

          # at line 400:16: ( NL )*
          while true # decision 82
            alt_82 = 2
            look_82_0 = @input.peek( 1 )

            if ( look_82_0 == NL )
              alt_82 = 1

            end
            case alt_82
            when 1
              # at line 400:16: NL
              __NL204__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1215 )

              tree_for_NL204 = @adaptor.create_with_payload( __NL204__ )
              @adaptor.add_child( root_0, tree_for_NL204 )


            else
              break # out of loop for decision 82
            end
          end # loop for decision 82
          # --> action

          			@now['sometime'] = self.create_constraint('sometime', 'sometime') if
          				not @now.has_key?('sometime')
          			@now = @now['sometime']
          		
          # <-- action
          char_literal205 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1224 )

          tree_for_char_literal205 = @adaptor.create_with_payload( char_literal205 )
          @adaptor.add_child( root_0, tree_for_char_literal205 )

          # at line 406:7: ( NL )*
          while true # decision 83
            alt_83 = 2
            look_83_0 = @input.peek( 1 )

            if ( look_83_0 == NL )
              alt_83 = 1

            end
            case alt_83
            when 1
              # at line 406:7: NL
              __NL206__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1226 )

              tree_for_NL206 = @adaptor.create_with_payload( __NL206__ )
              @adaptor.add_child( root_0, tree_for_NL206 )


            else
              break # out of loop for decision 83
            end
          end # loop for decision 83
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1229 )
          constraint_body207 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body207.tree )
          char_literal208 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1231 )

          tree_for_char_literal208 = @adaptor.create_with_payload( char_literal208 )
          @adaptor.add_child( root_0, tree_for_char_literal208 )

          # at file 406:31: ( NL )+
          match_count_84 = 0
          while true
            alt_84 = 2
            look_84_0 = @input.peek( 1 )

            if ( look_84_0 == NL )
              alt_84 = 1

            end
            case alt_84
            when 1
              # at line 406:31: NL
              __NL209__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1233 )

              tree_for_NL209 = @adaptor.create_with_payload( __NL209__ )
              @adaptor.add_child( root_0, tree_for_NL209 )


            else
              match_count_84 > 0 and break
              eee = EarlyExit(84)


              raise eee
            end
            match_count_84 += 1
          end

          # --> action
          	self.goto_parent()	
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 408:4: ':within' NUMBER ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal210 = match( T__50, TOKENS_FOLLOWING_T__50_IN_goal_body_1243 )

          tree_for_string_literal210 = @adaptor.create_with_payload( string_literal210 )
          @adaptor.add_child( root_0, tree_for_string_literal210 )

          __NUMBER211__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_goal_body_1245 )

          tree_for_NUMBER211 = @adaptor.create_with_payload( __NUMBER211__ )
          @adaptor.add_child( root_0, tree_for_NUMBER211 )

          # at line 408:21: ( NL )*
          while true # decision 85
            alt_85 = 2
            look_85_0 = @input.peek( 1 )

            if ( look_85_0 == NL )
              alt_85 = 1

            end
            case alt_85
            when 1
              # at line 408:21: NL
              __NL212__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1247 )

              tree_for_NL212 = @adaptor.create_with_payload( __NL212__ )
              @adaptor.add_child( root_0, tree_for_NL212 )


            else
              break # out of loop for decision 85
            end
          end # loop for decision 85
          # --> action

          			id = self.next_id.to_s
          			@now[id] = self.create_constraint(id, 'within')
          			@now = @now[id]
          			@now['deadline'] = __NUMBER211__.text.to_s.to_i
          		
          # <-- action
          char_literal213 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1256 )

          tree_for_char_literal213 = @adaptor.create_with_payload( char_literal213 )
          @adaptor.add_child( root_0, tree_for_char_literal213 )

          # at line 415:7: ( NL )*
          while true # decision 86
            alt_86 = 2
            look_86_0 = @input.peek( 1 )

            if ( look_86_0 == NL )
              alt_86 = 1

            end
            case alt_86
            when 1
              # at line 415:7: NL
              __NL214__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1258 )

              tree_for_NL214 = @adaptor.create_with_payload( __NL214__ )
              @adaptor.add_child( root_0, tree_for_NL214 )


            else
              break # out of loop for decision 86
            end
          end # loop for decision 86
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1261 )
          constraint_body215 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body215.tree )
          char_literal216 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1263 )

          tree_for_char_literal216 = @adaptor.create_with_payload( char_literal216 )
          @adaptor.add_child( root_0, tree_for_char_literal216 )

          # at file 415:31: ( NL )+
          match_count_87 = 0
          while true
            alt_87 = 2
            look_87_0 = @input.peek( 1 )

            if ( look_87_0 == NL )
              alt_87 = 1

            end
            case alt_87
            when 1
              # at line 415:31: NL
              __NL217__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1265 )

              tree_for_NL217 = @adaptor.create_with_payload( __NL217__ )
              @adaptor.add_child( root_0, tree_for_NL217 )


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

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 417:4: ':after' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* ( 'then' | 'within' NUMBER ) ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal218 = match( T__51, TOKENS_FOLLOWING_T__51_IN_goal_body_1275 )

          tree_for_string_literal218 = @adaptor.create_with_payload( string_literal218 )
          @adaptor.add_child( root_0, tree_for_string_literal218 )

          # at line 417:13: ( NL )*
          while true # decision 88
            alt_88 = 2
            look_88_0 = @input.peek( 1 )

            if ( look_88_0 == NL )
              alt_88 = 1

            end
            case alt_88
            when 1
              # at line 417:13: NL
              __NL219__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1277 )

              tree_for_NL219 = @adaptor.create_with_payload( __NL219__ )
              @adaptor.add_child( root_0, tree_for_NL219 )


            else
              break # out of loop for decision 88
            end
          end # loop for decision 88
          # --> action

          			id = self.next_id.to_s
          			@now[id] = self.create_constraint(id, 'sometime-after')
          			@now = @now[id]
          			@now['after'] = self.create_constraint('after')
          			@now['deadline'] = -1
          			@now = @now['after']
          		
          # <-- action
          char_literal220 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1286 )

          tree_for_char_literal220 = @adaptor.create_with_payload( char_literal220 )
          @adaptor.add_child( root_0, tree_for_char_literal220 )

          # at line 426:7: ( NL )*
          while true # decision 89
            alt_89 = 2
            look_89_0 = @input.peek( 1 )

            if ( look_89_0 == NL )
              alt_89 = 1

            end
            case alt_89
            when 1
              # at line 426:7: NL
              __NL221__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1288 )

              tree_for_NL221 = @adaptor.create_with_payload( __NL221__ )
              @adaptor.add_child( root_0, tree_for_NL221 )


            else
              break # out of loop for decision 89
            end
          end # loop for decision 89
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1291 )
          constraint_body222 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body222.tree )
          char_literal223 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1293 )

          tree_for_char_literal223 = @adaptor.create_with_payload( char_literal223 )
          @adaptor.add_child( root_0, tree_for_char_literal223 )

          # at line 426:31: ( NL )*
          while true # decision 90
            alt_90 = 2
            look_90_0 = @input.peek( 1 )

            if ( look_90_0 == NL )
              alt_90 = 1

            end
            case alt_90
            when 1
              # at line 426:31: NL
              __NL224__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1295 )

              tree_for_NL224 = @adaptor.create_with_payload( __NL224__ )
              @adaptor.add_child( root_0, tree_for_NL224 )


            else
              break # out of loop for decision 90
            end
          end # loop for decision 90
          # --> action
          	self.goto_parent()	
          # <-- action
          # at line 428:3: ( 'then' | 'within' NUMBER )
          alt_91 = 2
          look_91_0 = @input.peek( 1 )

          if ( look_91_0 == T__29 )
            alt_91 = 1
          elsif ( look_91_0 == T__43 )
            alt_91 = 2
          else
            raise NoViableAlternative( "", 91, 0 )
          end
          case alt_91
          when 1
            # at line 428:5: 'then'
            string_literal225 = match( T__29, TOKENS_FOLLOWING_T__29_IN_goal_body_1306 )

            tree_for_string_literal225 = @adaptor.create_with_payload( string_literal225 )
            @adaptor.add_child( root_0, tree_for_string_literal225 )


          when 2
            # at line 429:6: 'within' NUMBER
            string_literal226 = match( T__43, TOKENS_FOLLOWING_T__43_IN_goal_body_1313 )

            tree_for_string_literal226 = @adaptor.create_with_payload( string_literal226 )
            @adaptor.add_child( root_0, tree_for_string_literal226 )

            __NUMBER227__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_goal_body_1315 )

            tree_for_NUMBER227 = @adaptor.create_with_payload( __NUMBER227__ )
            @adaptor.add_child( root_0, tree_for_NUMBER227 )

            # --> action
             @now['deadline'] = __NUMBER227__.text.to_s.to_i 
            # <-- action

          end
          # at line 431:5: ( NL )*
          while true # decision 92
            alt_92 = 2
            look_92_0 = @input.peek( 1 )

            if ( look_92_0 == NL )
              alt_92 = 1

            end
            case alt_92
            when 1
              # at line 431:5: NL
              __NL228__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1327 )

              tree_for_NL228 = @adaptor.create_with_payload( __NL228__ )
              @adaptor.add_child( root_0, tree_for_NL228 )


            else
              break # out of loop for decision 92
            end
          end # loop for decision 92
          # --> action

          			@now['then'] = self.create_constraint('then')
          			@now = @now['then']
          		
          # <-- action
          char_literal229 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1336 )

          tree_for_char_literal229 = @adaptor.create_with_payload( char_literal229 )
          @adaptor.add_child( root_0, tree_for_char_literal229 )

          # at line 436:7: ( NL )*
          while true # decision 93
            alt_93 = 2
            look_93_0 = @input.peek( 1 )

            if ( look_93_0 == NL )
              alt_93 = 1

            end
            case alt_93
            when 1
              # at line 436:7: NL
              __NL230__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1338 )

              tree_for_NL230 = @adaptor.create_with_payload( __NL230__ )
              @adaptor.add_child( root_0, tree_for_NL230 )


            else
              break # out of loop for decision 93
            end
          end # loop for decision 93
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1341 )
          constraint_body231 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body231.tree )
          char_literal232 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1343 )

          tree_for_char_literal232 = @adaptor.create_with_payload( char_literal232 )
          @adaptor.add_child( root_0, tree_for_char_literal232 )

          # at file 436:31: ( NL )+
          match_count_94 = 0
          while true
            alt_94 = 2
            look_94_0 = @input.peek( 1 )

            if ( look_94_0 == NL )
              alt_94 = 1

            end
            case alt_94
            when 1
              # at line 436:31: NL
              __NL233__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1345 )

              tree_for_NL233 = @adaptor.create_with_payload( __NL233__ )
              @adaptor.add_child( root_0, tree_for_NL233 )


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

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 439:4: ':before' ( NL )* '{' ( NL )* constraint_body '}' ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( NL )+
          string_literal234 = match( T__52, TOKENS_FOLLOWING_T__52_IN_goal_body_1359 )

          tree_for_string_literal234 = @adaptor.create_with_payload( string_literal234 )
          @adaptor.add_child( root_0, tree_for_string_literal234 )

          # at line 439:14: ( NL )*
          while true # decision 95
            alt_95 = 2
            look_95_0 = @input.peek( 1 )

            if ( look_95_0 == NL )
              alt_95 = 1

            end
            case alt_95
            when 1
              # at line 439:14: NL
              __NL235__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1361 )

              tree_for_NL235 = @adaptor.create_with_payload( __NL235__ )
              @adaptor.add_child( root_0, tree_for_NL235 )


            else
              break # out of loop for decision 95
            end
          end # loop for decision 95
          # --> action

          			id = self.next_id.to_s
          			@now[id] = self.create_constraint(id, 'sometime-before')
          			@now = @now[id]
          			@now['before'] = self.create_constraint('before')
          			@now = @now['before']
          		
          # <-- action
          char_literal236 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1370 )

          tree_for_char_literal236 = @adaptor.create_with_payload( char_literal236 )
          @adaptor.add_child( root_0, tree_for_char_literal236 )

          # at line 447:7: ( NL )*
          while true # decision 96
            alt_96 = 2
            look_96_0 = @input.peek( 1 )

            if ( look_96_0 == NL )
              alt_96 = 1

            end
            case alt_96
            when 1
              # at line 447:7: NL
              __NL237__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1372 )

              tree_for_NL237 = @adaptor.create_with_payload( __NL237__ )
              @adaptor.add_child( root_0, tree_for_NL237 )


            else
              break # out of loop for decision 96
            end
          end # loop for decision 96
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1375 )
          constraint_body238 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body238.tree )
          char_literal239 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1377 )

          tree_for_char_literal239 = @adaptor.create_with_payload( char_literal239 )
          @adaptor.add_child( root_0, tree_for_char_literal239 )

          # at line 447:31: ( NL )*
          while true # decision 97
            alt_97 = 2
            look_97_0 = @input.peek( 1 )

            if ( look_97_0 == NL )
              alt_97 = 1

            end
            case alt_97
            when 1
              # at line 447:31: NL
              __NL240__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1379 )

              tree_for_NL240 = @adaptor.create_with_payload( __NL240__ )
              @adaptor.add_child( root_0, tree_for_NL240 )


            else
              break # out of loop for decision 97
            end
          end # loop for decision 97
          # --> action
          	self.goto_parent()	
          # <-- action
          string_literal241 = match( T__29, TOKENS_FOLLOWING_T__29_IN_goal_body_1388 )

          tree_for_string_literal241 = @adaptor.create_with_payload( string_literal241 )
          @adaptor.add_child( root_0, tree_for_string_literal241 )

          # at line 449:10: ( NL )*
          while true # decision 98
            alt_98 = 2
            look_98_0 = @input.peek( 1 )

            if ( look_98_0 == NL )
              alt_98 = 1

            end
            case alt_98
            when 1
              # at line 449:10: NL
              __NL242__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1390 )

              tree_for_NL242 = @adaptor.create_with_payload( __NL242__ )
              @adaptor.add_child( root_0, tree_for_NL242 )


            else
              break # out of loop for decision 98
            end
          end # loop for decision 98
          # --> action

          			@now['then'] = self.create_constraint('then')
          			@now = @now['then']
          		
          # <-- action
          char_literal243 = match( T__20, TOKENS_FOLLOWING_T__20_IN_goal_body_1399 )

          tree_for_char_literal243 = @adaptor.create_with_payload( char_literal243 )
          @adaptor.add_child( root_0, tree_for_char_literal243 )

          # at line 454:7: ( NL )*
          while true # decision 99
            alt_99 = 2
            look_99_0 = @input.peek( 1 )

            if ( look_99_0 == NL )
              alt_99 = 1

            end
            case alt_99
            when 1
              # at line 454:7: NL
              __NL244__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1401 )

              tree_for_NL244 = @adaptor.create_with_payload( __NL244__ )
              @adaptor.add_child( root_0, tree_for_NL244 )


            else
              break # out of loop for decision 99
            end
          end # loop for decision 99
          @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_goal_body_1404 )
          constraint_body245 = constraint_body
          @state.following.pop
          @adaptor.add_child( root_0, constraint_body245.tree )
          char_literal246 = match( T__21, TOKENS_FOLLOWING_T__21_IN_goal_body_1406 )

          tree_for_char_literal246 = @adaptor.create_with_payload( char_literal246 )
          @adaptor.add_child( root_0, tree_for_char_literal246 )

          # at file 454:31: ( NL )+
          match_count_100 = 0
          while true
            alt_100 = 2
            look_100_0 = @input.peek( 1 )

            if ( look_100_0 == NL )
              alt_100 = 1

            end
            case alt_100
            when 1
              # at line 454:31: NL
              __NL247__ = match( NL, TOKENS_FOLLOWING_NL_IN_goal_body_1408 )

              tree_for_NL247 = @adaptor.create_with_payload( __NL247__ )
              @adaptor.add_child( root_0, tree_for_NL247 )


            else
              match_count_100 > 0 and break
              eee = EarlyExit(100)


              raise eee
            end
            match_count_100 += 1
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
        # trace_out( __method__, 29 )

      end
      
      return return_value
    end

    NestedConstraintReturnValue = define_return_scope 

    # 
    # parser rule nested_constraint
    # 
    # (in SFP.g)
    # 459:1: nested_constraint : '{' ( NL )* constraint_body '}' ;
    # 
    def nested_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = NestedConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal248 = nil
      __NL249__ = nil
      char_literal251 = nil
      constraint_body250 = nil

      tree_for_char_literal248 = nil
      tree_for_NL249 = nil
      tree_for_char_literal251 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 460:4: '{' ( NL )* constraint_body '}'
        char_literal248 = match( T__20, TOKENS_FOLLOWING_T__20_IN_nested_constraint_1428 )

        tree_for_char_literal248 = @adaptor.create_with_payload( char_literal248 )
        @adaptor.add_child( root_0, tree_for_char_literal248 )

        # at line 460:8: ( NL )*
        while true # decision 102
          alt_102 = 2
          look_102_0 = @input.peek( 1 )

          if ( look_102_0 == NL )
            alt_102 = 1

          end
          case alt_102
          when 1
            # at line 460:8: NL
            __NL249__ = match( NL, TOKENS_FOLLOWING_NL_IN_nested_constraint_1430 )

            tree_for_NL249 = @adaptor.create_with_payload( __NL249__ )
            @adaptor.add_child( root_0, tree_for_NL249 )


          else
            break # out of loop for decision 102
          end
        end # loop for decision 102
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_nested_constraint_1433 )
        constraint_body250 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body250.tree )
        char_literal251 = match( T__21, TOKENS_FOLLOWING_T__21_IN_nested_constraint_1435 )

        tree_for_char_literal251 = @adaptor.create_with_payload( char_literal251 )
        @adaptor.add_child( root_0, tree_for_char_literal251 )

        # - - - - - - - rule clean up - - - - - - - -
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

    ConstraintReturnValue = define_return_scope 

    # 
    # parser rule constraint
    # 
    # (in SFP.g)
    # 463:1: constraint : ID 'constraint' '{' ( NL )* constraint_body '}' ( NL )+ ;
    # 
    def constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
      return_value = ConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID252__ = nil
      string_literal253 = nil
      char_literal254 = nil
      __NL255__ = nil
      char_literal257 = nil
      __NL258__ = nil
      constraint_body256 = nil

      tree_for_ID252 = nil
      tree_for_string_literal253 = nil
      tree_for_char_literal254 = nil
      tree_for_NL255 = nil
      tree_for_char_literal257 = nil
      tree_for_NL258 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 464:4: ID 'constraint' '{' ( NL )* constraint_body '}' ( NL )+
        __ID252__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_1446 )

        tree_for_ID252 = @adaptor.create_with_payload( __ID252__ )
        @adaptor.add_child( root_0, tree_for_ID252 )

        string_literal253 = match( T__47, TOKENS_FOLLOWING_T__47_IN_constraint_1448 )

        tree_for_string_literal253 = @adaptor.create_with_payload( string_literal253 )
        @adaptor.add_child( root_0, tree_for_string_literal253 )

        # --> action

        			@now[__ID252__.text] = { '_self' => __ID252__.text,
        				'_context' => 'constraint',
        				'_type' => 'and',
        				'_parent' => @now
        			}
        			@now = @now[__ID252__.text]
        		
        # <-- action
        char_literal254 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_1456 )

        tree_for_char_literal254 = @adaptor.create_with_payload( char_literal254 )
        @adaptor.add_child( root_0, tree_for_char_literal254 )

        # at line 473:7: ( NL )*
        while true # decision 103
          alt_103 = 2
          look_103_0 = @input.peek( 1 )

          if ( look_103_0 == NL )
            alt_103 = 1

          end
          case alt_103
          when 1
            # at line 473:7: NL
            __NL255__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_1458 )

            tree_for_NL255 = @adaptor.create_with_payload( __NL255__ )
            @adaptor.add_child( root_0, tree_for_NL255 )


          else
            break # out of loop for decision 103
          end
        end # loop for decision 103
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_constraint_1461 )
        constraint_body256 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body256.tree )
        char_literal257 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_1463 )

        tree_for_char_literal257 = @adaptor.create_with_payload( char_literal257 )
        @adaptor.add_child( root_0, tree_for_char_literal257 )

        # at file 473:31: ( NL )+
        match_count_104 = 0
        while true
          alt_104 = 2
          look_104_0 = @input.peek( 1 )

          if ( look_104_0 == NL )
            alt_104 = 1

          end
          case alt_104
          when 1
            # at line 473:31: NL
            __NL258__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_1465 )

            tree_for_NL258 = @adaptor.create_with_payload( __NL258__ )
            @adaptor.add_child( root_0, tree_for_NL258 )


          else
            match_count_104 > 0 and break
            eee = EarlyExit(104)


            raise eee
          end
          match_count_104 += 1
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
        # trace_out( __method__, 31 )

      end
      
      return return_value
    end

    ConstraintBodyReturnValue = define_return_scope 

    # 
    # parser rule constraint_body
    # 
    # (in SFP.g)
    # 477:1: constraint_body : ( ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+ )* ;
    # 
    def constraint_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = ConstraintBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL262__ = nil
      constraint_statement259 = nil
      constraint_namespace260 = nil
      constraint_iterator261 = nil

      tree_for_NL262 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 478:4: ( ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+ )*
        # at line 478:4: ( ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+ )*
        while true # decision 107
          alt_107 = 2
          look_107_0 = @input.peek( 1 )

          if ( look_107_0 == ID || look_107_0 == T__28 || look_107_0 == T__53 || look_107_0 == T__63 )
            alt_107 = 1

          end
          case alt_107
          when 1
            # at line 479:4: ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+
            # at line 479:4: ( constraint_statement | constraint_namespace | constraint_iterator )
            alt_105 = 3
            alt_105 = @dfa105.predict( @input )
            case alt_105
            when 1
              # at line 479:6: constraint_statement
              @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_1488 )
              constraint_statement259 = constraint_statement
              @state.following.pop
              @adaptor.add_child( root_0, constraint_statement259.tree )
              # --> action

              					@now[( constraint_statement259.nil? ? nil : constraint_statement259.key )] = ( constraint_statement259.nil? ? nil : constraint_statement259.val )
              				
              # <-- action

            when 2
              # at line 483:6: constraint_namespace
              @state.following.push( TOKENS_FOLLOWING_constraint_namespace_IN_constraint_body_1501 )
              constraint_namespace260 = constraint_namespace
              @state.following.pop
              @adaptor.add_child( root_0, constraint_namespace260.tree )

            when 3
              # at line 484:6: constraint_iterator
              @state.following.push( TOKENS_FOLLOWING_constraint_iterator_IN_constraint_body_1508 )
              constraint_iterator261 = constraint_iterator
              @state.following.pop
              @adaptor.add_child( root_0, constraint_iterator261.tree )

            end
            # at file 486:3: ( NL )+
            match_count_106 = 0
            while true
              alt_106 = 2
              look_106_0 = @input.peek( 1 )

              if ( look_106_0 == NL )
                alt_106 = 1

              end
              case alt_106
              when 1
                # at line 486:3: NL
                __NL262__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_body_1517 )

                tree_for_NL262 = @adaptor.create_with_payload( __NL262__ )
                @adaptor.add_child( root_0, tree_for_NL262 )


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
        # - - - - - - - rule clean up - - - - - - - -
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

    ConstraintNamespaceReturnValue = define_return_scope 

    # 
    # parser rule constraint_namespace
    # 
    # (in SFP.g)
    # 489:1: constraint_namespace : path ( NL )* '{' ( NL )* ( constraint_statement ( NL )+ )* '}' ;
    # 
    def constraint_namespace
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
      return_value = ConstraintNamespaceReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL264__ = nil
      char_literal265 = nil
      __NL266__ = nil
      __NL268__ = nil
      char_literal269 = nil
      path263 = nil
      constraint_statement267 = nil

      tree_for_NL264 = nil
      tree_for_char_literal265 = nil
      tree_for_NL266 = nil
      tree_for_NL268 = nil
      tree_for_char_literal269 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 490:4: path ( NL )* '{' ( NL )* ( constraint_statement ( NL )+ )* '}'
        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_namespace_1531 )
        path263 = path
        @state.following.pop
        @adaptor.add_child( root_0, path263.tree )
        # at line 490:9: ( NL )*
        while true # decision 108
          alt_108 = 2
          look_108_0 = @input.peek( 1 )

          if ( look_108_0 == NL )
            alt_108 = 1

          end
          case alt_108
          when 1
            # at line 490:9: NL
            __NL264__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1533 )

            tree_for_NL264 = @adaptor.create_with_payload( __NL264__ )
            @adaptor.add_child( root_0, tree_for_NL264 )


          else
            break # out of loop for decision 108
          end
        end # loop for decision 108
        char_literal265 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_namespace_1536 )

        tree_for_char_literal265 = @adaptor.create_with_payload( char_literal265 )
        @adaptor.add_child( root_0, tree_for_char_literal265 )

        # at line 490:17: ( NL )*
        while true # decision 109
          alt_109 = 2
          look_109_0 = @input.peek( 1 )

          if ( look_109_0 == NL )
            alt_109 = 1

          end
          case alt_109
          when 1
            # at line 490:17: NL
            __NL266__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1538 )

            tree_for_NL266 = @adaptor.create_with_payload( __NL266__ )
            @adaptor.add_child( root_0, tree_for_NL266 )


          else
            break # out of loop for decision 109
          end
        end # loop for decision 109
        # at line 490:21: ( constraint_statement ( NL )+ )*
        while true # decision 111
          alt_111 = 2
          look_111_0 = @input.peek( 1 )

          if ( look_111_0 == ID || look_111_0 == T__28 || look_111_0 == T__63 )
            alt_111 = 1

          end
          case alt_111
          when 1
            # at line 490:22: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_namespace_1542 )
            constraint_statement267 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement267.tree )
            # --> action

            			key = self.to_ref(( path263 && @input.to_s( path263.start, path263.stop ) ) + '.' + ( constraint_statement267.nil? ? nil : constraint_statement267.key )[2,( constraint_statement267.nil? ? nil : constraint_statement267.key ).length])
            			@now[key] = ( constraint_statement267.nil? ? nil : constraint_statement267.val )
            		
            # <-- action
            # at file 495:3: ( NL )+
            match_count_110 = 0
            while true
              alt_110 = 2
              look_110_0 = @input.peek( 1 )

              if ( look_110_0 == NL )
                alt_110 = 1

              end
              case alt_110
              when 1
                # at line 495:3: NL
                __NL268__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1550 )

                tree_for_NL268 = @adaptor.create_with_payload( __NL268__ )
                @adaptor.add_child( root_0, tree_for_NL268 )


              else
                match_count_110 > 0 and break
                eee = EarlyExit(110)


                raise eee
              end
              match_count_110 += 1
            end


          else
            break # out of loop for decision 111
          end
        end # loop for decision 111
        char_literal269 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_namespace_1555 )

        tree_for_char_literal269 = @adaptor.create_with_payload( char_literal269 )
        @adaptor.add_child( root_0, tree_for_char_literal269 )

        # - - - - - - - rule clean up - - - - - - - -
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

    ConstraintIteratorReturnValue = define_return_scope 

    # 
    # parser rule constraint_iterator
    # 
    # (in SFP.g)
    # 498:1: constraint_iterator : 'foreach' '(' path 'as' ID ')' ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ )* '}' ;
    # 
    def constraint_iterator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )
      return_value = ConstraintIteratorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal270 = nil
      char_literal271 = nil
      string_literal273 = nil
      __ID274__ = nil
      char_literal275 = nil
      __NL276__ = nil
      char_literal277 = nil
      __NL278__ = nil
      __NL280__ = nil
      char_literal281 = nil
      path272 = nil
      constraint_statement279 = nil

      tree_for_string_literal270 = nil
      tree_for_char_literal271 = nil
      tree_for_string_literal273 = nil
      tree_for_ID274 = nil
      tree_for_char_literal275 = nil
      tree_for_NL276 = nil
      tree_for_char_literal277 = nil
      tree_for_NL278 = nil
      tree_for_NL280 = nil
      tree_for_char_literal281 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 499:4: 'foreach' '(' path 'as' ID ')' ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ )* '}'
        string_literal270 = match( T__53, TOKENS_FOLLOWING_T__53_IN_constraint_iterator_1566 )

        tree_for_string_literal270 = @adaptor.create_with_payload( string_literal270 )
        @adaptor.add_child( root_0, tree_for_string_literal270 )

        char_literal271 = match( T__36, TOKENS_FOLLOWING_T__36_IN_constraint_iterator_1568 )

        tree_for_char_literal271 = @adaptor.create_with_payload( char_literal271 )
        @adaptor.add_child( root_0, tree_for_char_literal271 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_iterator_1570 )
        path272 = path
        @state.following.pop
        @adaptor.add_child( root_0, path272.tree )
        string_literal273 = match( T__54, TOKENS_FOLLOWING_T__54_IN_constraint_iterator_1572 )

        tree_for_string_literal273 = @adaptor.create_with_payload( string_literal273 )
        @adaptor.add_child( root_0, tree_for_string_literal273 )

        __ID274__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_iterator_1574 )

        tree_for_ID274 = @adaptor.create_with_payload( __ID274__ )
        @adaptor.add_child( root_0, tree_for_ID274 )

        char_literal275 = match( T__38, TOKENS_FOLLOWING_T__38_IN_constraint_iterator_1576 )

        tree_for_char_literal275 = @adaptor.create_with_payload( char_literal275 )
        @adaptor.add_child( root_0, tree_for_char_literal275 )

        # at line 499:35: ( NL )*
        while true # decision 112
          alt_112 = 2
          look_112_0 = @input.peek( 1 )

          if ( look_112_0 == NL )
            alt_112 = 1

          end
          case alt_112
          when 1
            # at line 499:35: NL
            __NL276__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1578 )

            tree_for_NL276 = @adaptor.create_with_payload( __NL276__ )
            @adaptor.add_child( root_0, tree_for_NL276 )


          else
            break # out of loop for decision 112
          end
        end # loop for decision 112
        char_literal277 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_iterator_1581 )

        tree_for_char_literal277 = @adaptor.create_with_payload( char_literal277 )
        @adaptor.add_child( root_0, tree_for_char_literal277 )

        # at file 499:43: ( NL )+
        match_count_113 = 0
        while true
          alt_113 = 2
          look_113_0 = @input.peek( 1 )

          if ( look_113_0 == NL )
            alt_113 = 1

          end
          case alt_113
          when 1
            # at line 499:43: NL
            __NL278__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1583 )

            tree_for_NL278 = @adaptor.create_with_payload( __NL278__ )
            @adaptor.add_child( root_0, tree_for_NL278 )


          else
            match_count_113 > 0 and break
            eee = EarlyExit(113)


            raise eee
          end
          match_count_113 += 1
        end

        # --> action

        			id = self.next_id.to_s
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'iterator',
        				'_self' => id,
        				'_value' => ( path272 && @input.to_s( path272.start, path272.stop ) ),
        				'_variable' => __ID274__.text
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
        # at line 519:3: ( constraint_statement ( NL )+ )*
        while true # decision 115
          alt_115 = 2
          look_115_0 = @input.peek( 1 )

          if ( look_115_0 == ID || look_115_0 == T__28 || look_115_0 == T__63 )
            alt_115 = 1

          end
          case alt_115
          when 1
            # at line 519:4: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_iterator_1593 )
            constraint_statement279 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement279.tree )
            # --> action

            			@now[( constraint_statement279.nil? ? nil : constraint_statement279.key )] = ( constraint_statement279.nil? ? nil : constraint_statement279.val )
            		
            # <-- action
            # at file 523:3: ( NL )+
            match_count_114 = 0
            while true
              alt_114 = 2
              look_114_0 = @input.peek( 1 )

              if ( look_114_0 == NL )
                alt_114 = 1

              end
              case alt_114
              when 1
                # at line 523:3: NL
                __NL280__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1601 )

                tree_for_NL280 = @adaptor.create_with_payload( __NL280__ )
                @adaptor.add_child( root_0, tree_for_NL280 )


              else
                match_count_114 > 0 and break
                eee = EarlyExit(114)


                raise eee
              end
              match_count_114 += 1
            end


          else
            break # out of loop for decision 115
          end
        end # loop for decision 115
        char_literal281 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_iterator_1608 )

        tree_for_char_literal281 = @adaptor.create_with_payload( char_literal281 )
        @adaptor.add_child( root_0, tree_for_char_literal281 )

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
        # trace_out( __method__, 34 )

      end
      
      return return_value
    end

    QuantificationKeywordReturnValue = define_return_scope 

    # 
    # parser rule quantification_keyword
    # 
    # (in SFP.g)
    # 531:1: quantification_keyword : ( 'forall' | 'exist' | 'forsome' );
    # 
    def quantification_keyword
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
      return_value = QuantificationKeywordReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set282 = nil

      tree_for_set282 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set282 = @input.look
        if @input.peek( 1 ).between?( T__55, T__57 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set282 ) )
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
        # trace_out( __method__, 35 )

      end
      
      return return_value
    end

    ConstraintClassQuantificationReturnValue = define_return_scope 

    # 
    # parser rule constraint_class_quantification
    # 
    # (in SFP.g)
    # 537:1: constraint_class_quantification : quantification_keyword '(' path 'as' ID ')' ( ( binary_comp | '=' ) NUMBER )? ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ )* '}' ;
    # 
    def constraint_class_quantification
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
      return_value = ConstraintClassQuantificationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal284 = nil
      string_literal286 = nil
      __ID287__ = nil
      char_literal288 = nil
      char_literal290 = nil
      __NUMBER291__ = nil
      __NL292__ = nil
      char_literal293 = nil
      __NL294__ = nil
      __NL296__ = nil
      char_literal297 = nil
      quantification_keyword283 = nil
      path285 = nil
      binary_comp289 = nil
      constraint_statement295 = nil

      tree_for_char_literal284 = nil
      tree_for_string_literal286 = nil
      tree_for_ID287 = nil
      tree_for_char_literal288 = nil
      tree_for_char_literal290 = nil
      tree_for_NUMBER291 = nil
      tree_for_NL292 = nil
      tree_for_char_literal293 = nil
      tree_for_NL294 = nil
      tree_for_NL296 = nil
      tree_for_char_literal297 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 538:4: quantification_keyword '(' path 'as' ID ')' ( ( binary_comp | '=' ) NUMBER )? ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ )* '}'
        @state.following.push( TOKENS_FOLLOWING_quantification_keyword_IN_constraint_class_quantification_1644 )
        quantification_keyword283 = quantification_keyword
        @state.following.pop
        @adaptor.add_child( root_0, quantification_keyword283.tree )
        char_literal284 = match( T__36, TOKENS_FOLLOWING_T__36_IN_constraint_class_quantification_1646 )

        tree_for_char_literal284 = @adaptor.create_with_payload( char_literal284 )
        @adaptor.add_child( root_0, tree_for_char_literal284 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_class_quantification_1648 )
        path285 = path
        @state.following.pop
        @adaptor.add_child( root_0, path285.tree )
        string_literal286 = match( T__54, TOKENS_FOLLOWING_T__54_IN_constraint_class_quantification_1650 )

        tree_for_string_literal286 = @adaptor.create_with_payload( string_literal286 )
        @adaptor.add_child( root_0, tree_for_string_literal286 )

        __ID287__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_class_quantification_1652 )

        tree_for_ID287 = @adaptor.create_with_payload( __ID287__ )
        @adaptor.add_child( root_0, tree_for_ID287 )

        char_literal288 = match( T__38, TOKENS_FOLLOWING_T__38_IN_constraint_class_quantification_1654 )

        tree_for_char_literal288 = @adaptor.create_with_payload( char_literal288 )
        @adaptor.add_child( root_0, tree_for_char_literal288 )

        # --> action

        			id = self.next_id.to_s
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => ( quantification_keyword283 && @input.to_s( quantification_keyword283.start, quantification_keyword283.stop ) ),
        				'_self' => id,
        				'_class' => ( path285 && @input.to_s( path285.start, path285.stop ) ),
        				'_variable' => __ID287__.text
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
        # at line 558:3: ( ( binary_comp | '=' ) NUMBER )?
        alt_117 = 2
        look_117_0 = @input.peek( 1 )

        if ( look_117_0 == T__58 || look_117_0.between?( T__75, T__78 ) )
          alt_117 = 1
        end
        case alt_117
        when 1
          # at line 558:5: ( binary_comp | '=' ) NUMBER
          # at line 558:5: ( binary_comp | '=' )
          alt_116 = 2
          look_116_0 = @input.peek( 1 )

          if ( look_116_0.between?( T__75, T__78 ) )
            alt_116 = 1
          elsif ( look_116_0 == T__58 )
            alt_116 = 2
          else
            raise NoViableAlternative( "", 116, 0 )
          end
          case alt_116
          when 1
            # at line 558:7: binary_comp
            @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_constraint_class_quantification_1666 )
            binary_comp289 = binary_comp
            @state.following.pop
            @adaptor.add_child( root_0, binary_comp289.tree )
            # --> action
            	@now['_count_operator'] = ( binary_comp289 && @input.to_s( binary_comp289.start, binary_comp289.stop ) )	
            # <-- action

          when 2
            # at line 560:6: '='
            char_literal290 = match( T__58, TOKENS_FOLLOWING_T__58_IN_constraint_class_quantification_1679 )

            tree_for_char_literal290 = @adaptor.create_with_payload( char_literal290 )
            @adaptor.add_child( root_0, tree_for_char_literal290 )

            # --> action
            	@now['_count_operator'] = '='	
            # <-- action

          end
          __NUMBER291__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_constraint_class_quantification_1695 )

          tree_for_NUMBER291 = @adaptor.create_with_payload( __NUMBER291__ )
          @adaptor.add_child( root_0, tree_for_NUMBER291 )

          # --> action
          	@now['_count_value'] = __NUMBER291__.text.to_i	
          # <-- action

        end
        # at line 566:3: ( NL )*
        while true # decision 118
          alt_118 = 2
          look_118_0 = @input.peek( 1 )

          if ( look_118_0 == NL )
            alt_118 = 1

          end
          case alt_118
          when 1
            # at line 566:3: NL
            __NL292__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1709 )

            tree_for_NL292 = @adaptor.create_with_payload( __NL292__ )
            @adaptor.add_child( root_0, tree_for_NL292 )


          else
            break # out of loop for decision 118
          end
        end # loop for decision 118
        char_literal293 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_class_quantification_1712 )

        tree_for_char_literal293 = @adaptor.create_with_payload( char_literal293 )
        @adaptor.add_child( root_0, tree_for_char_literal293 )

        # at file 566:11: ( NL )+
        match_count_119 = 0
        while true
          alt_119 = 2
          look_119_0 = @input.peek( 1 )

          if ( look_119_0 == NL )
            alt_119 = 1

          end
          case alt_119
          when 1
            # at line 566:11: NL
            __NL294__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1714 )

            tree_for_NL294 = @adaptor.create_with_payload( __NL294__ )
            @adaptor.add_child( root_0, tree_for_NL294 )


          else
            match_count_119 > 0 and break
            eee = EarlyExit(119)


            raise eee
          end
          match_count_119 += 1
        end

        # at line 567:3: ( constraint_statement ( NL )+ )*
        while true # decision 121
          alt_121 = 2
          look_121_0 = @input.peek( 1 )

          if ( look_121_0 == ID || look_121_0 == T__28 || look_121_0 == T__63 )
            alt_121 = 1

          end
          case alt_121
          when 1
            # at line 567:4: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_class_quantification_1720 )
            constraint_statement295 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement295.tree )
            # --> action
            	@now[( constraint_statement295.nil? ? nil : constraint_statement295.key )] = ( constraint_statement295.nil? ? nil : constraint_statement295.val )	
            # <-- action
            # at file 569:3: ( NL )+
            match_count_120 = 0
            while true
              alt_120 = 2
              look_120_0 = @input.peek( 1 )

              if ( look_120_0 == NL )
                alt_120 = 1

              end
              case alt_120
              when 1
                # at line 569:3: NL
                __NL296__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1728 )

                tree_for_NL296 = @adaptor.create_with_payload( __NL296__ )
                @adaptor.add_child( root_0, tree_for_NL296 )


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
        char_literal297 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_class_quantification_1733 )

        tree_for_char_literal297 = @adaptor.create_with_payload( char_literal297 )
        @adaptor.add_child( root_0, tree_for_char_literal297 )

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
        # trace_out( __method__, 36 )

      end
      
      return return_value
    end

    ConstraintStatementReturnValue = define_return_scope :key, :val

    # 
    # parser rule constraint_statement
    # 
    # (in SFP.g)
    # 574:1: constraint_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | conditional_constraint | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | reference binary_comp comp_value | total_constraint );
    # 
    def constraint_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )
      return_value = ConstraintStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL303__ = nil
      __NULL309__ = nil
      string_literal312 = nil
      string_literal313 = nil
      set316 = nil
      string_literal317 = nil
      reference298 = nil
      equals_op299 = nil
      value300 = nil
      reference301 = nil
      equals_op302 = nil
      reference304 = nil
      not_equals_op305 = nil
      value306 = nil
      reference307 = nil
      not_equals_op308 = nil
      conditional_constraint310 = nil
      reference311 = nil
      set_value314 = nil
      reference315 = nil
      set_value318 = nil
      reference319 = nil
      binary_comp320 = nil
      comp_value321 = nil
      total_constraint322 = nil

      tree_for_NULL303 = nil
      tree_for_NULL309 = nil
      tree_for_string_literal312 = nil
      tree_for_string_literal313 = nil
      tree_for_set316 = nil
      tree_for_string_literal317 = nil

      begin
        # at line 575:2: ( reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | conditional_constraint | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | reference binary_comp comp_value | total_constraint )
        alt_123 = 9
        alt_123 = @dfa123.predict( @input )
        case alt_123
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 575:4: reference equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1756 )
          reference298 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference298.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1758 )
          equals_op299 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op299.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_1760 )
          value300 = value
          @state.following.pop
          @adaptor.add_child( root_0, value300.tree )
          # --> action

          			return_value.key = ( reference298.nil? ? nil : reference298.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => ( value300.nil? ? nil : value300.val ) }
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 580:4: reference equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1769 )
          reference301 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference301.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1771 )
          equals_op302 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op302.tree )
          __NULL303__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_constraint_statement_1773 )

          tree_for_NULL303 = @adaptor.create_with_payload( __NULL303__ )
          @adaptor.add_child( root_0, tree_for_NULL303 )

          # --> action

          			return_value.key = ( reference301.nil? ? nil : reference301.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => self.null_value }
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 585:4: reference not_equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1782 )
          reference304 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference304.tree )
          @state.following.push( TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1784 )
          not_equals_op305 = not_equals_op
          @state.following.pop
          @adaptor.add_child( root_0, not_equals_op305.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_1786 )
          value306 = value
          @state.following.pop
          @adaptor.add_child( root_0, value306.tree )
          # --> action

          			return_value.key = ( reference304.nil? ? nil : reference304.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-equals', '_value' => ( value306.nil? ? nil : value306.val ) }
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 590:4: reference not_equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1795 )
          reference307 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference307.tree )
          @state.following.push( TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1797 )
          not_equals_op308 = not_equals_op
          @state.following.pop
          @adaptor.add_child( root_0, not_equals_op308.tree )
          __NULL309__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_constraint_statement_1799 )

          tree_for_NULL309 = @adaptor.create_with_payload( __NULL309__ )
          @adaptor.add_child( root_0, tree_for_NULL309 )

          # --> action

          			return_value.key = ( reference307.nil? ? nil : reference307.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-equals', '_value' => self.null_value }
          		
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 595:4: conditional_constraint
          @state.following.push( TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_1808 )
          conditional_constraint310 = conditional_constraint
          @state.following.pop
          @adaptor.add_child( root_0, conditional_constraint310.tree )
          # --> action

          			return_value.key = ( conditional_constraint310.nil? ? nil : conditional_constraint310.key )
          			return_value.val = ( conditional_constraint310.nil? ? nil : conditional_constraint310.val )
          		
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 600:4: reference ( 'is' )? 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1817 )
          reference311 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference311.tree )
          # at line 600:14: ( 'is' )?
          alt_122 = 2
          look_122_0 = @input.peek( 1 )

          if ( look_122_0 == T__59 )
            alt_122 = 1
          end
          case alt_122
          when 1
            # at line 600:14: 'is'
            string_literal312 = match( T__59, TOKENS_FOLLOWING_T__59_IN_constraint_statement_1819 )

            tree_for_string_literal312 = @adaptor.create_with_payload( string_literal312 )
            @adaptor.add_child( root_0, tree_for_string_literal312 )


          end
          string_literal313 = match( T__60, TOKENS_FOLLOWING_T__60_IN_constraint_statement_1822 )

          tree_for_string_literal313 = @adaptor.create_with_payload( string_literal313 )
          @adaptor.add_child( root_0, tree_for_string_literal313 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_1824 )
          set_value314 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value314.tree )
          # --> action

          			c_or = { '_context' => 'constraint', '_type' => 'or', '_parent' => @now }
          			( set_value314.nil? ? nil : set_value314.val ).each { |v|
          				id = self.next_id.to_s
          				item = { '_context' => 'constraint', '_type' => 'and', '_parent' => c_or }
          				item[( reference311.nil? ? nil : reference311.val )] = { '_context' => 'constraint', '_type' => 'equals', '_value' => v }
          				c_or[id] = item
          			}
          			return_value.key = self.next_id.to_s
          			return_value.val = c_or
          		
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 612:4: reference ( 'isnt' | 'not' ) 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1833 )
          reference315 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference315.tree )
          set316 = @input.look
          if @input.peek( 1 ).between?( T__61, T__62 )
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set316 ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          string_literal317 = match( T__60, TOKENS_FOLLOWING_T__60_IN_constraint_statement_1841 )

          tree_for_string_literal317 = @adaptor.create_with_payload( string_literal317 )
          @adaptor.add_child( root_0, tree_for_string_literal317 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_1843 )
          set_value318 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value318.tree )
          # --> action

          			c_and = { '_context'=>'constraint', '_type'=>'and', '_parent'=>@now }
          			( set_value318.nil? ? nil : set_value318.val ).each { |v|
          				id = self.next_id.to_s
          				item = { '_context'=>'constraint', '_type'=>'and'}
          				item[( reference315.nil? ? nil : reference315.val )] = { '_context'=>'constraint', '_type'=>'not-equals', '_value'=>v }
          				c_and[id] = item
          			}
          			return_value.key = self.next_id.to_s
          			return_value.val = c_and

          			#return_value.key = ( reference315.nil? ? nil : reference315.val )
          			#return_value.val = { '_context' => 'constraint', '_type' => 'not-in', '_value' => ( set_value318.nil? ? nil : set_value318.val ) }
          		
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 627:4: reference binary_comp comp_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1852 )
          reference319 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference319.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_1854 )
          binary_comp320 = binary_comp
          @state.following.pop
          @adaptor.add_child( root_0, binary_comp320.tree )
          @state.following.push( TOKENS_FOLLOWING_comp_value_IN_constraint_statement_1856 )
          comp_value321 = comp_value
          @state.following.pop
          @adaptor.add_child( root_0, comp_value321.tree )
          # --> action

          			return_value.key = ( reference319.nil? ? nil : reference319.val )
          			return_value.val = { '_context' => 'constraint', '_type' => ( binary_comp320 && @input.to_s( binary_comp320.start, binary_comp320.stop ) ), '_value' => ( comp_value321.nil? ? nil : comp_value321.val ) }
          		
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 632:4: total_constraint
          @state.following.push( TOKENS_FOLLOWING_total_constraint_IN_constraint_statement_1865 )
          total_constraint322 = total_constraint
          @state.following.pop
          @adaptor.add_child( root_0, total_constraint322.tree )

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

    TotalConstraintReturnValue = define_return_scope 

    # 
    # parser rule total_constraint
    # 
    # (in SFP.g)
    # 635:1: total_constraint : 'total(' total_statement ')' binary_comp NUMBER ;
    # 
    def total_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )
      return_value = TotalConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal323 = nil
      char_literal325 = nil
      __NUMBER327__ = nil
      total_statement324 = nil
      binary_comp326 = nil

      tree_for_string_literal323 = nil
      tree_for_char_literal325 = nil
      tree_for_NUMBER327 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 636:4: 'total(' total_statement ')' binary_comp NUMBER
        string_literal323 = match( T__63, TOKENS_FOLLOWING_T__63_IN_total_constraint_1876 )

        tree_for_string_literal323 = @adaptor.create_with_payload( string_literal323 )
        @adaptor.add_child( root_0, tree_for_string_literal323 )

        @state.following.push( TOKENS_FOLLOWING_total_statement_IN_total_constraint_1878 )
        total_statement324 = total_statement
        @state.following.pop
        @adaptor.add_child( root_0, total_statement324.tree )
        char_literal325 = match( T__38, TOKENS_FOLLOWING_T__38_IN_total_constraint_1880 )

        tree_for_char_literal325 = @adaptor.create_with_payload( char_literal325 )
        @adaptor.add_child( root_0, tree_for_char_literal325 )

        @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_total_constraint_1882 )
        binary_comp326 = binary_comp
        @state.following.pop
        @adaptor.add_child( root_0, binary_comp326.tree )
        __NUMBER327__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_total_constraint_1884 )

        tree_for_NUMBER327 = @adaptor.create_with_payload( __NUMBER327__ )
        @adaptor.add_child( root_0, tree_for_NUMBER327 )

        # - - - - - - - rule clean up - - - - - - - -
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

    TotalStatementReturnValue = define_return_scope 

    # 
    # parser rule total_statement
    # 
    # (in SFP.g)
    # 639:1: total_statement : reference equals_op value ;
    # 
    def total_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )
      return_value = TotalStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      reference328 = nil
      equals_op329 = nil
      value330 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 640:4: reference equals_op value
        @state.following.push( TOKENS_FOLLOWING_reference_IN_total_statement_1895 )
        reference328 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference328.tree )
        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_total_statement_1897 )
        equals_op329 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op329.tree )
        @state.following.push( TOKENS_FOLLOWING_value_IN_total_statement_1899 )
        value330 = value
        @state.following.pop
        @adaptor.add_child( root_0, value330.tree )
        # - - - - - - - rule clean up - - - - - - - -
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

    CompValueReturnValue = define_return_scope :val

    # 
    # parser rule comp_value
    # 
    # (in SFP.g)
    # 643:1: comp_value returns [val] : ( NUMBER | reference );
    # 
    def comp_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )
      return_value = CompValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NUMBER331__ = nil
      reference332 = nil

      tree_for_NUMBER331 = nil

      begin
        # at line 644:2: ( NUMBER | reference )
        alt_124 = 2
        look_124_0 = @input.peek( 1 )

        if ( look_124_0 == NUMBER )
          alt_124 = 1
        elsif ( look_124_0 == ID )
          alt_124 = 2
        else
          raise NoViableAlternative( "", 124, 0 )
        end
        case alt_124
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 644:4: NUMBER
          __NUMBER331__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_comp_value_1914 )

          tree_for_NUMBER331 = @adaptor.create_with_payload( __NUMBER331__ )
          @adaptor.add_child( root_0, tree_for_NUMBER331 )

          # --> action
          	return_value.val = __NUMBER331__.text.to_f	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 646:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_comp_value_1923 )
          reference332 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference332.tree )
          # --> action
          	return_value.val = ( reference332.nil? ? nil : reference332.val )	
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

    ConditionalConstraintReturnValue = define_return_scope :key, :val

    # 
    # parser rule conditional_constraint
    # 
    # (in SFP.g)
    # 650:1: conditional_constraint returns [key, val] : 'if' constraint_statement ( NL )* conditional_constraint_then ;
    # 
    def conditional_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )
      return_value = ConditionalConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal333 = nil
      __NL335__ = nil
      constraint_statement334 = nil
      conditional_constraint_then336 = nil

      tree_for_string_literal333 = nil
      tree_for_NL335 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 651:4: 'if' constraint_statement ( NL )* conditional_constraint_then
        string_literal333 = match( T__28, TOKENS_FOLLOWING_T__28_IN_conditional_constraint_1942 )

        tree_for_string_literal333 = @adaptor.create_with_payload( string_literal333 )
        @adaptor.add_child( root_0, tree_for_string_literal333 )

        # --> action

        			return_value.key = id = self.next_id.to_s
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'or'
        			}
        			@now = @now[id]
        		
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_1950 )
        constraint_statement334 = constraint_statement
        @state.following.pop
        @adaptor.add_child( root_0, constraint_statement334.tree )
        # at line 660:24: ( NL )*
        while true # decision 125
          alt_125 = 2
          look_125_0 = @input.peek( 1 )

          if ( look_125_0 == NL )
            alt_125 = 1

          end
          case alt_125
          when 1
            # at line 660:24: NL
            __NL335__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditional_constraint_1952 )

            tree_for_NL335 = @adaptor.create_with_payload( __NL335__ )
            @adaptor.add_child( root_0, tree_for_NL335 )


          else
            break # out of loop for decision 125
          end
        end # loop for decision 125
        # --> action

        			id = self.next_id
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'not'
        			}
        			@now[id][( constraint_statement334.nil? ? nil : constraint_statement334.key )] = ( constraint_statement334.nil? ? nil : constraint_statement334.val )
        		
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_conditional_constraint_then_IN_conditional_constraint_1961 )
        conditional_constraint_then336 = conditional_constraint_then
        @state.following.pop
        @adaptor.add_child( root_0, conditional_constraint_then336.tree )
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
        # trace_out( __method__, 41 )

      end
      
      return return_value
    end

    ConditionalConstraintThenReturnValue = define_return_scope 

    # 
    # parser rule conditional_constraint_then
    # 
    # (in SFP.g)
    # 673:1: conditional_constraint_then : 'then' constraint_statement ;
    # 
    def conditional_constraint_then
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )
      return_value = ConditionalConstraintThenReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal337 = nil
      constraint_statement338 = nil

      tree_for_string_literal337 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 674:4: 'then' constraint_statement
        string_literal337 = match( T__29, TOKENS_FOLLOWING_T__29_IN_conditional_constraint_then_1976 )

        tree_for_string_literal337 = @adaptor.create_with_payload( string_literal337 )
        @adaptor.add_child( root_0, tree_for_string_literal337 )

        @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_1978 )
        constraint_statement338 = constraint_statement
        @state.following.pop
        @adaptor.add_child( root_0, constraint_statement338.tree )
        # --> action

        			id = self.next_id
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'and'
        			}
        			@now[id][( constraint_statement338.nil? ? nil : constraint_statement338.key )] = ( constraint_statement338.nil? ? nil : constraint_statement338.val )
        		
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

    MutationBodyReturnValue = define_return_scope 

    # 
    # parser rule mutation_body
    # 
    # (in SFP.g)
    # 685:1: mutation_body : ( ( mutation_statement | mutation_iterator ) ( NL )+ )* ;
    # 
    def mutation_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )
      return_value = MutationBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL341__ = nil
      mutation_statement339 = nil
      mutation_iterator340 = nil

      tree_for_NL341 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 686:4: ( ( mutation_statement | mutation_iterator ) ( NL )+ )*
        # at line 686:4: ( ( mutation_statement | mutation_iterator ) ( NL )+ )*
        while true # decision 128
          alt_128 = 2
          look_128_0 = @input.peek( 1 )

          if ( look_128_0 == ID || look_128_0 == T__53 || look_128_0 == T__65 )
            alt_128 = 1

          end
          case alt_128
          when 1
            # at line 687:4: ( mutation_statement | mutation_iterator ) ( NL )+
            # at line 687:4: ( mutation_statement | mutation_iterator )
            alt_126 = 2
            look_126_0 = @input.peek( 1 )

            if ( look_126_0 == ID || look_126_0 == T__65 )
              alt_126 = 1
            elsif ( look_126_0 == T__53 )
              alt_126 = 2
            else
              raise NoViableAlternative( "", 126, 0 )
            end
            case alt_126
            when 1
              # at line 687:6: mutation_statement
              @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_mutation_body_2000 )
              mutation_statement339 = mutation_statement
              @state.following.pop
              @adaptor.add_child( root_0, mutation_statement339.tree )
              # --> action
              	@now[( mutation_statement339.nil? ? nil : mutation_statement339.key )] = ( mutation_statement339.nil? ? nil : mutation_statement339.val )	
              # <-- action

            when 2
              # at line 689:6: mutation_iterator
              @state.following.push( TOKENS_FOLLOWING_mutation_iterator_IN_mutation_body_2013 )
              mutation_iterator340 = mutation_iterator
              @state.following.pop
              @adaptor.add_child( root_0, mutation_iterator340.tree )

            end
            # at file 691:3: ( NL )+
            match_count_127 = 0
            while true
              alt_127 = 2
              look_127_0 = @input.peek( 1 )

              if ( look_127_0 == NL )
                alt_127 = 1

              end
              case alt_127
              when 1
                # at line 691:3: NL
                __NL341__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_body_2022 )

                tree_for_NL341 = @adaptor.create_with_payload( __NL341__ )
                @adaptor.add_child( root_0, tree_for_NL341 )


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
        # trace_out( __method__, 43 )

      end
      
      return return_value
    end

    MutationIteratorReturnValue = define_return_scope 

    # 
    # parser rule mutation_iterator
    # 
    # (in SFP.g)
    # 694:1: mutation_iterator : 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( mutation_statement ( NL )+ )* '}' ;
    # 
    def mutation_iterator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )
      return_value = MutationIteratorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal342 = nil
      string_literal344 = nil
      __ID345__ = nil
      __NL346__ = nil
      char_literal347 = nil
      __NL348__ = nil
      __NL350__ = nil
      char_literal351 = nil
      path343 = nil
      mutation_statement349 = nil

      tree_for_string_literal342 = nil
      tree_for_string_literal344 = nil
      tree_for_ID345 = nil
      tree_for_NL346 = nil
      tree_for_char_literal347 = nil
      tree_for_NL348 = nil
      tree_for_NL350 = nil
      tree_for_char_literal351 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 695:4: 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( mutation_statement ( NL )+ )* '}'
        string_literal342 = match( T__53, TOKENS_FOLLOWING_T__53_IN_mutation_iterator_2037 )

        tree_for_string_literal342 = @adaptor.create_with_payload( string_literal342 )
        @adaptor.add_child( root_0, tree_for_string_literal342 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_iterator_2039 )
        path343 = path
        @state.following.pop
        @adaptor.add_child( root_0, path343.tree )
        string_literal344 = match( T__54, TOKENS_FOLLOWING_T__54_IN_mutation_iterator_2041 )

        tree_for_string_literal344 = @adaptor.create_with_payload( string_literal344 )
        @adaptor.add_child( root_0, tree_for_string_literal344 )

        __ID345__ = match( ID, TOKENS_FOLLOWING_ID_IN_mutation_iterator_2043 )

        tree_for_ID345 = @adaptor.create_with_payload( __ID345__ )
        @adaptor.add_child( root_0, tree_for_ID345 )

        # at line 695:27: ( NL )*
        while true # decision 129
          alt_129 = 2
          look_129_0 = @input.peek( 1 )

          if ( look_129_0 == NL )
            alt_129 = 1

          end
          case alt_129
          when 1
            # at line 695:27: NL
            __NL346__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_2045 )

            tree_for_NL346 = @adaptor.create_with_payload( __NL346__ )
            @adaptor.add_child( root_0, tree_for_NL346 )


          else
            break # out of loop for decision 129
          end
        end # loop for decision 129
        char_literal347 = match( T__20, TOKENS_FOLLOWING_T__20_IN_mutation_iterator_2048 )

        tree_for_char_literal347 = @adaptor.create_with_payload( char_literal347 )
        @adaptor.add_child( root_0, tree_for_char_literal347 )

        # at file 695:35: ( NL )+
        match_count_130 = 0
        while true
          alt_130 = 2
          look_130_0 = @input.peek( 1 )

          if ( look_130_0 == NL )
            alt_130 = 1

          end
          case alt_130
          when 1
            # at line 695:35: NL
            __NL348__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_2050 )

            tree_for_NL348 = @adaptor.create_with_payload( __NL348__ )
            @adaptor.add_child( root_0, tree_for_NL348 )


          else
            match_count_130 > 0 and break
            eee = EarlyExit(130)


            raise eee
          end
          match_count_130 += 1
        end

        # --> action

        			id = self.to_ref(( path343 && @input.to_s( path343.start, path343.stop ) ))
        			@now[id] = { '_parent' => @now,
        				'_context' => 'iterator',
        				'_self' => id,
        				'_variable' => __ID345__.text
        			}
        			@now = @now[id]
        		
        # <-- action
        # at line 705:3: ( mutation_statement ( NL )+ )*
        while true # decision 132
          alt_132 = 2
          look_132_0 = @input.peek( 1 )

          if ( look_132_0 == ID || look_132_0 == T__65 )
            alt_132 = 1

          end
          case alt_132
          when 1
            # at line 705:4: mutation_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_mutation_iterator_2060 )
            mutation_statement349 = mutation_statement
            @state.following.pop
            @adaptor.add_child( root_0, mutation_statement349.tree )
            # --> action
            	@now[( mutation_statement349.nil? ? nil : mutation_statement349.key )] = ( mutation_statement349.nil? ? nil : mutation_statement349.val )	
            # <-- action
            # at file 707:3: ( NL )+
            match_count_131 = 0
            while true
              alt_131 = 2
              look_131_0 = @input.peek( 1 )

              if ( look_131_0 == NL )
                alt_131 = 1

              end
              case alt_131
              when 1
                # at line 707:3: NL
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


          else
            break # out of loop for decision 132
          end
        end # loop for decision 132
        char_literal351 = match( T__21, TOKENS_FOLLOWING_T__21_IN_mutation_iterator_2075 )

        tree_for_char_literal351 = @adaptor.create_with_payload( char_literal351 )
        @adaptor.add_child( root_0, tree_for_char_literal351 )

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
        # trace_out( __method__, 44 )

      end
      
      return return_value
    end

    MutationStatementReturnValue = define_return_scope :key, :val

    # 
    # parser rule mutation_statement
    # 
    # (in SFP.g)
    # 712:1: mutation_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' );
    # 
    def mutation_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )
      return_value = MutationStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL357__ = nil
      __NUMBER360__ = nil
      string_literal362 = nil
      string_literal363 = nil
      string_literal366 = nil
      string_literal369 = nil
      char_literal371 = nil
      string_literal373 = nil
      char_literal375 = nil
      reference352 = nil
      equals_op353 = nil
      value354 = nil
      reference355 = nil
      equals_op356 = nil
      reference358 = nil
      binary_op359 = nil
      reference361 = nil
      path364 = nil
      object_body365 = nil
      path367 = nil
      reference368 = nil
      value370 = nil
      reference372 = nil
      value374 = nil

      tree_for_NULL357 = nil
      tree_for_NUMBER360 = nil
      tree_for_string_literal362 = nil
      tree_for_string_literal363 = nil
      tree_for_string_literal366 = nil
      tree_for_string_literal369 = nil
      tree_for_char_literal371 = nil
      tree_for_string_literal373 = nil
      tree_for_char_literal375 = nil

      begin
        # at line 713:2: ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' )
        alt_134 = 7
        alt_134 = @dfa134.predict( @input )
        case alt_134
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 713:4: reference equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2094 )
          reference352 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference352.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_mutation_statement_2096 )
          equals_op353 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op353.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_2098 )
          value354 = value
          @state.following.pop
          @adaptor.add_child( root_0, value354.tree )
          # --> action

          			return_value.key = ( reference352.nil? ? nil : reference352.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'equals',
          				'_value' => ( value354.nil? ? nil : value354.val )
          			}
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 721:4: reference equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2107 )
          reference355 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference355.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_mutation_statement_2109 )
          equals_op356 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op356.tree )
          __NULL357__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_mutation_statement_2111 )

          tree_for_NULL357 = @adaptor.create_with_payload( __NULL357__ )
          @adaptor.add_child( root_0, tree_for_NULL357 )

          # --> action

          			return_value.key = ( reference355.nil? ? nil : reference355.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'equals',
          				'_value' => self.null_value
          			}
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 729:4: reference binary_op NUMBER
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2120 )
          reference358 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference358.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_op_IN_mutation_statement_2122 )
          binary_op359 = binary_op
          @state.following.pop
          @adaptor.add_child( root_0, binary_op359.tree )
          __NUMBER360__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_mutation_statement_2124 )

          tree_for_NUMBER360 = @adaptor.create_with_payload( __NUMBER360__ )
          @adaptor.add_child( root_0, tree_for_NUMBER360 )

          # --> action

          			return_value.key = ( reference358.nil? ? nil : reference358.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => ( binary_op359 && @input.to_s( binary_op359.start, binary_op359.stop ) ),
          				'_value' => __NUMBER360__.text.to_f
          			}
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 737:4: reference 'is' 'new' path ( object_body )?
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2133 )
          reference361 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference361.tree )
          string_literal362 = match( T__59, TOKENS_FOLLOWING_T__59_IN_mutation_statement_2135 )

          tree_for_string_literal362 = @adaptor.create_with_payload( string_literal362 )
          @adaptor.add_child( root_0, tree_for_string_literal362 )

          string_literal363 = match( T__64, TOKENS_FOLLOWING_T__64_IN_mutation_statement_2137 )

          tree_for_string_literal363 = @adaptor.create_with_payload( string_literal363 )
          @adaptor.add_child( root_0, tree_for_string_literal363 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_statement_2139 )
          path364 = path
          @state.following.pop
          @adaptor.add_child( root_0, path364.tree )
          # --> action

          			id = '_' + self.next_id
          			@now[id] = { '_self' => id,
          				'_context' => 'object',
          				'_isa' => self.to_ref(( path364 && @input.to_s( path364.start, path364.stop ) )),
          				'_parent' => @now
          			}
          			@now = @now[id]
          		
          # <-- action
          # at line 747:3: ( object_body )?
          alt_133 = 2
          look_133_0 = @input.peek( 1 )

          if ( look_133_0 == T__20 )
            alt_133 = 1
          end
          case alt_133
          when 1
            # at line 747:3: object_body
            @state.following.push( TOKENS_FOLLOWING_object_body_IN_mutation_statement_2147 )
            object_body365 = object_body
            @state.following.pop
            @adaptor.add_child( root_0, object_body365.tree )

          end
          # --> action

          			n = self.goto_parent()
          			@now.delete(n['_self'])
          			return_value.key = ( reference361.nil? ? nil : reference361.val )
          			return_value.val = n
          		
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 754:4: 'delete' path
          string_literal366 = match( T__65, TOKENS_FOLLOWING_T__65_IN_mutation_statement_2157 )

          tree_for_string_literal366 = @adaptor.create_with_payload( string_literal366 )
          @adaptor.add_child( root_0, tree_for_string_literal366 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_statement_2159 )
          path367 = path
          @state.following.pop
          @adaptor.add_child( root_0, path367.tree )
          # --> action

          			id = '_' + self.next_id
          			@now[id] = { '_self' => id,
          				'_context' => 'mutation',
          				'_type' => 'delete',
          				'_value' => self.to_ref(( path367 && @input.to_s( path367.start, path367.stop ) ))
          			}
          		
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 763:4: reference 'add(' value ')'
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2168 )
          reference368 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference368.tree )
          string_literal369 = match( T__66, TOKENS_FOLLOWING_T__66_IN_mutation_statement_2170 )

          tree_for_string_literal369 = @adaptor.create_with_payload( string_literal369 )
          @adaptor.add_child( root_0, tree_for_string_literal369 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_2172 )
          value370 = value
          @state.following.pop
          @adaptor.add_child( root_0, value370.tree )
          char_literal371 = match( T__38, TOKENS_FOLLOWING_T__38_IN_mutation_statement_2174 )

          tree_for_char_literal371 = @adaptor.create_with_payload( char_literal371 )
          @adaptor.add_child( root_0, tree_for_char_literal371 )

          # --> action

          			return_value.key = ( reference368.nil? ? nil : reference368.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'add',
          				'_value' => ( value370.nil? ? nil : value370.val )
          			}
          		
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 771:4: reference 'remove(' value ')'
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_2183 )
          reference372 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference372.tree )
          string_literal373 = match( T__67, TOKENS_FOLLOWING_T__67_IN_mutation_statement_2185 )

          tree_for_string_literal373 = @adaptor.create_with_payload( string_literal373 )
          @adaptor.add_child( root_0, tree_for_string_literal373 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_2187 )
          value374 = value
          @state.following.pop
          @adaptor.add_child( root_0, value374.tree )
          char_literal375 = match( T__38, TOKENS_FOLLOWING_T__38_IN_mutation_statement_2189 )

          tree_for_char_literal375 = @adaptor.create_with_payload( char_literal375 )
          @adaptor.add_child( root_0, tree_for_char_literal375 )

          # --> action

          			return_value.key = ( reference372.nil? ? nil : reference372.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'remove',
          				'_value' => ( value374.nil? ? nil : value374.val )
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
        # trace_out( __method__, 45 )

      end
      
      return return_value
    end

    SetValueReturnValue = define_return_scope :val

    # 
    # parser rule set_value
    # 
    # (in SFP.g)
    # 781:1: set_value returns [val] : '(' set_item ( ',' set_item )* ')' ;
    # 
    def set_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )
      return_value = SetValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal376 = nil
      char_literal378 = nil
      char_literal380 = nil
      set_item377 = nil
      set_item379 = nil

      tree_for_char_literal376 = nil
      tree_for_char_literal378 = nil
      tree_for_char_literal380 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 782:4: '(' set_item ( ',' set_item )* ')'
        char_literal376 = match( T__36, TOKENS_FOLLOWING_T__36_IN_set_value_2208 )

        tree_for_char_literal376 = @adaptor.create_with_payload( char_literal376 )
        @adaptor.add_child( root_0, tree_for_char_literal376 )

        # --> action
        	@set = Array.new	
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_2216 )
        set_item377 = set_item
        @state.following.pop
        @adaptor.add_child( root_0, set_item377.tree )
        # at line 784:12: ( ',' set_item )*
        while true # decision 135
          alt_135 = 2
          look_135_0 = @input.peek( 1 )

          if ( look_135_0 == T__37 )
            alt_135 = 1

          end
          case alt_135
          when 1
            # at line 784:13: ',' set_item
            char_literal378 = match( T__37, TOKENS_FOLLOWING_T__37_IN_set_value_2219 )

            tree_for_char_literal378 = @adaptor.create_with_payload( char_literal378 )
            @adaptor.add_child( root_0, tree_for_char_literal378 )

            @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_2221 )
            set_item379 = set_item
            @state.following.pop
            @adaptor.add_child( root_0, set_item379.tree )

          else
            break # out of loop for decision 135
          end
        end # loop for decision 135
        # --> action
        	return_value.val = @set	
        # <-- action
        char_literal380 = match( T__38, TOKENS_FOLLOWING_T__38_IN_set_value_2231 )

        tree_for_char_literal380 = @adaptor.create_with_payload( char_literal380 )
        @adaptor.add_child( root_0, tree_for_char_literal380 )

        # - - - - - - - rule clean up - - - - - - - -
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

    SetItemReturnValue = define_return_scope 

    # 
    # parser rule set_item
    # 
    # (in SFP.g)
    # 789:1: set_item : value ;
    # 
    def set_item
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 47 )
      return_value = SetItemReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      value381 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 790:4: value
        @state.following.push( TOKENS_FOLLOWING_value_IN_set_item_2242 )
        value381 = value
        @state.following.pop
        @adaptor.add_child( root_0, value381.tree )
        # --> action
        	@set.push(( value381.nil? ? nil : value381.val ))	
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
        # trace_out( __method__, 47 )

      end
      
      return return_value
    end

    ValueReturnValue = define_return_scope :val

    # 
    # parser rule value
    # 
    # (in SFP.g)
    # 794:1: value returns [val] : ( primitive_value | reference | set_value );
    # 
    def value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 48 )
      return_value = ValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      primitive_value382 = nil
      reference383 = nil
      set_value384 = nil


      begin
        # at line 795:2: ( primitive_value | reference | set_value )
        alt_136 = 3
        case look_136 = @input.peek( 1 )
        when STRING, NUMBER, BOOLEAN, MULTILINE_STRING then alt_136 = 1
        when ID then alt_136 = 2
        when T__36 then alt_136 = 3
        else
          raise NoViableAlternative( "", 136, 0 )
        end
        case alt_136
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 795:4: primitive_value
          @state.following.push( TOKENS_FOLLOWING_primitive_value_IN_value_2261 )
          primitive_value382 = primitive_value
          @state.following.pop
          @adaptor.add_child( root_0, primitive_value382.tree )
          # --> action
          	return_value.val = ( primitive_value382.nil? ? nil : primitive_value382.val )	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 797:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_value_2270 )
          reference383 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference383.tree )
          # --> action
          	return_value.val = ( reference383.nil? ? nil : reference383.val )	
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 799:4: set_value
          @state.following.push( TOKENS_FOLLOWING_set_value_IN_value_2279 )
          set_value384 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value384.tree )
          # --> action
          	return_value.val = ( set_value384.nil? ? nil : set_value384.val )	
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

    PrimitiveValueReturnValue = define_return_scope :val

    # 
    # parser rule primitive_value
    # 
    # (in SFP.g)
    # 803:1: primitive_value returns [val] : ( BOOLEAN | NUMBER | STRING | MULTILINE_STRING );
    # 
    def primitive_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 49 )
      return_value = PrimitiveValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __BOOLEAN385__ = nil
      __NUMBER386__ = nil
      __STRING387__ = nil
      __MULTILINE_STRING388__ = nil

      tree_for_BOOLEAN385 = nil
      tree_for_NUMBER386 = nil
      tree_for_STRING387 = nil
      tree_for_MULTILINE_STRING388 = nil

      begin
        # at line 804:2: ( BOOLEAN | NUMBER | STRING | MULTILINE_STRING )
        alt_137 = 4
        case look_137 = @input.peek( 1 )
        when BOOLEAN then alt_137 = 1
        when NUMBER then alt_137 = 2
        when STRING then alt_137 = 3
        when MULTILINE_STRING then alt_137 = 4
        else
          raise NoViableAlternative( "", 137, 0 )
        end
        case alt_137
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 804:4: BOOLEAN
          __BOOLEAN385__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_2298 )

          tree_for_BOOLEAN385 = @adaptor.create_with_payload( __BOOLEAN385__ )
          @adaptor.add_child( root_0, tree_for_BOOLEAN385 )

          # --> action

          			if __BOOLEAN385__.text == 'true' or __BOOLEAN385__.text == 'on' or __BOOLEAN385__.text == 'yes'
          				return_value.val = true
          			else  # 'false', 'no', 'off'
          				return_value.val = false
          			end
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 812:4: NUMBER
          __NUMBER386__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_primitive_value_2307 )

          tree_for_NUMBER386 = @adaptor.create_with_payload( __NUMBER386__ )
          @adaptor.add_child( root_0, tree_for_NUMBER386 )

          # --> action
          	return_value.val = __NUMBER386__.text.to_f	
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 814:4: STRING
          __STRING387__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_primitive_value_2316 )

          tree_for_STRING387 = @adaptor.create_with_payload( __STRING387__ )
          @adaptor.add_child( root_0, tree_for_STRING387 )

          # --> action
          	return_value.val = __STRING387__.text[1,__STRING387__.text.length-2]	
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 816:4: MULTILINE_STRING
          __MULTILINE_STRING388__ = match( MULTILINE_STRING, TOKENS_FOLLOWING_MULTILINE_STRING_IN_primitive_value_2325 )

          tree_for_MULTILINE_STRING388 = @adaptor.create_with_payload( __MULTILINE_STRING388__ )
          @adaptor.add_child( root_0, tree_for_MULTILINE_STRING388 )

          # --> action
          	return_value.val = __MULTILINE_STRING388__.text[2, __MULTILINE_STRING388__.text.length-2]	
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
        # trace_out( __method__, 49 )

      end
      
      return return_value
    end

    PathReturnValue = define_return_scope 

    # 
    # parser rule path
    # 
    # (in SFP.g)
    # 820:1: path : ID ( '.' ID )* ;
    # 
    def path
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 50 )
      return_value = PathReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID389__ = nil
      char_literal390 = nil
      __ID391__ = nil

      tree_for_ID389 = nil
      tree_for_char_literal390 = nil
      tree_for_ID391 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 821:4: ID ( '.' ID )*
        __ID389__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_2340 )

        tree_for_ID389 = @adaptor.create_with_payload( __ID389__ )
        @adaptor.add_child( root_0, tree_for_ID389 )

        # at line 821:6: ( '.' ID )*
        while true # decision 138
          alt_138 = 2
          look_138_0 = @input.peek( 1 )

          if ( look_138_0 == T__68 )
            alt_138 = 1

          end
          case alt_138
          when 1
            # at line 821:7: '.' ID
            char_literal390 = match( T__68, TOKENS_FOLLOWING_T__68_IN_path_2342 )

            tree_for_char_literal390 = @adaptor.create_with_payload( char_literal390 )
            @adaptor.add_child( root_0, tree_for_char_literal390 )

            __ID391__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_2343 )

            tree_for_ID391 = @adaptor.create_with_payload( __ID391__ )
            @adaptor.add_child( root_0, tree_for_ID391 )


          else
            break # out of loop for decision 138
          end
        end # loop for decision 138
        # - - - - - - - rule clean up - - - - - - - -
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

    PathWithIndexReturnValue = define_return_scope 

    # 
    # parser rule path_with_index
    # 
    # (in SFP.g)
    # 824:1: path_with_index : id_ref ( '.' id_ref )* ;
    # 
    def path_with_index
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 51 )
      return_value = PathWithIndexReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal393 = nil
      id_ref392 = nil
      id_ref394 = nil

      tree_for_char_literal393 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 825:4: id_ref ( '.' id_ref )*
        @state.following.push( TOKENS_FOLLOWING_id_ref_IN_path_with_index_2356 )
        id_ref392 = id_ref
        @state.following.pop
        @adaptor.add_child( root_0, id_ref392.tree )
        # at line 825:10: ( '.' id_ref )*
        while true # decision 139
          alt_139 = 2
          look_139_0 = @input.peek( 1 )

          if ( look_139_0 == T__68 )
            alt_139 = 1

          end
          case alt_139
          when 1
            # at line 825:11: '.' id_ref
            char_literal393 = match( T__68, TOKENS_FOLLOWING_T__68_IN_path_with_index_2358 )

            tree_for_char_literal393 = @adaptor.create_with_payload( char_literal393 )
            @adaptor.add_child( root_0, tree_for_char_literal393 )

            @state.following.push( TOKENS_FOLLOWING_id_ref_IN_path_with_index_2359 )
            id_ref394 = id_ref
            @state.following.pop
            @adaptor.add_child( root_0, id_ref394.tree )

          else
            break # out of loop for decision 139
          end
        end # loop for decision 139
        # - - - - - - - rule clean up - - - - - - - -
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

    IdRefReturnValue = define_return_scope 

    # 
    # parser rule id_ref
    # 
    # (in SFP.g)
    # 828:1: id_ref : ID ( '[' NUMBER ']' )? ;
    # 
    def id_ref
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 52 )
      return_value = IdRefReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID395__ = nil
      char_literal396 = nil
      __NUMBER397__ = nil
      char_literal398 = nil

      tree_for_ID395 = nil
      tree_for_char_literal396 = nil
      tree_for_NUMBER397 = nil
      tree_for_char_literal398 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 829:4: ID ( '[' NUMBER ']' )?
        __ID395__ = match( ID, TOKENS_FOLLOWING_ID_IN_id_ref_2372 )

        tree_for_ID395 = @adaptor.create_with_payload( __ID395__ )
        @adaptor.add_child( root_0, tree_for_ID395 )

        # at line 829:6: ( '[' NUMBER ']' )?
        alt_140 = 2
        look_140_0 = @input.peek( 1 )

        if ( look_140_0 == T__26 )
          alt_140 = 1
        end
        case alt_140
        when 1
          # at line 829:7: '[' NUMBER ']'
          char_literal396 = match( T__26, TOKENS_FOLLOWING_T__26_IN_id_ref_2374 )

          tree_for_char_literal396 = @adaptor.create_with_payload( char_literal396 )
          @adaptor.add_child( root_0, tree_for_char_literal396 )

          __NUMBER397__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_id_ref_2376 )

          tree_for_NUMBER397 = @adaptor.create_with_payload( __NUMBER397__ )
          @adaptor.add_child( root_0, tree_for_NUMBER397 )

          char_literal398 = match( T__27, TOKENS_FOLLOWING_T__27_IN_id_ref_2378 )

          tree_for_char_literal398 = @adaptor.create_with_payload( char_literal398 )
          @adaptor.add_child( root_0, tree_for_char_literal398 )


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
        # trace_out( __method__, 52 )

      end
      
      return return_value
    end

    ReferenceReturnValue = define_return_scope :val

    # 
    # parser rule reference
    # 
    # (in SFP.g)
    # 832:1: reference returns [val] : path_with_index ;
    # 
    def reference
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 53 )
      return_value = ReferenceReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      path_with_index399 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 833:4: path_with_index
        @state.following.push( TOKENS_FOLLOWING_path_with_index_IN_reference_2395 )
        path_with_index399 = path_with_index
        @state.following.pop
        @adaptor.add_child( root_0, path_with_index399.tree )
        # --> action
        	return_value.val = self.to_ref(( path_with_index399 && @input.to_s( path_with_index399.start, path_with_index399.stop ) ))	
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

    ReferenceTypeReturnValue = define_return_scope :val

    # 
    # parser rule reference_type
    # 
    # (in SFP.g)
    # 837:1: reference_type returns [val] : 'isref' path ;
    # 
    def reference_type
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 54 )
      return_value = ReferenceTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal400 = nil
      path401 = nil

      tree_for_string_literal400 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 838:4: 'isref' path
        string_literal400 = match( T__69, TOKENS_FOLLOWING_T__69_IN_reference_type_2414 )

        tree_for_string_literal400 = @adaptor.create_with_payload( string_literal400 )
        @adaptor.add_child( root_0, tree_for_string_literal400 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_reference_type_2416 )
        path401 = path
        @state.following.pop
        @adaptor.add_child( root_0, path401.tree )
        # --> action

        			return_value.val = { '_context' => 'null',
        				'_isa' => self.to_ref(( path401 && @input.to_s( path401.start, path401.stop ) ))
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
    # 846:1: equals_op : ( '=' | 'is' );
    # 
    def equals_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 55 )
      return_value = EqualsOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set402 = nil

      tree_for_set402 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set402 = @input.look
        if @input.peek( 1 ).between?( T__58, T__59 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set402 ) )
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
    # 851:1: not_equals_op : ( '!=' | 'isnt' );
    # 
    def not_equals_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 56 )
      return_value = NotEqualsOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set403 = nil

      tree_for_set403 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set403 = @input.look
        if @input.peek(1) == T__61 || @input.peek(1) == T__70
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set403 ) )
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
    # 856:1: binary_op : ( '+=' | '-=' | '*=' | '/=' );
    # 
    def binary_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 57 )
      return_value = BinaryOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set404 = nil

      tree_for_set404 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set404 = @input.look
        if @input.peek( 1 ).between?( T__71, T__74 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set404 ) )
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
    # 863:1: binary_comp : ( '>' | '>=' | '<' | '<=' );
    # 
    def binary_comp
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 58 )
      return_value = BinaryCompReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set405 = nil

      tree_for_set405 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set405 = @input.look
        if @input.peek( 1 ).between?( T__75, T__78 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set405 ) )
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
    class DFA67 < ANTLR3::DFA
      EOT = unpack( 4, -1 )
      EOF = unpack( 1, -1, 1, 3, 2, -1 )
      MIN = unpack( 2, 4, 2, -1 )
      MAX = unpack( 2, 29, 2, -1 )
      ACCEPT = unpack( 2, -1, 1, 1, 1, 2 )
      SPECIAL = unpack( 4, -1 )
      TRANSITION = [
        unpack( 1, 1, 24, -1, 1, 2 ),
        unpack( 1, 1, 24, -1, 1, 2 ),
        unpack(  ),
        unpack(  )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 67
      

      def description
        <<-'__dfa_description__'.strip!
          358:3: ( trajectory_constraint_tail )?
        __dfa_description__
      end
    end
    class DFA77 < ANTLR3::DFA
      EOT = unpack( 8, -1 )
      EOF = unpack( 8, -1 )
      MIN = unpack( 1, 6, 1, 4, 3, -1, 1, 6, 1, -1, 1, 4 )
      MAX = unpack( 1, 63, 1, 78, 3, -1, 1, 6, 1, -1, 1, 78 )
      ACCEPT = unpack( 2, -1, 1, 1, 1, 3, 1, 4, 1, -1, 1, 2, 1, -1 )
      SPECIAL = unpack( 8, -1 )
      TRANSITION = [
        unpack( 1, 1, 21, -1, 1, 2, 24, -1, 1, 3, 1, -1, 3, 4, 5, -1, 1, 
                2 ),
        unpack( 1, 6, 15, -1, 1, 6, 5, -1, 1, 2, 31, -1, 5, 2, 5, -1, 1, 
                 5, 1, -1, 1, 2, 4, -1, 4, 2 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 7 ),
        unpack(  ),
        unpack( 1, 6, 15, -1, 1, 6, 5, -1, 1, 2, 31, -1, 5, 2, 5, -1, 1, 
                 5, 1, -1, 1, 2, 4, -1, 4, 2 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 77
      

      def description
        <<-'__dfa_description__'.strip!
          383:4: ( constraint_statement | constraint_namespace | constraint_iterator | constraint_class_quantification )
        __dfa_description__
      end
    end
    class DFA105 < ANTLR3::DFA
      EOT = unpack( 7, -1 )
      EOF = unpack( 7, -1 )
      MIN = unpack( 1, 6, 1, 4, 2, -1, 1, 6, 1, -1, 1, 4 )
      MAX = unpack( 1, 63, 1, 78, 2, -1, 1, 6, 1, -1, 1, 78 )
      ACCEPT = unpack( 2, -1, 1, 1, 1, 3, 1, -1, 1, 2, 1, -1 )
      SPECIAL = unpack( 7, -1 )
      TRANSITION = [
        unpack( 1, 1, 21, -1, 1, 2, 24, -1, 1, 3, 9, -1, 1, 2 ),
        unpack( 1, 5, 15, -1, 1, 5, 5, -1, 1, 2, 31, -1, 5, 2, 5, -1, 1, 
                 4, 1, -1, 1, 2, 4, -1, 4, 2 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 6 ),
        unpack(  ),
        unpack( 1, 5, 15, -1, 1, 5, 5, -1, 1, 2, 31, -1, 5, 2, 5, -1, 1, 
                 4, 1, -1, 1, 2, 4, -1, 4, 2 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 105
      

      def description
        <<-'__dfa_description__'.strip!
          479:4: ( constraint_statement | constraint_namespace | constraint_iterator )
        __dfa_description__
      end
    end
    class DFA123 < ANTLR3::DFA
      EOT = unpack( 23, -1 )
      EOF = unpack( 23, -1 )
      MIN = unpack( 1, 6, 1, 26, 2, -1, 1, 7, 1, 6, 3, 5, 1, -1, 1, 5, 2, 
                    -1, 1, 27, 1, 26, 4, -1, 1, 58, 1, 7, 1, 27, 1, 58 )
      MAX = unpack( 1, 63, 1, 78, 2, -1, 1, 7, 1, 6, 2, 60, 1, 36, 1, -1, 
                    1, 36, 2, -1, 1, 27, 1, 78, 4, -1, 1, 78, 1, 7, 1, 27, 
                    1, 78 )
      ACCEPT = unpack( 2, -1, 1, 5, 1, 9, 5, -1, 1, 6, 1, -1, 1, 7, 1, 8, 
                       2, -1, 1, 1, 1, 2, 1, 3, 1, 4, 4, -1 )
      SPECIAL = unpack( 23, -1 )
      TRANSITION = [
        unpack( 1, 1, 21, -1, 1, 2, 34, -1, 1, 3 ),
        unpack( 1, 4, 31, -1, 1, 8, 1, 6, 1, 9, 1, 7, 1, 11, 5, -1, 1, 
                 5, 1, -1, 1, 10, 4, -1, 4, 12 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 13 ),
        unpack( 1, 14 ),
        unpack( 3, 15, 1, 16, 2, 15, 25, -1, 1, 15, 23, -1, 1, 9 ),
        unpack( 3, 17, 1, 18, 2, 17, 25, -1, 1, 17, 23, -1, 1, 11 ),
        unpack( 3, 15, 1, 16, 2, 15, 25, -1, 1, 15 ),
        unpack(  ),
        unpack( 3, 17, 1, 18, 2, 17, 25, -1, 1, 17 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 19 ),
        unpack( 1, 20, 31, -1, 1, 8, 1, 6, 1, 9, 1, 7, 1, 11, 5, -1, 1, 
                 5, 1, -1, 1, 10, 4, -1, 4, 12 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 8, 1, 6, 1, 9, 1, 7, 1, 11, 5, -1, 1, 5, 1, -1, 1, 10, 
                 4, -1, 4, 12 ),
        unpack( 1, 21 ),
        unpack( 1, 22 ),
        unpack( 1, 8, 1, 6, 1, 9, 1, 7, 1, 11, 5, -1, 1, 5, 1, -1, 1, 10, 
                 4, -1, 4, 12 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 123
      

      def description
        <<-'__dfa_description__'.strip!
          574:1: constraint_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | conditional_constraint | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | reference binary_comp comp_value | total_constraint );
        __dfa_description__
      end
    end
    class DFA134 < ANTLR3::DFA
      EOT = unpack( 19, -1 )
      EOF = unpack( 19, -1 )
      MIN = unpack( 1, 6, 1, 26, 1, -1, 1, 7, 1, 6, 1, 5, 1, -1, 1, 5, 2, 
                    -1, 1, 27, 1, 26, 3, -1, 1, 58, 1, 7, 1, 27, 1, 58 )
      MAX = unpack( 1, 65, 1, 74, 1, -1, 1, 7, 1, 6, 1, 64, 1, -1, 1, 36, 
                    2, -1, 1, 27, 1, 74, 3, -1, 1, 74, 1, 7, 1, 27, 1, 74 )
      ACCEPT = unpack( 2, -1, 1, 5, 3, -1, 1, 3, 1, -1, 1, 6, 1, 7, 2, -1, 
                       1, 4, 1, 1, 1, 2, 4, -1 )
      SPECIAL = unpack( 19, -1 )
      TRANSITION = [
        unpack( 1, 1, 58, -1, 1, 2 ),
        unpack( 1, 3, 31, -1, 1, 7, 1, 5, 6, -1, 1, 8, 1, 9, 1, 4, 2, -1, 
                 4, 6 ),
        unpack(  ),
        unpack( 1, 10 ),
        unpack( 1, 11 ),
        unpack( 3, 13, 1, 14, 2, 13, 25, -1, 1, 13, 27, -1, 1, 12 ),
        unpack(  ),
        unpack( 3, 13, 1, 14, 2, 13, 25, -1, 1, 13 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 15 ),
        unpack( 1, 16, 31, -1, 1, 7, 1, 5, 6, -1, 1, 8, 1, 9, 1, 4, 2, 
                 -1, 4, 6 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 7, 1, 5, 6, -1, 1, 8, 1, 9, 1, 4, 2, -1, 4, 6 ),
        unpack( 1, 17 ),
        unpack( 1, 18 ),
        unpack( 1, 7, 1, 5, 6, -1, 1, 8, 1, 9, 1, 4, 2, -1, 4, 6 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 134
      

      def description
        <<-'__dfa_description__'.strip!
          712:1: mutation_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' );
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa36 = DFA36.new( self, 36 )
      @dfa67 = DFA67.new( self, 67 )
      @dfa77 = DFA77.new( self, 77 )
      @dfa105 = DFA105.new( self, 105 )
      @dfa123 = DFA123.new( self, 123 )
      @dfa134 = DFA134.new( self, 134 )

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
    TOKENS_FOLLOWING_ID_IN_attribute_308 = Set[ 58, 59 ]
    TOKENS_FOLLOWING_equals_op_IN_attribute_310 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_attribute_312 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_314 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_attribute_324 = Set[ 69 ]
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
    TOKENS_FOLLOWING_ID_IN_object_attribute_438 = Set[ 58, 59 ]
    TOKENS_FOLLOWING_equals_op_IN_object_attribute_440 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_object_attribute_442 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_object_attribute_444 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__28_IN_state_dependency_460 = Set[ 6 ]
    TOKENS_FOLLOWING_dep_effect_IN_state_dependency_464 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_466 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_T__29_IN_state_dependency_469 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_471 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_dependency_474 = Set[ 4, 6, 21, 28, 53, 63 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_478 = Set[ 4, 6, 21, 28, 53, 63 ]
    TOKENS_FOLLOWING_constraint_body_IN_state_dependency_481 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_dependency_486 = Set[ 4, 30 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_492 = Set[ 4, 30 ]
    TOKENS_FOLLOWING_T__30_IN_state_dependency_495 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_497 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_dependency_500 = Set[ 4, 6, 21, 28, 53, 63 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_504 = Set[ 4, 6, 21, 28, 53, 63 ]
    TOKENS_FOLLOWING_constraint_body_IN_state_dependency_507 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_dependency_511 = Set[ 4, 30 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_517 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_reference_IN_dep_effect_529 = Set[ 58, 59 ]
    TOKENS_FOLLOWING_equals_op_IN_dep_effect_531 = Set[ 5, 6, 7, 8, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_dep_effect_538 = Set[ 1 ]
    TOKENS_FOLLOWING_NULL_IN_dep_effect_544 = Set[ 1 ]
    TOKENS_FOLLOWING_T__31_IN_operator_560 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_operator_562 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_operator_564 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_NL_IN_operator_566 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_T__32_IN_operator_577 = Set[ 58, 59 ]
    TOKENS_FOLLOWING_equals_op_IN_operator_579 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_operator_581 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_operator_583 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_op_conditions_IN_operator_602 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_op_effects_IN_operator_605 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_operator_609 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_operator_611 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_op_param_627 = Set[ 58, 59 ]
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
    TOKENS_FOLLOWING_reference_IN_op_statement_721 = Set[ 58, 59 ]
    TOKENS_FOLLOWING_equals_op_IN_op_statement_723 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_op_statement_725 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_statement_727 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__35_IN_procedure_743 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_procedure_745 = Set[ 20, 36 ]
    TOKENS_FOLLOWING_parameters_IN_procedure_753 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_procedure_756 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_NL_IN_procedure_758 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_T__32_IN_procedure_766 = Set[ 58, 59 ]
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
    TOKENS_FOLLOWING_ID_IN_parameter_836 = Set[ 69 ]
    TOKENS_FOLLOWING_reference_type_IN_parameter_838 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_847 = Set[ 39 ]
    TOKENS_FOLLOWING_T__39_IN_parameter_849 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_parameter_851 = Set[ 1 ]
    TOKENS_FOLLOWING_T__33_IN_conditions_866 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_conditions_874 = Set[ 4, 6, 21, 28, 53, 63 ]
    TOKENS_FOLLOWING_NL_IN_conditions_876 = Set[ 4, 6, 21, 28, 53, 63 ]
    TOKENS_FOLLOWING_constraint_body_IN_conditions_879 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_conditions_881 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_conditions_883 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__34_IN_effects_900 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_effects_908 = Set[ 4, 6, 21, 53, 65 ]
    TOKENS_FOLLOWING_NL_IN_effects_910 = Set[ 4, 6, 21, 53, 65 ]
    TOKENS_FOLLOWING_mutation_body_IN_effects_916 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_effects_921 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_effects_923 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__40_IN_trajectory_head_943 = Set[ 1 ]
    TOKENS_FOLLOWING_T__41_IN_trajectory_head_952 = Set[ 1 ]
    TOKENS_FOLLOWING_T__42_IN_trajectory_head_961 = Set[ 1 ]
    TOKENS_FOLLOWING_T__43_IN_trajectory_head_970 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_trajectory_head_972 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_trajectory_head_974 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_trajectory_head_976 = Set[ 1 ]
    TOKENS_FOLLOWING_T__44_IN_trajectory_head_985 = Set[ 1 ]
    TOKENS_FOLLOWING_T__45_IN_trajectory_head_994 = Set[ 1 ]
    TOKENS_FOLLOWING_T__46_IN_trajectory_head_1003 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_trajectory_head_1005 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_trajectory_head_1007 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_trajectory_head_1009 = Set[ 1 ]
    TOKENS_FOLLOWING_trajectory_head_IN_trajectory_constraint_1024 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_trajectory_constraint_1026 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_trajectory_constraint_1035 = Set[ 4, 6, 21, 28, 53, 63 ]
    TOKENS_FOLLOWING_NL_IN_trajectory_constraint_1037 = Set[ 4, 6, 21, 28, 53, 63 ]
    TOKENS_FOLLOWING_constraint_body_IN_trajectory_constraint_1040 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_trajectory_constraint_1042 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_trajectory_constraint_tail_IN_trajectory_constraint_1046 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_trajectory_constraint_1049 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_trajectory_constraint_tail_1065 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_T__29_IN_trajectory_constraint_tail_1068 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_trajectory_constraint_tail_1070 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_trajectory_constraint_tail_1075 = Set[ 4, 6, 21, 28, 53, 63 ]
    TOKENS_FOLLOWING_NL_IN_trajectory_constraint_tail_1077 = Set[ 4, 6, 21, 28, 53, 63 ]
    TOKENS_FOLLOWING_constraint_body_IN_trajectory_constraint_tail_1080 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_trajectory_constraint_tail_1082 = Set[ 1 ]
    TOKENS_FOLLOWING_T__40_IN_goal_constraint_1093 = Set[ 4, 20, 47 ]
    TOKENS_FOLLOWING_T__47_IN_goal_constraint_1095 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_constraint_1098 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_constraint_1107 = Set[ 4, 6, 21, 28, 48, 49, 50, 51, 52, 53, 55, 56, 57, 63 ]
    TOKENS_FOLLOWING_NL_IN_goal_constraint_1109 = Set[ 4, 6, 21, 28, 48, 49, 50, 51, 52, 53, 55, 56, 57, 63 ]
    TOKENS_FOLLOWING_goal_body_IN_goal_constraint_1112 = Set[ 6, 21, 28, 48, 49, 50, 51, 52, 53, 55, 56, 57, 63 ]
    TOKENS_FOLLOWING_T__21_IN_goal_constraint_1115 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_constraint_1117 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_constraint_statement_IN_goal_body_1140 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_namespace_IN_goal_body_1153 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_iterator_IN_goal_body_1160 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_class_quantification_IN_goal_body_1167 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1176 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__48_IN_goal_body_1183 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1185 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1194 = Set[ 4, 6, 21, 28, 53, 63 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1196 = Set[ 4, 6, 21, 28, 53, 63 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1199 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1201 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1203 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__49_IN_goal_body_1213 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1215 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1224 = Set[ 4, 6, 21, 28, 53, 63 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1226 = Set[ 4, 6, 21, 28, 53, 63 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1229 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1231 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1233 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__50_IN_goal_body_1243 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_goal_body_1245 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1247 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1256 = Set[ 4, 6, 21, 28, 53, 63 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1258 = Set[ 4, 6, 21, 28, 53, 63 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1261 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1263 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1265 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__51_IN_goal_body_1275 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1277 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1286 = Set[ 4, 6, 21, 28, 53, 63 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1288 = Set[ 4, 6, 21, 28, 53, 63 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1291 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1293 = Set[ 4, 29, 43 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1295 = Set[ 4, 29, 43 ]
    TOKENS_FOLLOWING_T__29_IN_goal_body_1306 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__43_IN_goal_body_1313 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_goal_body_1315 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1327 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1336 = Set[ 4, 6, 21, 28, 53, 63 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1338 = Set[ 4, 6, 21, 28, 53, 63 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1341 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1343 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1345 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__52_IN_goal_body_1359 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1361 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1370 = Set[ 4, 6, 21, 28, 53, 63 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1372 = Set[ 4, 6, 21, 28, 53, 63 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1375 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1377 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1379 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_T__29_IN_goal_body_1388 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1390 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_goal_body_1399 = Set[ 4, 6, 21, 28, 53, 63 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1401 = Set[ 4, 6, 21, 28, 53, 63 ]
    TOKENS_FOLLOWING_constraint_body_IN_goal_body_1404 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_goal_body_1406 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_goal_body_1408 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__20_IN_nested_constraint_1428 = Set[ 4, 6, 21, 28, 53, 63 ]
    TOKENS_FOLLOWING_NL_IN_nested_constraint_1430 = Set[ 4, 6, 21, 28, 53, 63 ]
    TOKENS_FOLLOWING_constraint_body_IN_nested_constraint_1433 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_nested_constraint_1435 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_constraint_1446 = Set[ 47 ]
    TOKENS_FOLLOWING_T__47_IN_constraint_1448 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_1456 = Set[ 4, 6, 21, 28, 53, 63 ]
    TOKENS_FOLLOWING_NL_IN_constraint_1458 = Set[ 4, 6, 21, 28, 53, 63 ]
    TOKENS_FOLLOWING_constraint_body_IN_constraint_1461 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_1463 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_1465 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_1488 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_namespace_IN_constraint_body_1501 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_iterator_IN_constraint_body_1508 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_body_1517 = Set[ 1, 4, 6, 28, 53, 63 ]
    TOKENS_FOLLOWING_path_IN_constraint_namespace_1531 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1533 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_namespace_1536 = Set[ 4, 6, 21, 28, 63 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1538 = Set[ 4, 6, 21, 28, 63 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_namespace_1542 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1550 = Set[ 4, 6, 21, 28, 63 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_namespace_1555 = Set[ 1 ]
    TOKENS_FOLLOWING_T__53_IN_constraint_iterator_1566 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_constraint_iterator_1568 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_constraint_iterator_1570 = Set[ 54 ]
    TOKENS_FOLLOWING_T__54_IN_constraint_iterator_1572 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_constraint_iterator_1574 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_constraint_iterator_1576 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1578 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_iterator_1581 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1583 = Set[ 4, 6, 21, 28, 63 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_iterator_1593 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1601 = Set[ 4, 6, 21, 28, 63 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_iterator_1608 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_quantification_keyword_0 = Set[ 1 ]
    TOKENS_FOLLOWING_quantification_keyword_IN_constraint_class_quantification_1644 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_constraint_class_quantification_1646 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_constraint_class_quantification_1648 = Set[ 54 ]
    TOKENS_FOLLOWING_T__54_IN_constraint_class_quantification_1650 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_constraint_class_quantification_1652 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_constraint_class_quantification_1654 = Set[ 4, 20, 58, 75, 76, 77, 78 ]
    TOKENS_FOLLOWING_binary_comp_IN_constraint_class_quantification_1666 = Set[ 7 ]
    TOKENS_FOLLOWING_T__58_IN_constraint_class_quantification_1679 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_constraint_class_quantification_1695 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1709 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_class_quantification_1712 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1714 = Set[ 4, 6, 21, 28, 63 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_class_quantification_1720 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_class_quantification_1728 = Set[ 4, 6, 21, 28, 63 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_class_quantification_1733 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1756 = Set[ 58, 59 ]
    TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1758 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_1760 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1769 = Set[ 58, 59 ]
    TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1771 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_1773 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1782 = Set[ 61, 70 ]
    TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1784 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_1786 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1795 = Set[ 61, 70 ]
    TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1797 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_1799 = Set[ 1 ]
    TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_1808 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1817 = Set[ 59, 60 ]
    TOKENS_FOLLOWING_T__59_IN_constraint_statement_1819 = Set[ 60 ]
    TOKENS_FOLLOWING_T__60_IN_constraint_statement_1822 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_1824 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1833 = Set[ 61, 62 ]
    TOKENS_FOLLOWING_set_IN_constraint_statement_1835 = Set[ 60 ]
    TOKENS_FOLLOWING_T__60_IN_constraint_statement_1841 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_1843 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1852 = Set[ 75, 76, 77, 78 ]
    TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_1854 = Set[ 6, 7 ]
    TOKENS_FOLLOWING_comp_value_IN_constraint_statement_1856 = Set[ 1 ]
    TOKENS_FOLLOWING_total_constraint_IN_constraint_statement_1865 = Set[ 1 ]
    TOKENS_FOLLOWING_T__63_IN_total_constraint_1876 = Set[ 6 ]
    TOKENS_FOLLOWING_total_statement_IN_total_constraint_1878 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_total_constraint_1880 = Set[ 75, 76, 77, 78 ]
    TOKENS_FOLLOWING_binary_comp_IN_total_constraint_1882 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_total_constraint_1884 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_total_statement_1895 = Set[ 58, 59 ]
    TOKENS_FOLLOWING_equals_op_IN_total_statement_1897 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_total_statement_1899 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_comp_value_1914 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_comp_value_1923 = Set[ 1 ]
    TOKENS_FOLLOWING_T__28_IN_conditional_constraint_1942 = Set[ 6, 28, 63 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_1950 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_NL_IN_conditional_constraint_1952 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_conditional_constraint_then_IN_conditional_constraint_1961 = Set[ 1 ]
    TOKENS_FOLLOWING_T__29_IN_conditional_constraint_then_1976 = Set[ 6, 28, 63 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_1978 = Set[ 1 ]
    TOKENS_FOLLOWING_mutation_statement_IN_mutation_body_2000 = Set[ 4 ]
    TOKENS_FOLLOWING_mutation_iterator_IN_mutation_body_2013 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_body_2022 = Set[ 1, 4, 6, 53, 65 ]
    TOKENS_FOLLOWING_T__53_IN_mutation_iterator_2037 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_iterator_2039 = Set[ 54 ]
    TOKENS_FOLLOWING_T__54_IN_mutation_iterator_2041 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_mutation_iterator_2043 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_2045 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_mutation_iterator_2048 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_2050 = Set[ 4, 6, 21, 65 ]
    TOKENS_FOLLOWING_mutation_statement_IN_mutation_iterator_2060 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_2068 = Set[ 4, 6, 21, 65 ]
    TOKENS_FOLLOWING_T__21_IN_mutation_iterator_2075 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2094 = Set[ 58, 59 ]
    TOKENS_FOLLOWING_equals_op_IN_mutation_statement_2096 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_2098 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2107 = Set[ 58, 59 ]
    TOKENS_FOLLOWING_equals_op_IN_mutation_statement_2109 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_mutation_statement_2111 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2120 = Set[ 71, 72, 73, 74 ]
    TOKENS_FOLLOWING_binary_op_IN_mutation_statement_2122 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_mutation_statement_2124 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2133 = Set[ 59 ]
    TOKENS_FOLLOWING_T__59_IN_mutation_statement_2135 = Set[ 64 ]
    TOKENS_FOLLOWING_T__64_IN_mutation_statement_2137 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_statement_2139 = Set[ 1, 20 ]
    TOKENS_FOLLOWING_object_body_IN_mutation_statement_2147 = Set[ 1 ]
    TOKENS_FOLLOWING_T__65_IN_mutation_statement_2157 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_statement_2159 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2168 = Set[ 66 ]
    TOKENS_FOLLOWING_T__66_IN_mutation_statement_2170 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_2172 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_mutation_statement_2174 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_2183 = Set[ 67 ]
    TOKENS_FOLLOWING_T__67_IN_mutation_statement_2185 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_2187 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_mutation_statement_2189 = Set[ 1 ]
    TOKENS_FOLLOWING_T__36_IN_set_value_2208 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_2216 = Set[ 37, 38 ]
    TOKENS_FOLLOWING_T__37_IN_set_value_2219 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_2221 = Set[ 37, 38 ]
    TOKENS_FOLLOWING_T__38_IN_set_value_2231 = Set[ 1 ]
    TOKENS_FOLLOWING_value_IN_set_item_2242 = Set[ 1 ]
    TOKENS_FOLLOWING_primitive_value_IN_value_2261 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_value_2270 = Set[ 1 ]
    TOKENS_FOLLOWING_set_value_IN_value_2279 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_2298 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_primitive_value_2307 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_primitive_value_2316 = Set[ 1 ]
    TOKENS_FOLLOWING_MULTILINE_STRING_IN_primitive_value_2325 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_path_2340 = Set[ 1, 68 ]
    TOKENS_FOLLOWING_T__68_IN_path_2342 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_path_2343 = Set[ 1, 68 ]
    TOKENS_FOLLOWING_id_ref_IN_path_with_index_2356 = Set[ 1, 68 ]
    TOKENS_FOLLOWING_T__68_IN_path_with_index_2358 = Set[ 6 ]
    TOKENS_FOLLOWING_id_ref_IN_path_with_index_2359 = Set[ 1, 68 ]
    TOKENS_FOLLOWING_ID_IN_id_ref_2372 = Set[ 1, 26 ]
    TOKENS_FOLLOWING_T__26_IN_id_ref_2374 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_id_ref_2376 = Set[ 27 ]
    TOKENS_FOLLOWING_T__27_IN_id_ref_2378 = Set[ 1 ]
    TOKENS_FOLLOWING_path_with_index_IN_reference_2395 = Set[ 1 ]
    TOKENS_FOLLOWING_T__69_IN_reference_type_2414 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_reference_type_2416 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_not_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_comp_0 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end

