#!/usr/bin/env ruby
#
# SFP.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: SFP.g
# Generated at: 2012-03-30 18:07:02
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

# - - - - - - begin action @parser::header - - - - - -
# SFP.g


	require 'net/http'
	require 'Context'
	require 'Reference'

# - - - - - - end action @parser::header - - - - - - -


module SFP
  # TokenData defines all of the token type integer values
  # as constants, which will be included in all 
  # ANTLR-generated recognizers.
  const_defined?( :TokenData ) or TokenData = ANTLR3::TokenScheme.new

  module TokenData

    # define the token constants
    define_tokens( :EXPONENT => 10, :T__29 => 29, :T__28 => 28, :T__27 => 27, 
                   :T__26 => 26, :T__25 => 25, :T__24 => 24, :T__23 => 23, 
                   :T__22 => 22, :T__21 => 21, :T__20 => 20, :OCTAL_ESC => 16, 
                   :ID => 6, :EOF => -1, :T__19 => 19, :ESC_SEQ => 13, :BOOLEAN => 9, 
                   :T__18 => 18, :T__17 => 17, :NL => 4, :COMMENT => 11, 
                   :T__42 => 42, :T__43 => 43, :T__40 => 40, :T__41 => 41, 
                   :T__46 => 46, :T__47 => 47, :T__44 => 44, :T__45 => 45, 
                   :T__48 => 48, :UNICODE_ESC => 15, :NULL => 7, :NUMBER => 8, 
                   :HEX_DIGIT => 14, :T__30 => 30, :T__31 => 31, :T__32 => 32, 
                   :WS => 12, :T__33 => 33, :T__34 => 34, :T__35 => 35, 
                   :T__36 => 36, :T__37 => 37, :T__38 => 38, :T__39 => 39, 
                   :STRING => 5 )

    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "NL", "STRING", "ID", "NULL", "NUMBER", "BOOLEAN", "EXPONENT", 
                    "COMMENT", "WS", "ESC_SEQ", "HEX_DIGIT", "UNICODE_ESC", 
                    "OCTAL_ESC", "'#include'", "'file('", "')'", "'url('", 
                    "'composite'", "'{'", "'}'", "'class'", "'extends'", 
                    "'as'", "'when'", "'then'", "'action'", "'('", "','", 
                    "'precondition'", "'postcondition'", "'constraint'", 
                    "'not'", "'in'", "'if'", "'.'", "'$'", "'*'", "'+='", 
                    "'-='", "'*='", "'/='", "'>'", "'>='", "'<'", "'<='" )
    
  end


  class Parser < ANTLR3::Parser
    @grammar_home = SFP
    include ANTLR3::ASTBuilder

    RULE_METHODS = [ :sfp, :include, :include_file, :include_url, :header, 
                     :state, :composite, :class_definition, :extends_class, 
                     :attribute, :object, :object_attribute, :state_dependency, 
                     :dep_effect, :dep_condition, :action, :parameters, 
                     :parameter, :precondition, :postcondition, :constraint, 
                     :constraint_body, :constraint_statement, :binary_comp_value, 
                     :conditional_constraint, :conditional_constraint_then, 
                     :postcondition_body, :mutation_statement, :binary_op_value, 
                     :set, :set_value, :value, :primitive_value, :path, 
                     :reference, :reference_type, :binary_op, :binary_comp ].freeze


    include TokenData

    begin
      generated_using( "SFP.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end

    def initialize( input, options = {} )
      super( input, options )


    end


    	attr_accessor :root, :now

    	## put these lines into initialize()
    	def init
    		@root = Sfplanner::Lang::Context.new("root")
    		@now = @root
    	end

    	def get_string(str)
    		return str.text[ 1, str.text.length-2 ]
    	end

    	def copyXtoY(x, y)
    		x.attributes.each { |key,value|
    			y.attributes[key] = value
    		}
    	end

    # - - - - - - - - - - - - Rules - - - - - - - - - - - - -
    SfpReturnValue = define_return_scope 

    # 
    # parser rule sfp
    # 
    # (in SFP.g)
    # 35:1: sfp : ( NL )* ( include )* ( header )* ( state | composite )? ;
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

      tree_for_NL1 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 36:4: ( NL )* ( include )* ( header )* ( state | composite )?
        # at line 36:4: ( NL )*
        while true # decision 1
          alt_1 = 2
          look_1_0 = @input.peek( 1 )

          if ( look_1_0 == NL )
            alt_1 = 1

          end
          case alt_1
          when 1
            # at line 36:4: NL
            __NL1__ = match( NL, TOKENS_FOLLOWING_NL_IN_sfp_44 )

            tree_for_NL1 = @adaptor.create_with_payload( __NL1__ )
            @adaptor.add_child( root_0, tree_for_NL1 )


          else
            break # out of loop for decision 1
          end
        end # loop for decision 1
        # at line 36:8: ( include )*
        while true # decision 2
          alt_2 = 2
          look_2_0 = @input.peek( 1 )

          if ( look_2_0 == T__17 )
            alt_2 = 1

          end
          case alt_2
          when 1
            # at line 36:8: include
            @state.following.push( TOKENS_FOLLOWING_include_IN_sfp_47 )
            include2 = include
            @state.following.pop
            @adaptor.add_child( root_0, include2.tree )

          else
            break # out of loop for decision 2
          end
        end # loop for decision 2
        # at line 36:17: ( header )*
        while true # decision 3
          alt_3 = 2
          look_3_0 = @input.peek( 1 )

          if ( look_3_0 == T__24 || look_3_0 == T__29 )
            alt_3 = 1

          end
          case alt_3
          when 1
            # at line 36:17: header
            @state.following.push( TOKENS_FOLLOWING_header_IN_sfp_50 )
            header3 = header
            @state.following.pop
            @adaptor.add_child( root_0, header3.tree )

          else
            break # out of loop for decision 3
          end
        end # loop for decision 3
        # at line 36:25: ( state | composite )?
        alt_4 = 3
        look_4_0 = @input.peek( 1 )

        if ( look_4_0 == ID )
          alt_4 = 1
        elsif ( look_4_0 == T__21 )
          alt_4 = 2
        end
        case alt_4
        when 1
          # at line 36:26: state
          @state.following.push( TOKENS_FOLLOWING_state_IN_sfp_54 )
          state4 = state
          @state.following.pop
          @adaptor.add_child( root_0, state4.tree )

        when 2
          # at line 36:34: composite
          @state.following.push( TOKENS_FOLLOWING_composite_IN_sfp_58 )
          composite5 = composite
          @state.following.pop
          @adaptor.add_child( root_0, composite5.tree )

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
        # trace_out( __method__, 1 )

      end
      
      return return_value
    end

    IncludeReturnValue = define_return_scope 

    # 
    # parser rule include
    # 
    # (in SFP.g)
    # 39:1: include : '#include' ( include_file | include_url ) ( NL )+ ;
    # 
    def include
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )
      return_value = IncludeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal6 = nil
      __NL9__ = nil
      include_file7 = nil
      include_url8 = nil

      tree_for_string_literal6 = nil
      tree_for_NL9 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 40:4: '#include' ( include_file | include_url ) ( NL )+
        string_literal6 = match( T__17, TOKENS_FOLLOWING_T__17_IN_include_71 )

        tree_for_string_literal6 = @adaptor.create_with_payload( string_literal6 )
        @adaptor.add_child( root_0, tree_for_string_literal6 )

        # at line 40:15: ( include_file | include_url )
        alt_5 = 2
        look_5_0 = @input.peek( 1 )

        if ( look_5_0 == T__18 )
          alt_5 = 1
        elsif ( look_5_0 == T__20 )
          alt_5 = 2
        else
          raise NoViableAlternative( "", 5, 0 )
        end
        case alt_5
        when 1
          # at line 40:17: include_file
          @state.following.push( TOKENS_FOLLOWING_include_file_IN_include_75 )
          include_file7 = include_file
          @state.following.pop
          @adaptor.add_child( root_0, include_file7.tree )

        when 2
          # at line 40:32: include_url
          @state.following.push( TOKENS_FOLLOWING_include_url_IN_include_79 )
          include_url8 = include_url
          @state.following.pop
          @adaptor.add_child( root_0, include_url8.tree )

        end
        # at file 40:46: ( NL )+
        match_count_6 = 0
        while true
          alt_6 = 2
          look_6_0 = @input.peek( 1 )

          if ( look_6_0 == NL )
            alt_6 = 1

          end
          case alt_6
          when 1
            # at line 40:46: NL
            __NL9__ = match( NL, TOKENS_FOLLOWING_NL_IN_include_83 )

            tree_for_NL9 = @adaptor.create_with_payload( __NL9__ )
            @adaptor.add_child( root_0, tree_for_NL9 )


          else
            match_count_6 > 0 and break
            eee = EarlyExit(6)


            raise eee
          end
          match_count_6 += 1
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
    # 43:1: include_file : 'file(' STRING ')' ;
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
      char_literal12 = nil

      tree_for_string_literal10 = nil
      tree_for_STRING11 = nil
      tree_for_char_literal12 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 44:4: 'file(' STRING ')'
        string_literal10 = match( T__18, TOKENS_FOLLOWING_T__18_IN_include_file_95 )

        tree_for_string_literal10 = @adaptor.create_with_payload( string_literal10 )
        @adaptor.add_child( root_0, tree_for_string_literal10 )

        __STRING11__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_include_file_97 )

        tree_for_STRING11 = @adaptor.create_with_payload( __STRING11__ )
        @adaptor.add_child( root_0, tree_for_STRING11 )

        char_literal12 = match( T__19, TOKENS_FOLLOWING_T__19_IN_include_file_99 )

        tree_for_char_literal12 = @adaptor.create_with_payload( char_literal12 )
        @adaptor.add_child( root_0, tree_for_char_literal12 )

        # --> action

        			translator = Sfplanner::Lang::Translator.new
        			context = translator.sfpToContext(get_string(__STRING11__))
        			context.attributes.each { |key,value|
        				@now.set(key, value)
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
        # trace_out( __method__, 3 )

      end
      
      return return_value
    end

    IncludeUrlReturnValue = define_return_scope 

    # 
    # parser rule include_url
    # 
    # (in SFP.g)
    # 54:1: include_url : 'url(' STRING ')' ;
    # 
    def include_url
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )
      return_value = IncludeUrlReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal13 = nil
      __STRING14__ = nil
      char_literal15 = nil

      tree_for_string_literal13 = nil
      tree_for_STRING14 = nil
      tree_for_char_literal15 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 55:4: 'url(' STRING ')'
        string_literal13 = match( T__20, TOKENS_FOLLOWING_T__20_IN_include_url_115 )

        tree_for_string_literal13 = @adaptor.create_with_payload( string_literal13 )
        @adaptor.add_child( root_0, tree_for_string_literal13 )

        __STRING14__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_include_url_117 )

        tree_for_STRING14 = @adaptor.create_with_payload( __STRING14__ )
        @adaptor.add_child( root_0, tree_for_STRING14 )

        char_literal15 = match( T__19, TOKENS_FOLLOWING_T__19_IN_include_url_119 )

        tree_for_char_literal15 = @adaptor.create_with_payload( char_literal15 )
        @adaptor.add_child( root_0, tree_for_char_literal15 )

        # --> action

        			res = Net::HTTP.get_response(URI(get_string(__STRING14__)))
        			translator = Sfplanner::Lang::Translator.new
        			context = translator.parse(res.body)
        			context.attributes.each { |key,value|
        				@now.set(key, value)
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
        # trace_out( __method__, 4 )

      end
      
      return return_value
    end

    HeaderReturnValue = define_return_scope 

    # 
    # parser rule header
    # 
    # (in SFP.g)
    # 66:1: header : ( class_definition | action );
    # 
    def header
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )
      return_value = HeaderReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      class_definition16 = nil
      action17 = nil


      begin
        # at line 67:2: ( class_definition | action )
        alt_7 = 2
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == T__24 )
          alt_7 = 1
        elsif ( look_7_0 == T__29 )
          alt_7 = 2
        else
          raise NoViableAlternative( "", 7, 0 )
        end
        case alt_7
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 67:4: class_definition
          @state.following.push( TOKENS_FOLLOWING_class_definition_IN_header_134 )
          class_definition16 = class_definition
          @state.following.pop
          @adaptor.add_child( root_0, class_definition16.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 68:4: action
          @state.following.push( TOKENS_FOLLOWING_action_IN_header_139 )
          action17 = action
          @state.following.pop
          @adaptor.add_child( root_0, action17.tree )

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
        # trace_out( __method__, 5 )

      end
      
      return return_value
    end

    StateReturnValue = define_return_scope 

    # 
    # parser rule state
    # 
    # (in SFP.g)
    # 71:1: state : ( attribute )+ ( constraint )* ;
    # 
    def state
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )
      return_value = StateReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      attribute18 = nil
      constraint19 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 72:4: ( attribute )+ ( constraint )*
        # --> action

        			@now.set('init', Sfplanner::Lang::Context.new('init', @now, nil, Sfplanner::Lang::STATE))
        			@now = @now.get('init')
        		
        # <-- action
        # at file 76:3: ( attribute )+
        match_count_8 = 0
        while true
          alt_8 = 2
          look_8_0 = @input.peek( 1 )

          if ( look_8_0 == ID )
            alt_8 = 1

          end
          case alt_8
          when 1
            # at line 76:3: attribute
            @state.following.push( TOKENS_FOLLOWING_attribute_IN_state_154 )
            attribute18 = attribute
            @state.following.pop
            @adaptor.add_child( root_0, attribute18.tree )

          else
            match_count_8 > 0 and break
            eee = EarlyExit(8)


            raise eee
          end
          match_count_8 += 1
        end

        # at line 76:14: ( constraint )*
        while true # decision 9
          alt_9 = 2
          look_9_0 = @input.peek( 1 )

          if ( look_9_0 == T__34 )
            alt_9 = 1

          end
          case alt_9
          when 1
            # at line 76:14: constraint
            @state.following.push( TOKENS_FOLLOWING_constraint_IN_state_157 )
            constraint19 = constraint
            @state.following.pop
            @adaptor.add_child( root_0, constraint19.tree )

          else
            break # out of loop for decision 9
          end
        end # loop for decision 9
        # --> action
          @now = @now.owner  
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

    CompositeReturnValue = define_return_scope 

    # 
    # parser rule composite
    # 
    # (in SFP.g)
    # 80:1: composite : 'composite' ID '{' ( NL )* ( attribute | constraint )* '}' ( NL )* ;
    # 
    def composite
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )
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


        # at line 81:4: 'composite' ID '{' ( NL )* ( attribute | constraint )* '}' ( NL )*
        string_literal20 = match( T__21, TOKENS_FOLLOWING_T__21_IN_composite_173 )

        tree_for_string_literal20 = @adaptor.create_with_payload( string_literal20 )
        @adaptor.add_child( root_0, tree_for_string_literal20 )

        __ID21__ = match( ID, TOKENS_FOLLOWING_ID_IN_composite_175 )

        tree_for_ID21 = @adaptor.create_with_payload( __ID21__ )
        @adaptor.add_child( root_0, tree_for_ID21 )

        char_literal22 = match( T__22, TOKENS_FOLLOWING_T__22_IN_composite_177 )

        tree_for_char_literal22 = @adaptor.create_with_payload( char_literal22 )
        @adaptor.add_child( root_0, tree_for_char_literal22 )

        # at line 81:23: ( NL )*
        while true # decision 10
          alt_10 = 2
          look_10_0 = @input.peek( 1 )

          if ( look_10_0 == NL )
            alt_10 = 1

          end
          case alt_10
          when 1
            # at line 81:23: NL
            __NL23__ = match( NL, TOKENS_FOLLOWING_NL_IN_composite_179 )

            tree_for_NL23 = @adaptor.create_with_payload( __NL23__ )
            @adaptor.add_child( root_0, tree_for_NL23 )


          else
            break # out of loop for decision 10
          end
        end # loop for decision 10
        # at line 81:27: ( attribute | constraint )*
        while true # decision 11
          alt_11 = 3
          look_11_0 = @input.peek( 1 )

          if ( look_11_0 == ID )
            alt_11 = 1
          elsif ( look_11_0 == T__34 )
            alt_11 = 2

          end
          case alt_11
          when 1
            # at line 81:29: attribute
            @state.following.push( TOKENS_FOLLOWING_attribute_IN_composite_184 )
            attribute24 = attribute
            @state.following.pop
            @adaptor.add_child( root_0, attribute24.tree )

          when 2
            # at line 81:41: constraint
            @state.following.push( TOKENS_FOLLOWING_constraint_IN_composite_188 )
            constraint25 = constraint
            @state.following.pop
            @adaptor.add_child( root_0, constraint25.tree )

          else
            break # out of loop for decision 11
          end
        end # loop for decision 11
        char_literal26 = match( T__23, TOKENS_FOLLOWING_T__23_IN_composite_193 )

        tree_for_char_literal26 = @adaptor.create_with_payload( char_literal26 )
        @adaptor.add_child( root_0, tree_for_char_literal26 )

        # at line 81:59: ( NL )*
        while true # decision 12
          alt_12 = 2
          look_12_0 = @input.peek( 1 )

          if ( look_12_0 == NL )
            alt_12 = 1

          end
          case alt_12
          when 1
            # at line 81:59: NL
            __NL27__ = match( NL, TOKENS_FOLLOWING_NL_IN_composite_195 )

            tree_for_NL27 = @adaptor.create_with_payload( __NL27__ )
            @adaptor.add_child( root_0, tree_for_NL27 )


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
        # trace_out( __method__, 7 )

      end
      
      return return_value
    end

    ClassDefinitionReturnValue = define_return_scope 

    # 
    # parser rule class_definition
    # 
    # (in SFP.g)
    # 84:1: class_definition : 'class' ID ( extends_class )? ( '{' ( NL )* ( attribute | action )* '}' )? ( NL )* ;
    # 
    def class_definition
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )
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
      action34 = nil

      tree_for_string_literal28 = nil
      tree_for_ID29 = nil
      tree_for_char_literal31 = nil
      tree_for_NL32 = nil
      tree_for_char_literal35 = nil
      tree_for_NL36 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 85:4: 'class' ID ( extends_class )? ( '{' ( NL )* ( attribute | action )* '}' )? ( NL )*
        string_literal28 = match( T__24, TOKENS_FOLLOWING_T__24_IN_class_definition_207 )

        tree_for_string_literal28 = @adaptor.create_with_payload( string_literal28 )
        @adaptor.add_child( root_0, tree_for_string_literal28 )

        __ID29__ = match( ID, TOKENS_FOLLOWING_ID_IN_class_definition_209 )

        tree_for_ID29 = @adaptor.create_with_payload( __ID29__ )
        @adaptor.add_child( root_0, tree_for_ID29 )

        # --> action

        			@now.set(__ID29__.text, Sfplanner::Lang::Context.new(__ID29__.text, @now, nil, Sfplanner::Lang::CLASS))
        			@now = @now.get(__ID29__.text)
        		
        # <-- action
        # at line 90:3: ( extends_class )?
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0 == T__25 )
          alt_13 = 1
        end
        case alt_13
        when 1
          # at line 90:4: extends_class
          @state.following.push( TOKENS_FOLLOWING_extends_class_IN_class_definition_218 )
          extends_class30 = extends_class
          @state.following.pop
          @adaptor.add_child( root_0, extends_class30.tree )
          # --> action

          				@now.super = ( extends_class30.nil? ? nil : extends_class30.value )
          				copyXtoY(@now.super, @now)
          			
          # <-- action

        end
        # at line 96:3: ( '{' ( NL )* ( attribute | action )* '}' )?
        alt_16 = 2
        look_16_0 = @input.peek( 1 )

        if ( look_16_0 == T__22 )
          alt_16 = 1
        end
        case alt_16
        when 1
          # at line 96:4: '{' ( NL )* ( attribute | action )* '}'
          char_literal31 = match( T__22, TOKENS_FOLLOWING_T__22_IN_class_definition_233 )

          tree_for_char_literal31 = @adaptor.create_with_payload( char_literal31 )
          @adaptor.add_child( root_0, tree_for_char_literal31 )

          # at line 96:8: ( NL )*
          while true # decision 14
            alt_14 = 2
            look_14_0 = @input.peek( 1 )

            if ( look_14_0 == NL )
              alt_14 = 1

            end
            case alt_14
            when 1
              # at line 96:8: NL
              __NL32__ = match( NL, TOKENS_FOLLOWING_NL_IN_class_definition_235 )

              tree_for_NL32 = @adaptor.create_with_payload( __NL32__ )
              @adaptor.add_child( root_0, tree_for_NL32 )


            else
              break # out of loop for decision 14
            end
          end # loop for decision 14
          # at line 96:12: ( attribute | action )*
          while true # decision 15
            alt_15 = 3
            look_15_0 = @input.peek( 1 )

            if ( look_15_0 == ID )
              alt_15 = 1
            elsif ( look_15_0 == T__29 )
              alt_15 = 2

            end
            case alt_15
            when 1
              # at line 96:14: attribute
              @state.following.push( TOKENS_FOLLOWING_attribute_IN_class_definition_240 )
              attribute33 = attribute
              @state.following.pop
              @adaptor.add_child( root_0, attribute33.tree )

            when 2
              # at line 96:26: action
              @state.following.push( TOKENS_FOLLOWING_action_IN_class_definition_244 )
              action34 = action
              @state.following.pop
              @adaptor.add_child( root_0, action34.tree )

            else
              break # out of loop for decision 15
            end
          end # loop for decision 15
          char_literal35 = match( T__23, TOKENS_FOLLOWING_T__23_IN_class_definition_249 )

          tree_for_char_literal35 = @adaptor.create_with_payload( char_literal35 )
          @adaptor.add_child( root_0, tree_for_char_literal35 )


        end
        # at line 96:42: ( NL )*
        while true # decision 17
          alt_17 = 2
          look_17_0 = @input.peek( 1 )

          if ( look_17_0 == NL )
            alt_17 = 1

          end
          case alt_17
          when 1
            # at line 96:42: NL
            __NL36__ = match( NL, TOKENS_FOLLOWING_NL_IN_class_definition_253 )

            tree_for_NL36 = @adaptor.create_with_payload( __NL36__ )
            @adaptor.add_child( root_0, tree_for_NL36 )


          else
            break # out of loop for decision 17
          end
        end # loop for decision 17
        # --> action
          @now = @now.owner  
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

    ExtendsClassReturnValue = define_return_scope :value

    # 
    # parser rule extends_class
    # 
    # (in SFP.g)
    # 100:1: extends_class returns [ value ] : 'extends' path ;
    # 
    def extends_class
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )
      return_value = ExtendsClassReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal37 = nil
      path38 = nil

      tree_for_string_literal37 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 101:4: 'extends' path
        string_literal37 = match( T__25, TOKENS_FOLLOWING_T__25_IN_extends_class_274 )

        tree_for_string_literal37 = @adaptor.create_with_payload( string_literal37 )
        @adaptor.add_child( root_0, tree_for_string_literal37 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_extends_class_276 )
        path38 = path
        @state.following.pop
        @adaptor.add_child( root_0, path38.tree )
        # --> action
         return_value.value = @root.get(( path38 && @input.to_s( path38.start, path38.stop ) )) 
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
        # trace_out( __method__, 9 )

      end
      
      return return_value
    end

    AttributeReturnValue = define_return_scope 

    # 
    # parser rule attribute
    # 
    # (in SFP.g)
    # 104:1: attribute : ID ( value | object | reference_type ) ( NL )+ ;
    # 
    def attribute
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )
      return_value = AttributeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID39__ = nil
      __NL43__ = nil
      value40 = nil
      object41 = nil
      reference_type42 = nil

      tree_for_ID39 = nil
      tree_for_NL43 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 105:4: ID ( value | object | reference_type ) ( NL )+
        __ID39__ = match( ID, TOKENS_FOLLOWING_ID_IN_attribute_289 )

        tree_for_ID39 = @adaptor.create_with_payload( __ID39__ )
        @adaptor.add_child( root_0, tree_for_ID39 )

        # at line 106:3: ( value | object | reference_type )
        alt_18 = 3
        look_18_0 = @input.peek( 1 )

        if ( look_18_0 == STRING || look_18_0.between?( NUMBER, BOOLEAN ) || look_18_0 == T__30 || look_18_0 == T__39 )
          alt_18 = 1
        elsif ( look_18_0 == T__26 )
          look_18_2 = @input.peek( 2 )

          if ( look_18_2 == T__40 )
            alt_18 = 3
          elsif ( look_18_2 == ID )
            alt_18 = 2
          else
            raise NoViableAlternative( "", 18, 2 )
          end
        else
          raise NoViableAlternative( "", 18, 0 )
        end
        case alt_18
        when 1
          # at line 106:5: value
          @state.following.push( TOKENS_FOLLOWING_value_IN_attribute_295 )
          value40 = value
          @state.following.pop
          @adaptor.add_child( root_0, value40.tree )
          # --> action
           @now.set(__ID39__.text, ( value40.nil? ? nil : value40.val )) 
          # <-- action

        when 2
          # at line 107:5: object
          # --> action

          				@now.set(__ID39__.text, Sfplanner::Lang::Context.new(__ID39__.text, @now, nil, Sfplanner::Lang::OBJECT))
          				@now = @now.get(__ID39__.text)
          			
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_object_IN_attribute_308 )
          object41 = object
          @state.following.pop
          @adaptor.add_child( root_0, object41.tree )
          # --> action
          	@now = @now.owner  
          # <-- action

        when 3
          # at line 113:5: reference_type
          @state.following.push( TOKENS_FOLLOWING_reference_type_IN_attribute_319 )
          reference_type42 = reference_type
          @state.following.pop
          @adaptor.add_child( root_0, reference_type42.tree )
          # --> action
           @now.set(__ID39__.text, ( reference_type42.nil? ? nil : reference_type42.value )) 
          # <-- action

        end
        # at file 115:3: ( NL )+
        match_count_19 = 0
        while true
          alt_19 = 2
          look_19_0 = @input.peek( 1 )

          if ( look_19_0 == NL )
            alt_19 = 1

          end
          case alt_19
          when 1
            # at line 115:3: NL
            __NL43__ = match( NL, TOKENS_FOLLOWING_NL_IN_attribute_329 )

            tree_for_NL43 = @adaptor.create_with_payload( __NL43__ )
            @adaptor.add_child( root_0, tree_for_NL43 )


          else
            match_count_19 > 0 and break
            eee = EarlyExit(19)


            raise eee
          end
          match_count_19 += 1
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

    ObjectReturnValue = define_return_scope 

    # 
    # parser rule object
    # 
    # (in SFP.g)
    # 118:1: object : 'as' path ( '{' ( NL )* ( object_attribute | state_dependency )* '}' )? ;
    # 
    def object
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )
      return_value = ObjectReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal44 = nil
      char_literal46 = nil
      __NL47__ = nil
      char_literal50 = nil
      path45 = nil
      object_attribute48 = nil
      state_dependency49 = nil

      tree_for_string_literal44 = nil
      tree_for_char_literal46 = nil
      tree_for_NL47 = nil
      tree_for_char_literal50 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 119:5: 'as' path ( '{' ( NL )* ( object_attribute | state_dependency )* '}' )?
        string_literal44 = match( T__26, TOKENS_FOLLOWING_T__26_IN_object_342 )

        tree_for_string_literal44 = @adaptor.create_with_payload( string_literal44 )
        @adaptor.add_child( root_0, tree_for_string_literal44 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_object_344 )
        path45 = path
        @state.following.pop
        @adaptor.add_child( root_0, path45.tree )
        # --> action

        		c = @root.get(( path45 && @input.to_s( path45.start, path45.stop ) ))
        		copyXtoY(c, @now)
        		@now.super = c
        	
        # <-- action
        # at line 125:2: ( '{' ( NL )* ( object_attribute | state_dependency )* '}' )?
        alt_22 = 2
        look_22_0 = @input.peek( 1 )

        if ( look_22_0 == T__22 )
          alt_22 = 1
        end
        case alt_22
        when 1
          # at line 125:3: '{' ( NL )* ( object_attribute | state_dependency )* '}'
          char_literal46 = match( T__22, TOKENS_FOLLOWING_T__22_IN_object_351 )

          tree_for_char_literal46 = @adaptor.create_with_payload( char_literal46 )
          @adaptor.add_child( root_0, tree_for_char_literal46 )

          # at line 125:7: ( NL )*
          while true # decision 20
            alt_20 = 2
            look_20_0 = @input.peek( 1 )

            if ( look_20_0 == NL )
              alt_20 = 1

            end
            case alt_20
            when 1
              # at line 125:7: NL
              __NL47__ = match( NL, TOKENS_FOLLOWING_NL_IN_object_353 )

              tree_for_NL47 = @adaptor.create_with_payload( __NL47__ )
              @adaptor.add_child( root_0, tree_for_NL47 )


            else
              break # out of loop for decision 20
            end
          end # loop for decision 20
          # at line 125:11: ( object_attribute | state_dependency )*
          while true # decision 21
            alt_21 = 3
            look_21_0 = @input.peek( 1 )

            if ( look_21_0 == ID )
              alt_21 = 1
            elsif ( look_21_0 == T__27 )
              alt_21 = 2

            end
            case alt_21
            when 1
              # at line 125:13: object_attribute
              @state.following.push( TOKENS_FOLLOWING_object_attribute_IN_object_358 )
              object_attribute48 = object_attribute
              @state.following.pop
              @adaptor.add_child( root_0, object_attribute48.tree )

            when 2
              # at line 125:32: state_dependency
              @state.following.push( TOKENS_FOLLOWING_state_dependency_IN_object_362 )
              state_dependency49 = state_dependency
              @state.following.pop
              @adaptor.add_child( root_0, state_dependency49.tree )

            else
              break # out of loop for decision 21
            end
          end # loop for decision 21
          char_literal50 = match( T__23, TOKENS_FOLLOWING_T__23_IN_object_367 )

          tree_for_char_literal50 = @adaptor.create_with_payload( char_literal50 )
          @adaptor.add_child( root_0, tree_for_char_literal50 )


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
        # trace_out( __method__, 11 )

      end
      
      return return_value
    end

    ObjectAttributeReturnValue = define_return_scope 

    # 
    # parser rule object_attribute
    # 
    # (in SFP.g)
    # 128:1: object_attribute : ( attribute | ID NULL ( NL )+ );
    # 
    def object_attribute
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )
      return_value = ObjectAttributeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID52__ = nil
      __NULL53__ = nil
      __NL54__ = nil
      attribute51 = nil

      tree_for_ID52 = nil
      tree_for_NULL53 = nil
      tree_for_NL54 = nil

      begin
        # at line 129:2: ( attribute | ID NULL ( NL )+ )
        alt_24 = 2
        look_24_0 = @input.peek( 1 )

        if ( look_24_0 == ID )
          look_24_1 = @input.peek( 2 )

          if ( look_24_1 == NULL )
            alt_24 = 2
          elsif ( look_24_1 == STRING || look_24_1.between?( NUMBER, BOOLEAN ) || look_24_1 == T__26 || look_24_1 == T__30 || look_24_1 == T__39 )
            alt_24 = 1
          else
            raise NoViableAlternative( "", 24, 1 )
          end
        else
          raise NoViableAlternative( "", 24, 0 )
        end
        case alt_24
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 129:4: attribute
          @state.following.push( TOKENS_FOLLOWING_attribute_IN_object_attribute_381 )
          attribute51 = attribute
          @state.following.pop
          @adaptor.add_child( root_0, attribute51.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 130:4: ID NULL ( NL )+
          __ID52__ = match( ID, TOKENS_FOLLOWING_ID_IN_object_attribute_386 )

          tree_for_ID52 = @adaptor.create_with_payload( __ID52__ )
          @adaptor.add_child( root_0, tree_for_ID52 )

          __NULL53__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_object_attribute_388 )

          tree_for_NULL53 = @adaptor.create_with_payload( __NULL53__ )
          @adaptor.add_child( root_0, tree_for_NULL53 )

          # at file 130:12: ( NL )+
          match_count_23 = 0
          while true
            alt_23 = 2
            look_23_0 = @input.peek( 1 )

            if ( look_23_0 == NL )
              alt_23 = 1

            end
            case alt_23
            when 1
              # at line 130:12: NL
              __NL54__ = match( NL, TOKENS_FOLLOWING_NL_IN_object_attribute_390 )

              tree_for_NL54 = @adaptor.create_with_payload( __NL54__ )
              @adaptor.add_child( root_0, tree_for_NL54 )


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
        # trace_out( __method__, 12 )

      end
      
      return return_value
    end

    StateDependencyReturnValue = define_return_scope 

    # 
    # parser rule state_dependency
    # 
    # (in SFP.g)
    # 133:1: state_dependency : 'when' dep_effect ( NL )* 'then' ( NL )* '{' ( NL )* ( dep_condition )+ '}' ( NL )+ ;
    # 
    def state_dependency
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )
      return_value = StateDependencyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal55 = nil
      __NL57__ = nil
      string_literal58 = nil
      __NL59__ = nil
      char_literal60 = nil
      __NL61__ = nil
      char_literal63 = nil
      __NL64__ = nil
      dep_effect56 = nil
      dep_condition62 = nil

      tree_for_string_literal55 = nil
      tree_for_NL57 = nil
      tree_for_string_literal58 = nil
      tree_for_NL59 = nil
      tree_for_char_literal60 = nil
      tree_for_NL61 = nil
      tree_for_char_literal63 = nil
      tree_for_NL64 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 134:4: 'when' dep_effect ( NL )* 'then' ( NL )* '{' ( NL )* ( dep_condition )+ '}' ( NL )+
        string_literal55 = match( T__27, TOKENS_FOLLOWING_T__27_IN_state_dependency_402 )

        tree_for_string_literal55 = @adaptor.create_with_payload( string_literal55 )
        @adaptor.add_child( root_0, tree_for_string_literal55 )

        @state.following.push( TOKENS_FOLLOWING_dep_effect_IN_state_dependency_404 )
        dep_effect56 = dep_effect
        @state.following.pop
        @adaptor.add_child( root_0, dep_effect56.tree )
        # at line 134:22: ( NL )*
        while true # decision 25
          alt_25 = 2
          look_25_0 = @input.peek( 1 )

          if ( look_25_0 == NL )
            alt_25 = 1

          end
          case alt_25
          when 1
            # at line 134:22: NL
            __NL57__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_406 )

            tree_for_NL57 = @adaptor.create_with_payload( __NL57__ )
            @adaptor.add_child( root_0, tree_for_NL57 )


          else
            break # out of loop for decision 25
          end
        end # loop for decision 25
        string_literal58 = match( T__28, TOKENS_FOLLOWING_T__28_IN_state_dependency_409 )

        tree_for_string_literal58 = @adaptor.create_with_payload( string_literal58 )
        @adaptor.add_child( root_0, tree_for_string_literal58 )

        # at line 134:33: ( NL )*
        while true # decision 26
          alt_26 = 2
          look_26_0 = @input.peek( 1 )

          if ( look_26_0 == NL )
            alt_26 = 1

          end
          case alt_26
          when 1
            # at line 134:33: NL
            __NL59__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_411 )

            tree_for_NL59 = @adaptor.create_with_payload( __NL59__ )
            @adaptor.add_child( root_0, tree_for_NL59 )


          else
            break # out of loop for decision 26
          end
        end # loop for decision 26
        char_literal60 = match( T__22, TOKENS_FOLLOWING_T__22_IN_state_dependency_414 )

        tree_for_char_literal60 = @adaptor.create_with_payload( char_literal60 )
        @adaptor.add_child( root_0, tree_for_char_literal60 )

        # at line 134:41: ( NL )*
        while true # decision 27
          alt_27 = 2
          look_27_0 = @input.peek( 1 )

          if ( look_27_0 == NL )
            alt_27 = 1

          end
          case alt_27
          when 1
            # at line 134:41: NL
            __NL61__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_416 )

            tree_for_NL61 = @adaptor.create_with_payload( __NL61__ )
            @adaptor.add_child( root_0, tree_for_NL61 )


          else
            break # out of loop for decision 27
          end
        end # loop for decision 27
        # at file 134:45: ( dep_condition )+
        match_count_28 = 0
        while true
          alt_28 = 2
          look_28_0 = @input.peek( 1 )

          if ( look_28_0 == T__39 )
            alt_28 = 1

          end
          case alt_28
          when 1
            # at line 134:46: dep_condition
            @state.following.push( TOKENS_FOLLOWING_dep_condition_IN_state_dependency_420 )
            dep_condition62 = dep_condition
            @state.following.pop
            @adaptor.add_child( root_0, dep_condition62.tree )

          else
            match_count_28 > 0 and break
            eee = EarlyExit(28)


            raise eee
          end
          match_count_28 += 1
        end

        char_literal63 = match( T__23, TOKENS_FOLLOWING_T__23_IN_state_dependency_424 )

        tree_for_char_literal63 = @adaptor.create_with_payload( char_literal63 )
        @adaptor.add_child( root_0, tree_for_char_literal63 )

        # at file 134:66: ( NL )+
        match_count_29 = 0
        while true
          alt_29 = 2
          look_29_0 = @input.peek( 1 )

          if ( look_29_0 == NL )
            alt_29 = 1

          end
          case alt_29
          when 1
            # at line 134:66: NL
            __NL64__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_426 )

            tree_for_NL64 = @adaptor.create_with_payload( __NL64__ )
            @adaptor.add_child( root_0, tree_for_NL64 )


          else
            match_count_29 > 0 and break
            eee = EarlyExit(29)


            raise eee
          end
          match_count_29 += 1
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
    # 137:1: dep_effect : reference ( value | NULL ) ;
    # 
    def dep_effect
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )
      return_value = DepEffectReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL67__ = nil
      reference65 = nil
      value66 = nil

      tree_for_NULL67 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 138:4: reference ( value | NULL )
        @state.following.push( TOKENS_FOLLOWING_reference_IN_dep_effect_438 )
        reference65 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference65.tree )
        # at line 138:14: ( value | NULL )
        alt_30 = 2
        look_30_0 = @input.peek( 1 )

        if ( look_30_0 == STRING || look_30_0.between?( NUMBER, BOOLEAN ) || look_30_0 == T__30 || look_30_0 == T__39 )
          alt_30 = 1
        elsif ( look_30_0 == NULL )
          alt_30 = 2
        else
          raise NoViableAlternative( "", 30, 0 )
        end
        case alt_30
        when 1
          # at line 138:16: value
          @state.following.push( TOKENS_FOLLOWING_value_IN_dep_effect_442 )
          value66 = value
          @state.following.pop
          @adaptor.add_child( root_0, value66.tree )

        when 2
          # at line 138:24: NULL
          __NULL67__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_dep_effect_446 )

          tree_for_NULL67 = @adaptor.create_with_payload( __NULL67__ )
          @adaptor.add_child( root_0, tree_for_NULL67 )


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

    DepConditionReturnValue = define_return_scope 

    # 
    # parser rule dep_condition
    # 
    # (in SFP.g)
    # 141:1: dep_condition : reference ( value | NULL ) ( NL )+ ;
    # 
    def dep_condition
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )
      return_value = DepConditionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL70__ = nil
      __NL71__ = nil
      reference68 = nil
      value69 = nil

      tree_for_NULL70 = nil
      tree_for_NL71 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 142:4: reference ( value | NULL ) ( NL )+
        @state.following.push( TOKENS_FOLLOWING_reference_IN_dep_condition_459 )
        reference68 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference68.tree )
        # at line 142:14: ( value | NULL )
        alt_31 = 2
        look_31_0 = @input.peek( 1 )

        if ( look_31_0 == STRING || look_31_0.between?( NUMBER, BOOLEAN ) || look_31_0 == T__30 || look_31_0 == T__39 )
          alt_31 = 1
        elsif ( look_31_0 == NULL )
          alt_31 = 2
        else
          raise NoViableAlternative( "", 31, 0 )
        end
        case alt_31
        when 1
          # at line 142:16: value
          @state.following.push( TOKENS_FOLLOWING_value_IN_dep_condition_463 )
          value69 = value
          @state.following.pop
          @adaptor.add_child( root_0, value69.tree )

        when 2
          # at line 142:24: NULL
          __NULL70__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_dep_condition_467 )

          tree_for_NULL70 = @adaptor.create_with_payload( __NULL70__ )
          @adaptor.add_child( root_0, tree_for_NULL70 )


        end
        # at file 142:31: ( NL )+
        match_count_32 = 0
        while true
          alt_32 = 2
          look_32_0 = @input.peek( 1 )

          if ( look_32_0 == NL )
            alt_32 = 1

          end
          case alt_32
          when 1
            # at line 142:31: NL
            __NL71__ = match( NL, TOKENS_FOLLOWING_NL_IN_dep_condition_471 )

            tree_for_NL71 = @adaptor.create_with_payload( __NL71__ )
            @adaptor.add_child( root_0, tree_for_NL71 )


          else
            match_count_32 > 0 and break
            eee = EarlyExit(32)


            raise eee
          end
          match_count_32 += 1
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

    ActionReturnValue = define_return_scope 

    # 
    # parser rule action
    # 
    # (in SFP.g)
    # 145:1: action : 'action' ID ( parameters )? '{' ( NL )* precondition postcondition '}' ( NL )+ ;
    # 
    def action
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )
      return_value = ActionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal72 = nil
      __ID73__ = nil
      char_literal75 = nil
      __NL76__ = nil
      char_literal79 = nil
      __NL80__ = nil
      parameters74 = nil
      precondition77 = nil
      postcondition78 = nil

      tree_for_string_literal72 = nil
      tree_for_ID73 = nil
      tree_for_char_literal75 = nil
      tree_for_NL76 = nil
      tree_for_char_literal79 = nil
      tree_for_NL80 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 146:4: 'action' ID ( parameters )? '{' ( NL )* precondition postcondition '}' ( NL )+
        string_literal72 = match( T__29, TOKENS_FOLLOWING_T__29_IN_action_483 )

        tree_for_string_literal72 = @adaptor.create_with_payload( string_literal72 )
        @adaptor.add_child( root_0, tree_for_string_literal72 )

        __ID73__ = match( ID, TOKENS_FOLLOWING_ID_IN_action_485 )

        tree_for_ID73 = @adaptor.create_with_payload( __ID73__ )
        @adaptor.add_child( root_0, tree_for_ID73 )

        # --> action

        			@now.set(__ID73__.text, Sfplanner::Lang::Context.new(__ID73__.text, @now, nil, Sfplanner::Lang::ACTION))
        			@now = @now.get(__ID73__.text)
        		
        # <-- action
        # at line 151:3: ( parameters )?
        alt_33 = 2
        look_33_0 = @input.peek( 1 )

        if ( look_33_0 == T__30 )
          alt_33 = 1
        end
        case alt_33
        when 1
          # at line 151:3: parameters
          @state.following.push( TOKENS_FOLLOWING_parameters_IN_action_493 )
          parameters74 = parameters
          @state.following.pop
          @adaptor.add_child( root_0, parameters74.tree )

        end
        char_literal75 = match( T__22, TOKENS_FOLLOWING_T__22_IN_action_496 )

        tree_for_char_literal75 = @adaptor.create_with_payload( char_literal75 )
        @adaptor.add_child( root_0, tree_for_char_literal75 )

        # at line 151:19: ( NL )*
        while true # decision 34
          alt_34 = 2
          look_34_0 = @input.peek( 1 )

          if ( look_34_0 == NL )
            alt_34 = 1

          end
          case alt_34
          when 1
            # at line 151:19: NL
            __NL76__ = match( NL, TOKENS_FOLLOWING_NL_IN_action_498 )

            tree_for_NL76 = @adaptor.create_with_payload( __NL76__ )
            @adaptor.add_child( root_0, tree_for_NL76 )


          else
            break # out of loop for decision 34
          end
        end # loop for decision 34
        @state.following.push( TOKENS_FOLLOWING_precondition_IN_action_501 )
        precondition77 = precondition
        @state.following.pop
        @adaptor.add_child( root_0, precondition77.tree )
        @state.following.push( TOKENS_FOLLOWING_postcondition_IN_action_503 )
        postcondition78 = postcondition
        @state.following.pop
        @adaptor.add_child( root_0, postcondition78.tree )
        char_literal79 = match( T__23, TOKENS_FOLLOWING_T__23_IN_action_505 )

        tree_for_char_literal79 = @adaptor.create_with_payload( char_literal79 )
        @adaptor.add_child( root_0, tree_for_char_literal79 )

        # at file 151:54: ( NL )+
        match_count_35 = 0
        while true
          alt_35 = 2
          look_35_0 = @input.peek( 1 )

          if ( look_35_0 == NL )
            alt_35 = 1

          end
          case alt_35
          when 1
            # at line 151:54: NL
            __NL80__ = match( NL, TOKENS_FOLLOWING_NL_IN_action_507 )

            tree_for_NL80 = @adaptor.create_with_payload( __NL80__ )
            @adaptor.add_child( root_0, tree_for_NL80 )


          else
            match_count_35 > 0 and break
            eee = EarlyExit(35)


            raise eee
          end
          match_count_35 += 1
        end

        # --> action
         @now = @now.owner 
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

    ParametersReturnValue = define_return_scope 

    # 
    # parser rule parameters
    # 
    # (in SFP.g)
    # 155:1: parameters : '(' parameter ( ',' parameter )* ')' ;
    # 
    def parameters
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      return_value = ParametersReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal81 = nil
      char_literal83 = nil
      char_literal85 = nil
      parameter82 = nil
      parameter84 = nil

      tree_for_char_literal81 = nil
      tree_for_char_literal83 = nil
      tree_for_char_literal85 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 156:4: '(' parameter ( ',' parameter )* ')'
        char_literal81 = match( T__30, TOKENS_FOLLOWING_T__30_IN_parameters_523 )

        tree_for_char_literal81 = @adaptor.create_with_payload( char_literal81 )
        @adaptor.add_child( root_0, tree_for_char_literal81 )

        @state.following.push( TOKENS_FOLLOWING_parameter_IN_parameters_525 )
        parameter82 = parameter
        @state.following.pop
        @adaptor.add_child( root_0, parameter82.tree )
        # at line 156:18: ( ',' parameter )*
        while true # decision 36
          alt_36 = 2
          look_36_0 = @input.peek( 1 )

          if ( look_36_0 == T__31 )
            alt_36 = 1

          end
          case alt_36
          when 1
            # at line 156:19: ',' parameter
            char_literal83 = match( T__31, TOKENS_FOLLOWING_T__31_IN_parameters_528 )

            tree_for_char_literal83 = @adaptor.create_with_payload( char_literal83 )
            @adaptor.add_child( root_0, tree_for_char_literal83 )

            @state.following.push( TOKENS_FOLLOWING_parameter_IN_parameters_530 )
            parameter84 = parameter
            @state.following.pop
            @adaptor.add_child( root_0, parameter84.tree )

          else
            break # out of loop for decision 36
          end
        end # loop for decision 36
        char_literal85 = match( T__19, TOKENS_FOLLOWING_T__19_IN_parameters_534 )

        tree_for_char_literal85 = @adaptor.create_with_payload( char_literal85 )
        @adaptor.add_child( root_0, tree_for_char_literal85 )

        # - - - - - - - rule clean up - - - - - - - -
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

    ParameterReturnValue = define_return_scope 

    # 
    # parser rule parameter
    # 
    # (in SFP.g)
    # 159:1: parameter : ID reference_type ;
    # 
    def parameter
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      return_value = ParameterReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID86__ = nil
      reference_type87 = nil

      tree_for_ID86 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 160:4: ID reference_type
        __ID86__ = match( ID, TOKENS_FOLLOWING_ID_IN_parameter_546 )

        tree_for_ID86 = @adaptor.create_with_payload( __ID86__ )
        @adaptor.add_child( root_0, tree_for_ID86 )

        @state.following.push( TOKENS_FOLLOWING_reference_type_IN_parameter_548 )
        reference_type87 = reference_type
        @state.following.pop
        @adaptor.add_child( root_0, reference_type87.tree )
        # - - - - - - - rule clean up - - - - - - - -
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

    PreconditionReturnValue = define_return_scope 

    # 
    # parser rule precondition
    # 
    # (in SFP.g)
    # 163:1: precondition : 'precondition' '{' ( NL )* constraint_body '}' ( NL )+ ;
    # 
    def precondition
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      return_value = PreconditionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal88 = nil
      char_literal89 = nil
      __NL90__ = nil
      char_literal92 = nil
      __NL93__ = nil
      constraint_body91 = nil

      tree_for_string_literal88 = nil
      tree_for_char_literal89 = nil
      tree_for_NL90 = nil
      tree_for_char_literal92 = nil
      tree_for_NL93 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 164:4: 'precondition' '{' ( NL )* constraint_body '}' ( NL )+
        string_literal88 = match( T__32, TOKENS_FOLLOWING_T__32_IN_precondition_559 )

        tree_for_string_literal88 = @adaptor.create_with_payload( string_literal88 )
        @adaptor.add_child( root_0, tree_for_string_literal88 )

        # --> action

        			@now.set('precondition', Sfplanner::Lang::Context.new('precondition', @now, nil, Sfplanner::Lang::PRECONDITION))
        			@now = @now.get('precondition')
        		
        # <-- action
        char_literal89 = match( T__22, TOKENS_FOLLOWING_T__22_IN_precondition_567 )

        tree_for_char_literal89 = @adaptor.create_with_payload( char_literal89 )
        @adaptor.add_child( root_0, tree_for_char_literal89 )

        # at line 169:7: ( NL )*
        while true # decision 37
          alt_37 = 2
          look_37_0 = @input.peek( 1 )

          if ( look_37_0 == NL )
            alt_37 = 1

          end
          case alt_37
          when 1
            # at line 169:7: NL
            __NL90__ = match( NL, TOKENS_FOLLOWING_NL_IN_precondition_569 )

            tree_for_NL90 = @adaptor.create_with_payload( __NL90__ )
            @adaptor.add_child( root_0, tree_for_NL90 )


          else
            break # out of loop for decision 37
          end
        end # loop for decision 37
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_precondition_572 )
        constraint_body91 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body91.tree )
        char_literal92 = match( T__23, TOKENS_FOLLOWING_T__23_IN_precondition_574 )

        tree_for_char_literal92 = @adaptor.create_with_payload( char_literal92 )
        @adaptor.add_child( root_0, tree_for_char_literal92 )

        # at file 169:31: ( NL )+
        match_count_38 = 0
        while true
          alt_38 = 2
          look_38_0 = @input.peek( 1 )

          if ( look_38_0 == NL )
            alt_38 = 1

          end
          case alt_38
          when 1
            # at line 169:31: NL
            __NL93__ = match( NL, TOKENS_FOLLOWING_NL_IN_precondition_576 )

            tree_for_NL93 = @adaptor.create_with_payload( __NL93__ )
            @adaptor.add_child( root_0, tree_for_NL93 )


          else
            match_count_38 > 0 and break
            eee = EarlyExit(38)


            raise eee
          end
          match_count_38 += 1
        end

        # --> action
         @now = @now.owner 
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

    PostconditionReturnValue = define_return_scope 

    # 
    # parser rule postcondition
    # 
    # (in SFP.g)
    # 173:1: postcondition : 'postcondition' '{' ( NL )* postcondition_body '}' ( NL )+ ;
    # 
    def postcondition
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = PostconditionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal94 = nil
      char_literal95 = nil
      __NL96__ = nil
      char_literal98 = nil
      __NL99__ = nil
      postcondition_body97 = nil

      tree_for_string_literal94 = nil
      tree_for_char_literal95 = nil
      tree_for_NL96 = nil
      tree_for_char_literal98 = nil
      tree_for_NL99 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 174:4: 'postcondition' '{' ( NL )* postcondition_body '}' ( NL )+
        string_literal94 = match( T__33, TOKENS_FOLLOWING_T__33_IN_postcondition_592 )

        tree_for_string_literal94 = @adaptor.create_with_payload( string_literal94 )
        @adaptor.add_child( root_0, tree_for_string_literal94 )

        # --> action

        			@now.set('postcondition', Sfplanner::Lang::Context.new('postcondition', @now, nil, Sfplanner::Lang::POSTCONDITION))
        			@now = @now.get('postcondition')
        		
        # <-- action
        char_literal95 = match( T__22, TOKENS_FOLLOWING_T__22_IN_postcondition_600 )

        tree_for_char_literal95 = @adaptor.create_with_payload( char_literal95 )
        @adaptor.add_child( root_0, tree_for_char_literal95 )

        # at line 179:7: ( NL )*
        while true # decision 39
          alt_39 = 2
          look_39_0 = @input.peek( 1 )

          if ( look_39_0 == NL )
            alt_39 = 1

          end
          case alt_39
          when 1
            # at line 179:7: NL
            __NL96__ = match( NL, TOKENS_FOLLOWING_NL_IN_postcondition_602 )

            tree_for_NL96 = @adaptor.create_with_payload( __NL96__ )
            @adaptor.add_child( root_0, tree_for_NL96 )


          else
            break # out of loop for decision 39
          end
        end # loop for decision 39
        @state.following.push( TOKENS_FOLLOWING_postcondition_body_IN_postcondition_605 )
        postcondition_body97 = postcondition_body
        @state.following.pop
        @adaptor.add_child( root_0, postcondition_body97.tree )
        char_literal98 = match( T__23, TOKENS_FOLLOWING_T__23_IN_postcondition_607 )

        tree_for_char_literal98 = @adaptor.create_with_payload( char_literal98 )
        @adaptor.add_child( root_0, tree_for_char_literal98 )

        # at file 179:34: ( NL )+
        match_count_40 = 0
        while true
          alt_40 = 2
          look_40_0 = @input.peek( 1 )

          if ( look_40_0 == NL )
            alt_40 = 1

          end
          case alt_40
          when 1
            # at line 179:34: NL
            __NL99__ = match( NL, TOKENS_FOLLOWING_NL_IN_postcondition_609 )

            tree_for_NL99 = @adaptor.create_with_payload( __NL99__ )
            @adaptor.add_child( root_0, tree_for_NL99 )


          else
            match_count_40 > 0 and break
            eee = EarlyExit(40)


            raise eee
          end
          match_count_40 += 1
        end

        # --> action
         @now = @now.owner 
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

    ConstraintReturnValue = define_return_scope 

    # 
    # parser rule constraint
    # 
    # (in SFP.g)
    # 183:1: constraint : 'constraint' ID '{' ( NL )* constraint_body '}' ( NL )+ ;
    # 
    def constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = ConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal100 = nil
      __ID101__ = nil
      char_literal102 = nil
      __NL103__ = nil
      char_literal105 = nil
      __NL106__ = nil
      constraint_body104 = nil

      tree_for_string_literal100 = nil
      tree_for_ID101 = nil
      tree_for_char_literal102 = nil
      tree_for_NL103 = nil
      tree_for_char_literal105 = nil
      tree_for_NL106 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 184:4: 'constraint' ID '{' ( NL )* constraint_body '}' ( NL )+
        string_literal100 = match( T__34, TOKENS_FOLLOWING_T__34_IN_constraint_625 )

        tree_for_string_literal100 = @adaptor.create_with_payload( string_literal100 )
        @adaptor.add_child( root_0, tree_for_string_literal100 )

        __ID101__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_627 )

        tree_for_ID101 = @adaptor.create_with_payload( __ID101__ )
        @adaptor.add_child( root_0, tree_for_ID101 )

        # --> action

        			@now.set(__ID101__.text, Sfplanner::Lang::Context.new(__ID101__.text, @now, nil, Sfplanner::Lang::CONSTRAINT))
        			@now = @now.get(__ID101__.text)
        		
        # <-- action
        char_literal102 = match( T__22, TOKENS_FOLLOWING_T__22_IN_constraint_638 )

        tree_for_char_literal102 = @adaptor.create_with_payload( char_literal102 )
        @adaptor.add_child( root_0, tree_for_char_literal102 )

        # at line 190:7: ( NL )*
        while true # decision 41
          alt_41 = 2
          look_41_0 = @input.peek( 1 )

          if ( look_41_0 == NL )
            alt_41 = 1

          end
          case alt_41
          when 1
            # at line 190:7: NL
            __NL103__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_640 )

            tree_for_NL103 = @adaptor.create_with_payload( __NL103__ )
            @adaptor.add_child( root_0, tree_for_NL103 )


          else
            break # out of loop for decision 41
          end
        end # loop for decision 41
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_constraint_643 )
        constraint_body104 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body104.tree )
        char_literal105 = match( T__23, TOKENS_FOLLOWING_T__23_IN_constraint_645 )

        tree_for_char_literal105 = @adaptor.create_with_payload( char_literal105 )
        @adaptor.add_child( root_0, tree_for_char_literal105 )

        # at file 190:31: ( NL )+
        match_count_42 = 0
        while true
          alt_42 = 2
          look_42_0 = @input.peek( 1 )

          if ( look_42_0 == NL )
            alt_42 = 1

          end
          case alt_42
          when 1
            # at line 190:31: NL
            __NL106__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_647 )

            tree_for_NL106 = @adaptor.create_with_payload( __NL106__ )
            @adaptor.add_child( root_0, tree_for_NL106 )


          else
            match_count_42 > 0 and break
            eee = EarlyExit(42)


            raise eee
          end
          match_count_42 += 1
        end

        # --> action
         @now = @now.owner 
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
        # trace_out( __method__, 21 )

      end
      
      return return_value
    end

    ConstraintBodyReturnValue = define_return_scope 

    # 
    # parser rule constraint_body
    # 
    # (in SFP.g)
    # 194:1: constraint_body : ( constraint_statement ( NL )+ )* ;
    # 
    def constraint_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = ConstraintBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL108__ = nil
      constraint_statement107 = nil

      tree_for_NL108 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 195:4: ( constraint_statement ( NL )+ )*
        # at line 195:4: ( constraint_statement ( NL )+ )*
        while true # decision 44
          alt_44 = 2
          look_44_0 = @input.peek( 1 )

          if ( look_44_0 == T__37 || look_44_0 == T__39 )
            alt_44 = 1

          end
          case alt_44
          when 1
            # at line 195:5: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_664 )
            constraint_statement107 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement107.tree )
            # at file 195:26: ( NL )+
            match_count_43 = 0
            while true
              alt_43 = 2
              look_43_0 = @input.peek( 1 )

              if ( look_43_0 == NL )
                alt_43 = 1

              end
              case alt_43
              when 1
                # at line 195:26: NL
                __NL108__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_body_666 )

                tree_for_NL108 = @adaptor.create_with_payload( __NL108__ )
                @adaptor.add_child( root_0, tree_for_NL108 )


              else
                match_count_43 > 0 and break
                eee = EarlyExit(43)


                raise eee
              end
              match_count_43 += 1
            end


          else
            break # out of loop for decision 44
          end
        end # loop for decision 44
        # - - - - - - - rule clean up - - - - - - - -
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

    ConstraintStatementReturnValue = define_return_scope 

    # 
    # parser rule constraint_statement
    # 
    # (in SFP.g)
    # 198:1: constraint_statement : ( reference value | reference NULL | reference 'not' value | reference 'in' set | reference binary_comp binary_comp_value | conditional_constraint );
    # 
    def constraint_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
      return_value = ConstraintStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL112__ = nil
      string_literal114 = nil
      string_literal117 = nil
      reference109 = nil
      value110 = nil
      reference111 = nil
      reference113 = nil
      value115 = nil
      reference116 = nil
      set118 = nil
      reference119 = nil
      binary_comp120 = nil
      binary_comp_value121 = nil
      conditional_constraint122 = nil

      tree_for_NULL112 = nil
      tree_for_string_literal114 = nil
      tree_for_string_literal117 = nil

      begin
        # at line 199:2: ( reference value | reference NULL | reference 'not' value | reference 'in' set | reference binary_comp binary_comp_value | conditional_constraint )
        alt_45 = 6
        alt_45 = @dfa45.predict( @input )
        case alt_45
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 199:4: reference value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_680 )
          reference109 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference109.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_682 )
          value110 = value
          @state.following.pop
          @adaptor.add_child( root_0, value110.tree )
          # --> action
           @now.set(( reference109 && @input.to_s( reference109.start, reference109.stop ) ), ( value110.nil? ? nil : value110.val )) 
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 200:4: reference NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_689 )
          reference111 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference111.tree )
          __NULL112__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_constraint_statement_691 )

          tree_for_NULL112 = @adaptor.create_with_payload( __NULL112__ )
          @adaptor.add_child( root_0, tree_for_NULL112 )


        when 3
          root_0 = @adaptor.create_flat_list


          # at line 201:4: reference 'not' value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_696 )
          reference113 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference113.tree )
          string_literal114 = match( T__35, TOKENS_FOLLOWING_T__35_IN_constraint_statement_698 )

          tree_for_string_literal114 = @adaptor.create_with_payload( string_literal114 )
          @adaptor.add_child( root_0, tree_for_string_literal114 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_700 )
          value115 = value
          @state.following.pop
          @adaptor.add_child( root_0, value115.tree )

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 202:4: reference 'in' set
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_705 )
          reference116 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference116.tree )
          string_literal117 = match( T__36, TOKENS_FOLLOWING_T__36_IN_constraint_statement_707 )

          tree_for_string_literal117 = @adaptor.create_with_payload( string_literal117 )
          @adaptor.add_child( root_0, tree_for_string_literal117 )

          @state.following.push( TOKENS_FOLLOWING_set_IN_constraint_statement_709 )
          set118 = set
          @state.following.pop
          @adaptor.add_child( root_0, set118.tree )

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 203:4: reference binary_comp binary_comp_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_714 )
          reference119 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference119.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_716 )
          binary_comp120 = binary_comp
          @state.following.pop
          @adaptor.add_child( root_0, binary_comp120.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_comp_value_IN_constraint_statement_718 )
          binary_comp_value121 = binary_comp_value
          @state.following.pop
          @adaptor.add_child( root_0, binary_comp_value121.tree )

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 204:4: conditional_constraint
          @state.following.push( TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_723 )
          conditional_constraint122 = conditional_constraint
          @state.following.pop
          @adaptor.add_child( root_0, conditional_constraint122.tree )

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
        # trace_out( __method__, 23 )

      end
      
      return return_value
    end

    BinaryCompValueReturnValue = define_return_scope 

    # 
    # parser rule binary_comp_value
    # 
    # (in SFP.g)
    # 207:1: binary_comp_value : ( NUMBER | reference );
    # 
    def binary_comp_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = BinaryCompValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NUMBER123__ = nil
      reference124 = nil

      tree_for_NUMBER123 = nil

      begin
        # at line 208:2: ( NUMBER | reference )
        alt_46 = 2
        look_46_0 = @input.peek( 1 )

        if ( look_46_0 == NUMBER )
          alt_46 = 1
        elsif ( look_46_0 == T__39 )
          alt_46 = 2
        else
          raise NoViableAlternative( "", 46, 0 )
        end
        case alt_46
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 208:4: NUMBER
          __NUMBER123__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_binary_comp_value_734 )

          tree_for_NUMBER123 = @adaptor.create_with_payload( __NUMBER123__ )
          @adaptor.add_child( root_0, tree_for_NUMBER123 )


        when 2
          root_0 = @adaptor.create_flat_list


          # at line 209:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_binary_comp_value_739 )
          reference124 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference124.tree )

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

    ConditionalConstraintReturnValue = define_return_scope 

    # 
    # parser rule conditional_constraint
    # 
    # (in SFP.g)
    # 212:1: conditional_constraint : 'if' constraint_statement ( NL )* conditional_constraint_then ;
    # 
    def conditional_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = ConditionalConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal125 = nil
      __NL127__ = nil
      constraint_statement126 = nil
      conditional_constraint_then128 = nil

      tree_for_string_literal125 = nil
      tree_for_NL127 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 213:4: 'if' constraint_statement ( NL )* conditional_constraint_then
        string_literal125 = match( T__37, TOKENS_FOLLOWING_T__37_IN_conditional_constraint_750 )

        tree_for_string_literal125 = @adaptor.create_with_payload( string_literal125 )
        @adaptor.add_child( root_0, tree_for_string_literal125 )

        @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_752 )
        constraint_statement126 = constraint_statement
        @state.following.pop
        @adaptor.add_child( root_0, constraint_statement126.tree )
        # at line 213:30: ( NL )*
        while true # decision 47
          alt_47 = 2
          look_47_0 = @input.peek( 1 )

          if ( look_47_0 == NL )
            alt_47 = 1

          end
          case alt_47
          when 1
            # at line 213:30: NL
            __NL127__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditional_constraint_754 )

            tree_for_NL127 = @adaptor.create_with_payload( __NL127__ )
            @adaptor.add_child( root_0, tree_for_NL127 )


          else
            break # out of loop for decision 47
          end
        end # loop for decision 47
        @state.following.push( TOKENS_FOLLOWING_conditional_constraint_then_IN_conditional_constraint_757 )
        conditional_constraint_then128 = conditional_constraint_then
        @state.following.pop
        @adaptor.add_child( root_0, conditional_constraint_then128.tree )
        # - - - - - - - rule clean up - - - - - - - -
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

    ConditionalConstraintThenReturnValue = define_return_scope 

    # 
    # parser rule conditional_constraint_then
    # 
    # (in SFP.g)
    # 216:1: conditional_constraint_then : 'then' constraint_statement ;
    # 
    def conditional_constraint_then
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = ConditionalConstraintThenReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal129 = nil
      constraint_statement130 = nil

      tree_for_string_literal129 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 217:4: 'then' constraint_statement
        string_literal129 = match( T__28, TOKENS_FOLLOWING_T__28_IN_conditional_constraint_then_768 )

        tree_for_string_literal129 = @adaptor.create_with_payload( string_literal129 )
        @adaptor.add_child( root_0, tree_for_string_literal129 )

        @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_770 )
        constraint_statement130 = constraint_statement
        @state.following.pop
        @adaptor.add_child( root_0, constraint_statement130.tree )
        # - - - - - - - rule clean up - - - - - - - -
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

    PostconditionBodyReturnValue = define_return_scope 

    # 
    # parser rule postcondition_body
    # 
    # (in SFP.g)
    # 220:1: postcondition_body : ( mutation_statement ( NL )+ )* ;
    # 
    def postcondition_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = PostconditionBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL132__ = nil
      mutation_statement131 = nil

      tree_for_NL132 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 221:4: ( mutation_statement ( NL )+ )*
        # at line 221:4: ( mutation_statement ( NL )+ )*
        while true # decision 49
          alt_49 = 2
          look_49_0 = @input.peek( 1 )

          if ( look_49_0 == T__39 )
            alt_49 = 1

          end
          case alt_49
          when 1
            # at line 221:5: mutation_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_postcondition_body_782 )
            mutation_statement131 = mutation_statement
            @state.following.pop
            @adaptor.add_child( root_0, mutation_statement131.tree )
            # at file 221:24: ( NL )+
            match_count_48 = 0
            while true
              alt_48 = 2
              look_48_0 = @input.peek( 1 )

              if ( look_48_0 == NL )
                alt_48 = 1

              end
              case alt_48
              when 1
                # at line 221:24: NL
                __NL132__ = match( NL, TOKENS_FOLLOWING_NL_IN_postcondition_body_784 )

                tree_for_NL132 = @adaptor.create_with_payload( __NL132__ )
                @adaptor.add_child( root_0, tree_for_NL132 )


              else
                match_count_48 > 0 and break
                eee = EarlyExit(48)


                raise eee
              end
              match_count_48 += 1
            end


          else
            break # out of loop for decision 49
          end
        end # loop for decision 49
        # - - - - - - - rule clean up - - - - - - - -
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

    MutationStatementReturnValue = define_return_scope 

    # 
    # parser rule mutation_statement
    # 
    # (in SFP.g)
    # 224:1: mutation_statement : ( reference value | reference NULL | reference binary_op binary_op_value );
    # 
    def mutation_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = MutationStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL136__ = nil
      reference133 = nil
      value134 = nil
      reference135 = nil
      reference137 = nil
      binary_op138 = nil
      binary_op_value139 = nil

      tree_for_NULL136 = nil

      begin
        # at line 225:2: ( reference value | reference NULL | reference binary_op binary_op_value )
        alt_50 = 3
        alt_50 = @dfa50.predict( @input )
        case alt_50
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 225:4: reference value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_798 )
          reference133 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference133.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_800 )
          value134 = value
          @state.following.pop
          @adaptor.add_child( root_0, value134.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 226:4: reference NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_805 )
          reference135 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference135.tree )
          __NULL136__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_mutation_statement_807 )

          tree_for_NULL136 = @adaptor.create_with_payload( __NULL136__ )
          @adaptor.add_child( root_0, tree_for_NULL136 )


        when 3
          root_0 = @adaptor.create_flat_list


          # at line 227:4: reference binary_op binary_op_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_812 )
          reference137 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference137.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_op_IN_mutation_statement_814 )
          binary_op138 = binary_op
          @state.following.pop
          @adaptor.add_child( root_0, binary_op138.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_op_value_IN_mutation_statement_816 )
          binary_op_value139 = binary_op_value
          @state.following.pop
          @adaptor.add_child( root_0, binary_op_value139.tree )

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
        # trace_out( __method__, 28 )

      end
      
      return return_value
    end

    BinaryOpValueReturnValue = define_return_scope 

    # 
    # parser rule binary_op_value
    # 
    # (in SFP.g)
    # 230:1: binary_op_value : ( reference | NUMBER );
    # 
    def binary_op_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = BinaryOpValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NUMBER141__ = nil
      reference140 = nil

      tree_for_NUMBER141 = nil

      begin
        # at line 231:2: ( reference | NUMBER )
        alt_51 = 2
        look_51_0 = @input.peek( 1 )

        if ( look_51_0 == T__39 )
          alt_51 = 1
        elsif ( look_51_0 == NUMBER )
          alt_51 = 2
        else
          raise NoViableAlternative( "", 51, 0 )
        end
        case alt_51
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 231:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_binary_op_value_827 )
          reference140 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference140.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 232:4: NUMBER
          __NUMBER141__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_binary_op_value_832 )

          tree_for_NUMBER141 = @adaptor.create_with_payload( __NUMBER141__ )
          @adaptor.add_child( root_0, tree_for_NUMBER141 )


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

    SetReturnValue = define_return_scope 

    # 
    # parser rule set
    # 
    # (in SFP.g)
    # 235:1: set : '(' ( set_value ( ',' set_value )* )? ')' ;
    # 
    def set
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = SetReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal142 = nil
      char_literal144 = nil
      char_literal146 = nil
      set_value143 = nil
      set_value145 = nil

      tree_for_char_literal142 = nil
      tree_for_char_literal144 = nil
      tree_for_char_literal146 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 236:4: '(' ( set_value ( ',' set_value )* )? ')'
        char_literal142 = match( T__30, TOKENS_FOLLOWING_T__30_IN_set_843 )

        tree_for_char_literal142 = @adaptor.create_with_payload( char_literal142 )
        @adaptor.add_child( root_0, tree_for_char_literal142 )

        # at line 236:8: ( set_value ( ',' set_value )* )?
        alt_53 = 2
        look_53_0 = @input.peek( 1 )

        if ( look_53_0 == STRING || look_53_0.between?( NUMBER, BOOLEAN ) || look_53_0 == T__30 || look_53_0 == T__39 )
          alt_53 = 1
        end
        case alt_53
        when 1
          # at line 236:10: set_value ( ',' set_value )*
          @state.following.push( TOKENS_FOLLOWING_set_value_IN_set_847 )
          set_value143 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value143.tree )
          # at line 236:20: ( ',' set_value )*
          while true # decision 52
            alt_52 = 2
            look_52_0 = @input.peek( 1 )

            if ( look_52_0 == T__31 )
              alt_52 = 1

            end
            case alt_52
            when 1
              # at line 236:21: ',' set_value
              char_literal144 = match( T__31, TOKENS_FOLLOWING_T__31_IN_set_850 )

              tree_for_char_literal144 = @adaptor.create_with_payload( char_literal144 )
              @adaptor.add_child( root_0, tree_for_char_literal144 )

              @state.following.push( TOKENS_FOLLOWING_set_value_IN_set_852 )
              set_value145 = set_value
              @state.following.pop
              @adaptor.add_child( root_0, set_value145.tree )

            else
              break # out of loop for decision 52
            end
          end # loop for decision 52

        end
        char_literal146 = match( T__19, TOKENS_FOLLOWING_T__19_IN_set_859 )

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
        # trace_out( __method__, 30 )

      end
      
      return return_value
    end

    SetValueReturnValue = define_return_scope 

    # 
    # parser rule set_value
    # 
    # (in SFP.g)
    # 239:1: set_value : value ;
    # 
    def set_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
      return_value = SetValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      value147 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 240:4: value
        @state.following.push( TOKENS_FOLLOWING_value_IN_set_value_870 )
        value147 = value
        @state.following.pop
        @adaptor.add_child( root_0, value147.tree )
        # - - - - - - - rule clean up - - - - - - - -
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

    ValueReturnValue = define_return_scope :val

    # 
    # parser rule value
    # 
    # (in SFP.g)
    # 243:1: value returns [ val ] : ( primitive_value | reference | set );
    # 
    def value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = ValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      primitive_value148 = nil
      reference149 = nil
      set150 = nil


      begin
        # at line 244:2: ( primitive_value | reference | set )
        alt_54 = 3
        case look_54 = @input.peek( 1 )
        when STRING, NUMBER, BOOLEAN then alt_54 = 1
        when T__39 then alt_54 = 2
        when T__30 then alt_54 = 3
        else
          raise NoViableAlternative( "", 54, 0 )
        end
        case alt_54
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 244:4: primitive_value
          @state.following.push( TOKENS_FOLLOWING_primitive_value_IN_value_885 )
          primitive_value148 = primitive_value
          @state.following.pop
          @adaptor.add_child( root_0, primitive_value148.tree )
          # --> action
           return_value.val = ( primitive_value148.nil? ? nil : primitive_value148.value ) 
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 245:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_value_892 )
          reference149 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference149.tree )
          # --> action
           return_value.val = Sfplanner::Lang::Reference.new(( reference149 && @input.to_s( reference149.start, reference149.stop ) )) 
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 246:4: set
          @state.following.push( TOKENS_FOLLOWING_set_IN_value_899 )
          set150 = set
          @state.following.pop
          @adaptor.add_child( root_0, set150.tree )

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

    PrimitiveValueReturnValue = define_return_scope :value

    # 
    # parser rule primitive_value
    # 
    # (in SFP.g)
    # 249:1: primitive_value returns [ value ] : ( BOOLEAN | NUMBER | STRING );
    # 
    def primitive_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
      return_value = PrimitiveValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __BOOLEAN151__ = nil
      __NUMBER152__ = nil
      __STRING153__ = nil

      tree_for_BOOLEAN151 = nil
      tree_for_NUMBER152 = nil
      tree_for_STRING153 = nil

      begin
        # at line 250:2: ( BOOLEAN | NUMBER | STRING )
        alt_55 = 3
        case look_55 = @input.peek( 1 )
        when BOOLEAN then alt_55 = 1
        when NUMBER then alt_55 = 2
        when STRING then alt_55 = 3
        else
          raise NoViableAlternative( "", 55, 0 )
        end
        case alt_55
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 250:4: BOOLEAN
          __BOOLEAN151__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_914 )

          tree_for_BOOLEAN151 = @adaptor.create_with_payload( __BOOLEAN151__ )
          @adaptor.add_child( root_0, tree_for_BOOLEAN151 )

          # --> action
           return_value.value = (__BOOLEAN151__.text == '"true"' ? true : false ) 
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 251:4: NUMBER
          __NUMBER152__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_primitive_value_921 )

          tree_for_NUMBER152 = @adaptor.create_with_payload( __NUMBER152__ )
          @adaptor.add_child( root_0, tree_for_NUMBER152 )

          # --> action
           return_value.value = __NUMBER152__.text.to_i 
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 252:4: STRING
          __STRING153__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_primitive_value_929 )

          tree_for_STRING153 = @adaptor.create_with_payload( __STRING153__ )
          @adaptor.add_child( root_0, tree_for_STRING153 )

          # --> action
           return_value.value = __STRING153__.text[ 1, __STRING153__.text.length-2 ] 
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
        # trace_out( __method__, 33 )

      end
      
      return return_value
    end

    PathReturnValue = define_return_scope 

    # 
    # parser rule path
    # 
    # (in SFP.g)
    # 255:1: path : ID ( '.' ID )* ;
    # 
    def path
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )
      return_value = PathReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID154__ = nil
      char_literal155 = nil
      __ID156__ = nil

      tree_for_ID154 = nil
      tree_for_char_literal155 = nil
      tree_for_ID156 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 256:4: ID ( '.' ID )*
        __ID154__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_943 )

        tree_for_ID154 = @adaptor.create_with_payload( __ID154__ )
        @adaptor.add_child( root_0, tree_for_ID154 )

        # at line 256:6: ( '.' ID )*
        while true # decision 56
          alt_56 = 2
          look_56_0 = @input.peek( 1 )

          if ( look_56_0 == T__38 )
            alt_56 = 1

          end
          case alt_56
          when 1
            # at line 256:7: '.' ID
            char_literal155 = match( T__38, TOKENS_FOLLOWING_T__38_IN_path_945 )

            tree_for_char_literal155 = @adaptor.create_with_payload( char_literal155 )
            @adaptor.add_child( root_0, tree_for_char_literal155 )

            __ID156__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_946 )

            tree_for_ID156 = @adaptor.create_with_payload( __ID156__ )
            @adaptor.add_child( root_0, tree_for_ID156 )


          else
            break # out of loop for decision 56
          end
        end # loop for decision 56
        # - - - - - - - rule clean up - - - - - - - -
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

    ReferenceReturnValue = define_return_scope 

    # 
    # parser rule reference
    # 
    # (in SFP.g)
    # 259:1: reference : '$' path ;
    # 
    def reference
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
      return_value = ReferenceReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal157 = nil
      path158 = nil

      tree_for_char_literal157 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 260:4: '$' path
        char_literal157 = match( T__39, TOKENS_FOLLOWING_T__39_IN_reference_959 )

        tree_for_char_literal157 = @adaptor.create_with_payload( char_literal157 )
        @adaptor.add_child( root_0, tree_for_char_literal157 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_reference_960 )
        path158 = path
        @state.following.pop
        @adaptor.add_child( root_0, path158.tree )
        # - - - - - - - rule clean up - - - - - - - -
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

    ReferenceTypeReturnValue = define_return_scope :value

    # 
    # parser rule reference_type
    # 
    # (in SFP.g)
    # 263:1: reference_type returns [ value ] : 'as' '*' path ;
    # 
    def reference_type
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
      return_value = ReferenceTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal159 = nil
      char_literal160 = nil
      path161 = nil

      tree_for_string_literal159 = nil
      tree_for_char_literal160 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 264:4: 'as' '*' path
        string_literal159 = match( T__26, TOKENS_FOLLOWING_T__26_IN_reference_type_975 )

        tree_for_string_literal159 = @adaptor.create_with_payload( string_literal159 )
        @adaptor.add_child( root_0, tree_for_string_literal159 )

        char_literal160 = match( T__40, TOKENS_FOLLOWING_T__40_IN_reference_type_977 )

        tree_for_char_literal160 = @adaptor.create_with_payload( char_literal160 )
        @adaptor.add_child( root_0, tree_for_char_literal160 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_reference_type_978 )
        path161 = path
        @state.following.pop
        @adaptor.add_child( root_0, path161.tree )
        # --> action
         return_value.value = Sfplanner::Lang::Context.new('null', @now, @root.get(( path161 && @input.to_s( path161.start, path161.stop ) )), Sfplanner::Lang::REFERENCE_TYPE) 
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

    BinaryOpReturnValue = define_return_scope 

    # 
    # parser rule binary_op
    # 
    # (in SFP.g)
    # 267:1: binary_op : ( '+=' | '-=' | '*=' | '/=' );
    # 
    def binary_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )
      return_value = BinaryOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set162 = nil

      tree_for_set162 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set162 = @input.look
        if @input.peek( 1 ).between?( T__41, T__44 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set162 ) )
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
        # trace_out( __method__, 37 )

      end
      
      return return_value
    end

    BinaryCompReturnValue = define_return_scope 

    # 
    # parser rule binary_comp
    # 
    # (in SFP.g)
    # 274:1: binary_comp : ( '>' | '>=' | '<' | '<=' );
    # 
    def binary_comp
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )
      return_value = BinaryCompReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set163 = nil

      tree_for_set163 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set163 = @input.look
        if @input.peek( 1 ).between?( T__45, T__48 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set163 ) )
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



    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA45 < ANTLR3::DFA
      EOT = unpack( 11, -1 )
      EOF = unpack( 11, -1 )
      MIN = unpack( 1, 37, 1, 6, 1, -1, 1, 5, 1, 6, 5, -1, 1, 5 )
      MAX = unpack( 1, 39, 1, 6, 1, -1, 1, 48, 1, 6, 5, -1, 1, 48 )
      ACCEPT = unpack( 2, -1, 1, 6, 2, -1, 1, 1, 1, 2, 1, 3, 1, 4, 1, 5, 
                       1, -1 )
      SPECIAL = unpack( 11, -1 )
      TRANSITION = [
        unpack( 1, 2, 1, -1, 1, 1 ),
        unpack( 1, 3 ),
        unpack(  ),
        unpack( 1, 5, 1, -1, 1, 6, 2, 5, 20, -1, 1, 5, 4, -1, 1, 7, 1, 
                 8, 1, -1, 1, 4, 1, 5, 5, -1, 4, 9 ),
        unpack( 1, 10 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 5, 1, -1, 1, 6, 2, 5, 20, -1, 1, 5, 4, -1, 1, 7, 1, 
                 8, 1, -1, 1, 4, 1, 5, 5, -1, 4, 9 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 45
      

      def description
        <<-'__dfa_description__'.strip!
          198:1: constraint_statement : ( reference value | reference NULL | reference 'not' value | reference 'in' set | reference binary_comp binary_comp_value | conditional_constraint );
        __dfa_description__
      end
    end
    class DFA50 < ANTLR3::DFA
      EOT = unpack( 8, -1 )
      EOF = unpack( 8, -1 )
      MIN = unpack( 1, 39, 1, 6, 1, 5, 1, 6, 3, -1, 1, 5 )
      MAX = unpack( 1, 39, 1, 6, 1, 44, 1, 6, 3, -1, 1, 44 )
      ACCEPT = unpack( 4, -1, 1, 1, 1, 2, 1, 3, 1, -1 )
      SPECIAL = unpack( 8, -1 )
      TRANSITION = [
        unpack( 1, 1 ),
        unpack( 1, 2 ),
        unpack( 1, 4, 1, -1, 1, 5, 2, 4, 20, -1, 1, 4, 7, -1, 1, 3, 1, 
                 4, 1, -1, 4, 6 ),
        unpack( 1, 7 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 4, 1, -1, 1, 5, 2, 4, 20, -1, 1, 4, 7, -1, 1, 3, 1, 
                 4, 1, -1, 4, 6 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 50
      

      def description
        <<-'__dfa_description__'.strip!
          224:1: mutation_statement : ( reference value | reference NULL | reference binary_op binary_op_value );
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa45 = DFA45.new( self, 45 )
      @dfa50 = DFA50.new( self, 50 )

    end
    TOKENS_FOLLOWING_NL_IN_sfp_44 = Set[ 1, 4, 6, 17, 21, 24, 29 ]
    TOKENS_FOLLOWING_include_IN_sfp_47 = Set[ 1, 6, 17, 21, 24, 29 ]
    TOKENS_FOLLOWING_header_IN_sfp_50 = Set[ 1, 6, 21, 24, 29 ]
    TOKENS_FOLLOWING_state_IN_sfp_54 = Set[ 1 ]
    TOKENS_FOLLOWING_composite_IN_sfp_58 = Set[ 1 ]
    TOKENS_FOLLOWING_T__17_IN_include_71 = Set[ 18, 20 ]
    TOKENS_FOLLOWING_include_file_IN_include_75 = Set[ 4 ]
    TOKENS_FOLLOWING_include_url_IN_include_79 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_include_83 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__18_IN_include_file_95 = Set[ 5 ]
    TOKENS_FOLLOWING_STRING_IN_include_file_97 = Set[ 19 ]
    TOKENS_FOLLOWING_T__19_IN_include_file_99 = Set[ 1 ]
    TOKENS_FOLLOWING_T__20_IN_include_url_115 = Set[ 5 ]
    TOKENS_FOLLOWING_STRING_IN_include_url_117 = Set[ 19 ]
    TOKENS_FOLLOWING_T__19_IN_include_url_119 = Set[ 1 ]
    TOKENS_FOLLOWING_class_definition_IN_header_134 = Set[ 1 ]
    TOKENS_FOLLOWING_action_IN_header_139 = Set[ 1 ]
    TOKENS_FOLLOWING_attribute_IN_state_154 = Set[ 1, 6, 34 ]
    TOKENS_FOLLOWING_constraint_IN_state_157 = Set[ 1, 34 ]
    TOKENS_FOLLOWING_T__21_IN_composite_173 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_composite_175 = Set[ 22 ]
    TOKENS_FOLLOWING_T__22_IN_composite_177 = Set[ 4, 6, 23, 34 ]
    TOKENS_FOLLOWING_NL_IN_composite_179 = Set[ 4, 6, 23, 34 ]
    TOKENS_FOLLOWING_attribute_IN_composite_184 = Set[ 6, 23, 34 ]
    TOKENS_FOLLOWING_constraint_IN_composite_188 = Set[ 6, 23, 34 ]
    TOKENS_FOLLOWING_T__23_IN_composite_193 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_composite_195 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__24_IN_class_definition_207 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_class_definition_209 = Set[ 1, 4, 22, 25 ]
    TOKENS_FOLLOWING_extends_class_IN_class_definition_218 = Set[ 1, 4, 22 ]
    TOKENS_FOLLOWING_T__22_IN_class_definition_233 = Set[ 4, 6, 23, 24, 29 ]
    TOKENS_FOLLOWING_NL_IN_class_definition_235 = Set[ 4, 6, 23, 24, 29 ]
    TOKENS_FOLLOWING_attribute_IN_class_definition_240 = Set[ 6, 23, 24, 29 ]
    TOKENS_FOLLOWING_action_IN_class_definition_244 = Set[ 6, 23, 24, 29 ]
    TOKENS_FOLLOWING_T__23_IN_class_definition_249 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_class_definition_253 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__25_IN_extends_class_274 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_extends_class_276 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_attribute_289 = Set[ 5, 8, 9, 26, 30, 39 ]
    TOKENS_FOLLOWING_value_IN_attribute_295 = Set[ 4 ]
    TOKENS_FOLLOWING_object_IN_attribute_308 = Set[ 4 ]
    TOKENS_FOLLOWING_reference_type_IN_attribute_319 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_329 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__26_IN_object_342 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_object_344 = Set[ 1, 22 ]
    TOKENS_FOLLOWING_T__22_IN_object_351 = Set[ 4, 6, 23, 27 ]
    TOKENS_FOLLOWING_NL_IN_object_353 = Set[ 4, 6, 23, 27 ]
    TOKENS_FOLLOWING_object_attribute_IN_object_358 = Set[ 6, 23, 27 ]
    TOKENS_FOLLOWING_state_dependency_IN_object_362 = Set[ 6, 23, 27 ]
    TOKENS_FOLLOWING_T__23_IN_object_367 = Set[ 1 ]
    TOKENS_FOLLOWING_attribute_IN_object_attribute_381 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_object_attribute_386 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_object_attribute_388 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_object_attribute_390 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__27_IN_state_dependency_402 = Set[ 39 ]
    TOKENS_FOLLOWING_dep_effect_IN_state_dependency_404 = Set[ 4, 28 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_406 = Set[ 4, 28 ]
    TOKENS_FOLLOWING_T__28_IN_state_dependency_409 = Set[ 4, 22 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_411 = Set[ 4, 22 ]
    TOKENS_FOLLOWING_T__22_IN_state_dependency_414 = Set[ 4, 39 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_416 = Set[ 4, 39 ]
    TOKENS_FOLLOWING_dep_condition_IN_state_dependency_420 = Set[ 4, 23, 39 ]
    TOKENS_FOLLOWING_T__23_IN_state_dependency_424 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_426 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_reference_IN_dep_effect_438 = Set[ 5, 7, 8, 9, 30, 39 ]
    TOKENS_FOLLOWING_value_IN_dep_effect_442 = Set[ 1 ]
    TOKENS_FOLLOWING_NULL_IN_dep_effect_446 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_dep_condition_459 = Set[ 5, 7, 8, 9, 30, 39 ]
    TOKENS_FOLLOWING_value_IN_dep_condition_463 = Set[ 4 ]
    TOKENS_FOLLOWING_NULL_IN_dep_condition_467 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_dep_condition_471 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__29_IN_action_483 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_action_485 = Set[ 22, 30 ]
    TOKENS_FOLLOWING_parameters_IN_action_493 = Set[ 22 ]
    TOKENS_FOLLOWING_T__22_IN_action_496 = Set[ 4, 32 ]
    TOKENS_FOLLOWING_NL_IN_action_498 = Set[ 4, 32 ]
    TOKENS_FOLLOWING_precondition_IN_action_501 = Set[ 33 ]
    TOKENS_FOLLOWING_postcondition_IN_action_503 = Set[ 23 ]
    TOKENS_FOLLOWING_T__23_IN_action_505 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_action_507 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__30_IN_parameters_523 = Set[ 6 ]
    TOKENS_FOLLOWING_parameter_IN_parameters_525 = Set[ 19, 31 ]
    TOKENS_FOLLOWING_T__31_IN_parameters_528 = Set[ 6 ]
    TOKENS_FOLLOWING_parameter_IN_parameters_530 = Set[ 19, 31 ]
    TOKENS_FOLLOWING_T__19_IN_parameters_534 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_546 = Set[ 5, 8, 9, 26, 30, 39 ]
    TOKENS_FOLLOWING_reference_type_IN_parameter_548 = Set[ 1 ]
    TOKENS_FOLLOWING_T__32_IN_precondition_559 = Set[ 22 ]
    TOKENS_FOLLOWING_T__22_IN_precondition_567 = Set[ 4, 23, 37, 39 ]
    TOKENS_FOLLOWING_NL_IN_precondition_569 = Set[ 4, 23, 37, 39 ]
    TOKENS_FOLLOWING_constraint_body_IN_precondition_572 = Set[ 23 ]
    TOKENS_FOLLOWING_T__23_IN_precondition_574 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_precondition_576 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__33_IN_postcondition_592 = Set[ 22 ]
    TOKENS_FOLLOWING_T__22_IN_postcondition_600 = Set[ 4, 23, 39 ]
    TOKENS_FOLLOWING_NL_IN_postcondition_602 = Set[ 4, 23, 39 ]
    TOKENS_FOLLOWING_postcondition_body_IN_postcondition_605 = Set[ 23 ]
    TOKENS_FOLLOWING_T__23_IN_postcondition_607 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_postcondition_609 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__34_IN_constraint_625 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_constraint_627 = Set[ 22 ]
    TOKENS_FOLLOWING_T__22_IN_constraint_638 = Set[ 4, 23, 37, 39 ]
    TOKENS_FOLLOWING_NL_IN_constraint_640 = Set[ 4, 23, 37, 39 ]
    TOKENS_FOLLOWING_constraint_body_IN_constraint_643 = Set[ 23 ]
    TOKENS_FOLLOWING_T__23_IN_constraint_645 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_647 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_664 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_body_666 = Set[ 1, 4, 37, 39 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_680 = Set[ 5, 8, 9, 30, 39 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_682 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_689 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_691 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_696 = Set[ 35 ]
    TOKENS_FOLLOWING_T__35_IN_constraint_statement_698 = Set[ 5, 8, 9, 30, 39 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_700 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_705 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_constraint_statement_707 = Set[ 5, 8, 9, 30, 39 ]
    TOKENS_FOLLOWING_set_IN_constraint_statement_709 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_714 = Set[ 45, 46, 47, 48 ]
    TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_716 = Set[ 8, 39 ]
    TOKENS_FOLLOWING_binary_comp_value_IN_constraint_statement_718 = Set[ 1 ]
    TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_723 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_binary_comp_value_734 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_binary_comp_value_739 = Set[ 1 ]
    TOKENS_FOLLOWING_T__37_IN_conditional_constraint_750 = Set[ 37, 39 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_752 = Set[ 4, 28 ]
    TOKENS_FOLLOWING_NL_IN_conditional_constraint_754 = Set[ 4, 28 ]
    TOKENS_FOLLOWING_conditional_constraint_then_IN_conditional_constraint_757 = Set[ 1 ]
    TOKENS_FOLLOWING_T__28_IN_conditional_constraint_then_768 = Set[ 37, 39 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_770 = Set[ 1 ]
    TOKENS_FOLLOWING_mutation_statement_IN_postcondition_body_782 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_postcondition_body_784 = Set[ 1, 4, 39 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_798 = Set[ 5, 8, 9, 30, 39 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_800 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_805 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_mutation_statement_807 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_812 = Set[ 41, 42, 43, 44 ]
    TOKENS_FOLLOWING_binary_op_IN_mutation_statement_814 = Set[ 8, 39 ]
    TOKENS_FOLLOWING_binary_op_value_IN_mutation_statement_816 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_binary_op_value_827 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_binary_op_value_832 = Set[ 1 ]
    TOKENS_FOLLOWING_T__30_IN_set_843 = Set[ 5, 8, 9, 19, 30, 39 ]
    TOKENS_FOLLOWING_set_value_IN_set_847 = Set[ 19, 31 ]
    TOKENS_FOLLOWING_T__31_IN_set_850 = Set[ 5, 8, 9, 30, 39 ]
    TOKENS_FOLLOWING_set_value_IN_set_852 = Set[ 19, 31 ]
    TOKENS_FOLLOWING_T__19_IN_set_859 = Set[ 1 ]
    TOKENS_FOLLOWING_value_IN_set_value_870 = Set[ 1 ]
    TOKENS_FOLLOWING_primitive_value_IN_value_885 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_value_892 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_value_899 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_914 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_primitive_value_921 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_primitive_value_929 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_path_943 = Set[ 1, 38 ]
    TOKENS_FOLLOWING_T__38_IN_path_945 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_path_946 = Set[ 1, 38 ]
    TOKENS_FOLLOWING_T__39_IN_reference_959 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_reference_960 = Set[ 1 ]
    TOKENS_FOLLOWING_T__26_IN_reference_type_975 = Set[ 40 ]
    TOKENS_FOLLOWING_T__40_IN_reference_type_977 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_reference_type_978 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_comp_0 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end

