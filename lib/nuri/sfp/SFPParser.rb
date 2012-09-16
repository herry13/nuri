#!/usr/bin/env ruby
#
# SFP.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: SFP.g
# Generated at: 2012-09-04 21:08:05
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
    define_tokens( :EXPONENT => 11, :T__29 => 29, :T__28 => 28, :T__62 => 62, 
                   :T__27 => 27, :T__63 => 63, :T__26 => 26, :T__25 => 25, 
                   :T__24 => 24, :T__23 => 23, :T__22 => 22, :T__21 => 21, 
                   :T__20 => 20, :OCTAL_ESC => 17, :ID => 6, :T__61 => 61, 
                   :T__60 => 60, :EOF => -1, :T__55 => 55, :T__19 => 19, 
                   :T__56 => 56, :T__57 => 57, :T__58 => 58, :ESC_SEQ => 14, 
                   :BOOLEAN => 9, :T__51 => 51, :T__52 => 52, :T__18 => 18, 
                   :T__53 => 53, :T__54 => 54, :T__59 => 59, :NL => 4, :COMMENT => 12, 
                   :T__50 => 50, :T__42 => 42, :T__43 => 43, :T__40 => 40, 
                   :T__41 => 41, :T__46 => 46, :T__47 => 47, :T__44 => 44, 
                   :T__45 => 45, :T__48 => 48, :T__49 => 49, :UNICODE_ESC => 16, 
                   :NULL => 8, :NUMBER => 7, :HEX_DIGIT => 15, :MULTILINE_STRING => 10, 
                   :T__30 => 30, :T__31 => 31, :T__32 => 32, :WS => 13, 
                   :T__33 => 33, :T__34 => 34, :T__35 => 35, :T__36 => 36, 
                   :T__37 => 37, :T__38 => 38, :T__39 => 39, :STRING => 5 )

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
                    "'('", "','", "')'", "'areall'", "'constraint'", "'foreach'", 
                    "'as'", "'is'", "'in'", "'isnt'", "'not'", "'total('", 
                    "'new'", "'delete'", "'add('", "'remove('", "'.'", "'isref'", 
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
                     :primitive_value, :path, :path_with_index, :id_ref, 
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
    # 40:1: sfp : ( NL )* ( include )* ( header )* ( state | composite | constraint )* ;
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


        # at line 41:4: ( NL )* ( include )* ( header )* ( state | composite | constraint )*
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
        # at line 44:3: ( state | composite | constraint )*
        while true # decision 4
          alt_4 = 4
          look_4_0 = @input.peek( 1 )

          if ( look_4_0 == ID )
            look_4_2 = @input.peek( 2 )

            if ( look_4_2 == T__40 )
              alt_4 = 3
            elsif ( look_4_2.between?( T__19, T__20 ) )
              alt_4 = 1

            end
          elsif ( look_4_0 == T__22 )
            alt_4 = 2

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
      string_literal7 = nil
      __NL9__ = nil
      include_file8 = nil

      tree_for_string_literal7 = nil
      tree_for_NL9 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 48:4: 'include' include_file ( NL )+
        string_literal7 = match( T__18, TOKENS_FOLLOWING_T__18_IN_include_86 )

        tree_for_string_literal7 = @adaptor.create_with_payload( string_literal7 )
        @adaptor.add_child( root_0, tree_for_string_literal7 )

        @state.following.push( TOKENS_FOLLOWING_include_file_IN_include_88 )
        include_file8 = include_file
        @state.following.pop
        @adaptor.add_child( root_0, include_file8.tree )
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
    # 51:1: include_file : STRING ;
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


        # at line 52:4: STRING
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
    # 56:1: header : ( class_definition | procedure );
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
          @state.following.push( TOKENS_FOLLOWING_class_definition_IN_header_118 )
          class_definition11 = class_definition
          @state.following.pop
          @adaptor.add_child( root_0, class_definition11.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 58:4: procedure
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
    # 61:1: state : ID ( 'state' )? '{' ( NL )* ( attribute )* '}' ( NL )* ;
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


        # at line 62:4: ID ( 'state' )? '{' ( NL )* ( attribute )* '}' ( NL )*
        __ID13__ = match( ID, TOKENS_FOLLOWING_ID_IN_state_134 )

        tree_for_ID13 = @adaptor.create_with_payload( __ID13__ )
        @adaptor.add_child( root_0, tree_for_ID13 )

        # at line 62:7: ( 'state' )?
        alt_7 = 2
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == T__19 )
          alt_7 = 1
        end
        case alt_7
        when 1
          # at line 62:8: 'state'
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
            __NL16__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_149 )

            tree_for_NL16 = @adaptor.create_with_payload( __NL16__ )
            @adaptor.add_child( root_0, tree_for_NL16 )


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
    # 76:1: composite : 'composite' ID '{' ( NL )* ( attribute | constraint )* '}' ( NL )* ;
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


        # at line 77:4: 'composite' ID '{' ( NL )* ( attribute | constraint )* '}' ( NL )*
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
            __NL23__ = match( NL, TOKENS_FOLLOWING_NL_IN_composite_189 )

            tree_for_NL23 = @adaptor.create_with_payload( __NL23__ )
            @adaptor.add_child( root_0, tree_for_NL23 )


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

            if ( look_12_2 == T__40 )
              alt_12 = 2
            elsif ( look_12_2 == NL || look_12_2 == T__20 || look_12_2 == T__25 || look_12_2 == T__43 || look_12_2.between?( T__53, T__54 ) )
              alt_12 = 1

            end

          end
          case alt_12
          when 1
            # at line 85:13: attribute
            @state.following.push( TOKENS_FOLLOWING_attribute_IN_composite_194 )
            attribute24 = attribute
            @state.following.pop
            @adaptor.add_child( root_0, attribute24.tree )

          when 2
            # at line 85:25: constraint
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
    # 89:1: class_definition : 'class' ID ( extends_class )? ( '{' ( NL )* ( attribute | procedure )* '}' )? ( NL )* ;
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


        # at line 90:4: 'class' ID ( extends_class )? ( '{' ( NL )* ( attribute | procedure )* '}' )? ( NL )*
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
        # at line 98:3: ( extends_class )?
        alt_14 = 2
        look_14_0 = @input.peek( 1 )

        if ( look_14_0 == T__24 )
          alt_14 = 1
        end
        case alt_14
        when 1
          # at line 98:4: extends_class
          @state.following.push( TOKENS_FOLLOWING_extends_class_IN_class_definition_232 )
          extends_class30 = extends_class
          @state.following.pop
          @adaptor.add_child( root_0, extends_class30.tree )
          # --> action

          			@now['_extends'] = ( extends_class30.nil? ? nil : extends_class30.val )
          		
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
          char_literal31 = match( T__20, TOKENS_FOLLOWING_T__20_IN_class_definition_246 )

          tree_for_char_literal31 = @adaptor.create_with_payload( char_literal31 )
          @adaptor.add_child( root_0, tree_for_char_literal31 )

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
              __NL32__ = match( NL, TOKENS_FOLLOWING_NL_IN_class_definition_248 )

              tree_for_NL32 = @adaptor.create_with_payload( __NL32__ )
              @adaptor.add_child( root_0, tree_for_NL32 )


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
              @state.following.push( TOKENS_FOLLOWING_attribute_IN_class_definition_253 )
              attribute33 = attribute
              @state.following.pop
              @adaptor.add_child( root_0, attribute33.tree )

            when 2
              # at line 103:26: procedure
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
    # 107:1: extends_class returns [val] : 'extends' path ;
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


        # at line 108:4: 'extends' path
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
    # 115:1: attribute : ( ID equals_op value ( NL )+ | ID reference_type ( NL )+ | object_def ( NL )+ );
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
        # at line 116:2: ( ID equals_op value ( NL )+ | ID reference_type ( NL )+ | object_def ( NL )+ )
        alt_22 = 3
        look_22_0 = @input.peek( 1 )

        if ( look_22_0 == ID )
          case look_22 = @input.peek( 2 )
          when T__43, T__54 then alt_22 = 1
          when T__53 then alt_22 = 2
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


          # at line 118:4: ID reference_type ( NL )+
          __ID43__ = match( ID, TOKENS_FOLLOWING_ID_IN_attribute_320 )

          tree_for_ID43 = @adaptor.create_with_payload( __ID43__ )
          @adaptor.add_child( root_0, tree_for_ID43 )

          @state.following.push( TOKENS_FOLLOWING_reference_type_IN_attribute_322 )
          reference_type44 = reference_type
          @state.following.pop
          @adaptor.add_child( root_0, reference_type44.tree )
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


          # at line 120:4: object_def ( NL )+
          @state.following.push( TOKENS_FOLLOWING_object_def_IN_attribute_334 )
          object_def46 = object_def
          @state.following.pop
          @adaptor.add_child( root_0, object_def46.tree )
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
    # 123:1: object_def : ID ( 'isa' path ( '[' NUMBER ']' )? )? ( object_body )? ;
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
      char_literal51 = nil
      __NUMBER52__ = nil
      char_literal53 = nil
      path50 = nil
      object_body54 = nil

      tree_for_ID48 = nil
      tree_for_string_literal49 = nil
      tree_for_char_literal51 = nil
      tree_for_NUMBER52 = nil
      tree_for_char_literal53 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 124:4: ID ( 'isa' path ( '[' NUMBER ']' )? )? ( object_body )?
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
          string_literal49 = match( T__25, TOKENS_FOLLOWING_T__25_IN_object_def_357 )

          tree_for_string_literal49 = @adaptor.create_with_payload( string_literal49 )
          @adaptor.add_child( root_0, tree_for_string_literal49 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_object_def_359 )
          path50 = path
          @state.following.pop
          @adaptor.add_child( root_0, path50.tree )
          # at line 134:14: ( '[' NUMBER ']' )?
          alt_23 = 2
          look_23_0 = @input.peek( 1 )

          if ( look_23_0 == T__26 )
            alt_23 = 1
          end
          case alt_23
          when 1
            # at line 134:15: '[' NUMBER ']'
            char_literal51 = match( T__26, TOKENS_FOLLOWING_T__26_IN_object_def_361 )

            tree_for_char_literal51 = @adaptor.create_with_payload( char_literal51 )
            @adaptor.add_child( root_0, tree_for_char_literal51 )

            __NUMBER52__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_object_def_363 )

            tree_for_NUMBER52 = @adaptor.create_with_payload( __NUMBER52__ )
            @adaptor.add_child( root_0, tree_for_NUMBER52 )

            # --> action
             @is_array = true 
            # <-- action
            char_literal53 = match( T__27, TOKENS_FOLLOWING_T__27_IN_object_def_367 )

            tree_for_char_literal53 = @adaptor.create_with_payload( char_literal53 )
            @adaptor.add_child( root_0, tree_for_char_literal53 )


          end
          # --> action

          			@now['_isa'] = self.to_ref(( path50 && @input.to_s( path50.start, path50.stop ) ))
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
          @state.following.push( TOKENS_FOLLOWING_object_body_IN_object_def_382 )
          object_body54 = object_body
          @state.following.pop
          @adaptor.add_child( root_0, object_body54.tree )

        end
        # --> action

        			obj = self.goto_parent()
        			if @is_array
        				total = __NUMBER52__.to_s.to_i
        				@arrays[obj.ref] = total
        				for i in 0..(total-1)
        					id = obj['_self'] + "[#{i}]"
        					@now[id] = deep_clone(obj)
        					@now[id]['_self'] = id
        					@now[id]['_classes'] = obj['_classes']
        					#puts 'is_array: ' + __ID48__.text + '[' + i.to_s + ']'
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
      char_literal55 = nil
      __NL56__ = nil
      char_literal60 = nil
      object_attribute57 = nil
      state_dependency58 = nil
      operator59 = nil

      tree_for_char_literal55 = nil
      tree_for_NL56 = nil
      tree_for_char_literal60 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 159:4: '{' ( NL )* ( object_attribute | state_dependency | operator )* '}'
        char_literal55 = match( T__20, TOKENS_FOLLOWING_T__20_IN_object_body_398 )

        tree_for_char_literal55 = @adaptor.create_with_payload( char_literal55 )
        @adaptor.add_child( root_0, tree_for_char_literal55 )

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
            __NL56__ = match( NL, TOKENS_FOLLOWING_NL_IN_object_body_400 )

            tree_for_NL56 = @adaptor.create_with_payload( __NL56__ )
            @adaptor.add_child( root_0, tree_for_NL56 )


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
            @state.following.push( TOKENS_FOLLOWING_object_attribute_IN_object_body_405 )
            object_attribute57 = object_attribute
            @state.following.pop
            @adaptor.add_child( root_0, object_attribute57.tree )

          when 2
            # at line 159:33: state_dependency
            @state.following.push( TOKENS_FOLLOWING_state_dependency_IN_object_body_409 )
            state_dependency58 = state_dependency
            @state.following.pop
            @adaptor.add_child( root_0, state_dependency58.tree )

          when 3
            # at line 159:52: operator
            @state.following.push( TOKENS_FOLLOWING_operator_IN_object_body_413 )
            operator59 = operator
            @state.following.pop
            @adaptor.add_child( root_0, operator59.tree )

          else
            break # out of loop for decision 27
          end
        end # loop for decision 27
        char_literal60 = match( T__21, TOKENS_FOLLOWING_T__21_IN_object_body_418 )

        tree_for_char_literal60 = @adaptor.create_with_payload( char_literal60 )
        @adaptor.add_child( root_0, tree_for_char_literal60 )

        # - - - - - - - rule clean up - - - - - - - -
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
      __ID62__ = nil
      __NULL64__ = nil
      __NL65__ = nil
      attribute61 = nil
      equals_op63 = nil

      tree_for_ID62 = nil
      tree_for_NULL64 = nil
      tree_for_NL65 = nil

      begin
        # at line 163:2: ( attribute | ID equals_op NULL ( NL )+ )
        alt_29 = 2
        look_29_0 = @input.peek( 1 )

        if ( look_29_0 == ID )
          look_29_1 = @input.peek( 2 )

          if ( look_29_1 == T__43 || look_29_1 == T__54 )
            look_29_2 = @input.peek( 3 )

            if ( look_29_2.between?( STRING, NUMBER ) || look_29_2.between?( BOOLEAN, MULTILINE_STRING ) || look_29_2 == T__36 )
              alt_29 = 1
            elsif ( look_29_2 == NULL )
              alt_29 = 2
            else
              raise NoViableAlternative( "", 29, 2 )
            end
          elsif ( look_29_1 == NL || look_29_1 == T__20 || look_29_1 == T__25 || look_29_1 == T__53 )
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
          @state.following.push( TOKENS_FOLLOWING_attribute_IN_object_attribute_429 )
          attribute61 = attribute
          @state.following.pop
          @adaptor.add_child( root_0, attribute61.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 164:4: ID equals_op NULL ( NL )+
          __ID62__ = match( ID, TOKENS_FOLLOWING_ID_IN_object_attribute_434 )

          tree_for_ID62 = @adaptor.create_with_payload( __ID62__ )
          @adaptor.add_child( root_0, tree_for_ID62 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_object_attribute_436 )
          equals_op63 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op63.tree )
          __NULL64__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_object_attribute_438 )

          tree_for_NULL64 = @adaptor.create_with_payload( __NULL64__ )
          @adaptor.add_child( root_0, tree_for_NULL64 )

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
              __NL65__ = match( NL, TOKENS_FOLLOWING_NL_IN_object_attribute_440 )

              tree_for_NL65 = @adaptor.create_with_payload( __NL65__ )
              @adaptor.add_child( root_0, tree_for_NL65 )


            else
              match_count_28 > 0 and break
              eee = EarlyExit(28)


              raise eee
            end
            match_count_28 += 1
          end

          # --> action
          	@now[__ID62__.text] = self.null_value	
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
      string_literal66 = nil
      __NL68__ = nil
      string_literal69 = nil
      __NL70__ = nil
      char_literal71 = nil
      __NL72__ = nil
      char_literal74 = nil
      __NL75__ = nil
      string_literal76 = nil
      __NL77__ = nil
      char_literal78 = nil
      __NL79__ = nil
      char_literal81 = nil
      __NL82__ = nil
      dep_effect67 = nil
      constraint_body73 = nil
      constraint_body80 = nil

      tree_for_string_literal66 = nil
      tree_for_NL68 = nil
      tree_for_string_literal69 = nil
      tree_for_NL70 = nil
      tree_for_char_literal71 = nil
      tree_for_NL72 = nil
      tree_for_char_literal74 = nil
      tree_for_NL75 = nil
      tree_for_string_literal76 = nil
      tree_for_NL77 = nil
      tree_for_char_literal78 = nil
      tree_for_NL79 = nil
      tree_for_char_literal81 = nil
      tree_for_NL82 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 169:4: 'if' dep_effect ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )* ( NL )+
        string_literal66 = match( T__28, TOKENS_FOLLOWING_T__28_IN_state_dependency_456 )

        tree_for_string_literal66 = @adaptor.create_with_payload( string_literal66 )
        @adaptor.add_child( root_0, tree_for_string_literal66 )

        @state.following.push( TOKENS_FOLLOWING_dep_effect_IN_state_dependency_460 )
        dep_effect67 = dep_effect
        @state.following.pop
        @adaptor.add_child( root_0, dep_effect67.tree )
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
            __NL68__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_462 )

            tree_for_NL68 = @adaptor.create_with_payload( __NL68__ )
            @adaptor.add_child( root_0, tree_for_NL68 )


          else
            break # out of loop for decision 30
          end
        end # loop for decision 30
        string_literal69 = match( T__29, TOKENS_FOLLOWING_T__29_IN_state_dependency_465 )

        tree_for_string_literal69 = @adaptor.create_with_payload( string_literal69 )
        @adaptor.add_child( root_0, tree_for_string_literal69 )

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
            __NL70__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_467 )

            tree_for_NL70 = @adaptor.create_with_payload( __NL70__ )
            @adaptor.add_child( root_0, tree_for_NL70 )


          else
            break # out of loop for decision 31
          end
        end # loop for decision 31
        char_literal71 = match( T__20, TOKENS_FOLLOWING_T__20_IN_state_dependency_470 )

        tree_for_char_literal71 = @adaptor.create_with_payload( char_literal71 )
        @adaptor.add_child( root_0, tree_for_char_literal71 )

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
            __NL72__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_474 )

            tree_for_NL72 = @adaptor.create_with_payload( __NL72__ )
            @adaptor.add_child( root_0, tree_for_NL72 )


          else
            break # out of loop for decision 32
          end
        end # loop for decision 32
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_state_dependency_477 )
        constraint_body73 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body73.tree )
        char_literal74 = match( T__21, TOKENS_FOLLOWING_T__21_IN_state_dependency_482 )

        tree_for_char_literal74 = @adaptor.create_with_payload( char_literal74 )
        @adaptor.add_child( root_0, tree_for_char_literal74 )

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
                __NL75__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_488 )

                tree_for_NL75 = @adaptor.create_with_payload( __NL75__ )
                @adaptor.add_child( root_0, tree_for_NL75 )


              else
                break # out of loop for decision 33
              end
            end # loop for decision 33
            string_literal76 = match( T__30, TOKENS_FOLLOWING_T__30_IN_state_dependency_491 )

            tree_for_string_literal76 = @adaptor.create_with_payload( string_literal76 )
            @adaptor.add_child( root_0, tree_for_string_literal76 )

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
                __NL77__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_493 )

                tree_for_NL77 = @adaptor.create_with_payload( __NL77__ )
                @adaptor.add_child( root_0, tree_for_NL77 )


              else
                break # out of loop for decision 34
              end
            end # loop for decision 34
            char_literal78 = match( T__20, TOKENS_FOLLOWING_T__20_IN_state_dependency_496 )

            tree_for_char_literal78 = @adaptor.create_with_payload( char_literal78 )
            @adaptor.add_child( root_0, tree_for_char_literal78 )

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
                __NL79__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_500 )

                tree_for_NL79 = @adaptor.create_with_payload( __NL79__ )
                @adaptor.add_child( root_0, tree_for_NL79 )


              else
                break # out of loop for decision 35
              end
            end # loop for decision 35
            @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_state_dependency_503 )
            constraint_body80 = constraint_body
            @state.following.pop
            @adaptor.add_child( root_0, constraint_body80.tree )
            char_literal81 = match( T__21, TOKENS_FOLLOWING_T__21_IN_state_dependency_507 )

            tree_for_char_literal81 = @adaptor.create_with_payload( char_literal81 )
            @adaptor.add_child( root_0, tree_for_char_literal81 )


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
            __NL82__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_513 )

            tree_for_NL82 = @adaptor.create_with_payload( __NL82__ )
            @adaptor.add_child( root_0, tree_for_NL82 )


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
      __NULL86__ = nil
      reference83 = nil
      equals_op84 = nil
      value85 = nil

      tree_for_NULL86 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 180:4: reference equals_op ( value | NULL )
        @state.following.push( TOKENS_FOLLOWING_reference_IN_dep_effect_525 )
        reference83 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference83.tree )
        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_dep_effect_527 )
        equals_op84 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op84.tree )
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
          @state.following.push( TOKENS_FOLLOWING_value_IN_dep_effect_534 )
          value85 = value
          @state.following.pop
          @adaptor.add_child( root_0, value85.tree )

        when 2
          # at line 182:5: NULL
          __NULL86__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_dep_effect_540 )

          tree_for_NULL86 = @adaptor.create_with_payload( __NULL86__ )
          @adaptor.add_child( root_0, tree_for_NULL86 )


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
      string_literal87 = nil
      __ID88__ = nil
      char_literal89 = nil
      __NL90__ = nil
      string_literal91 = nil
      __NUMBER93__ = nil
      __NL94__ = nil
      char_literal97 = nil
      __NL98__ = nil
      equals_op92 = nil
      op_conditions95 = nil
      op_effects96 = nil

      tree_for_string_literal87 = nil
      tree_for_ID88 = nil
      tree_for_char_literal89 = nil
      tree_for_NL90 = nil
      tree_for_string_literal91 = nil
      tree_for_NUMBER93 = nil
      tree_for_NL94 = nil
      tree_for_char_literal97 = nil
      tree_for_NL98 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 187:4: 'operator' ID '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( op_conditions )? op_effects '}' ( NL )+
        string_literal87 = match( T__31, TOKENS_FOLLOWING_T__31_IN_operator_556 )

        tree_for_string_literal87 = @adaptor.create_with_payload( string_literal87 )
        @adaptor.add_child( root_0, tree_for_string_literal87 )

        __ID88__ = match( ID, TOKENS_FOLLOWING_ID_IN_operator_558 )

        tree_for_ID88 = @adaptor.create_with_payload( __ID88__ )
        @adaptor.add_child( root_0, tree_for_ID88 )

        char_literal89 = match( T__20, TOKENS_FOLLOWING_T__20_IN_operator_560 )

        tree_for_char_literal89 = @adaptor.create_with_payload( char_literal89 )
        @adaptor.add_child( root_0, tree_for_char_literal89 )

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
            __NL90__ = match( NL, TOKENS_FOLLOWING_NL_IN_operator_562 )

            tree_for_NL90 = @adaptor.create_with_payload( __NL90__ )
            @adaptor.add_child( root_0, tree_for_NL90 )


          else
            break # out of loop for decision 39
          end
        end # loop for decision 39
        # --> action

        			@now[__ID88__.text] = { '_self' => __ID88__.text,
        				'_context' => 'operator',
        				'_parent' => @now,
        				'_cost' => 1,
        				'_conditions' => { '_context' => 'constraint' },
        				'_effects' => { '_context' => 'mutation' }
        			}
        			@now = @now[__ID88__.text]
        		
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
          string_literal91 = match( T__32, TOKENS_FOLLOWING_T__32_IN_operator_573 )

          tree_for_string_literal91 = @adaptor.create_with_payload( string_literal91 )
          @adaptor.add_child( root_0, tree_for_string_literal91 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_operator_575 )
          equals_op92 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op92.tree )
          __NUMBER93__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_operator_577 )

          tree_for_NUMBER93 = @adaptor.create_with_payload( __NUMBER93__ )
          @adaptor.add_child( root_0, tree_for_NUMBER93 )

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
              __NL94__ = match( NL, TOKENS_FOLLOWING_NL_IN_operator_579 )

              tree_for_NL94 = @adaptor.create_with_payload( __NL94__ )
              @adaptor.add_child( root_0, tree_for_NL94 )


            else
              match_count_40 > 0 and break
              eee = EarlyExit(40)


              raise eee
            end
            match_count_40 += 1
          end

          # --> action
          	@now['_cost'] = __NUMBER93__.text.to_i	
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
          @state.following.push( TOKENS_FOLLOWING_op_conditions_IN_operator_598 )
          op_conditions95 = op_conditions
          @state.following.pop
          @adaptor.add_child( root_0, op_conditions95.tree )

        end
        @state.following.push( TOKENS_FOLLOWING_op_effects_IN_operator_601 )
        op_effects96 = op_effects
        @state.following.pop
        @adaptor.add_child( root_0, op_effects96.tree )
        char_literal97 = match( T__21, TOKENS_FOLLOWING_T__21_IN_operator_605 )

        tree_for_char_literal97 = @adaptor.create_with_payload( char_literal97 )
        @adaptor.add_child( root_0, tree_for_char_literal97 )

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
            __NL98__ = match( NL, TOKENS_FOLLOWING_NL_IN_operator_607 )

            tree_for_NL98 = @adaptor.create_with_payload( __NL98__ )
            @adaptor.add_child( root_0, tree_for_NL98 )


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
      __ID99__ = nil
      __NL102__ = nil
      equals_op100 = nil
      reference101 = nil

      tree_for_ID99 = nil
      tree_for_NL102 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 208:4: ID equals_op reference ( NL )+
        __ID99__ = match( ID, TOKENS_FOLLOWING_ID_IN_op_param_623 )

        tree_for_ID99 = @adaptor.create_with_payload( __ID99__ )
        @adaptor.add_child( root_0, tree_for_ID99 )

        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_op_param_625 )
        equals_op100 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op100.tree )
        @state.following.push( TOKENS_FOLLOWING_reference_IN_op_param_627 )
        reference101 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference101.tree )
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
            __NL102__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_param_629 )

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
        	@now[__ID99__.text] = ( reference101.nil? ? nil : reference101.val )	
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
      string_literal103 = nil
      char_literal104 = nil
      __NL105__ = nil
      char_literal107 = nil
      __NL108__ = nil
      op_statement106 = nil

      tree_for_string_literal103 = nil
      tree_for_char_literal104 = nil
      tree_for_NL105 = nil
      tree_for_char_literal107 = nil
      tree_for_NL108 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 213:4: 'conditions' '{' ( NL )* ( op_statement )* '}' ( NL )+
        string_literal103 = match( T__33, TOKENS_FOLLOWING_T__33_IN_op_conditions_645 )

        tree_for_string_literal103 = @adaptor.create_with_payload( string_literal103 )
        @adaptor.add_child( root_0, tree_for_string_literal103 )

        char_literal104 = match( T__20, TOKENS_FOLLOWING_T__20_IN_op_conditions_647 )

        tree_for_char_literal104 = @adaptor.create_with_payload( char_literal104 )
        @adaptor.add_child( root_0, tree_for_char_literal104 )

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
            __NL105__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_conditions_649 )

            tree_for_NL105 = @adaptor.create_with_payload( __NL105__ )
            @adaptor.add_child( root_0, tree_for_NL105 )


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
            @state.following.push( TOKENS_FOLLOWING_op_statement_IN_op_conditions_658 )
            op_statement106 = op_statement
            @state.following.pop
            @adaptor.add_child( root_0, op_statement106.tree )

          else
            break # out of loop for decision 46
          end
        end # loop for decision 46
        char_literal107 = match( T__21, TOKENS_FOLLOWING_T__21_IN_op_conditions_663 )

        tree_for_char_literal107 = @adaptor.create_with_payload( char_literal107 )
        @adaptor.add_child( root_0, tree_for_char_literal107 )

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
            __NL108__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_conditions_665 )

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


        # at line 224:4: 'effects' '{' ( NL )* ( op_statement )* '}' ( NL )+
        string_literal109 = match( T__34, TOKENS_FOLLOWING_T__34_IN_op_effects_681 )

        tree_for_string_literal109 = @adaptor.create_with_payload( string_literal109 )
        @adaptor.add_child( root_0, tree_for_string_literal109 )

        char_literal110 = match( T__20, TOKENS_FOLLOWING_T__20_IN_op_effects_683 )

        tree_for_char_literal110 = @adaptor.create_with_payload( char_literal110 )
        @adaptor.add_child( root_0, tree_for_char_literal110 )

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
            __NL111__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_effects_685 )

            tree_for_NL111 = @adaptor.create_with_payload( __NL111__ )
            @adaptor.add_child( root_0, tree_for_NL111 )


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
            @state.following.push( TOKENS_FOLLOWING_op_statement_IN_op_effects_694 )
            op_statement112 = op_statement
            @state.following.pop
            @adaptor.add_child( root_0, op_statement112.tree )

          else
            break # out of loop for decision 49
          end
        end # loop for decision 49
        char_literal113 = match( T__21, TOKENS_FOLLOWING_T__21_IN_op_effects_699 )

        tree_for_char_literal113 = @adaptor.create_with_payload( char_literal113 )
        @adaptor.add_child( root_0, tree_for_char_literal113 )

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
            __NL114__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_effects_701 )

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
      __NL118__ = nil
      reference115 = nil
      equals_op116 = nil
      value117 = nil

      tree_for_NL118 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 235:4: reference equals_op value ( NL )+
        @state.following.push( TOKENS_FOLLOWING_reference_IN_op_statement_717 )
        reference115 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference115.tree )
        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_op_statement_719 )
        equals_op116 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op116.tree )
        @state.following.push( TOKENS_FOLLOWING_value_IN_op_statement_721 )
        value117 = value
        @state.following.pop
        @adaptor.add_child( root_0, value117.tree )
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
            __NL118__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_statement_723 )

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
        	@now[( reference115.nil? ? nil : reference115.val )] = ( value117.nil? ? nil : value117.val )	
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
      string_literal119 = nil
      __ID120__ = nil
      char_literal122 = nil
      __NL123__ = nil
      string_literal124 = nil
      __NUMBER126__ = nil
      __NL127__ = nil
      char_literal130 = nil
      __NL131__ = nil
      parameters121 = nil
      equals_op125 = nil
      conditions128 = nil
      effects129 = nil

      tree_for_string_literal119 = nil
      tree_for_ID120 = nil
      tree_for_char_literal122 = nil
      tree_for_NL123 = nil
      tree_for_string_literal124 = nil
      tree_for_NUMBER126 = nil
      tree_for_NL127 = nil
      tree_for_char_literal130 = nil
      tree_for_NL131 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 240:4: 'procedure' ID ( parameters )? '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( conditions )? effects '}' ( NL )+
        string_literal119 = match( T__35, TOKENS_FOLLOWING_T__35_IN_procedure_739 )

        tree_for_string_literal119 = @adaptor.create_with_payload( string_literal119 )
        @adaptor.add_child( root_0, tree_for_string_literal119 )

        __ID120__ = match( ID, TOKENS_FOLLOWING_ID_IN_procedure_741 )

        tree_for_ID120 = @adaptor.create_with_payload( __ID120__ )
        @adaptor.add_child( root_0, tree_for_ID120 )

        # --> action

        			@now[__ID120__.text] = { '_self' => __ID120__.text,
        				'_context' => 'procedure',
        				'_parent' => @now,
        				'_cost' => 1,
        				'_conditions' => { '_context' => 'constraint', '_type' => 'and' },
        				'_effects' => { '_context' => 'mutation', '_type' => 'and' }
        			}
        			@now = @now[__ID120__.text]
        		
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
          @state.following.push( TOKENS_FOLLOWING_parameters_IN_procedure_749 )
          parameters121 = parameters
          @state.following.pop
          @adaptor.add_child( root_0, parameters121.tree )

        end
        char_literal122 = match( T__20, TOKENS_FOLLOWING_T__20_IN_procedure_752 )

        tree_for_char_literal122 = @adaptor.create_with_payload( char_literal122 )
        @adaptor.add_child( root_0, tree_for_char_literal122 )

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
            __NL123__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_754 )

            tree_for_NL123 = @adaptor.create_with_payload( __NL123__ )
            @adaptor.add_child( root_0, tree_for_NL123 )


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
          string_literal124 = match( T__32, TOKENS_FOLLOWING_T__32_IN_procedure_762 )

          tree_for_string_literal124 = @adaptor.create_with_payload( string_literal124 )
          @adaptor.add_child( root_0, tree_for_string_literal124 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_procedure_764 )
          equals_op125 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op125.tree )
          __NUMBER126__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_procedure_766 )

          tree_for_NUMBER126 = @adaptor.create_with_payload( __NUMBER126__ )
          @adaptor.add_child( root_0, tree_for_NUMBER126 )

          # --> action
          	@now['_cost'] = __NUMBER126__.text.to_i	
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
              __NL127__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_776 )

              tree_for_NL127 = @adaptor.create_with_payload( __NL127__ )
              @adaptor.add_child( root_0, tree_for_NL127 )


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
          @state.following.push( TOKENS_FOLLOWING_conditions_IN_procedure_786 )
          conditions128 = conditions
          @state.following.pop
          @adaptor.add_child( root_0, conditions128.tree )

        end
        @state.following.push( TOKENS_FOLLOWING_effects_IN_procedure_789 )
        effects129 = effects
        @state.following.pop
        @adaptor.add_child( root_0, effects129.tree )
        char_literal130 = match( T__21, TOKENS_FOLLOWING_T__21_IN_procedure_791 )

        tree_for_char_literal130 = @adaptor.create_with_payload( char_literal130 )
        @adaptor.add_child( root_0, tree_for_char_literal130 )

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
            __NL131__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_793 )

            tree_for_NL131 = @adaptor.create_with_payload( __NL131__ )
            @adaptor.add_child( root_0, tree_for_NL131 )


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
      char_literal132 = nil
      char_literal134 = nil
      char_literal136 = nil
      parameter133 = nil
      parameter135 = nil

      tree_for_char_literal132 = nil
      tree_for_char_literal134 = nil
      tree_for_char_literal136 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 261:4: '(' parameter ( ',' parameter )* ')'
        char_literal132 = match( T__36, TOKENS_FOLLOWING_T__36_IN_parameters_809 )

        tree_for_char_literal132 = @adaptor.create_with_payload( char_literal132 )
        @adaptor.add_child( root_0, tree_for_char_literal132 )

        @state.following.push( TOKENS_FOLLOWING_parameter_IN_parameters_811 )
        parameter133 = parameter
        @state.following.pop
        @adaptor.add_child( root_0, parameter133.tree )
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
            char_literal134 = match( T__37, TOKENS_FOLLOWING_T__37_IN_parameters_814 )

            tree_for_char_literal134 = @adaptor.create_with_payload( char_literal134 )
            @adaptor.add_child( root_0, tree_for_char_literal134 )

            @state.following.push( TOKENS_FOLLOWING_parameter_IN_parameters_816 )
            parameter135 = parameter
            @state.following.pop
            @adaptor.add_child( root_0, parameter135.tree )

          else
            break # out of loop for decision 58
          end
        end # loop for decision 58
        char_literal136 = match( T__38, TOKENS_FOLLOWING_T__38_IN_parameters_820 )

        tree_for_char_literal136 = @adaptor.create_with_payload( char_literal136 )
        @adaptor.add_child( root_0, tree_for_char_literal136 )

        # - - - - - - - rule clean up - - - - - - - -
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
      __ID137__ = nil
      __ID139__ = nil
      string_literal140 = nil
      reference_type138 = nil
      path141 = nil

      tree_for_ID137 = nil
      tree_for_ID139 = nil
      tree_for_string_literal140 = nil

      begin
        # at line 265:2: ( ID reference_type | ID 'areall' path )
        alt_59 = 2
        look_59_0 = @input.peek( 1 )

        if ( look_59_0 == ID )
          look_59_1 = @input.peek( 2 )

          if ( look_59_1 == T__39 )
            alt_59 = 2
          elsif ( look_59_1 == T__53 )
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
          __ID137__ = match( ID, TOKENS_FOLLOWING_ID_IN_parameter_832 )

          tree_for_ID137 = @adaptor.create_with_payload( __ID137__ )
          @adaptor.add_child( root_0, tree_for_ID137 )

          @state.following.push( TOKENS_FOLLOWING_reference_type_IN_parameter_834 )
          reference_type138 = reference_type
          @state.following.pop
          @adaptor.add_child( root_0, reference_type138.tree )
          # --> action
          	@now[__ID137__.text] = ( reference_type138.nil? ? nil : reference_type138.val )	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 267:4: ID 'areall' path
          __ID139__ = match( ID, TOKENS_FOLLOWING_ID_IN_parameter_843 )

          tree_for_ID139 = @adaptor.create_with_payload( __ID139__ )
          @adaptor.add_child( root_0, tree_for_ID139 )

          string_literal140 = match( T__39, TOKENS_FOLLOWING_T__39_IN_parameter_845 )

          tree_for_string_literal140 = @adaptor.create_with_payload( string_literal140 )
          @adaptor.add_child( root_0, tree_for_string_literal140 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_parameter_847 )
          path141 = path
          @state.following.pop
          @adaptor.add_child( root_0, path141.tree )
          # --> action

          			@now[__ID139__.text] = { '_context' => 'all',
          				'_isa' => self.to_ref(( path141 && @input.to_s( path141.start, path141.stop ) )),
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
      string_literal142 = nil
      char_literal143 = nil
      __NL144__ = nil
      char_literal146 = nil
      __NL147__ = nil
      constraint_body145 = nil

      tree_for_string_literal142 = nil
      tree_for_char_literal143 = nil
      tree_for_NL144 = nil
      tree_for_char_literal146 = nil
      tree_for_NL147 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 277:4: 'conditions' '{' ( NL )* constraint_body '}' ( NL )+
        string_literal142 = match( T__33, TOKENS_FOLLOWING_T__33_IN_conditions_862 )

        tree_for_string_literal142 = @adaptor.create_with_payload( string_literal142 )
        @adaptor.add_child( root_0, tree_for_string_literal142 )

        # --> action

        			@now['_conditions']['_parent'] = @now
        			@now = @now['_conditions']
        		
        # <-- action
        char_literal143 = match( T__20, TOKENS_FOLLOWING_T__20_IN_conditions_870 )

        tree_for_char_literal143 = @adaptor.create_with_payload( char_literal143 )
        @adaptor.add_child( root_0, tree_for_char_literal143 )

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
            __NL144__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditions_872 )

            tree_for_NL144 = @adaptor.create_with_payload( __NL144__ )
            @adaptor.add_child( root_0, tree_for_NL144 )


          else
            break # out of loop for decision 60
          end
        end # loop for decision 60
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_conditions_875 )
        constraint_body145 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body145.tree )
        char_literal146 = match( T__21, TOKENS_FOLLOWING_T__21_IN_conditions_877 )

        tree_for_char_literal146 = @adaptor.create_with_payload( char_literal146 )
        @adaptor.add_child( root_0, tree_for_char_literal146 )

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
            __NL147__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditions_879 )

            tree_for_NL147 = @adaptor.create_with_payload( __NL147__ )
            @adaptor.add_child( root_0, tree_for_NL147 )


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
      string_literal148 = nil
      char_literal149 = nil
      __NL150__ = nil
      char_literal152 = nil
      __NL153__ = nil
      mutation_body151 = nil

      tree_for_string_literal148 = nil
      tree_for_char_literal149 = nil
      tree_for_NL150 = nil
      tree_for_char_literal152 = nil
      tree_for_NL153 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 288:4: 'effects' '{' ( NL )* mutation_body '}' ( NL )+
        string_literal148 = match( T__34, TOKENS_FOLLOWING_T__34_IN_effects_896 )

        tree_for_string_literal148 = @adaptor.create_with_payload( string_literal148 )
        @adaptor.add_child( root_0, tree_for_string_literal148 )

        # --> action

        			@now['_effects']['_parent'] = @now
        			@now = @now['_effects']
        		
        # <-- action
        char_literal149 = match( T__20, TOKENS_FOLLOWING_T__20_IN_effects_904 )

        tree_for_char_literal149 = @adaptor.create_with_payload( char_literal149 )
        @adaptor.add_child( root_0, tree_for_char_literal149 )

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
            __NL150__ = match( NL, TOKENS_FOLLOWING_NL_IN_effects_906 )

            tree_for_NL150 = @adaptor.create_with_payload( __NL150__ )
            @adaptor.add_child( root_0, tree_for_NL150 )


          else
            break # out of loop for decision 62
          end
        end # loop for decision 62
        @state.following.push( TOKENS_FOLLOWING_mutation_body_IN_effects_912 )
        mutation_body151 = mutation_body
        @state.following.pop
        @adaptor.add_child( root_0, mutation_body151.tree )
        char_literal152 = match( T__21, TOKENS_FOLLOWING_T__21_IN_effects_917 )

        tree_for_char_literal152 = @adaptor.create_with_payload( char_literal152 )
        @adaptor.add_child( root_0, tree_for_char_literal152 )

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
            __NL153__ = match( NL, TOKENS_FOLLOWING_NL_IN_effects_919 )

            tree_for_NL153 = @adaptor.create_with_payload( __NL153__ )
            @adaptor.add_child( root_0, tree_for_NL153 )


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

    ConstraintReturnValue = define_return_scope 

    # 
    # parser rule constraint
    # 
    # (in SFP.g)
    # 299:1: constraint : ID 'constraint' '{' ( NL )* constraint_body '}' ( NL )+ ;
    # 
    def constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = ConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID154__ = nil
      string_literal155 = nil
      char_literal156 = nil
      __NL157__ = nil
      char_literal159 = nil
      __NL160__ = nil
      constraint_body158 = nil

      tree_for_ID154 = nil
      tree_for_string_literal155 = nil
      tree_for_char_literal156 = nil
      tree_for_NL157 = nil
      tree_for_char_literal159 = nil
      tree_for_NL160 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 300:4: ID 'constraint' '{' ( NL )* constraint_body '}' ( NL )+
        __ID154__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_935 )

        tree_for_ID154 = @adaptor.create_with_payload( __ID154__ )
        @adaptor.add_child( root_0, tree_for_ID154 )

        string_literal155 = match( T__40, TOKENS_FOLLOWING_T__40_IN_constraint_937 )

        tree_for_string_literal155 = @adaptor.create_with_payload( string_literal155 )
        @adaptor.add_child( root_0, tree_for_string_literal155 )

        # --> action

        			@now[__ID154__.text] = { '_self' => __ID154__.text,
        				'_context' => 'constraint',
        				'_type' => 'and',
        				'_parent' => @now
        			}
        			@now = @now[__ID154__.text]
        		
        # <-- action
        char_literal156 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_945 )

        tree_for_char_literal156 = @adaptor.create_with_payload( char_literal156 )
        @adaptor.add_child( root_0, tree_for_char_literal156 )

        # at line 309:7: ( NL )*
        while true # decision 64
          alt_64 = 2
          look_64_0 = @input.peek( 1 )

          if ( look_64_0 == NL )
            alt_64 = 1

          end
          case alt_64
          when 1
            # at line 309:7: NL
            __NL157__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_947 )

            tree_for_NL157 = @adaptor.create_with_payload( __NL157__ )
            @adaptor.add_child( root_0, tree_for_NL157 )


          else
            break # out of loop for decision 64
          end
        end # loop for decision 64
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_constraint_950 )
        constraint_body158 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body158.tree )
        char_literal159 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_952 )

        tree_for_char_literal159 = @adaptor.create_with_payload( char_literal159 )
        @adaptor.add_child( root_0, tree_for_char_literal159 )

        # at file 309:31: ( NL )+
        match_count_65 = 0
        while true
          alt_65 = 2
          look_65_0 = @input.peek( 1 )

          if ( look_65_0 == NL )
            alt_65 = 1

          end
          case alt_65
          when 1
            # at line 309:31: NL
            __NL160__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_954 )

            tree_for_NL160 = @adaptor.create_with_payload( __NL160__ )
            @adaptor.add_child( root_0, tree_for_NL160 )


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
        # trace_out( __method__, 25 )

      end
      
      return return_value
    end

    ConstraintBodyReturnValue = define_return_scope 

    # 
    # parser rule constraint_body
    # 
    # (in SFP.g)
    # 313:1: constraint_body : ( ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+ )* ;
    # 
    def constraint_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = ConstraintBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL164__ = nil
      constraint_statement161 = nil
      constraint_namespace162 = nil
      constraint_iterator163 = nil

      tree_for_NL164 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 314:4: ( ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+ )*
        # at line 314:4: ( ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+ )*
        while true # decision 68
          alt_68 = 2
          look_68_0 = @input.peek( 1 )

          if ( look_68_0 == ID || look_68_0 == T__28 || look_68_0 == T__41 || look_68_0 == T__47 )
            alt_68 = 1

          end
          case alt_68
          when 1
            # at line 315:4: ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+
            # at line 315:4: ( constraint_statement | constraint_namespace | constraint_iterator )
            alt_66 = 3
            alt_66 = @dfa66.predict( @input )
            case alt_66
            when 1
              # at line 315:6: constraint_statement
              @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_977 )
              constraint_statement161 = constraint_statement
              @state.following.pop
              @adaptor.add_child( root_0, constraint_statement161.tree )
              # --> action

              					@now[( constraint_statement161.nil? ? nil : constraint_statement161.key )] = ( constraint_statement161.nil? ? nil : constraint_statement161.val )
              				
              # <-- action

            when 2
              # at line 319:6: constraint_namespace
              @state.following.push( TOKENS_FOLLOWING_constraint_namespace_IN_constraint_body_990 )
              constraint_namespace162 = constraint_namespace
              @state.following.pop
              @adaptor.add_child( root_0, constraint_namespace162.tree )

            when 3
              # at line 320:6: constraint_iterator
              @state.following.push( TOKENS_FOLLOWING_constraint_iterator_IN_constraint_body_997 )
              constraint_iterator163 = constraint_iterator
              @state.following.pop
              @adaptor.add_child( root_0, constraint_iterator163.tree )

            end
            # at file 322:3: ( NL )+
            match_count_67 = 0
            while true
              alt_67 = 2
              look_67_0 = @input.peek( 1 )

              if ( look_67_0 == NL )
                alt_67 = 1

              end
              case alt_67
              when 1
                # at line 322:3: NL
                __NL164__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_body_1006 )

                tree_for_NL164 = @adaptor.create_with_payload( __NL164__ )
                @adaptor.add_child( root_0, tree_for_NL164 )


              else
                match_count_67 > 0 and break
                eee = EarlyExit(67)


                raise eee
              end
              match_count_67 += 1
            end


          else
            break # out of loop for decision 68
          end
        end # loop for decision 68
        # - - - - - - - rule clean up - - - - - - - -
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
    # 325:1: constraint_namespace : path ( NL )* '{' ( NL )* ( constraint_statement ( NL )+ )* '}' ;
    # 
    def constraint_namespace
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = ConstraintNamespaceReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL166__ = nil
      char_literal167 = nil
      __NL168__ = nil
      __NL170__ = nil
      char_literal171 = nil
      path165 = nil
      constraint_statement169 = nil

      tree_for_NL166 = nil
      tree_for_char_literal167 = nil
      tree_for_NL168 = nil
      tree_for_NL170 = nil
      tree_for_char_literal171 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 326:4: path ( NL )* '{' ( NL )* ( constraint_statement ( NL )+ )* '}'
        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_namespace_1020 )
        path165 = path
        @state.following.pop
        @adaptor.add_child( root_0, path165.tree )
        # at line 326:9: ( NL )*
        while true # decision 69
          alt_69 = 2
          look_69_0 = @input.peek( 1 )

          if ( look_69_0 == NL )
            alt_69 = 1

          end
          case alt_69
          when 1
            # at line 326:9: NL
            __NL166__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1022 )

            tree_for_NL166 = @adaptor.create_with_payload( __NL166__ )
            @adaptor.add_child( root_0, tree_for_NL166 )


          else
            break # out of loop for decision 69
          end
        end # loop for decision 69
        char_literal167 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_namespace_1025 )

        tree_for_char_literal167 = @adaptor.create_with_payload( char_literal167 )
        @adaptor.add_child( root_0, tree_for_char_literal167 )

        # at line 326:17: ( NL )*
        while true # decision 70
          alt_70 = 2
          look_70_0 = @input.peek( 1 )

          if ( look_70_0 == NL )
            alt_70 = 1

          end
          case alt_70
          when 1
            # at line 326:17: NL
            __NL168__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1027 )

            tree_for_NL168 = @adaptor.create_with_payload( __NL168__ )
            @adaptor.add_child( root_0, tree_for_NL168 )


          else
            break # out of loop for decision 70
          end
        end # loop for decision 70
        # at line 326:21: ( constraint_statement ( NL )+ )*
        while true # decision 72
          alt_72 = 2
          look_72_0 = @input.peek( 1 )

          if ( look_72_0 == ID || look_72_0 == T__28 || look_72_0 == T__47 )
            alt_72 = 1

          end
          case alt_72
          when 1
            # at line 326:22: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_namespace_1031 )
            constraint_statement169 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement169.tree )
            # --> action

            			key = self.to_ref(( path165 && @input.to_s( path165.start, path165.stop ) ) + '.' + ( constraint_statement169.nil? ? nil : constraint_statement169.key )[2,( constraint_statement169.nil? ? nil : constraint_statement169.key ).length])
            			@now[key] = ( constraint_statement169.nil? ? nil : constraint_statement169.val )
            		
            # <-- action
            # at file 331:3: ( NL )+
            match_count_71 = 0
            while true
              alt_71 = 2
              look_71_0 = @input.peek( 1 )

              if ( look_71_0 == NL )
                alt_71 = 1

              end
              case alt_71
              when 1
                # at line 331:3: NL
                __NL170__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1039 )

                tree_for_NL170 = @adaptor.create_with_payload( __NL170__ )
                @adaptor.add_child( root_0, tree_for_NL170 )


              else
                match_count_71 > 0 and break
                eee = EarlyExit(71)


                raise eee
              end
              match_count_71 += 1
            end


          else
            break # out of loop for decision 72
          end
        end # loop for decision 72
        char_literal171 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_namespace_1044 )

        tree_for_char_literal171 = @adaptor.create_with_payload( char_literal171 )
        @adaptor.add_child( root_0, tree_for_char_literal171 )

        # - - - - - - - rule clean up - - - - - - - -
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
    # 334:1: constraint_iterator : 'foreach' '(' path 'as' ID ')' ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ )* '}' ;
    # 
    def constraint_iterator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = ConstraintIteratorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal172 = nil
      char_literal173 = nil
      string_literal175 = nil
      __ID176__ = nil
      char_literal177 = nil
      __NL178__ = nil
      char_literal179 = nil
      __NL180__ = nil
      __NL182__ = nil
      char_literal183 = nil
      path174 = nil
      constraint_statement181 = nil

      tree_for_string_literal172 = nil
      tree_for_char_literal173 = nil
      tree_for_string_literal175 = nil
      tree_for_ID176 = nil
      tree_for_char_literal177 = nil
      tree_for_NL178 = nil
      tree_for_char_literal179 = nil
      tree_for_NL180 = nil
      tree_for_NL182 = nil
      tree_for_char_literal183 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 335:4: 'foreach' '(' path 'as' ID ')' ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ )* '}'
        string_literal172 = match( T__41, TOKENS_FOLLOWING_T__41_IN_constraint_iterator_1055 )

        tree_for_string_literal172 = @adaptor.create_with_payload( string_literal172 )
        @adaptor.add_child( root_0, tree_for_string_literal172 )

        char_literal173 = match( T__36, TOKENS_FOLLOWING_T__36_IN_constraint_iterator_1057 )

        tree_for_char_literal173 = @adaptor.create_with_payload( char_literal173 )
        @adaptor.add_child( root_0, tree_for_char_literal173 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_iterator_1059 )
        path174 = path
        @state.following.pop
        @adaptor.add_child( root_0, path174.tree )
        string_literal175 = match( T__42, TOKENS_FOLLOWING_T__42_IN_constraint_iterator_1061 )

        tree_for_string_literal175 = @adaptor.create_with_payload( string_literal175 )
        @adaptor.add_child( root_0, tree_for_string_literal175 )

        __ID176__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_iterator_1063 )

        tree_for_ID176 = @adaptor.create_with_payload( __ID176__ )
        @adaptor.add_child( root_0, tree_for_ID176 )

        char_literal177 = match( T__38, TOKENS_FOLLOWING_T__38_IN_constraint_iterator_1065 )

        tree_for_char_literal177 = @adaptor.create_with_payload( char_literal177 )
        @adaptor.add_child( root_0, tree_for_char_literal177 )

        # at line 335:35: ( NL )*
        while true # decision 73
          alt_73 = 2
          look_73_0 = @input.peek( 1 )

          if ( look_73_0 == NL )
            alt_73 = 1

          end
          case alt_73
          when 1
            # at line 335:35: NL
            __NL178__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1067 )

            tree_for_NL178 = @adaptor.create_with_payload( __NL178__ )
            @adaptor.add_child( root_0, tree_for_NL178 )


          else
            break # out of loop for decision 73
          end
        end # loop for decision 73
        char_literal179 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_iterator_1070 )

        tree_for_char_literal179 = @adaptor.create_with_payload( char_literal179 )
        @adaptor.add_child( root_0, tree_for_char_literal179 )

        # at file 335:43: ( NL )+
        match_count_74 = 0
        while true
          alt_74 = 2
          look_74_0 = @input.peek( 1 )

          if ( look_74_0 == NL )
            alt_74 = 1

          end
          case alt_74
          when 1
            # at line 335:43: NL
            __NL180__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1072 )

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

        			id = self.next_id.to_s
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'iterator',
        				'_self' => id,
        				'_value' => ( path174 && @input.to_s( path174.start, path174.stop ) ),
        				'_variable' => __ID176__.text
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
        # at line 355:3: ( constraint_statement ( NL )+ )*
        while true # decision 76
          alt_76 = 2
          look_76_0 = @input.peek( 1 )

          if ( look_76_0 == ID || look_76_0 == T__28 || look_76_0 == T__47 )
            alt_76 = 1

          end
          case alt_76
          when 1
            # at line 355:4: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_iterator_1082 )
            constraint_statement181 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement181.tree )
            # --> action

            			@now[( constraint_statement181.nil? ? nil : constraint_statement181.key )] = ( constraint_statement181.nil? ? nil : constraint_statement181.val )
            		
            # <-- action
            # at file 359:3: ( NL )+
            match_count_75 = 0
            while true
              alt_75 = 2
              look_75_0 = @input.peek( 1 )

              if ( look_75_0 == NL )
                alt_75 = 1

              end
              case alt_75
              when 1
                # at line 359:3: NL
                __NL182__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1090 )

                tree_for_NL182 = @adaptor.create_with_payload( __NL182__ )
                @adaptor.add_child( root_0, tree_for_NL182 )


              else
                match_count_75 > 0 and break
                eee = EarlyExit(75)


                raise eee
              end
              match_count_75 += 1
            end


          else
            break # out of loop for decision 76
          end
        end # loop for decision 76
        char_literal183 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_iterator_1097 )

        tree_for_char_literal183 = @adaptor.create_with_payload( char_literal183 )
        @adaptor.add_child( root_0, tree_for_char_literal183 )

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
        # trace_out( __method__, 28 )

      end
      
      return return_value
    end

    ConstraintStatementReturnValue = define_return_scope :key, :val

    # 
    # parser rule constraint_statement
    # 
    # (in SFP.g)
    # 367:1: constraint_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | conditional_constraint | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | reference binary_comp comp_value | total_constraint );
    # 
    def constraint_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = ConstraintStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL189__ = nil
      __NULL195__ = nil
      string_literal198 = nil
      string_literal199 = nil
      set202 = nil
      string_literal203 = nil
      reference184 = nil
      equals_op185 = nil
      value186 = nil
      reference187 = nil
      equals_op188 = nil
      reference190 = nil
      not_equals_op191 = nil
      value192 = nil
      reference193 = nil
      not_equals_op194 = nil
      conditional_constraint196 = nil
      reference197 = nil
      set_value200 = nil
      reference201 = nil
      set_value204 = nil
      reference205 = nil
      binary_comp206 = nil
      comp_value207 = nil
      total_constraint208 = nil

      tree_for_NULL189 = nil
      tree_for_NULL195 = nil
      tree_for_string_literal198 = nil
      tree_for_string_literal199 = nil
      tree_for_set202 = nil
      tree_for_string_literal203 = nil

      begin
        # at line 368:2: ( reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | conditional_constraint | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | reference binary_comp comp_value | total_constraint )
        alt_78 = 9
        alt_78 = @dfa78.predict( @input )
        case alt_78
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 368:4: reference equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1116 )
          reference184 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference184.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1118 )
          equals_op185 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op185.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_1120 )
          value186 = value
          @state.following.pop
          @adaptor.add_child( root_0, value186.tree )
          # --> action

          			return_value.key = ( reference184.nil? ? nil : reference184.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => ( value186.nil? ? nil : value186.val ) }
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 373:4: reference equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1129 )
          reference187 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference187.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1131 )
          equals_op188 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op188.tree )
          __NULL189__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_constraint_statement_1133 )

          tree_for_NULL189 = @adaptor.create_with_payload( __NULL189__ )
          @adaptor.add_child( root_0, tree_for_NULL189 )

          # --> action

          			return_value.key = ( reference187.nil? ? nil : reference187.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => self.null_value }
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 378:4: reference not_equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1142 )
          reference190 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference190.tree )
          @state.following.push( TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1144 )
          not_equals_op191 = not_equals_op
          @state.following.pop
          @adaptor.add_child( root_0, not_equals_op191.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_1146 )
          value192 = value
          @state.following.pop
          @adaptor.add_child( root_0, value192.tree )
          # --> action

          			return_value.key = ( reference190.nil? ? nil : reference190.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-equals', '_value' => ( value192.nil? ? nil : value192.val ) }
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 383:4: reference not_equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1155 )
          reference193 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference193.tree )
          @state.following.push( TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1157 )
          not_equals_op194 = not_equals_op
          @state.following.pop
          @adaptor.add_child( root_0, not_equals_op194.tree )
          __NULL195__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_constraint_statement_1159 )

          tree_for_NULL195 = @adaptor.create_with_payload( __NULL195__ )
          @adaptor.add_child( root_0, tree_for_NULL195 )

          # --> action

          			return_value.key = ( reference193.nil? ? nil : reference193.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-equals', '_value' => self.null_value }
          		
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 388:4: conditional_constraint
          @state.following.push( TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_1168 )
          conditional_constraint196 = conditional_constraint
          @state.following.pop
          @adaptor.add_child( root_0, conditional_constraint196.tree )
          # --> action

          			return_value.key = ( conditional_constraint196.nil? ? nil : conditional_constraint196.key )
          			return_value.val = ( conditional_constraint196.nil? ? nil : conditional_constraint196.val )
          		
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 393:4: reference ( 'is' )? 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1177 )
          reference197 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference197.tree )
          # at line 393:14: ( 'is' )?
          alt_77 = 2
          look_77_0 = @input.peek( 1 )

          if ( look_77_0 == T__43 )
            alt_77 = 1
          end
          case alt_77
          when 1
            # at line 393:14: 'is'
            string_literal198 = match( T__43, TOKENS_FOLLOWING_T__43_IN_constraint_statement_1179 )

            tree_for_string_literal198 = @adaptor.create_with_payload( string_literal198 )
            @adaptor.add_child( root_0, tree_for_string_literal198 )


          end
          string_literal199 = match( T__44, TOKENS_FOLLOWING_T__44_IN_constraint_statement_1182 )

          tree_for_string_literal199 = @adaptor.create_with_payload( string_literal199 )
          @adaptor.add_child( root_0, tree_for_string_literal199 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_1184 )
          set_value200 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value200.tree )
          # --> action

          			c_or = { '_context' => 'constraint', '_type' => 'or', '_parent' => @now }
          			( set_value200.nil? ? nil : set_value200.val ).each { |v|
          				id = self.next_id.to_s
          				item = { '_context' => 'constraint', '_type' => 'and', '_parent' => c_or }
          				item[( reference197.nil? ? nil : reference197.val )] = { '_context' => 'constraint', '_type' => 'equals', '_value' => v }
          				c_or[id] = item
          			}
          			return_value.key = self.next_id.to_s
          			return_value.val = c_or
          		
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 405:4: reference ( 'isnt' | 'not' ) 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1193 )
          reference201 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference201.tree )
          set202 = @input.look
          if @input.peek( 1 ).between?( T__45, T__46 )
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set202 ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          string_literal203 = match( T__44, TOKENS_FOLLOWING_T__44_IN_constraint_statement_1201 )

          tree_for_string_literal203 = @adaptor.create_with_payload( string_literal203 )
          @adaptor.add_child( root_0, tree_for_string_literal203 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_1203 )
          set_value204 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value204.tree )
          # --> action

          			c_and = { '_context'=>'constraint', '_type'=>'and', '_parent'=>@now }
          			( set_value204.nil? ? nil : set_value204.val ).each { |v|
          				id = self.next_id.to_s
          				item = { '_context'=>'constraint', '_type'=>'and'}
          				item[( reference201.nil? ? nil : reference201.val )] = { '_context'=>'constraint', '_type'=>'not-equals', '_value'=>v }
          				c_and[id] = item
          			}
          			return_value.key = self.next_id.to_s
          			return_value.val = c_and

          			#return_value.key = ( reference201.nil? ? nil : reference201.val )
          			#return_value.val = { '_context' => 'constraint', '_type' => 'not-in', '_value' => ( set_value204.nil? ? nil : set_value204.val ) }
          		
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 420:4: reference binary_comp comp_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1212 )
          reference205 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference205.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_1214 )
          binary_comp206 = binary_comp
          @state.following.pop
          @adaptor.add_child( root_0, binary_comp206.tree )
          @state.following.push( TOKENS_FOLLOWING_comp_value_IN_constraint_statement_1216 )
          comp_value207 = comp_value
          @state.following.pop
          @adaptor.add_child( root_0, comp_value207.tree )
          # --> action

          			return_value.key = ( reference205.nil? ? nil : reference205.val )
          			return_value.val = { '_context' => 'constraint', '_type' => ( binary_comp206 && @input.to_s( binary_comp206.start, binary_comp206.stop ) ), '_value' => ( comp_value207.nil? ? nil : comp_value207.val ) }
          		
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 425:4: total_constraint
          @state.following.push( TOKENS_FOLLOWING_total_constraint_IN_constraint_statement_1225 )
          total_constraint208 = total_constraint
          @state.following.pop
          @adaptor.add_child( root_0, total_constraint208.tree )

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
    # 428:1: total_constraint : 'total(' total_statement ')' binary_comp NUMBER ;
    # 
    def total_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = TotalConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal209 = nil
      char_literal211 = nil
      __NUMBER213__ = nil
      total_statement210 = nil
      binary_comp212 = nil

      tree_for_string_literal209 = nil
      tree_for_char_literal211 = nil
      tree_for_NUMBER213 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 429:4: 'total(' total_statement ')' binary_comp NUMBER
        string_literal209 = match( T__47, TOKENS_FOLLOWING_T__47_IN_total_constraint_1236 )

        tree_for_string_literal209 = @adaptor.create_with_payload( string_literal209 )
        @adaptor.add_child( root_0, tree_for_string_literal209 )

        @state.following.push( TOKENS_FOLLOWING_total_statement_IN_total_constraint_1238 )
        total_statement210 = total_statement
        @state.following.pop
        @adaptor.add_child( root_0, total_statement210.tree )
        char_literal211 = match( T__38, TOKENS_FOLLOWING_T__38_IN_total_constraint_1240 )

        tree_for_char_literal211 = @adaptor.create_with_payload( char_literal211 )
        @adaptor.add_child( root_0, tree_for_char_literal211 )

        @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_total_constraint_1242 )
        binary_comp212 = binary_comp
        @state.following.pop
        @adaptor.add_child( root_0, binary_comp212.tree )
        __NUMBER213__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_total_constraint_1244 )

        tree_for_NUMBER213 = @adaptor.create_with_payload( __NUMBER213__ )
        @adaptor.add_child( root_0, tree_for_NUMBER213 )

        # - - - - - - - rule clean up - - - - - - - -
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
    # 432:1: total_statement : reference equals_op value ;
    # 
    def total_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
      return_value = TotalStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      reference214 = nil
      equals_op215 = nil
      value216 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 433:4: reference equals_op value
        @state.following.push( TOKENS_FOLLOWING_reference_IN_total_statement_1255 )
        reference214 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference214.tree )
        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_total_statement_1257 )
        equals_op215 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op215.tree )
        @state.following.push( TOKENS_FOLLOWING_value_IN_total_statement_1259 )
        value216 = value
        @state.following.pop
        @adaptor.add_child( root_0, value216.tree )
        # - - - - - - - rule clean up - - - - - - - -
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
    # 436:1: comp_value returns [val] : ( NUMBER | reference );
    # 
    def comp_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = CompValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NUMBER217__ = nil
      reference218 = nil

      tree_for_NUMBER217 = nil

      begin
        # at line 437:2: ( NUMBER | reference )
        alt_79 = 2
        look_79_0 = @input.peek( 1 )

        if ( look_79_0 == NUMBER )
          alt_79 = 1
        elsif ( look_79_0 == ID )
          alt_79 = 2
        else
          raise NoViableAlternative( "", 79, 0 )
        end
        case alt_79
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 437:4: NUMBER
          __NUMBER217__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_comp_value_1274 )

          tree_for_NUMBER217 = @adaptor.create_with_payload( __NUMBER217__ )
          @adaptor.add_child( root_0, tree_for_NUMBER217 )

          # --> action
          	return_value.val = __NUMBER217__.text.to_f	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 439:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_comp_value_1283 )
          reference218 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference218.tree )
          # --> action
          	return_value.val = ( reference218.nil? ? nil : reference218.val )	
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
    # 443:1: conditional_constraint returns [key, val] : 'if' constraint_statement ( NL )* conditional_constraint_then ;
    # 
    def conditional_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
      return_value = ConditionalConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal219 = nil
      __NL221__ = nil
      constraint_statement220 = nil
      conditional_constraint_then222 = nil

      tree_for_string_literal219 = nil
      tree_for_NL221 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 444:4: 'if' constraint_statement ( NL )* conditional_constraint_then
        string_literal219 = match( T__28, TOKENS_FOLLOWING_T__28_IN_conditional_constraint_1302 )

        tree_for_string_literal219 = @adaptor.create_with_payload( string_literal219 )
        @adaptor.add_child( root_0, tree_for_string_literal219 )

        # --> action

        			return_value.key = id = self.next_id.to_s
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'or'
        			}
        			@now = @now[id]
        		
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_1310 )
        constraint_statement220 = constraint_statement
        @state.following.pop
        @adaptor.add_child( root_0, constraint_statement220.tree )
        # at line 453:24: ( NL )*
        while true # decision 80
          alt_80 = 2
          look_80_0 = @input.peek( 1 )

          if ( look_80_0 == NL )
            alt_80 = 1

          end
          case alt_80
          when 1
            # at line 453:24: NL
            __NL221__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditional_constraint_1312 )

            tree_for_NL221 = @adaptor.create_with_payload( __NL221__ )
            @adaptor.add_child( root_0, tree_for_NL221 )


          else
            break # out of loop for decision 80
          end
        end # loop for decision 80
        # --> action

        			id = self.next_id
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'not'
        			}
        			@now[id][( constraint_statement220.nil? ? nil : constraint_statement220.key )] = ( constraint_statement220.nil? ? nil : constraint_statement220.val )
        		
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_conditional_constraint_then_IN_conditional_constraint_1321 )
        conditional_constraint_then222 = conditional_constraint_then
        @state.following.pop
        @adaptor.add_child( root_0, conditional_constraint_then222.tree )
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
    # 466:1: conditional_constraint_then : 'then' constraint_statement ;
    # 
    def conditional_constraint_then
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )
      return_value = ConditionalConstraintThenReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal223 = nil
      constraint_statement224 = nil

      tree_for_string_literal223 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 467:4: 'then' constraint_statement
        string_literal223 = match( T__29, TOKENS_FOLLOWING_T__29_IN_conditional_constraint_then_1336 )

        tree_for_string_literal223 = @adaptor.create_with_payload( string_literal223 )
        @adaptor.add_child( root_0, tree_for_string_literal223 )

        @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_1338 )
        constraint_statement224 = constraint_statement
        @state.following.pop
        @adaptor.add_child( root_0, constraint_statement224.tree )
        # --> action

        			id = self.next_id
        			@now[id] = { '_parent' => @now,
        				'_context' => 'constraint',
        				'_type' => 'and'
        			}
        			@now[id][( constraint_statement224.nil? ? nil : constraint_statement224.key )] = ( constraint_statement224.nil? ? nil : constraint_statement224.val )
        		
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
    # 478:1: mutation_body : ( ( mutation_statement | mutation_iterator ) ( NL )+ )* ;
    # 
    def mutation_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
      return_value = MutationBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL227__ = nil
      mutation_statement225 = nil
      mutation_iterator226 = nil

      tree_for_NL227 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 479:4: ( ( mutation_statement | mutation_iterator ) ( NL )+ )*
        # at line 479:4: ( ( mutation_statement | mutation_iterator ) ( NL )+ )*
        while true # decision 83
          alt_83 = 2
          look_83_0 = @input.peek( 1 )

          if ( look_83_0 == ID || look_83_0 == T__41 || look_83_0 == T__49 )
            alt_83 = 1

          end
          case alt_83
          when 1
            # at line 480:4: ( mutation_statement | mutation_iterator ) ( NL )+
            # at line 480:4: ( mutation_statement | mutation_iterator )
            alt_81 = 2
            look_81_0 = @input.peek( 1 )

            if ( look_81_0 == ID || look_81_0 == T__49 )
              alt_81 = 1
            elsif ( look_81_0 == T__41 )
              alt_81 = 2
            else
              raise NoViableAlternative( "", 81, 0 )
            end
            case alt_81
            when 1
              # at line 480:6: mutation_statement
              @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_mutation_body_1360 )
              mutation_statement225 = mutation_statement
              @state.following.pop
              @adaptor.add_child( root_0, mutation_statement225.tree )
              # --> action
              	@now[( mutation_statement225.nil? ? nil : mutation_statement225.key )] = ( mutation_statement225.nil? ? nil : mutation_statement225.val )	
              # <-- action

            when 2
              # at line 482:6: mutation_iterator
              @state.following.push( TOKENS_FOLLOWING_mutation_iterator_IN_mutation_body_1373 )
              mutation_iterator226 = mutation_iterator
              @state.following.pop
              @adaptor.add_child( root_0, mutation_iterator226.tree )

            end
            # at file 484:3: ( NL )+
            match_count_82 = 0
            while true
              alt_82 = 2
              look_82_0 = @input.peek( 1 )

              if ( look_82_0 == NL )
                alt_82 = 1

              end
              case alt_82
              when 1
                # at line 484:3: NL
                __NL227__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_body_1382 )

                tree_for_NL227 = @adaptor.create_with_payload( __NL227__ )
                @adaptor.add_child( root_0, tree_for_NL227 )


              else
                match_count_82 > 0 and break
                eee = EarlyExit(82)


                raise eee
              end
              match_count_82 += 1
            end


          else
            break # out of loop for decision 83
          end
        end # loop for decision 83
        # - - - - - - - rule clean up - - - - - - - -
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
    # 487:1: mutation_iterator : 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( mutation_statement ( NL )+ )* '}' ;
    # 
    def mutation_iterator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
      return_value = MutationIteratorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal228 = nil
      string_literal230 = nil
      __ID231__ = nil
      __NL232__ = nil
      char_literal233 = nil
      __NL234__ = nil
      __NL236__ = nil
      char_literal237 = nil
      path229 = nil
      mutation_statement235 = nil

      tree_for_string_literal228 = nil
      tree_for_string_literal230 = nil
      tree_for_ID231 = nil
      tree_for_NL232 = nil
      tree_for_char_literal233 = nil
      tree_for_NL234 = nil
      tree_for_NL236 = nil
      tree_for_char_literal237 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 488:4: 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( mutation_statement ( NL )+ )* '}'
        string_literal228 = match( T__41, TOKENS_FOLLOWING_T__41_IN_mutation_iterator_1397 )

        tree_for_string_literal228 = @adaptor.create_with_payload( string_literal228 )
        @adaptor.add_child( root_0, tree_for_string_literal228 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_iterator_1399 )
        path229 = path
        @state.following.pop
        @adaptor.add_child( root_0, path229.tree )
        string_literal230 = match( T__42, TOKENS_FOLLOWING_T__42_IN_mutation_iterator_1401 )

        tree_for_string_literal230 = @adaptor.create_with_payload( string_literal230 )
        @adaptor.add_child( root_0, tree_for_string_literal230 )

        __ID231__ = match( ID, TOKENS_FOLLOWING_ID_IN_mutation_iterator_1403 )

        tree_for_ID231 = @adaptor.create_with_payload( __ID231__ )
        @adaptor.add_child( root_0, tree_for_ID231 )

        # at line 488:27: ( NL )*
        while true # decision 84
          alt_84 = 2
          look_84_0 = @input.peek( 1 )

          if ( look_84_0 == NL )
            alt_84 = 1

          end
          case alt_84
          when 1
            # at line 488:27: NL
            __NL232__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_1405 )

            tree_for_NL232 = @adaptor.create_with_payload( __NL232__ )
            @adaptor.add_child( root_0, tree_for_NL232 )


          else
            break # out of loop for decision 84
          end
        end # loop for decision 84
        char_literal233 = match( T__20, TOKENS_FOLLOWING_T__20_IN_mutation_iterator_1408 )

        tree_for_char_literal233 = @adaptor.create_with_payload( char_literal233 )
        @adaptor.add_child( root_0, tree_for_char_literal233 )

        # at file 488:35: ( NL )+
        match_count_85 = 0
        while true
          alt_85 = 2
          look_85_0 = @input.peek( 1 )

          if ( look_85_0 == NL )
            alt_85 = 1

          end
          case alt_85
          when 1
            # at line 488:35: NL
            __NL234__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_1410 )

            tree_for_NL234 = @adaptor.create_with_payload( __NL234__ )
            @adaptor.add_child( root_0, tree_for_NL234 )


          else
            match_count_85 > 0 and break
            eee = EarlyExit(85)


            raise eee
          end
          match_count_85 += 1
        end

        # --> action

        			id = self.to_ref(( path229 && @input.to_s( path229.start, path229.stop ) ))
        			@now[id] = { '_parent' => @now,
        				'_context' => 'iterator',
        				'_self' => id,
        				'_variable' => __ID231__.text
        			}
        			@now = @now[id]
        		
        # <-- action
        # at line 498:3: ( mutation_statement ( NL )+ )*
        while true # decision 87
          alt_87 = 2
          look_87_0 = @input.peek( 1 )

          if ( look_87_0 == ID || look_87_0 == T__49 )
            alt_87 = 1

          end
          case alt_87
          when 1
            # at line 498:4: mutation_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_mutation_iterator_1420 )
            mutation_statement235 = mutation_statement
            @state.following.pop
            @adaptor.add_child( root_0, mutation_statement235.tree )
            # --> action
            	@now[( mutation_statement235.nil? ? nil : mutation_statement235.key )] = ( mutation_statement235.nil? ? nil : mutation_statement235.val )	
            # <-- action
            # at file 500:3: ( NL )+
            match_count_86 = 0
            while true
              alt_86 = 2
              look_86_0 = @input.peek( 1 )

              if ( look_86_0 == NL )
                alt_86 = 1

              end
              case alt_86
              when 1
                # at line 500:3: NL
                __NL236__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_1428 )

                tree_for_NL236 = @adaptor.create_with_payload( __NL236__ )
                @adaptor.add_child( root_0, tree_for_NL236 )


              else
                match_count_86 > 0 and break
                eee = EarlyExit(86)


                raise eee
              end
              match_count_86 += 1
            end


          else
            break # out of loop for decision 87
          end
        end # loop for decision 87
        char_literal237 = match( T__21, TOKENS_FOLLOWING_T__21_IN_mutation_iterator_1435 )

        tree_for_char_literal237 = @adaptor.create_with_payload( char_literal237 )
        @adaptor.add_child( root_0, tree_for_char_literal237 )

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
    # 505:1: mutation_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' );
    # 
    def mutation_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )
      return_value = MutationStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL243__ = nil
      __NUMBER246__ = nil
      string_literal248 = nil
      string_literal249 = nil
      string_literal252 = nil
      string_literal255 = nil
      char_literal257 = nil
      string_literal259 = nil
      char_literal261 = nil
      reference238 = nil
      equals_op239 = nil
      value240 = nil
      reference241 = nil
      equals_op242 = nil
      reference244 = nil
      binary_op245 = nil
      reference247 = nil
      path250 = nil
      object_body251 = nil
      path253 = nil
      reference254 = nil
      value256 = nil
      reference258 = nil
      value260 = nil

      tree_for_NULL243 = nil
      tree_for_NUMBER246 = nil
      tree_for_string_literal248 = nil
      tree_for_string_literal249 = nil
      tree_for_string_literal252 = nil
      tree_for_string_literal255 = nil
      tree_for_char_literal257 = nil
      tree_for_string_literal259 = nil
      tree_for_char_literal261 = nil

      begin
        # at line 506:2: ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' )
        alt_89 = 7
        alt_89 = @dfa89.predict( @input )
        case alt_89
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 506:4: reference equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1454 )
          reference238 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference238.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_mutation_statement_1456 )
          equals_op239 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op239.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_1458 )
          value240 = value
          @state.following.pop
          @adaptor.add_child( root_0, value240.tree )
          # --> action

          			return_value.key = ( reference238.nil? ? nil : reference238.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'equals',
          				'_value' => ( value240.nil? ? nil : value240.val )
          			}
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 514:4: reference equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1467 )
          reference241 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference241.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_mutation_statement_1469 )
          equals_op242 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op242.tree )
          __NULL243__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_mutation_statement_1471 )

          tree_for_NULL243 = @adaptor.create_with_payload( __NULL243__ )
          @adaptor.add_child( root_0, tree_for_NULL243 )

          # --> action

          			return_value.key = ( reference241.nil? ? nil : reference241.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'equals',
          				'_value' => self.null_value
          			}
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 522:4: reference binary_op NUMBER
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1480 )
          reference244 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference244.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_op_IN_mutation_statement_1482 )
          binary_op245 = binary_op
          @state.following.pop
          @adaptor.add_child( root_0, binary_op245.tree )
          __NUMBER246__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_mutation_statement_1484 )

          tree_for_NUMBER246 = @adaptor.create_with_payload( __NUMBER246__ )
          @adaptor.add_child( root_0, tree_for_NUMBER246 )

          # --> action

          			return_value.key = ( reference244.nil? ? nil : reference244.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => ( binary_op245 && @input.to_s( binary_op245.start, binary_op245.stop ) ),
          				'_value' => __NUMBER246__.text.to_f
          			}
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 530:4: reference 'is' 'new' path ( object_body )?
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1493 )
          reference247 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference247.tree )
          string_literal248 = match( T__43, TOKENS_FOLLOWING_T__43_IN_mutation_statement_1495 )

          tree_for_string_literal248 = @adaptor.create_with_payload( string_literal248 )
          @adaptor.add_child( root_0, tree_for_string_literal248 )

          string_literal249 = match( T__48, TOKENS_FOLLOWING_T__48_IN_mutation_statement_1497 )

          tree_for_string_literal249 = @adaptor.create_with_payload( string_literal249 )
          @adaptor.add_child( root_0, tree_for_string_literal249 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_statement_1499 )
          path250 = path
          @state.following.pop
          @adaptor.add_child( root_0, path250.tree )
          # --> action

          			id = '_' + self.next_id
          			@now[id] = { '_self' => id,
          				'_context' => 'object',
          				'_isa' => self.to_ref(( path250 && @input.to_s( path250.start, path250.stop ) )),
          				'_parent' => @now
          			}
          			@now = @now[id]
          		
          # <-- action
          # at line 540:3: ( object_body )?
          alt_88 = 2
          look_88_0 = @input.peek( 1 )

          if ( look_88_0 == T__20 )
            alt_88 = 1
          end
          case alt_88
          when 1
            # at line 540:3: object_body
            @state.following.push( TOKENS_FOLLOWING_object_body_IN_mutation_statement_1507 )
            object_body251 = object_body
            @state.following.pop
            @adaptor.add_child( root_0, object_body251.tree )

          end
          # --> action

          			n = self.goto_parent()
          			@now.delete(n['_self'])
          			return_value.key = ( reference247.nil? ? nil : reference247.val )
          			return_value.val = n
          		
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 547:4: 'delete' path
          string_literal252 = match( T__49, TOKENS_FOLLOWING_T__49_IN_mutation_statement_1517 )

          tree_for_string_literal252 = @adaptor.create_with_payload( string_literal252 )
          @adaptor.add_child( root_0, tree_for_string_literal252 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_statement_1519 )
          path253 = path
          @state.following.pop
          @adaptor.add_child( root_0, path253.tree )
          # --> action

          			id = '_' + self.next_id
          			@now[id] = { '_self' => id,
          				'_context' => 'mutation',
          				'_type' => 'delete',
          				'_value' => self.to_ref(( path253 && @input.to_s( path253.start, path253.stop ) ))
          			}
          		
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 556:4: reference 'add(' value ')'
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1528 )
          reference254 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference254.tree )
          string_literal255 = match( T__50, TOKENS_FOLLOWING_T__50_IN_mutation_statement_1530 )

          tree_for_string_literal255 = @adaptor.create_with_payload( string_literal255 )
          @adaptor.add_child( root_0, tree_for_string_literal255 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_1532 )
          value256 = value
          @state.following.pop
          @adaptor.add_child( root_0, value256.tree )
          char_literal257 = match( T__38, TOKENS_FOLLOWING_T__38_IN_mutation_statement_1534 )

          tree_for_char_literal257 = @adaptor.create_with_payload( char_literal257 )
          @adaptor.add_child( root_0, tree_for_char_literal257 )

          # --> action

          			return_value.key = ( reference254.nil? ? nil : reference254.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'add',
          				'_value' => ( value256.nil? ? nil : value256.val )
          			}
          		
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 564:4: reference 'remove(' value ')'
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1543 )
          reference258 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference258.tree )
          string_literal259 = match( T__51, TOKENS_FOLLOWING_T__51_IN_mutation_statement_1545 )

          tree_for_string_literal259 = @adaptor.create_with_payload( string_literal259 )
          @adaptor.add_child( root_0, tree_for_string_literal259 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_1547 )
          value260 = value
          @state.following.pop
          @adaptor.add_child( root_0, value260.tree )
          char_literal261 = match( T__38, TOKENS_FOLLOWING_T__38_IN_mutation_statement_1549 )

          tree_for_char_literal261 = @adaptor.create_with_payload( char_literal261 )
          @adaptor.add_child( root_0, tree_for_char_literal261 )

          # --> action

          			return_value.key = ( reference258.nil? ? nil : reference258.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'remove',
          				'_value' => ( value260.nil? ? nil : value260.val )
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
    # 574:1: set_value returns [val] : '(' set_item ( ',' set_item )* ')' ;
    # 
    def set_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )
      return_value = SetValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal262 = nil
      char_literal264 = nil
      char_literal266 = nil
      set_item263 = nil
      set_item265 = nil

      tree_for_char_literal262 = nil
      tree_for_char_literal264 = nil
      tree_for_char_literal266 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 575:4: '(' set_item ( ',' set_item )* ')'
        char_literal262 = match( T__36, TOKENS_FOLLOWING_T__36_IN_set_value_1568 )

        tree_for_char_literal262 = @adaptor.create_with_payload( char_literal262 )
        @adaptor.add_child( root_0, tree_for_char_literal262 )

        # --> action
        	@set = Array.new	
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_1576 )
        set_item263 = set_item
        @state.following.pop
        @adaptor.add_child( root_0, set_item263.tree )
        # at line 577:12: ( ',' set_item )*
        while true # decision 90
          alt_90 = 2
          look_90_0 = @input.peek( 1 )

          if ( look_90_0 == T__37 )
            alt_90 = 1

          end
          case alt_90
          when 1
            # at line 577:13: ',' set_item
            char_literal264 = match( T__37, TOKENS_FOLLOWING_T__37_IN_set_value_1579 )

            tree_for_char_literal264 = @adaptor.create_with_payload( char_literal264 )
            @adaptor.add_child( root_0, tree_for_char_literal264 )

            @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_1581 )
            set_item265 = set_item
            @state.following.pop
            @adaptor.add_child( root_0, set_item265.tree )

          else
            break # out of loop for decision 90
          end
        end # loop for decision 90
        # --> action
        	return_value.val = @set	
        # <-- action
        char_literal266 = match( T__38, TOKENS_FOLLOWING_T__38_IN_set_value_1591 )

        tree_for_char_literal266 = @adaptor.create_with_payload( char_literal266 )
        @adaptor.add_child( root_0, tree_for_char_literal266 )

        # - - - - - - - rule clean up - - - - - - - -
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
    # 582:1: set_item : value ;
    # 
    def set_item
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )
      return_value = SetItemReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      value267 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 583:4: value
        @state.following.push( TOKENS_FOLLOWING_value_IN_set_item_1602 )
        value267 = value
        @state.following.pop
        @adaptor.add_child( root_0, value267.tree )
        # --> action
        	@set.push(( value267.nil? ? nil : value267.val ))	
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
    # 587:1: value returns [val] : ( primitive_value | reference | set_value );
    # 
    def value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )
      return_value = ValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      primitive_value268 = nil
      reference269 = nil
      set_value270 = nil


      begin
        # at line 588:2: ( primitive_value | reference | set_value )
        alt_91 = 3
        case look_91 = @input.peek( 1 )
        when STRING, NUMBER, BOOLEAN, MULTILINE_STRING then alt_91 = 1
        when ID then alt_91 = 2
        when T__36 then alt_91 = 3
        else
          raise NoViableAlternative( "", 91, 0 )
        end
        case alt_91
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 588:4: primitive_value
          @state.following.push( TOKENS_FOLLOWING_primitive_value_IN_value_1621 )
          primitive_value268 = primitive_value
          @state.following.pop
          @adaptor.add_child( root_0, primitive_value268.tree )
          # --> action
          	return_value.val = ( primitive_value268.nil? ? nil : primitive_value268.val )	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 590:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_value_1630 )
          reference269 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference269.tree )
          # --> action
          	return_value.val = ( reference269.nil? ? nil : reference269.val )	
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 592:4: set_value
          @state.following.push( TOKENS_FOLLOWING_set_value_IN_value_1639 )
          set_value270 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value270.tree )
          # --> action
          	return_value.val = ( set_value270.nil? ? nil : set_value270.val )	
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
    # 596:1: primitive_value returns [val] : ( BOOLEAN | NUMBER | STRING | MULTILINE_STRING );
    # 
    def primitive_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )
      return_value = PrimitiveValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __BOOLEAN271__ = nil
      __NUMBER272__ = nil
      __STRING273__ = nil
      __MULTILINE_STRING274__ = nil

      tree_for_BOOLEAN271 = nil
      tree_for_NUMBER272 = nil
      tree_for_STRING273 = nil
      tree_for_MULTILINE_STRING274 = nil

      begin
        # at line 597:2: ( BOOLEAN | NUMBER | STRING | MULTILINE_STRING )
        alt_92 = 4
        case look_92 = @input.peek( 1 )
        when BOOLEAN then alt_92 = 1
        when NUMBER then alt_92 = 2
        when STRING then alt_92 = 3
        when MULTILINE_STRING then alt_92 = 4
        else
          raise NoViableAlternative( "", 92, 0 )
        end
        case alt_92
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 597:4: BOOLEAN
          __BOOLEAN271__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_1658 )

          tree_for_BOOLEAN271 = @adaptor.create_with_payload( __BOOLEAN271__ )
          @adaptor.add_child( root_0, tree_for_BOOLEAN271 )

          # --> action

          			if __BOOLEAN271__.text == 'true' or __BOOLEAN271__.text == 'on' or __BOOLEAN271__.text == 'yes'
          				return_value.val = true
          			else  # 'false', 'no', 'off'
          				return_value.val = false
          			end
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 605:4: NUMBER
          __NUMBER272__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_primitive_value_1667 )

          tree_for_NUMBER272 = @adaptor.create_with_payload( __NUMBER272__ )
          @adaptor.add_child( root_0, tree_for_NUMBER272 )

          # --> action
          	return_value.val = __NUMBER272__.text.to_f	
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 607:4: STRING
          __STRING273__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_primitive_value_1676 )

          tree_for_STRING273 = @adaptor.create_with_payload( __STRING273__ )
          @adaptor.add_child( root_0, tree_for_STRING273 )

          # --> action
          	return_value.val = __STRING273__.text[1,__STRING273__.text.length-2]	
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 609:4: MULTILINE_STRING
          __MULTILINE_STRING274__ = match( MULTILINE_STRING, TOKENS_FOLLOWING_MULTILINE_STRING_IN_primitive_value_1685 )

          tree_for_MULTILINE_STRING274 = @adaptor.create_with_payload( __MULTILINE_STRING274__ )
          @adaptor.add_child( root_0, tree_for_MULTILINE_STRING274 )

          # --> action
          	return_value.val = __MULTILINE_STRING274__.text[2, __MULTILINE_STRING274__.text.length-2]	
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
    # 613:1: path : ID ( '.' ID )* ;
    # 
    def path
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )
      return_value = PathReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID275__ = nil
      char_literal276 = nil
      __ID277__ = nil

      tree_for_ID275 = nil
      tree_for_char_literal276 = nil
      tree_for_ID277 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 614:4: ID ( '.' ID )*
        __ID275__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_1700 )

        tree_for_ID275 = @adaptor.create_with_payload( __ID275__ )
        @adaptor.add_child( root_0, tree_for_ID275 )

        # at line 614:6: ( '.' ID )*
        while true # decision 93
          alt_93 = 2
          look_93_0 = @input.peek( 1 )

          if ( look_93_0 == T__52 )
            alt_93 = 1

          end
          case alt_93
          when 1
            # at line 614:7: '.' ID
            char_literal276 = match( T__52, TOKENS_FOLLOWING_T__52_IN_path_1702 )

            tree_for_char_literal276 = @adaptor.create_with_payload( char_literal276 )
            @adaptor.add_child( root_0, tree_for_char_literal276 )

            __ID277__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_1703 )

            tree_for_ID277 = @adaptor.create_with_payload( __ID277__ )
            @adaptor.add_child( root_0, tree_for_ID277 )


          else
            break # out of loop for decision 93
          end
        end # loop for decision 93
        # - - - - - - - rule clean up - - - - - - - -
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

    PathWithIndexReturnValue = define_return_scope 

    # 
    # parser rule path_with_index
    # 
    # (in SFP.g)
    # 617:1: path_with_index : id_ref ( '.' id_ref )* ;
    # 
    def path_with_index
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )
      return_value = PathWithIndexReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal279 = nil
      id_ref278 = nil
      id_ref280 = nil

      tree_for_char_literal279 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 618:4: id_ref ( '.' id_ref )*
        @state.following.push( TOKENS_FOLLOWING_id_ref_IN_path_with_index_1716 )
        id_ref278 = id_ref
        @state.following.pop
        @adaptor.add_child( root_0, id_ref278.tree )
        # at line 618:10: ( '.' id_ref )*
        while true # decision 94
          alt_94 = 2
          look_94_0 = @input.peek( 1 )

          if ( look_94_0 == T__52 )
            alt_94 = 1

          end
          case alt_94
          when 1
            # at line 618:11: '.' id_ref
            char_literal279 = match( T__52, TOKENS_FOLLOWING_T__52_IN_path_with_index_1718 )

            tree_for_char_literal279 = @adaptor.create_with_payload( char_literal279 )
            @adaptor.add_child( root_0, tree_for_char_literal279 )

            @state.following.push( TOKENS_FOLLOWING_id_ref_IN_path_with_index_1719 )
            id_ref280 = id_ref
            @state.following.pop
            @adaptor.add_child( root_0, id_ref280.tree )

          else
            break # out of loop for decision 94
          end
        end # loop for decision 94
        # - - - - - - - rule clean up - - - - - - - -
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

    IdRefReturnValue = define_return_scope 

    # 
    # parser rule id_ref
    # 
    # (in SFP.g)
    # 621:1: id_ref : ID ( '[' NUMBER ']' )? ;
    # 
    def id_ref
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )
      return_value = IdRefReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID281__ = nil
      char_literal282 = nil
      __NUMBER283__ = nil
      char_literal284 = nil

      tree_for_ID281 = nil
      tree_for_char_literal282 = nil
      tree_for_NUMBER283 = nil
      tree_for_char_literal284 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 622:4: ID ( '[' NUMBER ']' )?
        __ID281__ = match( ID, TOKENS_FOLLOWING_ID_IN_id_ref_1732 )

        tree_for_ID281 = @adaptor.create_with_payload( __ID281__ )
        @adaptor.add_child( root_0, tree_for_ID281 )

        # at line 622:6: ( '[' NUMBER ']' )?
        alt_95 = 2
        look_95_0 = @input.peek( 1 )

        if ( look_95_0 == T__26 )
          alt_95 = 1
        end
        case alt_95
        when 1
          # at line 622:7: '[' NUMBER ']'
          char_literal282 = match( T__26, TOKENS_FOLLOWING_T__26_IN_id_ref_1734 )

          tree_for_char_literal282 = @adaptor.create_with_payload( char_literal282 )
          @adaptor.add_child( root_0, tree_for_char_literal282 )

          __NUMBER283__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_id_ref_1736 )

          tree_for_NUMBER283 = @adaptor.create_with_payload( __NUMBER283__ )
          @adaptor.add_child( root_0, tree_for_NUMBER283 )

          char_literal284 = match( T__27, TOKENS_FOLLOWING_T__27_IN_id_ref_1738 )

          tree_for_char_literal284 = @adaptor.create_with_payload( char_literal284 )
          @adaptor.add_child( root_0, tree_for_char_literal284 )


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

    ReferenceReturnValue = define_return_scope :val

    # 
    # parser rule reference
    # 
    # (in SFP.g)
    # 625:1: reference returns [val] : path_with_index ;
    # 
    def reference
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )
      return_value = ReferenceReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      path_with_index285 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 626:4: path_with_index
        @state.following.push( TOKENS_FOLLOWING_path_with_index_IN_reference_1755 )
        path_with_index285 = path_with_index
        @state.following.pop
        @adaptor.add_child( root_0, path_with_index285.tree )
        # --> action
        	return_value.val = self.to_ref(( path_with_index285 && @input.to_s( path_with_index285.start, path_with_index285.stop ) ))	
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

    ReferenceTypeReturnValue = define_return_scope :val

    # 
    # parser rule reference_type
    # 
    # (in SFP.g)
    # 630:1: reference_type returns [val] : 'isref' path ;
    # 
    def reference_type
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )
      return_value = ReferenceTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal286 = nil
      path287 = nil

      tree_for_string_literal286 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 631:4: 'isref' path
        string_literal286 = match( T__53, TOKENS_FOLLOWING_T__53_IN_reference_type_1774 )

        tree_for_string_literal286 = @adaptor.create_with_payload( string_literal286 )
        @adaptor.add_child( root_0, tree_for_string_literal286 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_reference_type_1776 )
        path287 = path
        @state.following.pop
        @adaptor.add_child( root_0, path287.tree )
        # --> action

        			return_value.val = { '_context' => 'null',
        				'_isa' => self.to_ref(( path287 && @input.to_s( path287.start, path287.stop ) ))
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
        # trace_out( __method__, 46 )

      end
      
      return return_value
    end

    EqualsOpReturnValue = define_return_scope 

    # 
    # parser rule equals_op
    # 
    # (in SFP.g)
    # 639:1: equals_op : ( '=' | 'is' );
    # 
    def equals_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 47 )
      return_value = EqualsOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set288 = nil

      tree_for_set288 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set288 = @input.look
        if @input.peek(1) == T__43 || @input.peek(1) == T__54
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set288 ) )
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

    NotEqualsOpReturnValue = define_return_scope 

    # 
    # parser rule not_equals_op
    # 
    # (in SFP.g)
    # 644:1: not_equals_op : ( '!=' | 'isnt' );
    # 
    def not_equals_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 48 )
      return_value = NotEqualsOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set289 = nil

      tree_for_set289 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set289 = @input.look
        if @input.peek(1) == T__45 || @input.peek(1) == T__55
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set289 ) )
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

    BinaryOpReturnValue = define_return_scope 

    # 
    # parser rule binary_op
    # 
    # (in SFP.g)
    # 649:1: binary_op : ( '+=' | '-=' | '*=' | '/=' );
    # 
    def binary_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 49 )
      return_value = BinaryOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set290 = nil

      tree_for_set290 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set290 = @input.look
        if @input.peek( 1 ).between?( T__56, T__59 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set290 ) )
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
        # trace_out( __method__, 49 )

      end
      
      return return_value
    end

    BinaryCompReturnValue = define_return_scope 

    # 
    # parser rule binary_comp
    # 
    # (in SFP.g)
    # 656:1: binary_comp : ( '>' | '>=' | '<' | '<=' );
    # 
    def binary_comp
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 50 )
      return_value = BinaryCompReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set291 = nil

      tree_for_set291 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set291 = @input.look
        if @input.peek( 1 ).between?( T__60, T__63 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set291 ) )
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
        # trace_out( __method__, 50 )

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
    class DFA66 < ANTLR3::DFA
      EOT = unpack( 7, -1 )
      EOF = unpack( 7, -1 )
      MIN = unpack( 1, 6, 1, 4, 2, -1, 1, 6, 1, -1, 1, 4 )
      MAX = unpack( 1, 47, 1, 63, 2, -1, 1, 6, 1, -1, 1, 63 )
      ACCEPT = unpack( 2, -1, 1, 1, 1, 3, 1, -1, 1, 2, 1, -1 )
      SPECIAL = unpack( 7, -1 )
      TRANSITION = [
        unpack( 1, 1, 21, -1, 1, 2, 12, -1, 1, 3, 5, -1, 1, 2 ),
        unpack( 1, 5, 15, -1, 1, 5, 5, -1, 1, 2, 16, -1, 4, 2, 5, -1, 1, 
                 4, 1, -1, 2, 2, 4, -1, 4, 2 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 6 ),
        unpack(  ),
        unpack( 1, 5, 15, -1, 1, 5, 5, -1, 1, 2, 16, -1, 4, 2, 5, -1, 1, 
                 4, 1, -1, 2, 2, 4, -1, 4, 2 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 66
      

      def description
        <<-'__dfa_description__'.strip!
          315:4: ( constraint_statement | constraint_namespace | constraint_iterator )
        __dfa_description__
      end
    end
    class DFA78 < ANTLR3::DFA
      EOT = unpack( 23, -1 )
      EOF = unpack( 23, -1 )
      MIN = unpack( 1, 6, 1, 26, 2, -1, 1, 7, 1, 6, 3, 5, 1, -1, 1, 5, 2, 
                    -1, 1, 27, 1, 26, 4, -1, 1, 43, 1, 7, 1, 27, 1, 43 )
      MAX = unpack( 1, 47, 1, 63, 2, -1, 1, 7, 1, 6, 2, 44, 1, 36, 1, -1, 
                    1, 36, 2, -1, 1, 27, 1, 63, 4, -1, 1, 63, 1, 7, 1, 27, 
                    1, 63 )
      ACCEPT = unpack( 2, -1, 1, 5, 1, 9, 5, -1, 1, 6, 1, -1, 1, 7, 1, 8, 
                       2, -1, 1, 1, 1, 2, 1, 3, 1, 4, 4, -1 )
      SPECIAL = unpack( 23, -1 )
      TRANSITION = [
        unpack( 1, 1, 21, -1, 1, 2, 18, -1, 1, 3 ),
        unpack( 1, 4, 16, -1, 1, 6, 1, 9, 1, 7, 1, 11, 5, -1, 1, 5, 1, 
                 -1, 1, 8, 1, 10, 4, -1, 4, 12 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 13 ),
        unpack( 1, 14 ),
        unpack( 3, 15, 1, 16, 2, 15, 25, -1, 1, 15, 7, -1, 1, 9 ),
        unpack( 3, 17, 1, 18, 2, 17, 25, -1, 1, 17, 7, -1, 1, 11 ),
        unpack( 3, 15, 1, 16, 2, 15, 25, -1, 1, 15 ),
        unpack(  ),
        unpack( 3, 17, 1, 18, 2, 17, 25, -1, 1, 17 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 19 ),
        unpack( 1, 20, 16, -1, 1, 6, 1, 9, 1, 7, 1, 11, 5, -1, 1, 5, 1, 
                 -1, 1, 8, 1, 10, 4, -1, 4, 12 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 6, 1, 9, 1, 7, 1, 11, 5, -1, 1, 5, 1, -1, 1, 8, 1, 10, 
                 4, -1, 4, 12 ),
        unpack( 1, 21 ),
        unpack( 1, 22 ),
        unpack( 1, 6, 1, 9, 1, 7, 1, 11, 5, -1, 1, 5, 1, -1, 1, 8, 1, 10, 
                 4, -1, 4, 12 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 78
      

      def description
        <<-'__dfa_description__'.strip!
          367:1: constraint_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | conditional_constraint | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | reference binary_comp comp_value | total_constraint );
        __dfa_description__
      end
    end
    class DFA89 < ANTLR3::DFA
      EOT = unpack( 19, -1 )
      EOF = unpack( 19, -1 )
      MIN = unpack( 1, 6, 1, 26, 1, -1, 1, 7, 1, 6, 1, 5, 1, -1, 1, 5, 2, 
                    -1, 1, 27, 1, 26, 3, -1, 1, 43, 1, 7, 1, 27, 1, 43 )
      MAX = unpack( 1, 49, 1, 59, 1, -1, 1, 7, 1, 6, 1, 48, 1, -1, 1, 36, 
                    2, -1, 1, 27, 1, 59, 3, -1, 1, 59, 1, 7, 1, 27, 1, 59 )
      ACCEPT = unpack( 2, -1, 1, 5, 3, -1, 1, 3, 1, -1, 1, 6, 1, 7, 2, -1, 
                       1, 4, 1, 1, 1, 2, 4, -1 )
      SPECIAL = unpack( 19, -1 )
      TRANSITION = [
        unpack( 1, 1, 42, -1, 1, 2 ),
        unpack( 1, 3, 16, -1, 1, 5, 6, -1, 1, 8, 1, 9, 1, 4, 1, -1, 1, 
                 7, 1, -1, 4, 6 ),
        unpack(  ),
        unpack( 1, 10 ),
        unpack( 1, 11 ),
        unpack( 3, 13, 1, 14, 2, 13, 25, -1, 1, 13, 11, -1, 1, 12 ),
        unpack(  ),
        unpack( 3, 13, 1, 14, 2, 13, 25, -1, 1, 13 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 15 ),
        unpack( 1, 16, 16, -1, 1, 5, 6, -1, 1, 8, 1, 9, 1, 4, 1, -1, 1, 
                 7, 1, -1, 4, 6 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 5, 6, -1, 1, 8, 1, 9, 1, 4, 1, -1, 1, 7, 1, -1, 4, 6 ),
        unpack( 1, 17 ),
        unpack( 1, 18 ),
        unpack( 1, 5, 6, -1, 1, 8, 1, 9, 1, 4, 1, -1, 1, 7, 1, -1, 4, 6 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 89
      

      def description
        <<-'__dfa_description__'.strip!
          505:1: mutation_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' );
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa36 = DFA36.new( self, 36 )
      @dfa66 = DFA66.new( self, 66 )
      @dfa78 = DFA78.new( self, 78 )
      @dfa89 = DFA89.new( self, 89 )

    end
    TOKENS_FOLLOWING_NL_IN_sfp_49 = Set[ 1, 4, 6, 18, 22, 23, 35 ]
    TOKENS_FOLLOWING_include_IN_sfp_52 = Set[ 1, 6, 18, 22, 23, 35 ]
    TOKENS_FOLLOWING_header_IN_sfp_55 = Set[ 1, 6, 22, 23, 35 ]
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
    TOKENS_FOLLOWING_T__20_IN_class_definition_246 = Set[ 4, 6, 21, 23, 35 ]
    TOKENS_FOLLOWING_NL_IN_class_definition_248 = Set[ 4, 6, 21, 23, 35 ]
    TOKENS_FOLLOWING_attribute_IN_class_definition_253 = Set[ 6, 21, 23, 35 ]
    TOKENS_FOLLOWING_procedure_IN_class_definition_257 = Set[ 6, 21, 23, 35 ]
    TOKENS_FOLLOWING_T__21_IN_class_definition_262 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_class_definition_266 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__24_IN_extends_class_287 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_extends_class_289 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_attribute_304 = Set[ 43, 54 ]
    TOKENS_FOLLOWING_equals_op_IN_attribute_306 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_attribute_308 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_310 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_attribute_320 = Set[ 53 ]
    TOKENS_FOLLOWING_reference_type_IN_attribute_322 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_324 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_object_def_IN_attribute_334 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_336 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_object_def_348 = Set[ 1, 20, 25 ]
    TOKENS_FOLLOWING_T__25_IN_object_def_357 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_object_def_359 = Set[ 1, 20, 26 ]
    TOKENS_FOLLOWING_T__26_IN_object_def_361 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_object_def_363 = Set[ 27 ]
    TOKENS_FOLLOWING_T__27_IN_object_def_367 = Set[ 1, 20 ]
    TOKENS_FOLLOWING_object_body_IN_object_def_382 = Set[ 1 ]
    TOKENS_FOLLOWING_T__20_IN_object_body_398 = Set[ 4, 6, 21, 28, 31 ]
    TOKENS_FOLLOWING_NL_IN_object_body_400 = Set[ 4, 6, 21, 28, 31 ]
    TOKENS_FOLLOWING_object_attribute_IN_object_body_405 = Set[ 6, 21, 28, 31 ]
    TOKENS_FOLLOWING_state_dependency_IN_object_body_409 = Set[ 6, 21, 28, 31 ]
    TOKENS_FOLLOWING_operator_IN_object_body_413 = Set[ 6, 21, 28, 31 ]
    TOKENS_FOLLOWING_T__21_IN_object_body_418 = Set[ 1 ]
    TOKENS_FOLLOWING_attribute_IN_object_attribute_429 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_object_attribute_434 = Set[ 43, 54 ]
    TOKENS_FOLLOWING_equals_op_IN_object_attribute_436 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_object_attribute_438 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_object_attribute_440 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__28_IN_state_dependency_456 = Set[ 6 ]
    TOKENS_FOLLOWING_dep_effect_IN_state_dependency_460 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_462 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_T__29_IN_state_dependency_465 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_467 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_dependency_470 = Set[ 4, 6, 21, 28, 41, 47 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_474 = Set[ 4, 6, 21, 28, 41, 47 ]
    TOKENS_FOLLOWING_constraint_body_IN_state_dependency_477 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_dependency_482 = Set[ 4, 30 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_488 = Set[ 4, 30 ]
    TOKENS_FOLLOWING_T__30_IN_state_dependency_491 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_493 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_dependency_496 = Set[ 4, 6, 21, 28, 41, 47 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_500 = Set[ 4, 6, 21, 28, 41, 47 ]
    TOKENS_FOLLOWING_constraint_body_IN_state_dependency_503 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_dependency_507 = Set[ 4, 30 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_513 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_reference_IN_dep_effect_525 = Set[ 43, 54 ]
    TOKENS_FOLLOWING_equals_op_IN_dep_effect_527 = Set[ 5, 6, 7, 8, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_dep_effect_534 = Set[ 1 ]
    TOKENS_FOLLOWING_NULL_IN_dep_effect_540 = Set[ 1 ]
    TOKENS_FOLLOWING_T__31_IN_operator_556 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_operator_558 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_operator_560 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_NL_IN_operator_562 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_T__32_IN_operator_573 = Set[ 43, 54 ]
    TOKENS_FOLLOWING_equals_op_IN_operator_575 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_operator_577 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_operator_579 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_op_conditions_IN_operator_598 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_op_effects_IN_operator_601 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_operator_605 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_operator_607 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_op_param_623 = Set[ 43, 54 ]
    TOKENS_FOLLOWING_equals_op_IN_op_param_625 = Set[ 6 ]
    TOKENS_FOLLOWING_reference_IN_op_param_627 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_param_629 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__33_IN_op_conditions_645 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_op_conditions_647 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_NL_IN_op_conditions_649 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_op_statement_IN_op_conditions_658 = Set[ 6, 21 ]
    TOKENS_FOLLOWING_T__21_IN_op_conditions_663 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_conditions_665 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__34_IN_op_effects_681 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_op_effects_683 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_NL_IN_op_effects_685 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_op_statement_IN_op_effects_694 = Set[ 6, 21 ]
    TOKENS_FOLLOWING_T__21_IN_op_effects_699 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_effects_701 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_reference_IN_op_statement_717 = Set[ 43, 54 ]
    TOKENS_FOLLOWING_equals_op_IN_op_statement_719 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_op_statement_721 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_statement_723 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__35_IN_procedure_739 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_procedure_741 = Set[ 20, 36 ]
    TOKENS_FOLLOWING_parameters_IN_procedure_749 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_procedure_752 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_NL_IN_procedure_754 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_T__32_IN_procedure_762 = Set[ 43, 54 ]
    TOKENS_FOLLOWING_equals_op_IN_procedure_764 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_procedure_766 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_procedure_776 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_conditions_IN_procedure_786 = Set[ 4, 32, 33, 34 ]
    TOKENS_FOLLOWING_effects_IN_procedure_789 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_procedure_791 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_procedure_793 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__36_IN_parameters_809 = Set[ 6 ]
    TOKENS_FOLLOWING_parameter_IN_parameters_811 = Set[ 37, 38 ]
    TOKENS_FOLLOWING_T__37_IN_parameters_814 = Set[ 6 ]
    TOKENS_FOLLOWING_parameter_IN_parameters_816 = Set[ 37, 38 ]
    TOKENS_FOLLOWING_T__38_IN_parameters_820 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_832 = Set[ 53 ]
    TOKENS_FOLLOWING_reference_type_IN_parameter_834 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_843 = Set[ 39 ]
    TOKENS_FOLLOWING_T__39_IN_parameter_845 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_parameter_847 = Set[ 1 ]
    TOKENS_FOLLOWING_T__33_IN_conditions_862 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_conditions_870 = Set[ 4, 6, 21, 28, 41, 47 ]
    TOKENS_FOLLOWING_NL_IN_conditions_872 = Set[ 4, 6, 21, 28, 41, 47 ]
    TOKENS_FOLLOWING_constraint_body_IN_conditions_875 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_conditions_877 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_conditions_879 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__34_IN_effects_896 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_effects_904 = Set[ 4, 6, 21, 41, 49 ]
    TOKENS_FOLLOWING_NL_IN_effects_906 = Set[ 4, 6, 21, 41, 49 ]
    TOKENS_FOLLOWING_mutation_body_IN_effects_912 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_effects_917 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_effects_919 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_constraint_935 = Set[ 40 ]
    TOKENS_FOLLOWING_T__40_IN_constraint_937 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_945 = Set[ 4, 6, 21, 28, 41, 47 ]
    TOKENS_FOLLOWING_NL_IN_constraint_947 = Set[ 4, 6, 21, 28, 41, 47 ]
    TOKENS_FOLLOWING_constraint_body_IN_constraint_950 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_952 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_954 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_977 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_namespace_IN_constraint_body_990 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_iterator_IN_constraint_body_997 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_body_1006 = Set[ 1, 4, 6, 28, 41, 47 ]
    TOKENS_FOLLOWING_path_IN_constraint_namespace_1020 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1022 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_namespace_1025 = Set[ 4, 6, 21, 28, 47 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1027 = Set[ 4, 6, 21, 28, 47 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_namespace_1031 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1039 = Set[ 4, 6, 21, 28, 47 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_namespace_1044 = Set[ 1 ]
    TOKENS_FOLLOWING_T__41_IN_constraint_iterator_1055 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_constraint_iterator_1057 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_constraint_iterator_1059 = Set[ 42 ]
    TOKENS_FOLLOWING_T__42_IN_constraint_iterator_1061 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_constraint_iterator_1063 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_constraint_iterator_1065 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1067 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_iterator_1070 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1072 = Set[ 4, 6, 21, 28, 47 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_iterator_1082 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1090 = Set[ 4, 6, 21, 28, 47 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_iterator_1097 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1116 = Set[ 43, 54 ]
    TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1118 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_1120 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1129 = Set[ 43, 54 ]
    TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1131 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_1133 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1142 = Set[ 45, 55 ]
    TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1144 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_1146 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1155 = Set[ 45, 55 ]
    TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1157 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_1159 = Set[ 1 ]
    TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_1168 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1177 = Set[ 43, 44 ]
    TOKENS_FOLLOWING_T__43_IN_constraint_statement_1179 = Set[ 44 ]
    TOKENS_FOLLOWING_T__44_IN_constraint_statement_1182 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_1184 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1193 = Set[ 45, 46 ]
    TOKENS_FOLLOWING_set_IN_constraint_statement_1195 = Set[ 44 ]
    TOKENS_FOLLOWING_T__44_IN_constraint_statement_1201 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_1203 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1212 = Set[ 60, 61, 62, 63 ]
    TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_1214 = Set[ 6, 7 ]
    TOKENS_FOLLOWING_comp_value_IN_constraint_statement_1216 = Set[ 1 ]
    TOKENS_FOLLOWING_total_constraint_IN_constraint_statement_1225 = Set[ 1 ]
    TOKENS_FOLLOWING_T__47_IN_total_constraint_1236 = Set[ 6 ]
    TOKENS_FOLLOWING_total_statement_IN_total_constraint_1238 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_total_constraint_1240 = Set[ 60, 61, 62, 63 ]
    TOKENS_FOLLOWING_binary_comp_IN_total_constraint_1242 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_total_constraint_1244 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_total_statement_1255 = Set[ 43, 54 ]
    TOKENS_FOLLOWING_equals_op_IN_total_statement_1257 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_total_statement_1259 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_comp_value_1274 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_comp_value_1283 = Set[ 1 ]
    TOKENS_FOLLOWING_T__28_IN_conditional_constraint_1302 = Set[ 6, 28, 47 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_1310 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_NL_IN_conditional_constraint_1312 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_conditional_constraint_then_IN_conditional_constraint_1321 = Set[ 1 ]
    TOKENS_FOLLOWING_T__29_IN_conditional_constraint_then_1336 = Set[ 6, 28, 47 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_1338 = Set[ 1 ]
    TOKENS_FOLLOWING_mutation_statement_IN_mutation_body_1360 = Set[ 4 ]
    TOKENS_FOLLOWING_mutation_iterator_IN_mutation_body_1373 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_body_1382 = Set[ 1, 4, 6, 41, 49 ]
    TOKENS_FOLLOWING_T__41_IN_mutation_iterator_1397 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_iterator_1399 = Set[ 42 ]
    TOKENS_FOLLOWING_T__42_IN_mutation_iterator_1401 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_mutation_iterator_1403 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_1405 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_mutation_iterator_1408 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_1410 = Set[ 4, 6, 21, 49 ]
    TOKENS_FOLLOWING_mutation_statement_IN_mutation_iterator_1420 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_1428 = Set[ 4, 6, 21, 49 ]
    TOKENS_FOLLOWING_T__21_IN_mutation_iterator_1435 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1454 = Set[ 43, 54 ]
    TOKENS_FOLLOWING_equals_op_IN_mutation_statement_1456 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_1458 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1467 = Set[ 43, 54 ]
    TOKENS_FOLLOWING_equals_op_IN_mutation_statement_1469 = Set[ 8 ]
    TOKENS_FOLLOWING_NULL_IN_mutation_statement_1471 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1480 = Set[ 56, 57, 58, 59 ]
    TOKENS_FOLLOWING_binary_op_IN_mutation_statement_1482 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_mutation_statement_1484 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1493 = Set[ 43 ]
    TOKENS_FOLLOWING_T__43_IN_mutation_statement_1495 = Set[ 48 ]
    TOKENS_FOLLOWING_T__48_IN_mutation_statement_1497 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_statement_1499 = Set[ 1, 20 ]
    TOKENS_FOLLOWING_object_body_IN_mutation_statement_1507 = Set[ 1 ]
    TOKENS_FOLLOWING_T__49_IN_mutation_statement_1517 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_statement_1519 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1528 = Set[ 50 ]
    TOKENS_FOLLOWING_T__50_IN_mutation_statement_1530 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_1532 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_mutation_statement_1534 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1543 = Set[ 51 ]
    TOKENS_FOLLOWING_T__51_IN_mutation_statement_1545 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_1547 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_mutation_statement_1549 = Set[ 1 ]
    TOKENS_FOLLOWING_T__36_IN_set_value_1568 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_1576 = Set[ 37, 38 ]
    TOKENS_FOLLOWING_T__37_IN_set_value_1579 = Set[ 5, 6, 7, 9, 10, 36 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_1581 = Set[ 37, 38 ]
    TOKENS_FOLLOWING_T__38_IN_set_value_1591 = Set[ 1 ]
    TOKENS_FOLLOWING_value_IN_set_item_1602 = Set[ 1 ]
    TOKENS_FOLLOWING_primitive_value_IN_value_1621 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_value_1630 = Set[ 1 ]
    TOKENS_FOLLOWING_set_value_IN_value_1639 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_1658 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_primitive_value_1667 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_primitive_value_1676 = Set[ 1 ]
    TOKENS_FOLLOWING_MULTILINE_STRING_IN_primitive_value_1685 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_path_1700 = Set[ 1, 52 ]
    TOKENS_FOLLOWING_T__52_IN_path_1702 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_path_1703 = Set[ 1, 52 ]
    TOKENS_FOLLOWING_id_ref_IN_path_with_index_1716 = Set[ 1, 52 ]
    TOKENS_FOLLOWING_T__52_IN_path_with_index_1718 = Set[ 6 ]
    TOKENS_FOLLOWING_id_ref_IN_path_with_index_1719 = Set[ 1, 52 ]
    TOKENS_FOLLOWING_ID_IN_id_ref_1732 = Set[ 1, 26 ]
    TOKENS_FOLLOWING_T__26_IN_id_ref_1734 = Set[ 7 ]
    TOKENS_FOLLOWING_NUMBER_IN_id_ref_1736 = Set[ 27 ]
    TOKENS_FOLLOWING_T__27_IN_id_ref_1738 = Set[ 1 ]
    TOKENS_FOLLOWING_path_with_index_IN_reference_1755 = Set[ 1 ]
    TOKENS_FOLLOWING_T__53_IN_reference_type_1774 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_reference_type_1776 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_not_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_comp_0 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end

