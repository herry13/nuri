#!/usr/bin/env ruby
#
# SFP.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: SFP.g
# Generated at: 2012-06-30 13:16:27
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
                    "UNICODE_ESC", "OCTAL_ESC", "'include'", "'file'", "'state'", 
                    "'{'", "'}'", "'composite'", "'class'", "'extends'", 
                    "'isa'", "'if'", "'then'", "'or'", "'procedure'", "'cost'", 
                    "'('", "','", "')'", "'areall'", "'conditions'", "'effects'", 
                    "'constraint'", "'foreach'", "'as'", "'is'", "'in'", 
                    "'isnt'", "'not'", "'new'", "'delete'", "'add('", "'remove('", 
                    "'.'", "'isref'", "'='", "'!='", "'+='", "'-='", "'*='", 
                    "'/='", "'>'", "'>='", "'<'", "'<='" )
    
  end


  class Parser < ANTLR3::Parser
    @grammar_home = SFP
    include ANTLR3::ASTBuilder

    RULE_METHODS = [ :sfp, :include, :include_file, :header, :state_section, 
                     :composite, :class_definition, :extends_class, :attribute, 
                     :object_def, :object_body, :object_attribute, :state_dependency, 
                     :dep_effect, :procedure, :parameters, :parameter, :conditions, 
                     :effects, :constraint, :constraint_body, :constraint_namespace, 
                     :constraint_iterator, :constraint_statement, :comp_value, 
                     :conditional_constraint, :conditional_constraint_then, 
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

    	def context
    		return @root
    	end

    # - - - - - - - - - - - - Rules - - - - - - - - - - - - -
    SfpReturnValue = define_return_scope 

    # 
    # parser rule sfp
    # 
    # (in SFP.g)
    # 34:1: sfp : ( NL )* ( include )* ( header )* ( state_section | composite | constraint )* ;
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
      state_section4 = nil
      composite5 = nil
      constraint6 = nil

      tree_for_NL1 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 35:4: ( NL )* ( include )* ( header )* ( state_section | composite | constraint )*
        # --> action
         @root = Hash.new 
        # <-- action
        # at line 36:3: ( NL )*
        while true # decision 1
          alt_1 = 2
          look_1_0 = @input.peek( 1 )

          if ( look_1_0 == NL )
            alt_1 = 1

          end
          case alt_1
          when 1
            # at line 36:3: NL
            __NL1__ = match( NL, TOKENS_FOLLOWING_NL_IN_sfp_49 )

            tree_for_NL1 = @adaptor.create_with_payload( __NL1__ )
            @adaptor.add_child( root_0, tree_for_NL1 )


          else
            break # out of loop for decision 1
          end
        end # loop for decision 1
        # at line 36:7: ( include )*
        while true # decision 2
          alt_2 = 2
          look_2_0 = @input.peek( 1 )

          if ( look_2_0 == T__18 )
            alt_2 = 1

          end
          case alt_2
          when 1
            # at line 36:7: include
            @state.following.push( TOKENS_FOLLOWING_include_IN_sfp_52 )
            include2 = include
            @state.following.pop
            @adaptor.add_child( root_0, include2.tree )

          else
            break # out of loop for decision 2
          end
        end # loop for decision 2
        # at line 36:16: ( header )*
        while true # decision 3
          alt_3 = 2
          look_3_0 = @input.peek( 1 )

          if ( look_3_0 == T__24 || look_3_0 == T__30 )
            alt_3 = 1

          end
          case alt_3
          when 1
            # at line 36:16: header
            @state.following.push( TOKENS_FOLLOWING_header_IN_sfp_55 )
            header3 = header
            @state.following.pop
            @adaptor.add_child( root_0, header3.tree )

          else
            break # out of loop for decision 3
          end
        end # loop for decision 3
        # at line 36:24: ( state_section | composite | constraint )*
        while true # decision 4
          alt_4 = 4
          look_4_0 = @input.peek( 1 )

          if ( look_4_0 == ID )
            look_4_2 = @input.peek( 2 )

            if ( look_4_2 == T__20 )
              alt_4 = 1
            elsif ( look_4_2 == T__38 )
              alt_4 = 3

            end
          elsif ( look_4_0 == T__23 )
            alt_4 = 2

          end
          case alt_4
          when 1
            # at line 36:25: state_section
            @state.following.push( TOKENS_FOLLOWING_state_section_IN_sfp_59 )
            state_section4 = state_section
            @state.following.pop
            @adaptor.add_child( root_0, state_section4.tree )

          when 2
            # at line 36:41: composite
            @state.following.push( TOKENS_FOLLOWING_composite_IN_sfp_63 )
            composite5 = composite
            @state.following.pop
            @adaptor.add_child( root_0, composite5.tree )

          when 3
            # at line 36:53: constraint
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
    # 39:1: include : 'include' include_file ( NL )+ ;
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


        # at line 40:4: 'include' include_file ( NL )+
        string_literal7 = match( T__18, TOKENS_FOLLOWING_T__18_IN_include_80 )

        tree_for_string_literal7 = @adaptor.create_with_payload( string_literal7 )
        @adaptor.add_child( root_0, tree_for_string_literal7 )

        @state.following.push( TOKENS_FOLLOWING_include_file_IN_include_82 )
        include_file8 = include_file
        @state.following.pop
        @adaptor.add_child( root_0, include_file8.tree )
        # at file 40:27: ( NL )+
        match_count_5 = 0
        while true
          alt_5 = 2
          look_5_0 = @input.peek( 1 )

          if ( look_5_0 == NL )
            alt_5 = 1

          end
          case alt_5
          when 1
            # at line 40:27: NL
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
    # 43:1: include_file : 'file' STRING ;
    # 
    def include_file
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )
      return_value = IncludeFileReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal10 = nil
      __STRING11__ = nil

      tree_for_string_literal10 = nil
      tree_for_STRING11 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 44:4: 'file' STRING
        string_literal10 = match( T__19, TOKENS_FOLLOWING_T__19_IN_include_file_96 )

        tree_for_string_literal10 = @adaptor.create_with_payload( string_literal10 )
        @adaptor.add_child( root_0, tree_for_string_literal10 )

        __STRING11__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_include_file_98 )

        tree_for_STRING11 = @adaptor.create_with_payload( __STRING11__ )
        @adaptor.add_child( root_0, tree_for_STRING11 )

        # - - - - - - - rule clean up - - - - - - - -
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
    # 47:1: header : ( class_definition | procedure );
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
        # at line 48:2: ( class_definition | procedure )
        alt_6 = 2
        look_6_0 = @input.peek( 1 )

        if ( look_6_0 == T__24 )
          alt_6 = 1
        elsif ( look_6_0 == T__30 )
          alt_6 = 2
        else
          raise NoViableAlternative( "", 6, 0 )
        end
        case alt_6
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 48:4: class_definition
          @state.following.push( TOKENS_FOLLOWING_class_definition_IN_header_110 )
          class_definition12 = class_definition
          @state.following.pop
          @adaptor.add_child( root_0, class_definition12.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 49:4: procedure
          @state.following.push( TOKENS_FOLLOWING_procedure_IN_header_115 )
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

    StateSectionReturnValue = define_return_scope 

    # 
    # parser rule state_section
    # 
    # (in SFP.g)
    # 52:1: state_section : ID 'state' '{' ( NL )* ( attribute )* '}' ( NL )* ;
    # 
    def state_section
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )
      return_value = StateSectionReturnValue.new

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


        # at line 53:4: ID 'state' '{' ( NL )* ( attribute )* '}' ( NL )*
        __ID14__ = match( ID, TOKENS_FOLLOWING_ID_IN_state_section_126 )

        tree_for_ID14 = @adaptor.create_with_payload( __ID14__ )
        @adaptor.add_child( root_0, tree_for_ID14 )

        string_literal15 = match( T__20, TOKENS_FOLLOWING_T__20_IN_state_section_128 )

        tree_for_string_literal15 = @adaptor.create_with_payload( string_literal15 )
        @adaptor.add_child( root_0, tree_for_string_literal15 )

        char_literal16 = match( T__21, TOKENS_FOLLOWING_T__21_IN_state_section_132 )

        tree_for_char_literal16 = @adaptor.create_with_payload( char_literal16 )
        @adaptor.add_child( root_0, tree_for_char_literal16 )

        # at line 54:7: ( NL )*
        while true # decision 7
          alt_7 = 2
          look_7_0 = @input.peek( 1 )

          if ( look_7_0 == NL )
            alt_7 = 1

          end
          case alt_7
          when 1
            # at line 54:7: NL
            __NL17__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_section_134 )

            tree_for_NL17 = @adaptor.create_with_payload( __NL17__ )
            @adaptor.add_child( root_0, tree_for_NL17 )


          else
            break # out of loop for decision 7
          end
        end # loop for decision 7
        # at line 54:11: ( attribute )*
        while true # decision 8
          alt_8 = 2
          look_8_0 = @input.peek( 1 )

          if ( look_8_0 == ID )
            alt_8 = 1

          end
          case alt_8
          when 1
            # at line 54:11: attribute
            @state.following.push( TOKENS_FOLLOWING_attribute_IN_state_section_137 )
            attribute18 = attribute
            @state.following.pop
            @adaptor.add_child( root_0, attribute18.tree )

          else
            break # out of loop for decision 8
          end
        end # loop for decision 8
        char_literal19 = match( T__22, TOKENS_FOLLOWING_T__22_IN_state_section_140 )

        tree_for_char_literal19 = @adaptor.create_with_payload( char_literal19 )
        @adaptor.add_child( root_0, tree_for_char_literal19 )

        # at line 54:26: ( NL )*
        while true # decision 9
          alt_9 = 2
          look_9_0 = @input.peek( 1 )

          if ( look_9_0 == NL )
            alt_9 = 1

          end
          case alt_9
          when 1
            # at line 54:26: NL
            __NL20__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_section_142 )

            tree_for_NL20 = @adaptor.create_with_payload( __NL20__ )
            @adaptor.add_child( root_0, tree_for_NL20 )


          else
            break # out of loop for decision 9
          end
        end # loop for decision 9
        # - - - - - - - rule clean up - - - - - - - -
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
    # 57:1: composite : 'composite' ID '{' ( NL )* ( attribute | constraint )* '}' ( NL )* ;
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


        # at line 58:4: 'composite' ID '{' ( NL )* ( attribute | constraint )* '}' ( NL )*
        string_literal21 = match( T__23, TOKENS_FOLLOWING_T__23_IN_composite_154 )

        tree_for_string_literal21 = @adaptor.create_with_payload( string_literal21 )
        @adaptor.add_child( root_0, tree_for_string_literal21 )

        __ID22__ = match( ID, TOKENS_FOLLOWING_ID_IN_composite_156 )

        tree_for_ID22 = @adaptor.create_with_payload( __ID22__ )
        @adaptor.add_child( root_0, tree_for_ID22 )

        char_literal23 = match( T__21, TOKENS_FOLLOWING_T__21_IN_composite_160 )

        tree_for_char_literal23 = @adaptor.create_with_payload( char_literal23 )
        @adaptor.add_child( root_0, tree_for_char_literal23 )

        # at line 59:7: ( NL )*
        while true # decision 10
          alt_10 = 2
          look_10_0 = @input.peek( 1 )

          if ( look_10_0 == NL )
            alt_10 = 1

          end
          case alt_10
          when 1
            # at line 59:7: NL
            __NL24__ = match( NL, TOKENS_FOLLOWING_NL_IN_composite_162 )

            tree_for_NL24 = @adaptor.create_with_payload( __NL24__ )
            @adaptor.add_child( root_0, tree_for_NL24 )


          else
            break # out of loop for decision 10
          end
        end # loop for decision 10
        # at line 59:11: ( attribute | constraint )*
        while true # decision 11
          alt_11 = 3
          look_11_0 = @input.peek( 1 )

          if ( look_11_0 == ID )
            look_11_2 = @input.peek( 2 )

            if ( look_11_2 == T__38 )
              alt_11 = 2
            elsif ( look_11_2 == NL || look_11_2 == T__21 || look_11_2 == T__26 || look_11_2 == T__41 || look_11_2.between?( T__50, T__51 ) )
              alt_11 = 1

            end

          end
          case alt_11
          when 1
            # at line 59:13: attribute
            @state.following.push( TOKENS_FOLLOWING_attribute_IN_composite_167 )
            attribute25 = attribute
            @state.following.pop
            @adaptor.add_child( root_0, attribute25.tree )

          when 2
            # at line 59:25: constraint
            @state.following.push( TOKENS_FOLLOWING_constraint_IN_composite_171 )
            constraint26 = constraint
            @state.following.pop
            @adaptor.add_child( root_0, constraint26.tree )

          else
            break # out of loop for decision 11
          end
        end # loop for decision 11
        char_literal27 = match( T__22, TOKENS_FOLLOWING_T__22_IN_composite_176 )

        tree_for_char_literal27 = @adaptor.create_with_payload( char_literal27 )
        @adaptor.add_child( root_0, tree_for_char_literal27 )

        # at line 59:43: ( NL )*
        while true # decision 12
          alt_12 = 2
          look_12_0 = @input.peek( 1 )

          if ( look_12_0 == NL )
            alt_12 = 1

          end
          case alt_12
          when 1
            # at line 59:43: NL
            __NL28__ = match( NL, TOKENS_FOLLOWING_NL_IN_composite_178 )

            tree_for_NL28 = @adaptor.create_with_payload( __NL28__ )
            @adaptor.add_child( root_0, tree_for_NL28 )


          else
            break # out of loop for decision 12
          end
        end # loop for decision 12
        # - - - - - - - rule clean up - - - - - - - -
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
    # 62:1: class_definition : 'class' ID ( extends_class )? ( '{' ( NL )* ( attribute | procedure )* '}' )? ( NL )* ;
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


        # at line 63:4: 'class' ID ( extends_class )? ( '{' ( NL )* ( attribute | procedure )* '}' )? ( NL )*
        string_literal29 = match( T__24, TOKENS_FOLLOWING_T__24_IN_class_definition_190 )

        tree_for_string_literal29 = @adaptor.create_with_payload( string_literal29 )
        @adaptor.add_child( root_0, tree_for_string_literal29 )

        __ID30__ = match( ID, TOKENS_FOLLOWING_ID_IN_class_definition_192 )

        tree_for_ID30 = @adaptor.create_with_payload( __ID30__ )
        @adaptor.add_child( root_0, tree_for_ID30 )

        # at line 64:3: ( extends_class )?
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0 == T__25 )
          alt_13 = 1
        end
        case alt_13
        when 1
          # at line 64:4: extends_class
          @state.following.push( TOKENS_FOLLOWING_extends_class_IN_class_definition_197 )
          extends_class31 = extends_class
          @state.following.pop
          @adaptor.add_child( root_0, extends_class31.tree )

        end
        # at line 66:3: ( '{' ( NL )* ( attribute | procedure )* '}' )?
        alt_16 = 2
        look_16_0 = @input.peek( 1 )

        if ( look_16_0 == T__21 )
          alt_16 = 1
        end
        case alt_16
        when 1
          # at line 66:4: '{' ( NL )* ( attribute | procedure )* '}'
          char_literal32 = match( T__21, TOKENS_FOLLOWING_T__21_IN_class_definition_207 )

          tree_for_char_literal32 = @adaptor.create_with_payload( char_literal32 )
          @adaptor.add_child( root_0, tree_for_char_literal32 )

          # at line 66:8: ( NL )*
          while true # decision 14
            alt_14 = 2
            look_14_0 = @input.peek( 1 )

            if ( look_14_0 == NL )
              alt_14 = 1

            end
            case alt_14
            when 1
              # at line 66:8: NL
              __NL33__ = match( NL, TOKENS_FOLLOWING_NL_IN_class_definition_209 )

              tree_for_NL33 = @adaptor.create_with_payload( __NL33__ )
              @adaptor.add_child( root_0, tree_for_NL33 )


            else
              break # out of loop for decision 14
            end
          end # loop for decision 14
          # at line 66:12: ( attribute | procedure )*
          while true # decision 15
            alt_15 = 3
            look_15_0 = @input.peek( 1 )

            if ( look_15_0 == ID )
              alt_15 = 1
            elsif ( look_15_0 == T__30 )
              alt_15 = 2

            end
            case alt_15
            when 1
              # at line 66:14: attribute
              @state.following.push( TOKENS_FOLLOWING_attribute_IN_class_definition_214 )
              attribute34 = attribute
              @state.following.pop
              @adaptor.add_child( root_0, attribute34.tree )

            when 2
              # at line 66:26: procedure
              @state.following.push( TOKENS_FOLLOWING_procedure_IN_class_definition_218 )
              procedure35 = procedure
              @state.following.pop
              @adaptor.add_child( root_0, procedure35.tree )

            else
              break # out of loop for decision 15
            end
          end # loop for decision 15
          char_literal36 = match( T__22, TOKENS_FOLLOWING_T__22_IN_class_definition_223 )

          tree_for_char_literal36 = @adaptor.create_with_payload( char_literal36 )
          @adaptor.add_child( root_0, tree_for_char_literal36 )


        end
        # at line 66:45: ( NL )*
        while true # decision 17
          alt_17 = 2
          look_17_0 = @input.peek( 1 )

          if ( look_17_0 == NL )
            alt_17 = 1

          end
          case alt_17
          when 1
            # at line 66:45: NL
            __NL37__ = match( NL, TOKENS_FOLLOWING_NL_IN_class_definition_227 )

            tree_for_NL37 = @adaptor.create_with_payload( __NL37__ )
            @adaptor.add_child( root_0, tree_for_NL37 )


          else
            break # out of loop for decision 17
          end
        end # loop for decision 17
        # - - - - - - - rule clean up - - - - - - - -
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
    # 69:1: extends_class returns [val] : 'extends' path ;
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


        # at line 70:4: 'extends' path
        string_literal38 = match( T__25, TOKENS_FOLLOWING_T__25_IN_extends_class_244 )

        tree_for_string_literal38 = @adaptor.create_with_payload( string_literal38 )
        @adaptor.add_child( root_0, tree_for_string_literal38 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_extends_class_246 )
        path39 = path
        @state.following.pop
        @adaptor.add_child( root_0, path39.tree )
        # - - - - - - - rule clean up - - - - - - - -
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
    # 73:1: attribute : ( ID equals_op value ( NL )+ | ID reference_type ( NL )+ | object_def ( NL )+ );
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
        # at line 74:2: ( ID equals_op value ( NL )+ | ID reference_type ( NL )+ | object_def ( NL )+ )
        alt_21 = 3
        look_21_0 = @input.peek( 1 )

        if ( look_21_0 == ID )
          case look_21 = @input.peek( 2 )
          when T__41, T__51 then alt_21 = 1
          when T__50 then alt_21 = 2
          when NL, T__21, T__26 then alt_21 = 3
          else
            raise NoViableAlternative( "", 21, 1 )
          end
        else
          raise NoViableAlternative( "", 21, 0 )
        end
        case alt_21
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 74:4: ID equals_op value ( NL )+
          __ID40__ = match( ID, TOKENS_FOLLOWING_ID_IN_attribute_257 )

          tree_for_ID40 = @adaptor.create_with_payload( __ID40__ )
          @adaptor.add_child( root_0, tree_for_ID40 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_attribute_259 )
          equals_op41 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op41.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_attribute_261 )
          value42 = value
          @state.following.pop
          @adaptor.add_child( root_0, value42.tree )
          # at file 74:23: ( NL )+
          match_count_18 = 0
          while true
            alt_18 = 2
            look_18_0 = @input.peek( 1 )

            if ( look_18_0 == NL )
              alt_18 = 1

            end
            case alt_18
            when 1
              # at line 74:23: NL
              __NL43__ = match( NL, TOKENS_FOLLOWING_NL_IN_attribute_263 )

              tree_for_NL43 = @adaptor.create_with_payload( __NL43__ )
              @adaptor.add_child( root_0, tree_for_NL43 )


            else
              match_count_18 > 0 and break
              eee = EarlyExit(18)


              raise eee
            end
            match_count_18 += 1
          end


        when 2
          root_0 = @adaptor.create_flat_list


          # at line 75:4: ID reference_type ( NL )+
          __ID44__ = match( ID, TOKENS_FOLLOWING_ID_IN_attribute_269 )

          tree_for_ID44 = @adaptor.create_with_payload( __ID44__ )
          @adaptor.add_child( root_0, tree_for_ID44 )

          @state.following.push( TOKENS_FOLLOWING_reference_type_IN_attribute_271 )
          reference_type45 = reference_type
          @state.following.pop
          @adaptor.add_child( root_0, reference_type45.tree )
          # at file 75:22: ( NL )+
          match_count_19 = 0
          while true
            alt_19 = 2
            look_19_0 = @input.peek( 1 )

            if ( look_19_0 == NL )
              alt_19 = 1

            end
            case alt_19
            when 1
              # at line 75:22: NL
              __NL46__ = match( NL, TOKENS_FOLLOWING_NL_IN_attribute_273 )

              tree_for_NL46 = @adaptor.create_with_payload( __NL46__ )
              @adaptor.add_child( root_0, tree_for_NL46 )


            else
              match_count_19 > 0 and break
              eee = EarlyExit(19)


              raise eee
            end
            match_count_19 += 1
          end


        when 3
          root_0 = @adaptor.create_flat_list


          # at line 76:4: object_def ( NL )+
          @state.following.push( TOKENS_FOLLOWING_object_def_IN_attribute_279 )
          object_def47 = object_def
          @state.following.pop
          @adaptor.add_child( root_0, object_def47.tree )
          # at file 76:15: ( NL )+
          match_count_20 = 0
          while true
            alt_20 = 2
            look_20_0 = @input.peek( 1 )

            if ( look_20_0 == NL )
              alt_20 = 1

            end
            case alt_20
            when 1
              # at line 76:15: NL
              __NL48__ = match( NL, TOKENS_FOLLOWING_NL_IN_attribute_281 )

              tree_for_NL48 = @adaptor.create_with_payload( __NL48__ )
              @adaptor.add_child( root_0, tree_for_NL48 )


            else
              match_count_20 > 0 and break
              eee = EarlyExit(20)


              raise eee
            end
            match_count_20 += 1
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
    # 79:1: object_def : ID ( 'isa' path )? ( object_body )? ;
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
      path51 = nil
      object_body52 = nil

      tree_for_ID49 = nil
      tree_for_string_literal50 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 80:4: ID ( 'isa' path )? ( object_body )?
        __ID49__ = match( ID, TOKENS_FOLLOWING_ID_IN_object_def_293 )

        tree_for_ID49 = @adaptor.create_with_payload( __ID49__ )
        @adaptor.add_child( root_0, tree_for_ID49 )

        # at line 81:3: ( 'isa' path )?
        alt_22 = 2
        look_22_0 = @input.peek( 1 )

        if ( look_22_0 == T__26 )
          alt_22 = 1
        end
        case alt_22
        when 1
          # at line 81:4: 'isa' path
          string_literal50 = match( T__26, TOKENS_FOLLOWING_T__26_IN_object_def_298 )

          tree_for_string_literal50 = @adaptor.create_with_payload( string_literal50 )
          @adaptor.add_child( root_0, tree_for_string_literal50 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_object_def_300 )
          path51 = path
          @state.following.pop
          @adaptor.add_child( root_0, path51.tree )

        end
        # at line 83:3: ( object_body )?
        alt_23 = 2
        look_23_0 = @input.peek( 1 )

        if ( look_23_0 == T__21 )
          alt_23 = 1
        end
        case alt_23
        when 1
          # at line 83:3: object_body
          @state.following.push( TOKENS_FOLLOWING_object_body_IN_object_def_309 )
          object_body52 = object_body
          @state.following.pop
          @adaptor.add_child( root_0, object_body52.tree )

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
        # trace_out( __method__, 10 )

      end
      
      return return_value
    end

    ObjectBodyReturnValue = define_return_scope 

    # 
    # parser rule object_body
    # 
    # (in SFP.g)
    # 86:1: object_body : '{' ( NL )* ( object_attribute | state_dependency )* '}' ;
    # 
    def object_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )
      return_value = ObjectBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal53 = nil
      __NL54__ = nil
      char_literal57 = nil
      object_attribute55 = nil
      state_dependency56 = nil

      tree_for_char_literal53 = nil
      tree_for_NL54 = nil
      tree_for_char_literal57 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 87:4: '{' ( NL )* ( object_attribute | state_dependency )* '}'
        char_literal53 = match( T__21, TOKENS_FOLLOWING_T__21_IN_object_body_321 )

        tree_for_char_literal53 = @adaptor.create_with_payload( char_literal53 )
        @adaptor.add_child( root_0, tree_for_char_literal53 )

        # at line 87:8: ( NL )*
        while true # decision 24
          alt_24 = 2
          look_24_0 = @input.peek( 1 )

          if ( look_24_0 == NL )
            alt_24 = 1

          end
          case alt_24
          when 1
            # at line 87:8: NL
            __NL54__ = match( NL, TOKENS_FOLLOWING_NL_IN_object_body_323 )

            tree_for_NL54 = @adaptor.create_with_payload( __NL54__ )
            @adaptor.add_child( root_0, tree_for_NL54 )


          else
            break # out of loop for decision 24
          end
        end # loop for decision 24
        # at line 87:12: ( object_attribute | state_dependency )*
        while true # decision 25
          alt_25 = 3
          look_25_0 = @input.peek( 1 )

          if ( look_25_0 == ID )
            alt_25 = 1
          elsif ( look_25_0 == T__27 )
            alt_25 = 2

          end
          case alt_25
          when 1
            # at line 87:14: object_attribute
            @state.following.push( TOKENS_FOLLOWING_object_attribute_IN_object_body_328 )
            object_attribute55 = object_attribute
            @state.following.pop
            @adaptor.add_child( root_0, object_attribute55.tree )

          when 2
            # at line 87:33: state_dependency
            @state.following.push( TOKENS_FOLLOWING_state_dependency_IN_object_body_332 )
            state_dependency56 = state_dependency
            @state.following.pop
            @adaptor.add_child( root_0, state_dependency56.tree )

          else
            break # out of loop for decision 25
          end
        end # loop for decision 25
        char_literal57 = match( T__22, TOKENS_FOLLOWING_T__22_IN_object_body_337 )

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
    # 90:1: object_attribute : ( attribute | ID equals_op NULL ( NL )+ );
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
        # at line 91:2: ( attribute | ID equals_op NULL ( NL )+ )
        alt_27 = 2
        look_27_0 = @input.peek( 1 )

        if ( look_27_0 == ID )
          look_27_1 = @input.peek( 2 )

          if ( look_27_1 == T__41 || look_27_1 == T__51 )
            look_27_2 = @input.peek( 3 )

            if ( look_27_2.between?( STRING, ID ) || look_27_2.between?( NUMBER, MULTILINE_STRING ) || look_27_2 == T__32 )
              alt_27 = 1
            elsif ( look_27_2 == NULL )
              alt_27 = 2
            else
              raise NoViableAlternative( "", 27, 2 )
            end
          elsif ( look_27_1 == NL || look_27_1 == T__21 || look_27_1 == T__26 || look_27_1 == T__50 )
            alt_27 = 1
          else
            raise NoViableAlternative( "", 27, 1 )
          end
        else
          raise NoViableAlternative( "", 27, 0 )
        end
        case alt_27
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 91:4: attribute
          @state.following.push( TOKENS_FOLLOWING_attribute_IN_object_attribute_348 )
          attribute58 = attribute
          @state.following.pop
          @adaptor.add_child( root_0, attribute58.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 92:4: ID equals_op NULL ( NL )+
          __ID59__ = match( ID, TOKENS_FOLLOWING_ID_IN_object_attribute_353 )

          tree_for_ID59 = @adaptor.create_with_payload( __ID59__ )
          @adaptor.add_child( root_0, tree_for_ID59 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_object_attribute_355 )
          equals_op60 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op60.tree )
          __NULL61__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_object_attribute_357 )

          tree_for_NULL61 = @adaptor.create_with_payload( __NULL61__ )
          @adaptor.add_child( root_0, tree_for_NULL61 )

          # at file 92:22: ( NL )+
          match_count_26 = 0
          while true
            alt_26 = 2
            look_26_0 = @input.peek( 1 )

            if ( look_26_0 == NL )
              alt_26 = 1

            end
            case alt_26
            when 1
              # at line 92:22: NL
              __NL62__ = match( NL, TOKENS_FOLLOWING_NL_IN_object_attribute_359 )

              tree_for_NL62 = @adaptor.create_with_payload( __NL62__ )
              @adaptor.add_child( root_0, tree_for_NL62 )


            else
              match_count_26 > 0 and break
              eee = EarlyExit(26)


              raise eee
            end
            match_count_26 += 1
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
        # trace_out( __method__, 12 )

      end
      
      return return_value
    end

    StateDependencyReturnValue = define_return_scope 

    # 
    # parser rule state_dependency
    # 
    # (in SFP.g)
    # 95:1: state_dependency : 'if' dep_effect ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )* ( NL )+ ;
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


        # at line 96:4: 'if' dep_effect ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )* ( NL )+
        string_literal63 = match( T__27, TOKENS_FOLLOWING_T__27_IN_state_dependency_371 )

        tree_for_string_literal63 = @adaptor.create_with_payload( string_literal63 )
        @adaptor.add_child( root_0, tree_for_string_literal63 )

        @state.following.push( TOKENS_FOLLOWING_dep_effect_IN_state_dependency_375 )
        dep_effect64 = dep_effect
        @state.following.pop
        @adaptor.add_child( root_0, dep_effect64.tree )
        # at line 97:14: ( NL )*
        while true # decision 28
          alt_28 = 2
          look_28_0 = @input.peek( 1 )

          if ( look_28_0 == NL )
            alt_28 = 1

          end
          case alt_28
          when 1
            # at line 97:14: NL
            __NL65__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_377 )

            tree_for_NL65 = @adaptor.create_with_payload( __NL65__ )
            @adaptor.add_child( root_0, tree_for_NL65 )


          else
            break # out of loop for decision 28
          end
        end # loop for decision 28
        string_literal66 = match( T__28, TOKENS_FOLLOWING_T__28_IN_state_dependency_380 )

        tree_for_string_literal66 = @adaptor.create_with_payload( string_literal66 )
        @adaptor.add_child( root_0, tree_for_string_literal66 )

        # at line 97:25: ( NL )*
        while true # decision 29
          alt_29 = 2
          look_29_0 = @input.peek( 1 )

          if ( look_29_0 == NL )
            alt_29 = 1

          end
          case alt_29
          when 1
            # at line 97:25: NL
            __NL67__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_382 )

            tree_for_NL67 = @adaptor.create_with_payload( __NL67__ )
            @adaptor.add_child( root_0, tree_for_NL67 )


          else
            break # out of loop for decision 29
          end
        end # loop for decision 29
        char_literal68 = match( T__21, TOKENS_FOLLOWING_T__21_IN_state_dependency_385 )

        tree_for_char_literal68 = @adaptor.create_with_payload( char_literal68 )
        @adaptor.add_child( root_0, tree_for_char_literal68 )

        # at line 98:3: ( NL )*
        while true # decision 30
          alt_30 = 2
          look_30_0 = @input.peek( 1 )

          if ( look_30_0 == NL )
            alt_30 = 1

          end
          case alt_30
          when 1
            # at line 98:3: NL
            __NL69__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_389 )

            tree_for_NL69 = @adaptor.create_with_payload( __NL69__ )
            @adaptor.add_child( root_0, tree_for_NL69 )


          else
            break # out of loop for decision 30
          end
        end # loop for decision 30
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_state_dependency_392 )
        constraint_body70 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body70.tree )
        char_literal71 = match( T__22, TOKENS_FOLLOWING_T__22_IN_state_dependency_397 )

        tree_for_char_literal71 = @adaptor.create_with_payload( char_literal71 )
        @adaptor.add_child( root_0, tree_for_char_literal71 )

        # at line 100:3: ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )*
        while true # decision 34
          alt_34 = 2
          alt_34 = @dfa34.predict( @input )
          case alt_34
          when 1
            # at line 100:5: ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}'
            # at line 100:5: ( NL )*
            while true # decision 31
              alt_31 = 2
              look_31_0 = @input.peek( 1 )

              if ( look_31_0 == NL )
                alt_31 = 1

              end
              case alt_31
              when 1
                # at line 100:5: NL
                __NL72__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_403 )

                tree_for_NL72 = @adaptor.create_with_payload( __NL72__ )
                @adaptor.add_child( root_0, tree_for_NL72 )


              else
                break # out of loop for decision 31
              end
            end # loop for decision 31
            string_literal73 = match( T__29, TOKENS_FOLLOWING_T__29_IN_state_dependency_406 )

            tree_for_string_literal73 = @adaptor.create_with_payload( string_literal73 )
            @adaptor.add_child( root_0, tree_for_string_literal73 )

            # at line 100:14: ( NL )*
            while true # decision 32
              alt_32 = 2
              look_32_0 = @input.peek( 1 )

              if ( look_32_0 == NL )
                alt_32 = 1

              end
              case alt_32
              when 1
                # at line 100:14: NL
                __NL74__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_408 )

                tree_for_NL74 = @adaptor.create_with_payload( __NL74__ )
                @adaptor.add_child( root_0, tree_for_NL74 )


              else
                break # out of loop for decision 32
              end
            end # loop for decision 32
            char_literal75 = match( T__21, TOKENS_FOLLOWING_T__21_IN_state_dependency_411 )

            tree_for_char_literal75 = @adaptor.create_with_payload( char_literal75 )
            @adaptor.add_child( root_0, tree_for_char_literal75 )

            # at line 101:3: ( NL )*
            while true # decision 33
              alt_33 = 2
              look_33_0 = @input.peek( 1 )

              if ( look_33_0 == NL )
                alt_33 = 1

              end
              case alt_33
              when 1
                # at line 101:3: NL
                __NL76__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_415 )

                tree_for_NL76 = @adaptor.create_with_payload( __NL76__ )
                @adaptor.add_child( root_0, tree_for_NL76 )


              else
                break # out of loop for decision 33
              end
            end # loop for decision 33
            @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_state_dependency_418 )
            constraint_body77 = constraint_body
            @state.following.pop
            @adaptor.add_child( root_0, constraint_body77.tree )
            char_literal78 = match( T__22, TOKENS_FOLLOWING_T__22_IN_state_dependency_422 )

            tree_for_char_literal78 = @adaptor.create_with_payload( char_literal78 )
            @adaptor.add_child( root_0, tree_for_char_literal78 )


          else
            break # out of loop for decision 34
          end
        end # loop for decision 34
        # at file 103:3: ( NL )+
        match_count_35 = 0
        while true
          alt_35 = 2
          look_35_0 = @input.peek( 1 )

          if ( look_35_0 == NL )
            alt_35 = 1

          end
          case alt_35
          when 1
            # at line 103:3: NL
            __NL79__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_428 )

            tree_for_NL79 = @adaptor.create_with_payload( __NL79__ )
            @adaptor.add_child( root_0, tree_for_NL79 )


          else
            match_count_35 > 0 and break
            eee = EarlyExit(35)


            raise eee
          end
          match_count_35 += 1
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
    # 106:1: dep_effect : reference equals_op ( value | NULL ) ;
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


        # at line 107:4: reference equals_op ( value | NULL )
        @state.following.push( TOKENS_FOLLOWING_reference_IN_dep_effect_440 )
        reference80 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference80.tree )
        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_dep_effect_442 )
        equals_op81 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op81.tree )
        # at line 108:3: ( value | NULL )
        alt_36 = 2
        look_36_0 = @input.peek( 1 )

        if ( look_36_0.between?( STRING, ID ) || look_36_0.between?( NUMBER, MULTILINE_STRING ) || look_36_0 == T__32 )
          alt_36 = 1
        elsif ( look_36_0 == NULL )
          alt_36 = 2
        else
          raise NoViableAlternative( "", 36, 0 )
        end
        case alt_36
        when 1
          # at line 108:5: value
          @state.following.push( TOKENS_FOLLOWING_value_IN_dep_effect_449 )
          value82 = value
          @state.following.pop
          @adaptor.add_child( root_0, value82.tree )

        when 2
          # at line 109:5: NULL
          __NULL83__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_dep_effect_455 )

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

    ProcedureReturnValue = define_return_scope 

    # 
    # parser rule procedure
    # 
    # (in SFP.g)
    # 113:1: procedure : 'procedure' ID ( parameters )? '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( conditions )? effects '}' ( NL )+ ;
    # 
    def procedure
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )
      return_value = ProcedureReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal84 = nil
      __ID85__ = nil
      char_literal87 = nil
      __NL88__ = nil
      string_literal89 = nil
      __NUMBER91__ = nil
      __NL92__ = nil
      char_literal95 = nil
      __NL96__ = nil
      parameters86 = nil
      equals_op90 = nil
      conditions93 = nil
      effects94 = nil

      tree_for_string_literal84 = nil
      tree_for_ID85 = nil
      tree_for_char_literal87 = nil
      tree_for_NL88 = nil
      tree_for_string_literal89 = nil
      tree_for_NUMBER91 = nil
      tree_for_NL92 = nil
      tree_for_char_literal95 = nil
      tree_for_NL96 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 114:4: 'procedure' ID ( parameters )? '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( conditions )? effects '}' ( NL )+
        string_literal84 = match( T__30, TOKENS_FOLLOWING_T__30_IN_procedure_471 )

        tree_for_string_literal84 = @adaptor.create_with_payload( string_literal84 )
        @adaptor.add_child( root_0, tree_for_string_literal84 )

        __ID85__ = match( ID, TOKENS_FOLLOWING_ID_IN_procedure_473 )

        tree_for_ID85 = @adaptor.create_with_payload( __ID85__ )
        @adaptor.add_child( root_0, tree_for_ID85 )

        # at line 115:3: ( parameters )?
        alt_37 = 2
        look_37_0 = @input.peek( 1 )

        if ( look_37_0 == T__32 )
          alt_37 = 1
        end
        case alt_37
        when 1
          # at line 115:3: parameters
          @state.following.push( TOKENS_FOLLOWING_parameters_IN_procedure_477 )
          parameters86 = parameters
          @state.following.pop
          @adaptor.add_child( root_0, parameters86.tree )

        end
        char_literal87 = match( T__21, TOKENS_FOLLOWING_T__21_IN_procedure_480 )

        tree_for_char_literal87 = @adaptor.create_with_payload( char_literal87 )
        @adaptor.add_child( root_0, tree_for_char_literal87 )

        # at line 115:19: ( NL )*
        while true # decision 38
          alt_38 = 2
          look_38_0 = @input.peek( 1 )

          if ( look_38_0 == NL )
            alt_38 = 1

          end
          case alt_38
          when 1
            # at line 115:19: NL
            __NL88__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_482 )

            tree_for_NL88 = @adaptor.create_with_payload( __NL88__ )
            @adaptor.add_child( root_0, tree_for_NL88 )


          else
            break # out of loop for decision 38
          end
        end # loop for decision 38
        # at line 116:3: ( 'cost' equals_op NUMBER ( NL )+ )?
        alt_40 = 2
        look_40_0 = @input.peek( 1 )

        if ( look_40_0 == T__31 )
          alt_40 = 1
        end
        case alt_40
        when 1
          # at line 116:5: 'cost' equals_op NUMBER ( NL )+
          string_literal89 = match( T__31, TOKENS_FOLLOWING_T__31_IN_procedure_490 )

          tree_for_string_literal89 = @adaptor.create_with_payload( string_literal89 )
          @adaptor.add_child( root_0, tree_for_string_literal89 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_procedure_492 )
          equals_op90 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op90.tree )
          __NUMBER91__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_procedure_494 )

          tree_for_NUMBER91 = @adaptor.create_with_payload( __NUMBER91__ )
          @adaptor.add_child( root_0, tree_for_NUMBER91 )

          # at file 117:4: ( NL )+
          match_count_39 = 0
          while true
            alt_39 = 2
            look_39_0 = @input.peek( 1 )

            if ( look_39_0 == NL )
              alt_39 = 1

            end
            case alt_39
            when 1
              # at line 117:4: NL
              __NL92__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_499 )

              tree_for_NL92 = @adaptor.create_with_payload( __NL92__ )
              @adaptor.add_child( root_0, tree_for_NL92 )


            else
              match_count_39 > 0 and break
              eee = EarlyExit(39)


              raise eee
            end
            match_count_39 += 1
          end


        end
        # at line 119:3: ( conditions )?
        alt_41 = 2
        look_41_0 = @input.peek( 1 )

        if ( look_41_0 == T__36 )
          alt_41 = 1
        end
        case alt_41
        when 1
          # at line 119:3: conditions
          @state.following.push( TOKENS_FOLLOWING_conditions_IN_procedure_509 )
          conditions93 = conditions
          @state.following.pop
          @adaptor.add_child( root_0, conditions93.tree )

        end
        @state.following.push( TOKENS_FOLLOWING_effects_IN_procedure_512 )
        effects94 = effects
        @state.following.pop
        @adaptor.add_child( root_0, effects94.tree )
        char_literal95 = match( T__22, TOKENS_FOLLOWING_T__22_IN_procedure_514 )

        tree_for_char_literal95 = @adaptor.create_with_payload( char_literal95 )
        @adaptor.add_child( root_0, tree_for_char_literal95 )

        # at file 119:27: ( NL )+
        match_count_42 = 0
        while true
          alt_42 = 2
          look_42_0 = @input.peek( 1 )

          if ( look_42_0 == NL )
            alt_42 = 1

          end
          case alt_42
          when 1
            # at line 119:27: NL
            __NL96__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_516 )

            tree_for_NL96 = @adaptor.create_with_payload( __NL96__ )
            @adaptor.add_child( root_0, tree_for_NL96 )


          else
            match_count_42 > 0 and break
            eee = EarlyExit(42)


            raise eee
          end
          match_count_42 += 1
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
        # trace_out( __method__, 15 )

      end
      
      return return_value
    end

    ParametersReturnValue = define_return_scope 

    # 
    # parser rule parameters
    # 
    # (in SFP.g)
    # 122:1: parameters : '(' parameter ( ',' parameter )* ')' ;
    # 
    def parameters
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )
      return_value = ParametersReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal97 = nil
      char_literal99 = nil
      char_literal101 = nil
      parameter98 = nil
      parameter100 = nil

      tree_for_char_literal97 = nil
      tree_for_char_literal99 = nil
      tree_for_char_literal101 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 123:4: '(' parameter ( ',' parameter )* ')'
        char_literal97 = match( T__32, TOKENS_FOLLOWING_T__32_IN_parameters_528 )

        tree_for_char_literal97 = @adaptor.create_with_payload( char_literal97 )
        @adaptor.add_child( root_0, tree_for_char_literal97 )

        @state.following.push( TOKENS_FOLLOWING_parameter_IN_parameters_530 )
        parameter98 = parameter
        @state.following.pop
        @adaptor.add_child( root_0, parameter98.tree )
        # at line 123:18: ( ',' parameter )*
        while true # decision 43
          alt_43 = 2
          look_43_0 = @input.peek( 1 )

          if ( look_43_0 == T__33 )
            alt_43 = 1

          end
          case alt_43
          when 1
            # at line 123:19: ',' parameter
            char_literal99 = match( T__33, TOKENS_FOLLOWING_T__33_IN_parameters_533 )

            tree_for_char_literal99 = @adaptor.create_with_payload( char_literal99 )
            @adaptor.add_child( root_0, tree_for_char_literal99 )

            @state.following.push( TOKENS_FOLLOWING_parameter_IN_parameters_535 )
            parameter100 = parameter
            @state.following.pop
            @adaptor.add_child( root_0, parameter100.tree )

          else
            break # out of loop for decision 43
          end
        end # loop for decision 43
        char_literal101 = match( T__34, TOKENS_FOLLOWING_T__34_IN_parameters_539 )

        tree_for_char_literal101 = @adaptor.create_with_payload( char_literal101 )
        @adaptor.add_child( root_0, tree_for_char_literal101 )

        # - - - - - - - rule clean up - - - - - - - -
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

    ParameterReturnValue = define_return_scope 

    # 
    # parser rule parameter
    # 
    # (in SFP.g)
    # 126:1: parameter : ( ID reference_type | ID 'areall' path );
    # 
    def parameter
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      return_value = ParameterReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID102__ = nil
      __ID104__ = nil
      string_literal105 = nil
      reference_type103 = nil
      path106 = nil

      tree_for_ID102 = nil
      tree_for_ID104 = nil
      tree_for_string_literal105 = nil

      begin
        # at line 127:2: ( ID reference_type | ID 'areall' path )
        alt_44 = 2
        look_44_0 = @input.peek( 1 )

        if ( look_44_0 == ID )
          look_44_1 = @input.peek( 2 )

          if ( look_44_1 == T__35 )
            alt_44 = 2
          elsif ( look_44_1 == T__50 )
            alt_44 = 1
          else
            raise NoViableAlternative( "", 44, 1 )
          end
        else
          raise NoViableAlternative( "", 44, 0 )
        end
        case alt_44
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 127:4: ID reference_type
          __ID102__ = match( ID, TOKENS_FOLLOWING_ID_IN_parameter_551 )

          tree_for_ID102 = @adaptor.create_with_payload( __ID102__ )
          @adaptor.add_child( root_0, tree_for_ID102 )

          @state.following.push( TOKENS_FOLLOWING_reference_type_IN_parameter_553 )
          reference_type103 = reference_type
          @state.following.pop
          @adaptor.add_child( root_0, reference_type103.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 128:4: ID 'areall' path
          __ID104__ = match( ID, TOKENS_FOLLOWING_ID_IN_parameter_558 )

          tree_for_ID104 = @adaptor.create_with_payload( __ID104__ )
          @adaptor.add_child( root_0, tree_for_ID104 )

          string_literal105 = match( T__35, TOKENS_FOLLOWING_T__35_IN_parameter_560 )

          tree_for_string_literal105 = @adaptor.create_with_payload( string_literal105 )
          @adaptor.add_child( root_0, tree_for_string_literal105 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_parameter_562 )
          path106 = path
          @state.following.pop
          @adaptor.add_child( root_0, path106.tree )

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
        # trace_out( __method__, 17 )

      end
      
      return return_value
    end

    ConditionsReturnValue = define_return_scope 

    # 
    # parser rule conditions
    # 
    # (in SFP.g)
    # 131:1: conditions : 'conditions' '{' ( NL )* constraint_body '}' ( NL )+ ;
    # 
    def conditions
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      return_value = ConditionsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal107 = nil
      char_literal108 = nil
      __NL109__ = nil
      char_literal111 = nil
      __NL112__ = nil
      constraint_body110 = nil

      tree_for_string_literal107 = nil
      tree_for_char_literal108 = nil
      tree_for_NL109 = nil
      tree_for_char_literal111 = nil
      tree_for_NL112 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 132:4: 'conditions' '{' ( NL )* constraint_body '}' ( NL )+
        string_literal107 = match( T__36, TOKENS_FOLLOWING_T__36_IN_conditions_573 )

        tree_for_string_literal107 = @adaptor.create_with_payload( string_literal107 )
        @adaptor.add_child( root_0, tree_for_string_literal107 )

        char_literal108 = match( T__21, TOKENS_FOLLOWING_T__21_IN_conditions_577 )

        tree_for_char_literal108 = @adaptor.create_with_payload( char_literal108 )
        @adaptor.add_child( root_0, tree_for_char_literal108 )

        # at line 133:7: ( NL )*
        while true # decision 45
          alt_45 = 2
          look_45_0 = @input.peek( 1 )

          if ( look_45_0 == NL )
            alt_45 = 1

          end
          case alt_45
          when 1
            # at line 133:7: NL
            __NL109__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditions_579 )

            tree_for_NL109 = @adaptor.create_with_payload( __NL109__ )
            @adaptor.add_child( root_0, tree_for_NL109 )


          else
            break # out of loop for decision 45
          end
        end # loop for decision 45
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_conditions_582 )
        constraint_body110 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body110.tree )
        char_literal111 = match( T__22, TOKENS_FOLLOWING_T__22_IN_conditions_584 )

        tree_for_char_literal111 = @adaptor.create_with_payload( char_literal111 )
        @adaptor.add_child( root_0, tree_for_char_literal111 )

        # at file 133:31: ( NL )+
        match_count_46 = 0
        while true
          alt_46 = 2
          look_46_0 = @input.peek( 1 )

          if ( look_46_0 == NL )
            alt_46 = 1

          end
          case alt_46
          when 1
            # at line 133:31: NL
            __NL112__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditions_586 )

            tree_for_NL112 = @adaptor.create_with_payload( __NL112__ )
            @adaptor.add_child( root_0, tree_for_NL112 )


          else
            match_count_46 > 0 and break
            eee = EarlyExit(46)


            raise eee
          end
          match_count_46 += 1
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
        # trace_out( __method__, 18 )

      end
      
      return return_value
    end

    EffectsReturnValue = define_return_scope 

    # 
    # parser rule effects
    # 
    # (in SFP.g)
    # 136:1: effects : 'effects' '{' ( NL )* mutation_body '}' ( NL )+ ;
    # 
    def effects
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      return_value = EffectsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal113 = nil
      char_literal114 = nil
      __NL115__ = nil
      char_literal117 = nil
      __NL118__ = nil
      mutation_body116 = nil

      tree_for_string_literal113 = nil
      tree_for_char_literal114 = nil
      tree_for_NL115 = nil
      tree_for_char_literal117 = nil
      tree_for_NL118 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 137:4: 'effects' '{' ( NL )* mutation_body '}' ( NL )+
        string_literal113 = match( T__37, TOKENS_FOLLOWING_T__37_IN_effects_598 )

        tree_for_string_literal113 = @adaptor.create_with_payload( string_literal113 )
        @adaptor.add_child( root_0, tree_for_string_literal113 )

        char_literal114 = match( T__21, TOKENS_FOLLOWING_T__21_IN_effects_602 )

        tree_for_char_literal114 = @adaptor.create_with_payload( char_literal114 )
        @adaptor.add_child( root_0, tree_for_char_literal114 )

        # at line 138:7: ( NL )*
        while true # decision 47
          alt_47 = 2
          look_47_0 = @input.peek( 1 )

          if ( look_47_0 == NL )
            alt_47 = 1

          end
          case alt_47
          when 1
            # at line 138:7: NL
            __NL115__ = match( NL, TOKENS_FOLLOWING_NL_IN_effects_604 )

            tree_for_NL115 = @adaptor.create_with_payload( __NL115__ )
            @adaptor.add_child( root_0, tree_for_NL115 )


          else
            break # out of loop for decision 47
          end
        end # loop for decision 47
        @state.following.push( TOKENS_FOLLOWING_mutation_body_IN_effects_610 )
        mutation_body116 = mutation_body
        @state.following.pop
        @adaptor.add_child( root_0, mutation_body116.tree )
        char_literal117 = match( T__22, TOKENS_FOLLOWING_T__22_IN_effects_615 )

        tree_for_char_literal117 = @adaptor.create_with_payload( char_literal117 )
        @adaptor.add_child( root_0, tree_for_char_literal117 )

        # at file 140:7: ( NL )+
        match_count_48 = 0
        while true
          alt_48 = 2
          look_48_0 = @input.peek( 1 )

          if ( look_48_0 == NL )
            alt_48 = 1

          end
          case alt_48
          when 1
            # at line 140:7: NL
            __NL118__ = match( NL, TOKENS_FOLLOWING_NL_IN_effects_617 )

            tree_for_NL118 = @adaptor.create_with_payload( __NL118__ )
            @adaptor.add_child( root_0, tree_for_NL118 )


          else
            match_count_48 > 0 and break
            eee = EarlyExit(48)


            raise eee
          end
          match_count_48 += 1
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
        # trace_out( __method__, 19 )

      end
      
      return return_value
    end

    ConstraintReturnValue = define_return_scope 

    # 
    # parser rule constraint
    # 
    # (in SFP.g)
    # 143:1: constraint : ID 'constraint' '{' ( NL )* constraint_body '}' ( NL )+ ;
    # 
    def constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = ConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID119__ = nil
      string_literal120 = nil
      char_literal121 = nil
      __NL122__ = nil
      char_literal124 = nil
      __NL125__ = nil
      constraint_body123 = nil

      tree_for_ID119 = nil
      tree_for_string_literal120 = nil
      tree_for_char_literal121 = nil
      tree_for_NL122 = nil
      tree_for_char_literal124 = nil
      tree_for_NL125 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 144:4: ID 'constraint' '{' ( NL )* constraint_body '}' ( NL )+
        __ID119__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_629 )

        tree_for_ID119 = @adaptor.create_with_payload( __ID119__ )
        @adaptor.add_child( root_0, tree_for_ID119 )

        string_literal120 = match( T__38, TOKENS_FOLLOWING_T__38_IN_constraint_631 )

        tree_for_string_literal120 = @adaptor.create_with_payload( string_literal120 )
        @adaptor.add_child( root_0, tree_for_string_literal120 )

        char_literal121 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_635 )

        tree_for_char_literal121 = @adaptor.create_with_payload( char_literal121 )
        @adaptor.add_child( root_0, tree_for_char_literal121 )

        # at line 145:7: ( NL )*
        while true # decision 49
          alt_49 = 2
          look_49_0 = @input.peek( 1 )

          if ( look_49_0 == NL )
            alt_49 = 1

          end
          case alt_49
          when 1
            # at line 145:7: NL
            __NL122__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_637 )

            tree_for_NL122 = @adaptor.create_with_payload( __NL122__ )
            @adaptor.add_child( root_0, tree_for_NL122 )


          else
            break # out of loop for decision 49
          end
        end # loop for decision 49
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_constraint_640 )
        constraint_body123 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body123.tree )
        char_literal124 = match( T__22, TOKENS_FOLLOWING_T__22_IN_constraint_642 )

        tree_for_char_literal124 = @adaptor.create_with_payload( char_literal124 )
        @adaptor.add_child( root_0, tree_for_char_literal124 )

        # at file 145:31: ( NL )+
        match_count_50 = 0
        while true
          alt_50 = 2
          look_50_0 = @input.peek( 1 )

          if ( look_50_0 == NL )
            alt_50 = 1

          end
          case alt_50
          when 1
            # at line 145:31: NL
            __NL125__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_644 )

            tree_for_NL125 = @adaptor.create_with_payload( __NL125__ )
            @adaptor.add_child( root_0, tree_for_NL125 )


          else
            match_count_50 > 0 and break
            eee = EarlyExit(50)


            raise eee
          end
          match_count_50 += 1
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
        # trace_out( __method__, 20 )

      end
      
      return return_value
    end

    ConstraintBodyReturnValue = define_return_scope 

    # 
    # parser rule constraint_body
    # 
    # (in SFP.g)
    # 148:1: constraint_body : ( ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+ )* ;
    # 
    def constraint_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = ConstraintBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL129__ = nil
      constraint_statement126 = nil
      constraint_namespace127 = nil
      constraint_iterator128 = nil

      tree_for_NL129 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 149:4: ( ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+ )*
        # at line 149:4: ( ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+ )*
        while true # decision 53
          alt_53 = 2
          look_53_0 = @input.peek( 1 )

          if ( look_53_0 == ID || look_53_0 == T__27 || look_53_0 == T__39 )
            alt_53 = 1

          end
          case alt_53
          when 1
            # at line 150:4: ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+
            # at line 150:4: ( constraint_statement | constraint_namespace | constraint_iterator )
            alt_51 = 3
            alt_51 = @dfa51.predict( @input )
            case alt_51
            when 1
              # at line 150:5: constraint_statement
              @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_662 )
              constraint_statement126 = constraint_statement
              @state.following.pop
              @adaptor.add_child( root_0, constraint_statement126.tree )

            when 2
              # at line 151:6: constraint_namespace
              @state.following.push( TOKENS_FOLLOWING_constraint_namespace_IN_constraint_body_669 )
              constraint_namespace127 = constraint_namespace
              @state.following.pop
              @adaptor.add_child( root_0, constraint_namespace127.tree )

            when 3
              # at line 152:6: constraint_iterator
              @state.following.push( TOKENS_FOLLOWING_constraint_iterator_IN_constraint_body_676 )
              constraint_iterator128 = constraint_iterator
              @state.following.pop
              @adaptor.add_child( root_0, constraint_iterator128.tree )

            end
            # at file 154:3: ( NL )+
            match_count_52 = 0
            while true
              alt_52 = 2
              look_52_0 = @input.peek( 1 )

              if ( look_52_0 == NL )
                alt_52 = 1

              end
              case alt_52
              when 1
                # at line 154:3: NL
                __NL129__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_body_685 )

                tree_for_NL129 = @adaptor.create_with_payload( __NL129__ )
                @adaptor.add_child( root_0, tree_for_NL129 )


              else
                match_count_52 > 0 and break
                eee = EarlyExit(52)


                raise eee
              end
              match_count_52 += 1
            end


          else
            break # out of loop for decision 53
          end
        end # loop for decision 53
        # - - - - - - - rule clean up - - - - - - - -
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

    ConstraintNamespaceReturnValue = define_return_scope 

    # 
    # parser rule constraint_namespace
    # 
    # (in SFP.g)
    # 157:1: constraint_namespace : path ( NL )* '{' ( NL )* ( constraint_statement ( NL )+ )* '}' ;
    # 
    def constraint_namespace
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = ConstraintNamespaceReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL131__ = nil
      char_literal132 = nil
      __NL133__ = nil
      __NL135__ = nil
      char_literal136 = nil
      path130 = nil
      constraint_statement134 = nil

      tree_for_NL131 = nil
      tree_for_char_literal132 = nil
      tree_for_NL133 = nil
      tree_for_NL135 = nil
      tree_for_char_literal136 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 158:4: path ( NL )* '{' ( NL )* ( constraint_statement ( NL )+ )* '}'
        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_namespace_699 )
        path130 = path
        @state.following.pop
        @adaptor.add_child( root_0, path130.tree )
        # at line 158:9: ( NL )*
        while true # decision 54
          alt_54 = 2
          look_54_0 = @input.peek( 1 )

          if ( look_54_0 == NL )
            alt_54 = 1

          end
          case alt_54
          when 1
            # at line 158:9: NL
            __NL131__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_701 )

            tree_for_NL131 = @adaptor.create_with_payload( __NL131__ )
            @adaptor.add_child( root_0, tree_for_NL131 )


          else
            break # out of loop for decision 54
          end
        end # loop for decision 54
        char_literal132 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_namespace_704 )

        tree_for_char_literal132 = @adaptor.create_with_payload( char_literal132 )
        @adaptor.add_child( root_0, tree_for_char_literal132 )

        # at line 158:17: ( NL )*
        while true # decision 55
          alt_55 = 2
          look_55_0 = @input.peek( 1 )

          if ( look_55_0 == NL )
            alt_55 = 1

          end
          case alt_55
          when 1
            # at line 158:17: NL
            __NL133__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_706 )

            tree_for_NL133 = @adaptor.create_with_payload( __NL133__ )
            @adaptor.add_child( root_0, tree_for_NL133 )


          else
            break # out of loop for decision 55
          end
        end # loop for decision 55
        # at line 158:21: ( constraint_statement ( NL )+ )*
        while true # decision 57
          alt_57 = 2
          look_57_0 = @input.peek( 1 )

          if ( look_57_0 == ID || look_57_0 == T__27 )
            alt_57 = 1

          end
          case alt_57
          when 1
            # at line 158:22: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_namespace_710 )
            constraint_statement134 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement134.tree )
            # at file 159:3: ( NL )+
            match_count_56 = 0
            while true
              alt_56 = 2
              look_56_0 = @input.peek( 1 )

              if ( look_56_0 == NL )
                alt_56 = 1

              end
              case alt_56
              when 1
                # at line 159:3: NL
                __NL135__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_714 )

                tree_for_NL135 = @adaptor.create_with_payload( __NL135__ )
                @adaptor.add_child( root_0, tree_for_NL135 )


              else
                match_count_56 > 0 and break
                eee = EarlyExit(56)


                raise eee
              end
              match_count_56 += 1
            end


          else
            break # out of loop for decision 57
          end
        end # loop for decision 57
        char_literal136 = match( T__22, TOKENS_FOLLOWING_T__22_IN_constraint_namespace_719 )

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
        # trace_out( __method__, 22 )

      end
      
      return return_value
    end

    ConstraintIteratorReturnValue = define_return_scope 

    # 
    # parser rule constraint_iterator
    # 
    # (in SFP.g)
    # 162:1: constraint_iterator : 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ )* '}' ;
    # 
    def constraint_iterator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
      return_value = ConstraintIteratorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal137 = nil
      string_literal139 = nil
      __ID140__ = nil
      __NL141__ = nil
      char_literal142 = nil
      __NL143__ = nil
      __NL145__ = nil
      char_literal146 = nil
      path138 = nil
      constraint_statement144 = nil

      tree_for_string_literal137 = nil
      tree_for_string_literal139 = nil
      tree_for_ID140 = nil
      tree_for_NL141 = nil
      tree_for_char_literal142 = nil
      tree_for_NL143 = nil
      tree_for_NL145 = nil
      tree_for_char_literal146 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 163:4: 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ )* '}'
        string_literal137 = match( T__39, TOKENS_FOLLOWING_T__39_IN_constraint_iterator_730 )

        tree_for_string_literal137 = @adaptor.create_with_payload( string_literal137 )
        @adaptor.add_child( root_0, tree_for_string_literal137 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_iterator_732 )
        path138 = path
        @state.following.pop
        @adaptor.add_child( root_0, path138.tree )
        string_literal139 = match( T__40, TOKENS_FOLLOWING_T__40_IN_constraint_iterator_734 )

        tree_for_string_literal139 = @adaptor.create_with_payload( string_literal139 )
        @adaptor.add_child( root_0, tree_for_string_literal139 )

        __ID140__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_iterator_736 )

        tree_for_ID140 = @adaptor.create_with_payload( __ID140__ )
        @adaptor.add_child( root_0, tree_for_ID140 )

        # at line 163:27: ( NL )*
        while true # decision 58
          alt_58 = 2
          look_58_0 = @input.peek( 1 )

          if ( look_58_0 == NL )
            alt_58 = 1

          end
          case alt_58
          when 1
            # at line 163:27: NL
            __NL141__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_738 )

            tree_for_NL141 = @adaptor.create_with_payload( __NL141__ )
            @adaptor.add_child( root_0, tree_for_NL141 )


          else
            break # out of loop for decision 58
          end
        end # loop for decision 58
        char_literal142 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_iterator_741 )

        tree_for_char_literal142 = @adaptor.create_with_payload( char_literal142 )
        @adaptor.add_child( root_0, tree_for_char_literal142 )

        # at file 163:35: ( NL )+
        match_count_59 = 0
        while true
          alt_59 = 2
          look_59_0 = @input.peek( 1 )

          if ( look_59_0 == NL )
            alt_59 = 1

          end
          case alt_59
          when 1
            # at line 163:35: NL
            __NL143__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_743 )

            tree_for_NL143 = @adaptor.create_with_payload( __NL143__ )
            @adaptor.add_child( root_0, tree_for_NL143 )


          else
            match_count_59 > 0 and break
            eee = EarlyExit(59)


            raise eee
          end
          match_count_59 += 1
        end

        # at line 164:3: ( constraint_statement ( NL )+ )*
        while true # decision 61
          alt_61 = 2
          look_61_0 = @input.peek( 1 )

          if ( look_61_0 == ID || look_61_0 == T__27 )
            alt_61 = 1

          end
          case alt_61
          when 1
            # at line 164:4: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_iterator_749 )
            constraint_statement144 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement144.tree )
            # at file 165:3: ( NL )+
            match_count_60 = 0
            while true
              alt_60 = 2
              look_60_0 = @input.peek( 1 )

              if ( look_60_0 == NL )
                alt_60 = 1

              end
              case alt_60
              when 1
                # at line 165:3: NL
                __NL145__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_753 )

                tree_for_NL145 = @adaptor.create_with_payload( __NL145__ )
                @adaptor.add_child( root_0, tree_for_NL145 )


              else
                match_count_60 > 0 and break
                eee = EarlyExit(60)


                raise eee
              end
              match_count_60 += 1
            end


          else
            break # out of loop for decision 61
          end
        end # loop for decision 61
        char_literal146 = match( T__22, TOKENS_FOLLOWING_T__22_IN_constraint_iterator_760 )

        tree_for_char_literal146 = @adaptor.create_with_payload( char_literal146 )
        @adaptor.add_child( root_0, tree_for_char_literal146 )

        # - - - - - - - rule clean up - - - - - - - -
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

    ConstraintStatementReturnValue = define_return_scope :key, :val

    # 
    # parser rule constraint_statement
    # 
    # (in SFP.g)
    # 169:1: constraint_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | conditional_constraint | reference binary_comp comp_value );
    # 
    def constraint_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = ConstraintStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL152__ = nil
      __NULL158__ = nil
      string_literal160 = nil
      string_literal161 = nil
      set164 = nil
      string_literal165 = nil
      reference147 = nil
      equals_op148 = nil
      value149 = nil
      reference150 = nil
      equals_op151 = nil
      reference153 = nil
      not_equals_op154 = nil
      value155 = nil
      reference156 = nil
      not_equals_op157 = nil
      reference159 = nil
      set_value162 = nil
      reference163 = nil
      set_value166 = nil
      conditional_constraint167 = nil
      reference168 = nil
      binary_comp169 = nil
      comp_value170 = nil

      tree_for_NULL152 = nil
      tree_for_NULL158 = nil
      tree_for_string_literal160 = nil
      tree_for_string_literal161 = nil
      tree_for_set164 = nil
      tree_for_string_literal165 = nil

      begin
        # at line 170:2: ( reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | conditional_constraint | reference binary_comp comp_value )
        alt_63 = 8
        alt_63 = @dfa63.predict( @input )
        case alt_63
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 170:4: reference equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_775 )
          reference147 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference147.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_constraint_statement_777 )
          equals_op148 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op148.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_779 )
          value149 = value
          @state.following.pop
          @adaptor.add_child( root_0, value149.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 171:4: reference equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_784 )
          reference150 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference150.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_constraint_statement_786 )
          equals_op151 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op151.tree )
          __NULL152__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_constraint_statement_788 )

          tree_for_NULL152 = @adaptor.create_with_payload( __NULL152__ )
          @adaptor.add_child( root_0, tree_for_NULL152 )


        when 3
          root_0 = @adaptor.create_flat_list


          # at line 172:4: reference not_equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_793 )
          reference153 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference153.tree )
          @state.following.push( TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_795 )
          not_equals_op154 = not_equals_op
          @state.following.pop
          @adaptor.add_child( root_0, not_equals_op154.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_797 )
          value155 = value
          @state.following.pop
          @adaptor.add_child( root_0, value155.tree )

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 173:4: reference not_equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_802 )
          reference156 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference156.tree )
          @state.following.push( TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_804 )
          not_equals_op157 = not_equals_op
          @state.following.pop
          @adaptor.add_child( root_0, not_equals_op157.tree )
          __NULL158__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_constraint_statement_806 )

          tree_for_NULL158 = @adaptor.create_with_payload( __NULL158__ )
          @adaptor.add_child( root_0, tree_for_NULL158 )


        when 5
          root_0 = @adaptor.create_flat_list


          # at line 174:4: reference ( 'is' )? 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_811 )
          reference159 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference159.tree )
          # at line 174:14: ( 'is' )?
          alt_62 = 2
          look_62_0 = @input.peek( 1 )

          if ( look_62_0 == T__41 )
            alt_62 = 1
          end
          case alt_62
          when 1
            # at line 174:14: 'is'
            string_literal160 = match( T__41, TOKENS_FOLLOWING_T__41_IN_constraint_statement_813 )

            tree_for_string_literal160 = @adaptor.create_with_payload( string_literal160 )
            @adaptor.add_child( root_0, tree_for_string_literal160 )


          end
          string_literal161 = match( T__42, TOKENS_FOLLOWING_T__42_IN_constraint_statement_816 )

          tree_for_string_literal161 = @adaptor.create_with_payload( string_literal161 )
          @adaptor.add_child( root_0, tree_for_string_literal161 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_818 )
          set_value162 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value162.tree )

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 175:4: reference ( 'isnt' | 'not' ) 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_823 )
          reference163 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference163.tree )
          set164 = @input.look
          if @input.peek( 1 ).between?( T__43, T__44 )
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set164 ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          string_literal165 = match( T__42, TOKENS_FOLLOWING_T__42_IN_constraint_statement_831 )

          tree_for_string_literal165 = @adaptor.create_with_payload( string_literal165 )
          @adaptor.add_child( root_0, tree_for_string_literal165 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_833 )
          set_value166 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value166.tree )

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 176:4: conditional_constraint
          @state.following.push( TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_838 )
          conditional_constraint167 = conditional_constraint
          @state.following.pop
          @adaptor.add_child( root_0, conditional_constraint167.tree )

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 177:4: reference binary_comp comp_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_843 )
          reference168 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference168.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_845 )
          binary_comp169 = binary_comp
          @state.following.pop
          @adaptor.add_child( root_0, binary_comp169.tree )
          @state.following.push( TOKENS_FOLLOWING_comp_value_IN_constraint_statement_847 )
          comp_value170 = comp_value
          @state.following.pop
          @adaptor.add_child( root_0, comp_value170.tree )

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
        # trace_out( __method__, 24 )

      end
      
      return return_value
    end

    CompValueReturnValue = define_return_scope :val

    # 
    # parser rule comp_value
    # 
    # (in SFP.g)
    # 180:1: comp_value returns [val] : ( NUMBER | reference );
    # 
    def comp_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = CompValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NUMBER171__ = nil
      reference172 = nil

      tree_for_NUMBER171 = nil

      begin
        # at line 181:2: ( NUMBER | reference )
        alt_64 = 2
        look_64_0 = @input.peek( 1 )

        if ( look_64_0 == NUMBER )
          alt_64 = 1
        elsif ( look_64_0 == ID )
          alt_64 = 2
        else
          raise NoViableAlternative( "", 64, 0 )
        end
        case alt_64
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 181:4: NUMBER
          __NUMBER171__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_comp_value_862 )

          tree_for_NUMBER171 = @adaptor.create_with_payload( __NUMBER171__ )
          @adaptor.add_child( root_0, tree_for_NUMBER171 )


        when 2
          root_0 = @adaptor.create_flat_list


          # at line 182:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_comp_value_867 )
          reference172 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference172.tree )

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

    ConditionalConstraintReturnValue = define_return_scope 

    # 
    # parser rule conditional_constraint
    # 
    # (in SFP.g)
    # 185:1: conditional_constraint : 'if' constraint_statement ( NL )* conditional_constraint_then ;
    # 
    def conditional_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = ConditionalConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal173 = nil
      __NL175__ = nil
      constraint_statement174 = nil
      conditional_constraint_then176 = nil

      tree_for_string_literal173 = nil
      tree_for_NL175 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 186:4: 'if' constraint_statement ( NL )* conditional_constraint_then
        string_literal173 = match( T__27, TOKENS_FOLLOWING_T__27_IN_conditional_constraint_878 )

        tree_for_string_literal173 = @adaptor.create_with_payload( string_literal173 )
        @adaptor.add_child( root_0, tree_for_string_literal173 )

        @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_882 )
        constraint_statement174 = constraint_statement
        @state.following.pop
        @adaptor.add_child( root_0, constraint_statement174.tree )
        # at line 187:24: ( NL )*
        while true # decision 65
          alt_65 = 2
          look_65_0 = @input.peek( 1 )

          if ( look_65_0 == NL )
            alt_65 = 1

          end
          case alt_65
          when 1
            # at line 187:24: NL
            __NL175__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditional_constraint_884 )

            tree_for_NL175 = @adaptor.create_with_payload( __NL175__ )
            @adaptor.add_child( root_0, tree_for_NL175 )


          else
            break # out of loop for decision 65
          end
        end # loop for decision 65
        @state.following.push( TOKENS_FOLLOWING_conditional_constraint_then_IN_conditional_constraint_889 )
        conditional_constraint_then176 = conditional_constraint_then
        @state.following.pop
        @adaptor.add_child( root_0, conditional_constraint_then176.tree )
        # - - - - - - - rule clean up - - - - - - - -
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

    ConditionalConstraintThenReturnValue = define_return_scope 

    # 
    # parser rule conditional_constraint_then
    # 
    # (in SFP.g)
    # 191:1: conditional_constraint_then : 'then' constraint_statement ;
    # 
    def conditional_constraint_then
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = ConditionalConstraintThenReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal177 = nil
      constraint_statement178 = nil

      tree_for_string_literal177 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 192:4: 'then' constraint_statement
        string_literal177 = match( T__28, TOKENS_FOLLOWING_T__28_IN_conditional_constraint_then_900 )

        tree_for_string_literal177 = @adaptor.create_with_payload( string_literal177 )
        @adaptor.add_child( root_0, tree_for_string_literal177 )

        @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_902 )
        constraint_statement178 = constraint_statement
        @state.following.pop
        @adaptor.add_child( root_0, constraint_statement178.tree )
        # - - - - - - - rule clean up - - - - - - - -
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

    MutationBodyReturnValue = define_return_scope 

    # 
    # parser rule mutation_body
    # 
    # (in SFP.g)
    # 195:1: mutation_body : ( ( mutation_statement | mutation_iterator ) ( NL )+ )* ;
    # 
    def mutation_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = MutationBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL181__ = nil
      mutation_statement179 = nil
      mutation_iterator180 = nil

      tree_for_NL181 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 196:4: ( ( mutation_statement | mutation_iterator ) ( NL )+ )*
        # at line 196:4: ( ( mutation_statement | mutation_iterator ) ( NL )+ )*
        while true # decision 68
          alt_68 = 2
          look_68_0 = @input.peek( 1 )

          if ( look_68_0 == ID || look_68_0 == T__39 || look_68_0 == T__46 )
            alt_68 = 1

          end
          case alt_68
          when 1
            # at line 197:4: ( mutation_statement | mutation_iterator ) ( NL )+
            # at line 197:4: ( mutation_statement | mutation_iterator )
            alt_66 = 2
            look_66_0 = @input.peek( 1 )

            if ( look_66_0 == ID || look_66_0 == T__46 )
              alt_66 = 1
            elsif ( look_66_0 == T__39 )
              alt_66 = 2
            else
              raise NoViableAlternative( "", 66, 0 )
            end
            case alt_66
            when 1
              # at line 197:6: mutation_statement
              @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_mutation_body_920 )
              mutation_statement179 = mutation_statement
              @state.following.pop
              @adaptor.add_child( root_0, mutation_statement179.tree )

            when 2
              # at line 198:6: mutation_iterator
              @state.following.push( TOKENS_FOLLOWING_mutation_iterator_IN_mutation_body_927 )
              mutation_iterator180 = mutation_iterator
              @state.following.pop
              @adaptor.add_child( root_0, mutation_iterator180.tree )

            end
            # at file 200:3: ( NL )+
            match_count_67 = 0
            while true
              alt_67 = 2
              look_67_0 = @input.peek( 1 )

              if ( look_67_0 == NL )
                alt_67 = 1

              end
              case alt_67
              when 1
                # at line 200:3: NL
                __NL181__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_body_936 )

                tree_for_NL181 = @adaptor.create_with_payload( __NL181__ )
                @adaptor.add_child( root_0, tree_for_NL181 )


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
        # trace_out( __method__, 28 )

      end
      
      return return_value
    end

    MutationIteratorReturnValue = define_return_scope 

    # 
    # parser rule mutation_iterator
    # 
    # (in SFP.g)
    # 203:1: mutation_iterator : 'foreach' ID ( NL )* '{' ( NL )+ ( mutation_statement ( NL )+ )* '}' ;
    # 
    def mutation_iterator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = MutationIteratorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal182 = nil
      __ID183__ = nil
      __NL184__ = nil
      char_literal185 = nil
      __NL186__ = nil
      __NL188__ = nil
      char_literal189 = nil
      mutation_statement187 = nil

      tree_for_string_literal182 = nil
      tree_for_ID183 = nil
      tree_for_NL184 = nil
      tree_for_char_literal185 = nil
      tree_for_NL186 = nil
      tree_for_NL188 = nil
      tree_for_char_literal189 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 204:4: 'foreach' ID ( NL )* '{' ( NL )+ ( mutation_statement ( NL )+ )* '}'
        string_literal182 = match( T__39, TOKENS_FOLLOWING_T__39_IN_mutation_iterator_951 )

        tree_for_string_literal182 = @adaptor.create_with_payload( string_literal182 )
        @adaptor.add_child( root_0, tree_for_string_literal182 )

        __ID183__ = match( ID, TOKENS_FOLLOWING_ID_IN_mutation_iterator_953 )

        tree_for_ID183 = @adaptor.create_with_payload( __ID183__ )
        @adaptor.add_child( root_0, tree_for_ID183 )

        # at line 204:17: ( NL )*
        while true # decision 69
          alt_69 = 2
          look_69_0 = @input.peek( 1 )

          if ( look_69_0 == NL )
            alt_69 = 1

          end
          case alt_69
          when 1
            # at line 204:17: NL
            __NL184__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_955 )

            tree_for_NL184 = @adaptor.create_with_payload( __NL184__ )
            @adaptor.add_child( root_0, tree_for_NL184 )


          else
            break # out of loop for decision 69
          end
        end # loop for decision 69
        char_literal185 = match( T__21, TOKENS_FOLLOWING_T__21_IN_mutation_iterator_958 )

        tree_for_char_literal185 = @adaptor.create_with_payload( char_literal185 )
        @adaptor.add_child( root_0, tree_for_char_literal185 )

        # at file 204:25: ( NL )+
        match_count_70 = 0
        while true
          alt_70 = 2
          look_70_0 = @input.peek( 1 )

          if ( look_70_0 == NL )
            alt_70 = 1

          end
          case alt_70
          when 1
            # at line 204:25: NL
            __NL186__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_960 )

            tree_for_NL186 = @adaptor.create_with_payload( __NL186__ )
            @adaptor.add_child( root_0, tree_for_NL186 )


          else
            match_count_70 > 0 and break
            eee = EarlyExit(70)


            raise eee
          end
          match_count_70 += 1
        end

        # at line 205:3: ( mutation_statement ( NL )+ )*
        while true # decision 72
          alt_72 = 2
          look_72_0 = @input.peek( 1 )

          if ( look_72_0 == ID || look_72_0 == T__46 )
            alt_72 = 1

          end
          case alt_72
          when 1
            # at line 205:4: mutation_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_mutation_iterator_966 )
            mutation_statement187 = mutation_statement
            @state.following.pop
            @adaptor.add_child( root_0, mutation_statement187.tree )
            # at file 206:3: ( NL )+
            match_count_71 = 0
            while true
              alt_71 = 2
              look_71_0 = @input.peek( 1 )

              if ( look_71_0 == NL )
                alt_71 = 1

              end
              case alt_71
              when 1
                # at line 206:3: NL
                __NL188__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_970 )

                tree_for_NL188 = @adaptor.create_with_payload( __NL188__ )
                @adaptor.add_child( root_0, tree_for_NL188 )


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
        char_literal189 = match( T__22, TOKENS_FOLLOWING_T__22_IN_mutation_iterator_977 )

        tree_for_char_literal189 = @adaptor.create_with_payload( char_literal189 )
        @adaptor.add_child( root_0, tree_for_char_literal189 )

        # - - - - - - - rule clean up - - - - - - - -
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

    MutationStatementReturnValue = define_return_scope :key, :val

    # 
    # parser rule mutation_statement
    # 
    # (in SFP.g)
    # 210:1: mutation_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' );
    # 
    def mutation_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = MutationStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL195__ = nil
      __NUMBER198__ = nil
      string_literal200 = nil
      string_literal201 = nil
      string_literal204 = nil
      string_literal207 = nil
      char_literal209 = nil
      string_literal211 = nil
      char_literal213 = nil
      reference190 = nil
      equals_op191 = nil
      value192 = nil
      reference193 = nil
      equals_op194 = nil
      reference196 = nil
      binary_op197 = nil
      reference199 = nil
      path202 = nil
      object_body203 = nil
      path205 = nil
      reference206 = nil
      value208 = nil
      reference210 = nil
      value212 = nil

      tree_for_NULL195 = nil
      tree_for_NUMBER198 = nil
      tree_for_string_literal200 = nil
      tree_for_string_literal201 = nil
      tree_for_string_literal204 = nil
      tree_for_string_literal207 = nil
      tree_for_char_literal209 = nil
      tree_for_string_literal211 = nil
      tree_for_char_literal213 = nil

      begin
        # at line 211:2: ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' )
        alt_74 = 7
        alt_74 = @dfa74.predict( @input )
        case alt_74
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 211:4: reference equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_992 )
          reference190 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference190.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_mutation_statement_994 )
          equals_op191 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op191.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_996 )
          value192 = value
          @state.following.pop
          @adaptor.add_child( root_0, value192.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 212:4: reference equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1001 )
          reference193 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference193.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_mutation_statement_1003 )
          equals_op194 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op194.tree )
          __NULL195__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_mutation_statement_1005 )

          tree_for_NULL195 = @adaptor.create_with_payload( __NULL195__ )
          @adaptor.add_child( root_0, tree_for_NULL195 )


        when 3
          root_0 = @adaptor.create_flat_list


          # at line 213:4: reference binary_op NUMBER
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1010 )
          reference196 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference196.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_op_IN_mutation_statement_1012 )
          binary_op197 = binary_op
          @state.following.pop
          @adaptor.add_child( root_0, binary_op197.tree )
          __NUMBER198__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_mutation_statement_1014 )

          tree_for_NUMBER198 = @adaptor.create_with_payload( __NUMBER198__ )
          @adaptor.add_child( root_0, tree_for_NUMBER198 )


        when 4
          root_0 = @adaptor.create_flat_list


          # at line 214:4: reference 'is' 'new' path ( object_body )?
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1019 )
          reference199 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference199.tree )
          string_literal200 = match( T__41, TOKENS_FOLLOWING_T__41_IN_mutation_statement_1021 )

          tree_for_string_literal200 = @adaptor.create_with_payload( string_literal200 )
          @adaptor.add_child( root_0, tree_for_string_literal200 )

          string_literal201 = match( T__45, TOKENS_FOLLOWING_T__45_IN_mutation_statement_1023 )

          tree_for_string_literal201 = @adaptor.create_with_payload( string_literal201 )
          @adaptor.add_child( root_0, tree_for_string_literal201 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_statement_1025 )
          path202 = path
          @state.following.pop
          @adaptor.add_child( root_0, path202.tree )
          # at line 215:3: ( object_body )?
          alt_73 = 2
          look_73_0 = @input.peek( 1 )

          if ( look_73_0 == T__21 )
            alt_73 = 1
          end
          case alt_73
          when 1
            # at line 215:3: object_body
            @state.following.push( TOKENS_FOLLOWING_object_body_IN_mutation_statement_1029 )
            object_body203 = object_body
            @state.following.pop
            @adaptor.add_child( root_0, object_body203.tree )

          end

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 216:4: 'delete' path
          string_literal204 = match( T__46, TOKENS_FOLLOWING_T__46_IN_mutation_statement_1035 )

          tree_for_string_literal204 = @adaptor.create_with_payload( string_literal204 )
          @adaptor.add_child( root_0, tree_for_string_literal204 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_statement_1037 )
          path205 = path
          @state.following.pop
          @adaptor.add_child( root_0, path205.tree )

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 217:4: reference 'add(' value ')'
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1042 )
          reference206 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference206.tree )
          string_literal207 = match( T__47, TOKENS_FOLLOWING_T__47_IN_mutation_statement_1044 )

          tree_for_string_literal207 = @adaptor.create_with_payload( string_literal207 )
          @adaptor.add_child( root_0, tree_for_string_literal207 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_1046 )
          value208 = value
          @state.following.pop
          @adaptor.add_child( root_0, value208.tree )
          char_literal209 = match( T__34, TOKENS_FOLLOWING_T__34_IN_mutation_statement_1048 )

          tree_for_char_literal209 = @adaptor.create_with_payload( char_literal209 )
          @adaptor.add_child( root_0, tree_for_char_literal209 )


        when 7
          root_0 = @adaptor.create_flat_list


          # at line 218:4: reference 'remove(' value ')'
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1053 )
          reference210 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference210.tree )
          string_literal211 = match( T__48, TOKENS_FOLLOWING_T__48_IN_mutation_statement_1055 )

          tree_for_string_literal211 = @adaptor.create_with_payload( string_literal211 )
          @adaptor.add_child( root_0, tree_for_string_literal211 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_1057 )
          value212 = value
          @state.following.pop
          @adaptor.add_child( root_0, value212.tree )
          char_literal213 = match( T__34, TOKENS_FOLLOWING_T__34_IN_mutation_statement_1059 )

          tree_for_char_literal213 = @adaptor.create_with_payload( char_literal213 )
          @adaptor.add_child( root_0, tree_for_char_literal213 )


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

    SetValueReturnValue = define_return_scope :val

    # 
    # parser rule set_value
    # 
    # (in SFP.g)
    # 221:1: set_value returns [val] : '(' set_item ( ',' set_item )* ')' ;
    # 
    def set_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
      return_value = SetValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal214 = nil
      char_literal216 = nil
      char_literal218 = nil
      set_item215 = nil
      set_item217 = nil

      tree_for_char_literal214 = nil
      tree_for_char_literal216 = nil
      tree_for_char_literal218 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 222:4: '(' set_item ( ',' set_item )* ')'
        char_literal214 = match( T__32, TOKENS_FOLLOWING_T__32_IN_set_value_1074 )

        tree_for_char_literal214 = @adaptor.create_with_payload( char_literal214 )
        @adaptor.add_child( root_0, tree_for_char_literal214 )

        @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_1078 )
        set_item215 = set_item
        @state.following.pop
        @adaptor.add_child( root_0, set_item215.tree )
        # at line 223:12: ( ',' set_item )*
        while true # decision 75
          alt_75 = 2
          look_75_0 = @input.peek( 1 )

          if ( look_75_0 == T__33 )
            alt_75 = 1

          end
          case alt_75
          when 1
            # at line 223:13: ',' set_item
            char_literal216 = match( T__33, TOKENS_FOLLOWING_T__33_IN_set_value_1081 )

            tree_for_char_literal216 = @adaptor.create_with_payload( char_literal216 )
            @adaptor.add_child( root_0, tree_for_char_literal216 )

            @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_1083 )
            set_item217 = set_item
            @state.following.pop
            @adaptor.add_child( root_0, set_item217.tree )

          else
            break # out of loop for decision 75
          end
        end # loop for decision 75
        char_literal218 = match( T__34, TOKENS_FOLLOWING_T__34_IN_set_value_1089 )

        tree_for_char_literal218 = @adaptor.create_with_payload( char_literal218 )
        @adaptor.add_child( root_0, tree_for_char_literal218 )

        # - - - - - - - rule clean up - - - - - - - -
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

    SetItemReturnValue = define_return_scope 

    # 
    # parser rule set_item
    # 
    # (in SFP.g)
    # 227:1: set_item : value ;
    # 
    def set_item
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = SetItemReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      value219 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 228:4: value
        @state.following.push( TOKENS_FOLLOWING_value_IN_set_item_1100 )
        value219 = value
        @state.following.pop
        @adaptor.add_child( root_0, value219.tree )
        # - - - - - - - rule clean up - - - - - - - -
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

    ValueReturnValue = define_return_scope :val

    # 
    # parser rule value
    # 
    # (in SFP.g)
    # 231:1: value returns [val] : ( primitive_value | reference | set_value );
    # 
    def value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
      return_value = ValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      primitive_value220 = nil
      reference221 = nil
      set_value222 = nil


      begin
        # at line 232:2: ( primitive_value | reference | set_value )
        alt_76 = 3
        case look_76 = @input.peek( 1 )
        when STRING, NUMBER, BOOLEAN, MULTILINE_STRING then alt_76 = 1
        when ID then alt_76 = 2
        when T__32 then alt_76 = 3
        else
          raise NoViableAlternative( "", 76, 0 )
        end
        case alt_76
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 232:4: primitive_value
          @state.following.push( TOKENS_FOLLOWING_primitive_value_IN_value_1115 )
          primitive_value220 = primitive_value
          @state.following.pop
          @adaptor.add_child( root_0, primitive_value220.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 233:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_value_1120 )
          reference221 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference221.tree )

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 234:4: set_value
          @state.following.push( TOKENS_FOLLOWING_set_value_IN_value_1125 )
          set_value222 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value222.tree )

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
        # trace_out( __method__, 33 )

      end
      
      return return_value
    end

    PrimitiveValueReturnValue = define_return_scope :val

    # 
    # parser rule primitive_value
    # 
    # (in SFP.g)
    # 237:1: primitive_value returns [val] : ( BOOLEAN | NUMBER | STRING | MULTILINE_STRING );
    # 
    def primitive_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )
      return_value = PrimitiveValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set223 = nil

      tree_for_set223 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set223 = @input.look
        if @input.peek(1) == STRING || @input.peek( 1 ).between?( NUMBER, MULTILINE_STRING )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set223 ) )
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
        # trace_out( __method__, 34 )

      end
      
      return return_value
    end

    PathReturnValue = define_return_scope 

    # 
    # parser rule path
    # 
    # (in SFP.g)
    # 244:1: path : ID ( '.' ID )* ;
    # 
    def path
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
      return_value = PathReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID224__ = nil
      char_literal225 = nil
      __ID226__ = nil

      tree_for_ID224 = nil
      tree_for_char_literal225 = nil
      tree_for_ID226 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 245:4: ID ( '.' ID )*
        __ID224__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_1166 )

        tree_for_ID224 = @adaptor.create_with_payload( __ID224__ )
        @adaptor.add_child( root_0, tree_for_ID224 )

        # at line 245:6: ( '.' ID )*
        while true # decision 77
          alt_77 = 2
          look_77_0 = @input.peek( 1 )

          if ( look_77_0 == T__49 )
            alt_77 = 1

          end
          case alt_77
          when 1
            # at line 245:7: '.' ID
            char_literal225 = match( T__49, TOKENS_FOLLOWING_T__49_IN_path_1168 )

            tree_for_char_literal225 = @adaptor.create_with_payload( char_literal225 )
            @adaptor.add_child( root_0, tree_for_char_literal225 )

            __ID226__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_1169 )

            tree_for_ID226 = @adaptor.create_with_payload( __ID226__ )
            @adaptor.add_child( root_0, tree_for_ID226 )


          else
            break # out of loop for decision 77
          end
        end # loop for decision 77
        # - - - - - - - rule clean up - - - - - - - -
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

    ReferenceReturnValue = define_return_scope :val

    # 
    # parser rule reference
    # 
    # (in SFP.g)
    # 248:1: reference returns [val] : path ;
    # 
    def reference
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
      return_value = ReferenceReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      path227 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 249:4: path
        @state.following.push( TOKENS_FOLLOWING_path_IN_reference_1186 )
        path227 = path
        @state.following.pop
        @adaptor.add_child( root_0, path227.tree )
        # - - - - - - - rule clean up - - - - - - - -
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

    ReferenceTypeReturnValue = define_return_scope :val

    # 
    # parser rule reference_type
    # 
    # (in SFP.g)
    # 252:1: reference_type returns [val] : 'isref' path ;
    # 
    def reference_type
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )
      return_value = ReferenceTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal228 = nil
      path229 = nil

      tree_for_string_literal228 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 253:4: 'isref' path
        string_literal228 = match( T__50, TOKENS_FOLLOWING_T__50_IN_reference_type_1201 )

        tree_for_string_literal228 = @adaptor.create_with_payload( string_literal228 )
        @adaptor.add_child( root_0, tree_for_string_literal228 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_reference_type_1203 )
        path229 = path
        @state.following.pop
        @adaptor.add_child( root_0, path229.tree )
        # - - - - - - - rule clean up - - - - - - - -
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

    EqualsOpReturnValue = define_return_scope 

    # 
    # parser rule equals_op
    # 
    # (in SFP.g)
    # 256:1: equals_op : ( '=' | 'is' );
    # 
    def equals_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )
      return_value = EqualsOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set230 = nil

      tree_for_set230 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set230 = @input.look
        if @input.peek(1) == T__41 || @input.peek(1) == T__51
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set230 ) )
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
        # trace_out( __method__, 38 )

      end
      
      return return_value
    end

    NotEqualsOpReturnValue = define_return_scope 

    # 
    # parser rule not_equals_op
    # 
    # (in SFP.g)
    # 261:1: not_equals_op : ( '!=' | 'isnt' );
    # 
    def not_equals_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )
      return_value = NotEqualsOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set231 = nil

      tree_for_set231 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set231 = @input.look
        if @input.peek(1) == T__43 || @input.peek(1) == T__52
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set231 ) )
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
        # trace_out( __method__, 39 )

      end
      
      return return_value
    end

    BinaryOpReturnValue = define_return_scope 

    # 
    # parser rule binary_op
    # 
    # (in SFP.g)
    # 266:1: binary_op : ( '+=' | '-=' | '*=' | '/=' );
    # 
    def binary_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )
      return_value = BinaryOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set232 = nil

      tree_for_set232 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set232 = @input.look
        if @input.peek( 1 ).between?( T__53, T__56 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set232 ) )
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
        # trace_out( __method__, 40 )

      end
      
      return return_value
    end

    BinaryCompReturnValue = define_return_scope 

    # 
    # parser rule binary_comp
    # 
    # (in SFP.g)
    # 273:1: binary_comp : ( '>' | '>=' | '<' | '<=' );
    # 
    def binary_comp
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )
      return_value = BinaryCompReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set233 = nil

      tree_for_set233 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set233 = @input.look
        if @input.peek( 1 ).between?( T__57, T__60 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set233 ) )
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
        # trace_out( __method__, 41 )

      end
      
      return return_value
    end



    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA34 < ANTLR3::DFA
      EOT = unpack( 4, -1 )
      EOF = unpack( 4, -1 )
      MIN = unpack( 2, 4, 2, -1 )
      MAX = unpack( 2, 29, 2, -1 )
      ACCEPT = unpack( 2, -1, 1, 1, 1, 2 )
      SPECIAL = unpack( 4, -1 )
      TRANSITION = [
        unpack( 1, 1, 24, -1, 1, 2 ),
        unpack( 1, 1, 1, -1, 1, 3, 15, -1, 1, 3, 4, -1, 1, 3, 1, -1, 1, 
                 2 ),
        unpack(  ),
        unpack(  )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 34
      

      def description
        <<-'__dfa_description__'.strip!
          ()* loopback of 100:3: ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )*
        __dfa_description__
      end
    end
    class DFA51 < ANTLR3::DFA
      EOT = unpack( 7, -1 )
      EOF = unpack( 7, -1 )
      MIN = unpack( 1, 6, 1, 4, 2, -1, 1, 6, 1, -1, 1, 4 )
      MAX = unpack( 1, 39, 1, 60, 2, -1, 1, 6, 1, -1, 1, 60 )
      ACCEPT = unpack( 2, -1, 1, 1, 1, 3, 1, -1, 1, 2, 1, -1 )
      SPECIAL = unpack( 7, -1 )
      TRANSITION = [
        unpack( 1, 1, 20, -1, 1, 2, 11, -1, 1, 3 ),
        unpack( 1, 5, 16, -1, 1, 5, 19, -1, 4, 2, 4, -1, 1, 4, 1, -1, 2, 
                 2, 4, -1, 4, 2 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 6 ),
        unpack(  ),
        unpack( 1, 5, 16, -1, 1, 5, 19, -1, 4, 2, 4, -1, 1, 4, 1, -1, 2, 
                 2, 4, -1, 4, 2 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 51
      

      def description
        <<-'__dfa_description__'.strip!
          150:4: ( constraint_statement | constraint_namespace | constraint_iterator )
        __dfa_description__
      end
    end
    class DFA63 < ANTLR3::DFA
      EOT = unpack( 16, -1 )
      EOF = unpack( 16, -1 )
      MIN = unpack( 1, 6, 1, 41, 1, -1, 1, 6, 3, 5, 1, -1, 1, 5, 2, -1, 
                    1, 41, 4, -1 )
      MAX = unpack( 1, 27, 1, 60, 1, -1, 1, 6, 2, 42, 1, 32, 1, -1, 1, 32, 
                    2, -1, 1, 60, 4, -1 )
      ACCEPT = unpack( 2, -1, 1, 7, 4, -1, 1, 5, 1, -1, 1, 6, 1, 8, 1, -1, 
                       1, 1, 1, 2, 1, 3, 1, 4 )
      SPECIAL = unpack( 16, -1 )
      TRANSITION = [
        unpack( 1, 1, 20, -1, 1, 2 ),
        unpack( 1, 4, 1, 7, 1, 5, 1, 9, 4, -1, 1, 3, 1, -1, 1, 6, 1, 8, 
                 4, -1, 4, 10 ),
        unpack(  ),
        unpack( 1, 11 ),
        unpack( 2, 12, 1, 13, 3, 12, 21, -1, 1, 12, 9, -1, 1, 7 ),
        unpack( 2, 14, 1, 15, 3, 14, 21, -1, 1, 14, 9, -1, 1, 9 ),
        unpack( 2, 12, 1, 13, 3, 12, 21, -1, 1, 12 ),
        unpack(  ),
        unpack( 2, 14, 1, 15, 3, 14, 21, -1, 1, 14 ),
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
      
      @decision = 63
      

      def description
        <<-'__dfa_description__'.strip!
          169:1: constraint_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | conditional_constraint | reference binary_comp comp_value );
        __dfa_description__
      end
    end
    class DFA74 < ANTLR3::DFA
      EOT = unpack( 13, -1 )
      EOF = unpack( 13, -1 )
      MIN = unpack( 1, 6, 1, 41, 1, -1, 1, 6, 1, 5, 1, -1, 1, 5, 2, -1, 
                    1, 41, 3, -1 )
      MAX = unpack( 1, 46, 1, 56, 1, -1, 1, 6, 1, 45, 1, -1, 1, 32, 2, -1, 
                    1, 56, 3, -1 )
      ACCEPT = unpack( 2, -1, 1, 5, 2, -1, 1, 3, 1, -1, 1, 6, 1, 7, 1, -1, 
                       1, 4, 1, 1, 1, 2 )
      SPECIAL = unpack( 13, -1 )
      TRANSITION = [
        unpack( 1, 1, 39, -1, 1, 2 ),
        unpack( 1, 4, 5, -1, 1, 7, 1, 8, 1, 3, 1, -1, 1, 6, 1, -1, 4, 5 ),
        unpack(  ),
        unpack( 1, 9 ),
        unpack( 2, 11, 1, 12, 3, 11, 21, -1, 1, 11, 12, -1, 1, 10 ),
        unpack(  ),
        unpack( 2, 11, 1, 12, 3, 11, 21, -1, 1, 11 ),
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
      
      @decision = 74
      

      def description
        <<-'__dfa_description__'.strip!
          210:1: mutation_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' );
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa34 = DFA34.new( self, 34 )
      @dfa51 = DFA51.new( self, 51 )
      @dfa63 = DFA63.new( self, 63 )
      @dfa74 = DFA74.new( self, 74 )

    end
    TOKENS_FOLLOWING_NL_IN_sfp_49 = Set[ 1, 4, 6, 18, 23, 24, 30 ]
    TOKENS_FOLLOWING_include_IN_sfp_52 = Set[ 1, 6, 18, 23, 24, 30 ]
    TOKENS_FOLLOWING_header_IN_sfp_55 = Set[ 1, 6, 23, 24, 30 ]
    TOKENS_FOLLOWING_state_section_IN_sfp_59 = Set[ 1, 6, 23 ]
    TOKENS_FOLLOWING_composite_IN_sfp_63 = Set[ 1, 6, 23 ]
    TOKENS_FOLLOWING_constraint_IN_sfp_67 = Set[ 1, 6, 23 ]
    TOKENS_FOLLOWING_T__18_IN_include_80 = Set[ 19 ]
    TOKENS_FOLLOWING_include_file_IN_include_82 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_include_84 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__19_IN_include_file_96 = Set[ 5 ]
    TOKENS_FOLLOWING_STRING_IN_include_file_98 = Set[ 1 ]
    TOKENS_FOLLOWING_class_definition_IN_header_110 = Set[ 1 ]
    TOKENS_FOLLOWING_procedure_IN_header_115 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_state_section_126 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_section_128 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_section_132 = Set[ 4, 6, 22 ]
    TOKENS_FOLLOWING_NL_IN_state_section_134 = Set[ 4, 6, 22 ]
    TOKENS_FOLLOWING_attribute_IN_state_section_137 = Set[ 6, 22 ]
    TOKENS_FOLLOWING_T__22_IN_state_section_140 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_state_section_142 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__23_IN_composite_154 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_composite_156 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_composite_160 = Set[ 4, 6, 22, 23 ]
    TOKENS_FOLLOWING_NL_IN_composite_162 = Set[ 4, 6, 22, 23 ]
    TOKENS_FOLLOWING_attribute_IN_composite_167 = Set[ 6, 22, 23 ]
    TOKENS_FOLLOWING_constraint_IN_composite_171 = Set[ 6, 22, 23 ]
    TOKENS_FOLLOWING_T__22_IN_composite_176 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_composite_178 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__24_IN_class_definition_190 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_class_definition_192 = Set[ 1, 4, 21, 25 ]
    TOKENS_FOLLOWING_extends_class_IN_class_definition_197 = Set[ 1, 4, 21 ]
    TOKENS_FOLLOWING_T__21_IN_class_definition_207 = Set[ 4, 6, 22, 24, 30 ]
    TOKENS_FOLLOWING_NL_IN_class_definition_209 = Set[ 4, 6, 22, 24, 30 ]
    TOKENS_FOLLOWING_attribute_IN_class_definition_214 = Set[ 6, 22, 24, 30 ]
    TOKENS_FOLLOWING_procedure_IN_class_definition_218 = Set[ 6, 22, 24, 30 ]
    TOKENS_FOLLOWING_T__22_IN_class_definition_223 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_class_definition_227 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__25_IN_extends_class_244 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_extends_class_246 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_attribute_257 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_attribute_259 = Set[ 5, 6, 8, 9, 10, 32 ]
    TOKENS_FOLLOWING_value_IN_attribute_261 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_263 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_attribute_269 = Set[ 50 ]
    TOKENS_FOLLOWING_reference_type_IN_attribute_271 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_273 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_object_def_IN_attribute_279 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_281 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_object_def_293 = Set[ 1, 21, 26 ]
    TOKENS_FOLLOWING_T__26_IN_object_def_298 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_object_def_300 = Set[ 1, 21 ]
    TOKENS_FOLLOWING_object_body_IN_object_def_309 = Set[ 1 ]
    TOKENS_FOLLOWING_T__21_IN_object_body_321 = Set[ 4, 6, 22, 27 ]
    TOKENS_FOLLOWING_NL_IN_object_body_323 = Set[ 4, 6, 22, 27 ]
    TOKENS_FOLLOWING_object_attribute_IN_object_body_328 = Set[ 6, 22, 27 ]
    TOKENS_FOLLOWING_state_dependency_IN_object_body_332 = Set[ 6, 22, 27 ]
    TOKENS_FOLLOWING_T__22_IN_object_body_337 = Set[ 1 ]
    TOKENS_FOLLOWING_attribute_IN_object_attribute_348 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_object_attribute_353 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_object_attribute_355 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_object_attribute_357 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_object_attribute_359 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__27_IN_state_dependency_371 = Set[ 6 ]
    TOKENS_FOLLOWING_dep_effect_IN_state_dependency_375 = Set[ 4, 28 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_377 = Set[ 4, 28 ]
    TOKENS_FOLLOWING_T__28_IN_state_dependency_380 = Set[ 4, 21 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_382 = Set[ 4, 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_dependency_385 = Set[ 4, 6, 22, 27, 39 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_389 = Set[ 4, 6, 22, 27, 39 ]
    TOKENS_FOLLOWING_constraint_body_IN_state_dependency_392 = Set[ 22 ]
    TOKENS_FOLLOWING_T__22_IN_state_dependency_397 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_403 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_T__29_IN_state_dependency_406 = Set[ 4, 21 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_408 = Set[ 4, 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_dependency_411 = Set[ 4, 6, 22, 27, 39 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_415 = Set[ 4, 6, 22, 27, 39 ]
    TOKENS_FOLLOWING_constraint_body_IN_state_dependency_418 = Set[ 22 ]
    TOKENS_FOLLOWING_T__22_IN_state_dependency_422 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_428 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_reference_IN_dep_effect_440 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_dep_effect_442 = Set[ 5, 6, 7, 8, 9, 10, 32 ]
    TOKENS_FOLLOWING_value_IN_dep_effect_449 = Set[ 1 ]
    TOKENS_FOLLOWING_NULL_IN_dep_effect_455 = Set[ 1 ]
    TOKENS_FOLLOWING_T__30_IN_procedure_471 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_procedure_473 = Set[ 21, 32 ]
    TOKENS_FOLLOWING_parameters_IN_procedure_477 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_procedure_480 = Set[ 4, 31, 36, 37 ]
    TOKENS_FOLLOWING_NL_IN_procedure_482 = Set[ 4, 31, 36, 37 ]
    TOKENS_FOLLOWING_T__31_IN_procedure_490 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_procedure_492 = Set[ 8 ]
    TOKENS_FOLLOWING_NUMBER_IN_procedure_494 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_procedure_499 = Set[ 4, 31, 36, 37 ]
    TOKENS_FOLLOWING_conditions_IN_procedure_509 = Set[ 4, 31, 36, 37 ]
    TOKENS_FOLLOWING_effects_IN_procedure_512 = Set[ 22 ]
    TOKENS_FOLLOWING_T__22_IN_procedure_514 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_procedure_516 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__32_IN_parameters_528 = Set[ 6 ]
    TOKENS_FOLLOWING_parameter_IN_parameters_530 = Set[ 33, 34 ]
    TOKENS_FOLLOWING_T__33_IN_parameters_533 = Set[ 6 ]
    TOKENS_FOLLOWING_parameter_IN_parameters_535 = Set[ 33, 34 ]
    TOKENS_FOLLOWING_T__34_IN_parameters_539 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_551 = Set[ 50 ]
    TOKENS_FOLLOWING_reference_type_IN_parameter_553 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_558 = Set[ 35 ]
    TOKENS_FOLLOWING_T__35_IN_parameter_560 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_parameter_562 = Set[ 1 ]
    TOKENS_FOLLOWING_T__36_IN_conditions_573 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_conditions_577 = Set[ 4, 6, 22, 27, 39 ]
    TOKENS_FOLLOWING_NL_IN_conditions_579 = Set[ 4, 6, 22, 27, 39 ]
    TOKENS_FOLLOWING_constraint_body_IN_conditions_582 = Set[ 22 ]
    TOKENS_FOLLOWING_T__22_IN_conditions_584 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_conditions_586 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__37_IN_effects_598 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_effects_602 = Set[ 4, 6, 22, 39, 46 ]
    TOKENS_FOLLOWING_NL_IN_effects_604 = Set[ 4, 6, 22, 39, 46 ]
    TOKENS_FOLLOWING_mutation_body_IN_effects_610 = Set[ 22 ]
    TOKENS_FOLLOWING_T__22_IN_effects_615 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_effects_617 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_constraint_629 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_constraint_631 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_635 = Set[ 4, 6, 22, 27, 39 ]
    TOKENS_FOLLOWING_NL_IN_constraint_637 = Set[ 4, 6, 22, 27, 39 ]
    TOKENS_FOLLOWING_constraint_body_IN_constraint_640 = Set[ 22 ]
    TOKENS_FOLLOWING_T__22_IN_constraint_642 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_644 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_662 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_namespace_IN_constraint_body_669 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_iterator_IN_constraint_body_676 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_body_685 = Set[ 1, 4, 6, 27, 39 ]
    TOKENS_FOLLOWING_path_IN_constraint_namespace_699 = Set[ 4, 21 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_701 = Set[ 4, 21 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_namespace_704 = Set[ 4, 6, 22, 27 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_706 = Set[ 4, 6, 22, 27 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_namespace_710 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_714 = Set[ 4, 6, 22, 27 ]
    TOKENS_FOLLOWING_T__22_IN_constraint_namespace_719 = Set[ 1 ]
    TOKENS_FOLLOWING_T__39_IN_constraint_iterator_730 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_constraint_iterator_732 = Set[ 40 ]
    TOKENS_FOLLOWING_T__40_IN_constraint_iterator_734 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_constraint_iterator_736 = Set[ 4, 21 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_738 = Set[ 4, 21 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_iterator_741 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_743 = Set[ 4, 6, 22, 27 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_iterator_749 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_753 = Set[ 4, 6, 22, 27 ]
    TOKENS_FOLLOWING_T__22_IN_constraint_iterator_760 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_775 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_constraint_statement_777 = Set[ 5, 6, 8, 9, 10, 32 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_779 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_784 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_constraint_statement_786 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_788 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_793 = Set[ 43, 52 ]
    TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_795 = Set[ 5, 6, 8, 9, 10, 32 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_797 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_802 = Set[ 43, 52 ]
    TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_804 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_806 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_811 = Set[ 41, 42 ]
    TOKENS_FOLLOWING_T__41_IN_constraint_statement_813 = Set[ 42 ]
    TOKENS_FOLLOWING_T__42_IN_constraint_statement_816 = Set[ 5, 6, 8, 9, 10, 32 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_818 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_823 = Set[ 43, 44 ]
    TOKENS_FOLLOWING_set_IN_constraint_statement_825 = Set[ 42 ]
    TOKENS_FOLLOWING_T__42_IN_constraint_statement_831 = Set[ 5, 6, 8, 9, 10, 32 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_833 = Set[ 1 ]
    TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_838 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_843 = Set[ 57, 58, 59, 60 ]
    TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_845 = Set[ 6, 8 ]
    TOKENS_FOLLOWING_comp_value_IN_constraint_statement_847 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_comp_value_862 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_comp_value_867 = Set[ 1 ]
    TOKENS_FOLLOWING_T__27_IN_conditional_constraint_878 = Set[ 6, 27 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_882 = Set[ 4, 28 ]
    TOKENS_FOLLOWING_NL_IN_conditional_constraint_884 = Set[ 4, 28 ]
    TOKENS_FOLLOWING_conditional_constraint_then_IN_conditional_constraint_889 = Set[ 1 ]
    TOKENS_FOLLOWING_T__28_IN_conditional_constraint_then_900 = Set[ 6, 27 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_902 = Set[ 1 ]
    TOKENS_FOLLOWING_mutation_statement_IN_mutation_body_920 = Set[ 4 ]
    TOKENS_FOLLOWING_mutation_iterator_IN_mutation_body_927 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_body_936 = Set[ 1, 4, 6, 39, 46 ]
    TOKENS_FOLLOWING_T__39_IN_mutation_iterator_951 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_mutation_iterator_953 = Set[ 4, 21 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_955 = Set[ 4, 21 ]
    TOKENS_FOLLOWING_T__21_IN_mutation_iterator_958 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_960 = Set[ 4, 6, 22, 46 ]
    TOKENS_FOLLOWING_mutation_statement_IN_mutation_iterator_966 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_970 = Set[ 4, 6, 22, 46 ]
    TOKENS_FOLLOWING_T__22_IN_mutation_iterator_977 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_992 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_mutation_statement_994 = Set[ 5, 6, 8, 9, 10, 32 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_996 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1001 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_mutation_statement_1003 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_mutation_statement_1005 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1010 = Set[ 53, 54, 55, 56 ]
    TOKENS_FOLLOWING_binary_op_IN_mutation_statement_1012 = Set[ 8 ]
    TOKENS_FOLLOWING_NUMBER_IN_mutation_statement_1014 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1019 = Set[ 41 ]
    TOKENS_FOLLOWING_T__41_IN_mutation_statement_1021 = Set[ 45 ]
    TOKENS_FOLLOWING_T__45_IN_mutation_statement_1023 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_statement_1025 = Set[ 1, 21 ]
    TOKENS_FOLLOWING_object_body_IN_mutation_statement_1029 = Set[ 1 ]
    TOKENS_FOLLOWING_T__46_IN_mutation_statement_1035 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_statement_1037 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1042 = Set[ 47 ]
    TOKENS_FOLLOWING_T__47_IN_mutation_statement_1044 = Set[ 5, 6, 8, 9, 10, 32 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_1046 = Set[ 34 ]
    TOKENS_FOLLOWING_T__34_IN_mutation_statement_1048 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1053 = Set[ 48 ]
    TOKENS_FOLLOWING_T__48_IN_mutation_statement_1055 = Set[ 5, 6, 8, 9, 10, 32 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_1057 = Set[ 34 ]
    TOKENS_FOLLOWING_T__34_IN_mutation_statement_1059 = Set[ 1 ]
    TOKENS_FOLLOWING_T__32_IN_set_value_1074 = Set[ 5, 6, 8, 9, 10, 32 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_1078 = Set[ 33, 34 ]
    TOKENS_FOLLOWING_T__33_IN_set_value_1081 = Set[ 5, 6, 8, 9, 10, 32 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_1083 = Set[ 33, 34 ]
    TOKENS_FOLLOWING_T__34_IN_set_value_1089 = Set[ 1 ]
    TOKENS_FOLLOWING_value_IN_set_item_1100 = Set[ 1 ]
    TOKENS_FOLLOWING_primitive_value_IN_value_1115 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_value_1120 = Set[ 1 ]
    TOKENS_FOLLOWING_set_value_IN_value_1125 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_primitive_value_0 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_path_1166 = Set[ 1, 49 ]
    TOKENS_FOLLOWING_T__49_IN_path_1168 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_path_1169 = Set[ 1, 49 ]
    TOKENS_FOLLOWING_path_IN_reference_1186 = Set[ 1 ]
    TOKENS_FOLLOWING_T__50_IN_reference_type_1201 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_reference_type_1203 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_not_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_comp_0 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end

