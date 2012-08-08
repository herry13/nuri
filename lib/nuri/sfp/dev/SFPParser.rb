#!/usr/bin/env ruby
#
# SFP.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: SFP.g
# Generated at: 2012-08-07 19:39:36
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

    	attr_accessor :rootdir
    	attr_reader :root

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

        			@root = Hash.new
        			@now = @root
        			@id = 0
        			#@parser = Nuri::Sfp::Parser.new
        			@root['Object'] = { '_self' => 'Object', '_context' => 'class', '_parent' => @root }
        		
        # <-- action
        # at line 47:3: ( NL )*
        while true # decision 1
          alt_1 = 2
          look_1_0 = @input.peek( 1 )

          if ( look_1_0 == NL )
            alt_1 = 1

          end
          case alt_1
          when 1
            # at line 47:3: NL
            __NL1__ = match( NL, TOKENS_FOLLOWING_NL_IN_sfp_49 )

            tree_for_NL1 = @adaptor.create_with_payload( __NL1__ )
            @adaptor.add_child( root_0, tree_for_NL1 )


          else
            break # out of loop for decision 1
          end
        end # loop for decision 1
        # at line 47:7: ( include )*
        while true # decision 2
          alt_2 = 2
          look_2_0 = @input.peek( 1 )

          if ( look_2_0 == T__18 )
            alt_2 = 1

          end
          case alt_2
          when 1
            # at line 47:7: include
            @state.following.push( TOKENS_FOLLOWING_include_IN_sfp_52 )
            include2 = include
            @state.following.pop
            @adaptor.add_child( root_0, include2.tree )

          else
            break # out of loop for decision 2
          end
        end # loop for decision 2
        # at line 47:16: ( header )*
        while true # decision 3
          alt_3 = 2
          look_3_0 = @input.peek( 1 )

          if ( look_3_0 == T__23 || look_3_0 == T__33 )
            alt_3 = 1

          end
          case alt_3
          when 1
            # at line 47:16: header
            @state.following.push( TOKENS_FOLLOWING_header_IN_sfp_55 )
            header3 = header
            @state.following.pop
            @adaptor.add_child( root_0, header3.tree )

          else
            break # out of loop for decision 3
          end
        end # loop for decision 3
        # at line 47:24: ( state | composite | constraint )*
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
            # at line 47:25: state
            @state.following.push( TOKENS_FOLLOWING_state_IN_sfp_59 )
            state4 = state
            @state.following.pop
            @adaptor.add_child( root_0, state4.tree )

          when 2
            # at line 47:33: composite
            @state.following.push( TOKENS_FOLLOWING_composite_IN_sfp_63 )
            composite5 = composite
            @state.following.pop
            @adaptor.add_child( root_0, composite5.tree )

          when 3
            # at line 47:45: constraint
            @state.following.push( TOKENS_FOLLOWING_constraint_IN_sfp_67 )
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
    # 50:1: include : 'include' include_file ( NL )+ ;
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


        # at line 51:4: 'include' include_file ( NL )+
        string_literal7 = match( T__18, TOKENS_FOLLOWING_T__18_IN_include_80 )

        tree_for_string_literal7 = @adaptor.create_with_payload( string_literal7 )
        @adaptor.add_child( root_0, tree_for_string_literal7 )

        @state.following.push( TOKENS_FOLLOWING_include_file_IN_include_82 )
        include_file8 = include_file
        @state.following.pop
        @adaptor.add_child( root_0, include_file8.tree )
        # at file 51:27: ( NL )+
        match_count_5 = 0
        while true
          alt_5 = 2
          look_5_0 = @input.peek( 1 )

          if ( look_5_0 == NL )
            alt_5 = 1

          end
          case alt_5
          when 1
            # at line 51:27: NL
            __NL9__ = match( NL, TOKENS_FOLLOWING_NL_IN_include_84 )

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
    # 54:1: include_file : STRING ;
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


        # at line 55:4: STRING
        __STRING10__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_include_file_96 )

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
    # 59:1: header : ( class_definition | procedure );
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
        # at line 60:2: ( class_definition | procedure )
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


          # at line 60:4: class_definition
          @state.following.push( TOKENS_FOLLOWING_class_definition_IN_header_112 )
          class_definition11 = class_definition
          @state.following.pop
          @adaptor.add_child( root_0, class_definition11.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 61:4: procedure
          @state.following.push( TOKENS_FOLLOWING_procedure_IN_header_117 )
          procedure12 = procedure
          @state.following.pop
          @adaptor.add_child( root_0, procedure12.tree )
          # --> action

          			self.expand_classes
          		
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
        # trace_out( __method__, 4 )

      end
      
      return return_value
    end

    StateReturnValue = define_return_scope 

    # 
    # parser rule state
    # 
    # (in SFP.g)
    # 67:1: state : ID ( 'state' )? '{' ( NL )* ( attribute )* '}' ( NL )* ;
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


        # at line 68:4: ID ( 'state' )? '{' ( NL )* ( attribute )* '}' ( NL )*
        __ID13__ = match( ID, TOKENS_FOLLOWING_ID_IN_state_132 )

        tree_for_ID13 = @adaptor.create_with_payload( __ID13__ )
        @adaptor.add_child( root_0, tree_for_ID13 )

        # at line 68:7: ( 'state' )?
        alt_7 = 2
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == T__19 )
          alt_7 = 1
        end
        case alt_7
        when 1
          # at line 68:8: 'state'
          string_literal14 = match( T__19, TOKENS_FOLLOWING_T__19_IN_state_135 )

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
        char_literal15 = match( T__20, TOKENS_FOLLOWING_T__20_IN_state_145 )

        tree_for_char_literal15 = @adaptor.create_with_payload( char_literal15 )
        @adaptor.add_child( root_0, tree_for_char_literal15 )

        # at line 76:7: ( NL )*
        while true # decision 8
          alt_8 = 2
          look_8_0 = @input.peek( 1 )

          if ( look_8_0 == NL )
            alt_8 = 1

          end
          case alt_8
          when 1
            # at line 76:7: NL
            __NL16__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_147 )

            tree_for_NL16 = @adaptor.create_with_payload( __NL16__ )
            @adaptor.add_child( root_0, tree_for_NL16 )


          else
            break # out of loop for decision 8
          end
        end # loop for decision 8
        # at line 77:3: ( attribute )*
        while true # decision 9
          alt_9 = 2
          look_9_0 = @input.peek( 1 )

          if ( look_9_0 == ID )
            alt_9 = 1

          end
          case alt_9
          when 1
            # at line 77:3: attribute
            @state.following.push( TOKENS_FOLLOWING_attribute_IN_state_152 )
            attribute17 = attribute
            @state.following.pop
            @adaptor.add_child( root_0, attribute17.tree )

          else
            break # out of loop for decision 9
          end
        end # loop for decision 9
        char_literal18 = match( T__21, TOKENS_FOLLOWING_T__21_IN_state_157 )

        tree_for_char_literal18 = @adaptor.create_with_payload( char_literal18 )
        @adaptor.add_child( root_0, tree_for_char_literal18 )

        # at line 78:7: ( NL )*
        while true # decision 10
          alt_10 = 2
          look_10_0 = @input.peek( 1 )

          if ( look_10_0 == NL )
            alt_10 = 1

          end
          case alt_10
          when 1
            # at line 78:7: NL
            __NL19__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_159 )

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
    # 82:1: composite : 'composite' ID '{' ( NL )* ( attribute | constraint )* '}' ( NL )* ;
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


        # at line 83:4: 'composite' ID '{' ( NL )* ( attribute | constraint )* '}' ( NL )*
        string_literal20 = match( T__22, TOKENS_FOLLOWING_T__22_IN_composite_175 )

        tree_for_string_literal20 = @adaptor.create_with_payload( string_literal20 )
        @adaptor.add_child( root_0, tree_for_string_literal20 )

        __ID21__ = match( ID, TOKENS_FOLLOWING_ID_IN_composite_177 )

        tree_for_ID21 = @adaptor.create_with_payload( __ID21__ )
        @adaptor.add_child( root_0, tree_for_ID21 )

        # --> action

        			@now[__ID21__.text] = { '_self' => __ID21__.text,
        				'_context' => 'composite',
        				'_parent' => @now
        			}
        			@now = @now[__ID21__.text]
        		
        # <-- action
        char_literal22 = match( T__20, TOKENS_FOLLOWING_T__20_IN_composite_185 )

        tree_for_char_literal22 = @adaptor.create_with_payload( char_literal22 )
        @adaptor.add_child( root_0, tree_for_char_literal22 )

        # at line 91:7: ( NL )*
        while true # decision 11
          alt_11 = 2
          look_11_0 = @input.peek( 1 )

          if ( look_11_0 == NL )
            alt_11 = 1

          end
          case alt_11
          when 1
            # at line 91:7: NL
            __NL23__ = match( NL, TOKENS_FOLLOWING_NL_IN_composite_187 )

            tree_for_NL23 = @adaptor.create_with_payload( __NL23__ )
            @adaptor.add_child( root_0, tree_for_NL23 )


          else
            break # out of loop for decision 11
          end
        end # loop for decision 11
        # at line 91:11: ( attribute | constraint )*
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
            # at line 91:13: attribute
            @state.following.push( TOKENS_FOLLOWING_attribute_IN_composite_192 )
            attribute24 = attribute
            @state.following.pop
            @adaptor.add_child( root_0, attribute24.tree )

          when 2
            # at line 91:25: constraint
            @state.following.push( TOKENS_FOLLOWING_constraint_IN_composite_196 )
            constraint25 = constraint
            @state.following.pop
            @adaptor.add_child( root_0, constraint25.tree )

          else
            break # out of loop for decision 12
          end
        end # loop for decision 12
        char_literal26 = match( T__21, TOKENS_FOLLOWING_T__21_IN_composite_201 )

        tree_for_char_literal26 = @adaptor.create_with_payload( char_literal26 )
        @adaptor.add_child( root_0, tree_for_char_literal26 )

        # at line 91:43: ( NL )*
        while true # decision 13
          alt_13 = 2
          look_13_0 = @input.peek( 1 )

          if ( look_13_0 == NL )
            alt_13 = 1

          end
          case alt_13
          when 1
            # at line 91:43: NL
            __NL27__ = match( NL, TOKENS_FOLLOWING_NL_IN_composite_203 )

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
    # 95:1: class_definition : 'class' ID ( extends_class )? ( '{' ( NL )* ( attribute | procedure )* '}' )? ( NL )* ;
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


        # at line 96:4: 'class' ID ( extends_class )? ( '{' ( NL )* ( attribute | procedure )* '}' )? ( NL )*
        string_literal28 = match( T__23, TOKENS_FOLLOWING_T__23_IN_class_definition_219 )

        tree_for_string_literal28 = @adaptor.create_with_payload( string_literal28 )
        @adaptor.add_child( root_0, tree_for_string_literal28 )

        __ID29__ = match( ID, TOKENS_FOLLOWING_ID_IN_class_definition_221 )

        tree_for_ID29 = @adaptor.create_with_payload( __ID29__ )
        @adaptor.add_child( root_0, tree_for_ID29 )

        # --> action

        			@now[__ID29__.text] = { '_self' => __ID29__.text,
        				'_context' => 'class',
        				'_parent' => @now
        			}
        			@now = @now[__ID29__.text]
        		
        # <-- action
        # at line 104:3: ( extends_class )?
        alt_14 = 2
        look_14_0 = @input.peek( 1 )

        if ( look_14_0 == T__24 )
          alt_14 = 1
        end
        case alt_14
        when 1
          # at line 104:4: extends_class
          @state.following.push( TOKENS_FOLLOWING_extends_class_IN_class_definition_230 )
          extends_class30 = extends_class
          @state.following.pop
          @adaptor.add_child( root_0, extends_class30.tree )
          # --> action

          			@now['_extends'] = ( extends_class30.nil? ? nil : extends_class30.val )
          		
          # <-- action

        end
        # at line 109:3: ( '{' ( NL )* ( attribute | procedure )* '}' )?
        alt_17 = 2
        look_17_0 = @input.peek( 1 )

        if ( look_17_0 == T__20 )
          alt_17 = 1
        end
        case alt_17
        when 1
          # at line 109:4: '{' ( NL )* ( attribute | procedure )* '}'
          char_literal31 = match( T__20, TOKENS_FOLLOWING_T__20_IN_class_definition_244 )

          tree_for_char_literal31 = @adaptor.create_with_payload( char_literal31 )
          @adaptor.add_child( root_0, tree_for_char_literal31 )

          # at line 109:8: ( NL )*
          while true # decision 15
            alt_15 = 2
            look_15_0 = @input.peek( 1 )

            if ( look_15_0 == NL )
              alt_15 = 1

            end
            case alt_15
            when 1
              # at line 109:8: NL
              __NL32__ = match( NL, TOKENS_FOLLOWING_NL_IN_class_definition_246 )

              tree_for_NL32 = @adaptor.create_with_payload( __NL32__ )
              @adaptor.add_child( root_0, tree_for_NL32 )


            else
              break # out of loop for decision 15
            end
          end # loop for decision 15
          # at line 109:12: ( attribute | procedure )*
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
              # at line 109:14: attribute
              @state.following.push( TOKENS_FOLLOWING_attribute_IN_class_definition_251 )
              attribute33 = attribute
              @state.following.pop
              @adaptor.add_child( root_0, attribute33.tree )

            when 2
              # at line 109:26: procedure
              @state.following.push( TOKENS_FOLLOWING_procedure_IN_class_definition_255 )
              procedure34 = procedure
              @state.following.pop
              @adaptor.add_child( root_0, procedure34.tree )

            else
              break # out of loop for decision 16
            end
          end # loop for decision 16
          char_literal35 = match( T__21, TOKENS_FOLLOWING_T__21_IN_class_definition_260 )

          tree_for_char_literal35 = @adaptor.create_with_payload( char_literal35 )
          @adaptor.add_child( root_0, tree_for_char_literal35 )


        end
        # at line 109:45: ( NL )*
        while true # decision 18
          alt_18 = 2
          look_18_0 = @input.peek( 1 )

          if ( look_18_0 == NL )
            alt_18 = 1

          end
          case alt_18
          when 1
            # at line 109:45: NL
            __NL36__ = match( NL, TOKENS_FOLLOWING_NL_IN_class_definition_264 )

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
    # 113:1: extends_class returns [val] : 'extends' path ;
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


        # at line 114:4: 'extends' path
        string_literal37 = match( T__24, TOKENS_FOLLOWING_T__24_IN_extends_class_285 )

        tree_for_string_literal37 = @adaptor.create_with_payload( string_literal37 )
        @adaptor.add_child( root_0, tree_for_string_literal37 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_extends_class_287 )
        path38 = path
        @state.following.pop
        @adaptor.add_child( root_0, path38.tree )
        # --> action
        	return_value.val = self.to_ref(( path38 && @input.to_s( path38.start, path38.stop ) ))	
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
    # 118:1: attribute : ( ID equals_op value ( NL )+ | ID reference_type ( NL )+ | object_def ( NL )+ );
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
        # at line 119:2: ( ID equals_op value ( NL )+ | ID reference_type ( NL )+ | object_def ( NL )+ )
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


          # at line 119:4: ID equals_op value ( NL )+
          __ID39__ = match( ID, TOKENS_FOLLOWING_ID_IN_attribute_302 )

          tree_for_ID39 = @adaptor.create_with_payload( __ID39__ )
          @adaptor.add_child( root_0, tree_for_ID39 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_attribute_304 )
          equals_op40 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op40.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_attribute_306 )
          value41 = value
          @state.following.pop
          @adaptor.add_child( root_0, value41.tree )
          # at file 119:23: ( NL )+
          match_count_19 = 0
          while true
            alt_19 = 2
            look_19_0 = @input.peek( 1 )

            if ( look_19_0 == NL )
              alt_19 = 1

            end
            case alt_19
            when 1
              # at line 119:23: NL
              __NL42__ = match( NL, TOKENS_FOLLOWING_NL_IN_attribute_308 )

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


          # at line 121:4: ID reference_type ( NL )+
          __ID43__ = match( ID, TOKENS_FOLLOWING_ID_IN_attribute_318 )

          tree_for_ID43 = @adaptor.create_with_payload( __ID43__ )
          @adaptor.add_child( root_0, tree_for_ID43 )

          @state.following.push( TOKENS_FOLLOWING_reference_type_IN_attribute_320 )
          reference_type44 = reference_type
          @state.following.pop
          @adaptor.add_child( root_0, reference_type44.tree )
          # at file 121:22: ( NL )+
          match_count_20 = 0
          while true
            alt_20 = 2
            look_20_0 = @input.peek( 1 )

            if ( look_20_0 == NL )
              alt_20 = 1

            end
            case alt_20
            when 1
              # at line 121:22: NL
              __NL45__ = match( NL, TOKENS_FOLLOWING_NL_IN_attribute_322 )

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


          # at line 123:4: object_def ( NL )+
          @state.following.push( TOKENS_FOLLOWING_object_def_IN_attribute_332 )
          object_def46 = object_def
          @state.following.pop
          @adaptor.add_child( root_0, object_def46.tree )
          # at file 123:15: ( NL )+
          match_count_21 = 0
          while true
            alt_21 = 2
            look_21_0 = @input.peek( 1 )

            if ( look_21_0 == NL )
              alt_21 = 1

            end
            case alt_21
            when 1
              # at line 123:15: NL
              __NL47__ = match( NL, TOKENS_FOLLOWING_NL_IN_attribute_334 )

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
    # 126:1: object_def : ID ( 'isa' path )? ( object_body )? ;
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


        # at line 127:4: ID ( 'isa' path )? ( object_body )?
        __ID48__ = match( ID, TOKENS_FOLLOWING_ID_IN_object_def_346 )

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
        # at line 136:3: ( 'isa' path )?
        alt_23 = 2
        look_23_0 = @input.peek( 1 )

        if ( look_23_0 == T__25 )
          alt_23 = 1
        end
        case alt_23
        when 1
          # at line 136:4: 'isa' path
          string_literal49 = match( T__25, TOKENS_FOLLOWING_T__25_IN_object_def_355 )

          tree_for_string_literal49 = @adaptor.create_with_payload( string_literal49 )
          @adaptor.add_child( root_0, tree_for_string_literal49 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_object_def_357 )
          path50 = path
          @state.following.pop
          @adaptor.add_child( root_0, path50.tree )
          # --> action

          			@now['_isa'] = self.to_ref(( path50 && @input.to_s( path50.start, path50.stop ) ))
          		
          # <-- action

        end
        # at line 141:3: ( object_body )?
        alt_24 = 2
        look_24_0 = @input.peek( 1 )

        if ( look_24_0 == T__20 )
          alt_24 = 1
        end
        case alt_24
        when 1
          # at line 141:3: object_body
          @state.following.push( TOKENS_FOLLOWING_object_body_IN_object_def_370 )
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
    # 145:1: object_body : '{' ( NL )* ( object_attribute | state_dependency | operator )* '}' ;
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


        # at line 146:4: '{' ( NL )* ( object_attribute | state_dependency | operator )* '}'
        char_literal52 = match( T__20, TOKENS_FOLLOWING_T__20_IN_object_body_386 )

        tree_for_char_literal52 = @adaptor.create_with_payload( char_literal52 )
        @adaptor.add_child( root_0, tree_for_char_literal52 )

        # at line 146:8: ( NL )*
        while true # decision 25
          alt_25 = 2
          look_25_0 = @input.peek( 1 )

          if ( look_25_0 == NL )
            alt_25 = 1

          end
          case alt_25
          when 1
            # at line 146:8: NL
            __NL53__ = match( NL, TOKENS_FOLLOWING_NL_IN_object_body_388 )

            tree_for_NL53 = @adaptor.create_with_payload( __NL53__ )
            @adaptor.add_child( root_0, tree_for_NL53 )


          else
            break # out of loop for decision 25
          end
        end # loop for decision 25
        # at line 146:12: ( object_attribute | state_dependency | operator )*
        while true # decision 26
          alt_26 = 4
          case look_26 = @input.peek( 1 )
          when ID then alt_26 = 1
          when T__26 then alt_26 = 2
          when T__29 then alt_26 = 3
          end
          case alt_26
          when 1
            # at line 146:14: object_attribute
            @state.following.push( TOKENS_FOLLOWING_object_attribute_IN_object_body_393 )
            object_attribute54 = object_attribute
            @state.following.pop
            @adaptor.add_child( root_0, object_attribute54.tree )

          when 2
            # at line 146:33: state_dependency
            @state.following.push( TOKENS_FOLLOWING_state_dependency_IN_object_body_397 )
            state_dependency55 = state_dependency
            @state.following.pop
            @adaptor.add_child( root_0, state_dependency55.tree )

          when 3
            # at line 146:52: operator
            @state.following.push( TOKENS_FOLLOWING_operator_IN_object_body_401 )
            operator56 = operator
            @state.following.pop
            @adaptor.add_child( root_0, operator56.tree )

          else
            break # out of loop for decision 26
          end
        end # loop for decision 26
        char_literal57 = match( T__21, TOKENS_FOLLOWING_T__21_IN_object_body_406 )

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
    # 149:1: object_attribute : ( attribute | ID equals_op NULL ( NL )+ );
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
        # at line 150:2: ( attribute | ID equals_op NULL ( NL )+ )
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


          # at line 150:4: attribute
          @state.following.push( TOKENS_FOLLOWING_attribute_IN_object_attribute_417 )
          attribute58 = attribute
          @state.following.pop
          @adaptor.add_child( root_0, attribute58.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 151:4: ID equals_op NULL ( NL )+
          __ID59__ = match( ID, TOKENS_FOLLOWING_ID_IN_object_attribute_422 )

          tree_for_ID59 = @adaptor.create_with_payload( __ID59__ )
          @adaptor.add_child( root_0, tree_for_ID59 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_object_attribute_424 )
          equals_op60 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op60.tree )
          __NULL61__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_object_attribute_426 )

          tree_for_NULL61 = @adaptor.create_with_payload( __NULL61__ )
          @adaptor.add_child( root_0, tree_for_NULL61 )

          # at file 151:22: ( NL )+
          match_count_27 = 0
          while true
            alt_27 = 2
            look_27_0 = @input.peek( 1 )

            if ( look_27_0 == NL )
              alt_27 = 1

            end
            case alt_27
            when 1
              # at line 151:22: NL
              __NL62__ = match( NL, TOKENS_FOLLOWING_NL_IN_object_attribute_428 )

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
    # 155:1: state_dependency : 'if' dep_effect ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )* ( NL )+ ;
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


        # at line 156:4: 'if' dep_effect ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )* ( NL )+
        string_literal63 = match( T__26, TOKENS_FOLLOWING_T__26_IN_state_dependency_444 )

        tree_for_string_literal63 = @adaptor.create_with_payload( string_literal63 )
        @adaptor.add_child( root_0, tree_for_string_literal63 )

        @state.following.push( TOKENS_FOLLOWING_dep_effect_IN_state_dependency_448 )
        dep_effect64 = dep_effect
        @state.following.pop
        @adaptor.add_child( root_0, dep_effect64.tree )
        # at line 157:14: ( NL )*
        while true # decision 29
          alt_29 = 2
          look_29_0 = @input.peek( 1 )

          if ( look_29_0 == NL )
            alt_29 = 1

          end
          case alt_29
          when 1
            # at line 157:14: NL
            __NL65__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_450 )

            tree_for_NL65 = @adaptor.create_with_payload( __NL65__ )
            @adaptor.add_child( root_0, tree_for_NL65 )


          else
            break # out of loop for decision 29
          end
        end # loop for decision 29
        string_literal66 = match( T__27, TOKENS_FOLLOWING_T__27_IN_state_dependency_453 )

        tree_for_string_literal66 = @adaptor.create_with_payload( string_literal66 )
        @adaptor.add_child( root_0, tree_for_string_literal66 )

        # at line 157:25: ( NL )*
        while true # decision 30
          alt_30 = 2
          look_30_0 = @input.peek( 1 )

          if ( look_30_0 == NL )
            alt_30 = 1

          end
          case alt_30
          when 1
            # at line 157:25: NL
            __NL67__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_455 )

            tree_for_NL67 = @adaptor.create_with_payload( __NL67__ )
            @adaptor.add_child( root_0, tree_for_NL67 )


          else
            break # out of loop for decision 30
          end
        end # loop for decision 30
        char_literal68 = match( T__20, TOKENS_FOLLOWING_T__20_IN_state_dependency_458 )

        tree_for_char_literal68 = @adaptor.create_with_payload( char_literal68 )
        @adaptor.add_child( root_0, tree_for_char_literal68 )

        # at line 158:3: ( NL )*
        while true # decision 31
          alt_31 = 2
          look_31_0 = @input.peek( 1 )

          if ( look_31_0 == NL )
            alt_31 = 1

          end
          case alt_31
          when 1
            # at line 158:3: NL
            __NL69__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_462 )

            tree_for_NL69 = @adaptor.create_with_payload( __NL69__ )
            @adaptor.add_child( root_0, tree_for_NL69 )


          else
            break # out of loop for decision 31
          end
        end # loop for decision 31
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_state_dependency_465 )
        constraint_body70 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body70.tree )
        char_literal71 = match( T__21, TOKENS_FOLLOWING_T__21_IN_state_dependency_470 )

        tree_for_char_literal71 = @adaptor.create_with_payload( char_literal71 )
        @adaptor.add_child( root_0, tree_for_char_literal71 )

        # at line 160:3: ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )*
        while true # decision 35
          alt_35 = 2
          alt_35 = @dfa35.predict( @input )
          case alt_35
          when 1
            # at line 160:5: ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}'
            # at line 160:5: ( NL )*
            while true # decision 32
              alt_32 = 2
              look_32_0 = @input.peek( 1 )

              if ( look_32_0 == NL )
                alt_32 = 1

              end
              case alt_32
              when 1
                # at line 160:5: NL
                __NL72__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_476 )

                tree_for_NL72 = @adaptor.create_with_payload( __NL72__ )
                @adaptor.add_child( root_0, tree_for_NL72 )


              else
                break # out of loop for decision 32
              end
            end # loop for decision 32
            string_literal73 = match( T__28, TOKENS_FOLLOWING_T__28_IN_state_dependency_479 )

            tree_for_string_literal73 = @adaptor.create_with_payload( string_literal73 )
            @adaptor.add_child( root_0, tree_for_string_literal73 )

            # at line 160:14: ( NL )*
            while true # decision 33
              alt_33 = 2
              look_33_0 = @input.peek( 1 )

              if ( look_33_0 == NL )
                alt_33 = 1

              end
              case alt_33
              when 1
                # at line 160:14: NL
                __NL74__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_481 )

                tree_for_NL74 = @adaptor.create_with_payload( __NL74__ )
                @adaptor.add_child( root_0, tree_for_NL74 )


              else
                break # out of loop for decision 33
              end
            end # loop for decision 33
            char_literal75 = match( T__20, TOKENS_FOLLOWING_T__20_IN_state_dependency_484 )

            tree_for_char_literal75 = @adaptor.create_with_payload( char_literal75 )
            @adaptor.add_child( root_0, tree_for_char_literal75 )

            # at line 161:3: ( NL )*
            while true # decision 34
              alt_34 = 2
              look_34_0 = @input.peek( 1 )

              if ( look_34_0 == NL )
                alt_34 = 1

              end
              case alt_34
              when 1
                # at line 161:3: NL
                __NL76__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_488 )

                tree_for_NL76 = @adaptor.create_with_payload( __NL76__ )
                @adaptor.add_child( root_0, tree_for_NL76 )


              else
                break # out of loop for decision 34
              end
            end # loop for decision 34
            @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_state_dependency_491 )
            constraint_body77 = constraint_body
            @state.following.pop
            @adaptor.add_child( root_0, constraint_body77.tree )
            char_literal78 = match( T__21, TOKENS_FOLLOWING_T__21_IN_state_dependency_495 )

            tree_for_char_literal78 = @adaptor.create_with_payload( char_literal78 )
            @adaptor.add_child( root_0, tree_for_char_literal78 )


          else
            break # out of loop for decision 35
          end
        end # loop for decision 35
        # at file 163:3: ( NL )+
        match_count_36 = 0
        while true
          alt_36 = 2
          look_36_0 = @input.peek( 1 )

          if ( look_36_0 == NL )
            alt_36 = 1

          end
          case alt_36
          when 1
            # at line 163:3: NL
            __NL79__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_501 )

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
    # 166:1: dep_effect : reference equals_op ( value | NULL ) ;
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


        # at line 167:4: reference equals_op ( value | NULL )
        @state.following.push( TOKENS_FOLLOWING_reference_IN_dep_effect_513 )
        reference80 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference80.tree )
        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_dep_effect_515 )
        equals_op81 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op81.tree )
        # at line 168:3: ( value | NULL )
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
          # at line 168:5: value
          @state.following.push( TOKENS_FOLLOWING_value_IN_dep_effect_522 )
          value82 = value
          @state.following.pop
          @adaptor.add_child( root_0, value82.tree )

        when 2
          # at line 169:5: NULL
          __NULL83__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_dep_effect_528 )

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
    # 173:1: operator : 'operator' ID '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( op_param )* ( op_conditions )? op_effects '}' ( NL )+ ;
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
      char_literal95 = nil
      __NL96__ = nil
      equals_op89 = nil
      op_param92 = nil
      op_conditions93 = nil
      op_effects94 = nil

      tree_for_string_literal84 = nil
      tree_for_ID85 = nil
      tree_for_char_literal86 = nil
      tree_for_NL87 = nil
      tree_for_string_literal88 = nil
      tree_for_NUMBER90 = nil
      tree_for_NL91 = nil
      tree_for_char_literal95 = nil
      tree_for_NL96 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 174:4: 'operator' ID '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( op_param )* ( op_conditions )? op_effects '}' ( NL )+
        string_literal84 = match( T__29, TOKENS_FOLLOWING_T__29_IN_operator_544 )

        tree_for_string_literal84 = @adaptor.create_with_payload( string_literal84 )
        @adaptor.add_child( root_0, tree_for_string_literal84 )

        __ID85__ = match( ID, TOKENS_FOLLOWING_ID_IN_operator_546 )

        tree_for_ID85 = @adaptor.create_with_payload( __ID85__ )
        @adaptor.add_child( root_0, tree_for_ID85 )

        char_literal86 = match( T__20, TOKENS_FOLLOWING_T__20_IN_operator_548 )

        tree_for_char_literal86 = @adaptor.create_with_payload( char_literal86 )
        @adaptor.add_child( root_0, tree_for_char_literal86 )

        # at line 174:22: ( NL )*
        while true # decision 38
          alt_38 = 2
          look_38_0 = @input.peek( 1 )

          if ( look_38_0 == NL )
            alt_38 = 1

          end
          case alt_38
          when 1
            # at line 174:22: NL
            __NL87__ = match( NL, TOKENS_FOLLOWING_NL_IN_operator_550 )

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
        				'_conditions' => { '_context' => 'constraint' },
        				'_effects' => { '_context' => 'mutation' }
        			}
        			@now = @now[__ID85__.text]
        		
        # <-- action
        # at line 184:3: ( 'cost' equals_op NUMBER ( NL )+ )?
        alt_40 = 2
        look_40_0 = @input.peek( 1 )

        if ( look_40_0 == T__30 )
          alt_40 = 1
        end
        case alt_40
        when 1
          # at line 184:5: 'cost' equals_op NUMBER ( NL )+
          string_literal88 = match( T__30, TOKENS_FOLLOWING_T__30_IN_operator_561 )

          tree_for_string_literal88 = @adaptor.create_with_payload( string_literal88 )
          @adaptor.add_child( root_0, tree_for_string_literal88 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_operator_563 )
          equals_op89 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op89.tree )
          __NUMBER90__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_operator_565 )

          tree_for_NUMBER90 = @adaptor.create_with_payload( __NUMBER90__ )
          @adaptor.add_child( root_0, tree_for_NUMBER90 )

          # at file 184:29: ( NL )+
          match_count_39 = 0
          while true
            alt_39 = 2
            look_39_0 = @input.peek( 1 )

            if ( look_39_0 == NL )
              alt_39 = 1

            end
            case alt_39
            when 1
              # at line 184:29: NL
              __NL91__ = match( NL, TOKENS_FOLLOWING_NL_IN_operator_567 )

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
        # at line 187:3: ( op_param )*
        while true # decision 41
          alt_41 = 2
          look_41_0 = @input.peek( 1 )

          if ( look_41_0 == ID )
            alt_41 = 1

          end
          case alt_41
          when 1
            # at line 187:3: op_param
            @state.following.push( TOKENS_FOLLOWING_op_param_IN_operator_582 )
            op_param92 = op_param
            @state.following.pop
            @adaptor.add_child( root_0, op_param92.tree )

          else
            break # out of loop for decision 41
          end
        end # loop for decision 41
        # at line 188:3: ( op_conditions )?
        alt_42 = 2
        look_42_0 = @input.peek( 1 )

        if ( look_42_0 == T__31 )
          alt_42 = 1
        end
        case alt_42
        when 1
          # at line 188:3: op_conditions
          @state.following.push( TOKENS_FOLLOWING_op_conditions_IN_operator_587 )
          op_conditions93 = op_conditions
          @state.following.pop
          @adaptor.add_child( root_0, op_conditions93.tree )

        end
        @state.following.push( TOKENS_FOLLOWING_op_effects_IN_operator_590 )
        op_effects94 = op_effects
        @state.following.pop
        @adaptor.add_child( root_0, op_effects94.tree )
        char_literal95 = match( T__21, TOKENS_FOLLOWING_T__21_IN_operator_594 )

        tree_for_char_literal95 = @adaptor.create_with_payload( char_literal95 )
        @adaptor.add_child( root_0, tree_for_char_literal95 )

        # at file 189:7: ( NL )+
        match_count_43 = 0
        while true
          alt_43 = 2
          look_43_0 = @input.peek( 1 )

          if ( look_43_0 == NL )
            alt_43 = 1

          end
          case alt_43
          when 1
            # at line 189:7: NL
            __NL96__ = match( NL, TOKENS_FOLLOWING_NL_IN_operator_596 )

            tree_for_NL96 = @adaptor.create_with_payload( __NL96__ )
            @adaptor.add_child( root_0, tree_for_NL96 )


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
    # 193:1: op_param : ID equals_op reference ( NL )+ ;
    # 
    def op_param
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )
      return_value = OpParamReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID97__ = nil
      __NL100__ = nil
      equals_op98 = nil
      reference99 = nil

      tree_for_ID97 = nil
      tree_for_NL100 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 194:4: ID equals_op reference ( NL )+
        __ID97__ = match( ID, TOKENS_FOLLOWING_ID_IN_op_param_612 )

        tree_for_ID97 = @adaptor.create_with_payload( __ID97__ )
        @adaptor.add_child( root_0, tree_for_ID97 )

        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_op_param_614 )
        equals_op98 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op98.tree )
        @state.following.push( TOKENS_FOLLOWING_reference_IN_op_param_616 )
        reference99 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference99.tree )
        # at file 194:27: ( NL )+
        match_count_44 = 0
        while true
          alt_44 = 2
          look_44_0 = @input.peek( 1 )

          if ( look_44_0 == NL )
            alt_44 = 1

          end
          case alt_44
          when 1
            # at line 194:27: NL
            __NL100__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_param_618 )

            tree_for_NL100 = @adaptor.create_with_payload( __NL100__ )
            @adaptor.add_child( root_0, tree_for_NL100 )


          else
            match_count_44 > 0 and break
            eee = EarlyExit(44)


            raise eee
          end
          match_count_44 += 1
        end

        # --> action
        	@now[__ID97__.text] = ( reference99.nil? ? nil : reference99.val )	
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
    # 198:1: op_conditions : 'conditions' '{' ( NL )* ( op_statement )* '}' ( NL )+ ;
    # 
    def op_conditions
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      return_value = OpConditionsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal101 = nil
      char_literal102 = nil
      __NL103__ = nil
      char_literal105 = nil
      __NL106__ = nil
      op_statement104 = nil

      tree_for_string_literal101 = nil
      tree_for_char_literal102 = nil
      tree_for_NL103 = nil
      tree_for_char_literal105 = nil
      tree_for_NL106 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 199:4: 'conditions' '{' ( NL )* ( op_statement )* '}' ( NL )+
        string_literal101 = match( T__31, TOKENS_FOLLOWING_T__31_IN_op_conditions_634 )

        tree_for_string_literal101 = @adaptor.create_with_payload( string_literal101 )
        @adaptor.add_child( root_0, tree_for_string_literal101 )

        char_literal102 = match( T__20, TOKENS_FOLLOWING_T__20_IN_op_conditions_636 )

        tree_for_char_literal102 = @adaptor.create_with_payload( char_literal102 )
        @adaptor.add_child( root_0, tree_for_char_literal102 )

        # at line 199:21: ( NL )*
        while true # decision 45
          alt_45 = 2
          look_45_0 = @input.peek( 1 )

          if ( look_45_0 == NL )
            alt_45 = 1

          end
          case alt_45
          when 1
            # at line 199:21: NL
            __NL103__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_conditions_638 )

            tree_for_NL103 = @adaptor.create_with_payload( __NL103__ )
            @adaptor.add_child( root_0, tree_for_NL103 )


          else
            break # out of loop for decision 45
          end
        end # loop for decision 45
        # --> action

        			@now['_conditions']['_parent'] = @now
        			@now = @now['_conditions']
        		
        # <-- action
        # at line 204:3: ( op_statement )*
        while true # decision 46
          alt_46 = 2
          look_46_0 = @input.peek( 1 )

          if ( look_46_0 == ID )
            alt_46 = 1

          end
          case alt_46
          when 1
            # at line 204:3: op_statement
            @state.following.push( TOKENS_FOLLOWING_op_statement_IN_op_conditions_647 )
            op_statement104 = op_statement
            @state.following.pop
            @adaptor.add_child( root_0, op_statement104.tree )

          else
            break # out of loop for decision 46
          end
        end # loop for decision 46
        char_literal105 = match( T__21, TOKENS_FOLLOWING_T__21_IN_op_conditions_652 )

        tree_for_char_literal105 = @adaptor.create_with_payload( char_literal105 )
        @adaptor.add_child( root_0, tree_for_char_literal105 )

        # at file 205:7: ( NL )+
        match_count_47 = 0
        while true
          alt_47 = 2
          look_47_0 = @input.peek( 1 )

          if ( look_47_0 == NL )
            alt_47 = 1

          end
          case alt_47
          when 1
            # at line 205:7: NL
            __NL106__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_conditions_654 )

            tree_for_NL106 = @adaptor.create_with_payload( __NL106__ )
            @adaptor.add_child( root_0, tree_for_NL106 )


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
    # 209:1: op_effects : 'effects' '{' ( NL )* ( op_statement )* '}' ( NL )+ ;
    # 
    def op_effects
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      return_value = OpEffectsReturnValue.new

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


        # at line 210:4: 'effects' '{' ( NL )* ( op_statement )* '}' ( NL )+
        string_literal107 = match( T__32, TOKENS_FOLLOWING_T__32_IN_op_effects_670 )

        tree_for_string_literal107 = @adaptor.create_with_payload( string_literal107 )
        @adaptor.add_child( root_0, tree_for_string_literal107 )

        char_literal108 = match( T__20, TOKENS_FOLLOWING_T__20_IN_op_effects_672 )

        tree_for_char_literal108 = @adaptor.create_with_payload( char_literal108 )
        @adaptor.add_child( root_0, tree_for_char_literal108 )

        # at line 210:18: ( NL )*
        while true # decision 48
          alt_48 = 2
          look_48_0 = @input.peek( 1 )

          if ( look_48_0 == NL )
            alt_48 = 1

          end
          case alt_48
          when 1
            # at line 210:18: NL
            __NL109__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_effects_674 )

            tree_for_NL109 = @adaptor.create_with_payload( __NL109__ )
            @adaptor.add_child( root_0, tree_for_NL109 )


          else
            break # out of loop for decision 48
          end
        end # loop for decision 48
        # --> action

        			@now['_effects']['_parent'] = @now
        			@now = @now['_effects']
        		
        # <-- action
        # at line 215:3: ( op_statement )*
        while true # decision 49
          alt_49 = 2
          look_49_0 = @input.peek( 1 )

          if ( look_49_0 == ID )
            alt_49 = 1

          end
          case alt_49
          when 1
            # at line 215:3: op_statement
            @state.following.push( TOKENS_FOLLOWING_op_statement_IN_op_effects_683 )
            op_statement110 = op_statement
            @state.following.pop
            @adaptor.add_child( root_0, op_statement110.tree )

          else
            break # out of loop for decision 49
          end
        end # loop for decision 49
        char_literal111 = match( T__21, TOKENS_FOLLOWING_T__21_IN_op_effects_688 )

        tree_for_char_literal111 = @adaptor.create_with_payload( char_literal111 )
        @adaptor.add_child( root_0, tree_for_char_literal111 )

        # at file 216:7: ( NL )+
        match_count_50 = 0
        while true
          alt_50 = 2
          look_50_0 = @input.peek( 1 )

          if ( look_50_0 == NL )
            alt_50 = 1

          end
          case alt_50
          when 1
            # at line 216:7: NL
            __NL112__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_effects_690 )

            tree_for_NL112 = @adaptor.create_with_payload( __NL112__ )
            @adaptor.add_child( root_0, tree_for_NL112 )


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
    # 220:1: op_statement : reference equals_op value ( NL )+ ;
    # 
    def op_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      return_value = OpStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL116__ = nil
      reference113 = nil
      equals_op114 = nil
      value115 = nil

      tree_for_NL116 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 221:4: reference equals_op value ( NL )+
        @state.following.push( TOKENS_FOLLOWING_reference_IN_op_statement_706 )
        reference113 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference113.tree )
        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_op_statement_708 )
        equals_op114 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op114.tree )
        @state.following.push( TOKENS_FOLLOWING_value_IN_op_statement_710 )
        value115 = value
        @state.following.pop
        @adaptor.add_child( root_0, value115.tree )
        # at file 221:30: ( NL )+
        match_count_51 = 0
        while true
          alt_51 = 2
          look_51_0 = @input.peek( 1 )

          if ( look_51_0 == NL )
            alt_51 = 1

          end
          case alt_51
          when 1
            # at line 221:30: NL
            __NL116__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_statement_712 )

            tree_for_NL116 = @adaptor.create_with_payload( __NL116__ )
            @adaptor.add_child( root_0, tree_for_NL116 )


          else
            match_count_51 > 0 and break
            eee = EarlyExit(51)


            raise eee
          end
          match_count_51 += 1
        end

        # --> action
        	@now[( reference113.nil? ? nil : reference113.val )] = ( value115.nil? ? nil : value115.val )	
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
    # 225:1: procedure : 'procedure' ID ( parameters )? '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( conditions )? effects '}' ( NL )+ ;
    # 
    def procedure
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = ProcedureReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal117 = nil
      __ID118__ = nil
      char_literal120 = nil
      __NL121__ = nil
      string_literal122 = nil
      __NUMBER124__ = nil
      __NL125__ = nil
      char_literal128 = nil
      __NL129__ = nil
      parameters119 = nil
      equals_op123 = nil
      conditions126 = nil
      effects127 = nil

      tree_for_string_literal117 = nil
      tree_for_ID118 = nil
      tree_for_char_literal120 = nil
      tree_for_NL121 = nil
      tree_for_string_literal122 = nil
      tree_for_NUMBER124 = nil
      tree_for_NL125 = nil
      tree_for_char_literal128 = nil
      tree_for_NL129 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 226:4: 'procedure' ID ( parameters )? '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( conditions )? effects '}' ( NL )+
        string_literal117 = match( T__33, TOKENS_FOLLOWING_T__33_IN_procedure_728 )

        tree_for_string_literal117 = @adaptor.create_with_payload( string_literal117 )
        @adaptor.add_child( root_0, tree_for_string_literal117 )

        __ID118__ = match( ID, TOKENS_FOLLOWING_ID_IN_procedure_730 )

        tree_for_ID118 = @adaptor.create_with_payload( __ID118__ )
        @adaptor.add_child( root_0, tree_for_ID118 )

        # --> action

        			@now[__ID118__.text] = { '_self' => __ID118__.text,
        				'_context' => 'procedure',
        				'_parent' => @now,
        				'_conditions' => { '_context' => 'constraint', '_type' => 'and' },
        				'_effects' => { '_context' => 'mutation', '_type' => 'and' }
        			}
        			@now = @now[__ID118__.text]
        		
        # <-- action
        # at line 236:3: ( parameters )?
        alt_52 = 2
        look_52_0 = @input.peek( 1 )

        if ( look_52_0 == T__34 )
          alt_52 = 1
        end
        case alt_52
        when 1
          # at line 236:3: parameters
          @state.following.push( TOKENS_FOLLOWING_parameters_IN_procedure_738 )
          parameters119 = parameters
          @state.following.pop
          @adaptor.add_child( root_0, parameters119.tree )

        end
        char_literal120 = match( T__20, TOKENS_FOLLOWING_T__20_IN_procedure_741 )

        tree_for_char_literal120 = @adaptor.create_with_payload( char_literal120 )
        @adaptor.add_child( root_0, tree_for_char_literal120 )

        # at line 236:19: ( NL )*
        while true # decision 53
          alt_53 = 2
          look_53_0 = @input.peek( 1 )

          if ( look_53_0 == NL )
            alt_53 = 1

          end
          case alt_53
          when 1
            # at line 236:19: NL
            __NL121__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_743 )

            tree_for_NL121 = @adaptor.create_with_payload( __NL121__ )
            @adaptor.add_child( root_0, tree_for_NL121 )


          else
            break # out of loop for decision 53
          end
        end # loop for decision 53
        # at line 237:3: ( 'cost' equals_op NUMBER ( NL )+ )?
        alt_55 = 2
        look_55_0 = @input.peek( 1 )

        if ( look_55_0 == T__30 )
          alt_55 = 1
        end
        case alt_55
        when 1
          # at line 237:5: 'cost' equals_op NUMBER ( NL )+
          string_literal122 = match( T__30, TOKENS_FOLLOWING_T__30_IN_procedure_751 )

          tree_for_string_literal122 = @adaptor.create_with_payload( string_literal122 )
          @adaptor.add_child( root_0, tree_for_string_literal122 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_procedure_753 )
          equals_op123 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op123.tree )
          __NUMBER124__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_procedure_755 )

          tree_for_NUMBER124 = @adaptor.create_with_payload( __NUMBER124__ )
          @adaptor.add_child( root_0, tree_for_NUMBER124 )

          # --> action
          	@now['_cost'] = __NUMBER124__.text.to_i	
          # <-- action
          # at file 239:4: ( NL )+
          match_count_54 = 0
          while true
            alt_54 = 2
            look_54_0 = @input.peek( 1 )

            if ( look_54_0 == NL )
              alt_54 = 1

            end
            case alt_54
            when 1
              # at line 239:4: NL
              __NL125__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_765 )

              tree_for_NL125 = @adaptor.create_with_payload( __NL125__ )
              @adaptor.add_child( root_0, tree_for_NL125 )


            else
              match_count_54 > 0 and break
              eee = EarlyExit(54)


              raise eee
            end
            match_count_54 += 1
          end


        end
        # at line 241:3: ( conditions )?
        alt_56 = 2
        look_56_0 = @input.peek( 1 )

        if ( look_56_0 == T__31 )
          alt_56 = 1
        end
        case alt_56
        when 1
          # at line 241:3: conditions
          @state.following.push( TOKENS_FOLLOWING_conditions_IN_procedure_775 )
          conditions126 = conditions
          @state.following.pop
          @adaptor.add_child( root_0, conditions126.tree )

        end
        @state.following.push( TOKENS_FOLLOWING_effects_IN_procedure_778 )
        effects127 = effects
        @state.following.pop
        @adaptor.add_child( root_0, effects127.tree )
        char_literal128 = match( T__21, TOKENS_FOLLOWING_T__21_IN_procedure_780 )

        tree_for_char_literal128 = @adaptor.create_with_payload( char_literal128 )
        @adaptor.add_child( root_0, tree_for_char_literal128 )

        # at file 241:27: ( NL )+
        match_count_57 = 0
        while true
          alt_57 = 2
          look_57_0 = @input.peek( 1 )

          if ( look_57_0 == NL )
            alt_57 = 1

          end
          case alt_57
          when 1
            # at line 241:27: NL
            __NL129__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_782 )

            tree_for_NL129 = @adaptor.create_with_payload( __NL129__ )
            @adaptor.add_child( root_0, tree_for_NL129 )


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
    # 245:1: parameters : '(' parameter ( ',' parameter )* ')' ;
    # 
    def parameters
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = ParametersReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal130 = nil
      char_literal132 = nil
      char_literal134 = nil
      parameter131 = nil
      parameter133 = nil

      tree_for_char_literal130 = nil
      tree_for_char_literal132 = nil
      tree_for_char_literal134 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 246:4: '(' parameter ( ',' parameter )* ')'
        char_literal130 = match( T__34, TOKENS_FOLLOWING_T__34_IN_parameters_798 )

        tree_for_char_literal130 = @adaptor.create_with_payload( char_literal130 )
        @adaptor.add_child( root_0, tree_for_char_literal130 )

        @state.following.push( TOKENS_FOLLOWING_parameter_IN_parameters_800 )
        parameter131 = parameter
        @state.following.pop
        @adaptor.add_child( root_0, parameter131.tree )
        # at line 246:18: ( ',' parameter )*
        while true # decision 58
          alt_58 = 2
          look_58_0 = @input.peek( 1 )

          if ( look_58_0 == T__35 )
            alt_58 = 1

          end
          case alt_58
          when 1
            # at line 246:19: ',' parameter
            char_literal132 = match( T__35, TOKENS_FOLLOWING_T__35_IN_parameters_803 )

            tree_for_char_literal132 = @adaptor.create_with_payload( char_literal132 )
            @adaptor.add_child( root_0, tree_for_char_literal132 )

            @state.following.push( TOKENS_FOLLOWING_parameter_IN_parameters_805 )
            parameter133 = parameter
            @state.following.pop
            @adaptor.add_child( root_0, parameter133.tree )

          else
            break # out of loop for decision 58
          end
        end # loop for decision 58
        char_literal134 = match( T__36, TOKENS_FOLLOWING_T__36_IN_parameters_809 )

        tree_for_char_literal134 = @adaptor.create_with_payload( char_literal134 )
        @adaptor.add_child( root_0, tree_for_char_literal134 )

        # - - - - - - - rule clean up - - - - - - - -
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
    # 249:1: parameter : ( ID reference_type | ID 'areall' path );
    # 
    def parameter
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = ParameterReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID135__ = nil
      __ID137__ = nil
      string_literal138 = nil
      reference_type136 = nil
      path139 = nil

      tree_for_ID135 = nil
      tree_for_ID137 = nil
      tree_for_string_literal138 = nil

      begin
        # at line 250:2: ( ID reference_type | ID 'areall' path )
        alt_59 = 2
        look_59_0 = @input.peek( 1 )

        if ( look_59_0 == ID )
          look_59_1 = @input.peek( 2 )

          if ( look_59_1 == T__37 )
            alt_59 = 2
          elsif ( look_59_1 == T__50 )
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


          # at line 250:4: ID reference_type
          __ID135__ = match( ID, TOKENS_FOLLOWING_ID_IN_parameter_821 )

          tree_for_ID135 = @adaptor.create_with_payload( __ID135__ )
          @adaptor.add_child( root_0, tree_for_ID135 )

          @state.following.push( TOKENS_FOLLOWING_reference_type_IN_parameter_823 )
          reference_type136 = reference_type
          @state.following.pop
          @adaptor.add_child( root_0, reference_type136.tree )
          # --> action
          	@now[__ID135__.text] = ( reference_type136.nil? ? nil : reference_type136.val )	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 252:4: ID 'areall' path
          __ID137__ = match( ID, TOKENS_FOLLOWING_ID_IN_parameter_832 )

          tree_for_ID137 = @adaptor.create_with_payload( __ID137__ )
          @adaptor.add_child( root_0, tree_for_ID137 )

          string_literal138 = match( T__37, TOKENS_FOLLOWING_T__37_IN_parameter_834 )

          tree_for_string_literal138 = @adaptor.create_with_payload( string_literal138 )
          @adaptor.add_child( root_0, tree_for_string_literal138 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_parameter_836 )
          path139 = path
          @state.following.pop
          @adaptor.add_child( root_0, path139.tree )
          # --> action

          			@now[__ID137__.text] = { '_context' => 'all',
          				'_isa' => self.to_ref(( path139 && @input.to_s( path139.start, path139.stop ) )),
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
    # 261:1: conditions : 'conditions' '{' ( NL )* constraint_body '}' ( NL )+ ;
    # 
    def conditions
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
      return_value = ConditionsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal140 = nil
      char_literal141 = nil
      __NL142__ = nil
      char_literal144 = nil
      __NL145__ = nil
      constraint_body143 = nil

      tree_for_string_literal140 = nil
      tree_for_char_literal141 = nil
      tree_for_NL142 = nil
      tree_for_char_literal144 = nil
      tree_for_NL145 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 262:4: 'conditions' '{' ( NL )* constraint_body '}' ( NL )+
        string_literal140 = match( T__31, TOKENS_FOLLOWING_T__31_IN_conditions_851 )

        tree_for_string_literal140 = @adaptor.create_with_payload( string_literal140 )
        @adaptor.add_child( root_0, tree_for_string_literal140 )

        # --> action

        			@now['_conditions']['_parent'] = @now
        			@now = @now['_conditions']
        		
        # <-- action
        char_literal141 = match( T__20, TOKENS_FOLLOWING_T__20_IN_conditions_859 )

        tree_for_char_literal141 = @adaptor.create_with_payload( char_literal141 )
        @adaptor.add_child( root_0, tree_for_char_literal141 )

        # at line 267:7: ( NL )*
        while true # decision 60
          alt_60 = 2
          look_60_0 = @input.peek( 1 )

          if ( look_60_0 == NL )
            alt_60 = 1

          end
          case alt_60
          when 1
            # at line 267:7: NL
            __NL142__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditions_861 )

            tree_for_NL142 = @adaptor.create_with_payload( __NL142__ )
            @adaptor.add_child( root_0, tree_for_NL142 )


          else
            break # out of loop for decision 60
          end
        end # loop for decision 60
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_conditions_864 )
        constraint_body143 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body143.tree )
        char_literal144 = match( T__21, TOKENS_FOLLOWING_T__21_IN_conditions_866 )

        tree_for_char_literal144 = @adaptor.create_with_payload( char_literal144 )
        @adaptor.add_child( root_0, tree_for_char_literal144 )

        # at file 267:31: ( NL )+
        match_count_61 = 0
        while true
          alt_61 = 2
          look_61_0 = @input.peek( 1 )

          if ( look_61_0 == NL )
            alt_61 = 1

          end
          case alt_61
          when 1
            # at line 267:31: NL
            __NL145__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditions_868 )

            tree_for_NL145 = @adaptor.create_with_payload( __NL145__ )
            @adaptor.add_child( root_0, tree_for_NL145 )


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
    # 272:1: effects : 'effects' '{' ( NL )* mutation_body '}' ( NL )+ ;
    # 
    def effects
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = EffectsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal146 = nil
      char_literal147 = nil
      __NL148__ = nil
      char_literal150 = nil
      __NL151__ = nil
      mutation_body149 = nil

      tree_for_string_literal146 = nil
      tree_for_char_literal147 = nil
      tree_for_NL148 = nil
      tree_for_char_literal150 = nil
      tree_for_NL151 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 273:4: 'effects' '{' ( NL )* mutation_body '}' ( NL )+
        string_literal146 = match( T__32, TOKENS_FOLLOWING_T__32_IN_effects_885 )

        tree_for_string_literal146 = @adaptor.create_with_payload( string_literal146 )
        @adaptor.add_child( root_0, tree_for_string_literal146 )

        # --> action

        			@now['_effects']['_parent'] = @now
        			@now = @now['_effects']
        		
        # <-- action
        char_literal147 = match( T__20, TOKENS_FOLLOWING_T__20_IN_effects_893 )

        tree_for_char_literal147 = @adaptor.create_with_payload( char_literal147 )
        @adaptor.add_child( root_0, tree_for_char_literal147 )

        # at line 278:7: ( NL )*
        while true # decision 62
          alt_62 = 2
          look_62_0 = @input.peek( 1 )

          if ( look_62_0 == NL )
            alt_62 = 1

          end
          case alt_62
          when 1
            # at line 278:7: NL
            __NL148__ = match( NL, TOKENS_FOLLOWING_NL_IN_effects_895 )

            tree_for_NL148 = @adaptor.create_with_payload( __NL148__ )
            @adaptor.add_child( root_0, tree_for_NL148 )


          else
            break # out of loop for decision 62
          end
        end # loop for decision 62
        @state.following.push( TOKENS_FOLLOWING_mutation_body_IN_effects_901 )
        mutation_body149 = mutation_body
        @state.following.pop
        @adaptor.add_child( root_0, mutation_body149.tree )
        char_literal150 = match( T__21, TOKENS_FOLLOWING_T__21_IN_effects_906 )

        tree_for_char_literal150 = @adaptor.create_with_payload( char_literal150 )
        @adaptor.add_child( root_0, tree_for_char_literal150 )

        # at file 280:7: ( NL )+
        match_count_63 = 0
        while true
          alt_63 = 2
          look_63_0 = @input.peek( 1 )

          if ( look_63_0 == NL )
            alt_63 = 1

          end
          case alt_63
          when 1
            # at line 280:7: NL
            __NL151__ = match( NL, TOKENS_FOLLOWING_NL_IN_effects_908 )

            tree_for_NL151 = @adaptor.create_with_payload( __NL151__ )
            @adaptor.add_child( root_0, tree_for_NL151 )


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
    # 284:1: constraint : ID 'constraint' '{' ( NL )* constraint_body '}' ( NL )+ ;
    # 
    def constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = ConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID152__ = nil
      string_literal153 = nil
      char_literal154 = nil
      __NL155__ = nil
      char_literal157 = nil
      __NL158__ = nil
      constraint_body156 = nil

      tree_for_ID152 = nil
      tree_for_string_literal153 = nil
      tree_for_char_literal154 = nil
      tree_for_NL155 = nil
      tree_for_char_literal157 = nil
      tree_for_NL158 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 285:4: ID 'constraint' '{' ( NL )* constraint_body '}' ( NL )+
        __ID152__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_924 )

        tree_for_ID152 = @adaptor.create_with_payload( __ID152__ )
        @adaptor.add_child( root_0, tree_for_ID152 )

        string_literal153 = match( T__38, TOKENS_FOLLOWING_T__38_IN_constraint_926 )

        tree_for_string_literal153 = @adaptor.create_with_payload( string_literal153 )
        @adaptor.add_child( root_0, tree_for_string_literal153 )

        # --> action

        			@now[__ID152__.text] = { '_self' => __ID152__.text,
        				'_context' => 'constraint',
        				'_type' => 'and',
        				'_parent' => @now
        			}
        			@now = @now[__ID152__.text]
        		
        # <-- action
        char_literal154 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_934 )

        tree_for_char_literal154 = @adaptor.create_with_payload( char_literal154 )
        @adaptor.add_child( root_0, tree_for_char_literal154 )

        # at line 294:7: ( NL )*
        while true # decision 64
          alt_64 = 2
          look_64_0 = @input.peek( 1 )

          if ( look_64_0 == NL )
            alt_64 = 1

          end
          case alt_64
          when 1
            # at line 294:7: NL
            __NL155__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_936 )

            tree_for_NL155 = @adaptor.create_with_payload( __NL155__ )
            @adaptor.add_child( root_0, tree_for_NL155 )


          else
            break # out of loop for decision 64
          end
        end # loop for decision 64
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_constraint_939 )
        constraint_body156 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body156.tree )
        char_literal157 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_941 )

        tree_for_char_literal157 = @adaptor.create_with_payload( char_literal157 )
        @adaptor.add_child( root_0, tree_for_char_literal157 )

        # at file 294:31: ( NL )+
        match_count_65 = 0
        while true
          alt_65 = 2
          look_65_0 = @input.peek( 1 )

          if ( look_65_0 == NL )
            alt_65 = 1

          end
          case alt_65
          when 1
            # at line 294:31: NL
            __NL158__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_943 )

            tree_for_NL158 = @adaptor.create_with_payload( __NL158__ )
            @adaptor.add_child( root_0, tree_for_NL158 )


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
    # 298:1: constraint_body : ( ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+ )* ;
    # 
    def constraint_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = ConstraintBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL162__ = nil
      constraint_statement159 = nil
      constraint_namespace160 = nil
      constraint_iterator161 = nil

      tree_for_NL162 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 299:4: ( ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+ )*
        # at line 299:4: ( ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+ )*
        while true # decision 68
          alt_68 = 2
          look_68_0 = @input.peek( 1 )

          if ( look_68_0 == ID || look_68_0 == T__26 || look_68_0 == T__39 )
            alt_68 = 1

          end
          case alt_68
          when 1
            # at line 300:4: ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+
            # at line 300:4: ( constraint_statement | constraint_namespace | constraint_iterator )
            alt_66 = 3
            alt_66 = @dfa66.predict( @input )
            case alt_66
            when 1
              # at line 300:6: constraint_statement
              @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_966 )
              constraint_statement159 = constraint_statement
              @state.following.pop
              @adaptor.add_child( root_0, constraint_statement159.tree )
              # --> action
              	@now[( constraint_statement159.nil? ? nil : constraint_statement159.key )] = ( constraint_statement159.nil? ? nil : constraint_statement159.val )	
              # <-- action

            when 2
              # at line 302:6: constraint_namespace
              @state.following.push( TOKENS_FOLLOWING_constraint_namespace_IN_constraint_body_979 )
              constraint_namespace160 = constraint_namespace
              @state.following.pop
              @adaptor.add_child( root_0, constraint_namespace160.tree )

            when 3
              # at line 303:6: constraint_iterator
              @state.following.push( TOKENS_FOLLOWING_constraint_iterator_IN_constraint_body_986 )
              constraint_iterator161 = constraint_iterator
              @state.following.pop
              @adaptor.add_child( root_0, constraint_iterator161.tree )

            end
            # at file 305:3: ( NL )+
            match_count_67 = 0
            while true
              alt_67 = 2
              look_67_0 = @input.peek( 1 )

              if ( look_67_0 == NL )
                alt_67 = 1

              end
              case alt_67
              when 1
                # at line 305:3: NL
                __NL162__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_body_995 )

                tree_for_NL162 = @adaptor.create_with_payload( __NL162__ )
                @adaptor.add_child( root_0, tree_for_NL162 )


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
    # 308:1: constraint_namespace : path ( NL )* '{' ( NL )* ( constraint_statement ( NL )+ )* '}' ;
    # 
    def constraint_namespace
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = ConstraintNamespaceReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL164__ = nil
      char_literal165 = nil
      __NL166__ = nil
      __NL168__ = nil
      char_literal169 = nil
      path163 = nil
      constraint_statement167 = nil

      tree_for_NL164 = nil
      tree_for_char_literal165 = nil
      tree_for_NL166 = nil
      tree_for_NL168 = nil
      tree_for_char_literal169 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 309:4: path ( NL )* '{' ( NL )* ( constraint_statement ( NL )+ )* '}'
        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_namespace_1009 )
        path163 = path
        @state.following.pop
        @adaptor.add_child( root_0, path163.tree )
        # at line 309:9: ( NL )*
        while true # decision 69
          alt_69 = 2
          look_69_0 = @input.peek( 1 )

          if ( look_69_0 == NL )
            alt_69 = 1

          end
          case alt_69
          when 1
            # at line 309:9: NL
            __NL164__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1011 )

            tree_for_NL164 = @adaptor.create_with_payload( __NL164__ )
            @adaptor.add_child( root_0, tree_for_NL164 )


          else
            break # out of loop for decision 69
          end
        end # loop for decision 69
        char_literal165 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_namespace_1014 )

        tree_for_char_literal165 = @adaptor.create_with_payload( char_literal165 )
        @adaptor.add_child( root_0, tree_for_char_literal165 )

        # at line 309:17: ( NL )*
        while true # decision 70
          alt_70 = 2
          look_70_0 = @input.peek( 1 )

          if ( look_70_0 == NL )
            alt_70 = 1

          end
          case alt_70
          when 1
            # at line 309:17: NL
            __NL166__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1016 )

            tree_for_NL166 = @adaptor.create_with_payload( __NL166__ )
            @adaptor.add_child( root_0, tree_for_NL166 )


          else
            break # out of loop for decision 70
          end
        end # loop for decision 70
        # at line 309:21: ( constraint_statement ( NL )+ )*
        while true # decision 72
          alt_72 = 2
          look_72_0 = @input.peek( 1 )

          if ( look_72_0 == ID || look_72_0 == T__26 )
            alt_72 = 1

          end
          case alt_72
          when 1
            # at line 309:22: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_namespace_1020 )
            constraint_statement167 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement167.tree )
            # --> action

            			key = self.to_ref(( path163 && @input.to_s( path163.start, path163.stop ) ) + '.' + ( constraint_statement167.nil? ? nil : constraint_statement167.key )[2,( constraint_statement167.nil? ? nil : constraint_statement167.key ).length])
            			@now[key] = ( constraint_statement167.nil? ? nil : constraint_statement167.val )
            		
            # <-- action
            # at file 314:3: ( NL )+
            match_count_71 = 0
            while true
              alt_71 = 2
              look_71_0 = @input.peek( 1 )

              if ( look_71_0 == NL )
                alt_71 = 1

              end
              case alt_71
              when 1
                # at line 314:3: NL
                __NL168__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_1028 )

                tree_for_NL168 = @adaptor.create_with_payload( __NL168__ )
                @adaptor.add_child( root_0, tree_for_NL168 )


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
        char_literal169 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_namespace_1033 )

        tree_for_char_literal169 = @adaptor.create_with_payload( char_literal169 )
        @adaptor.add_child( root_0, tree_for_char_literal169 )

        # - - - - - - - rule clean up - - - - - - - -
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
    # 317:1: constraint_iterator : 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ )* '}' ;
    # 
    def constraint_iterator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = ConstraintIteratorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal170 = nil
      string_literal172 = nil
      __ID173__ = nil
      __NL174__ = nil
      char_literal175 = nil
      __NL176__ = nil
      __NL178__ = nil
      char_literal179 = nil
      path171 = nil
      constraint_statement177 = nil

      tree_for_string_literal170 = nil
      tree_for_string_literal172 = nil
      tree_for_ID173 = nil
      tree_for_NL174 = nil
      tree_for_char_literal175 = nil
      tree_for_NL176 = nil
      tree_for_NL178 = nil
      tree_for_char_literal179 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 318:4: 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ )* '}'
        string_literal170 = match( T__39, TOKENS_FOLLOWING_T__39_IN_constraint_iterator_1044 )

        tree_for_string_literal170 = @adaptor.create_with_payload( string_literal170 )
        @adaptor.add_child( root_0, tree_for_string_literal170 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_iterator_1046 )
        path171 = path
        @state.following.pop
        @adaptor.add_child( root_0, path171.tree )
        string_literal172 = match( T__40, TOKENS_FOLLOWING_T__40_IN_constraint_iterator_1048 )

        tree_for_string_literal172 = @adaptor.create_with_payload( string_literal172 )
        @adaptor.add_child( root_0, tree_for_string_literal172 )

        __ID173__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_iterator_1050 )

        tree_for_ID173 = @adaptor.create_with_payload( __ID173__ )
        @adaptor.add_child( root_0, tree_for_ID173 )

        # at line 318:27: ( NL )*
        while true # decision 73
          alt_73 = 2
          look_73_0 = @input.peek( 1 )

          if ( look_73_0 == NL )
            alt_73 = 1

          end
          case alt_73
          when 1
            # at line 318:27: NL
            __NL174__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1052 )

            tree_for_NL174 = @adaptor.create_with_payload( __NL174__ )
            @adaptor.add_child( root_0, tree_for_NL174 )


          else
            break # out of loop for decision 73
          end
        end # loop for decision 73
        char_literal175 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_iterator_1055 )

        tree_for_char_literal175 = @adaptor.create_with_payload( char_literal175 )
        @adaptor.add_child( root_0, tree_for_char_literal175 )

        # at file 318:35: ( NL )+
        match_count_74 = 0
        while true
          alt_74 = 2
          look_74_0 = @input.peek( 1 )

          if ( look_74_0 == NL )
            alt_74 = 1

          end
          case alt_74
          when 1
            # at line 318:35: NL
            __NL176__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1057 )

            tree_for_NL176 = @adaptor.create_with_payload( __NL176__ )
            @adaptor.add_child( root_0, tree_for_NL176 )


          else
            match_count_74 > 0 and break
            eee = EarlyExit(74)


            raise eee
          end
          match_count_74 += 1
        end

        # --> action

        			id = self.to_ref(( path171 && @input.to_s( path171.start, path171.stop ) ))
        			@now[id] = { '_parent' => @now,
        				'_context' => 'iterator',
        				'_self' => id,
        				'_variable' => __ID173__.text
        			}
        			@now = @now[id]
        		
        # <-- action
        # at line 328:3: ( constraint_statement ( NL )+ )*
        while true # decision 76
          alt_76 = 2
          look_76_0 = @input.peek( 1 )

          if ( look_76_0 == ID || look_76_0 == T__26 )
            alt_76 = 1

          end
          case alt_76
          when 1
            # at line 328:4: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_iterator_1067 )
            constraint_statement177 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement177.tree )
            # --> action

            			@now[( constraint_statement177.nil? ? nil : constraint_statement177.key )] = ( constraint_statement177.nil? ? nil : constraint_statement177.val )
            		
            # <-- action
            # at file 332:3: ( NL )+
            match_count_75 = 0
            while true
              alt_75 = 2
              look_75_0 = @input.peek( 1 )

              if ( look_75_0 == NL )
                alt_75 = 1

              end
              case alt_75
              when 1
                # at line 332:3: NL
                __NL178__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1075 )

                tree_for_NL178 = @adaptor.create_with_payload( __NL178__ )
                @adaptor.add_child( root_0, tree_for_NL178 )


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
        char_literal179 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_iterator_1082 )

        tree_for_char_literal179 = @adaptor.create_with_payload( char_literal179 )
        @adaptor.add_child( root_0, tree_for_char_literal179 )

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
    # 337:1: constraint_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | conditional_constraint | reference binary_comp comp_value );
    # 
    def constraint_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = ConstraintStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL185__ = nil
      __NULL191__ = nil
      string_literal193 = nil
      string_literal194 = nil
      set197 = nil
      string_literal198 = nil
      reference180 = nil
      equals_op181 = nil
      value182 = nil
      reference183 = nil
      equals_op184 = nil
      reference186 = nil
      not_equals_op187 = nil
      value188 = nil
      reference189 = nil
      not_equals_op190 = nil
      reference192 = nil
      set_value195 = nil
      reference196 = nil
      set_value199 = nil
      conditional_constraint200 = nil
      reference201 = nil
      binary_comp202 = nil
      comp_value203 = nil

      tree_for_NULL185 = nil
      tree_for_NULL191 = nil
      tree_for_string_literal193 = nil
      tree_for_string_literal194 = nil
      tree_for_set197 = nil
      tree_for_string_literal198 = nil

      begin
        # at line 338:2: ( reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | conditional_constraint | reference binary_comp comp_value )
        alt_78 = 8
        alt_78 = @dfa78.predict( @input )
        case alt_78
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 338:4: reference equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1101 )
          reference180 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference180.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1103 )
          equals_op181 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op181.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_1105 )
          value182 = value
          @state.following.pop
          @adaptor.add_child( root_0, value182.tree )
          # --> action

          			return_value.key = ( reference180.nil? ? nil : reference180.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => ( value182.nil? ? nil : value182.val ) }
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 343:4: reference equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1114 )
          reference183 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference183.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1116 )
          equals_op184 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op184.tree )
          __NULL185__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_constraint_statement_1118 )

          tree_for_NULL185 = @adaptor.create_with_payload( __NULL185__ )
          @adaptor.add_child( root_0, tree_for_NULL185 )

          # --> action

          			return_value.key = ( reference183.nil? ? nil : reference183.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => self.null_value }
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 348:4: reference not_equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1127 )
          reference186 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference186.tree )
          @state.following.push( TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1129 )
          not_equals_op187 = not_equals_op
          @state.following.pop
          @adaptor.add_child( root_0, not_equals_op187.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_1131 )
          value188 = value
          @state.following.pop
          @adaptor.add_child( root_0, value188.tree )
          # --> action

          			return_value.key = ( reference186.nil? ? nil : reference186.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-equals', '_value' => ( value188.nil? ? nil : value188.val ) }
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 353:4: reference not_equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1140 )
          reference189 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference189.tree )
          @state.following.push( TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1142 )
          not_equals_op190 = not_equals_op
          @state.following.pop
          @adaptor.add_child( root_0, not_equals_op190.tree )
          __NULL191__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_constraint_statement_1144 )

          tree_for_NULL191 = @adaptor.create_with_payload( __NULL191__ )
          @adaptor.add_child( root_0, tree_for_NULL191 )

          # --> action

          			return_value.key = ( reference189.nil? ? nil : reference189.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-equals', '_value' => self.null_value }
          		
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 358:4: reference ( 'is' )? 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1153 )
          reference192 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference192.tree )
          # at line 358:14: ( 'is' )?
          alt_77 = 2
          look_77_0 = @input.peek( 1 )

          if ( look_77_0 == T__41 )
            alt_77 = 1
          end
          case alt_77
          when 1
            # at line 358:14: 'is'
            string_literal193 = match( T__41, TOKENS_FOLLOWING_T__41_IN_constraint_statement_1155 )

            tree_for_string_literal193 = @adaptor.create_with_payload( string_literal193 )
            @adaptor.add_child( root_0, tree_for_string_literal193 )


          end
          string_literal194 = match( T__42, TOKENS_FOLLOWING_T__42_IN_constraint_statement_1158 )

          tree_for_string_literal194 = @adaptor.create_with_payload( string_literal194 )
          @adaptor.add_child( root_0, tree_for_string_literal194 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_1160 )
          set_value195 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value195.tree )
          # --> action

          			return_value.key = ( reference192.nil? ? nil : reference192.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'in', '_value' => ( set_value195.nil? ? nil : set_value195.val ) }
          		
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 363:4: reference ( 'isnt' | 'not' ) 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1169 )
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


          string_literal198 = match( T__42, TOKENS_FOLLOWING_T__42_IN_constraint_statement_1177 )

          tree_for_string_literal198 = @adaptor.create_with_payload( string_literal198 )
          @adaptor.add_child( root_0, tree_for_string_literal198 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_1179 )
          set_value199 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value199.tree )
          # --> action

          			return_value.key = ( reference196.nil? ? nil : reference196.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-in', '_value' => ( set_value199.nil? ? nil : set_value199.val ) }
          		
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 368:4: conditional_constraint
          @state.following.push( TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_1188 )
          conditional_constraint200 = conditional_constraint
          @state.following.pop
          @adaptor.add_child( root_0, conditional_constraint200.tree )

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 369:4: reference binary_comp comp_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1193 )
          reference201 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference201.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_1195 )
          binary_comp202 = binary_comp
          @state.following.pop
          @adaptor.add_child( root_0, binary_comp202.tree )
          @state.following.push( TOKENS_FOLLOWING_comp_value_IN_constraint_statement_1197 )
          comp_value203 = comp_value
          @state.following.pop
          @adaptor.add_child( root_0, comp_value203.tree )
          # --> action

          			return_value.key = ( reference201.nil? ? nil : reference201.val )
          			return_value.val = { '_context' => 'constraint', '_type' => ( binary_comp202 && @input.to_s( binary_comp202.start, binary_comp202.stop ) ), '_value' => ( comp_value203.nil? ? nil : comp_value203.val ) }
          		
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
    # 376:1: comp_value returns [val] : ( NUMBER | reference );
    # 
    def comp_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = CompValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NUMBER204__ = nil
      reference205 = nil

      tree_for_NUMBER204 = nil

      begin
        # at line 377:2: ( NUMBER | reference )
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


          # at line 377:4: NUMBER
          __NUMBER204__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_comp_value_1216 )

          tree_for_NUMBER204 = @adaptor.create_with_payload( __NUMBER204__ )
          @adaptor.add_child( root_0, tree_for_NUMBER204 )

          # --> action
          	return_value.val = __NUMBER204__.text.to_f	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 379:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_comp_value_1225 )
          reference205 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference205.tree )
          # --> action
          	return_value.val = ( reference205.nil? ? nil : reference205.val )	
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
    # 383:1: conditional_constraint : 'if' constraint_statement ( NL )* conditional_constraint_then ;
    # 
    def conditional_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
      return_value = ConditionalConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal206 = nil
      __NL208__ = nil
      constraint_statement207 = nil
      conditional_constraint_then209 = nil

      tree_for_string_literal206 = nil
      tree_for_NL208 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 384:4: 'if' constraint_statement ( NL )* conditional_constraint_then
        string_literal206 = match( T__26, TOKENS_FOLLOWING_T__26_IN_conditional_constraint_1240 )

        tree_for_string_literal206 = @adaptor.create_with_payload( string_literal206 )
        @adaptor.add_child( root_0, tree_for_string_literal206 )

        # --> action

        			id = self.next_id
        			@now[id] = { '_parent' => @now,
        				'_context' => 'ifthen',
        				'_if' => nil,
        				'_then' => nil
        			}
        			@now = @now[id]
        		
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_1248 )
        constraint_statement207 = constraint_statement
        @state.following.pop
        @adaptor.add_child( root_0, constraint_statement207.tree )
        # at line 394:24: ( NL )*
        while true # decision 80
          alt_80 = 2
          look_80_0 = @input.peek( 1 )

          if ( look_80_0 == NL )
            alt_80 = 1

          end
          case alt_80
          when 1
            # at line 394:24: NL
            __NL208__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditional_constraint_1250 )

            tree_for_NL208 = @adaptor.create_with_payload( __NL208__ )
            @adaptor.add_child( root_0, tree_for_NL208 )


          else
            break # out of loop for decision 80
          end
        end # loop for decision 80
        # --> action

        			@now['_if'] = { '_left' => ( constraint_statement207.nil? ? nil : constraint_statement207.key ),
        				'_right' => ( constraint_statement207.nil? ? nil : constraint_statement207.val )
        			}
        		
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_conditional_constraint_then_IN_conditional_constraint_1259 )
        conditional_constraint_then209 = conditional_constraint_then
        @state.following.pop
        @adaptor.add_child( root_0, conditional_constraint_then209.tree )
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
    # 404:1: conditional_constraint_then : 'then' constraint_statement ;
    # 
    def conditional_constraint_then
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = ConditionalConstraintThenReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal210 = nil
      constraint_statement211 = nil

      tree_for_string_literal210 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 405:4: 'then' constraint_statement
        string_literal210 = match( T__27, TOKENS_FOLLOWING_T__27_IN_conditional_constraint_then_1274 )

        tree_for_string_literal210 = @adaptor.create_with_payload( string_literal210 )
        @adaptor.add_child( root_0, tree_for_string_literal210 )

        @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_1276 )
        constraint_statement211 = constraint_statement
        @state.following.pop
        @adaptor.add_child( root_0, constraint_statement211.tree )
        # --> action

        			@now['_then'] = { '_left' => ( constraint_statement211.nil? ? nil : constraint_statement211.key ),
        				'_right' => ( constraint_statement211.nil? ? nil : constraint_statement211.val )
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
    # 413:1: mutation_body : ( ( mutation_statement | mutation_iterator ) ( NL )+ )* ;
    # 
    def mutation_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
      return_value = MutationBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL214__ = nil
      mutation_statement212 = nil
      mutation_iterator213 = nil

      tree_for_NL214 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 414:4: ( ( mutation_statement | mutation_iterator ) ( NL )+ )*
        # at line 414:4: ( ( mutation_statement | mutation_iterator ) ( NL )+ )*
        while true # decision 83
          alt_83 = 2
          look_83_0 = @input.peek( 1 )

          if ( look_83_0 == ID || look_83_0 == T__39 || look_83_0 == T__46 )
            alt_83 = 1

          end
          case alt_83
          when 1
            # at line 415:4: ( mutation_statement | mutation_iterator ) ( NL )+
            # at line 415:4: ( mutation_statement | mutation_iterator )
            alt_81 = 2
            look_81_0 = @input.peek( 1 )

            if ( look_81_0 == ID || look_81_0 == T__46 )
              alt_81 = 1
            elsif ( look_81_0 == T__39 )
              alt_81 = 2
            else
              raise NoViableAlternative( "", 81, 0 )
            end
            case alt_81
            when 1
              # at line 415:6: mutation_statement
              @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_mutation_body_1298 )
              mutation_statement212 = mutation_statement
              @state.following.pop
              @adaptor.add_child( root_0, mutation_statement212.tree )
              # --> action
              	@now[( mutation_statement212.nil? ? nil : mutation_statement212.key )] = ( mutation_statement212.nil? ? nil : mutation_statement212.val )	
              # <-- action

            when 2
              # at line 417:6: mutation_iterator
              @state.following.push( TOKENS_FOLLOWING_mutation_iterator_IN_mutation_body_1311 )
              mutation_iterator213 = mutation_iterator
              @state.following.pop
              @adaptor.add_child( root_0, mutation_iterator213.tree )

            end
            # at file 419:3: ( NL )+
            match_count_82 = 0
            while true
              alt_82 = 2
              look_82_0 = @input.peek( 1 )

              if ( look_82_0 == NL )
                alt_82 = 1

              end
              case alt_82
              when 1
                # at line 419:3: NL
                __NL214__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_body_1320 )

                tree_for_NL214 = @adaptor.create_with_payload( __NL214__ )
                @adaptor.add_child( root_0, tree_for_NL214 )


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
        # trace_out( __method__, 33 )

      end
      
      return return_value
    end

    MutationIteratorReturnValue = define_return_scope 

    # 
    # parser rule mutation_iterator
    # 
    # (in SFP.g)
    # 422:1: mutation_iterator : 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( mutation_statement ( NL )+ )* '}' ;
    # 
    def mutation_iterator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )
      return_value = MutationIteratorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal215 = nil
      string_literal217 = nil
      __ID218__ = nil
      __NL219__ = nil
      char_literal220 = nil
      __NL221__ = nil
      __NL223__ = nil
      char_literal224 = nil
      path216 = nil
      mutation_statement222 = nil

      tree_for_string_literal215 = nil
      tree_for_string_literal217 = nil
      tree_for_ID218 = nil
      tree_for_NL219 = nil
      tree_for_char_literal220 = nil
      tree_for_NL221 = nil
      tree_for_NL223 = nil
      tree_for_char_literal224 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 423:4: 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( mutation_statement ( NL )+ )* '}'
        string_literal215 = match( T__39, TOKENS_FOLLOWING_T__39_IN_mutation_iterator_1335 )

        tree_for_string_literal215 = @adaptor.create_with_payload( string_literal215 )
        @adaptor.add_child( root_0, tree_for_string_literal215 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_iterator_1337 )
        path216 = path
        @state.following.pop
        @adaptor.add_child( root_0, path216.tree )
        string_literal217 = match( T__40, TOKENS_FOLLOWING_T__40_IN_mutation_iterator_1339 )

        tree_for_string_literal217 = @adaptor.create_with_payload( string_literal217 )
        @adaptor.add_child( root_0, tree_for_string_literal217 )

        __ID218__ = match( ID, TOKENS_FOLLOWING_ID_IN_mutation_iterator_1341 )

        tree_for_ID218 = @adaptor.create_with_payload( __ID218__ )
        @adaptor.add_child( root_0, tree_for_ID218 )

        # at line 423:27: ( NL )*
        while true # decision 84
          alt_84 = 2
          look_84_0 = @input.peek( 1 )

          if ( look_84_0 == NL )
            alt_84 = 1

          end
          case alt_84
          when 1
            # at line 423:27: NL
            __NL219__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_1343 )

            tree_for_NL219 = @adaptor.create_with_payload( __NL219__ )
            @adaptor.add_child( root_0, tree_for_NL219 )


          else
            break # out of loop for decision 84
          end
        end # loop for decision 84
        char_literal220 = match( T__20, TOKENS_FOLLOWING_T__20_IN_mutation_iterator_1346 )

        tree_for_char_literal220 = @adaptor.create_with_payload( char_literal220 )
        @adaptor.add_child( root_0, tree_for_char_literal220 )

        # at file 423:35: ( NL )+
        match_count_85 = 0
        while true
          alt_85 = 2
          look_85_0 = @input.peek( 1 )

          if ( look_85_0 == NL )
            alt_85 = 1

          end
          case alt_85
          when 1
            # at line 423:35: NL
            __NL221__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_1348 )

            tree_for_NL221 = @adaptor.create_with_payload( __NL221__ )
            @adaptor.add_child( root_0, tree_for_NL221 )


          else
            match_count_85 > 0 and break
            eee = EarlyExit(85)


            raise eee
          end
          match_count_85 += 1
        end

        # --> action

        			id = self.to_ref(( path216 && @input.to_s( path216.start, path216.stop ) ))
        			@now[id] = { '_parent' => @now,
        				'_context' => 'iterator',
        				'_self' => id,
        				'_variable' => __ID218__.text
        			}
        			@now = @now[id]
        		
        # <-- action
        # at line 433:3: ( mutation_statement ( NL )+ )*
        while true # decision 87
          alt_87 = 2
          look_87_0 = @input.peek( 1 )

          if ( look_87_0 == ID || look_87_0 == T__46 )
            alt_87 = 1

          end
          case alt_87
          when 1
            # at line 433:4: mutation_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_mutation_iterator_1358 )
            mutation_statement222 = mutation_statement
            @state.following.pop
            @adaptor.add_child( root_0, mutation_statement222.tree )
            # --> action
            	@now[( mutation_statement222.nil? ? nil : mutation_statement222.key )] = ( mutation_statement222.nil? ? nil : mutation_statement222.val )	
            # <-- action
            # at file 435:3: ( NL )+
            match_count_86 = 0
            while true
              alt_86 = 2
              look_86_0 = @input.peek( 1 )

              if ( look_86_0 == NL )
                alt_86 = 1

              end
              case alt_86
              when 1
                # at line 435:3: NL
                __NL223__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_1366 )

                tree_for_NL223 = @adaptor.create_with_payload( __NL223__ )
                @adaptor.add_child( root_0, tree_for_NL223 )


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
        char_literal224 = match( T__21, TOKENS_FOLLOWING_T__21_IN_mutation_iterator_1373 )

        tree_for_char_literal224 = @adaptor.create_with_payload( char_literal224 )
        @adaptor.add_child( root_0, tree_for_char_literal224 )

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
    # 440:1: mutation_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' );
    # 
    def mutation_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
      return_value = MutationStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL230__ = nil
      __NUMBER233__ = nil
      string_literal235 = nil
      string_literal236 = nil
      string_literal239 = nil
      string_literal242 = nil
      char_literal244 = nil
      string_literal246 = nil
      char_literal248 = nil
      reference225 = nil
      equals_op226 = nil
      value227 = nil
      reference228 = nil
      equals_op229 = nil
      reference231 = nil
      binary_op232 = nil
      reference234 = nil
      path237 = nil
      object_body238 = nil
      path240 = nil
      reference241 = nil
      value243 = nil
      reference245 = nil
      value247 = nil

      tree_for_NULL230 = nil
      tree_for_NUMBER233 = nil
      tree_for_string_literal235 = nil
      tree_for_string_literal236 = nil
      tree_for_string_literal239 = nil
      tree_for_string_literal242 = nil
      tree_for_char_literal244 = nil
      tree_for_string_literal246 = nil
      tree_for_char_literal248 = nil

      begin
        # at line 441:2: ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' )
        alt_89 = 7
        alt_89 = @dfa89.predict( @input )
        case alt_89
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 441:4: reference equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1392 )
          reference225 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference225.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_mutation_statement_1394 )
          equals_op226 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op226.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_1396 )
          value227 = value
          @state.following.pop
          @adaptor.add_child( root_0, value227.tree )
          # --> action

          			return_value.key = ( reference225.nil? ? nil : reference225.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'equals',
          				'_value' => ( value227.nil? ? nil : value227.val )
          			}
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 449:4: reference equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1405 )
          reference228 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference228.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_mutation_statement_1407 )
          equals_op229 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op229.tree )
          __NULL230__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_mutation_statement_1409 )

          tree_for_NULL230 = @adaptor.create_with_payload( __NULL230__ )
          @adaptor.add_child( root_0, tree_for_NULL230 )

          # --> action

          			return_value.key = ( reference228.nil? ? nil : reference228.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'equals',
          				'_value' => self.null_value
          			}
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 457:4: reference binary_op NUMBER
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1418 )
          reference231 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference231.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_op_IN_mutation_statement_1420 )
          binary_op232 = binary_op
          @state.following.pop
          @adaptor.add_child( root_0, binary_op232.tree )
          __NUMBER233__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_mutation_statement_1422 )

          tree_for_NUMBER233 = @adaptor.create_with_payload( __NUMBER233__ )
          @adaptor.add_child( root_0, tree_for_NUMBER233 )

          # --> action

          			return_value.key = ( reference231.nil? ? nil : reference231.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => ( binary_op232 && @input.to_s( binary_op232.start, binary_op232.stop ) ),
          				'_value' => __NUMBER233__.text.to_f
          			}
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 465:4: reference 'is' 'new' path ( object_body )?
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1431 )
          reference234 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference234.tree )
          string_literal235 = match( T__41, TOKENS_FOLLOWING_T__41_IN_mutation_statement_1433 )

          tree_for_string_literal235 = @adaptor.create_with_payload( string_literal235 )
          @adaptor.add_child( root_0, tree_for_string_literal235 )

          string_literal236 = match( T__45, TOKENS_FOLLOWING_T__45_IN_mutation_statement_1435 )

          tree_for_string_literal236 = @adaptor.create_with_payload( string_literal236 )
          @adaptor.add_child( root_0, tree_for_string_literal236 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_statement_1437 )
          path237 = path
          @state.following.pop
          @adaptor.add_child( root_0, path237.tree )
          # --> action

          			id = '_' + self.next_id
          			@now[id] = { '_self' => id,
          				'_context' => 'object',
          				'_isa' => self.to_ref(( path237 && @input.to_s( path237.start, path237.stop ) )),
          				'_parent' => @now
          			}
          			@now = @now[id]
          		
          # <-- action
          # at line 475:3: ( object_body )?
          alt_88 = 2
          look_88_0 = @input.peek( 1 )

          if ( look_88_0 == T__20 )
            alt_88 = 1
          end
          case alt_88
          when 1
            # at line 475:3: object_body
            @state.following.push( TOKENS_FOLLOWING_object_body_IN_mutation_statement_1445 )
            object_body238 = object_body
            @state.following.pop
            @adaptor.add_child( root_0, object_body238.tree )

          end
          # --> action

          			n = self.goto_parent()
          			@now.delete(n['_self'])
          			return_value.key = ( reference234.nil? ? nil : reference234.val )
          			return_value.val = n
          		
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 482:4: 'delete' path
          string_literal239 = match( T__46, TOKENS_FOLLOWING_T__46_IN_mutation_statement_1455 )

          tree_for_string_literal239 = @adaptor.create_with_payload( string_literal239 )
          @adaptor.add_child( root_0, tree_for_string_literal239 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_statement_1457 )
          path240 = path
          @state.following.pop
          @adaptor.add_child( root_0, path240.tree )
          # --> action

          			id = '_' + self.next_id
          			@now[id] = { '_self' => id,
          				'_context' => 'mutation',
          				'_type' => 'delete',
          				'_value' => self.to_ref(( path240 && @input.to_s( path240.start, path240.stop ) ))
          			}
          		
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 491:4: reference 'add(' value ')'
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1466 )
          reference241 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference241.tree )
          string_literal242 = match( T__47, TOKENS_FOLLOWING_T__47_IN_mutation_statement_1468 )

          tree_for_string_literal242 = @adaptor.create_with_payload( string_literal242 )
          @adaptor.add_child( root_0, tree_for_string_literal242 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_1470 )
          value243 = value
          @state.following.pop
          @adaptor.add_child( root_0, value243.tree )
          char_literal244 = match( T__36, TOKENS_FOLLOWING_T__36_IN_mutation_statement_1472 )

          tree_for_char_literal244 = @adaptor.create_with_payload( char_literal244 )
          @adaptor.add_child( root_0, tree_for_char_literal244 )

          # --> action

          			return_value.key = ( reference241.nil? ? nil : reference241.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'add',
          				'_value' => ( value243.nil? ? nil : value243.val )
          			}
          		
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 499:4: reference 'remove(' value ')'
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1481 )
          reference245 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference245.tree )
          string_literal246 = match( T__48, TOKENS_FOLLOWING_T__48_IN_mutation_statement_1483 )

          tree_for_string_literal246 = @adaptor.create_with_payload( string_literal246 )
          @adaptor.add_child( root_0, tree_for_string_literal246 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_1485 )
          value247 = value
          @state.following.pop
          @adaptor.add_child( root_0, value247.tree )
          char_literal248 = match( T__36, TOKENS_FOLLOWING_T__36_IN_mutation_statement_1487 )

          tree_for_char_literal248 = @adaptor.create_with_payload( char_literal248 )
          @adaptor.add_child( root_0, tree_for_char_literal248 )

          # --> action

          			return_value.key = ( reference245.nil? ? nil : reference245.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'remove',
          				'_value' => ( value247.nil? ? nil : value247.val )
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
    # 509:1: set_value returns [val] : '(' set_item ( ',' set_item )* ')' ;
    # 
    def set_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
      return_value = SetValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal249 = nil
      char_literal251 = nil
      char_literal253 = nil
      set_item250 = nil
      set_item252 = nil

      tree_for_char_literal249 = nil
      tree_for_char_literal251 = nil
      tree_for_char_literal253 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 510:4: '(' set_item ( ',' set_item )* ')'
        char_literal249 = match( T__34, TOKENS_FOLLOWING_T__34_IN_set_value_1506 )

        tree_for_char_literal249 = @adaptor.create_with_payload( char_literal249 )
        @adaptor.add_child( root_0, tree_for_char_literal249 )

        # --> action
        	@set = Array.new	
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_1514 )
        set_item250 = set_item
        @state.following.pop
        @adaptor.add_child( root_0, set_item250.tree )
        # at line 512:12: ( ',' set_item )*
        while true # decision 90
          alt_90 = 2
          look_90_0 = @input.peek( 1 )

          if ( look_90_0 == T__35 )
            alt_90 = 1

          end
          case alt_90
          when 1
            # at line 512:13: ',' set_item
            char_literal251 = match( T__35, TOKENS_FOLLOWING_T__35_IN_set_value_1517 )

            tree_for_char_literal251 = @adaptor.create_with_payload( char_literal251 )
            @adaptor.add_child( root_0, tree_for_char_literal251 )

            @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_1519 )
            set_item252 = set_item
            @state.following.pop
            @adaptor.add_child( root_0, set_item252.tree )

          else
            break # out of loop for decision 90
          end
        end # loop for decision 90
        # --> action
        	return_value.val = @set	
        # <-- action
        char_literal253 = match( T__36, TOKENS_FOLLOWING_T__36_IN_set_value_1529 )

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
        # trace_out( __method__, 36 )

      end
      
      return return_value
    end

    SetItemReturnValue = define_return_scope 

    # 
    # parser rule set_item
    # 
    # (in SFP.g)
    # 517:1: set_item : value ;
    # 
    def set_item
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )
      return_value = SetItemReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      value254 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 518:4: value
        @state.following.push( TOKENS_FOLLOWING_value_IN_set_item_1540 )
        value254 = value
        @state.following.pop
        @adaptor.add_child( root_0, value254.tree )
        # --> action
        	@set.push(( value254.nil? ? nil : value254.val ))	
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
    # 522:1: value returns [val] : ( primitive_value | reference | set_value );
    # 
    def value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )
      return_value = ValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      primitive_value255 = nil
      reference256 = nil
      set_value257 = nil


      begin
        # at line 523:2: ( primitive_value | reference | set_value )
        alt_91 = 3
        case look_91 = @input.peek( 1 )
        when STRING, NUMBER, BOOLEAN, MULTILINE_STRING then alt_91 = 1
        when ID then alt_91 = 2
        when T__34 then alt_91 = 3
        else
          raise NoViableAlternative( "", 91, 0 )
        end
        case alt_91
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 523:4: primitive_value
          @state.following.push( TOKENS_FOLLOWING_primitive_value_IN_value_1559 )
          primitive_value255 = primitive_value
          @state.following.pop
          @adaptor.add_child( root_0, primitive_value255.tree )
          # --> action
          	return_value.val = ( primitive_value255.nil? ? nil : primitive_value255.val )	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 525:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_value_1568 )
          reference256 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference256.tree )
          # --> action
          	return_value.val = ( reference256.nil? ? nil : reference256.val )	
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 527:4: set_value
          @state.following.push( TOKENS_FOLLOWING_set_value_IN_value_1577 )
          set_value257 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value257.tree )
          # --> action
          	return_value.val = ( set_value257.nil? ? nil : set_value257.val )	
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
    # 531:1: primitive_value returns [val] : ( BOOLEAN | NUMBER | STRING | MULTILINE_STRING );
    # 
    def primitive_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )
      return_value = PrimitiveValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __BOOLEAN258__ = nil
      __NUMBER259__ = nil
      __STRING260__ = nil
      __MULTILINE_STRING261__ = nil

      tree_for_BOOLEAN258 = nil
      tree_for_NUMBER259 = nil
      tree_for_STRING260 = nil
      tree_for_MULTILINE_STRING261 = nil

      begin
        # at line 532:2: ( BOOLEAN | NUMBER | STRING | MULTILINE_STRING )
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


          # at line 532:4: BOOLEAN
          __BOOLEAN258__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_1596 )

          tree_for_BOOLEAN258 = @adaptor.create_with_payload( __BOOLEAN258__ )
          @adaptor.add_child( root_0, tree_for_BOOLEAN258 )

          # --> action

          			if __BOOLEAN258__.text == 'true' or __BOOLEAN258__.text == 'on' or __BOOLEAN258__.text == 'yes'
          				return_value.val = true
          			else  # 'false', 'no', 'off'
          				return_value.val = false
          			end
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 540:4: NUMBER
          __NUMBER259__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_primitive_value_1605 )

          tree_for_NUMBER259 = @adaptor.create_with_payload( __NUMBER259__ )
          @adaptor.add_child( root_0, tree_for_NUMBER259 )

          # --> action
          	return_value.val = __NUMBER259__.text.to_f	
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 542:4: STRING
          __STRING260__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_primitive_value_1614 )

          tree_for_STRING260 = @adaptor.create_with_payload( __STRING260__ )
          @adaptor.add_child( root_0, tree_for_STRING260 )

          # --> action
          	return_value.val = __STRING260__.text[1,__STRING260__.text.length-2]	
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 544:4: MULTILINE_STRING
          __MULTILINE_STRING261__ = match( MULTILINE_STRING, TOKENS_FOLLOWING_MULTILINE_STRING_IN_primitive_value_1623 )

          tree_for_MULTILINE_STRING261 = @adaptor.create_with_payload( __MULTILINE_STRING261__ )
          @adaptor.add_child( root_0, tree_for_MULTILINE_STRING261 )

          # --> action
          	return_value.val = __MULTILINE_STRING261__.text[2, __MULTILINE_STRING261__.text.length-2]	
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
    # 548:1: path : ID ( '.' ID )* ;
    # 
    def path
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )
      return_value = PathReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID262__ = nil
      char_literal263 = nil
      __ID264__ = nil

      tree_for_ID262 = nil
      tree_for_char_literal263 = nil
      tree_for_ID264 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 549:4: ID ( '.' ID )*
        __ID262__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_1638 )

        tree_for_ID262 = @adaptor.create_with_payload( __ID262__ )
        @adaptor.add_child( root_0, tree_for_ID262 )

        # at line 549:6: ( '.' ID )*
        while true # decision 93
          alt_93 = 2
          look_93_0 = @input.peek( 1 )

          if ( look_93_0 == T__49 )
            alt_93 = 1

          end
          case alt_93
          when 1
            # at line 549:7: '.' ID
            char_literal263 = match( T__49, TOKENS_FOLLOWING_T__49_IN_path_1640 )

            tree_for_char_literal263 = @adaptor.create_with_payload( char_literal263 )
            @adaptor.add_child( root_0, tree_for_char_literal263 )

            __ID264__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_1641 )

            tree_for_ID264 = @adaptor.create_with_payload( __ID264__ )
            @adaptor.add_child( root_0, tree_for_ID264 )


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
        # trace_out( __method__, 40 )

      end
      
      return return_value
    end

    ReferenceReturnValue = define_return_scope :val

    # 
    # parser rule reference
    # 
    # (in SFP.g)
    # 552:1: reference returns [val] : path ;
    # 
    def reference
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )
      return_value = ReferenceReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      path265 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 553:4: path
        @state.following.push( TOKENS_FOLLOWING_path_IN_reference_1658 )
        path265 = path
        @state.following.pop
        @adaptor.add_child( root_0, path265.tree )
        # --> action
        	return_value.val = self.to_ref(( path265 && @input.to_s( path265.start, path265.stop ) ))	
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
    # 557:1: reference_type returns [val] : 'isref' path ;
    # 
    def reference_type
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )
      return_value = ReferenceTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal266 = nil
      path267 = nil

      tree_for_string_literal266 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 558:4: 'isref' path
        string_literal266 = match( T__50, TOKENS_FOLLOWING_T__50_IN_reference_type_1677 )

        tree_for_string_literal266 = @adaptor.create_with_payload( string_literal266 )
        @adaptor.add_child( root_0, tree_for_string_literal266 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_reference_type_1679 )
        path267 = path
        @state.following.pop
        @adaptor.add_child( root_0, path267.tree )
        # --> action

        			return_value.val = { '_context' => 'null',
        				'_isa' => self.to_ref(( path267 && @input.to_s( path267.start, path267.stop ) ))
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
    # 566:1: equals_op : ( '=' | 'is' );
    # 
    def equals_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )
      return_value = EqualsOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set268 = nil

      tree_for_set268 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set268 = @input.look
        if @input.peek(1) == T__41 || @input.peek(1) == T__51
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
        # trace_out( __method__, 43 )

      end
      
      return return_value
    end

    NotEqualsOpReturnValue = define_return_scope 

    # 
    # parser rule not_equals_op
    # 
    # (in SFP.g)
    # 571:1: not_equals_op : ( '!=' | 'isnt' );
    # 
    def not_equals_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )
      return_value = NotEqualsOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set269 = nil

      tree_for_set269 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set269 = @input.look
        if @input.peek(1) == T__43 || @input.peek(1) == T__52
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
        # trace_out( __method__, 44 )

      end
      
      return return_value
    end

    BinaryOpReturnValue = define_return_scope 

    # 
    # parser rule binary_op
    # 
    # (in SFP.g)
    # 576:1: binary_op : ( '+=' | '-=' | '*=' | '/=' );
    # 
    def binary_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )
      return_value = BinaryOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set270 = nil

      tree_for_set270 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set270 = @input.look
        if @input.peek( 1 ).between?( T__53, T__56 )
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
        # trace_out( __method__, 45 )

      end
      
      return return_value
    end

    BinaryCompReturnValue = define_return_scope 

    # 
    # parser rule binary_comp
    # 
    # (in SFP.g)
    # 583:1: binary_comp : ( '>' | '>=' | '<' | '<=' );
    # 
    def binary_comp
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )
      return_value = BinaryCompReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set271 = nil

      tree_for_set271 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set271 = @input.look
        if @input.peek( 1 ).between?( T__57, T__60 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set271 ) )
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
          ()* loopback of 160:3: ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )*
        __dfa_description__
      end
    end
    class DFA66 < ANTLR3::DFA
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
      
      @decision = 66
      

      def description
        <<-'__dfa_description__'.strip!
          300:4: ( constraint_statement | constraint_namespace | constraint_iterator )
        __dfa_description__
      end
    end
    class DFA78 < ANTLR3::DFA
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
      
      @decision = 78
      

      def description
        <<-'__dfa_description__'.strip!
          337:1: constraint_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | conditional_constraint | reference binary_comp comp_value );
        __dfa_description__
      end
    end
    class DFA89 < ANTLR3::DFA
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
      
      @decision = 89
      

      def description
        <<-'__dfa_description__'.strip!
          440:1: mutation_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' );
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa35 = DFA35.new( self, 35 )
      @dfa66 = DFA66.new( self, 66 )
      @dfa78 = DFA78.new( self, 78 )
      @dfa89 = DFA89.new( self, 89 )

    end
    TOKENS_FOLLOWING_NL_IN_sfp_49 = Set[ 1, 4, 6, 18, 22, 23, 33 ]
    TOKENS_FOLLOWING_include_IN_sfp_52 = Set[ 1, 6, 18, 22, 23, 33 ]
    TOKENS_FOLLOWING_header_IN_sfp_55 = Set[ 1, 6, 22, 23, 33 ]
    TOKENS_FOLLOWING_state_IN_sfp_59 = Set[ 1, 6, 22 ]
    TOKENS_FOLLOWING_composite_IN_sfp_63 = Set[ 1, 6, 22 ]
    TOKENS_FOLLOWING_constraint_IN_sfp_67 = Set[ 1, 6, 22 ]
    TOKENS_FOLLOWING_T__18_IN_include_80 = Set[ 5 ]
    TOKENS_FOLLOWING_include_file_IN_include_82 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_include_84 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_STRING_IN_include_file_96 = Set[ 1 ]
    TOKENS_FOLLOWING_class_definition_IN_header_112 = Set[ 1 ]
    TOKENS_FOLLOWING_procedure_IN_header_117 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_state_132 = Set[ 19, 20 ]
    TOKENS_FOLLOWING_T__19_IN_state_135 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_145 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_NL_IN_state_147 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_attribute_IN_state_152 = Set[ 6, 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_157 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_state_159 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__22_IN_composite_175 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_composite_177 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_composite_185 = Set[ 4, 6, 21, 22 ]
    TOKENS_FOLLOWING_NL_IN_composite_187 = Set[ 4, 6, 21, 22 ]
    TOKENS_FOLLOWING_attribute_IN_composite_192 = Set[ 6, 21, 22 ]
    TOKENS_FOLLOWING_constraint_IN_composite_196 = Set[ 6, 21, 22 ]
    TOKENS_FOLLOWING_T__21_IN_composite_201 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_composite_203 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__23_IN_class_definition_219 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_class_definition_221 = Set[ 1, 4, 20, 24 ]
    TOKENS_FOLLOWING_extends_class_IN_class_definition_230 = Set[ 1, 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_class_definition_244 = Set[ 4, 6, 21, 23, 33 ]
    TOKENS_FOLLOWING_NL_IN_class_definition_246 = Set[ 4, 6, 21, 23, 33 ]
    TOKENS_FOLLOWING_attribute_IN_class_definition_251 = Set[ 6, 21, 23, 33 ]
    TOKENS_FOLLOWING_procedure_IN_class_definition_255 = Set[ 6, 21, 23, 33 ]
    TOKENS_FOLLOWING_T__21_IN_class_definition_260 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_class_definition_264 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__24_IN_extends_class_285 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_extends_class_287 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_attribute_302 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_attribute_304 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_attribute_306 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_308 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_attribute_318 = Set[ 50 ]
    TOKENS_FOLLOWING_reference_type_IN_attribute_320 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_322 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_object_def_IN_attribute_332 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_334 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_object_def_346 = Set[ 1, 20, 25 ]
    TOKENS_FOLLOWING_T__25_IN_object_def_355 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_object_def_357 = Set[ 1, 20 ]
    TOKENS_FOLLOWING_object_body_IN_object_def_370 = Set[ 1 ]
    TOKENS_FOLLOWING_T__20_IN_object_body_386 = Set[ 4, 6, 21, 26, 29 ]
    TOKENS_FOLLOWING_NL_IN_object_body_388 = Set[ 4, 6, 21, 26, 29 ]
    TOKENS_FOLLOWING_object_attribute_IN_object_body_393 = Set[ 6, 21, 26, 29 ]
    TOKENS_FOLLOWING_state_dependency_IN_object_body_397 = Set[ 6, 21, 26, 29 ]
    TOKENS_FOLLOWING_operator_IN_object_body_401 = Set[ 6, 21, 26, 29 ]
    TOKENS_FOLLOWING_T__21_IN_object_body_406 = Set[ 1 ]
    TOKENS_FOLLOWING_attribute_IN_object_attribute_417 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_object_attribute_422 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_object_attribute_424 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_object_attribute_426 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_object_attribute_428 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__26_IN_state_dependency_444 = Set[ 6 ]
    TOKENS_FOLLOWING_dep_effect_IN_state_dependency_448 = Set[ 4, 27 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_450 = Set[ 4, 27 ]
    TOKENS_FOLLOWING_T__27_IN_state_dependency_453 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_455 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_dependency_458 = Set[ 4, 6, 21, 26, 39 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_462 = Set[ 4, 6, 21, 26, 39 ]
    TOKENS_FOLLOWING_constraint_body_IN_state_dependency_465 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_dependency_470 = Set[ 4, 28 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_476 = Set[ 4, 28 ]
    TOKENS_FOLLOWING_T__28_IN_state_dependency_479 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_481 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_dependency_484 = Set[ 4, 6, 21, 26, 39 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_488 = Set[ 4, 6, 21, 26, 39 ]
    TOKENS_FOLLOWING_constraint_body_IN_state_dependency_491 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_dependency_495 = Set[ 4, 28 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_501 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_reference_IN_dep_effect_513 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_dep_effect_515 = Set[ 5, 6, 7, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_dep_effect_522 = Set[ 1 ]
    TOKENS_FOLLOWING_NULL_IN_dep_effect_528 = Set[ 1 ]
    TOKENS_FOLLOWING_T__29_IN_operator_544 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_operator_546 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_operator_548 = Set[ 4, 6, 30, 31, 32 ]
    TOKENS_FOLLOWING_NL_IN_operator_550 = Set[ 4, 6, 30, 31, 32 ]
    TOKENS_FOLLOWING_T__30_IN_operator_561 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_operator_563 = Set[ 8 ]
    TOKENS_FOLLOWING_NUMBER_IN_operator_565 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_operator_567 = Set[ 4, 6, 30, 31, 32 ]
    TOKENS_FOLLOWING_op_param_IN_operator_582 = Set[ 4, 6, 30, 31, 32 ]
    TOKENS_FOLLOWING_op_conditions_IN_operator_587 = Set[ 4, 6, 30, 31, 32 ]
    TOKENS_FOLLOWING_op_effects_IN_operator_590 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_operator_594 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_operator_596 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_op_param_612 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_op_param_614 = Set[ 6 ]
    TOKENS_FOLLOWING_reference_IN_op_param_616 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_param_618 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__31_IN_op_conditions_634 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_op_conditions_636 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_NL_IN_op_conditions_638 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_op_statement_IN_op_conditions_647 = Set[ 6, 21 ]
    TOKENS_FOLLOWING_T__21_IN_op_conditions_652 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_conditions_654 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__32_IN_op_effects_670 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_op_effects_672 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_NL_IN_op_effects_674 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_op_statement_IN_op_effects_683 = Set[ 6, 21 ]
    TOKENS_FOLLOWING_T__21_IN_op_effects_688 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_effects_690 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_reference_IN_op_statement_706 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_op_statement_708 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_op_statement_710 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_statement_712 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__33_IN_procedure_728 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_procedure_730 = Set[ 20, 34 ]
    TOKENS_FOLLOWING_parameters_IN_procedure_738 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_procedure_741 = Set[ 4, 30, 31, 32 ]
    TOKENS_FOLLOWING_NL_IN_procedure_743 = Set[ 4, 30, 31, 32 ]
    TOKENS_FOLLOWING_T__30_IN_procedure_751 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_procedure_753 = Set[ 8 ]
    TOKENS_FOLLOWING_NUMBER_IN_procedure_755 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_procedure_765 = Set[ 4, 30, 31, 32 ]
    TOKENS_FOLLOWING_conditions_IN_procedure_775 = Set[ 4, 30, 31, 32 ]
    TOKENS_FOLLOWING_effects_IN_procedure_778 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_procedure_780 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_procedure_782 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__34_IN_parameters_798 = Set[ 6 ]
    TOKENS_FOLLOWING_parameter_IN_parameters_800 = Set[ 35, 36 ]
    TOKENS_FOLLOWING_T__35_IN_parameters_803 = Set[ 6 ]
    TOKENS_FOLLOWING_parameter_IN_parameters_805 = Set[ 35, 36 ]
    TOKENS_FOLLOWING_T__36_IN_parameters_809 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_821 = Set[ 50 ]
    TOKENS_FOLLOWING_reference_type_IN_parameter_823 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_832 = Set[ 37 ]
    TOKENS_FOLLOWING_T__37_IN_parameter_834 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_parameter_836 = Set[ 1 ]
    TOKENS_FOLLOWING_T__31_IN_conditions_851 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_conditions_859 = Set[ 4, 6, 21, 26, 39 ]
    TOKENS_FOLLOWING_NL_IN_conditions_861 = Set[ 4, 6, 21, 26, 39 ]
    TOKENS_FOLLOWING_constraint_body_IN_conditions_864 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_conditions_866 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_conditions_868 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__32_IN_effects_885 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_effects_893 = Set[ 4, 6, 21, 39, 46 ]
    TOKENS_FOLLOWING_NL_IN_effects_895 = Set[ 4, 6, 21, 39, 46 ]
    TOKENS_FOLLOWING_mutation_body_IN_effects_901 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_effects_906 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_effects_908 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_constraint_924 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_constraint_926 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_934 = Set[ 4, 6, 21, 26, 39 ]
    TOKENS_FOLLOWING_NL_IN_constraint_936 = Set[ 4, 6, 21, 26, 39 ]
    TOKENS_FOLLOWING_constraint_body_IN_constraint_939 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_941 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_943 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_966 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_namespace_IN_constraint_body_979 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_iterator_IN_constraint_body_986 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_body_995 = Set[ 1, 4, 6, 26, 39 ]
    TOKENS_FOLLOWING_path_IN_constraint_namespace_1009 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1011 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_namespace_1014 = Set[ 4, 6, 21, 26 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1016 = Set[ 4, 6, 21, 26 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_namespace_1020 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_1028 = Set[ 4, 6, 21, 26 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_namespace_1033 = Set[ 1 ]
    TOKENS_FOLLOWING_T__39_IN_constraint_iterator_1044 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_constraint_iterator_1046 = Set[ 40 ]
    TOKENS_FOLLOWING_T__40_IN_constraint_iterator_1048 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_constraint_iterator_1050 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1052 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_iterator_1055 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1057 = Set[ 4, 6, 21, 26 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_iterator_1067 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1075 = Set[ 4, 6, 21, 26 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_iterator_1082 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1101 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1103 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_1105 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1114 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1116 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_1118 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1127 = Set[ 43, 52 ]
    TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1129 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_1131 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1140 = Set[ 43, 52 ]
    TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1142 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_1144 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1153 = Set[ 41, 42 ]
    TOKENS_FOLLOWING_T__41_IN_constraint_statement_1155 = Set[ 42 ]
    TOKENS_FOLLOWING_T__42_IN_constraint_statement_1158 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_1160 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1169 = Set[ 43, 44 ]
    TOKENS_FOLLOWING_set_IN_constraint_statement_1171 = Set[ 42 ]
    TOKENS_FOLLOWING_T__42_IN_constraint_statement_1177 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_1179 = Set[ 1 ]
    TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_1188 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1193 = Set[ 57, 58, 59, 60 ]
    TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_1195 = Set[ 6, 8 ]
    TOKENS_FOLLOWING_comp_value_IN_constraint_statement_1197 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_comp_value_1216 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_comp_value_1225 = Set[ 1 ]
    TOKENS_FOLLOWING_T__26_IN_conditional_constraint_1240 = Set[ 6, 26 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_1248 = Set[ 4, 27 ]
    TOKENS_FOLLOWING_NL_IN_conditional_constraint_1250 = Set[ 4, 27 ]
    TOKENS_FOLLOWING_conditional_constraint_then_IN_conditional_constraint_1259 = Set[ 1 ]
    TOKENS_FOLLOWING_T__27_IN_conditional_constraint_then_1274 = Set[ 6, 26 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_1276 = Set[ 1 ]
    TOKENS_FOLLOWING_mutation_statement_IN_mutation_body_1298 = Set[ 4 ]
    TOKENS_FOLLOWING_mutation_iterator_IN_mutation_body_1311 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_body_1320 = Set[ 1, 4, 6, 39, 46 ]
    TOKENS_FOLLOWING_T__39_IN_mutation_iterator_1335 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_iterator_1337 = Set[ 40 ]
    TOKENS_FOLLOWING_T__40_IN_mutation_iterator_1339 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_mutation_iterator_1341 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_1343 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_mutation_iterator_1346 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_1348 = Set[ 4, 6, 21, 46 ]
    TOKENS_FOLLOWING_mutation_statement_IN_mutation_iterator_1358 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_1366 = Set[ 4, 6, 21, 46 ]
    TOKENS_FOLLOWING_T__21_IN_mutation_iterator_1373 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1392 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_mutation_statement_1394 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_1396 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1405 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_mutation_statement_1407 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_mutation_statement_1409 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1418 = Set[ 53, 54, 55, 56 ]
    TOKENS_FOLLOWING_binary_op_IN_mutation_statement_1420 = Set[ 8 ]
    TOKENS_FOLLOWING_NUMBER_IN_mutation_statement_1422 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1431 = Set[ 41 ]
    TOKENS_FOLLOWING_T__41_IN_mutation_statement_1433 = Set[ 45 ]
    TOKENS_FOLLOWING_T__45_IN_mutation_statement_1435 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_statement_1437 = Set[ 1, 20 ]
    TOKENS_FOLLOWING_object_body_IN_mutation_statement_1445 = Set[ 1 ]
    TOKENS_FOLLOWING_T__46_IN_mutation_statement_1455 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_statement_1457 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1466 = Set[ 47 ]
    TOKENS_FOLLOWING_T__47_IN_mutation_statement_1468 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_1470 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_mutation_statement_1472 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1481 = Set[ 48 ]
    TOKENS_FOLLOWING_T__48_IN_mutation_statement_1483 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_1485 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_mutation_statement_1487 = Set[ 1 ]
    TOKENS_FOLLOWING_T__34_IN_set_value_1506 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_1514 = Set[ 35, 36 ]
    TOKENS_FOLLOWING_T__35_IN_set_value_1517 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_1519 = Set[ 35, 36 ]
    TOKENS_FOLLOWING_T__36_IN_set_value_1529 = Set[ 1 ]
    TOKENS_FOLLOWING_value_IN_set_item_1540 = Set[ 1 ]
    TOKENS_FOLLOWING_primitive_value_IN_value_1559 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_value_1568 = Set[ 1 ]
    TOKENS_FOLLOWING_set_value_IN_value_1577 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_1596 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_primitive_value_1605 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_primitive_value_1614 = Set[ 1 ]
    TOKENS_FOLLOWING_MULTILINE_STRING_IN_primitive_value_1623 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_path_1638 = Set[ 1, 49 ]
    TOKENS_FOLLOWING_T__49_IN_path_1640 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_path_1641 = Set[ 1, 49 ]
    TOKENS_FOLLOWING_path_IN_reference_1658 = Set[ 1 ]
    TOKENS_FOLLOWING_T__50_IN_reference_type_1677 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_reference_type_1679 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_not_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_comp_0 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end

