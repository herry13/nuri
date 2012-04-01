#!/usr/bin/env ruby
#
# SFP.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: SFP.g
# Generated at: 2012-04-01 19:56:17
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
    define_tokens( :EXPONENT => 11, :T__29 => 29, :T__28 => 28, :T__27 => 27, 
                   :T__26 => 26, :T__25 => 25, :T__24 => 24, :T__23 => 23, 
                   :T__22 => 22, :T__21 => 21, :T__20 => 20, :OCTAL_ESC => 17, 
                   :FLOAT => 10, :ID => 6, :EOF => -1, :T__19 => 19, :ESC_SEQ => 14, 
                   :BOOLEAN => 9, :T__51 => 51, :T__52 => 52, :T__18 => 18, 
                   :NL => 4, :COMMENT => 12, :T__50 => 50, :T__42 => 42, 
                   :INTEGER => 8, :T__43 => 43, :T__40 => 40, :T__41 => 41, 
                   :T__46 => 46, :T__47 => 47, :T__44 => 44, :T__45 => 45, 
                   :T__48 => 48, :T__49 => 49, :UNICODE_ESC => 16, :NULL => 7, 
                   :HEX_DIGIT => 15, :T__30 => 30, :T__31 => 31, :T__32 => 32, 
                   :WS => 13, :T__33 => 33, :T__34 => 34, :T__35 => 35, 
                   :T__36 => 36, :T__37 => 37, :T__38 => 38, :T__39 => 39, 
                   :STRING => 5 )

    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "NL", "STRING", "ID", "NULL", "INTEGER", "BOOLEAN", 
                    "FLOAT", "EXPONENT", "COMMENT", "WS", "ESC_SEQ", "HEX_DIGIT", 
                    "UNICODE_ESC", "OCTAL_ESC", "'#include'", "'file('", 
                    "')'", "'url('", "'composite'", "'{'", "'}'", "'class'", 
                    "'extends'", "'as'", "'when'", "'then'", "'action'", 
                    "'('", "','", "'precondition'", "'postcondition'", "'constraint'", 
                    "'not'", "'in'", "'<'", "'<='", "'>='", "'>'", "'if'", 
                    "'+='", "'-='", "'*='", "'/='", "'+'", "'-'", "'*'", 
                    "'/'", "'.'", "'$'" )
    
  end


  class Parser < ANTLR3::Parser
    @grammar_home = SFP
    include ANTLR3::ASTBuilder

    RULE_METHODS = [ :sfp, :include, :include_file, :include_url, :header, 
                     :state, :composite, :class_definition, :extends_class, 
                     :attribute, :object_def, :object_attribute, :state_dependency, 
                     :dep_effect, :dep_condition, :action, :parameters, 
                     :parameter, :precondition, :postcondition, :constraint, 
                     :constraint_body, :constraint_statement, :comp_value, 
                     :conditional_constraint, :conditional_constraint_then, 
                     :postcondition_body, :mutation_statement, :formula_value, 
                     :formula, :formula_item, :formula_op, :set_value, :set_item, 
                     :value, :primitive_value, :path, :reference, :reference_type, 
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


    	attr_accessor :root, :now

    	@anonymous_id
    	@missing_reftype

    	# this method should be called first before starting the parser
    	def init
    		@root = Sfplanner::Lang::Context.new("root")
    		@now = @root
    		@missing_reftype = Hash.new
    		@anonymous_id = 0
    	end

    	def next_anonymous_id
    		@anonymous_id += 1
    		return @anonymous_id
    	end

    	def get_string(str)
    		return str.text[ 1, str.text.length-2 ]
    	end

    	def copyXtoY(x, y, is_object=false)
    		x.attributes.each { |key,value|
    			#y.attributes[key] = (value.is_a?(Sfplanner::Lang::Context) ? value.clone : value)
    			y.attributes[key] = value
    			if y.attributes[key].is_a?(Sfplanner::Lang::ContextReferenceType) and is_object #y.is_a?(ContextObject)
    				y.attributes[key] = Sfplanner::Lang::ContextNull(key, y, y.attributes[key].supertype)
    			end
    		}
    	end

    	def resolve_missing_reftype
    		@missing_reftype.each { |ref,value|
    			value.supertype = @root.get(ref)
    		}
    	end

    # - - - - - - - - - - - - Rules - - - - - - - - - - - - -
    SfpReturnValue = define_return_scope 

    # 
    # parser rule sfp
    # 
    # (in SFP.g)
    # 55:1: sfp : ( NL )* ( include )* ( header )* ( state | composite )? ;
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


        # at line 56:4: ( NL )* ( include )* ( header )* ( state | composite )?
        # at line 56:4: ( NL )*
        while true # decision 1
          alt_1 = 2
          look_1_0 = @input.peek( 1 )

          if ( look_1_0 == NL )
            alt_1 = 1

          end
          case alt_1
          when 1
            # at line 56:4: NL
            __NL1__ = match( NL, TOKENS_FOLLOWING_NL_IN_sfp_44 )

            tree_for_NL1 = @adaptor.create_with_payload( __NL1__ )
            @adaptor.add_child( root_0, tree_for_NL1 )


          else
            break # out of loop for decision 1
          end
        end # loop for decision 1
        # at line 56:8: ( include )*
        while true # decision 2
          alt_2 = 2
          look_2_0 = @input.peek( 1 )

          if ( look_2_0 == T__18 )
            alt_2 = 1

          end
          case alt_2
          when 1
            # at line 56:8: include
            @state.following.push( TOKENS_FOLLOWING_include_IN_sfp_47 )
            include2 = include
            @state.following.pop
            @adaptor.add_child( root_0, include2.tree )

          else
            break # out of loop for decision 2
          end
        end # loop for decision 2
        # at line 56:17: ( header )*
        while true # decision 3
          alt_3 = 2
          look_3_0 = @input.peek( 1 )

          if ( look_3_0 == T__25 || look_3_0 == T__30 )
            alt_3 = 1

          end
          case alt_3
          when 1
            # at line 56:17: header
            @state.following.push( TOKENS_FOLLOWING_header_IN_sfp_50 )
            header3 = header
            @state.following.pop
            @adaptor.add_child( root_0, header3.tree )

          else
            break # out of loop for decision 3
          end
        end # loop for decision 3
        # at line 56:25: ( state | composite )?
        alt_4 = 3
        look_4_0 = @input.peek( 1 )

        if ( look_4_0 == ID )
          alt_4 = 1
        elsif ( look_4_0 == T__22 )
          alt_4 = 2
        end
        case alt_4
        when 1
          # at line 56:26: state
          @state.following.push( TOKENS_FOLLOWING_state_IN_sfp_54 )
          state4 = state
          @state.following.pop
          @adaptor.add_child( root_0, state4.tree )

        when 2
          # at line 56:34: composite
          @state.following.push( TOKENS_FOLLOWING_composite_IN_sfp_58 )
          composite5 = composite
          @state.following.pop
          @adaptor.add_child( root_0, composite5.tree )

        end
        # --> action
         resolve_missing_reftype 
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
        # trace_out( __method__, 1 )

      end
      
      return return_value
    end

    IncludeReturnValue = define_return_scope 

    # 
    # parser rule include
    # 
    # (in SFP.g)
    # 60:1: include : '#include' ( include_file | include_url ) ( NL )+ ;
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


        # at line 61:4: '#include' ( include_file | include_url ) ( NL )+
        string_literal6 = match( T__18, TOKENS_FOLLOWING_T__18_IN_include_75 )

        tree_for_string_literal6 = @adaptor.create_with_payload( string_literal6 )
        @adaptor.add_child( root_0, tree_for_string_literal6 )

        # at line 61:15: ( include_file | include_url )
        alt_5 = 2
        look_5_0 = @input.peek( 1 )

        if ( look_5_0 == T__19 )
          alt_5 = 1
        elsif ( look_5_0 == T__21 )
          alt_5 = 2
        else
          raise NoViableAlternative( "", 5, 0 )
        end
        case alt_5
        when 1
          # at line 61:17: include_file
          @state.following.push( TOKENS_FOLLOWING_include_file_IN_include_79 )
          include_file7 = include_file
          @state.following.pop
          @adaptor.add_child( root_0, include_file7.tree )

        when 2
          # at line 61:32: include_url
          @state.following.push( TOKENS_FOLLOWING_include_url_IN_include_83 )
          include_url8 = include_url
          @state.following.pop
          @adaptor.add_child( root_0, include_url8.tree )

        end
        # at file 61:46: ( NL )+
        match_count_6 = 0
        while true
          alt_6 = 2
          look_6_0 = @input.peek( 1 )

          if ( look_6_0 == NL )
            alt_6 = 1

          end
          case alt_6
          when 1
            # at line 61:46: NL
            __NL9__ = match( NL, TOKENS_FOLLOWING_NL_IN_include_87 )

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
    # 64:1: include_file : 'file(' STRING ')' ;
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


        # at line 65:4: 'file(' STRING ')'
        string_literal10 = match( T__19, TOKENS_FOLLOWING_T__19_IN_include_file_99 )

        tree_for_string_literal10 = @adaptor.create_with_payload( string_literal10 )
        @adaptor.add_child( root_0, tree_for_string_literal10 )

        __STRING11__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_include_file_101 )

        tree_for_STRING11 = @adaptor.create_with_payload( __STRING11__ )
        @adaptor.add_child( root_0, tree_for_STRING11 )

        char_literal12 = match( T__20, TOKENS_FOLLOWING_T__20_IN_include_file_103 )

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
    # 75:1: include_url : 'url(' STRING ')' ;
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


        # at line 76:4: 'url(' STRING ')'
        string_literal13 = match( T__21, TOKENS_FOLLOWING_T__21_IN_include_url_119 )

        tree_for_string_literal13 = @adaptor.create_with_payload( string_literal13 )
        @adaptor.add_child( root_0, tree_for_string_literal13 )

        __STRING14__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_include_url_121 )

        tree_for_STRING14 = @adaptor.create_with_payload( __STRING14__ )
        @adaptor.add_child( root_0, tree_for_STRING14 )

        char_literal15 = match( T__20, TOKENS_FOLLOWING_T__20_IN_include_url_123 )

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
    # 87:1: header : ( class_definition | action );
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
        # at line 88:2: ( class_definition | action )
        alt_7 = 2
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == T__25 )
          alt_7 = 1
        elsif ( look_7_0 == T__30 )
          alt_7 = 2
        else
          raise NoViableAlternative( "", 7, 0 )
        end
        case alt_7
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 88:4: class_definition
          @state.following.push( TOKENS_FOLLOWING_class_definition_IN_header_138 )
          class_definition16 = class_definition
          @state.following.pop
          @adaptor.add_child( root_0, class_definition16.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 89:4: action
          @state.following.push( TOKENS_FOLLOWING_action_IN_header_143 )
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
    # 92:1: state : ( attribute )+ ( constraint )* ;
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


        # at line 93:4: ( attribute )+ ( constraint )*
        # --> action

        			@now.set('init', Sfplanner::Lang::ContextState.new('init', @now))
        			@now = @now.get('init')
        		
        # <-- action
        # at file 97:3: ( attribute )+
        match_count_8 = 0
        while true
          alt_8 = 2
          look_8_0 = @input.peek( 1 )

          if ( look_8_0 == ID )
            alt_8 = 1

          end
          case alt_8
          when 1
            # at line 97:3: attribute
            @state.following.push( TOKENS_FOLLOWING_attribute_IN_state_158 )
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

        # at line 97:14: ( constraint )*
        while true # decision 9
          alt_9 = 2
          look_9_0 = @input.peek( 1 )

          if ( look_9_0 == T__35 )
            alt_9 = 1

          end
          case alt_9
          when 1
            # at line 97:14: constraint
            @state.following.push( TOKENS_FOLLOWING_constraint_IN_state_161 )
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
    # 101:1: composite : 'composite' ID '{' ( NL )* ( attribute | constraint )* '}' ( NL )* ;
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


        # at line 102:4: 'composite' ID '{' ( NL )* ( attribute | constraint )* '}' ( NL )*
        string_literal20 = match( T__22, TOKENS_FOLLOWING_T__22_IN_composite_177 )

        tree_for_string_literal20 = @adaptor.create_with_payload( string_literal20 )
        @adaptor.add_child( root_0, tree_for_string_literal20 )

        __ID21__ = match( ID, TOKENS_FOLLOWING_ID_IN_composite_179 )

        tree_for_ID21 = @adaptor.create_with_payload( __ID21__ )
        @adaptor.add_child( root_0, tree_for_ID21 )

        char_literal22 = match( T__23, TOKENS_FOLLOWING_T__23_IN_composite_181 )

        tree_for_char_literal22 = @adaptor.create_with_payload( char_literal22 )
        @adaptor.add_child( root_0, tree_for_char_literal22 )

        # at line 102:23: ( NL )*
        while true # decision 10
          alt_10 = 2
          look_10_0 = @input.peek( 1 )

          if ( look_10_0 == NL )
            alt_10 = 1

          end
          case alt_10
          when 1
            # at line 102:23: NL
            __NL23__ = match( NL, TOKENS_FOLLOWING_NL_IN_composite_183 )

            tree_for_NL23 = @adaptor.create_with_payload( __NL23__ )
            @adaptor.add_child( root_0, tree_for_NL23 )


          else
            break # out of loop for decision 10
          end
        end # loop for decision 10
        # at line 102:27: ( attribute | constraint )*
        while true # decision 11
          alt_11 = 3
          look_11_0 = @input.peek( 1 )

          if ( look_11_0 == ID )
            alt_11 = 1
          elsif ( look_11_0 == T__35 )
            alt_11 = 2

          end
          case alt_11
          when 1
            # at line 102:29: attribute
            @state.following.push( TOKENS_FOLLOWING_attribute_IN_composite_188 )
            attribute24 = attribute
            @state.following.pop
            @adaptor.add_child( root_0, attribute24.tree )

          when 2
            # at line 102:41: constraint
            @state.following.push( TOKENS_FOLLOWING_constraint_IN_composite_192 )
            constraint25 = constraint
            @state.following.pop
            @adaptor.add_child( root_0, constraint25.tree )

          else
            break # out of loop for decision 11
          end
        end # loop for decision 11
        char_literal26 = match( T__24, TOKENS_FOLLOWING_T__24_IN_composite_197 )

        tree_for_char_literal26 = @adaptor.create_with_payload( char_literal26 )
        @adaptor.add_child( root_0, tree_for_char_literal26 )

        # at line 102:59: ( NL )*
        while true # decision 12
          alt_12 = 2
          look_12_0 = @input.peek( 1 )

          if ( look_12_0 == NL )
            alt_12 = 1

          end
          case alt_12
          when 1
            # at line 102:59: NL
            __NL27__ = match( NL, TOKENS_FOLLOWING_NL_IN_composite_199 )

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
    # 105:1: class_definition : 'class' ID ( extends_class )? ( '{' ( NL )* ( attribute | action )* '}' )? ( NL )* ;
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


        # at line 106:4: 'class' ID ( extends_class )? ( '{' ( NL )* ( attribute | action )* '}' )? ( NL )*
        string_literal28 = match( T__25, TOKENS_FOLLOWING_T__25_IN_class_definition_211 )

        tree_for_string_literal28 = @adaptor.create_with_payload( string_literal28 )
        @adaptor.add_child( root_0, tree_for_string_literal28 )

        __ID29__ = match( ID, TOKENS_FOLLOWING_ID_IN_class_definition_213 )

        tree_for_ID29 = @adaptor.create_with_payload( __ID29__ )
        @adaptor.add_child( root_0, tree_for_ID29 )

        # --> action

        			@now.set(__ID29__.text, Sfplanner::Lang::ContextClass.new(__ID29__.text, @now))
        			@now = @now.get(__ID29__.text)
        		
        # <-- action
        # at line 111:3: ( extends_class )?
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0 == T__26 )
          alt_13 = 1
        end
        case alt_13
        when 1
          # at line 111:4: extends_class
          @state.following.push( TOKENS_FOLLOWING_extends_class_IN_class_definition_222 )
          extends_class30 = extends_class
          @state.following.pop
          @adaptor.add_child( root_0, extends_class30.tree )
          # --> action

          				@now.supertype = ( extends_class30.nil? ? nil : extends_class30.value )
          				copyXtoY(@now.supertype, @now)
          			
          # <-- action

        end
        # at line 117:3: ( '{' ( NL )* ( attribute | action )* '}' )?
        alt_16 = 2
        look_16_0 = @input.peek( 1 )

        if ( look_16_0 == T__23 )
          alt_16 = 1
        end
        case alt_16
        when 1
          # at line 117:4: '{' ( NL )* ( attribute | action )* '}'
          char_literal31 = match( T__23, TOKENS_FOLLOWING_T__23_IN_class_definition_237 )

          tree_for_char_literal31 = @adaptor.create_with_payload( char_literal31 )
          @adaptor.add_child( root_0, tree_for_char_literal31 )

          # at line 117:8: ( NL )*
          while true # decision 14
            alt_14 = 2
            look_14_0 = @input.peek( 1 )

            if ( look_14_0 == NL )
              alt_14 = 1

            end
            case alt_14
            when 1
              # at line 117:8: NL
              __NL32__ = match( NL, TOKENS_FOLLOWING_NL_IN_class_definition_239 )

              tree_for_NL32 = @adaptor.create_with_payload( __NL32__ )
              @adaptor.add_child( root_0, tree_for_NL32 )


            else
              break # out of loop for decision 14
            end
          end # loop for decision 14
          # at line 117:12: ( attribute | action )*
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
              # at line 117:14: attribute
              @state.following.push( TOKENS_FOLLOWING_attribute_IN_class_definition_244 )
              attribute33 = attribute
              @state.following.pop
              @adaptor.add_child( root_0, attribute33.tree )

            when 2
              # at line 117:26: action
              @state.following.push( TOKENS_FOLLOWING_action_IN_class_definition_248 )
              action34 = action
              @state.following.pop
              @adaptor.add_child( root_0, action34.tree )

            else
              break # out of loop for decision 15
            end
          end # loop for decision 15
          char_literal35 = match( T__24, TOKENS_FOLLOWING_T__24_IN_class_definition_253 )

          tree_for_char_literal35 = @adaptor.create_with_payload( char_literal35 )
          @adaptor.add_child( root_0, tree_for_char_literal35 )


        end
        # at line 117:42: ( NL )*
        while true # decision 17
          alt_17 = 2
          look_17_0 = @input.peek( 1 )

          if ( look_17_0 == NL )
            alt_17 = 1

          end
          case alt_17
          when 1
            # at line 117:42: NL
            __NL36__ = match( NL, TOKENS_FOLLOWING_NL_IN_class_definition_257 )

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
    # 121:1: extends_class returns [ value ] : 'extends' path ;
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


        # at line 122:4: 'extends' path
        string_literal37 = match( T__26, TOKENS_FOLLOWING_T__26_IN_extends_class_278 )

        tree_for_string_literal37 = @adaptor.create_with_payload( string_literal37 )
        @adaptor.add_child( root_0, tree_for_string_literal37 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_extends_class_280 )
        path38 = path
        @state.following.pop
        @adaptor.add_child( root_0, path38.tree )
        # --> action

        			c = @root.get(( path38 && @input.to_s( path38.start, path38.stop ) ))
        			if c == nil
        				raise 'undefined super class "' + ( path38 && @input.to_s( path38.start, path38.stop ) ) + '"'
        			else
        				return_value.value = @root.get(( path38 && @input.to_s( path38.start, path38.stop ) ))
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
        # trace_out( __method__, 9 )

      end
      
      return return_value
    end

    AttributeReturnValue = define_return_scope 

    # 
    # parser rule attribute
    # 
    # (in SFP.g)
    # 133:1: attribute : ( ID ( value | reference_type ) ( NL )+ | object_def ( NL )+ );
    # 
    def attribute
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )
      return_value = AttributeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID39__ = nil
      __NL42__ = nil
      __NL44__ = nil
      value40 = nil
      reference_type41 = nil
      object_def43 = nil

      tree_for_ID39 = nil
      tree_for_NL42 = nil
      tree_for_NL44 = nil

      begin
        # at line 134:2: ( ID ( value | reference_type ) ( NL )+ | object_def ( NL )+ )
        alt_21 = 2
        look_21_0 = @input.peek( 1 )

        if ( look_21_0 == ID )
          look_21_1 = @input.peek( 2 )

          if ( look_21_1 == T__27 )
            look_21_2 = @input.peek( 3 )

            if ( look_21_2 == T__49 )
              alt_21 = 1
            elsif ( look_21_2 == ID )
              alt_21 = 2
            else
              raise NoViableAlternative( "", 21, 2 )
            end
          elsif ( look_21_1 == STRING || look_21_1.between?( INTEGER, FLOAT ) || look_21_1 == T__31 || look_21_1 == T__52 )
            alt_21 = 1
          else
            raise NoViableAlternative( "", 21, 1 )
          end
        else
          raise NoViableAlternative( "", 21, 0 )
        end
        case alt_21
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 134:4: ID ( value | reference_type ) ( NL )+
          __ID39__ = match( ID, TOKENS_FOLLOWING_ID_IN_attribute_295 )

          tree_for_ID39 = @adaptor.create_with_payload( __ID39__ )
          @adaptor.add_child( root_0, tree_for_ID39 )

          # at line 135:3: ( value | reference_type )
          alt_18 = 2
          look_18_0 = @input.peek( 1 )

          if ( look_18_0 == STRING || look_18_0.between?( INTEGER, FLOAT ) || look_18_0 == T__31 || look_18_0 == T__52 )
            alt_18 = 1
          elsif ( look_18_0 == T__27 )
            alt_18 = 2
          else
            raise NoViableAlternative( "", 18, 0 )
          end
          case alt_18
          when 1
            # at line 135:5: value
            @state.following.push( TOKENS_FOLLOWING_value_IN_attribute_301 )
            value40 = value
            @state.following.pop
            @adaptor.add_child( root_0, value40.tree )
            # --> action
             @now.set(__ID39__.text, ( value40.nil? ? nil : value40.val )) 
            # <-- action

          when 2
            # at line 136:5: reference_type
            @state.following.push( TOKENS_FOLLOWING_reference_type_IN_attribute_309 )
            reference_type41 = reference_type
            @state.following.pop
            @adaptor.add_child( root_0, reference_type41.tree )
            # --> action
             @now.set(__ID39__.text, ( reference_type41.nil? ? nil : reference_type41.value )) 
            # <-- action

          end
          # at file 138:3: ( NL )+
          match_count_19 = 0
          while true
            alt_19 = 2
            look_19_0 = @input.peek( 1 )

            if ( look_19_0 == NL )
              alt_19 = 1

            end
            case alt_19
            when 1
              # at line 138:3: NL
              __NL42__ = match( NL, TOKENS_FOLLOWING_NL_IN_attribute_319 )

              tree_for_NL42 = @adaptor.create_with_payload( __NL42__ )
              @adaptor.add_child( root_0, tree_for_NL42 )


            else
              match_count_19 > 0 and break
              eee = EarlyExit(19)


              raise eee
            end
            match_count_19 += 1
          end


        when 2
          root_0 = @adaptor.create_flat_list


          # at line 139:4: object_def ( NL )+
          @state.following.push( TOKENS_FOLLOWING_object_def_IN_attribute_325 )
          object_def43 = object_def
          @state.following.pop
          @adaptor.add_child( root_0, object_def43.tree )
          # at file 139:15: ( NL )+
          match_count_20 = 0
          while true
            alt_20 = 2
            look_20_0 = @input.peek( 1 )

            if ( look_20_0 == NL )
              alt_20 = 1

            end
            case alt_20
            when 1
              # at line 139:15: NL
              __NL44__ = match( NL, TOKENS_FOLLOWING_NL_IN_attribute_327 )

              tree_for_NL44 = @adaptor.create_with_payload( __NL44__ )
              @adaptor.add_child( root_0, tree_for_NL44 )


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
        # trace_out( __method__, 10 )

      end
      
      return return_value
    end

    ObjectDefReturnValue = define_return_scope 

    # 
    # parser rule object_def
    # 
    # (in SFP.g)
    # 142:1: object_def : ID 'as' path ( '{' ( NL )* ( object_attribute | state_dependency )* '}' )? ;
    # 
    def object_def
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )
      return_value = ObjectDefReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID45__ = nil
      string_literal46 = nil
      char_literal48 = nil
      __NL49__ = nil
      char_literal52 = nil
      path47 = nil
      object_attribute50 = nil
      state_dependency51 = nil

      tree_for_ID45 = nil
      tree_for_string_literal46 = nil
      tree_for_char_literal48 = nil
      tree_for_NL49 = nil
      tree_for_char_literal52 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 143:5: ID 'as' path ( '{' ( NL )* ( object_attribute | state_dependency )* '}' )?
        __ID45__ = match( ID, TOKENS_FOLLOWING_ID_IN_object_def_340 )

        tree_for_ID45 = @adaptor.create_with_payload( __ID45__ )
        @adaptor.add_child( root_0, tree_for_ID45 )

        string_literal46 = match( T__27, TOKENS_FOLLOWING_T__27_IN_object_def_342 )

        tree_for_string_literal46 = @adaptor.create_with_payload( string_literal46 )
        @adaptor.add_child( root_0, tree_for_string_literal46 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_object_def_344 )
        path47 = path
        @state.following.pop
        @adaptor.add_child( root_0, path47.tree )
        # --> action

        		c = @root.get(( path47 && @input.to_s( path47.start, path47.stop ) ))
        		if c.is_a?(Sfplanner::Lang::ContextClass)
        			@now.set(__ID45__.text, c.new_object(__ID45__.text, @now))
        			@now = @now.get(__ID45__.text)
        		elsif c.is_a?(Sfplanner::Lang::ContextObject)
        			c = c.clone
        			c.name = __ID45__.text
        			c.owner = @now
        			@now.set(__ID45__.text, c)
        			@now = c
        		else
        			raise 'undefined super class "' + ( path47 && @input.to_s( path47.start, path47.stop ) ) + '"'
        		end
        	
        # <-- action
        # at line 159:2: ( '{' ( NL )* ( object_attribute | state_dependency )* '}' )?
        alt_24 = 2
        look_24_0 = @input.peek( 1 )

        if ( look_24_0 == T__23 )
          alt_24 = 1
        end
        case alt_24
        when 1
          # at line 159:3: '{' ( NL )* ( object_attribute | state_dependency )* '}'
          char_literal48 = match( T__23, TOKENS_FOLLOWING_T__23_IN_object_def_351 )

          tree_for_char_literal48 = @adaptor.create_with_payload( char_literal48 )
          @adaptor.add_child( root_0, tree_for_char_literal48 )

          # at line 159:7: ( NL )*
          while true # decision 22
            alt_22 = 2
            look_22_0 = @input.peek( 1 )

            if ( look_22_0 == NL )
              alt_22 = 1

            end
            case alt_22
            when 1
              # at line 159:7: NL
              __NL49__ = match( NL, TOKENS_FOLLOWING_NL_IN_object_def_353 )

              tree_for_NL49 = @adaptor.create_with_payload( __NL49__ )
              @adaptor.add_child( root_0, tree_for_NL49 )


            else
              break # out of loop for decision 22
            end
          end # loop for decision 22
          # at line 159:11: ( object_attribute | state_dependency )*
          while true # decision 23
            alt_23 = 3
            look_23_0 = @input.peek( 1 )

            if ( look_23_0 == ID )
              alt_23 = 1
            elsif ( look_23_0 == T__28 )
              alt_23 = 2

            end
            case alt_23
            when 1
              # at line 159:13: object_attribute
              @state.following.push( TOKENS_FOLLOWING_object_attribute_IN_object_def_358 )
              object_attribute50 = object_attribute
              @state.following.pop
              @adaptor.add_child( root_0, object_attribute50.tree )

            when 2
              # at line 159:32: state_dependency
              @state.following.push( TOKENS_FOLLOWING_state_dependency_IN_object_def_362 )
              state_dependency51 = state_dependency
              @state.following.pop
              @adaptor.add_child( root_0, state_dependency51.tree )

            else
              break # out of loop for decision 23
            end
          end # loop for decision 23
          char_literal52 = match( T__24, TOKENS_FOLLOWING_T__24_IN_object_def_367 )

          tree_for_char_literal52 = @adaptor.create_with_payload( char_literal52 )
          @adaptor.add_child( root_0, tree_for_char_literal52 )


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
        # trace_out( __method__, 11 )

      end
      
      return return_value
    end

    ObjectAttributeReturnValue = define_return_scope 

    # 
    # parser rule object_attribute
    # 
    # (in SFP.g)
    # 163:1: object_attribute : ( attribute | ID NULL ( NL )+ );
    # 
    def object_attribute
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )
      return_value = ObjectAttributeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID54__ = nil
      __NULL55__ = nil
      __NL56__ = nil
      attribute53 = nil

      tree_for_ID54 = nil
      tree_for_NULL55 = nil
      tree_for_NL56 = nil

      begin
        # at line 164:2: ( attribute | ID NULL ( NL )+ )
        alt_26 = 2
        look_26_0 = @input.peek( 1 )

        if ( look_26_0 == ID )
          look_26_1 = @input.peek( 2 )

          if ( look_26_1 == STRING || look_26_1.between?( INTEGER, FLOAT ) || look_26_1 == T__27 || look_26_1 == T__31 || look_26_1 == T__52 )
            alt_26 = 1
          elsif ( look_26_1 == NULL )
            alt_26 = 2
          else
            raise NoViableAlternative( "", 26, 1 )
          end
        else
          raise NoViableAlternative( "", 26, 0 )
        end
        case alt_26
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 164:4: attribute
          @state.following.push( TOKENS_FOLLOWING_attribute_IN_object_attribute_384 )
          attribute53 = attribute
          @state.following.pop
          @adaptor.add_child( root_0, attribute53.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 165:4: ID NULL ( NL )+
          __ID54__ = match( ID, TOKENS_FOLLOWING_ID_IN_object_attribute_389 )

          tree_for_ID54 = @adaptor.create_with_payload( __ID54__ )
          @adaptor.add_child( root_0, tree_for_ID54 )

          __NULL55__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_object_attribute_391 )

          tree_for_NULL55 = @adaptor.create_with_payload( __NULL55__ )
          @adaptor.add_child( root_0, tree_for_NULL55 )

          # --> action
           @now.set(__ID54__.text, Sfplanner::Lang::ContextNull.new('null', @now)) 
          # <-- action
          # at file 165:83: ( NL )+
          match_count_25 = 0
          while true
            alt_25 = 2
            look_25_0 = @input.peek( 1 )

            if ( look_25_0 == NL )
              alt_25 = 1

            end
            case alt_25
            when 1
              # at line 165:83: NL
              __NL56__ = match( NL, TOKENS_FOLLOWING_NL_IN_object_attribute_395 )

              tree_for_NL56 = @adaptor.create_with_payload( __NL56__ )
              @adaptor.add_child( root_0, tree_for_NL56 )


            else
              match_count_25 > 0 and break
              eee = EarlyExit(25)


              raise eee
            end
            match_count_25 += 1
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
    # 168:1: state_dependency : 'when' dep_effect ( NL )* 'then' ( NL )* '{' ( NL )* ( dep_condition )+ '}' ( NL )+ ;
    # 
    def state_dependency
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )
      return_value = StateDependencyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal57 = nil
      __NL59__ = nil
      string_literal60 = nil
      __NL61__ = nil
      char_literal62 = nil
      __NL63__ = nil
      char_literal65 = nil
      __NL66__ = nil
      dep_effect58 = nil
      dep_condition64 = nil

      tree_for_string_literal57 = nil
      tree_for_NL59 = nil
      tree_for_string_literal60 = nil
      tree_for_NL61 = nil
      tree_for_char_literal62 = nil
      tree_for_NL63 = nil
      tree_for_char_literal65 = nil
      tree_for_NL66 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 169:4: 'when' dep_effect ( NL )* 'then' ( NL )* '{' ( NL )* ( dep_condition )+ '}' ( NL )+
        string_literal57 = match( T__28, TOKENS_FOLLOWING_T__28_IN_state_dependency_407 )

        tree_for_string_literal57 = @adaptor.create_with_payload( string_literal57 )
        @adaptor.add_child( root_0, tree_for_string_literal57 )

        @state.following.push( TOKENS_FOLLOWING_dep_effect_IN_state_dependency_409 )
        dep_effect58 = dep_effect
        @state.following.pop
        @adaptor.add_child( root_0, dep_effect58.tree )
        # at line 169:22: ( NL )*
        while true # decision 27
          alt_27 = 2
          look_27_0 = @input.peek( 1 )

          if ( look_27_0 == NL )
            alt_27 = 1

          end
          case alt_27
          when 1
            # at line 169:22: NL
            __NL59__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_411 )

            tree_for_NL59 = @adaptor.create_with_payload( __NL59__ )
            @adaptor.add_child( root_0, tree_for_NL59 )


          else
            break # out of loop for decision 27
          end
        end # loop for decision 27
        string_literal60 = match( T__29, TOKENS_FOLLOWING_T__29_IN_state_dependency_414 )

        tree_for_string_literal60 = @adaptor.create_with_payload( string_literal60 )
        @adaptor.add_child( root_0, tree_for_string_literal60 )

        # at line 169:33: ( NL )*
        while true # decision 28
          alt_28 = 2
          look_28_0 = @input.peek( 1 )

          if ( look_28_0 == NL )
            alt_28 = 1

          end
          case alt_28
          when 1
            # at line 169:33: NL
            __NL61__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_416 )

            tree_for_NL61 = @adaptor.create_with_payload( __NL61__ )
            @adaptor.add_child( root_0, tree_for_NL61 )


          else
            break # out of loop for decision 28
          end
        end # loop for decision 28
        char_literal62 = match( T__23, TOKENS_FOLLOWING_T__23_IN_state_dependency_419 )

        tree_for_char_literal62 = @adaptor.create_with_payload( char_literal62 )
        @adaptor.add_child( root_0, tree_for_char_literal62 )

        # at line 169:41: ( NL )*
        while true # decision 29
          alt_29 = 2
          look_29_0 = @input.peek( 1 )

          if ( look_29_0 == NL )
            alt_29 = 1

          end
          case alt_29
          when 1
            # at line 169:41: NL
            __NL63__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_421 )

            tree_for_NL63 = @adaptor.create_with_payload( __NL63__ )
            @adaptor.add_child( root_0, tree_for_NL63 )


          else
            break # out of loop for decision 29
          end
        end # loop for decision 29
        # at file 169:45: ( dep_condition )+
        match_count_30 = 0
        while true
          alt_30 = 2
          look_30_0 = @input.peek( 1 )

          if ( look_30_0 == T__52 )
            alt_30 = 1

          end
          case alt_30
          when 1
            # at line 169:46: dep_condition
            @state.following.push( TOKENS_FOLLOWING_dep_condition_IN_state_dependency_425 )
            dep_condition64 = dep_condition
            @state.following.pop
            @adaptor.add_child( root_0, dep_condition64.tree )

          else
            match_count_30 > 0 and break
            eee = EarlyExit(30)


            raise eee
          end
          match_count_30 += 1
        end

        char_literal65 = match( T__24, TOKENS_FOLLOWING_T__24_IN_state_dependency_429 )

        tree_for_char_literal65 = @adaptor.create_with_payload( char_literal65 )
        @adaptor.add_child( root_0, tree_for_char_literal65 )

        # at file 169:66: ( NL )+
        match_count_31 = 0
        while true
          alt_31 = 2
          look_31_0 = @input.peek( 1 )

          if ( look_31_0 == NL )
            alt_31 = 1

          end
          case alt_31
          when 1
            # at line 169:66: NL
            __NL66__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_431 )

            tree_for_NL66 = @adaptor.create_with_payload( __NL66__ )
            @adaptor.add_child( root_0, tree_for_NL66 )


          else
            match_count_31 > 0 and break
            eee = EarlyExit(31)


            raise eee
          end
          match_count_31 += 1
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
    # 172:1: dep_effect : reference ( value | NULL ) ;
    # 
    def dep_effect
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )
      return_value = DepEffectReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL69__ = nil
      reference67 = nil
      value68 = nil

      tree_for_NULL69 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 173:4: reference ( value | NULL )
        @state.following.push( TOKENS_FOLLOWING_reference_IN_dep_effect_443 )
        reference67 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference67.tree )
        # at line 173:14: ( value | NULL )
        alt_32 = 2
        look_32_0 = @input.peek( 1 )

        if ( look_32_0 == STRING || look_32_0.between?( INTEGER, FLOAT ) || look_32_0 == T__31 || look_32_0 == T__52 )
          alt_32 = 1
        elsif ( look_32_0 == NULL )
          alt_32 = 2
        else
          raise NoViableAlternative( "", 32, 0 )
        end
        case alt_32
        when 1
          # at line 173:16: value
          @state.following.push( TOKENS_FOLLOWING_value_IN_dep_effect_447 )
          value68 = value
          @state.following.pop
          @adaptor.add_child( root_0, value68.tree )

        when 2
          # at line 173:24: NULL
          __NULL69__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_dep_effect_451 )

          tree_for_NULL69 = @adaptor.create_with_payload( __NULL69__ )
          @adaptor.add_child( root_0, tree_for_NULL69 )


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
    # 176:1: dep_condition : reference ( value | NULL ) ( NL )+ ;
    # 
    def dep_condition
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )
      return_value = DepConditionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL72__ = nil
      __NL73__ = nil
      reference70 = nil
      value71 = nil

      tree_for_NULL72 = nil
      tree_for_NL73 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 177:4: reference ( value | NULL ) ( NL )+
        @state.following.push( TOKENS_FOLLOWING_reference_IN_dep_condition_464 )
        reference70 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference70.tree )
        # at line 177:14: ( value | NULL )
        alt_33 = 2
        look_33_0 = @input.peek( 1 )

        if ( look_33_0 == STRING || look_33_0.between?( INTEGER, FLOAT ) || look_33_0 == T__31 || look_33_0 == T__52 )
          alt_33 = 1
        elsif ( look_33_0 == NULL )
          alt_33 = 2
        else
          raise NoViableAlternative( "", 33, 0 )
        end
        case alt_33
        when 1
          # at line 177:16: value
          @state.following.push( TOKENS_FOLLOWING_value_IN_dep_condition_468 )
          value71 = value
          @state.following.pop
          @adaptor.add_child( root_0, value71.tree )

        when 2
          # at line 177:24: NULL
          __NULL72__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_dep_condition_472 )

          tree_for_NULL72 = @adaptor.create_with_payload( __NULL72__ )
          @adaptor.add_child( root_0, tree_for_NULL72 )


        end
        # at file 177:31: ( NL )+
        match_count_34 = 0
        while true
          alt_34 = 2
          look_34_0 = @input.peek( 1 )

          if ( look_34_0 == NL )
            alt_34 = 1

          end
          case alt_34
          when 1
            # at line 177:31: NL
            __NL73__ = match( NL, TOKENS_FOLLOWING_NL_IN_dep_condition_476 )

            tree_for_NL73 = @adaptor.create_with_payload( __NL73__ )
            @adaptor.add_child( root_0, tree_for_NL73 )


          else
            match_count_34 > 0 and break
            eee = EarlyExit(34)


            raise eee
          end
          match_count_34 += 1
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
    # 180:1: action : 'action' ID ( parameters )? '{' ( NL )* precondition postcondition '}' ( NL )+ ;
    # 
    def action
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )
      return_value = ActionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal74 = nil
      __ID75__ = nil
      char_literal77 = nil
      __NL78__ = nil
      char_literal81 = nil
      __NL82__ = nil
      parameters76 = nil
      precondition79 = nil
      postcondition80 = nil

      tree_for_string_literal74 = nil
      tree_for_ID75 = nil
      tree_for_char_literal77 = nil
      tree_for_NL78 = nil
      tree_for_char_literal81 = nil
      tree_for_NL82 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 181:4: 'action' ID ( parameters )? '{' ( NL )* precondition postcondition '}' ( NL )+
        string_literal74 = match( T__30, TOKENS_FOLLOWING_T__30_IN_action_488 )

        tree_for_string_literal74 = @adaptor.create_with_payload( string_literal74 )
        @adaptor.add_child( root_0, tree_for_string_literal74 )

        __ID75__ = match( ID, TOKENS_FOLLOWING_ID_IN_action_490 )

        tree_for_ID75 = @adaptor.create_with_payload( __ID75__ )
        @adaptor.add_child( root_0, tree_for_ID75 )

        # --> action

        			@now.set(__ID75__.text, Sfplanner::Lang::ContextAction.new(__ID75__.text, @now))
        			@now = @now.get(__ID75__.text)
        		
        # <-- action
        # at line 186:3: ( parameters )?
        alt_35 = 2
        look_35_0 = @input.peek( 1 )

        if ( look_35_0 == T__31 )
          alt_35 = 1
        end
        case alt_35
        when 1
          # at line 186:3: parameters
          @state.following.push( TOKENS_FOLLOWING_parameters_IN_action_498 )
          parameters76 = parameters
          @state.following.pop
          @adaptor.add_child( root_0, parameters76.tree )

        end
        char_literal77 = match( T__23, TOKENS_FOLLOWING_T__23_IN_action_501 )

        tree_for_char_literal77 = @adaptor.create_with_payload( char_literal77 )
        @adaptor.add_child( root_0, tree_for_char_literal77 )

        # at line 186:19: ( NL )*
        while true # decision 36
          alt_36 = 2
          look_36_0 = @input.peek( 1 )

          if ( look_36_0 == NL )
            alt_36 = 1

          end
          case alt_36
          when 1
            # at line 186:19: NL
            __NL78__ = match( NL, TOKENS_FOLLOWING_NL_IN_action_503 )

            tree_for_NL78 = @adaptor.create_with_payload( __NL78__ )
            @adaptor.add_child( root_0, tree_for_NL78 )


          else
            break # out of loop for decision 36
          end
        end # loop for decision 36
        @state.following.push( TOKENS_FOLLOWING_precondition_IN_action_506 )
        precondition79 = precondition
        @state.following.pop
        @adaptor.add_child( root_0, precondition79.tree )
        @state.following.push( TOKENS_FOLLOWING_postcondition_IN_action_508 )
        postcondition80 = postcondition
        @state.following.pop
        @adaptor.add_child( root_0, postcondition80.tree )
        char_literal81 = match( T__24, TOKENS_FOLLOWING_T__24_IN_action_510 )

        tree_for_char_literal81 = @adaptor.create_with_payload( char_literal81 )
        @adaptor.add_child( root_0, tree_for_char_literal81 )

        # at file 186:54: ( NL )+
        match_count_37 = 0
        while true
          alt_37 = 2
          look_37_0 = @input.peek( 1 )

          if ( look_37_0 == NL )
            alt_37 = 1

          end
          case alt_37
          when 1
            # at line 186:54: NL
            __NL82__ = match( NL, TOKENS_FOLLOWING_NL_IN_action_512 )

            tree_for_NL82 = @adaptor.create_with_payload( __NL82__ )
            @adaptor.add_child( root_0, tree_for_NL82 )


          else
            match_count_37 > 0 and break
            eee = EarlyExit(37)


            raise eee
          end
          match_count_37 += 1
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
    # 190:1: parameters : '(' parameter ( ',' parameter )* ')' ;
    # 
    def parameters
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      return_value = ParametersReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal83 = nil
      char_literal85 = nil
      char_literal87 = nil
      parameter84 = nil
      parameter86 = nil

      tree_for_char_literal83 = nil
      tree_for_char_literal85 = nil
      tree_for_char_literal87 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 191:4: '(' parameter ( ',' parameter )* ')'
        char_literal83 = match( T__31, TOKENS_FOLLOWING_T__31_IN_parameters_528 )

        tree_for_char_literal83 = @adaptor.create_with_payload( char_literal83 )
        @adaptor.add_child( root_0, tree_for_char_literal83 )

        @state.following.push( TOKENS_FOLLOWING_parameter_IN_parameters_530 )
        parameter84 = parameter
        @state.following.pop
        @adaptor.add_child( root_0, parameter84.tree )
        # at line 191:18: ( ',' parameter )*
        while true # decision 38
          alt_38 = 2
          look_38_0 = @input.peek( 1 )

          if ( look_38_0 == T__32 )
            alt_38 = 1

          end
          case alt_38
          when 1
            # at line 191:19: ',' parameter
            char_literal85 = match( T__32, TOKENS_FOLLOWING_T__32_IN_parameters_533 )

            tree_for_char_literal85 = @adaptor.create_with_payload( char_literal85 )
            @adaptor.add_child( root_0, tree_for_char_literal85 )

            @state.following.push( TOKENS_FOLLOWING_parameter_IN_parameters_535 )
            parameter86 = parameter
            @state.following.pop
            @adaptor.add_child( root_0, parameter86.tree )

          else
            break # out of loop for decision 38
          end
        end # loop for decision 38
        char_literal87 = match( T__20, TOKENS_FOLLOWING_T__20_IN_parameters_539 )

        tree_for_char_literal87 = @adaptor.create_with_payload( char_literal87 )
        @adaptor.add_child( root_0, tree_for_char_literal87 )

        # - - - - - - - rule clean up - - - - - - - -
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
    # 194:1: parameter : ID reference_type ;
    # 
    def parameter
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      return_value = ParameterReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID88__ = nil
      reference_type89 = nil

      tree_for_ID88 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 195:4: ID reference_type
        __ID88__ = match( ID, TOKENS_FOLLOWING_ID_IN_parameter_551 )

        tree_for_ID88 = @adaptor.create_with_payload( __ID88__ )
        @adaptor.add_child( root_0, tree_for_ID88 )

        @state.following.push( TOKENS_FOLLOWING_reference_type_IN_parameter_553 )
        reference_type89 = reference_type
        @state.following.pop
        @adaptor.add_child( root_0, reference_type89.tree )
        # --> action

        			@now.set(__ID88__.text, ( reference_type89.nil? ? nil : reference_type89.value ))
        		
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

    PreconditionReturnValue = define_return_scope 

    # 
    # parser rule precondition
    # 
    # (in SFP.g)
    # 201:1: precondition : 'precondition' '{' ( NL )* constraint_body '}' ( NL )+ ;
    # 
    def precondition
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      return_value = PreconditionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal90 = nil
      char_literal91 = nil
      __NL92__ = nil
      char_literal94 = nil
      __NL95__ = nil
      constraint_body93 = nil

      tree_for_string_literal90 = nil
      tree_for_char_literal91 = nil
      tree_for_NL92 = nil
      tree_for_char_literal94 = nil
      tree_for_NL95 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 202:4: 'precondition' '{' ( NL )* constraint_body '}' ( NL )+
        string_literal90 = match( T__33, TOKENS_FOLLOWING_T__33_IN_precondition_568 )

        tree_for_string_literal90 = @adaptor.create_with_payload( string_literal90 )
        @adaptor.add_child( root_0, tree_for_string_literal90 )

        # --> action

        			@now.set('precondition', Sfplanner::Lang::ContextConstraint.new('precondition', @now))
        			@now = @now.get('precondition')
        		
        # <-- action
        char_literal91 = match( T__23, TOKENS_FOLLOWING_T__23_IN_precondition_576 )

        tree_for_char_literal91 = @adaptor.create_with_payload( char_literal91 )
        @adaptor.add_child( root_0, tree_for_char_literal91 )

        # at line 207:7: ( NL )*
        while true # decision 39
          alt_39 = 2
          look_39_0 = @input.peek( 1 )

          if ( look_39_0 == NL )
            alt_39 = 1

          end
          case alt_39
          when 1
            # at line 207:7: NL
            __NL92__ = match( NL, TOKENS_FOLLOWING_NL_IN_precondition_578 )

            tree_for_NL92 = @adaptor.create_with_payload( __NL92__ )
            @adaptor.add_child( root_0, tree_for_NL92 )


          else
            break # out of loop for decision 39
          end
        end # loop for decision 39
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_precondition_581 )
        constraint_body93 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body93.tree )
        char_literal94 = match( T__24, TOKENS_FOLLOWING_T__24_IN_precondition_583 )

        tree_for_char_literal94 = @adaptor.create_with_payload( char_literal94 )
        @adaptor.add_child( root_0, tree_for_char_literal94 )

        # at file 207:31: ( NL )+
        match_count_40 = 0
        while true
          alt_40 = 2
          look_40_0 = @input.peek( 1 )

          if ( look_40_0 == NL )
            alt_40 = 1

          end
          case alt_40
          when 1
            # at line 207:31: NL
            __NL95__ = match( NL, TOKENS_FOLLOWING_NL_IN_precondition_585 )

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
    # 211:1: postcondition : 'postcondition' '{' ( NL )* postcondition_body '}' ( NL )+ ;
    # 
    def postcondition
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = PostconditionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal96 = nil
      char_literal97 = nil
      __NL98__ = nil
      char_literal100 = nil
      __NL101__ = nil
      postcondition_body99 = nil

      tree_for_string_literal96 = nil
      tree_for_char_literal97 = nil
      tree_for_NL98 = nil
      tree_for_char_literal100 = nil
      tree_for_NL101 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 212:4: 'postcondition' '{' ( NL )* postcondition_body '}' ( NL )+
        string_literal96 = match( T__34, TOKENS_FOLLOWING_T__34_IN_postcondition_601 )

        tree_for_string_literal96 = @adaptor.create_with_payload( string_literal96 )
        @adaptor.add_child( root_0, tree_for_string_literal96 )

        # --> action

        			@now.set('postcondition', Sfplanner::Lang::ContextMutation.new('postcondition', @now))
        			@now = @now.get('postcondition')
        		
        # <-- action
        char_literal97 = match( T__23, TOKENS_FOLLOWING_T__23_IN_postcondition_609 )

        tree_for_char_literal97 = @adaptor.create_with_payload( char_literal97 )
        @adaptor.add_child( root_0, tree_for_char_literal97 )

        # at line 217:7: ( NL )*
        while true # decision 41
          alt_41 = 2
          look_41_0 = @input.peek( 1 )

          if ( look_41_0 == NL )
            alt_41 = 1

          end
          case alt_41
          when 1
            # at line 217:7: NL
            __NL98__ = match( NL, TOKENS_FOLLOWING_NL_IN_postcondition_611 )

            tree_for_NL98 = @adaptor.create_with_payload( __NL98__ )
            @adaptor.add_child( root_0, tree_for_NL98 )


          else
            break # out of loop for decision 41
          end
        end # loop for decision 41
        @state.following.push( TOKENS_FOLLOWING_postcondition_body_IN_postcondition_614 )
        postcondition_body99 = postcondition_body
        @state.following.pop
        @adaptor.add_child( root_0, postcondition_body99.tree )
        char_literal100 = match( T__24, TOKENS_FOLLOWING_T__24_IN_postcondition_616 )

        tree_for_char_literal100 = @adaptor.create_with_payload( char_literal100 )
        @adaptor.add_child( root_0, tree_for_char_literal100 )

        # at file 217:34: ( NL )+
        match_count_42 = 0
        while true
          alt_42 = 2
          look_42_0 = @input.peek( 1 )

          if ( look_42_0 == NL )
            alt_42 = 1

          end
          case alt_42
          when 1
            # at line 217:34: NL
            __NL101__ = match( NL, TOKENS_FOLLOWING_NL_IN_postcondition_618 )

            tree_for_NL101 = @adaptor.create_with_payload( __NL101__ )
            @adaptor.add_child( root_0, tree_for_NL101 )


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
        # trace_out( __method__, 20 )

      end
      
      return return_value
    end

    ConstraintReturnValue = define_return_scope 

    # 
    # parser rule constraint
    # 
    # (in SFP.g)
    # 221:1: constraint : 'constraint' ID '{' ( NL )* constraint_body '}' ( NL )+ ;
    # 
    def constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = ConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal102 = nil
      __ID103__ = nil
      char_literal104 = nil
      __NL105__ = nil
      char_literal107 = nil
      __NL108__ = nil
      constraint_body106 = nil

      tree_for_string_literal102 = nil
      tree_for_ID103 = nil
      tree_for_char_literal104 = nil
      tree_for_NL105 = nil
      tree_for_char_literal107 = nil
      tree_for_NL108 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 222:4: 'constraint' ID '{' ( NL )* constraint_body '}' ( NL )+
        string_literal102 = match( T__35, TOKENS_FOLLOWING_T__35_IN_constraint_634 )

        tree_for_string_literal102 = @adaptor.create_with_payload( string_literal102 )
        @adaptor.add_child( root_0, tree_for_string_literal102 )

        __ID103__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_636 )

        tree_for_ID103 = @adaptor.create_with_payload( __ID103__ )
        @adaptor.add_child( root_0, tree_for_ID103 )

        # --> action

        			@now.set(__ID103__.text, Sfplanner::Lang::ContextConstraint.new(__ID103__.text, @now))
        			@now = @now.get(__ID103__.text)
        		
        # <-- action
        char_literal104 = match( T__23, TOKENS_FOLLOWING_T__23_IN_constraint_645 )

        tree_for_char_literal104 = @adaptor.create_with_payload( char_literal104 )
        @adaptor.add_child( root_0, tree_for_char_literal104 )

        # at line 227:7: ( NL )*
        while true # decision 43
          alt_43 = 2
          look_43_0 = @input.peek( 1 )

          if ( look_43_0 == NL )
            alt_43 = 1

          end
          case alt_43
          when 1
            # at line 227:7: NL
            __NL105__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_647 )

            tree_for_NL105 = @adaptor.create_with_payload( __NL105__ )
            @adaptor.add_child( root_0, tree_for_NL105 )


          else
            break # out of loop for decision 43
          end
        end # loop for decision 43
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_constraint_650 )
        constraint_body106 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body106.tree )
        char_literal107 = match( T__24, TOKENS_FOLLOWING_T__24_IN_constraint_652 )

        tree_for_char_literal107 = @adaptor.create_with_payload( char_literal107 )
        @adaptor.add_child( root_0, tree_for_char_literal107 )

        # at file 227:31: ( NL )+
        match_count_44 = 0
        while true
          alt_44 = 2
          look_44_0 = @input.peek( 1 )

          if ( look_44_0 == NL )
            alt_44 = 1

          end
          case alt_44
          when 1
            # at line 227:31: NL
            __NL108__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_654 )

            tree_for_NL108 = @adaptor.create_with_payload( __NL108__ )
            @adaptor.add_child( root_0, tree_for_NL108 )


          else
            match_count_44 > 0 and break
            eee = EarlyExit(44)


            raise eee
          end
          match_count_44 += 1
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
    # 231:1: constraint_body : ( constraint_statement ( NL )+ )* ;
    # 
    def constraint_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = ConstraintBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL110__ = nil
      constraint_statement109 = nil

      tree_for_NL110 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 232:4: ( constraint_statement ( NL )+ )*
        # at line 232:4: ( constraint_statement ( NL )+ )*
        while true # decision 46
          alt_46 = 2
          look_46_0 = @input.peek( 1 )

          if ( look_46_0 == T__42 || look_46_0 == T__52 )
            alt_46 = 1

          end
          case alt_46
          when 1
            # at line 232:5: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_671 )
            constraint_statement109 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement109.tree )
            # at file 232:26: ( NL )+
            match_count_45 = 0
            while true
              alt_45 = 2
              look_45_0 = @input.peek( 1 )

              if ( look_45_0 == NL )
                alt_45 = 1

              end
              case alt_45
              when 1
                # at line 232:26: NL
                __NL110__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_body_673 )

                tree_for_NL110 = @adaptor.create_with_payload( __NL110__ )
                @adaptor.add_child( root_0, tree_for_NL110 )


              else
                match_count_45 > 0 and break
                eee = EarlyExit(45)


                raise eee
              end
              match_count_45 += 1
            end


          else
            break # out of loop for decision 46
          end
        end # loop for decision 46
        # - - - - - - - rule clean up - - - - - - - -
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
    # 235:1: constraint_statement : ( reference value | reference NULL | reference 'not' value | reference 'in' set_value | conditional_constraint | reference '<' comp_value | reference '<=' comp_value | reference '>=' comp_value | reference '>' comp_value );
    # 
    def constraint_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
      return_value = ConstraintStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL114__ = nil
      string_literal116 = nil
      string_literal119 = nil
      char_literal123 = nil
      string_literal126 = nil
      string_literal129 = nil
      char_literal132 = nil
      reference111 = nil
      value112 = nil
      reference113 = nil
      reference115 = nil
      value117 = nil
      reference118 = nil
      set_value120 = nil
      conditional_constraint121 = nil
      reference122 = nil
      comp_value124 = nil
      reference125 = nil
      comp_value127 = nil
      reference128 = nil
      comp_value130 = nil
      reference131 = nil
      comp_value133 = nil

      tree_for_NULL114 = nil
      tree_for_string_literal116 = nil
      tree_for_string_literal119 = nil
      tree_for_char_literal123 = nil
      tree_for_string_literal126 = nil
      tree_for_string_literal129 = nil
      tree_for_char_literal132 = nil

      begin
        # at line 236:2: ( reference value | reference NULL | reference 'not' value | reference 'in' set_value | conditional_constraint | reference '<' comp_value | reference '<=' comp_value | reference '>=' comp_value | reference '>' comp_value )
        alt_47 = 9
        alt_47 = @dfa47.predict( @input )
        case alt_47
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 236:4: reference value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_687 )
          reference111 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference111.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_689 )
          value112 = value
          @state.following.pop
          @adaptor.add_child( root_0, value112.tree )
          # --> action
           @now.set(( reference111 && @input.to_s( reference111.start, reference111.stop ) ), ( value112.nil? ? nil : value112.val )) 
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 237:4: reference NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_696 )
          reference113 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference113.tree )
          __NULL114__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_constraint_statement_698 )

          tree_for_NULL114 = @adaptor.create_with_payload( __NULL114__ )
          @adaptor.add_child( root_0, tree_for_NULL114 )

          # --> action
           @now.set(( reference113 && @input.to_s( reference113.start, reference113.stop ) ), Sfplanner::Lang::ContextNull.new('null', @now)) 
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 238:4: reference 'not' value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_706 )
          reference115 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference115.tree )
          string_literal116 = match( T__36, TOKENS_FOLLOWING_T__36_IN_constraint_statement_708 )

          tree_for_string_literal116 = @adaptor.create_with_payload( string_literal116 )
          @adaptor.add_child( root_0, tree_for_string_literal116 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_710 )
          value117 = value
          @state.following.pop
          @adaptor.add_child( root_0, value117.tree )
          # --> action
           @now.set(( reference115 && @input.to_s( reference115.start, reference115.stop ) ), Sfplanner::Lang::ContextNot.new(@now, ( value117.nil? ? nil : value117.val ))) 
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 239:4: reference 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_717 )
          reference118 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference118.tree )
          string_literal119 = match( T__37, TOKENS_FOLLOWING_T__37_IN_constraint_statement_719 )

          tree_for_string_literal119 = @adaptor.create_with_payload( string_literal119 )
          @adaptor.add_child( root_0, tree_for_string_literal119 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_721 )
          set_value120 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value120.tree )
          # --> action
           @now.set(( reference118 && @input.to_s( reference118.start, reference118.stop ) ), Sfplanner::Lang::ContextIn.new(@now, ( set_value120.nil? ? nil : set_value120.val ))) 
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 240:4: conditional_constraint
          @state.following.push( TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_728 )
          conditional_constraint121 = conditional_constraint
          @state.following.pop
          @adaptor.add_child( root_0, conditional_constraint121.tree )

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 241:4: reference '<' comp_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_733 )
          reference122 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference122.tree )
          char_literal123 = match( T__38, TOKENS_FOLLOWING_T__38_IN_constraint_statement_735 )

          tree_for_char_literal123 = @adaptor.create_with_payload( char_literal123 )
          @adaptor.add_child( root_0, tree_for_char_literal123 )

          @state.following.push( TOKENS_FOLLOWING_comp_value_IN_constraint_statement_737 )
          comp_value124 = comp_value
          @state.following.pop
          @adaptor.add_child( root_0, comp_value124.tree )
          # --> action
           @now.set(( reference122 && @input.to_s( reference122.start, reference122.stop ) ), Sfplanner::Lang::ContextLess.new(@now, ( comp_value124.nil? ? nil : comp_value124.value ))) 
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 243:4: reference '<=' comp_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_747 )
          reference125 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference125.tree )
          string_literal126 = match( T__39, TOKENS_FOLLOWING_T__39_IN_constraint_statement_749 )

          tree_for_string_literal126 = @adaptor.create_with_payload( string_literal126 )
          @adaptor.add_child( root_0, tree_for_string_literal126 )

          @state.following.push( TOKENS_FOLLOWING_comp_value_IN_constraint_statement_751 )
          comp_value127 = comp_value
          @state.following.pop
          @adaptor.add_child( root_0, comp_value127.tree )
          # --> action
           @now.set(( reference125 && @input.to_s( reference125.start, reference125.stop ) ), Sfplanner::Lang::ContextLessEquals.new(@now, ( comp_value127.nil? ? nil : comp_value127.value ))) 
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 245:4: reference '>=' comp_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_761 )
          reference128 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference128.tree )
          string_literal129 = match( T__40, TOKENS_FOLLOWING_T__40_IN_constraint_statement_763 )

          tree_for_string_literal129 = @adaptor.create_with_payload( string_literal129 )
          @adaptor.add_child( root_0, tree_for_string_literal129 )

          @state.following.push( TOKENS_FOLLOWING_comp_value_IN_constraint_statement_765 )
          comp_value130 = comp_value
          @state.following.pop
          @adaptor.add_child( root_0, comp_value130.tree )
          # --> action
           @now.set(( reference128 && @input.to_s( reference128.start, reference128.stop ) ), Sfplanner::Lang::ContextGreaterEquals.new(@now, ( comp_value130.nil? ? nil : comp_value130.value ))) 
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 247:4: reference '>' comp_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_775 )
          reference131 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference131.tree )
          char_literal132 = match( T__41, TOKENS_FOLLOWING_T__41_IN_constraint_statement_777 )

          tree_for_char_literal132 = @adaptor.create_with_payload( char_literal132 )
          @adaptor.add_child( root_0, tree_for_char_literal132 )

          @state.following.push( TOKENS_FOLLOWING_comp_value_IN_constraint_statement_779 )
          comp_value133 = comp_value
          @state.following.pop
          @adaptor.add_child( root_0, comp_value133.tree )
          # --> action
           @now.set(( reference131 && @input.to_s( reference131.start, reference131.stop ) ), Sfplanner::Lang::ContextGreater.new(@now, ( comp_value133.nil? ? nil : comp_value133.value ))) 
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
        # trace_out( __method__, 23 )

      end
      
      return return_value
    end

    CompValueReturnValue = define_return_scope :value

    # 
    # parser rule comp_value
    # 
    # (in SFP.g)
    # 251:1: comp_value returns [ value ] : ( INTEGER | reference );
    # 
    def comp_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = CompValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __INTEGER134__ = nil
      reference135 = nil

      tree_for_INTEGER134 = nil

      begin
        # at line 252:2: ( INTEGER | reference )
        alt_48 = 2
        look_48_0 = @input.peek( 1 )

        if ( look_48_0 == INTEGER )
          alt_48 = 1
        elsif ( look_48_0 == T__52 )
          alt_48 = 2
        else
          raise NoViableAlternative( "", 48, 0 )
        end
        case alt_48
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 252:4: INTEGER
          __INTEGER134__ = match( INTEGER, TOKENS_FOLLOWING_INTEGER_IN_comp_value_799 )

          tree_for_INTEGER134 = @adaptor.create_with_payload( __INTEGER134__ )
          @adaptor.add_child( root_0, tree_for_INTEGER134 )

          # --> action
           return_value.value = __INTEGER134__.text.to_i 
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 253:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_comp_value_808 )
          reference135 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference135.tree )
          # --> action
           return_value.value = Sfplanner::Lang::Reference.new(( reference135 && @input.to_s( reference135.start, reference135.stop ) )) 
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
        # trace_out( __method__, 24 )

      end
      
      return return_value
    end

    ConditionalConstraintReturnValue = define_return_scope 

    # 
    # parser rule conditional_constraint
    # 
    # (in SFP.g)
    # 256:1: conditional_constraint : 'if' constraint_statement ( NL )* conditional_constraint_then ;
    # 
    def conditional_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = ConditionalConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal136 = nil
      __NL138__ = nil
      constraint_statement137 = nil
      conditional_constraint_then139 = nil

      tree_for_string_literal136 = nil
      tree_for_NL138 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 257:4: 'if' constraint_statement ( NL )* conditional_constraint_then
        string_literal136 = match( T__42, TOKENS_FOLLOWING_T__42_IN_conditional_constraint_821 )

        tree_for_string_literal136 = @adaptor.create_with_payload( string_literal136 )
        @adaptor.add_child( root_0, tree_for_string_literal136 )

        # --> action

        			id = next_anonymous_id.to_s
        			@now.set(id, Sfplanner::Lang::ContextConditional.new(@now))
        			@now = @now.get(id)
        			@now.if_clause = true
        		
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_829 )
        constraint_statement137 = constraint_statement
        @state.following.pop
        @adaptor.add_child( root_0, constraint_statement137.tree )
        # at line 264:24: ( NL )*
        while true # decision 49
          alt_49 = 2
          look_49_0 = @input.peek( 1 )

          if ( look_49_0 == NL )
            alt_49 = 1

          end
          case alt_49
          when 1
            # at line 264:24: NL
            __NL138__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditional_constraint_831 )

            tree_for_NL138 = @adaptor.create_with_payload( __NL138__ )
            @adaptor.add_child( root_0, tree_for_NL138 )


          else
            break # out of loop for decision 49
          end
        end # loop for decision 49
        @state.following.push( TOKENS_FOLLOWING_conditional_constraint_then_IN_conditional_constraint_834 )
        conditional_constraint_then139 = conditional_constraint_then
        @state.following.pop
        @adaptor.add_child( root_0, conditional_constraint_then139.tree )
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
        # trace_out( __method__, 25 )

      end
      
      return return_value
    end

    ConditionalConstraintThenReturnValue = define_return_scope 

    # 
    # parser rule conditional_constraint_then
    # 
    # (in SFP.g)
    # 268:1: conditional_constraint_then : 'then' constraint_statement ;
    # 
    def conditional_constraint_then
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = ConditionalConstraintThenReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal140 = nil
      constraint_statement141 = nil

      tree_for_string_literal140 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 269:4: 'then' constraint_statement
        string_literal140 = match( T__29, TOKENS_FOLLOWING_T__29_IN_conditional_constraint_then_849 )

        tree_for_string_literal140 = @adaptor.create_with_payload( string_literal140 )
        @adaptor.add_child( root_0, tree_for_string_literal140 )

        # --> action
         @now.if_clause = false 
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_853 )
        constraint_statement141 = constraint_statement
        @state.following.pop
        @adaptor.add_child( root_0, constraint_statement141.tree )
        # - - - - - - - rule clean up - - - - - - - -
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
    # 272:1: postcondition_body : ( mutation_statement ( NL )+ )* ;
    # 
    def postcondition_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = PostconditionBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL143__ = nil
      mutation_statement142 = nil

      tree_for_NL143 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 273:4: ( mutation_statement ( NL )+ )*
        # at line 273:4: ( mutation_statement ( NL )+ )*
        while true # decision 51
          alt_51 = 2
          look_51_0 = @input.peek( 1 )

          if ( look_51_0 == T__52 )
            alt_51 = 1

          end
          case alt_51
          when 1
            # at line 273:5: mutation_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_postcondition_body_865 )
            mutation_statement142 = mutation_statement
            @state.following.pop
            @adaptor.add_child( root_0, mutation_statement142.tree )
            # at file 273:24: ( NL )+
            match_count_50 = 0
            while true
              alt_50 = 2
              look_50_0 = @input.peek( 1 )

              if ( look_50_0 == NL )
                alt_50 = 1

              end
              case alt_50
              when 1
                # at line 273:24: NL
                __NL143__ = match( NL, TOKENS_FOLLOWING_NL_IN_postcondition_body_867 )

                tree_for_NL143 = @adaptor.create_with_payload( __NL143__ )
                @adaptor.add_child( root_0, tree_for_NL143 )


              else
                match_count_50 > 0 and break
                eee = EarlyExit(50)


                raise eee
              end
              match_count_50 += 1
            end


          else
            break # out of loop for decision 51
          end
        end # loop for decision 51
        # - - - - - - - rule clean up - - - - - - - -
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
    # 276:1: mutation_statement : ( reference value | reference NULL | reference '+=' formula_value | reference '-=' formula_value | reference '*=' formula_value | reference '/=' formula_value | reference formula );
    # 
    def mutation_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = MutationStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL147__ = nil
      string_literal149 = nil
      string_literal152 = nil
      string_literal155 = nil
      string_literal158 = nil
      reference144 = nil
      value145 = nil
      reference146 = nil
      reference148 = nil
      formula_value150 = nil
      reference151 = nil
      formula_value153 = nil
      reference154 = nil
      formula_value156 = nil
      reference157 = nil
      formula_value159 = nil
      reference160 = nil
      formula161 = nil

      tree_for_NULL147 = nil
      tree_for_string_literal149 = nil
      tree_for_string_literal152 = nil
      tree_for_string_literal155 = nil
      tree_for_string_literal158 = nil

      begin
        # at line 277:2: ( reference value | reference NULL | reference '+=' formula_value | reference '-=' formula_value | reference '*=' formula_value | reference '/=' formula_value | reference formula )
        alt_52 = 7
        alt_52 = @dfa52.predict( @input )
        case alt_52
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 277:4: reference value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_881 )
          reference144 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference144.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_883 )
          value145 = value
          @state.following.pop
          @adaptor.add_child( root_0, value145.tree )
          # --> action
           @now.set(( reference144 && @input.to_s( reference144.start, reference144.stop ) ), ( value145.nil? ? nil : value145.val )) 
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 278:4: reference NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_890 )
          reference146 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference146.tree )
          __NULL147__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_mutation_statement_892 )

          tree_for_NULL147 = @adaptor.create_with_payload( __NULL147__ )
          @adaptor.add_child( root_0, tree_for_NULL147 )

          # --> action
           @now.set(( reference146 && @input.to_s( reference146.start, reference146.stop ) ), Sfplanner::Lang::ContextNull.new('null')) 
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 279:4: reference '+=' formula_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_900 )
          reference148 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference148.tree )
          string_literal149 = match( T__43, TOKENS_FOLLOWING_T__43_IN_mutation_statement_902 )

          tree_for_string_literal149 = @adaptor.create_with_payload( string_literal149 )
          @adaptor.add_child( root_0, tree_for_string_literal149 )

          @state.following.push( TOKENS_FOLLOWING_formula_value_IN_mutation_statement_904 )
          formula_value150 = formula_value
          @state.following.pop
          @adaptor.add_child( root_0, formula_value150.tree )
          # --> action
           @now.set(( reference148 && @input.to_s( reference148.start, reference148.stop ) ), Sfplanner::Lang::ContextBinaryAdd.new(@now, ( formula_value150.nil? ? nil : formula_value150.value ))) 
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 281:4: reference '-=' formula_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_914 )
          reference151 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference151.tree )
          string_literal152 = match( T__44, TOKENS_FOLLOWING_T__44_IN_mutation_statement_916 )

          tree_for_string_literal152 = @adaptor.create_with_payload( string_literal152 )
          @adaptor.add_child( root_0, tree_for_string_literal152 )

          @state.following.push( TOKENS_FOLLOWING_formula_value_IN_mutation_statement_918 )
          formula_value153 = formula_value
          @state.following.pop
          @adaptor.add_child( root_0, formula_value153.tree )
          # --> action
           @now.set(( reference151 && @input.to_s( reference151.start, reference151.stop ) ), Sfplanner::Lang::ContextBinarySubstract.new(@now, ( formula_value153.nil? ? nil : formula_value153.value ))) 
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 283:4: reference '*=' formula_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_928 )
          reference154 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference154.tree )
          string_literal155 = match( T__45, TOKENS_FOLLOWING_T__45_IN_mutation_statement_930 )

          tree_for_string_literal155 = @adaptor.create_with_payload( string_literal155 )
          @adaptor.add_child( root_0, tree_for_string_literal155 )

          @state.following.push( TOKENS_FOLLOWING_formula_value_IN_mutation_statement_932 )
          formula_value156 = formula_value
          @state.following.pop
          @adaptor.add_child( root_0, formula_value156.tree )
          # --> action
           @now.set(( reference154 && @input.to_s( reference154.start, reference154.stop ) ), Sfplanner::Lang::ContextBinaryMultiply.new(@now, ( formula_value156.nil? ? nil : formula_value156.value ))) 
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 285:4: reference '/=' formula_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_942 )
          reference157 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference157.tree )
          string_literal158 = match( T__46, TOKENS_FOLLOWING_T__46_IN_mutation_statement_944 )

          tree_for_string_literal158 = @adaptor.create_with_payload( string_literal158 )
          @adaptor.add_child( root_0, tree_for_string_literal158 )

          @state.following.push( TOKENS_FOLLOWING_formula_value_IN_mutation_statement_946 )
          formula_value159 = formula_value
          @state.following.pop
          @adaptor.add_child( root_0, formula_value159.tree )
          # --> action
           @now.set(( reference157 && @input.to_s( reference157.start, reference157.stop ) ), Sfplanner::Lang::ContextBinaryDivide.new(@now, ( formula_value159.nil? ? nil : formula_value159.value ))) 
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 287:4: reference formula
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_956 )
          reference160 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference160.tree )
          @state.following.push( TOKENS_FOLLOWING_formula_IN_mutation_statement_958 )
          formula161 = formula
          @state.following.pop
          @adaptor.add_child( root_0, formula161.tree )
          # --> action
           @now.set(( reference160 && @input.to_s( reference160.start, reference160.stop ) ), ( formula161.nil? ? nil : formula161.value )) 
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
        # trace_out( __method__, 28 )

      end
      
      return return_value
    end

    FormulaValueReturnValue = define_return_scope :value

    # 
    # parser rule formula_value
    # 
    # (in SFP.g)
    # 291:1: formula_value returns [ value ] : ( INTEGER | reference );
    # 
    def formula_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = FormulaValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __INTEGER162__ = nil
      reference163 = nil

      tree_for_INTEGER162 = nil

      begin
        # at line 292:2: ( INTEGER | reference )
        alt_53 = 2
        look_53_0 = @input.peek( 1 )

        if ( look_53_0 == INTEGER )
          alt_53 = 1
        elsif ( look_53_0 == T__52 )
          alt_53 = 2
        else
          raise NoViableAlternative( "", 53, 0 )
        end
        case alt_53
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 292:4: INTEGER
          __INTEGER162__ = match( INTEGER, TOKENS_FOLLOWING_INTEGER_IN_formula_value_978 )

          tree_for_INTEGER162 = @adaptor.create_with_payload( __INTEGER162__ )
          @adaptor.add_child( root_0, tree_for_INTEGER162 )

          # --> action
           return_value.value = __INTEGER162__.text.to_i 
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 293:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_formula_value_987 )
          reference163 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference163.tree )
          # --> action
           return_value.value = Sfplanner::Lang::Reference.new(( reference163 && @input.to_s( reference163.start, reference163.stop ) )) 
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

    FormulaReturnValue = define_return_scope :value

    # 
    # parser rule formula
    # 
    # (in SFP.g)
    # 296:1: formula returns [ value ] : '(' formula_value ( formula_item )+ ')' ;
    # 
    def formula
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = FormulaReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal164 = nil
      char_literal167 = nil
      formula_value165 = nil
      formula_item166 = nil

      tree_for_char_literal164 = nil
      tree_for_char_literal167 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 297:4: '(' formula_value ( formula_item )+ ')'
        char_literal164 = match( T__31, TOKENS_FOLLOWING_T__31_IN_formula_1004 )

        tree_for_char_literal164 = @adaptor.create_with_payload( char_literal164 )
        @adaptor.add_child( root_0, tree_for_char_literal164 )

        # --> action

        			return_value.value = Sfplanner::Lang::ContextFormula.new(@now)
        			@now = return_value.value
        		
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_formula_value_IN_formula_1012 )
        formula_value165 = formula_value
        @state.following.pop
        @adaptor.add_child( root_0, formula_value165.tree )
        # --> action
         @now.add( formula_value.value ) 
        # <-- action
        # at file 303:3: ( formula_item )+
        match_count_54 = 0
        while true
          alt_54 = 2
          look_54_0 = @input.peek( 1 )

          if ( look_54_0.between?( T__47, T__50 ) )
            alt_54 = 1

          end
          case alt_54
          when 1
            # at line 303:3: formula_item
            @state.following.push( TOKENS_FOLLOWING_formula_item_IN_formula_1018 )
            formula_item166 = formula_item
            @state.following.pop
            @adaptor.add_child( root_0, formula_item166.tree )

          else
            match_count_54 > 0 and break
            eee = EarlyExit(54)


            raise eee
          end
          match_count_54 += 1
        end

        # --> action
        	@now = @now.owner  
        # <-- action
        char_literal167 = match( T__20, TOKENS_FOLLOWING_T__20_IN_formula_1027 )

        tree_for_char_literal167 = @adaptor.create_with_payload( char_literal167 )
        @adaptor.add_child( root_0, tree_for_char_literal167 )

        # - - - - - - - rule clean up - - - - - - - -
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

    FormulaItemReturnValue = define_return_scope 

    # 
    # parser rule formula_item
    # 
    # (in SFP.g)
    # 308:1: formula_item : formula_op formula_value ;
    # 
    def formula_item
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
      return_value = FormulaItemReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      formula_op168 = nil
      formula_value169 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 309:4: formula_op formula_value
        @state.following.push( TOKENS_FOLLOWING_formula_op_IN_formula_item_1038 )
        formula_op168 = formula_op
        @state.following.pop
        @adaptor.add_child( root_0, formula_op168.tree )
        @state.following.push( TOKENS_FOLLOWING_formula_value_IN_formula_item_1040 )
        formula_value169 = formula_value
        @state.following.pop
        @adaptor.add_child( root_0, formula_value169.tree )
        # --> action

        			case ( formula_op168 && @input.to_s( formula_op168.start, formula_op168.stop ) )
        			when '+'
        				@now.add( Sfplanner::Lang::ContextAdd(@now, ( formula_value169.nil? ? nil : formula_value169.value )) )
        			when '-'
        				@now.add( Sfplanner::Lang::ContextSubstract(@now, ( formula_value169.nil? ? nil : formula_value169.value )) )
        			when '*'
        				@now.add( Sfplanner::Lang::ContextMultiply(@now, ( formula_value169.nil? ? nil : formula_value169.value )) )
        			when '/'
        				@now.add( Sfplanner::Lang::ContextDivide(@now, ( formula_value169.nil? ? nil : formula_value169.value )) )
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
        # trace_out( __method__, 31 )

      end
      
      return return_value
    end

    FormulaOpReturnValue = define_return_scope 

    # 
    # parser rule formula_op
    # 
    # (in SFP.g)
    # 324:1: formula_op : ( '+' | '-' | '*' | '/' );
    # 
    def formula_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = FormulaOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set170 = nil

      tree_for_set170 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set170 = @input.look
        if @input.peek( 1 ).between?( T__47, T__50 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set170 ) )
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

    SetValueReturnValue = define_return_scope :val

    # 
    # parser rule set_value
    # 
    # (in SFP.g)
    # 328:1: set_value returns [ val ] : '(' ( set_item ( ',' set_item )* )? ')' ;
    # 
    def set_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
      return_value = SetValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal171 = nil
      char_literal173 = nil
      char_literal175 = nil
      set_item172 = nil
      set_item174 = nil

      tree_for_char_literal171 = nil
      tree_for_char_literal173 = nil
      tree_for_char_literal175 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 329:4: '(' ( set_item ( ',' set_item )* )? ')'
        # --> action

        			return_value.val = Sfplanner::Lang::ContextSet.new(@now)
        			@now = return_value.val
        		
        # <-- action
        char_literal171 = match( T__31, TOKENS_FOLLOWING_T__31_IN_set_value_1086 )

        tree_for_char_literal171 = @adaptor.create_with_payload( char_literal171 )
        @adaptor.add_child( root_0, tree_for_char_literal171 )

        # at line 333:7: ( set_item ( ',' set_item )* )?
        alt_56 = 2
        look_56_0 = @input.peek( 1 )

        if ( look_56_0 == STRING || look_56_0.between?( INTEGER, FLOAT ) || look_56_0 == T__31 || look_56_0 == T__52 )
          alt_56 = 1
        end
        case alt_56
        when 1
          # at line 333:9: set_item ( ',' set_item )*
          @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_1090 )
          set_item172 = set_item
          @state.following.pop
          @adaptor.add_child( root_0, set_item172.tree )
          # at line 333:18: ( ',' set_item )*
          while true # decision 55
            alt_55 = 2
            look_55_0 = @input.peek( 1 )

            if ( look_55_0 == T__32 )
              alt_55 = 1

            end
            case alt_55
            when 1
              # at line 333:19: ',' set_item
              char_literal173 = match( T__32, TOKENS_FOLLOWING_T__32_IN_set_value_1093 )

              tree_for_char_literal173 = @adaptor.create_with_payload( char_literal173 )
              @adaptor.add_child( root_0, tree_for_char_literal173 )

              @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_1095 )
              set_item174 = set_item
              @state.following.pop
              @adaptor.add_child( root_0, set_item174.tree )

            else
              break # out of loop for decision 55
            end
          end # loop for decision 55

        end
        char_literal175 = match( T__20, TOKENS_FOLLOWING_T__20_IN_set_value_1102 )

        tree_for_char_literal175 = @adaptor.create_with_payload( char_literal175 )
        @adaptor.add_child( root_0, tree_for_char_literal175 )

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
        # trace_out( __method__, 33 )

      end
      
      return return_value
    end

    SetItemReturnValue = define_return_scope 

    # 
    # parser rule set_item
    # 
    # (in SFP.g)
    # 337:1: set_item : value ;
    # 
    def set_item
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )
      return_value = SetItemReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      value176 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 338:4: value
        @state.following.push( TOKENS_FOLLOWING_value_IN_set_item_1117 )
        value176 = value
        @state.following.pop
        @adaptor.add_child( root_0, value176.tree )
        # --> action
         @now.add(( value176.nil? ? nil : value176.val )) 
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

    ValueReturnValue = define_return_scope :val

    # 
    # parser rule value
    # 
    # (in SFP.g)
    # 341:1: value returns [ val ] : ( primitive_value | reference | set_value );
    # 
    def value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
      return_value = ValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      primitive_value177 = nil
      reference178 = nil
      set_value179 = nil


      begin
        # at line 342:2: ( primitive_value | reference | set_value )
        alt_57 = 3
        case look_57 = @input.peek( 1 )
        when STRING, INTEGER, BOOLEAN, FLOAT then alt_57 = 1
        when T__52 then alt_57 = 2
        when T__31 then alt_57 = 3
        else
          raise NoViableAlternative( "", 57, 0 )
        end
        case alt_57
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 342:4: primitive_value
          @state.following.push( TOKENS_FOLLOWING_primitive_value_IN_value_1134 )
          primitive_value177 = primitive_value
          @state.following.pop
          @adaptor.add_child( root_0, primitive_value177.tree )
          # --> action
           return_value.val = ( primitive_value177.nil? ? nil : primitive_value177.value ) 
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 343:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_value_1141 )
          reference178 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference178.tree )
          # --> action
           return_value.val = Sfplanner::Lang::Reference.new(( reference178 && @input.to_s( reference178.start, reference178.stop ) )) 
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 344:4: set_value
          @state.following.push( TOKENS_FOLLOWING_set_value_IN_value_1148 )
          set_value179 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value179.tree )
          # --> action
           return_value.val = ( set_value179.nil? ? nil : set_value179.val ) 
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

    PrimitiveValueReturnValue = define_return_scope :value

    # 
    # parser rule primitive_value
    # 
    # (in SFP.g)
    # 347:1: primitive_value returns [ value ] : ( BOOLEAN | INTEGER | FLOAT | STRING );
    # 
    def primitive_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
      return_value = PrimitiveValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __BOOLEAN180__ = nil
      __INTEGER181__ = nil
      __FLOAT182__ = nil
      __STRING183__ = nil

      tree_for_BOOLEAN180 = nil
      tree_for_INTEGER181 = nil
      tree_for_FLOAT182 = nil
      tree_for_STRING183 = nil

      begin
        # at line 348:2: ( BOOLEAN | INTEGER | FLOAT | STRING )
        alt_58 = 4
        case look_58 = @input.peek( 1 )
        when BOOLEAN then alt_58 = 1
        when INTEGER then alt_58 = 2
        when FLOAT then alt_58 = 3
        when STRING then alt_58 = 4
        else
          raise NoViableAlternative( "", 58, 0 )
        end
        case alt_58
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 348:4: BOOLEAN
          __BOOLEAN180__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_1165 )

          tree_for_BOOLEAN180 = @adaptor.create_with_payload( __BOOLEAN180__ )
          @adaptor.add_child( root_0, tree_for_BOOLEAN180 )

          # --> action
           return_value.value = (__BOOLEAN180__.text == 'true' ? true : false ) 
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 349:4: INTEGER
          __INTEGER181__ = match( INTEGER, TOKENS_FOLLOWING_INTEGER_IN_primitive_value_1172 )

          tree_for_INTEGER181 = @adaptor.create_with_payload( __INTEGER181__ )
          @adaptor.add_child( root_0, tree_for_INTEGER181 )

          # --> action
           return_value.value = __INTEGER181__.text.to_i 
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 350:4: FLOAT
          __FLOAT182__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_primitive_value_1179 )

          tree_for_FLOAT182 = @adaptor.create_with_payload( __FLOAT182__ )
          @adaptor.add_child( root_0, tree_for_FLOAT182 )

          # --> action
           return_value.value = __FLOAT182__.text.to_f 
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 351:4: STRING
          __STRING183__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_primitive_value_1188 )

          tree_for_STRING183 = @adaptor.create_with_payload( __STRING183__ )
          @adaptor.add_child( root_0, tree_for_STRING183 )

          # --> action
           return_value.value = __STRING183__.text[ 1, __STRING183__.text.length-2 ] 
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
        # trace_out( __method__, 36 )

      end
      
      return return_value
    end

    PathReturnValue = define_return_scope 

    # 
    # parser rule path
    # 
    # (in SFP.g)
    # 354:1: path : ID ( '.' ID )* ;
    # 
    def path
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )
      return_value = PathReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID184__ = nil
      char_literal185 = nil
      __ID186__ = nil

      tree_for_ID184 = nil
      tree_for_char_literal185 = nil
      tree_for_ID186 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 355:4: ID ( '.' ID )*
        __ID184__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_1202 )

        tree_for_ID184 = @adaptor.create_with_payload( __ID184__ )
        @adaptor.add_child( root_0, tree_for_ID184 )

        # at line 355:6: ( '.' ID )*
        while true # decision 59
          alt_59 = 2
          look_59_0 = @input.peek( 1 )

          if ( look_59_0 == T__51 )
            alt_59 = 1

          end
          case alt_59
          when 1
            # at line 355:7: '.' ID
            char_literal185 = match( T__51, TOKENS_FOLLOWING_T__51_IN_path_1204 )

            tree_for_char_literal185 = @adaptor.create_with_payload( char_literal185 )
            @adaptor.add_child( root_0, tree_for_char_literal185 )

            __ID186__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_1205 )

            tree_for_ID186 = @adaptor.create_with_payload( __ID186__ )
            @adaptor.add_child( root_0, tree_for_ID186 )


          else
            break # out of loop for decision 59
          end
        end # loop for decision 59
        # - - - - - - - rule clean up - - - - - - - -
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

    ReferenceReturnValue = define_return_scope 

    # 
    # parser rule reference
    # 
    # (in SFP.g)
    # 358:1: reference : '$' path ;
    # 
    def reference
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )
      return_value = ReferenceReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal187 = nil
      path188 = nil

      tree_for_char_literal187 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 359:4: '$' path
        char_literal187 = match( T__52, TOKENS_FOLLOWING_T__52_IN_reference_1218 )

        tree_for_char_literal187 = @adaptor.create_with_payload( char_literal187 )
        @adaptor.add_child( root_0, tree_for_char_literal187 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_reference_1219 )
        path188 = path
        @state.following.pop
        @adaptor.add_child( root_0, path188.tree )
        # - - - - - - - rule clean up - - - - - - - -
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

    ReferenceTypeReturnValue = define_return_scope :value

    # 
    # parser rule reference_type
    # 
    # (in SFP.g)
    # 362:1: reference_type returns [ value ] : 'as' '*' path ;
    # 
    def reference_type
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )
      return_value = ReferenceTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal189 = nil
      char_literal190 = nil
      path191 = nil

      tree_for_string_literal189 = nil
      tree_for_char_literal190 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 363:4: 'as' '*' path
        string_literal189 = match( T__27, TOKENS_FOLLOWING_T__27_IN_reference_type_1234 )

        tree_for_string_literal189 = @adaptor.create_with_payload( string_literal189 )
        @adaptor.add_child( root_0, tree_for_string_literal189 )

        char_literal190 = match( T__49, TOKENS_FOLLOWING_T__49_IN_reference_type_1236 )

        tree_for_char_literal190 = @adaptor.create_with_payload( char_literal190 )
        @adaptor.add_child( root_0, tree_for_char_literal190 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_reference_type_1237 )
        path191 = path
        @state.following.pop
        @adaptor.add_child( root_0, path191.tree )
        # --> action

        			return_value.value = Sfplanner::Lang::ContextReferenceType.new('null', @now, @root.get(( path191 && @input.to_s( path191.start, path191.stop ) )))
        			if return_value.value.supertype == nil
        				@missing_reftype[( path191 && @input.to_s( path191.start, path191.stop ) )] = return_value.value
        				#raise 'error undefine class "' + ( path191 && @input.to_s( path191.start, path191.stop ) ) + '"'
        			end
        			#puts ( path191 && @input.to_s( path191.start, path191.stop ) ) + " :: " + @root.get(( path191 && @input.to_s( path191.start, path191.stop ) )).to_s
        		
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

    BinaryOpReturnValue = define_return_scope 

    # 
    # parser rule binary_op
    # 
    # (in SFP.g)
    # 374:1: binary_op : ( '+=' | '-=' | '*=' | '/=' );
    # 
    def binary_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )
      return_value = BinaryOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set192 = nil

      tree_for_set192 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set192 = @input.look
        if @input.peek( 1 ).between?( T__43, T__46 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set192 ) )
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
    # 381:1: binary_comp : ( '>' | '>=' | '<' | '<=' );
    # 
    def binary_comp
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )
      return_value = BinaryCompReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set193 = nil

      tree_for_set193 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set193 = @input.look
        if @input.peek( 1 ).between?( T__38, T__41 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set193 ) )
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
    class DFA47 < ANTLR3::DFA
      EOT = unpack( 14, -1 )
      EOF = unpack( 14, -1 )
      MIN = unpack( 1, 42, 1, 6, 1, -1, 1, 5, 1, 6, 8, -1, 1, 5 )
      MAX = unpack( 1, 52, 1, 6, 1, -1, 1, 52, 1, 6, 8, -1, 1, 52 )
      ACCEPT = unpack( 2, -1, 1, 5, 2, -1, 1, 1, 1, 2, 1, 3, 1, 4, 1, 6, 
                       1, 7, 1, 8, 1, 9, 1, -1 )
      SPECIAL = unpack( 14, -1 )
      TRANSITION = [
        unpack( 1, 2, 9, -1, 1, 1 ),
        unpack( 1, 3 ),
        unpack(  ),
        unpack( 1, 5, 1, -1, 1, 6, 3, 5, 20, -1, 1, 5, 4, -1, 1, 7, 1, 
                 8, 1, 9, 1, 10, 1, 11, 1, 12, 9, -1, 1, 4, 1, 5 ),
        unpack( 1, 13 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 5, 1, -1, 1, 6, 3, 5, 20, -1, 1, 5, 4, -1, 1, 7, 1, 
                 8, 1, 9, 1, 10, 1, 11, 1, 12, 9, -1, 1, 4, 1, 5 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 47
      

      def description
        <<-'__dfa_description__'.strip!
          235:1: constraint_statement : ( reference value | reference NULL | reference 'not' value | reference 'in' set_value | conditional_constraint | reference '<' comp_value | reference '<=' comp_value | reference '>=' comp_value | reference '>' comp_value );
        __dfa_description__
      end
    end
    class DFA52 < ANTLR3::DFA
      EOT = unpack( 18, -1 )
      EOF = unpack( 18, -1 )
      MIN = unpack( 1, 52, 1, 6, 1, 5, 1, 6, 1, -1, 1, 5, 5, -1, 1, 5, 1, 
                    20, 1, 6, 1, -1, 1, 20, 1, 6, 1, 20 )
      MAX = unpack( 1, 52, 1, 6, 1, 52, 1, 6, 1, -1, 1, 52, 5, -1, 1, 52, 
                    1, 50, 1, 6, 1, -1, 1, 51, 1, 6, 1, 51 )
      ACCEPT = unpack( 4, -1, 1, 1, 1, -1, 1, 2, 1, 3, 1, 4, 1, 5, 1, 6, 
                       3, -1, 1, 7, 3, -1 )
      SPECIAL = unpack( 18, -1 )
      TRANSITION = [
        unpack( 1, 1 ),
        unpack( 1, 2 ),
        unpack( 1, 4, 1, -1, 1, 6, 3, 4, 20, -1, 1, 5, 11, -1, 1, 7, 1, 
                 8, 1, 9, 1, 10, 4, -1, 1, 3, 1, 4 ),
        unpack( 1, 11 ),
        unpack(  ),
        unpack( 1, 4, 2, -1, 1, 12, 2, 4, 9, -1, 1, 4, 10, -1, 1, 4, 20, 
                 -1, 1, 13 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 4, 1, -1, 1, 6, 3, 4, 20, -1, 1, 5, 11, -1, 1, 7, 1, 
                 8, 1, 9, 1, 10, 4, -1, 1, 3, 1, 4 ),
        unpack( 1, 4, 11, -1, 1, 4, 14, -1, 4, 14 ),
        unpack( 1, 15 ),
        unpack(  ),
        unpack( 1, 4, 11, -1, 1, 4, 14, -1, 4, 14, 1, 16 ),
        unpack( 1, 17 ),
        unpack( 1, 4, 11, -1, 1, 4, 14, -1, 4, 14, 1, 16 )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 52
      

      def description
        <<-'__dfa_description__'.strip!
          276:1: mutation_statement : ( reference value | reference NULL | reference '+=' formula_value | reference '-=' formula_value | reference '*=' formula_value | reference '/=' formula_value | reference formula );
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa47 = DFA47.new( self, 47 )
      @dfa52 = DFA52.new( self, 52 )

    end
    TOKENS_FOLLOWING_NL_IN_sfp_44 = Set[ 1, 4, 6, 18, 22, 25, 30 ]
    TOKENS_FOLLOWING_include_IN_sfp_47 = Set[ 1, 6, 18, 22, 25, 30 ]
    TOKENS_FOLLOWING_header_IN_sfp_50 = Set[ 1, 6, 22, 25, 30 ]
    TOKENS_FOLLOWING_state_IN_sfp_54 = Set[ 1 ]
    TOKENS_FOLLOWING_composite_IN_sfp_58 = Set[ 1 ]
    TOKENS_FOLLOWING_T__18_IN_include_75 = Set[ 19, 21 ]
    TOKENS_FOLLOWING_include_file_IN_include_79 = Set[ 4 ]
    TOKENS_FOLLOWING_include_url_IN_include_83 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_include_87 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__19_IN_include_file_99 = Set[ 5 ]
    TOKENS_FOLLOWING_STRING_IN_include_file_101 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_include_file_103 = Set[ 1 ]
    TOKENS_FOLLOWING_T__21_IN_include_url_119 = Set[ 5 ]
    TOKENS_FOLLOWING_STRING_IN_include_url_121 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_include_url_123 = Set[ 1 ]
    TOKENS_FOLLOWING_class_definition_IN_header_138 = Set[ 1 ]
    TOKENS_FOLLOWING_action_IN_header_143 = Set[ 1 ]
    TOKENS_FOLLOWING_attribute_IN_state_158 = Set[ 1, 6, 35 ]
    TOKENS_FOLLOWING_constraint_IN_state_161 = Set[ 1, 35 ]
    TOKENS_FOLLOWING_T__22_IN_composite_177 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_composite_179 = Set[ 23 ]
    TOKENS_FOLLOWING_T__23_IN_composite_181 = Set[ 4, 6, 24, 35 ]
    TOKENS_FOLLOWING_NL_IN_composite_183 = Set[ 4, 6, 24, 35 ]
    TOKENS_FOLLOWING_attribute_IN_composite_188 = Set[ 6, 24, 35 ]
    TOKENS_FOLLOWING_constraint_IN_composite_192 = Set[ 6, 24, 35 ]
    TOKENS_FOLLOWING_T__24_IN_composite_197 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_composite_199 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__25_IN_class_definition_211 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_class_definition_213 = Set[ 1, 4, 23, 26 ]
    TOKENS_FOLLOWING_extends_class_IN_class_definition_222 = Set[ 1, 4, 23 ]
    TOKENS_FOLLOWING_T__23_IN_class_definition_237 = Set[ 4, 6, 24, 25, 30 ]
    TOKENS_FOLLOWING_NL_IN_class_definition_239 = Set[ 4, 6, 24, 25, 30 ]
    TOKENS_FOLLOWING_attribute_IN_class_definition_244 = Set[ 6, 24, 25, 30 ]
    TOKENS_FOLLOWING_action_IN_class_definition_248 = Set[ 6, 24, 25, 30 ]
    TOKENS_FOLLOWING_T__24_IN_class_definition_253 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_class_definition_257 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__26_IN_extends_class_278 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_extends_class_280 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_attribute_295 = Set[ 5, 8, 9, 10, 27, 31, 52 ]
    TOKENS_FOLLOWING_value_IN_attribute_301 = Set[ 4 ]
    TOKENS_FOLLOWING_reference_type_IN_attribute_309 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_319 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_object_def_IN_attribute_325 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_327 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_object_def_340 = Set[ 27 ]
    TOKENS_FOLLOWING_T__27_IN_object_def_342 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_object_def_344 = Set[ 1, 23 ]
    TOKENS_FOLLOWING_T__23_IN_object_def_351 = Set[ 4, 6, 24, 28 ]
    TOKENS_FOLLOWING_NL_IN_object_def_353 = Set[ 4, 6, 24, 28 ]
    TOKENS_FOLLOWING_object_attribute_IN_object_def_358 = Set[ 6, 24, 28 ]
    TOKENS_FOLLOWING_state_dependency_IN_object_def_362 = Set[ 6, 24, 28 ]
    TOKENS_FOLLOWING_T__24_IN_object_def_367 = Set[ 1 ]
    TOKENS_FOLLOWING_attribute_IN_object_attribute_384 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_object_attribute_389 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_object_attribute_391 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_object_attribute_395 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__28_IN_state_dependency_407 = Set[ 52 ]
    TOKENS_FOLLOWING_dep_effect_IN_state_dependency_409 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_411 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_T__29_IN_state_dependency_414 = Set[ 4, 23 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_416 = Set[ 4, 23 ]
    TOKENS_FOLLOWING_T__23_IN_state_dependency_419 = Set[ 4, 52 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_421 = Set[ 4, 52 ]
    TOKENS_FOLLOWING_dep_condition_IN_state_dependency_425 = Set[ 4, 24, 52 ]
    TOKENS_FOLLOWING_T__24_IN_state_dependency_429 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_431 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_reference_IN_dep_effect_443 = Set[ 5, 7, 8, 9, 10, 31, 52 ]
    TOKENS_FOLLOWING_value_IN_dep_effect_447 = Set[ 1 ]
    TOKENS_FOLLOWING_NULL_IN_dep_effect_451 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_dep_condition_464 = Set[ 5, 7, 8, 9, 10, 31, 52 ]
    TOKENS_FOLLOWING_value_IN_dep_condition_468 = Set[ 4 ]
    TOKENS_FOLLOWING_NULL_IN_dep_condition_472 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_dep_condition_476 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__30_IN_action_488 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_action_490 = Set[ 23, 31 ]
    TOKENS_FOLLOWING_parameters_IN_action_498 = Set[ 23 ]
    TOKENS_FOLLOWING_T__23_IN_action_501 = Set[ 4, 33 ]
    TOKENS_FOLLOWING_NL_IN_action_503 = Set[ 4, 33 ]
    TOKENS_FOLLOWING_precondition_IN_action_506 = Set[ 34 ]
    TOKENS_FOLLOWING_postcondition_IN_action_508 = Set[ 24 ]
    TOKENS_FOLLOWING_T__24_IN_action_510 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_action_512 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__31_IN_parameters_528 = Set[ 6 ]
    TOKENS_FOLLOWING_parameter_IN_parameters_530 = Set[ 20, 32 ]
    TOKENS_FOLLOWING_T__32_IN_parameters_533 = Set[ 6 ]
    TOKENS_FOLLOWING_parameter_IN_parameters_535 = Set[ 20, 32 ]
    TOKENS_FOLLOWING_T__20_IN_parameters_539 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_551 = Set[ 5, 8, 9, 10, 27, 31, 52 ]
    TOKENS_FOLLOWING_reference_type_IN_parameter_553 = Set[ 1 ]
    TOKENS_FOLLOWING_T__33_IN_precondition_568 = Set[ 23 ]
    TOKENS_FOLLOWING_T__23_IN_precondition_576 = Set[ 4, 24, 42, 52 ]
    TOKENS_FOLLOWING_NL_IN_precondition_578 = Set[ 4, 24, 42, 52 ]
    TOKENS_FOLLOWING_constraint_body_IN_precondition_581 = Set[ 24 ]
    TOKENS_FOLLOWING_T__24_IN_precondition_583 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_precondition_585 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__34_IN_postcondition_601 = Set[ 23 ]
    TOKENS_FOLLOWING_T__23_IN_postcondition_609 = Set[ 4, 24, 52 ]
    TOKENS_FOLLOWING_NL_IN_postcondition_611 = Set[ 4, 24, 52 ]
    TOKENS_FOLLOWING_postcondition_body_IN_postcondition_614 = Set[ 24 ]
    TOKENS_FOLLOWING_T__24_IN_postcondition_616 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_postcondition_618 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__35_IN_constraint_634 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_constraint_636 = Set[ 23 ]
    TOKENS_FOLLOWING_T__23_IN_constraint_645 = Set[ 4, 24, 42, 52 ]
    TOKENS_FOLLOWING_NL_IN_constraint_647 = Set[ 4, 24, 42, 52 ]
    TOKENS_FOLLOWING_constraint_body_IN_constraint_650 = Set[ 24 ]
    TOKENS_FOLLOWING_T__24_IN_constraint_652 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_654 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_671 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_body_673 = Set[ 1, 4, 42, 52 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_687 = Set[ 5, 8, 9, 10, 31, 52 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_689 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_696 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_698 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_706 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_constraint_statement_708 = Set[ 5, 8, 9, 10, 31, 52 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_710 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_717 = Set[ 37 ]
    TOKENS_FOLLOWING_T__37_IN_constraint_statement_719 = Set[ 5, 8, 9, 10, 31, 52 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_721 = Set[ 1 ]
    TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_728 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_733 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_constraint_statement_735 = Set[ 8, 52 ]
    TOKENS_FOLLOWING_comp_value_IN_constraint_statement_737 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_747 = Set[ 39 ]
    TOKENS_FOLLOWING_T__39_IN_constraint_statement_749 = Set[ 8, 52 ]
    TOKENS_FOLLOWING_comp_value_IN_constraint_statement_751 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_761 = Set[ 40 ]
    TOKENS_FOLLOWING_T__40_IN_constraint_statement_763 = Set[ 8, 52 ]
    TOKENS_FOLLOWING_comp_value_IN_constraint_statement_765 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_775 = Set[ 41 ]
    TOKENS_FOLLOWING_T__41_IN_constraint_statement_777 = Set[ 8, 52 ]
    TOKENS_FOLLOWING_comp_value_IN_constraint_statement_779 = Set[ 1 ]
    TOKENS_FOLLOWING_INTEGER_IN_comp_value_799 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_comp_value_808 = Set[ 1 ]
    TOKENS_FOLLOWING_T__42_IN_conditional_constraint_821 = Set[ 42, 52 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_829 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_NL_IN_conditional_constraint_831 = Set[ 4, 29 ]
    TOKENS_FOLLOWING_conditional_constraint_then_IN_conditional_constraint_834 = Set[ 1 ]
    TOKENS_FOLLOWING_T__29_IN_conditional_constraint_then_849 = Set[ 42, 52 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_853 = Set[ 1 ]
    TOKENS_FOLLOWING_mutation_statement_IN_postcondition_body_865 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_postcondition_body_867 = Set[ 1, 4, 52 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_881 = Set[ 5, 8, 9, 10, 31, 52 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_883 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_890 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_mutation_statement_892 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_900 = Set[ 43 ]
    TOKENS_FOLLOWING_T__43_IN_mutation_statement_902 = Set[ 8, 52 ]
    TOKENS_FOLLOWING_formula_value_IN_mutation_statement_904 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_914 = Set[ 44 ]
    TOKENS_FOLLOWING_T__44_IN_mutation_statement_916 = Set[ 8, 52 ]
    TOKENS_FOLLOWING_formula_value_IN_mutation_statement_918 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_928 = Set[ 45 ]
    TOKENS_FOLLOWING_T__45_IN_mutation_statement_930 = Set[ 8, 52 ]
    TOKENS_FOLLOWING_formula_value_IN_mutation_statement_932 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_942 = Set[ 46 ]
    TOKENS_FOLLOWING_T__46_IN_mutation_statement_944 = Set[ 8, 52 ]
    TOKENS_FOLLOWING_formula_value_IN_mutation_statement_946 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_956 = Set[ 31 ]
    TOKENS_FOLLOWING_formula_IN_mutation_statement_958 = Set[ 1 ]
    TOKENS_FOLLOWING_INTEGER_IN_formula_value_978 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_formula_value_987 = Set[ 1 ]
    TOKENS_FOLLOWING_T__31_IN_formula_1004 = Set[ 8, 52 ]
    TOKENS_FOLLOWING_formula_value_IN_formula_1012 = Set[ 47, 48, 49, 50 ]
    TOKENS_FOLLOWING_formula_item_IN_formula_1018 = Set[ 20, 47, 48, 49, 50 ]
    TOKENS_FOLLOWING_T__20_IN_formula_1027 = Set[ 1 ]
    TOKENS_FOLLOWING_formula_op_IN_formula_item_1038 = Set[ 8, 52 ]
    TOKENS_FOLLOWING_formula_value_IN_formula_item_1040 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_formula_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_T__31_IN_set_value_1086 = Set[ 5, 8, 9, 10, 20, 31, 52 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_1090 = Set[ 20, 32 ]
    TOKENS_FOLLOWING_T__32_IN_set_value_1093 = Set[ 5, 8, 9, 10, 31, 52 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_1095 = Set[ 20, 32 ]
    TOKENS_FOLLOWING_T__20_IN_set_value_1102 = Set[ 1 ]
    TOKENS_FOLLOWING_value_IN_set_item_1117 = Set[ 1 ]
    TOKENS_FOLLOWING_primitive_value_IN_value_1134 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_value_1141 = Set[ 1 ]
    TOKENS_FOLLOWING_set_value_IN_value_1148 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_1165 = Set[ 1 ]
    TOKENS_FOLLOWING_INTEGER_IN_primitive_value_1172 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_primitive_value_1179 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_primitive_value_1188 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_path_1202 = Set[ 1, 51 ]
    TOKENS_FOLLOWING_T__51_IN_path_1204 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_path_1205 = Set[ 1, 51 ]
    TOKENS_FOLLOWING_T__52_IN_reference_1218 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_reference_1219 = Set[ 1 ]
    TOKENS_FOLLOWING_T__27_IN_reference_type_1234 = Set[ 49 ]
    TOKENS_FOLLOWING_T__49_IN_reference_type_1236 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_reference_type_1237 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_comp_0 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end

