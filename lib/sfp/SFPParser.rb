#!/usr/bin/env ruby
#
# SFP.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: SFP.g
# Generated at: 2012-07-31 11:07:34
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
                   :ID => 6, :EOF => -1, :T__55 => 55, :T__19 => 19, :T__56 => 56, 
                   :T__57 => 57, :T__58 => 58, :ESC_SEQ => 14, :BOOLEAN => 9, 
                   :T__51 => 51, :T__52 => 52, :T__18 => 18, :T__53 => 53, 
                   :T__54 => 54, :T__59 => 59, :NL => 4, :COMMENT => 12, 
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

    	def nextId
    		++@id
    		return "c" + @id.to_s
    	end

    	def null_value(isa=nil)
    		return { '_context' => 'null', '_isa' => isa }
    	end

    	def toRef(path)
    		return "$." + path
    	end

    	def context
    		return @root
    	end

    	def processFile(file)
    		# TODO
    		@parser.parseFile(file)
    		@parser.to_context.each_pair { |key,val|
    			if val['_context'] == 'class' or val['_context'] == 'state' or
    				val['_context'] == 'composite' or val['_context'] == 'constraint'
    				@root[key] = val
    			end	
    		}
    	end

    	def gotoParent(remove_parent=false)
    		n = @now
    		@now = @now['_parent']
    		n.delete('_parent') if remove_parent
    		return n
    	end

    # - - - - - - - - - - - - Rules - - - - - - - - - - - - -
    SfpReturnValue = define_return_scope 

    # 
    # parser rule sfp
    # 
    # (in SFP.g)
    # 68:1: sfp : ( NL )* ( include )* ( header )* ( state_section | composite | constraint )* ;
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


        # at line 69:4: ( NL )* ( include )* ( header )* ( state_section | composite | constraint )*
        # --> action

        			@root = Hash.new
        			@now = @root
        			@id = 0
        			@parser = Nuri::Sfp::Main.new
        			@root['Object'] = { '_self' => 'Object', '_context' => 'class', '_parent' => @root }
        		
        # <-- action
        # at line 76:3: ( NL )*
        while true # decision 1
          alt_1 = 2
          look_1_0 = @input.peek( 1 )

          if ( look_1_0 == NL )
            alt_1 = 1

          end
          case alt_1
          when 1
            # at line 76:3: NL
            __NL1__ = match( NL, TOKENS_FOLLOWING_NL_IN_sfp_49 )

            tree_for_NL1 = @adaptor.create_with_payload( __NL1__ )
            @adaptor.add_child( root_0, tree_for_NL1 )


          else
            break # out of loop for decision 1
          end
        end # loop for decision 1
        # at line 76:7: ( include )*
        while true # decision 2
          alt_2 = 2
          look_2_0 = @input.peek( 1 )

          if ( look_2_0 == T__18 )
            alt_2 = 1

          end
          case alt_2
          when 1
            # at line 76:7: include
            @state.following.push( TOKENS_FOLLOWING_include_IN_sfp_52 )
            include2 = include
            @state.following.pop
            @adaptor.add_child( root_0, include2.tree )

          else
            break # out of loop for decision 2
          end
        end # loop for decision 2
        # at line 76:16: ( header )*
        while true # decision 3
          alt_3 = 2
          look_3_0 = @input.peek( 1 )

          if ( look_3_0 == T__23 || look_3_0 == T__29 )
            alt_3 = 1

          end
          case alt_3
          when 1
            # at line 76:16: header
            @state.following.push( TOKENS_FOLLOWING_header_IN_sfp_55 )
            header3 = header
            @state.following.pop
            @adaptor.add_child( root_0, header3.tree )

          else
            break # out of loop for decision 3
          end
        end # loop for decision 3
        # at line 76:24: ( state_section | composite | constraint )*
        while true # decision 4
          alt_4 = 4
          look_4_0 = @input.peek( 1 )

          if ( look_4_0 == ID )
            look_4_2 = @input.peek( 2 )

            if ( look_4_2 == T__19 )
              alt_4 = 1
            elsif ( look_4_2 == T__37 )
              alt_4 = 3

            end
          elsif ( look_4_0 == T__22 )
            alt_4 = 2

          end
          case alt_4
          when 1
            # at line 76:25: state_section
            @state.following.push( TOKENS_FOLLOWING_state_section_IN_sfp_59 )
            state_section4 = state_section
            @state.following.pop
            @adaptor.add_child( root_0, state_section4.tree )

          when 2
            # at line 76:41: composite
            @state.following.push( TOKENS_FOLLOWING_composite_IN_sfp_63 )
            composite5 = composite
            @state.following.pop
            @adaptor.add_child( root_0, composite5.tree )

          when 3
            # at line 76:53: constraint
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
    # 79:1: include : 'include' include_file ( NL )+ ;
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


        # at line 80:4: 'include' include_file ( NL )+
        string_literal7 = match( T__18, TOKENS_FOLLOWING_T__18_IN_include_80 )

        tree_for_string_literal7 = @adaptor.create_with_payload( string_literal7 )
        @adaptor.add_child( root_0, tree_for_string_literal7 )

        @state.following.push( TOKENS_FOLLOWING_include_file_IN_include_82 )
        include_file8 = include_file
        @state.following.pop
        @adaptor.add_child( root_0, include_file8.tree )
        # at file 80:27: ( NL )+
        match_count_5 = 0
        while true
          alt_5 = 2
          look_5_0 = @input.peek( 1 )

          if ( look_5_0 == NL )
            alt_5 = 1

          end
          case alt_5
          when 1
            # at line 80:27: NL
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
    # 83:1: include_file : STRING ;
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


        # at line 84:4: STRING
        __STRING10__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_include_file_96 )

        tree_for_STRING10 = @adaptor.create_with_payload( __STRING10__ )
        @adaptor.add_child( root_0, tree_for_STRING10 )

        # --> action
         self.processFile(__STRING10__.text[1,__STRING10__.text.length-2]) 
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
    # 88:1: header : ( class_definition | procedure );
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
        # at line 89:2: ( class_definition | procedure )
        alt_6 = 2
        look_6_0 = @input.peek( 1 )

        if ( look_6_0 == T__23 )
          alt_6 = 1
        elsif ( look_6_0 == T__29 )
          alt_6 = 2
        else
          raise NoViableAlternative( "", 6, 0 )
        end
        case alt_6
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 89:4: class_definition
          @state.following.push( TOKENS_FOLLOWING_class_definition_IN_header_112 )
          class_definition11 = class_definition
          @state.following.pop
          @adaptor.add_child( root_0, class_definition11.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 90:4: procedure
          @state.following.push( TOKENS_FOLLOWING_procedure_IN_header_117 )
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

    StateSectionReturnValue = define_return_scope 

    # 
    # parser rule state_section
    # 
    # (in SFP.g)
    # 93:1: state_section : ID 'state' '{' ( NL )* ( attribute )* '}' ( NL )* ;
    # 
    def state_section
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )
      return_value = StateSectionReturnValue.new

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


        # at line 94:4: ID 'state' '{' ( NL )* ( attribute )* '}' ( NL )*
        __ID13__ = match( ID, TOKENS_FOLLOWING_ID_IN_state_section_128 )

        tree_for_ID13 = @adaptor.create_with_payload( __ID13__ )
        @adaptor.add_child( root_0, tree_for_ID13 )

        string_literal14 = match( T__19, TOKENS_FOLLOWING_T__19_IN_state_section_130 )

        tree_for_string_literal14 = @adaptor.create_with_payload( string_literal14 )
        @adaptor.add_child( root_0, tree_for_string_literal14 )

        # --> action

        			@now[__ID13__.text] = { '_self' => __ID13__.text,
        				'_context' => 'state',
        				'_parent' => @now
        			}
        			@now = @now[__ID13__.text]
        		
        # <-- action
        char_literal15 = match( T__20, TOKENS_FOLLOWING_T__20_IN_state_section_138 )

        tree_for_char_literal15 = @adaptor.create_with_payload( char_literal15 )
        @adaptor.add_child( root_0, tree_for_char_literal15 )

        # at line 102:7: ( NL )*
        while true # decision 7
          alt_7 = 2
          look_7_0 = @input.peek( 1 )

          if ( look_7_0 == NL )
            alt_7 = 1

          end
          case alt_7
          when 1
            # at line 102:7: NL
            __NL16__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_section_140 )

            tree_for_NL16 = @adaptor.create_with_payload( __NL16__ )
            @adaptor.add_child( root_0, tree_for_NL16 )


          else
            break # out of loop for decision 7
          end
        end # loop for decision 7
        # at line 102:11: ( attribute )*
        while true # decision 8
          alt_8 = 2
          look_8_0 = @input.peek( 1 )

          if ( look_8_0 == ID )
            alt_8 = 1

          end
          case alt_8
          when 1
            # at line 102:11: attribute
            @state.following.push( TOKENS_FOLLOWING_attribute_IN_state_section_143 )
            attribute17 = attribute
            @state.following.pop
            @adaptor.add_child( root_0, attribute17.tree )

          else
            break # out of loop for decision 8
          end
        end # loop for decision 8
        char_literal18 = match( T__21, TOKENS_FOLLOWING_T__21_IN_state_section_146 )

        tree_for_char_literal18 = @adaptor.create_with_payload( char_literal18 )
        @adaptor.add_child( root_0, tree_for_char_literal18 )

        # at line 102:26: ( NL )*
        while true # decision 9
          alt_9 = 2
          look_9_0 = @input.peek( 1 )

          if ( look_9_0 == NL )
            alt_9 = 1

          end
          case alt_9
          when 1
            # at line 102:26: NL
            __NL19__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_section_148 )

            tree_for_NL19 = @adaptor.create_with_payload( __NL19__ )
            @adaptor.add_child( root_0, tree_for_NL19 )


          else
            break # out of loop for decision 9
          end
        end # loop for decision 9
        # --> action
        	self.gotoParent(true)	
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
    # 106:1: composite : 'composite' ID '{' ( NL )* ( attribute | constraint )* '}' ( NL )* ;
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


        # at line 107:4: 'composite' ID '{' ( NL )* ( attribute | constraint )* '}' ( NL )*
        string_literal20 = match( T__22, TOKENS_FOLLOWING_T__22_IN_composite_164 )

        tree_for_string_literal20 = @adaptor.create_with_payload( string_literal20 )
        @adaptor.add_child( root_0, tree_for_string_literal20 )

        __ID21__ = match( ID, TOKENS_FOLLOWING_ID_IN_composite_166 )

        tree_for_ID21 = @adaptor.create_with_payload( __ID21__ )
        @adaptor.add_child( root_0, tree_for_ID21 )

        # --> action

        			@now[__ID21__.text] = { '_self' => __ID21__.text,
        				'_context' => 'composite',
        				'_parent' => @now
        			}
        			@now = @now[__ID21__.text]
        		
        # <-- action
        char_literal22 = match( T__20, TOKENS_FOLLOWING_T__20_IN_composite_174 )

        tree_for_char_literal22 = @adaptor.create_with_payload( char_literal22 )
        @adaptor.add_child( root_0, tree_for_char_literal22 )

        # at line 115:7: ( NL )*
        while true # decision 10
          alt_10 = 2
          look_10_0 = @input.peek( 1 )

          if ( look_10_0 == NL )
            alt_10 = 1

          end
          case alt_10
          when 1
            # at line 115:7: NL
            __NL23__ = match( NL, TOKENS_FOLLOWING_NL_IN_composite_176 )

            tree_for_NL23 = @adaptor.create_with_payload( __NL23__ )
            @adaptor.add_child( root_0, tree_for_NL23 )


          else
            break # out of loop for decision 10
          end
        end # loop for decision 10
        # at line 115:11: ( attribute | constraint )*
        while true # decision 11
          alt_11 = 3
          look_11_0 = @input.peek( 1 )

          if ( look_11_0 == ID )
            look_11_2 = @input.peek( 2 )

            if ( look_11_2 == T__37 )
              alt_11 = 2
            elsif ( look_11_2 == NL || look_11_2 == T__20 || look_11_2 == T__25 || look_11_2 == T__40 || look_11_2.between?( T__49, T__50 ) )
              alt_11 = 1

            end

          end
          case alt_11
          when 1
            # at line 115:13: attribute
            @state.following.push( TOKENS_FOLLOWING_attribute_IN_composite_181 )
            attribute24 = attribute
            @state.following.pop
            @adaptor.add_child( root_0, attribute24.tree )

          when 2
            # at line 115:25: constraint
            @state.following.push( TOKENS_FOLLOWING_constraint_IN_composite_185 )
            constraint25 = constraint
            @state.following.pop
            @adaptor.add_child( root_0, constraint25.tree )

          else
            break # out of loop for decision 11
          end
        end # loop for decision 11
        char_literal26 = match( T__21, TOKENS_FOLLOWING_T__21_IN_composite_190 )

        tree_for_char_literal26 = @adaptor.create_with_payload( char_literal26 )
        @adaptor.add_child( root_0, tree_for_char_literal26 )

        # at line 115:43: ( NL )*
        while true # decision 12
          alt_12 = 2
          look_12_0 = @input.peek( 1 )

          if ( look_12_0 == NL )
            alt_12 = 1

          end
          case alt_12
          when 1
            # at line 115:43: NL
            __NL27__ = match( NL, TOKENS_FOLLOWING_NL_IN_composite_192 )

            tree_for_NL27 = @adaptor.create_with_payload( __NL27__ )
            @adaptor.add_child( root_0, tree_for_NL27 )


          else
            break # out of loop for decision 12
          end
        end # loop for decision 12
        # --> action
        	self.gotoParent(true)	
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
    # 119:1: class_definition : 'class' ID ( extends_class )? ( '{' ( NL )* ( attribute | procedure )* '}' )? ( NL )* ;
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


        # at line 120:4: 'class' ID ( extends_class )? ( '{' ( NL )* ( attribute | procedure )* '}' )? ( NL )*
        string_literal28 = match( T__23, TOKENS_FOLLOWING_T__23_IN_class_definition_208 )

        tree_for_string_literal28 = @adaptor.create_with_payload( string_literal28 )
        @adaptor.add_child( root_0, tree_for_string_literal28 )

        __ID29__ = match( ID, TOKENS_FOLLOWING_ID_IN_class_definition_210 )

        tree_for_ID29 = @adaptor.create_with_payload( __ID29__ )
        @adaptor.add_child( root_0, tree_for_ID29 )

        # --> action

        			@now[__ID29__.text] = { '_self' => __ID29__.text,
        				'_context' => 'class',
        				'_parent' => @now
        			}
        			@now = @now[__ID29__.text]
        		
        # <-- action
        # at line 128:3: ( extends_class )?
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0 == T__24 )
          alt_13 = 1
        end
        case alt_13
        when 1
          # at line 128:4: extends_class
          @state.following.push( TOKENS_FOLLOWING_extends_class_IN_class_definition_219 )
          extends_class30 = extends_class
          @state.following.pop
          @adaptor.add_child( root_0, extends_class30.tree )
          # --> action

          			@now['_extends'] = ( extends_class30.nil? ? nil : extends_class30.val )
          		
          # <-- action

        end
        # at line 133:3: ( '{' ( NL )* ( attribute | procedure )* '}' )?
        alt_16 = 2
        look_16_0 = @input.peek( 1 )

        if ( look_16_0 == T__20 )
          alt_16 = 1
        end
        case alt_16
        when 1
          # at line 133:4: '{' ( NL )* ( attribute | procedure )* '}'
          char_literal31 = match( T__20, TOKENS_FOLLOWING_T__20_IN_class_definition_233 )

          tree_for_char_literal31 = @adaptor.create_with_payload( char_literal31 )
          @adaptor.add_child( root_0, tree_for_char_literal31 )

          # at line 133:8: ( NL )*
          while true # decision 14
            alt_14 = 2
            look_14_0 = @input.peek( 1 )

            if ( look_14_0 == NL )
              alt_14 = 1

            end
            case alt_14
            when 1
              # at line 133:8: NL
              __NL32__ = match( NL, TOKENS_FOLLOWING_NL_IN_class_definition_235 )

              tree_for_NL32 = @adaptor.create_with_payload( __NL32__ )
              @adaptor.add_child( root_0, tree_for_NL32 )


            else
              break # out of loop for decision 14
            end
          end # loop for decision 14
          # at line 133:12: ( attribute | procedure )*
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
              # at line 133:14: attribute
              @state.following.push( TOKENS_FOLLOWING_attribute_IN_class_definition_240 )
              attribute33 = attribute
              @state.following.pop
              @adaptor.add_child( root_0, attribute33.tree )

            when 2
              # at line 133:26: procedure
              @state.following.push( TOKENS_FOLLOWING_procedure_IN_class_definition_244 )
              procedure34 = procedure
              @state.following.pop
              @adaptor.add_child( root_0, procedure34.tree )

            else
              break # out of loop for decision 15
            end
          end # loop for decision 15
          char_literal35 = match( T__21, TOKENS_FOLLOWING_T__21_IN_class_definition_249 )

          tree_for_char_literal35 = @adaptor.create_with_payload( char_literal35 )
          @adaptor.add_child( root_0, tree_for_char_literal35 )


        end
        # at line 133:45: ( NL )*
        while true # decision 17
          alt_17 = 2
          look_17_0 = @input.peek( 1 )

          if ( look_17_0 == NL )
            alt_17 = 1

          end
          case alt_17
          when 1
            # at line 133:45: NL
            __NL36__ = match( NL, TOKENS_FOLLOWING_NL_IN_class_definition_253 )

            tree_for_NL36 = @adaptor.create_with_payload( __NL36__ )
            @adaptor.add_child( root_0, tree_for_NL36 )


          else
            break # out of loop for decision 17
          end
        end # loop for decision 17
        # --> action
        	self.gotoParent()	
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
    # 137:1: extends_class returns [val] : 'extends' path ;
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


        # at line 138:4: 'extends' path
        string_literal37 = match( T__24, TOKENS_FOLLOWING_T__24_IN_extends_class_274 )

        tree_for_string_literal37 = @adaptor.create_with_payload( string_literal37 )
        @adaptor.add_child( root_0, tree_for_string_literal37 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_extends_class_276 )
        path38 = path
        @state.following.pop
        @adaptor.add_child( root_0, path38.tree )
        # --> action
        	return_value.val = self.toRef(( path38 && @input.to_s( path38.start, path38.stop ) ))	
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
    # 142:1: attribute : ( ID equals_op value ( NL )+ | ID reference_type ( NL )+ | object_def ( NL )+ );
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
        # at line 143:2: ( ID equals_op value ( NL )+ | ID reference_type ( NL )+ | object_def ( NL )+ )
        alt_21 = 3
        look_21_0 = @input.peek( 1 )

        if ( look_21_0 == ID )
          case look_21 = @input.peek( 2 )
          when T__40, T__50 then alt_21 = 1
          when T__49 then alt_21 = 2
          when NL, T__20, T__25 then alt_21 = 3
          else
            raise NoViableAlternative( "", 21, 1 )
          end
        else
          raise NoViableAlternative( "", 21, 0 )
        end
        case alt_21
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 143:4: ID equals_op value ( NL )+
          __ID39__ = match( ID, TOKENS_FOLLOWING_ID_IN_attribute_291 )

          tree_for_ID39 = @adaptor.create_with_payload( __ID39__ )
          @adaptor.add_child( root_0, tree_for_ID39 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_attribute_293 )
          equals_op40 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op40.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_attribute_295 )
          value41 = value
          @state.following.pop
          @adaptor.add_child( root_0, value41.tree )
          # at file 143:23: ( NL )+
          match_count_18 = 0
          while true
            alt_18 = 2
            look_18_0 = @input.peek( 1 )

            if ( look_18_0 == NL )
              alt_18 = 1

            end
            case alt_18
            when 1
              # at line 143:23: NL
              __NL42__ = match( NL, TOKENS_FOLLOWING_NL_IN_attribute_297 )

              tree_for_NL42 = @adaptor.create_with_payload( __NL42__ )
              @adaptor.add_child( root_0, tree_for_NL42 )


            else
              match_count_18 > 0 and break
              eee = EarlyExit(18)


              raise eee
            end
            match_count_18 += 1
          end

          # --> action
          	@now[__ID39__.text] = ( value41.nil? ? nil : value41.val )	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 145:4: ID reference_type ( NL )+
          __ID43__ = match( ID, TOKENS_FOLLOWING_ID_IN_attribute_307 )

          tree_for_ID43 = @adaptor.create_with_payload( __ID43__ )
          @adaptor.add_child( root_0, tree_for_ID43 )

          @state.following.push( TOKENS_FOLLOWING_reference_type_IN_attribute_309 )
          reference_type44 = reference_type
          @state.following.pop
          @adaptor.add_child( root_0, reference_type44.tree )
          # at file 145:22: ( NL )+
          match_count_19 = 0
          while true
            alt_19 = 2
            look_19_0 = @input.peek( 1 )

            if ( look_19_0 == NL )
              alt_19 = 1

            end
            case alt_19
            when 1
              # at line 145:22: NL
              __NL45__ = match( NL, TOKENS_FOLLOWING_NL_IN_attribute_311 )

              tree_for_NL45 = @adaptor.create_with_payload( __NL45__ )
              @adaptor.add_child( root_0, tree_for_NL45 )


            else
              match_count_19 > 0 and break
              eee = EarlyExit(19)


              raise eee
            end
            match_count_19 += 1
          end

          # --> action
          	@now[__ID43__.text] = ( reference_type44.nil? ? nil : reference_type44.val )	
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 147:4: object_def ( NL )+
          @state.following.push( TOKENS_FOLLOWING_object_def_IN_attribute_321 )
          object_def46 = object_def
          @state.following.pop
          @adaptor.add_child( root_0, object_def46.tree )
          # at file 147:15: ( NL )+
          match_count_20 = 0
          while true
            alt_20 = 2
            look_20_0 = @input.peek( 1 )

            if ( look_20_0 == NL )
              alt_20 = 1

            end
            case alt_20
            when 1
              # at line 147:15: NL
              __NL47__ = match( NL, TOKENS_FOLLOWING_NL_IN_attribute_323 )

              tree_for_NL47 = @adaptor.create_with_payload( __NL47__ )
              @adaptor.add_child( root_0, tree_for_NL47 )


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
    # 150:1: object_def : ID ( 'isa' path )? ( object_body )? ;
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


        # at line 151:4: ID ( 'isa' path )? ( object_body )?
        __ID48__ = match( ID, TOKENS_FOLLOWING_ID_IN_object_def_335 )

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
        # at line 160:3: ( 'isa' path )?
        alt_22 = 2
        look_22_0 = @input.peek( 1 )

        if ( look_22_0 == T__25 )
          alt_22 = 1
        end
        case alt_22
        when 1
          # at line 160:4: 'isa' path
          string_literal49 = match( T__25, TOKENS_FOLLOWING_T__25_IN_object_def_344 )

          tree_for_string_literal49 = @adaptor.create_with_payload( string_literal49 )
          @adaptor.add_child( root_0, tree_for_string_literal49 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_object_def_346 )
          path50 = path
          @state.following.pop
          @adaptor.add_child( root_0, path50.tree )
          # --> action

          			@now['_isa'] = self.toRef(( path50 && @input.to_s( path50.start, path50.stop ) ))
          		
          # <-- action

        end
        # at line 165:3: ( object_body )?
        alt_23 = 2
        look_23_0 = @input.peek( 1 )

        if ( look_23_0 == T__20 )
          alt_23 = 1
        end
        case alt_23
        when 1
          # at line 165:3: object_body
          @state.following.push( TOKENS_FOLLOWING_object_body_IN_object_def_359 )
          object_body51 = object_body
          @state.following.pop
          @adaptor.add_child( root_0, object_body51.tree )

        end
        # --> action
        	self.gotoParent();	
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
    # 169:1: object_body : '{' ( NL )* ( object_attribute | state_dependency )* '}' ;
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
      char_literal56 = nil
      object_attribute54 = nil
      state_dependency55 = nil

      tree_for_char_literal52 = nil
      tree_for_NL53 = nil
      tree_for_char_literal56 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 170:4: '{' ( NL )* ( object_attribute | state_dependency )* '}'
        char_literal52 = match( T__20, TOKENS_FOLLOWING_T__20_IN_object_body_375 )

        tree_for_char_literal52 = @adaptor.create_with_payload( char_literal52 )
        @adaptor.add_child( root_0, tree_for_char_literal52 )

        # at line 170:8: ( NL )*
        while true # decision 24
          alt_24 = 2
          look_24_0 = @input.peek( 1 )

          if ( look_24_0 == NL )
            alt_24 = 1

          end
          case alt_24
          when 1
            # at line 170:8: NL
            __NL53__ = match( NL, TOKENS_FOLLOWING_NL_IN_object_body_377 )

            tree_for_NL53 = @adaptor.create_with_payload( __NL53__ )
            @adaptor.add_child( root_0, tree_for_NL53 )


          else
            break # out of loop for decision 24
          end
        end # loop for decision 24
        # at line 170:12: ( object_attribute | state_dependency )*
        while true # decision 25
          alt_25 = 3
          look_25_0 = @input.peek( 1 )

          if ( look_25_0 == ID )
            alt_25 = 1
          elsif ( look_25_0 == T__26 )
            alt_25 = 2

          end
          case alt_25
          when 1
            # at line 170:14: object_attribute
            @state.following.push( TOKENS_FOLLOWING_object_attribute_IN_object_body_382 )
            object_attribute54 = object_attribute
            @state.following.pop
            @adaptor.add_child( root_0, object_attribute54.tree )

          when 2
            # at line 170:33: state_dependency
            @state.following.push( TOKENS_FOLLOWING_state_dependency_IN_object_body_386 )
            state_dependency55 = state_dependency
            @state.following.pop
            @adaptor.add_child( root_0, state_dependency55.tree )

          else
            break # out of loop for decision 25
          end
        end # loop for decision 25
        char_literal56 = match( T__21, TOKENS_FOLLOWING_T__21_IN_object_body_391 )

        tree_for_char_literal56 = @adaptor.create_with_payload( char_literal56 )
        @adaptor.add_child( root_0, tree_for_char_literal56 )

        # - - - - - - - rule clean up - - - - - - - -
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
    # 173:1: object_attribute : ( attribute | ID equals_op NULL ( NL )+ );
    # 
    def object_attribute
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )
      return_value = ObjectAttributeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID58__ = nil
      __NULL60__ = nil
      __NL61__ = nil
      attribute57 = nil
      equals_op59 = nil

      tree_for_ID58 = nil
      tree_for_NULL60 = nil
      tree_for_NL61 = nil

      begin
        # at line 174:2: ( attribute | ID equals_op NULL ( NL )+ )
        alt_27 = 2
        look_27_0 = @input.peek( 1 )

        if ( look_27_0 == ID )
          look_27_1 = @input.peek( 2 )

          if ( look_27_1 == T__40 || look_27_1 == T__50 )
            look_27_2 = @input.peek( 3 )

            if ( look_27_2.between?( STRING, ID ) || look_27_2.between?( NUMBER, MULTILINE_STRING ) || look_27_2 == T__31 )
              alt_27 = 1
            elsif ( look_27_2 == NULL )
              alt_27 = 2
            else
              raise NoViableAlternative( "", 27, 2 )
            end
          elsif ( look_27_1 == NL || look_27_1 == T__20 || look_27_1 == T__25 || look_27_1 == T__49 )
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


          # at line 174:4: attribute
          @state.following.push( TOKENS_FOLLOWING_attribute_IN_object_attribute_402 )
          attribute57 = attribute
          @state.following.pop
          @adaptor.add_child( root_0, attribute57.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 175:4: ID equals_op NULL ( NL )+
          __ID58__ = match( ID, TOKENS_FOLLOWING_ID_IN_object_attribute_407 )

          tree_for_ID58 = @adaptor.create_with_payload( __ID58__ )
          @adaptor.add_child( root_0, tree_for_ID58 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_object_attribute_409 )
          equals_op59 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op59.tree )
          __NULL60__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_object_attribute_411 )

          tree_for_NULL60 = @adaptor.create_with_payload( __NULL60__ )
          @adaptor.add_child( root_0, tree_for_NULL60 )

          # at file 175:22: ( NL )+
          match_count_26 = 0
          while true
            alt_26 = 2
            look_26_0 = @input.peek( 1 )

            if ( look_26_0 == NL )
              alt_26 = 1

            end
            case alt_26
            when 1
              # at line 175:22: NL
              __NL61__ = match( NL, TOKENS_FOLLOWING_NL_IN_object_attribute_413 )

              tree_for_NL61 = @adaptor.create_with_payload( __NL61__ )
              @adaptor.add_child( root_0, tree_for_NL61 )


            else
              match_count_26 > 0 and break
              eee = EarlyExit(26)


              raise eee
            end
            match_count_26 += 1
          end

          # --> action
          	@now[__ID58__.text] = self.null_value	
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
    # 179:1: state_dependency : 'if' dep_effect ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )* ( NL )+ ;
    # 
    def state_dependency
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )
      return_value = StateDependencyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal62 = nil
      __NL64__ = nil
      string_literal65 = nil
      __NL66__ = nil
      char_literal67 = nil
      __NL68__ = nil
      char_literal70 = nil
      __NL71__ = nil
      string_literal72 = nil
      __NL73__ = nil
      char_literal74 = nil
      __NL75__ = nil
      char_literal77 = nil
      __NL78__ = nil
      dep_effect63 = nil
      constraint_body69 = nil
      constraint_body76 = nil

      tree_for_string_literal62 = nil
      tree_for_NL64 = nil
      tree_for_string_literal65 = nil
      tree_for_NL66 = nil
      tree_for_char_literal67 = nil
      tree_for_NL68 = nil
      tree_for_char_literal70 = nil
      tree_for_NL71 = nil
      tree_for_string_literal72 = nil
      tree_for_NL73 = nil
      tree_for_char_literal74 = nil
      tree_for_NL75 = nil
      tree_for_char_literal77 = nil
      tree_for_NL78 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 180:4: 'if' dep_effect ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )* ( NL )+
        string_literal62 = match( T__26, TOKENS_FOLLOWING_T__26_IN_state_dependency_429 )

        tree_for_string_literal62 = @adaptor.create_with_payload( string_literal62 )
        @adaptor.add_child( root_0, tree_for_string_literal62 )

        @state.following.push( TOKENS_FOLLOWING_dep_effect_IN_state_dependency_433 )
        dep_effect63 = dep_effect
        @state.following.pop
        @adaptor.add_child( root_0, dep_effect63.tree )
        # at line 181:14: ( NL )*
        while true # decision 28
          alt_28 = 2
          look_28_0 = @input.peek( 1 )

          if ( look_28_0 == NL )
            alt_28 = 1

          end
          case alt_28
          when 1
            # at line 181:14: NL
            __NL64__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_435 )

            tree_for_NL64 = @adaptor.create_with_payload( __NL64__ )
            @adaptor.add_child( root_0, tree_for_NL64 )


          else
            break # out of loop for decision 28
          end
        end # loop for decision 28
        string_literal65 = match( T__27, TOKENS_FOLLOWING_T__27_IN_state_dependency_438 )

        tree_for_string_literal65 = @adaptor.create_with_payload( string_literal65 )
        @adaptor.add_child( root_0, tree_for_string_literal65 )

        # at line 181:25: ( NL )*
        while true # decision 29
          alt_29 = 2
          look_29_0 = @input.peek( 1 )

          if ( look_29_0 == NL )
            alt_29 = 1

          end
          case alt_29
          when 1
            # at line 181:25: NL
            __NL66__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_440 )

            tree_for_NL66 = @adaptor.create_with_payload( __NL66__ )
            @adaptor.add_child( root_0, tree_for_NL66 )


          else
            break # out of loop for decision 29
          end
        end # loop for decision 29
        char_literal67 = match( T__20, TOKENS_FOLLOWING_T__20_IN_state_dependency_443 )

        tree_for_char_literal67 = @adaptor.create_with_payload( char_literal67 )
        @adaptor.add_child( root_0, tree_for_char_literal67 )

        # at line 182:3: ( NL )*
        while true # decision 30
          alt_30 = 2
          look_30_0 = @input.peek( 1 )

          if ( look_30_0 == NL )
            alt_30 = 1

          end
          case alt_30
          when 1
            # at line 182:3: NL
            __NL68__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_447 )

            tree_for_NL68 = @adaptor.create_with_payload( __NL68__ )
            @adaptor.add_child( root_0, tree_for_NL68 )


          else
            break # out of loop for decision 30
          end
        end # loop for decision 30
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_state_dependency_450 )
        constraint_body69 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body69.tree )
        char_literal70 = match( T__21, TOKENS_FOLLOWING_T__21_IN_state_dependency_455 )

        tree_for_char_literal70 = @adaptor.create_with_payload( char_literal70 )
        @adaptor.add_child( root_0, tree_for_char_literal70 )

        # at line 184:3: ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )*
        while true # decision 34
          alt_34 = 2
          alt_34 = @dfa34.predict( @input )
          case alt_34
          when 1
            # at line 184:5: ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}'
            # at line 184:5: ( NL )*
            while true # decision 31
              alt_31 = 2
              look_31_0 = @input.peek( 1 )

              if ( look_31_0 == NL )
                alt_31 = 1

              end
              case alt_31
              when 1
                # at line 184:5: NL
                __NL71__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_461 )

                tree_for_NL71 = @adaptor.create_with_payload( __NL71__ )
                @adaptor.add_child( root_0, tree_for_NL71 )


              else
                break # out of loop for decision 31
              end
            end # loop for decision 31
            string_literal72 = match( T__28, TOKENS_FOLLOWING_T__28_IN_state_dependency_464 )

            tree_for_string_literal72 = @adaptor.create_with_payload( string_literal72 )
            @adaptor.add_child( root_0, tree_for_string_literal72 )

            # at line 184:14: ( NL )*
            while true # decision 32
              alt_32 = 2
              look_32_0 = @input.peek( 1 )

              if ( look_32_0 == NL )
                alt_32 = 1

              end
              case alt_32
              when 1
                # at line 184:14: NL
                __NL73__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_466 )

                tree_for_NL73 = @adaptor.create_with_payload( __NL73__ )
                @adaptor.add_child( root_0, tree_for_NL73 )


              else
                break # out of loop for decision 32
              end
            end # loop for decision 32
            char_literal74 = match( T__20, TOKENS_FOLLOWING_T__20_IN_state_dependency_469 )

            tree_for_char_literal74 = @adaptor.create_with_payload( char_literal74 )
            @adaptor.add_child( root_0, tree_for_char_literal74 )

            # at line 185:3: ( NL )*
            while true # decision 33
              alt_33 = 2
              look_33_0 = @input.peek( 1 )

              if ( look_33_0 == NL )
                alt_33 = 1

              end
              case alt_33
              when 1
                # at line 185:3: NL
                __NL75__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_473 )

                tree_for_NL75 = @adaptor.create_with_payload( __NL75__ )
                @adaptor.add_child( root_0, tree_for_NL75 )


              else
                break # out of loop for decision 33
              end
            end # loop for decision 33
            @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_state_dependency_476 )
            constraint_body76 = constraint_body
            @state.following.pop
            @adaptor.add_child( root_0, constraint_body76.tree )
            char_literal77 = match( T__21, TOKENS_FOLLOWING_T__21_IN_state_dependency_480 )

            tree_for_char_literal77 = @adaptor.create_with_payload( char_literal77 )
            @adaptor.add_child( root_0, tree_for_char_literal77 )


          else
            break # out of loop for decision 34
          end
        end # loop for decision 34
        # at file 187:3: ( NL )+
        match_count_35 = 0
        while true
          alt_35 = 2
          look_35_0 = @input.peek( 1 )

          if ( look_35_0 == NL )
            alt_35 = 1

          end
          case alt_35
          when 1
            # at line 187:3: NL
            __NL78__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_486 )

            tree_for_NL78 = @adaptor.create_with_payload( __NL78__ )
            @adaptor.add_child( root_0, tree_for_NL78 )


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
    # 190:1: dep_effect : reference equals_op ( value | NULL ) ;
    # 
    def dep_effect
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )
      return_value = DepEffectReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL82__ = nil
      reference79 = nil
      equals_op80 = nil
      value81 = nil

      tree_for_NULL82 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 191:4: reference equals_op ( value | NULL )
        @state.following.push( TOKENS_FOLLOWING_reference_IN_dep_effect_498 )
        reference79 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference79.tree )
        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_dep_effect_500 )
        equals_op80 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op80.tree )
        # at line 192:3: ( value | NULL )
        alt_36 = 2
        look_36_0 = @input.peek( 1 )

        if ( look_36_0.between?( STRING, ID ) || look_36_0.between?( NUMBER, MULTILINE_STRING ) || look_36_0 == T__31 )
          alt_36 = 1
        elsif ( look_36_0 == NULL )
          alt_36 = 2
        else
          raise NoViableAlternative( "", 36, 0 )
        end
        case alt_36
        when 1
          # at line 192:5: value
          @state.following.push( TOKENS_FOLLOWING_value_IN_dep_effect_507 )
          value81 = value
          @state.following.pop
          @adaptor.add_child( root_0, value81.tree )

        when 2
          # at line 193:5: NULL
          __NULL82__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_dep_effect_513 )

          tree_for_NULL82 = @adaptor.create_with_payload( __NULL82__ )
          @adaptor.add_child( root_0, tree_for_NULL82 )


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
    # 197:1: procedure : 'procedure' ID ( parameters )? '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( conditions )? effects '}' ( NL )+ ;
    # 
    def procedure
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )
      return_value = ProcedureReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal83 = nil
      __ID84__ = nil
      char_literal86 = nil
      __NL87__ = nil
      string_literal88 = nil
      __NUMBER90__ = nil
      __NL91__ = nil
      char_literal94 = nil
      __NL95__ = nil
      parameters85 = nil
      equals_op89 = nil
      conditions92 = nil
      effects93 = nil

      tree_for_string_literal83 = nil
      tree_for_ID84 = nil
      tree_for_char_literal86 = nil
      tree_for_NL87 = nil
      tree_for_string_literal88 = nil
      tree_for_NUMBER90 = nil
      tree_for_NL91 = nil
      tree_for_char_literal94 = nil
      tree_for_NL95 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 198:4: 'procedure' ID ( parameters )? '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( conditions )? effects '}' ( NL )+
        string_literal83 = match( T__29, TOKENS_FOLLOWING_T__29_IN_procedure_529 )

        tree_for_string_literal83 = @adaptor.create_with_payload( string_literal83 )
        @adaptor.add_child( root_0, tree_for_string_literal83 )

        __ID84__ = match( ID, TOKENS_FOLLOWING_ID_IN_procedure_531 )

        tree_for_ID84 = @adaptor.create_with_payload( __ID84__ )
        @adaptor.add_child( root_0, tree_for_ID84 )

        # --> action

        			@now[__ID84__.text] = { '_self' => __ID84__.text,
        				'_context' => 'procedure',
        				'_parent' => @now,
        				'_conditions' => { '_context' => 'constraint', '_type' => 'and' },
        				'_effects' => { '_context' => 'mutation', '_type' => 'and' }
        			}
        			@now = @now[__ID84__.text]
        		
        # <-- action
        # at line 208:3: ( parameters )?
        alt_37 = 2
        look_37_0 = @input.peek( 1 )

        if ( look_37_0 == T__31 )
          alt_37 = 1
        end
        case alt_37
        when 1
          # at line 208:3: parameters
          @state.following.push( TOKENS_FOLLOWING_parameters_IN_procedure_539 )
          parameters85 = parameters
          @state.following.pop
          @adaptor.add_child( root_0, parameters85.tree )

        end
        char_literal86 = match( T__20, TOKENS_FOLLOWING_T__20_IN_procedure_542 )

        tree_for_char_literal86 = @adaptor.create_with_payload( char_literal86 )
        @adaptor.add_child( root_0, tree_for_char_literal86 )

        # at line 208:19: ( NL )*
        while true # decision 38
          alt_38 = 2
          look_38_0 = @input.peek( 1 )

          if ( look_38_0 == NL )
            alt_38 = 1

          end
          case alt_38
          when 1
            # at line 208:19: NL
            __NL87__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_544 )

            tree_for_NL87 = @adaptor.create_with_payload( __NL87__ )
            @adaptor.add_child( root_0, tree_for_NL87 )


          else
            break # out of loop for decision 38
          end
        end # loop for decision 38
        # at line 209:3: ( 'cost' equals_op NUMBER ( NL )+ )?
        alt_40 = 2
        look_40_0 = @input.peek( 1 )

        if ( look_40_0 == T__30 )
          alt_40 = 1
        end
        case alt_40
        when 1
          # at line 209:5: 'cost' equals_op NUMBER ( NL )+
          string_literal88 = match( T__30, TOKENS_FOLLOWING_T__30_IN_procedure_552 )

          tree_for_string_literal88 = @adaptor.create_with_payload( string_literal88 )
          @adaptor.add_child( root_0, tree_for_string_literal88 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_procedure_554 )
          equals_op89 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op89.tree )
          __NUMBER90__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_procedure_556 )

          tree_for_NUMBER90 = @adaptor.create_with_payload( __NUMBER90__ )
          @adaptor.add_child( root_0, tree_for_NUMBER90 )

          # --> action
          	@now['_cost'] = __NUMBER90__.text.to_i	
          # <-- action
          # at file 211:4: ( NL )+
          match_count_39 = 0
          while true
            alt_39 = 2
            look_39_0 = @input.peek( 1 )

            if ( look_39_0 == NL )
              alt_39 = 1

            end
            case alt_39
            when 1
              # at line 211:4: NL
              __NL91__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_566 )

              tree_for_NL91 = @adaptor.create_with_payload( __NL91__ )
              @adaptor.add_child( root_0, tree_for_NL91 )


            else
              match_count_39 > 0 and break
              eee = EarlyExit(39)


              raise eee
            end
            match_count_39 += 1
          end


        end
        # at line 213:3: ( conditions )?
        alt_41 = 2
        look_41_0 = @input.peek( 1 )

        if ( look_41_0 == T__35 )
          alt_41 = 1
        end
        case alt_41
        when 1
          # at line 213:3: conditions
          @state.following.push( TOKENS_FOLLOWING_conditions_IN_procedure_576 )
          conditions92 = conditions
          @state.following.pop
          @adaptor.add_child( root_0, conditions92.tree )

        end
        @state.following.push( TOKENS_FOLLOWING_effects_IN_procedure_579 )
        effects93 = effects
        @state.following.pop
        @adaptor.add_child( root_0, effects93.tree )
        char_literal94 = match( T__21, TOKENS_FOLLOWING_T__21_IN_procedure_581 )

        tree_for_char_literal94 = @adaptor.create_with_payload( char_literal94 )
        @adaptor.add_child( root_0, tree_for_char_literal94 )

        # at file 213:27: ( NL )+
        match_count_42 = 0
        while true
          alt_42 = 2
          look_42_0 = @input.peek( 1 )

          if ( look_42_0 == NL )
            alt_42 = 1

          end
          case alt_42
          when 1
            # at line 213:27: NL
            __NL95__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_583 )

            tree_for_NL95 = @adaptor.create_with_payload( __NL95__ )
            @adaptor.add_child( root_0, tree_for_NL95 )


          else
            match_count_42 > 0 and break
            eee = EarlyExit(42)


            raise eee
          end
          match_count_42 += 1
        end

        # --> action
        	self.gotoParent()	
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

    ParametersReturnValue = define_return_scope 

    # 
    # parser rule parameters
    # 
    # (in SFP.g)
    # 217:1: parameters : '(' parameter ( ',' parameter )* ')' ;
    # 
    def parameters
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )
      return_value = ParametersReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal96 = nil
      char_literal98 = nil
      char_literal100 = nil
      parameter97 = nil
      parameter99 = nil

      tree_for_char_literal96 = nil
      tree_for_char_literal98 = nil
      tree_for_char_literal100 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 218:4: '(' parameter ( ',' parameter )* ')'
        char_literal96 = match( T__31, TOKENS_FOLLOWING_T__31_IN_parameters_599 )

        tree_for_char_literal96 = @adaptor.create_with_payload( char_literal96 )
        @adaptor.add_child( root_0, tree_for_char_literal96 )

        @state.following.push( TOKENS_FOLLOWING_parameter_IN_parameters_601 )
        parameter97 = parameter
        @state.following.pop
        @adaptor.add_child( root_0, parameter97.tree )
        # at line 218:18: ( ',' parameter )*
        while true # decision 43
          alt_43 = 2
          look_43_0 = @input.peek( 1 )

          if ( look_43_0 == T__32 )
            alt_43 = 1

          end
          case alt_43
          when 1
            # at line 218:19: ',' parameter
            char_literal98 = match( T__32, TOKENS_FOLLOWING_T__32_IN_parameters_604 )

            tree_for_char_literal98 = @adaptor.create_with_payload( char_literal98 )
            @adaptor.add_child( root_0, tree_for_char_literal98 )

            @state.following.push( TOKENS_FOLLOWING_parameter_IN_parameters_606 )
            parameter99 = parameter
            @state.following.pop
            @adaptor.add_child( root_0, parameter99.tree )

          else
            break # out of loop for decision 43
          end
        end # loop for decision 43
        char_literal100 = match( T__33, TOKENS_FOLLOWING_T__33_IN_parameters_610 )

        tree_for_char_literal100 = @adaptor.create_with_payload( char_literal100 )
        @adaptor.add_child( root_0, tree_for_char_literal100 )

        # - - - - - - - rule clean up - - - - - - - -
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
    # 221:1: parameter : ( ID reference_type | ID 'areall' path );
    # 
    def parameter
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      return_value = ParameterReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID101__ = nil
      __ID103__ = nil
      string_literal104 = nil
      reference_type102 = nil
      path105 = nil

      tree_for_ID101 = nil
      tree_for_ID103 = nil
      tree_for_string_literal104 = nil

      begin
        # at line 222:2: ( ID reference_type | ID 'areall' path )
        alt_44 = 2
        look_44_0 = @input.peek( 1 )

        if ( look_44_0 == ID )
          look_44_1 = @input.peek( 2 )

          if ( look_44_1 == T__34 )
            alt_44 = 2
          elsif ( look_44_1 == T__49 )
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


          # at line 222:4: ID reference_type
          __ID101__ = match( ID, TOKENS_FOLLOWING_ID_IN_parameter_622 )

          tree_for_ID101 = @adaptor.create_with_payload( __ID101__ )
          @adaptor.add_child( root_0, tree_for_ID101 )

          @state.following.push( TOKENS_FOLLOWING_reference_type_IN_parameter_624 )
          reference_type102 = reference_type
          @state.following.pop
          @adaptor.add_child( root_0, reference_type102.tree )
          # --> action
          	@now[__ID101__.text] = ( reference_type102.nil? ? nil : reference_type102.val )	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 224:4: ID 'areall' path
          __ID103__ = match( ID, TOKENS_FOLLOWING_ID_IN_parameter_633 )

          tree_for_ID103 = @adaptor.create_with_payload( __ID103__ )
          @adaptor.add_child( root_0, tree_for_ID103 )

          string_literal104 = match( T__34, TOKENS_FOLLOWING_T__34_IN_parameter_635 )

          tree_for_string_literal104 = @adaptor.create_with_payload( string_literal104 )
          @adaptor.add_child( root_0, tree_for_string_literal104 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_parameter_637 )
          path105 = path
          @state.following.pop
          @adaptor.add_child( root_0, path105.tree )
          # --> action

          			@now[__ID103__.text] = { '_context' => 'all',
          				'_isa' => self.toRef(( path105 && @input.to_s( path105.start, path105.stop ) )),
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
        # trace_out( __method__, 17 )

      end
      
      return return_value
    end

    ConditionsReturnValue = define_return_scope 

    # 
    # parser rule conditions
    # 
    # (in SFP.g)
    # 233:1: conditions : 'conditions' '{' ( NL )* constraint_body '}' ( NL )+ ;
    # 
    def conditions
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      return_value = ConditionsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal106 = nil
      char_literal107 = nil
      __NL108__ = nil
      char_literal110 = nil
      __NL111__ = nil
      constraint_body109 = nil

      tree_for_string_literal106 = nil
      tree_for_char_literal107 = nil
      tree_for_NL108 = nil
      tree_for_char_literal110 = nil
      tree_for_NL111 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 234:4: 'conditions' '{' ( NL )* constraint_body '}' ( NL )+
        string_literal106 = match( T__35, TOKENS_FOLLOWING_T__35_IN_conditions_652 )

        tree_for_string_literal106 = @adaptor.create_with_payload( string_literal106 )
        @adaptor.add_child( root_0, tree_for_string_literal106 )

        # --> action

        			@now['_conditions']['_parent'] = @now
        			@now = @now['_conditions']
        		
        # <-- action
        char_literal107 = match( T__20, TOKENS_FOLLOWING_T__20_IN_conditions_660 )

        tree_for_char_literal107 = @adaptor.create_with_payload( char_literal107 )
        @adaptor.add_child( root_0, tree_for_char_literal107 )

        # at line 239:7: ( NL )*
        while true # decision 45
          alt_45 = 2
          look_45_0 = @input.peek( 1 )

          if ( look_45_0 == NL )
            alt_45 = 1

          end
          case alt_45
          when 1
            # at line 239:7: NL
            __NL108__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditions_662 )

            tree_for_NL108 = @adaptor.create_with_payload( __NL108__ )
            @adaptor.add_child( root_0, tree_for_NL108 )


          else
            break # out of loop for decision 45
          end
        end # loop for decision 45
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_conditions_665 )
        constraint_body109 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body109.tree )
        char_literal110 = match( T__21, TOKENS_FOLLOWING_T__21_IN_conditions_667 )

        tree_for_char_literal110 = @adaptor.create_with_payload( char_literal110 )
        @adaptor.add_child( root_0, tree_for_char_literal110 )

        # at file 239:31: ( NL )+
        match_count_46 = 0
        while true
          alt_46 = 2
          look_46_0 = @input.peek( 1 )

          if ( look_46_0 == NL )
            alt_46 = 1

          end
          case alt_46
          when 1
            # at line 239:31: NL
            __NL111__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditions_669 )

            tree_for_NL111 = @adaptor.create_with_payload( __NL111__ )
            @adaptor.add_child( root_0, tree_for_NL111 )


          else
            match_count_46 > 0 and break
            eee = EarlyExit(46)


            raise eee
          end
          match_count_46 += 1
        end

        # --> action
        	self.gotoParent()	
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

    EffectsReturnValue = define_return_scope 

    # 
    # parser rule effects
    # 
    # (in SFP.g)
    # 244:1: effects : 'effects' '{' ( NL )* mutation_body '}' ( NL )+ ;
    # 
    def effects
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      return_value = EffectsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal112 = nil
      char_literal113 = nil
      __NL114__ = nil
      char_literal116 = nil
      __NL117__ = nil
      mutation_body115 = nil

      tree_for_string_literal112 = nil
      tree_for_char_literal113 = nil
      tree_for_NL114 = nil
      tree_for_char_literal116 = nil
      tree_for_NL117 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 245:4: 'effects' '{' ( NL )* mutation_body '}' ( NL )+
        string_literal112 = match( T__36, TOKENS_FOLLOWING_T__36_IN_effects_686 )

        tree_for_string_literal112 = @adaptor.create_with_payload( string_literal112 )
        @adaptor.add_child( root_0, tree_for_string_literal112 )

        # --> action

        			@now['_effects']['_parent'] = @now
        			@now = @now['_effects']
        		
        # <-- action
        char_literal113 = match( T__20, TOKENS_FOLLOWING_T__20_IN_effects_694 )

        tree_for_char_literal113 = @adaptor.create_with_payload( char_literal113 )
        @adaptor.add_child( root_0, tree_for_char_literal113 )

        # at line 250:7: ( NL )*
        while true # decision 47
          alt_47 = 2
          look_47_0 = @input.peek( 1 )

          if ( look_47_0 == NL )
            alt_47 = 1

          end
          case alt_47
          when 1
            # at line 250:7: NL
            __NL114__ = match( NL, TOKENS_FOLLOWING_NL_IN_effects_696 )

            tree_for_NL114 = @adaptor.create_with_payload( __NL114__ )
            @adaptor.add_child( root_0, tree_for_NL114 )


          else
            break # out of loop for decision 47
          end
        end # loop for decision 47
        @state.following.push( TOKENS_FOLLOWING_mutation_body_IN_effects_702 )
        mutation_body115 = mutation_body
        @state.following.pop
        @adaptor.add_child( root_0, mutation_body115.tree )
        char_literal116 = match( T__21, TOKENS_FOLLOWING_T__21_IN_effects_707 )

        tree_for_char_literal116 = @adaptor.create_with_payload( char_literal116 )
        @adaptor.add_child( root_0, tree_for_char_literal116 )

        # at file 252:7: ( NL )+
        match_count_48 = 0
        while true
          alt_48 = 2
          look_48_0 = @input.peek( 1 )

          if ( look_48_0 == NL )
            alt_48 = 1

          end
          case alt_48
          when 1
            # at line 252:7: NL
            __NL117__ = match( NL, TOKENS_FOLLOWING_NL_IN_effects_709 )

            tree_for_NL117 = @adaptor.create_with_payload( __NL117__ )
            @adaptor.add_child( root_0, tree_for_NL117 )


          else
            match_count_48 > 0 and break
            eee = EarlyExit(48)


            raise eee
          end
          match_count_48 += 1
        end

        # --> action
        	self.gotoParent()	
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

    ConstraintReturnValue = define_return_scope 

    # 
    # parser rule constraint
    # 
    # (in SFP.g)
    # 256:1: constraint : ID 'constraint' '{' ( NL )* constraint_body '}' ( NL )+ ;
    # 
    def constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = ConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID118__ = nil
      string_literal119 = nil
      char_literal120 = nil
      __NL121__ = nil
      char_literal123 = nil
      __NL124__ = nil
      constraint_body122 = nil

      tree_for_ID118 = nil
      tree_for_string_literal119 = nil
      tree_for_char_literal120 = nil
      tree_for_NL121 = nil
      tree_for_char_literal123 = nil
      tree_for_NL124 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 257:4: ID 'constraint' '{' ( NL )* constraint_body '}' ( NL )+
        __ID118__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_725 )

        tree_for_ID118 = @adaptor.create_with_payload( __ID118__ )
        @adaptor.add_child( root_0, tree_for_ID118 )

        string_literal119 = match( T__37, TOKENS_FOLLOWING_T__37_IN_constraint_727 )

        tree_for_string_literal119 = @adaptor.create_with_payload( string_literal119 )
        @adaptor.add_child( root_0, tree_for_string_literal119 )

        # --> action

        			@now[__ID118__.text] = { '_self' => __ID118__.text,
        				'_context' => 'constraint',
        				'_type' => 'and',
        				'_parent' => @now
        			}
        			@now = @now[__ID118__.text]
        		
        # <-- action
        char_literal120 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_735 )

        tree_for_char_literal120 = @adaptor.create_with_payload( char_literal120 )
        @adaptor.add_child( root_0, tree_for_char_literal120 )

        # at line 266:7: ( NL )*
        while true # decision 49
          alt_49 = 2
          look_49_0 = @input.peek( 1 )

          if ( look_49_0 == NL )
            alt_49 = 1

          end
          case alt_49
          when 1
            # at line 266:7: NL
            __NL121__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_737 )

            tree_for_NL121 = @adaptor.create_with_payload( __NL121__ )
            @adaptor.add_child( root_0, tree_for_NL121 )


          else
            break # out of loop for decision 49
          end
        end # loop for decision 49
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_constraint_740 )
        constraint_body122 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body122.tree )
        char_literal123 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_742 )

        tree_for_char_literal123 = @adaptor.create_with_payload( char_literal123 )
        @adaptor.add_child( root_0, tree_for_char_literal123 )

        # at file 266:31: ( NL )+
        match_count_50 = 0
        while true
          alt_50 = 2
          look_50_0 = @input.peek( 1 )

          if ( look_50_0 == NL )
            alt_50 = 1

          end
          case alt_50
          when 1
            # at line 266:31: NL
            __NL124__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_744 )

            tree_for_NL124 = @adaptor.create_with_payload( __NL124__ )
            @adaptor.add_child( root_0, tree_for_NL124 )


          else
            match_count_50 > 0 and break
            eee = EarlyExit(50)


            raise eee
          end
          match_count_50 += 1
        end

        # --> action
        	self.gotoParent()	
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

    ConstraintBodyReturnValue = define_return_scope 

    # 
    # parser rule constraint_body
    # 
    # (in SFP.g)
    # 270:1: constraint_body : ( ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+ )* ;
    # 
    def constraint_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = ConstraintBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL128__ = nil
      constraint_statement125 = nil
      constraint_namespace126 = nil
      constraint_iterator127 = nil

      tree_for_NL128 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 271:4: ( ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+ )*
        # at line 271:4: ( ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+ )*
        while true # decision 53
          alt_53 = 2
          look_53_0 = @input.peek( 1 )

          if ( look_53_0 == ID || look_53_0 == T__26 || look_53_0 == T__38 )
            alt_53 = 1

          end
          case alt_53
          when 1
            # at line 272:4: ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+
            # at line 272:4: ( constraint_statement | constraint_namespace | constraint_iterator )
            alt_51 = 3
            alt_51 = @dfa51.predict( @input )
            case alt_51
            when 1
              # at line 272:6: constraint_statement
              @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_767 )
              constraint_statement125 = constraint_statement
              @state.following.pop
              @adaptor.add_child( root_0, constraint_statement125.tree )
              # --> action
              	@now[( constraint_statement125.nil? ? nil : constraint_statement125.key )] = ( constraint_statement125.nil? ? nil : constraint_statement125.val )	
              # <-- action

            when 2
              # at line 274:6: constraint_namespace
              @state.following.push( TOKENS_FOLLOWING_constraint_namespace_IN_constraint_body_780 )
              constraint_namespace126 = constraint_namespace
              @state.following.pop
              @adaptor.add_child( root_0, constraint_namespace126.tree )

            when 3
              # at line 275:6: constraint_iterator
              @state.following.push( TOKENS_FOLLOWING_constraint_iterator_IN_constraint_body_787 )
              constraint_iterator127 = constraint_iterator
              @state.following.pop
              @adaptor.add_child( root_0, constraint_iterator127.tree )

            end
            # at file 277:3: ( NL )+
            match_count_52 = 0
            while true
              alt_52 = 2
              look_52_0 = @input.peek( 1 )

              if ( look_52_0 == NL )
                alt_52 = 1

              end
              case alt_52
              when 1
                # at line 277:3: NL
                __NL128__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_body_796 )

                tree_for_NL128 = @adaptor.create_with_payload( __NL128__ )
                @adaptor.add_child( root_0, tree_for_NL128 )


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
    # 280:1: constraint_namespace : path ( NL )* '{' ( NL )* ( constraint_statement ( NL )+ )* '}' ;
    # 
    def constraint_namespace
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = ConstraintNamespaceReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL130__ = nil
      char_literal131 = nil
      __NL132__ = nil
      __NL134__ = nil
      char_literal135 = nil
      path129 = nil
      constraint_statement133 = nil

      tree_for_NL130 = nil
      tree_for_char_literal131 = nil
      tree_for_NL132 = nil
      tree_for_NL134 = nil
      tree_for_char_literal135 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 281:4: path ( NL )* '{' ( NL )* ( constraint_statement ( NL )+ )* '}'
        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_namespace_810 )
        path129 = path
        @state.following.pop
        @adaptor.add_child( root_0, path129.tree )
        # at line 281:9: ( NL )*
        while true # decision 54
          alt_54 = 2
          look_54_0 = @input.peek( 1 )

          if ( look_54_0 == NL )
            alt_54 = 1

          end
          case alt_54
          when 1
            # at line 281:9: NL
            __NL130__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_812 )

            tree_for_NL130 = @adaptor.create_with_payload( __NL130__ )
            @adaptor.add_child( root_0, tree_for_NL130 )


          else
            break # out of loop for decision 54
          end
        end # loop for decision 54
        char_literal131 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_namespace_815 )

        tree_for_char_literal131 = @adaptor.create_with_payload( char_literal131 )
        @adaptor.add_child( root_0, tree_for_char_literal131 )

        # at line 281:17: ( NL )*
        while true # decision 55
          alt_55 = 2
          look_55_0 = @input.peek( 1 )

          if ( look_55_0 == NL )
            alt_55 = 1

          end
          case alt_55
          when 1
            # at line 281:17: NL
            __NL132__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_817 )

            tree_for_NL132 = @adaptor.create_with_payload( __NL132__ )
            @adaptor.add_child( root_0, tree_for_NL132 )


          else
            break # out of loop for decision 55
          end
        end # loop for decision 55
        # at line 281:21: ( constraint_statement ( NL )+ )*
        while true # decision 57
          alt_57 = 2
          look_57_0 = @input.peek( 1 )

          if ( look_57_0 == ID || look_57_0 == T__26 )
            alt_57 = 1

          end
          case alt_57
          when 1
            # at line 281:22: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_namespace_821 )
            constraint_statement133 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement133.tree )
            # --> action

            			key = self.toRef(( path129 && @input.to_s( path129.start, path129.stop ) ) + '.' + ( constraint_statement133.nil? ? nil : constraint_statement133.key )[2,( constraint_statement133.nil? ? nil : constraint_statement133.key ).length])
            			@now[key] = ( constraint_statement133.nil? ? nil : constraint_statement133.val )
            		
            # <-- action
            # at file 286:3: ( NL )+
            match_count_56 = 0
            while true
              alt_56 = 2
              look_56_0 = @input.peek( 1 )

              if ( look_56_0 == NL )
                alt_56 = 1

              end
              case alt_56
              when 1
                # at line 286:3: NL
                __NL134__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_829 )

                tree_for_NL134 = @adaptor.create_with_payload( __NL134__ )
                @adaptor.add_child( root_0, tree_for_NL134 )


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
        char_literal135 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_namespace_834 )

        tree_for_char_literal135 = @adaptor.create_with_payload( char_literal135 )
        @adaptor.add_child( root_0, tree_for_char_literal135 )

        # - - - - - - - rule clean up - - - - - - - -
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
    # 289:1: constraint_iterator : 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ )* '}' ;
    # 
    def constraint_iterator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
      return_value = ConstraintIteratorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal136 = nil
      string_literal138 = nil
      __ID139__ = nil
      __NL140__ = nil
      char_literal141 = nil
      __NL142__ = nil
      __NL144__ = nil
      char_literal145 = nil
      path137 = nil
      constraint_statement143 = nil

      tree_for_string_literal136 = nil
      tree_for_string_literal138 = nil
      tree_for_ID139 = nil
      tree_for_NL140 = nil
      tree_for_char_literal141 = nil
      tree_for_NL142 = nil
      tree_for_NL144 = nil
      tree_for_char_literal145 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 290:4: 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ )* '}'
        string_literal136 = match( T__38, TOKENS_FOLLOWING_T__38_IN_constraint_iterator_845 )

        tree_for_string_literal136 = @adaptor.create_with_payload( string_literal136 )
        @adaptor.add_child( root_0, tree_for_string_literal136 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_iterator_847 )
        path137 = path
        @state.following.pop
        @adaptor.add_child( root_0, path137.tree )
        string_literal138 = match( T__39, TOKENS_FOLLOWING_T__39_IN_constraint_iterator_849 )

        tree_for_string_literal138 = @adaptor.create_with_payload( string_literal138 )
        @adaptor.add_child( root_0, tree_for_string_literal138 )

        __ID139__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_iterator_851 )

        tree_for_ID139 = @adaptor.create_with_payload( __ID139__ )
        @adaptor.add_child( root_0, tree_for_ID139 )

        # at line 290:27: ( NL )*
        while true # decision 58
          alt_58 = 2
          look_58_0 = @input.peek( 1 )

          if ( look_58_0 == NL )
            alt_58 = 1

          end
          case alt_58
          when 1
            # at line 290:27: NL
            __NL140__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_853 )

            tree_for_NL140 = @adaptor.create_with_payload( __NL140__ )
            @adaptor.add_child( root_0, tree_for_NL140 )


          else
            break # out of loop for decision 58
          end
        end # loop for decision 58
        char_literal141 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_iterator_856 )

        tree_for_char_literal141 = @adaptor.create_with_payload( char_literal141 )
        @adaptor.add_child( root_0, tree_for_char_literal141 )

        # at file 290:35: ( NL )+
        match_count_59 = 0
        while true
          alt_59 = 2
          look_59_0 = @input.peek( 1 )

          if ( look_59_0 == NL )
            alt_59 = 1

          end
          case alt_59
          when 1
            # at line 290:35: NL
            __NL142__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_858 )

            tree_for_NL142 = @adaptor.create_with_payload( __NL142__ )
            @adaptor.add_child( root_0, tree_for_NL142 )


          else
            match_count_59 > 0 and break
            eee = EarlyExit(59)


            raise eee
          end
          match_count_59 += 1
        end

        # --> action

        			id = self.toRef(( path137 && @input.to_s( path137.start, path137.stop ) ))
        			@now[id] = { '_parent' => @now,
        				'_context' => 'iterator',
        				'_self' => id,
        				'_var' => __ID139__.text
        			}
        			@now = @now[id]
        		
        # <-- action
        # at line 300:3: ( constraint_statement ( NL )+ )*
        while true # decision 61
          alt_61 = 2
          look_61_0 = @input.peek( 1 )

          if ( look_61_0 == ID || look_61_0 == T__26 )
            alt_61 = 1

          end
          case alt_61
          when 1
            # at line 300:4: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_iterator_868 )
            constraint_statement143 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement143.tree )
            # --> action

            			@now[( constraint_statement143.nil? ? nil : constraint_statement143.key )] = ( constraint_statement143.nil? ? nil : constraint_statement143.val )
            		
            # <-- action
            # at file 304:3: ( NL )+
            match_count_60 = 0
            while true
              alt_60 = 2
              look_60_0 = @input.peek( 1 )

              if ( look_60_0 == NL )
                alt_60 = 1

              end
              case alt_60
              when 1
                # at line 304:3: NL
                __NL144__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_876 )

                tree_for_NL144 = @adaptor.create_with_payload( __NL144__ )
                @adaptor.add_child( root_0, tree_for_NL144 )


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
        char_literal145 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_iterator_883 )

        tree_for_char_literal145 = @adaptor.create_with_payload( char_literal145 )
        @adaptor.add_child( root_0, tree_for_char_literal145 )

        # --> action
        	self.gotoParent()	
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

    ConstraintStatementReturnValue = define_return_scope :key, :val

    # 
    # parser rule constraint_statement
    # 
    # (in SFP.g)
    # 309:1: constraint_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | conditional_constraint | reference binary_comp comp_value );
    # 
    def constraint_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = ConstraintStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL151__ = nil
      __NULL157__ = nil
      string_literal159 = nil
      string_literal160 = nil
      set163 = nil
      string_literal164 = nil
      reference146 = nil
      equals_op147 = nil
      value148 = nil
      reference149 = nil
      equals_op150 = nil
      reference152 = nil
      not_equals_op153 = nil
      value154 = nil
      reference155 = nil
      not_equals_op156 = nil
      reference158 = nil
      set_value161 = nil
      reference162 = nil
      set_value165 = nil
      conditional_constraint166 = nil
      reference167 = nil
      binary_comp168 = nil
      comp_value169 = nil

      tree_for_NULL151 = nil
      tree_for_NULL157 = nil
      tree_for_string_literal159 = nil
      tree_for_string_literal160 = nil
      tree_for_set163 = nil
      tree_for_string_literal164 = nil

      begin
        # at line 310:2: ( reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | conditional_constraint | reference binary_comp comp_value )
        alt_63 = 8
        alt_63 = @dfa63.predict( @input )
        case alt_63
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 310:4: reference equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_902 )
          reference146 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference146.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_constraint_statement_904 )
          equals_op147 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op147.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_906 )
          value148 = value
          @state.following.pop
          @adaptor.add_child( root_0, value148.tree )
          # --> action

          			return_value.key = ( reference146.nil? ? nil : reference146.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => ( value148.nil? ? nil : value148.val ) }
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 315:4: reference equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_915 )
          reference149 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference149.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_constraint_statement_917 )
          equals_op150 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op150.tree )
          __NULL151__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_constraint_statement_919 )

          tree_for_NULL151 = @adaptor.create_with_payload( __NULL151__ )
          @adaptor.add_child( root_0, tree_for_NULL151 )

          # --> action

          			return_value.key = ( reference149.nil? ? nil : reference149.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => self.null_value }
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 320:4: reference not_equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_928 )
          reference152 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference152.tree )
          @state.following.push( TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_930 )
          not_equals_op153 = not_equals_op
          @state.following.pop
          @adaptor.add_child( root_0, not_equals_op153.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_932 )
          value154 = value
          @state.following.pop
          @adaptor.add_child( root_0, value154.tree )
          # --> action

          			return_value.key = ( reference152.nil? ? nil : reference152.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-equals', '_value' => ( value154.nil? ? nil : value154.val ) }
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 325:4: reference not_equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_941 )
          reference155 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference155.tree )
          @state.following.push( TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_943 )
          not_equals_op156 = not_equals_op
          @state.following.pop
          @adaptor.add_child( root_0, not_equals_op156.tree )
          __NULL157__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_constraint_statement_945 )

          tree_for_NULL157 = @adaptor.create_with_payload( __NULL157__ )
          @adaptor.add_child( root_0, tree_for_NULL157 )

          # --> action

          			return_value.key = ( reference155.nil? ? nil : reference155.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-equals', '_value' => self.null_value }
          		
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 330:4: reference ( 'is' )? 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_954 )
          reference158 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference158.tree )
          # at line 330:14: ( 'is' )?
          alt_62 = 2
          look_62_0 = @input.peek( 1 )

          if ( look_62_0 == T__40 )
            alt_62 = 1
          end
          case alt_62
          when 1
            # at line 330:14: 'is'
            string_literal159 = match( T__40, TOKENS_FOLLOWING_T__40_IN_constraint_statement_956 )

            tree_for_string_literal159 = @adaptor.create_with_payload( string_literal159 )
            @adaptor.add_child( root_0, tree_for_string_literal159 )


          end
          string_literal160 = match( T__41, TOKENS_FOLLOWING_T__41_IN_constraint_statement_959 )

          tree_for_string_literal160 = @adaptor.create_with_payload( string_literal160 )
          @adaptor.add_child( root_0, tree_for_string_literal160 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_961 )
          set_value161 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value161.tree )
          # --> action

          			return_value.key = ( reference158.nil? ? nil : reference158.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'in', '_value' => ( set_value161.nil? ? nil : set_value161.val ) }
          		
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 335:4: reference ( 'isnt' | 'not' ) 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_970 )
          reference162 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference162.tree )
          set163 = @input.look
          if @input.peek( 1 ).between?( T__42, T__43 )
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set163 ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          string_literal164 = match( T__41, TOKENS_FOLLOWING_T__41_IN_constraint_statement_978 )

          tree_for_string_literal164 = @adaptor.create_with_payload( string_literal164 )
          @adaptor.add_child( root_0, tree_for_string_literal164 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_980 )
          set_value165 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value165.tree )
          # --> action

          			return_value.key = ( reference162.nil? ? nil : reference162.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-in', '_value' => ( set_value165.nil? ? nil : set_value165.val ) }
          		
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 340:4: conditional_constraint
          @state.following.push( TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_989 )
          conditional_constraint166 = conditional_constraint
          @state.following.pop
          @adaptor.add_child( root_0, conditional_constraint166.tree )

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 341:4: reference binary_comp comp_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_994 )
          reference167 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference167.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_996 )
          binary_comp168 = binary_comp
          @state.following.pop
          @adaptor.add_child( root_0, binary_comp168.tree )
          @state.following.push( TOKENS_FOLLOWING_comp_value_IN_constraint_statement_998 )
          comp_value169 = comp_value
          @state.following.pop
          @adaptor.add_child( root_0, comp_value169.tree )
          # --> action

          			return_value.key = ( reference167.nil? ? nil : reference167.val )
          			return_value.val = { '_context' => 'constraint', '_type' => ( binary_comp168 && @input.to_s( binary_comp168.start, binary_comp168.stop ) ), '_value' => ( comp_value169.nil? ? nil : comp_value169.val ) }
          		
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

    CompValueReturnValue = define_return_scope :val

    # 
    # parser rule comp_value
    # 
    # (in SFP.g)
    # 348:1: comp_value returns [val] : ( NUMBER | reference );
    # 
    def comp_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = CompValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NUMBER170__ = nil
      reference171 = nil

      tree_for_NUMBER170 = nil

      begin
        # at line 349:2: ( NUMBER | reference )
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


          # at line 349:4: NUMBER
          __NUMBER170__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_comp_value_1017 )

          tree_for_NUMBER170 = @adaptor.create_with_payload( __NUMBER170__ )
          @adaptor.add_child( root_0, tree_for_NUMBER170 )

          # --> action
          	return_value.val = __NUMBER170__.text.to_f	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 351:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_comp_value_1026 )
          reference171 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference171.tree )
          # --> action
          	return_value.val = ( reference171.nil? ? nil : reference171.val )	
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

    ConditionalConstraintReturnValue = define_return_scope 

    # 
    # parser rule conditional_constraint
    # 
    # (in SFP.g)
    # 355:1: conditional_constraint : 'if' constraint_statement ( NL )* conditional_constraint_then ;
    # 
    def conditional_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = ConditionalConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal172 = nil
      __NL174__ = nil
      constraint_statement173 = nil
      conditional_constraint_then175 = nil

      tree_for_string_literal172 = nil
      tree_for_NL174 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 356:4: 'if' constraint_statement ( NL )* conditional_constraint_then
        string_literal172 = match( T__26, TOKENS_FOLLOWING_T__26_IN_conditional_constraint_1041 )

        tree_for_string_literal172 = @adaptor.create_with_payload( string_literal172 )
        @adaptor.add_child( root_0, tree_for_string_literal172 )

        # --> action

        			id = self.nextId
        			@now[id] = { '_parent' => @now,
        				'_context' => 'ifthen',
        				'_if' => nil,
        				'_then' => nil
        			}
        			@now = @now[id]
        		
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_1049 )
        constraint_statement173 = constraint_statement
        @state.following.pop
        @adaptor.add_child( root_0, constraint_statement173.tree )
        # at line 366:24: ( NL )*
        while true # decision 65
          alt_65 = 2
          look_65_0 = @input.peek( 1 )

          if ( look_65_0 == NL )
            alt_65 = 1

          end
          case alt_65
          when 1
            # at line 366:24: NL
            __NL174__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditional_constraint_1051 )

            tree_for_NL174 = @adaptor.create_with_payload( __NL174__ )
            @adaptor.add_child( root_0, tree_for_NL174 )


          else
            break # out of loop for decision 65
          end
        end # loop for decision 65
        # --> action

        			@now['_if'] = { '_left' => ( constraint_statement173.nil? ? nil : constraint_statement173.key ),
        				'_right' => ( constraint_statement173.nil? ? nil : constraint_statement173.val )
        			}
        		
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_conditional_constraint_then_IN_conditional_constraint_1060 )
        conditional_constraint_then175 = conditional_constraint_then
        @state.following.pop
        @adaptor.add_child( root_0, conditional_constraint_then175.tree )
        # --> action
        	self.gotoParent()	
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

    ConditionalConstraintThenReturnValue = define_return_scope 

    # 
    # parser rule conditional_constraint_then
    # 
    # (in SFP.g)
    # 376:1: conditional_constraint_then : 'then' constraint_statement ;
    # 
    def conditional_constraint_then
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = ConditionalConstraintThenReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal176 = nil
      constraint_statement177 = nil

      tree_for_string_literal176 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 377:4: 'then' constraint_statement
        string_literal176 = match( T__27, TOKENS_FOLLOWING_T__27_IN_conditional_constraint_then_1075 )

        tree_for_string_literal176 = @adaptor.create_with_payload( string_literal176 )
        @adaptor.add_child( root_0, tree_for_string_literal176 )

        @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_1077 )
        constraint_statement177 = constraint_statement
        @state.following.pop
        @adaptor.add_child( root_0, constraint_statement177.tree )
        # --> action

        			@now['_then'] = { '_left' => ( constraint_statement177.nil? ? nil : constraint_statement177.key ),
        				'_right' => ( constraint_statement177.nil? ? nil : constraint_statement177.val )
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
        # trace_out( __method__, 27 )

      end
      
      return return_value
    end

    MutationBodyReturnValue = define_return_scope 

    # 
    # parser rule mutation_body
    # 
    # (in SFP.g)
    # 385:1: mutation_body : ( ( mutation_statement | mutation_iterator ) ( NL )+ )* ;
    # 
    def mutation_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = MutationBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL180__ = nil
      mutation_statement178 = nil
      mutation_iterator179 = nil

      tree_for_NL180 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 386:4: ( ( mutation_statement | mutation_iterator ) ( NL )+ )*
        # at line 386:4: ( ( mutation_statement | mutation_iterator ) ( NL )+ )*
        while true # decision 68
          alt_68 = 2
          look_68_0 = @input.peek( 1 )

          if ( look_68_0 == ID || look_68_0 == T__38 || look_68_0 == T__45 )
            alt_68 = 1

          end
          case alt_68
          when 1
            # at line 387:4: ( mutation_statement | mutation_iterator ) ( NL )+
            # at line 387:4: ( mutation_statement | mutation_iterator )
            alt_66 = 2
            look_66_0 = @input.peek( 1 )

            if ( look_66_0 == ID || look_66_0 == T__45 )
              alt_66 = 1
            elsif ( look_66_0 == T__38 )
              alt_66 = 2
            else
              raise NoViableAlternative( "", 66, 0 )
            end
            case alt_66
            when 1
              # at line 387:6: mutation_statement
              @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_mutation_body_1099 )
              mutation_statement178 = mutation_statement
              @state.following.pop
              @adaptor.add_child( root_0, mutation_statement178.tree )
              # --> action
              	@now[( mutation_statement178.nil? ? nil : mutation_statement178.key )] = ( mutation_statement178.nil? ? nil : mutation_statement178.val )	
              # <-- action

            when 2
              # at line 389:6: mutation_iterator
              @state.following.push( TOKENS_FOLLOWING_mutation_iterator_IN_mutation_body_1112 )
              mutation_iterator179 = mutation_iterator
              @state.following.pop
              @adaptor.add_child( root_0, mutation_iterator179.tree )

            end
            # at file 391:3: ( NL )+
            match_count_67 = 0
            while true
              alt_67 = 2
              look_67_0 = @input.peek( 1 )

              if ( look_67_0 == NL )
                alt_67 = 1

              end
              case alt_67
              when 1
                # at line 391:3: NL
                __NL180__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_body_1121 )

                tree_for_NL180 = @adaptor.create_with_payload( __NL180__ )
                @adaptor.add_child( root_0, tree_for_NL180 )


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
    # 394:1: mutation_iterator : 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( mutation_statement ( NL )+ )* '}' ;
    # 
    def mutation_iterator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = MutationIteratorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal181 = nil
      string_literal183 = nil
      __ID184__ = nil
      __NL185__ = nil
      char_literal186 = nil
      __NL187__ = nil
      __NL189__ = nil
      char_literal190 = nil
      path182 = nil
      mutation_statement188 = nil

      tree_for_string_literal181 = nil
      tree_for_string_literal183 = nil
      tree_for_ID184 = nil
      tree_for_NL185 = nil
      tree_for_char_literal186 = nil
      tree_for_NL187 = nil
      tree_for_NL189 = nil
      tree_for_char_literal190 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 395:4: 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( mutation_statement ( NL )+ )* '}'
        string_literal181 = match( T__38, TOKENS_FOLLOWING_T__38_IN_mutation_iterator_1136 )

        tree_for_string_literal181 = @adaptor.create_with_payload( string_literal181 )
        @adaptor.add_child( root_0, tree_for_string_literal181 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_iterator_1138 )
        path182 = path
        @state.following.pop
        @adaptor.add_child( root_0, path182.tree )
        string_literal183 = match( T__39, TOKENS_FOLLOWING_T__39_IN_mutation_iterator_1140 )

        tree_for_string_literal183 = @adaptor.create_with_payload( string_literal183 )
        @adaptor.add_child( root_0, tree_for_string_literal183 )

        __ID184__ = match( ID, TOKENS_FOLLOWING_ID_IN_mutation_iterator_1142 )

        tree_for_ID184 = @adaptor.create_with_payload( __ID184__ )
        @adaptor.add_child( root_0, tree_for_ID184 )

        # at line 395:27: ( NL )*
        while true # decision 69
          alt_69 = 2
          look_69_0 = @input.peek( 1 )

          if ( look_69_0 == NL )
            alt_69 = 1

          end
          case alt_69
          when 1
            # at line 395:27: NL
            __NL185__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_1144 )

            tree_for_NL185 = @adaptor.create_with_payload( __NL185__ )
            @adaptor.add_child( root_0, tree_for_NL185 )


          else
            break # out of loop for decision 69
          end
        end # loop for decision 69
        char_literal186 = match( T__20, TOKENS_FOLLOWING_T__20_IN_mutation_iterator_1147 )

        tree_for_char_literal186 = @adaptor.create_with_payload( char_literal186 )
        @adaptor.add_child( root_0, tree_for_char_literal186 )

        # at file 395:35: ( NL )+
        match_count_70 = 0
        while true
          alt_70 = 2
          look_70_0 = @input.peek( 1 )

          if ( look_70_0 == NL )
            alt_70 = 1

          end
          case alt_70
          when 1
            # at line 395:35: NL
            __NL187__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_1149 )

            tree_for_NL187 = @adaptor.create_with_payload( __NL187__ )
            @adaptor.add_child( root_0, tree_for_NL187 )


          else
            match_count_70 > 0 and break
            eee = EarlyExit(70)


            raise eee
          end
          match_count_70 += 1
        end

        # --> action

        			id = self.toRef(( path182 && @input.to_s( path182.start, path182.stop ) ))
        			@now[id] = { '_parent' => @now,
        				'_context' => 'iterator',
        				'_self' => id,
        				'_var' => __ID184__.text
        			}
        			@now = @now[id]
        		
        # <-- action
        # at line 405:3: ( mutation_statement ( NL )+ )*
        while true # decision 72
          alt_72 = 2
          look_72_0 = @input.peek( 1 )

          if ( look_72_0 == ID || look_72_0 == T__45 )
            alt_72 = 1

          end
          case alt_72
          when 1
            # at line 405:4: mutation_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_mutation_iterator_1159 )
            mutation_statement188 = mutation_statement
            @state.following.pop
            @adaptor.add_child( root_0, mutation_statement188.tree )
            # --> action
            	@now[( mutation_statement188.nil? ? nil : mutation_statement188.key )] = ( mutation_statement188.nil? ? nil : mutation_statement188.val )	
            # <-- action
            # at file 407:3: ( NL )+
            match_count_71 = 0
            while true
              alt_71 = 2
              look_71_0 = @input.peek( 1 )

              if ( look_71_0 == NL )
                alt_71 = 1

              end
              case alt_71
              when 1
                # at line 407:3: NL
                __NL189__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_1167 )

                tree_for_NL189 = @adaptor.create_with_payload( __NL189__ )
                @adaptor.add_child( root_0, tree_for_NL189 )


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
        char_literal190 = match( T__21, TOKENS_FOLLOWING_T__21_IN_mutation_iterator_1174 )

        tree_for_char_literal190 = @adaptor.create_with_payload( char_literal190 )
        @adaptor.add_child( root_0, tree_for_char_literal190 )

        # --> action
        	self.gotoParent()	
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
        # trace_out( __method__, 29 )

      end
      
      return return_value
    end

    MutationStatementReturnValue = define_return_scope :key, :val

    # 
    # parser rule mutation_statement
    # 
    # (in SFP.g)
    # 412:1: mutation_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' );
    # 
    def mutation_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = MutationStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL196__ = nil
      __NUMBER199__ = nil
      string_literal201 = nil
      string_literal202 = nil
      string_literal205 = nil
      string_literal208 = nil
      char_literal210 = nil
      string_literal212 = nil
      char_literal214 = nil
      reference191 = nil
      equals_op192 = nil
      value193 = nil
      reference194 = nil
      equals_op195 = nil
      reference197 = nil
      binary_op198 = nil
      reference200 = nil
      path203 = nil
      object_body204 = nil
      path206 = nil
      reference207 = nil
      value209 = nil
      reference211 = nil
      value213 = nil

      tree_for_NULL196 = nil
      tree_for_NUMBER199 = nil
      tree_for_string_literal201 = nil
      tree_for_string_literal202 = nil
      tree_for_string_literal205 = nil
      tree_for_string_literal208 = nil
      tree_for_char_literal210 = nil
      tree_for_string_literal212 = nil
      tree_for_char_literal214 = nil

      begin
        # at line 413:2: ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' )
        alt_74 = 7
        alt_74 = @dfa74.predict( @input )
        case alt_74
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 413:4: reference equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1193 )
          reference191 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference191.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_mutation_statement_1195 )
          equals_op192 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op192.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_1197 )
          value193 = value
          @state.following.pop
          @adaptor.add_child( root_0, value193.tree )
          # --> action

          			return_value.key = ( reference191.nil? ? nil : reference191.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'equals',
          				'_value' => ( value193.nil? ? nil : value193.val )
          			}
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 421:4: reference equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1206 )
          reference194 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference194.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_mutation_statement_1208 )
          equals_op195 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op195.tree )
          __NULL196__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_mutation_statement_1210 )

          tree_for_NULL196 = @adaptor.create_with_payload( __NULL196__ )
          @adaptor.add_child( root_0, tree_for_NULL196 )

          # --> action

          			return_value.key = ( reference194.nil? ? nil : reference194.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'equals',
          				'_value' => self.null_value
          			}
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 429:4: reference binary_op NUMBER
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1219 )
          reference197 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference197.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_op_IN_mutation_statement_1221 )
          binary_op198 = binary_op
          @state.following.pop
          @adaptor.add_child( root_0, binary_op198.tree )
          __NUMBER199__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_mutation_statement_1223 )

          tree_for_NUMBER199 = @adaptor.create_with_payload( __NUMBER199__ )
          @adaptor.add_child( root_0, tree_for_NUMBER199 )

          # --> action

          			return_value.key = ( reference197.nil? ? nil : reference197.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => ( binary_op198 && @input.to_s( binary_op198.start, binary_op198.stop ) ),
          				'_value' => __NUMBER199__.text.to_f
          			}
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 437:4: reference 'is' 'new' path ( object_body )?
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1232 )
          reference200 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference200.tree )
          string_literal201 = match( T__40, TOKENS_FOLLOWING_T__40_IN_mutation_statement_1234 )

          tree_for_string_literal201 = @adaptor.create_with_payload( string_literal201 )
          @adaptor.add_child( root_0, tree_for_string_literal201 )

          string_literal202 = match( T__44, TOKENS_FOLLOWING_T__44_IN_mutation_statement_1236 )

          tree_for_string_literal202 = @adaptor.create_with_payload( string_literal202 )
          @adaptor.add_child( root_0, tree_for_string_literal202 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_statement_1238 )
          path203 = path
          @state.following.pop
          @adaptor.add_child( root_0, path203.tree )
          # --> action

          			id = '_' + self.nextId
          			@now[id] = { '_self' => id,
          				'_context' => 'object',
          				'_isa' => self.toRef(( path203 && @input.to_s( path203.start, path203.stop ) )),
          				'_parent' => @now
          			}
          			@now = @now[id]
          		
          # <-- action
          # at line 447:3: ( object_body )?
          alt_73 = 2
          look_73_0 = @input.peek( 1 )

          if ( look_73_0 == T__20 )
            alt_73 = 1
          end
          case alt_73
          when 1
            # at line 447:3: object_body
            @state.following.push( TOKENS_FOLLOWING_object_body_IN_mutation_statement_1246 )
            object_body204 = object_body
            @state.following.pop
            @adaptor.add_child( root_0, object_body204.tree )

          end
          # --> action

          			n = self.gotoParent()
          			@now.delete(n['_self'])
          			return_value.key = ( reference200.nil? ? nil : reference200.val )
          			return_value.val = n
          		
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 454:4: 'delete' path
          string_literal205 = match( T__45, TOKENS_FOLLOWING_T__45_IN_mutation_statement_1256 )

          tree_for_string_literal205 = @adaptor.create_with_payload( string_literal205 )
          @adaptor.add_child( root_0, tree_for_string_literal205 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_statement_1258 )
          path206 = path
          @state.following.pop
          @adaptor.add_child( root_0, path206.tree )
          # --> action

          			id = '_' + self.nextId
          			@now[id] = { '_self' => id,
          				'_context' => 'mutation',
          				'_type' => 'delete',
          				'_value' => self.toRef(( path206 && @input.to_s( path206.start, path206.stop ) ))
          			}
          		
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 463:4: reference 'add(' value ')'
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1267 )
          reference207 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference207.tree )
          string_literal208 = match( T__46, TOKENS_FOLLOWING_T__46_IN_mutation_statement_1269 )

          tree_for_string_literal208 = @adaptor.create_with_payload( string_literal208 )
          @adaptor.add_child( root_0, tree_for_string_literal208 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_1271 )
          value209 = value
          @state.following.pop
          @adaptor.add_child( root_0, value209.tree )
          char_literal210 = match( T__33, TOKENS_FOLLOWING_T__33_IN_mutation_statement_1273 )

          tree_for_char_literal210 = @adaptor.create_with_payload( char_literal210 )
          @adaptor.add_child( root_0, tree_for_char_literal210 )

          # --> action

          			return_value.key = ( reference207.nil? ? nil : reference207.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'add',
          				'_value' => ( value209.nil? ? nil : value209.val )
          			}
          		
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 471:4: reference 'remove(' value ')'
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1282 )
          reference211 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference211.tree )
          string_literal212 = match( T__47, TOKENS_FOLLOWING_T__47_IN_mutation_statement_1284 )

          tree_for_string_literal212 = @adaptor.create_with_payload( string_literal212 )
          @adaptor.add_child( root_0, tree_for_string_literal212 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_1286 )
          value213 = value
          @state.following.pop
          @adaptor.add_child( root_0, value213.tree )
          char_literal214 = match( T__33, TOKENS_FOLLOWING_T__33_IN_mutation_statement_1288 )

          tree_for_char_literal214 = @adaptor.create_with_payload( char_literal214 )
          @adaptor.add_child( root_0, tree_for_char_literal214 )

          # --> action

          			return_value.key = ( reference211.nil? ? nil : reference211.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'remove',
          				'_value' => ( value213.nil? ? nil : value213.val )
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
        # trace_out( __method__, 30 )

      end
      
      return return_value
    end

    SetValueReturnValue = define_return_scope :val

    # 
    # parser rule set_value
    # 
    # (in SFP.g)
    # 481:1: set_value returns [val] : '(' set_item ( ',' set_item )* ')' ;
    # 
    def set_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
      return_value = SetValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal215 = nil
      char_literal217 = nil
      char_literal219 = nil
      set_item216 = nil
      set_item218 = nil

      tree_for_char_literal215 = nil
      tree_for_char_literal217 = nil
      tree_for_char_literal219 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 482:4: '(' set_item ( ',' set_item )* ')'
        char_literal215 = match( T__31, TOKENS_FOLLOWING_T__31_IN_set_value_1307 )

        tree_for_char_literal215 = @adaptor.create_with_payload( char_literal215 )
        @adaptor.add_child( root_0, tree_for_char_literal215 )

        # --> action
        	@set = Array.new	
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_1315 )
        set_item216 = set_item
        @state.following.pop
        @adaptor.add_child( root_0, set_item216.tree )
        # at line 484:12: ( ',' set_item )*
        while true # decision 75
          alt_75 = 2
          look_75_0 = @input.peek( 1 )

          if ( look_75_0 == T__32 )
            alt_75 = 1

          end
          case alt_75
          when 1
            # at line 484:13: ',' set_item
            char_literal217 = match( T__32, TOKENS_FOLLOWING_T__32_IN_set_value_1318 )

            tree_for_char_literal217 = @adaptor.create_with_payload( char_literal217 )
            @adaptor.add_child( root_0, tree_for_char_literal217 )

            @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_1320 )
            set_item218 = set_item
            @state.following.pop
            @adaptor.add_child( root_0, set_item218.tree )

          else
            break # out of loop for decision 75
          end
        end # loop for decision 75
        # --> action
        	return_value.val = @set	
        # <-- action
        char_literal219 = match( T__33, TOKENS_FOLLOWING_T__33_IN_set_value_1330 )

        tree_for_char_literal219 = @adaptor.create_with_payload( char_literal219 )
        @adaptor.add_child( root_0, tree_for_char_literal219 )

        # - - - - - - - rule clean up - - - - - - - -
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
    # 489:1: set_item : value ;
    # 
    def set_item
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = SetItemReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      value220 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 490:4: value
        @state.following.push( TOKENS_FOLLOWING_value_IN_set_item_1341 )
        value220 = value
        @state.following.pop
        @adaptor.add_child( root_0, value220.tree )
        # --> action
        	@set.push(( value220.nil? ? nil : value220.val ))	
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

    ValueReturnValue = define_return_scope :val

    # 
    # parser rule value
    # 
    # (in SFP.g)
    # 494:1: value returns [val] : ( primitive_value | reference | set_value );
    # 
    def value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
      return_value = ValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      primitive_value221 = nil
      reference222 = nil
      set_value223 = nil


      begin
        # at line 495:2: ( primitive_value | reference | set_value )
        alt_76 = 3
        case look_76 = @input.peek( 1 )
        when STRING, NUMBER, BOOLEAN, MULTILINE_STRING then alt_76 = 1
        when ID then alt_76 = 2
        when T__31 then alt_76 = 3
        else
          raise NoViableAlternative( "", 76, 0 )
        end
        case alt_76
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 495:4: primitive_value
          @state.following.push( TOKENS_FOLLOWING_primitive_value_IN_value_1360 )
          primitive_value221 = primitive_value
          @state.following.pop
          @adaptor.add_child( root_0, primitive_value221.tree )
          # --> action
          	return_value.val = ( primitive_value221.nil? ? nil : primitive_value221.val )	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 497:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_value_1369 )
          reference222 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference222.tree )
          # --> action
          	return_value.val = ( reference222.nil? ? nil : reference222.val )	
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 499:4: set_value
          @state.following.push( TOKENS_FOLLOWING_set_value_IN_value_1378 )
          set_value223 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value223.tree )
          # --> action
          	return_value.val = ( set_value223.nil? ? nil : set_value223.val )	
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

    PrimitiveValueReturnValue = define_return_scope :val

    # 
    # parser rule primitive_value
    # 
    # (in SFP.g)
    # 503:1: primitive_value returns [val] : ( BOOLEAN | NUMBER | STRING | MULTILINE_STRING );
    # 
    def primitive_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )
      return_value = PrimitiveValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __BOOLEAN224__ = nil
      __NUMBER225__ = nil
      __STRING226__ = nil
      __MULTILINE_STRING227__ = nil

      tree_for_BOOLEAN224 = nil
      tree_for_NUMBER225 = nil
      tree_for_STRING226 = nil
      tree_for_MULTILINE_STRING227 = nil

      begin
        # at line 504:2: ( BOOLEAN | NUMBER | STRING | MULTILINE_STRING )
        alt_77 = 4
        case look_77 = @input.peek( 1 )
        when BOOLEAN then alt_77 = 1
        when NUMBER then alt_77 = 2
        when STRING then alt_77 = 3
        when MULTILINE_STRING then alt_77 = 4
        else
          raise NoViableAlternative( "", 77, 0 )
        end
        case alt_77
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 504:4: BOOLEAN
          __BOOLEAN224__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_1397 )

          tree_for_BOOLEAN224 = @adaptor.create_with_payload( __BOOLEAN224__ )
          @adaptor.add_child( root_0, tree_for_BOOLEAN224 )

          # --> action

          			if __BOOLEAN224__.text == 'true' or __BOOLEAN224__.text == 'yes'
          				return_value.val = true
          			else  # 'false', 'no'
          				return_value.val = false
          			end
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 512:4: NUMBER
          __NUMBER225__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_primitive_value_1406 )

          tree_for_NUMBER225 = @adaptor.create_with_payload( __NUMBER225__ )
          @adaptor.add_child( root_0, tree_for_NUMBER225 )

          # --> action
          	return_value.val = __NUMBER225__.text.to_f	
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 514:4: STRING
          __STRING226__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_primitive_value_1415 )

          tree_for_STRING226 = @adaptor.create_with_payload( __STRING226__ )
          @adaptor.add_child( root_0, tree_for_STRING226 )

          # --> action
          	return_value.val = __STRING226__.text[1,__STRING226__.text.length-2]	
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 516:4: MULTILINE_STRING
          __MULTILINE_STRING227__ = match( MULTILINE_STRING, TOKENS_FOLLOWING_MULTILINE_STRING_IN_primitive_value_1424 )

          tree_for_MULTILINE_STRING227 = @adaptor.create_with_payload( __MULTILINE_STRING227__ )
          @adaptor.add_child( root_0, tree_for_MULTILINE_STRING227 )

          # --> action
          	return_value.val = __MULTILINE_STRING227__.text[2, __MULTILINE_STRING227__.text.length-2]	
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
        # trace_out( __method__, 34 )

      end
      
      return return_value
    end

    PathReturnValue = define_return_scope 

    # 
    # parser rule path
    # 
    # (in SFP.g)
    # 520:1: path : ID ( '.' ID )* ;
    # 
    def path
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
      return_value = PathReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID228__ = nil
      char_literal229 = nil
      __ID230__ = nil

      tree_for_ID228 = nil
      tree_for_char_literal229 = nil
      tree_for_ID230 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 521:4: ID ( '.' ID )*
        __ID228__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_1439 )

        tree_for_ID228 = @adaptor.create_with_payload( __ID228__ )
        @adaptor.add_child( root_0, tree_for_ID228 )

        # at line 521:6: ( '.' ID )*
        while true # decision 78
          alt_78 = 2
          look_78_0 = @input.peek( 1 )

          if ( look_78_0 == T__48 )
            alt_78 = 1

          end
          case alt_78
          when 1
            # at line 521:7: '.' ID
            char_literal229 = match( T__48, TOKENS_FOLLOWING_T__48_IN_path_1441 )

            tree_for_char_literal229 = @adaptor.create_with_payload( char_literal229 )
            @adaptor.add_child( root_0, tree_for_char_literal229 )

            __ID230__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_1442 )

            tree_for_ID230 = @adaptor.create_with_payload( __ID230__ )
            @adaptor.add_child( root_0, tree_for_ID230 )


          else
            break # out of loop for decision 78
          end
        end # loop for decision 78
        # - - - - - - - rule clean up - - - - - - - -
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
    # 524:1: reference returns [val] : path ;
    # 
    def reference
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
      return_value = ReferenceReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      path231 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 525:4: path
        @state.following.push( TOKENS_FOLLOWING_path_IN_reference_1459 )
        path231 = path
        @state.following.pop
        @adaptor.add_child( root_0, path231.tree )
        # --> action
        	return_value.val = self.toRef(( path231 && @input.to_s( path231.start, path231.stop ) ))	
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

    ReferenceTypeReturnValue = define_return_scope :val

    # 
    # parser rule reference_type
    # 
    # (in SFP.g)
    # 529:1: reference_type returns [val] : 'isref' path ;
    # 
    def reference_type
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )
      return_value = ReferenceTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal232 = nil
      path233 = nil

      tree_for_string_literal232 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 530:4: 'isref' path
        string_literal232 = match( T__49, TOKENS_FOLLOWING_T__49_IN_reference_type_1478 )

        tree_for_string_literal232 = @adaptor.create_with_payload( string_literal232 )
        @adaptor.add_child( root_0, tree_for_string_literal232 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_reference_type_1480 )
        path233 = path
        @state.following.pop
        @adaptor.add_child( root_0, path233.tree )
        # --> action

        			return_value.val = { '_context' => 'null',
        				'_isa' => self.toRef(( path233 && @input.to_s( path233.start, path233.stop ) ))
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
        # trace_out( __method__, 37 )

      end
      
      return return_value
    end

    EqualsOpReturnValue = define_return_scope 

    # 
    # parser rule equals_op
    # 
    # (in SFP.g)
    # 538:1: equals_op : ( '=' | 'is' );
    # 
    def equals_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )
      return_value = EqualsOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set234 = nil

      tree_for_set234 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set234 = @input.look
        if @input.peek(1) == T__40 || @input.peek(1) == T__50
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set234 ) )
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
    # 543:1: not_equals_op : ( '!=' | 'isnt' );
    # 
    def not_equals_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )
      return_value = NotEqualsOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set235 = nil

      tree_for_set235 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set235 = @input.look
        if @input.peek(1) == T__42 || @input.peek(1) == T__51
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set235 ) )
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
    # 548:1: binary_op : ( '+=' | '-=' | '*=' | '/=' );
    # 
    def binary_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )
      return_value = BinaryOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set236 = nil

      tree_for_set236 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set236 = @input.look
        if @input.peek( 1 ).between?( T__52, T__55 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set236 ) )
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
    # 555:1: binary_comp : ( '>' | '>=' | '<' | '<=' );
    # 
    def binary_comp
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )
      return_value = BinaryCompReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set237 = nil

      tree_for_set237 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set237 = @input.look
        if @input.peek( 1 ).between?( T__56, T__59 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set237 ) )
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
      MAX = unpack( 2, 28, 2, -1 )
      ACCEPT = unpack( 2, -1, 1, 1, 1, 2 )
      SPECIAL = unpack( 4, -1 )
      TRANSITION = [
        unpack( 1, 1, 23, -1, 1, 2 ),
        unpack( 1, 1, 1, -1, 1, 3, 14, -1, 1, 3, 4, -1, 1, 3, 1, -1, 1, 
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
          ()* loopback of 184:3: ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )*
        __dfa_description__
      end
    end
    class DFA51 < ANTLR3::DFA
      EOT = unpack( 7, -1 )
      EOF = unpack( 7, -1 )
      MIN = unpack( 1, 6, 1, 4, 2, -1, 1, 6, 1, -1, 1, 4 )
      MAX = unpack( 1, 38, 1, 59, 2, -1, 1, 6, 1, -1, 1, 59 )
      ACCEPT = unpack( 2, -1, 1, 1, 1, 3, 1, -1, 1, 2, 1, -1 )
      SPECIAL = unpack( 7, -1 )
      TRANSITION = [
        unpack( 1, 1, 19, -1, 1, 2, 11, -1, 1, 3 ),
        unpack( 1, 5, 15, -1, 1, 5, 19, -1, 4, 2, 4, -1, 1, 4, 1, -1, 2, 
                 2, 4, -1, 4, 2 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 6 ),
        unpack(  ),
        unpack( 1, 5, 15, -1, 1, 5, 19, -1, 4, 2, 4, -1, 1, 4, 1, -1, 2, 
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
          272:4: ( constraint_statement | constraint_namespace | constraint_iterator )
        __dfa_description__
      end
    end
    class DFA63 < ANTLR3::DFA
      EOT = unpack( 16, -1 )
      EOF = unpack( 16, -1 )
      MIN = unpack( 1, 6, 1, 40, 1, -1, 1, 6, 3, 5, 1, -1, 1, 5, 2, -1, 
                    1, 40, 4, -1 )
      MAX = unpack( 1, 26, 1, 59, 1, -1, 1, 6, 2, 41, 1, 31, 1, -1, 1, 31, 
                    2, -1, 1, 59, 4, -1 )
      ACCEPT = unpack( 2, -1, 1, 7, 4, -1, 1, 5, 1, -1, 1, 6, 1, 8, 1, -1, 
                       1, 1, 1, 2, 1, 3, 1, 4 )
      SPECIAL = unpack( 16, -1 )
      TRANSITION = [
        unpack( 1, 1, 19, -1, 1, 2 ),
        unpack( 1, 4, 1, 7, 1, 5, 1, 9, 4, -1, 1, 3, 1, -1, 1, 6, 1, 8, 
                 4, -1, 4, 10 ),
        unpack(  ),
        unpack( 1, 11 ),
        unpack( 2, 12, 1, 13, 3, 12, 20, -1, 1, 12, 9, -1, 1, 7 ),
        unpack( 2, 14, 1, 15, 3, 14, 20, -1, 1, 14, 9, -1, 1, 9 ),
        unpack( 2, 12, 1, 13, 3, 12, 20, -1, 1, 12 ),
        unpack(  ),
        unpack( 2, 14, 1, 15, 3, 14, 20, -1, 1, 14 ),
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
          309:1: constraint_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | conditional_constraint | reference binary_comp comp_value );
        __dfa_description__
      end
    end
    class DFA74 < ANTLR3::DFA
      EOT = unpack( 13, -1 )
      EOF = unpack( 13, -1 )
      MIN = unpack( 1, 6, 1, 40, 1, -1, 1, 6, 1, 5, 1, -1, 1, 5, 2, -1, 
                    1, 40, 3, -1 )
      MAX = unpack( 1, 45, 1, 55, 1, -1, 1, 6, 1, 44, 1, -1, 1, 31, 2, -1, 
                    1, 55, 3, -1 )
      ACCEPT = unpack( 2, -1, 1, 5, 2, -1, 1, 3, 1, -1, 1, 6, 1, 7, 1, -1, 
                       1, 4, 1, 1, 1, 2 )
      SPECIAL = unpack( 13, -1 )
      TRANSITION = [
        unpack( 1, 1, 38, -1, 1, 2 ),
        unpack( 1, 4, 5, -1, 1, 7, 1, 8, 1, 3, 1, -1, 1, 6, 1, -1, 4, 5 ),
        unpack(  ),
        unpack( 1, 9 ),
        unpack( 2, 11, 1, 12, 3, 11, 20, -1, 1, 11, 12, -1, 1, 10 ),
        unpack(  ),
        unpack( 2, 11, 1, 12, 3, 11, 20, -1, 1, 11 ),
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
          412:1: mutation_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' );
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
    TOKENS_FOLLOWING_NL_IN_sfp_49 = Set[ 1, 4, 6, 18, 22, 23, 29 ]
    TOKENS_FOLLOWING_include_IN_sfp_52 = Set[ 1, 6, 18, 22, 23, 29 ]
    TOKENS_FOLLOWING_header_IN_sfp_55 = Set[ 1, 6, 22, 23, 29 ]
    TOKENS_FOLLOWING_state_section_IN_sfp_59 = Set[ 1, 6, 22 ]
    TOKENS_FOLLOWING_composite_IN_sfp_63 = Set[ 1, 6, 22 ]
    TOKENS_FOLLOWING_constraint_IN_sfp_67 = Set[ 1, 6, 22 ]
    TOKENS_FOLLOWING_T__18_IN_include_80 = Set[ 5 ]
    TOKENS_FOLLOWING_include_file_IN_include_82 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_include_84 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_STRING_IN_include_file_96 = Set[ 1 ]
    TOKENS_FOLLOWING_class_definition_IN_header_112 = Set[ 1 ]
    TOKENS_FOLLOWING_procedure_IN_header_117 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_state_section_128 = Set[ 19 ]
    TOKENS_FOLLOWING_T__19_IN_state_section_130 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_section_138 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_NL_IN_state_section_140 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_attribute_IN_state_section_143 = Set[ 6, 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_section_146 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_state_section_148 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__22_IN_composite_164 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_composite_166 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_composite_174 = Set[ 4, 6, 21, 22 ]
    TOKENS_FOLLOWING_NL_IN_composite_176 = Set[ 4, 6, 21, 22 ]
    TOKENS_FOLLOWING_attribute_IN_composite_181 = Set[ 6, 21, 22 ]
    TOKENS_FOLLOWING_constraint_IN_composite_185 = Set[ 6, 21, 22 ]
    TOKENS_FOLLOWING_T__21_IN_composite_190 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_composite_192 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__23_IN_class_definition_208 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_class_definition_210 = Set[ 1, 4, 20, 24 ]
    TOKENS_FOLLOWING_extends_class_IN_class_definition_219 = Set[ 1, 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_class_definition_233 = Set[ 4, 6, 21, 23, 29 ]
    TOKENS_FOLLOWING_NL_IN_class_definition_235 = Set[ 4, 6, 21, 23, 29 ]
    TOKENS_FOLLOWING_attribute_IN_class_definition_240 = Set[ 6, 21, 23, 29 ]
    TOKENS_FOLLOWING_procedure_IN_class_definition_244 = Set[ 6, 21, 23, 29 ]
    TOKENS_FOLLOWING_T__21_IN_class_definition_249 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_class_definition_253 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__24_IN_extends_class_274 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_extends_class_276 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_attribute_291 = Set[ 40, 50 ]
    TOKENS_FOLLOWING_equals_op_IN_attribute_293 = Set[ 5, 6, 8, 9, 10, 31 ]
    TOKENS_FOLLOWING_value_IN_attribute_295 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_297 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_attribute_307 = Set[ 49 ]
    TOKENS_FOLLOWING_reference_type_IN_attribute_309 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_311 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_object_def_IN_attribute_321 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_323 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_object_def_335 = Set[ 1, 20, 25 ]
    TOKENS_FOLLOWING_T__25_IN_object_def_344 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_object_def_346 = Set[ 1, 20 ]
    TOKENS_FOLLOWING_object_body_IN_object_def_359 = Set[ 1 ]
    TOKENS_FOLLOWING_T__20_IN_object_body_375 = Set[ 4, 6, 21, 26 ]
    TOKENS_FOLLOWING_NL_IN_object_body_377 = Set[ 4, 6, 21, 26 ]
    TOKENS_FOLLOWING_object_attribute_IN_object_body_382 = Set[ 6, 21, 26 ]
    TOKENS_FOLLOWING_state_dependency_IN_object_body_386 = Set[ 6, 21, 26 ]
    TOKENS_FOLLOWING_T__21_IN_object_body_391 = Set[ 1 ]
    TOKENS_FOLLOWING_attribute_IN_object_attribute_402 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_object_attribute_407 = Set[ 40, 50 ]
    TOKENS_FOLLOWING_equals_op_IN_object_attribute_409 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_object_attribute_411 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_object_attribute_413 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__26_IN_state_dependency_429 = Set[ 6 ]
    TOKENS_FOLLOWING_dep_effect_IN_state_dependency_433 = Set[ 4, 27 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_435 = Set[ 4, 27 ]
    TOKENS_FOLLOWING_T__27_IN_state_dependency_438 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_440 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_dependency_443 = Set[ 4, 6, 21, 26, 38 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_447 = Set[ 4, 6, 21, 26, 38 ]
    TOKENS_FOLLOWING_constraint_body_IN_state_dependency_450 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_dependency_455 = Set[ 4, 28 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_461 = Set[ 4, 28 ]
    TOKENS_FOLLOWING_T__28_IN_state_dependency_464 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_466 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_dependency_469 = Set[ 4, 6, 21, 26, 38 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_473 = Set[ 4, 6, 21, 26, 38 ]
    TOKENS_FOLLOWING_constraint_body_IN_state_dependency_476 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_dependency_480 = Set[ 4, 28 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_486 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_reference_IN_dep_effect_498 = Set[ 40, 50 ]
    TOKENS_FOLLOWING_equals_op_IN_dep_effect_500 = Set[ 5, 6, 7, 8, 9, 10, 31 ]
    TOKENS_FOLLOWING_value_IN_dep_effect_507 = Set[ 1 ]
    TOKENS_FOLLOWING_NULL_IN_dep_effect_513 = Set[ 1 ]
    TOKENS_FOLLOWING_T__29_IN_procedure_529 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_procedure_531 = Set[ 20, 31 ]
    TOKENS_FOLLOWING_parameters_IN_procedure_539 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_procedure_542 = Set[ 4, 30, 35, 36 ]
    TOKENS_FOLLOWING_NL_IN_procedure_544 = Set[ 4, 30, 35, 36 ]
    TOKENS_FOLLOWING_T__30_IN_procedure_552 = Set[ 40, 50 ]
    TOKENS_FOLLOWING_equals_op_IN_procedure_554 = Set[ 8 ]
    TOKENS_FOLLOWING_NUMBER_IN_procedure_556 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_procedure_566 = Set[ 4, 30, 35, 36 ]
    TOKENS_FOLLOWING_conditions_IN_procedure_576 = Set[ 4, 30, 35, 36 ]
    TOKENS_FOLLOWING_effects_IN_procedure_579 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_procedure_581 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_procedure_583 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__31_IN_parameters_599 = Set[ 6 ]
    TOKENS_FOLLOWING_parameter_IN_parameters_601 = Set[ 32, 33 ]
    TOKENS_FOLLOWING_T__32_IN_parameters_604 = Set[ 6 ]
    TOKENS_FOLLOWING_parameter_IN_parameters_606 = Set[ 32, 33 ]
    TOKENS_FOLLOWING_T__33_IN_parameters_610 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_622 = Set[ 49 ]
    TOKENS_FOLLOWING_reference_type_IN_parameter_624 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_633 = Set[ 34 ]
    TOKENS_FOLLOWING_T__34_IN_parameter_635 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_parameter_637 = Set[ 1 ]
    TOKENS_FOLLOWING_T__35_IN_conditions_652 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_conditions_660 = Set[ 4, 6, 21, 26, 38 ]
    TOKENS_FOLLOWING_NL_IN_conditions_662 = Set[ 4, 6, 21, 26, 38 ]
    TOKENS_FOLLOWING_constraint_body_IN_conditions_665 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_conditions_667 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_conditions_669 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__36_IN_effects_686 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_effects_694 = Set[ 4, 6, 21, 38, 45 ]
    TOKENS_FOLLOWING_NL_IN_effects_696 = Set[ 4, 6, 21, 38, 45 ]
    TOKENS_FOLLOWING_mutation_body_IN_effects_702 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_effects_707 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_effects_709 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_constraint_725 = Set[ 37 ]
    TOKENS_FOLLOWING_T__37_IN_constraint_727 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_735 = Set[ 4, 6, 21, 26, 38 ]
    TOKENS_FOLLOWING_NL_IN_constraint_737 = Set[ 4, 6, 21, 26, 38 ]
    TOKENS_FOLLOWING_constraint_body_IN_constraint_740 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_742 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_744 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_767 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_namespace_IN_constraint_body_780 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_iterator_IN_constraint_body_787 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_body_796 = Set[ 1, 4, 6, 26, 38 ]
    TOKENS_FOLLOWING_path_IN_constraint_namespace_810 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_812 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_namespace_815 = Set[ 4, 6, 21, 26 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_817 = Set[ 4, 6, 21, 26 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_namespace_821 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_829 = Set[ 4, 6, 21, 26 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_namespace_834 = Set[ 1 ]
    TOKENS_FOLLOWING_T__38_IN_constraint_iterator_845 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_constraint_iterator_847 = Set[ 39 ]
    TOKENS_FOLLOWING_T__39_IN_constraint_iterator_849 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_constraint_iterator_851 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_853 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_iterator_856 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_858 = Set[ 4, 6, 21, 26 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_iterator_868 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_876 = Set[ 4, 6, 21, 26 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_iterator_883 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_902 = Set[ 40, 50 ]
    TOKENS_FOLLOWING_equals_op_IN_constraint_statement_904 = Set[ 5, 6, 8, 9, 10, 31 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_906 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_915 = Set[ 40, 50 ]
    TOKENS_FOLLOWING_equals_op_IN_constraint_statement_917 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_919 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_928 = Set[ 42, 51 ]
    TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_930 = Set[ 5, 6, 8, 9, 10, 31 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_932 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_941 = Set[ 42, 51 ]
    TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_943 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_945 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_954 = Set[ 40, 41 ]
    TOKENS_FOLLOWING_T__40_IN_constraint_statement_956 = Set[ 41 ]
    TOKENS_FOLLOWING_T__41_IN_constraint_statement_959 = Set[ 5, 6, 8, 9, 10, 31 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_961 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_970 = Set[ 42, 43 ]
    TOKENS_FOLLOWING_set_IN_constraint_statement_972 = Set[ 41 ]
    TOKENS_FOLLOWING_T__41_IN_constraint_statement_978 = Set[ 5, 6, 8, 9, 10, 31 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_980 = Set[ 1 ]
    TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_989 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_994 = Set[ 56, 57, 58, 59 ]
    TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_996 = Set[ 6, 8 ]
    TOKENS_FOLLOWING_comp_value_IN_constraint_statement_998 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_comp_value_1017 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_comp_value_1026 = Set[ 1 ]
    TOKENS_FOLLOWING_T__26_IN_conditional_constraint_1041 = Set[ 6, 26 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_1049 = Set[ 4, 27 ]
    TOKENS_FOLLOWING_NL_IN_conditional_constraint_1051 = Set[ 4, 27 ]
    TOKENS_FOLLOWING_conditional_constraint_then_IN_conditional_constraint_1060 = Set[ 1 ]
    TOKENS_FOLLOWING_T__27_IN_conditional_constraint_then_1075 = Set[ 6, 26 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_1077 = Set[ 1 ]
    TOKENS_FOLLOWING_mutation_statement_IN_mutation_body_1099 = Set[ 4 ]
    TOKENS_FOLLOWING_mutation_iterator_IN_mutation_body_1112 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_body_1121 = Set[ 1, 4, 6, 38, 45 ]
    TOKENS_FOLLOWING_T__38_IN_mutation_iterator_1136 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_iterator_1138 = Set[ 39 ]
    TOKENS_FOLLOWING_T__39_IN_mutation_iterator_1140 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_mutation_iterator_1142 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_1144 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_mutation_iterator_1147 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_1149 = Set[ 4, 6, 21, 45 ]
    TOKENS_FOLLOWING_mutation_statement_IN_mutation_iterator_1159 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_1167 = Set[ 4, 6, 21, 45 ]
    TOKENS_FOLLOWING_T__21_IN_mutation_iterator_1174 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1193 = Set[ 40, 50 ]
    TOKENS_FOLLOWING_equals_op_IN_mutation_statement_1195 = Set[ 5, 6, 8, 9, 10, 31 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_1197 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1206 = Set[ 40, 50 ]
    TOKENS_FOLLOWING_equals_op_IN_mutation_statement_1208 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_mutation_statement_1210 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1219 = Set[ 52, 53, 54, 55 ]
    TOKENS_FOLLOWING_binary_op_IN_mutation_statement_1221 = Set[ 8 ]
    TOKENS_FOLLOWING_NUMBER_IN_mutation_statement_1223 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1232 = Set[ 40 ]
    TOKENS_FOLLOWING_T__40_IN_mutation_statement_1234 = Set[ 44 ]
    TOKENS_FOLLOWING_T__44_IN_mutation_statement_1236 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_statement_1238 = Set[ 1, 20 ]
    TOKENS_FOLLOWING_object_body_IN_mutation_statement_1246 = Set[ 1 ]
    TOKENS_FOLLOWING_T__45_IN_mutation_statement_1256 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_statement_1258 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1267 = Set[ 46 ]
    TOKENS_FOLLOWING_T__46_IN_mutation_statement_1269 = Set[ 5, 6, 8, 9, 10, 31 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_1271 = Set[ 33 ]
    TOKENS_FOLLOWING_T__33_IN_mutation_statement_1273 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1282 = Set[ 47 ]
    TOKENS_FOLLOWING_T__47_IN_mutation_statement_1284 = Set[ 5, 6, 8, 9, 10, 31 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_1286 = Set[ 33 ]
    TOKENS_FOLLOWING_T__33_IN_mutation_statement_1288 = Set[ 1 ]
    TOKENS_FOLLOWING_T__31_IN_set_value_1307 = Set[ 5, 6, 8, 9, 10, 31 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_1315 = Set[ 32, 33 ]
    TOKENS_FOLLOWING_T__32_IN_set_value_1318 = Set[ 5, 6, 8, 9, 10, 31 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_1320 = Set[ 32, 33 ]
    TOKENS_FOLLOWING_T__33_IN_set_value_1330 = Set[ 1 ]
    TOKENS_FOLLOWING_value_IN_set_item_1341 = Set[ 1 ]
    TOKENS_FOLLOWING_primitive_value_IN_value_1360 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_value_1369 = Set[ 1 ]
    TOKENS_FOLLOWING_set_value_IN_value_1378 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_1397 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_primitive_value_1406 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_primitive_value_1415 = Set[ 1 ]
    TOKENS_FOLLOWING_MULTILINE_STRING_IN_primitive_value_1424 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_path_1439 = Set[ 1, 48 ]
    TOKENS_FOLLOWING_T__48_IN_path_1441 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_path_1442 = Set[ 1, 48 ]
    TOKENS_FOLLOWING_path_IN_reference_1459 = Set[ 1 ]
    TOKENS_FOLLOWING_T__49_IN_reference_type_1478 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_reference_type_1480 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_not_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_comp_0 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end

