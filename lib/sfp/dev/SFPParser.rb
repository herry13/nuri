#!/usr/bin/env ruby
#
# SFP.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: SFP.g
# Generated at: 2012-07-31 11:11:49
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

    RULE_METHODS = [ :sfp, :include, :include_file, :header, :state_section, 
                     :composite, :class_definition, :extends_class, :attribute, 
                     :object_def, :object_body, :object_attribute, :state_dependency, 
                     :dep_effect, :operator, :op_conditions, :op_effects, 
                     :op_statement, :procedure, :parameters, :parameter, 
                     :conditions, :effects, :constraint, :constraint_body, 
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
    # 66:1: sfp : ( NL )* ( include )* ( header )* ( state_section | composite | constraint )* ;
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


        # at line 67:4: ( NL )* ( include )* ( header )* ( state_section | composite | constraint )*
        # --> action

        			@root = Hash.new
        			@now = @root
        			@id = 0
        			@parser = Nuri::Sfp::Main.new
        			@root['Object'] = { '_self' => 'Object', '_context' => 'class', '_parent' => @root }
        		
        # <-- action
        # at line 74:3: ( NL )*
        while true # decision 1
          alt_1 = 2
          look_1_0 = @input.peek( 1 )

          if ( look_1_0 == NL )
            alt_1 = 1

          end
          case alt_1
          when 1
            # at line 74:3: NL
            __NL1__ = match( NL, TOKENS_FOLLOWING_NL_IN_sfp_49 )

            tree_for_NL1 = @adaptor.create_with_payload( __NL1__ )
            @adaptor.add_child( root_0, tree_for_NL1 )


          else
            break # out of loop for decision 1
          end
        end # loop for decision 1
        # at line 74:7: ( include )*
        while true # decision 2
          alt_2 = 2
          look_2_0 = @input.peek( 1 )

          if ( look_2_0 == T__18 )
            alt_2 = 1

          end
          case alt_2
          when 1
            # at line 74:7: include
            @state.following.push( TOKENS_FOLLOWING_include_IN_sfp_52 )
            include2 = include
            @state.following.pop
            @adaptor.add_child( root_0, include2.tree )

          else
            break # out of loop for decision 2
          end
        end # loop for decision 2
        # at line 74:16: ( header )*
        while true # decision 3
          alt_3 = 2
          look_3_0 = @input.peek( 1 )

          if ( look_3_0 == T__23 || look_3_0 == T__33 )
            alt_3 = 1

          end
          case alt_3
          when 1
            # at line 74:16: header
            @state.following.push( TOKENS_FOLLOWING_header_IN_sfp_55 )
            header3 = header
            @state.following.pop
            @adaptor.add_child( root_0, header3.tree )

          else
            break # out of loop for decision 3
          end
        end # loop for decision 3
        # at line 74:24: ( state_section | composite | constraint )*
        while true # decision 4
          alt_4 = 4
          look_4_0 = @input.peek( 1 )

          if ( look_4_0 == ID )
            look_4_2 = @input.peek( 2 )

            if ( look_4_2 == T__19 )
              alt_4 = 1
            elsif ( look_4_2 == T__38 )
              alt_4 = 3

            end
          elsif ( look_4_0 == T__22 )
            alt_4 = 2

          end
          case alt_4
          when 1
            # at line 74:25: state_section
            @state.following.push( TOKENS_FOLLOWING_state_section_IN_sfp_59 )
            state_section4 = state_section
            @state.following.pop
            @adaptor.add_child( root_0, state_section4.tree )

          when 2
            # at line 74:41: composite
            @state.following.push( TOKENS_FOLLOWING_composite_IN_sfp_63 )
            composite5 = composite
            @state.following.pop
            @adaptor.add_child( root_0, composite5.tree )

          when 3
            # at line 74:53: constraint
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
    # 77:1: include : 'include' include_file ( NL )+ ;
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


        # at line 78:4: 'include' include_file ( NL )+
        string_literal7 = match( T__18, TOKENS_FOLLOWING_T__18_IN_include_80 )

        tree_for_string_literal7 = @adaptor.create_with_payload( string_literal7 )
        @adaptor.add_child( root_0, tree_for_string_literal7 )

        @state.following.push( TOKENS_FOLLOWING_include_file_IN_include_82 )
        include_file8 = include_file
        @state.following.pop
        @adaptor.add_child( root_0, include_file8.tree )
        # at file 78:27: ( NL )+
        match_count_5 = 0
        while true
          alt_5 = 2
          look_5_0 = @input.peek( 1 )

          if ( look_5_0 == NL )
            alt_5 = 1

          end
          case alt_5
          when 1
            # at line 78:27: NL
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
    # 81:1: include_file : STRING ;
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


        # at line 82:4: STRING
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
    # 86:1: header : ( class_definition | procedure );
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
        # at line 87:2: ( class_definition | procedure )
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


          # at line 87:4: class_definition
          @state.following.push( TOKENS_FOLLOWING_class_definition_IN_header_112 )
          class_definition11 = class_definition
          @state.following.pop
          @adaptor.add_child( root_0, class_definition11.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 88:4: procedure
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
    # 91:1: state_section : ID 'state' '{' ( NL )* ( attribute )* '}' ( NL )* ;
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


        # at line 92:4: ID 'state' '{' ( NL )* ( attribute )* '}' ( NL )*
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

        # at line 100:7: ( NL )*
        while true # decision 7
          alt_7 = 2
          look_7_0 = @input.peek( 1 )

          if ( look_7_0 == NL )
            alt_7 = 1

          end
          case alt_7
          when 1
            # at line 100:7: NL
            __NL16__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_section_140 )

            tree_for_NL16 = @adaptor.create_with_payload( __NL16__ )
            @adaptor.add_child( root_0, tree_for_NL16 )


          else
            break # out of loop for decision 7
          end
        end # loop for decision 7
        # at line 100:11: ( attribute )*
        while true # decision 8
          alt_8 = 2
          look_8_0 = @input.peek( 1 )

          if ( look_8_0 == ID )
            alt_8 = 1

          end
          case alt_8
          when 1
            # at line 100:11: attribute
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

        # at line 100:26: ( NL )*
        while true # decision 9
          alt_9 = 2
          look_9_0 = @input.peek( 1 )

          if ( look_9_0 == NL )
            alt_9 = 1

          end
          case alt_9
          when 1
            # at line 100:26: NL
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
    # 104:1: composite : 'composite' ID '{' ( NL )* ( attribute | constraint )* '}' ( NL )* ;
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


        # at line 105:4: 'composite' ID '{' ( NL )* ( attribute | constraint )* '}' ( NL )*
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

        # at line 113:7: ( NL )*
        while true # decision 10
          alt_10 = 2
          look_10_0 = @input.peek( 1 )

          if ( look_10_0 == NL )
            alt_10 = 1

          end
          case alt_10
          when 1
            # at line 113:7: NL
            __NL23__ = match( NL, TOKENS_FOLLOWING_NL_IN_composite_176 )

            tree_for_NL23 = @adaptor.create_with_payload( __NL23__ )
            @adaptor.add_child( root_0, tree_for_NL23 )


          else
            break # out of loop for decision 10
          end
        end # loop for decision 10
        # at line 113:11: ( attribute | constraint )*
        while true # decision 11
          alt_11 = 3
          look_11_0 = @input.peek( 1 )

          if ( look_11_0 == ID )
            look_11_2 = @input.peek( 2 )

            if ( look_11_2 == T__38 )
              alt_11 = 2
            elsif ( look_11_2 == NL || look_11_2 == T__20 || look_11_2 == T__25 || look_11_2 == T__41 || look_11_2.between?( T__50, T__51 ) )
              alt_11 = 1

            end

          end
          case alt_11
          when 1
            # at line 113:13: attribute
            @state.following.push( TOKENS_FOLLOWING_attribute_IN_composite_181 )
            attribute24 = attribute
            @state.following.pop
            @adaptor.add_child( root_0, attribute24.tree )

          when 2
            # at line 113:25: constraint
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

        # at line 113:43: ( NL )*
        while true # decision 12
          alt_12 = 2
          look_12_0 = @input.peek( 1 )

          if ( look_12_0 == NL )
            alt_12 = 1

          end
          case alt_12
          when 1
            # at line 113:43: NL
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
    # 117:1: class_definition : 'class' ID ( extends_class )? ( '{' ( NL )* ( attribute | procedure )* '}' )? ( NL )* ;
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


        # at line 118:4: 'class' ID ( extends_class )? ( '{' ( NL )* ( attribute | procedure )* '}' )? ( NL )*
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
        # at line 126:3: ( extends_class )?
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0 == T__24 )
          alt_13 = 1
        end
        case alt_13
        when 1
          # at line 126:4: extends_class
          @state.following.push( TOKENS_FOLLOWING_extends_class_IN_class_definition_219 )
          extends_class30 = extends_class
          @state.following.pop
          @adaptor.add_child( root_0, extends_class30.tree )
          # --> action

          			@now['_extends'] = ( extends_class30.nil? ? nil : extends_class30.val )
          		
          # <-- action

        end
        # at line 131:3: ( '{' ( NL )* ( attribute | procedure )* '}' )?
        alt_16 = 2
        look_16_0 = @input.peek( 1 )

        if ( look_16_0 == T__20 )
          alt_16 = 1
        end
        case alt_16
        when 1
          # at line 131:4: '{' ( NL )* ( attribute | procedure )* '}'
          char_literal31 = match( T__20, TOKENS_FOLLOWING_T__20_IN_class_definition_233 )

          tree_for_char_literal31 = @adaptor.create_with_payload( char_literal31 )
          @adaptor.add_child( root_0, tree_for_char_literal31 )

          # at line 131:8: ( NL )*
          while true # decision 14
            alt_14 = 2
            look_14_0 = @input.peek( 1 )

            if ( look_14_0 == NL )
              alt_14 = 1

            end
            case alt_14
            when 1
              # at line 131:8: NL
              __NL32__ = match( NL, TOKENS_FOLLOWING_NL_IN_class_definition_235 )

              tree_for_NL32 = @adaptor.create_with_payload( __NL32__ )
              @adaptor.add_child( root_0, tree_for_NL32 )


            else
              break # out of loop for decision 14
            end
          end # loop for decision 14
          # at line 131:12: ( attribute | procedure )*
          while true # decision 15
            alt_15 = 3
            look_15_0 = @input.peek( 1 )

            if ( look_15_0 == ID )
              alt_15 = 1
            elsif ( look_15_0 == T__33 )
              alt_15 = 2

            end
            case alt_15
            when 1
              # at line 131:14: attribute
              @state.following.push( TOKENS_FOLLOWING_attribute_IN_class_definition_240 )
              attribute33 = attribute
              @state.following.pop
              @adaptor.add_child( root_0, attribute33.tree )

            when 2
              # at line 131:26: procedure
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
        # at line 131:45: ( NL )*
        while true # decision 17
          alt_17 = 2
          look_17_0 = @input.peek( 1 )

          if ( look_17_0 == NL )
            alt_17 = 1

          end
          case alt_17
          when 1
            # at line 131:45: NL
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
    # 135:1: extends_class returns [val] : 'extends' path ;
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


        # at line 136:4: 'extends' path
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
    # 140:1: attribute : ( ID equals_op value ( NL )+ | ID reference_type ( NL )+ | object_def ( NL )+ );
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
        # at line 141:2: ( ID equals_op value ( NL )+ | ID reference_type ( NL )+ | object_def ( NL )+ )
        alt_21 = 3
        look_21_0 = @input.peek( 1 )

        if ( look_21_0 == ID )
          case look_21 = @input.peek( 2 )
          when T__41, T__51 then alt_21 = 1
          when T__50 then alt_21 = 2
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


          # at line 141:4: ID equals_op value ( NL )+
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
          # at file 141:23: ( NL )+
          match_count_18 = 0
          while true
            alt_18 = 2
            look_18_0 = @input.peek( 1 )

            if ( look_18_0 == NL )
              alt_18 = 1

            end
            case alt_18
            when 1
              # at line 141:23: NL
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


          # at line 143:4: ID reference_type ( NL )+
          __ID43__ = match( ID, TOKENS_FOLLOWING_ID_IN_attribute_307 )

          tree_for_ID43 = @adaptor.create_with_payload( __ID43__ )
          @adaptor.add_child( root_0, tree_for_ID43 )

          @state.following.push( TOKENS_FOLLOWING_reference_type_IN_attribute_309 )
          reference_type44 = reference_type
          @state.following.pop
          @adaptor.add_child( root_0, reference_type44.tree )
          # at file 143:22: ( NL )+
          match_count_19 = 0
          while true
            alt_19 = 2
            look_19_0 = @input.peek( 1 )

            if ( look_19_0 == NL )
              alt_19 = 1

            end
            case alt_19
            when 1
              # at line 143:22: NL
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


          # at line 145:4: object_def ( NL )+
          @state.following.push( TOKENS_FOLLOWING_object_def_IN_attribute_321 )
          object_def46 = object_def
          @state.following.pop
          @adaptor.add_child( root_0, object_def46.tree )
          # at file 145:15: ( NL )+
          match_count_20 = 0
          while true
            alt_20 = 2
            look_20_0 = @input.peek( 1 )

            if ( look_20_0 == NL )
              alt_20 = 1

            end
            case alt_20
            when 1
              # at line 145:15: NL
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
    # 148:1: object_def : ID ( 'isa' path )? ( object_body )? ;
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


        # at line 149:4: ID ( 'isa' path )? ( object_body )?
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
        # at line 158:3: ( 'isa' path )?
        alt_22 = 2
        look_22_0 = @input.peek( 1 )

        if ( look_22_0 == T__25 )
          alt_22 = 1
        end
        case alt_22
        when 1
          # at line 158:4: 'isa' path
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
        # at line 163:3: ( object_body )?
        alt_23 = 2
        look_23_0 = @input.peek( 1 )

        if ( look_23_0 == T__20 )
          alt_23 = 1
        end
        case alt_23
        when 1
          # at line 163:3: object_body
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
    # 167:1: object_body : '{' ( NL )* ( object_attribute | state_dependency | operator )* '}' ;
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


        # at line 168:4: '{' ( NL )* ( object_attribute | state_dependency | operator )* '}'
        char_literal52 = match( T__20, TOKENS_FOLLOWING_T__20_IN_object_body_375 )

        tree_for_char_literal52 = @adaptor.create_with_payload( char_literal52 )
        @adaptor.add_child( root_0, tree_for_char_literal52 )

        # at line 168:8: ( NL )*
        while true # decision 24
          alt_24 = 2
          look_24_0 = @input.peek( 1 )

          if ( look_24_0 == NL )
            alt_24 = 1

          end
          case alt_24
          when 1
            # at line 168:8: NL
            __NL53__ = match( NL, TOKENS_FOLLOWING_NL_IN_object_body_377 )

            tree_for_NL53 = @adaptor.create_with_payload( __NL53__ )
            @adaptor.add_child( root_0, tree_for_NL53 )


          else
            break # out of loop for decision 24
          end
        end # loop for decision 24
        # at line 168:12: ( object_attribute | state_dependency | operator )*
        while true # decision 25
          alt_25 = 4
          case look_25 = @input.peek( 1 )
          when ID then alt_25 = 1
          when T__26 then alt_25 = 2
          when T__29 then alt_25 = 3
          end
          case alt_25
          when 1
            # at line 168:14: object_attribute
            @state.following.push( TOKENS_FOLLOWING_object_attribute_IN_object_body_382 )
            object_attribute54 = object_attribute
            @state.following.pop
            @adaptor.add_child( root_0, object_attribute54.tree )

          when 2
            # at line 168:33: state_dependency
            @state.following.push( TOKENS_FOLLOWING_state_dependency_IN_object_body_386 )
            state_dependency55 = state_dependency
            @state.following.pop
            @adaptor.add_child( root_0, state_dependency55.tree )

          when 3
            # at line 168:52: operator
            @state.following.push( TOKENS_FOLLOWING_operator_IN_object_body_390 )
            operator56 = operator
            @state.following.pop
            @adaptor.add_child( root_0, operator56.tree )

          else
            break # out of loop for decision 25
          end
        end # loop for decision 25
        char_literal57 = match( T__21, TOKENS_FOLLOWING_T__21_IN_object_body_395 )

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
    # 171:1: object_attribute : ( attribute | ID equals_op NULL ( NL )+ );
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
        # at line 172:2: ( attribute | ID equals_op NULL ( NL )+ )
        alt_27 = 2
        look_27_0 = @input.peek( 1 )

        if ( look_27_0 == ID )
          look_27_1 = @input.peek( 2 )

          if ( look_27_1 == T__41 || look_27_1 == T__51 )
            look_27_2 = @input.peek( 3 )

            if ( look_27_2.between?( STRING, ID ) || look_27_2.between?( NUMBER, MULTILINE_STRING ) || look_27_2 == T__34 )
              alt_27 = 1
            elsif ( look_27_2 == NULL )
              alt_27 = 2
            else
              raise NoViableAlternative( "", 27, 2 )
            end
          elsif ( look_27_1 == NL || look_27_1 == T__20 || look_27_1 == T__25 || look_27_1 == T__50 )
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


          # at line 172:4: attribute
          @state.following.push( TOKENS_FOLLOWING_attribute_IN_object_attribute_406 )
          attribute58 = attribute
          @state.following.pop
          @adaptor.add_child( root_0, attribute58.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 173:4: ID equals_op NULL ( NL )+
          __ID59__ = match( ID, TOKENS_FOLLOWING_ID_IN_object_attribute_411 )

          tree_for_ID59 = @adaptor.create_with_payload( __ID59__ )
          @adaptor.add_child( root_0, tree_for_ID59 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_object_attribute_413 )
          equals_op60 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op60.tree )
          __NULL61__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_object_attribute_415 )

          tree_for_NULL61 = @adaptor.create_with_payload( __NULL61__ )
          @adaptor.add_child( root_0, tree_for_NULL61 )

          # at file 173:22: ( NL )+
          match_count_26 = 0
          while true
            alt_26 = 2
            look_26_0 = @input.peek( 1 )

            if ( look_26_0 == NL )
              alt_26 = 1

            end
            case alt_26
            when 1
              # at line 173:22: NL
              __NL62__ = match( NL, TOKENS_FOLLOWING_NL_IN_object_attribute_417 )

              tree_for_NL62 = @adaptor.create_with_payload( __NL62__ )
              @adaptor.add_child( root_0, tree_for_NL62 )


            else
              match_count_26 > 0 and break
              eee = EarlyExit(26)


              raise eee
            end
            match_count_26 += 1
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
    # 177:1: state_dependency : 'if' dep_effect ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )* ( NL )+ ;
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


        # at line 178:4: 'if' dep_effect ( NL )* 'then' ( NL )* '{' ( NL )* constraint_body '}' ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )* ( NL )+
        string_literal63 = match( T__26, TOKENS_FOLLOWING_T__26_IN_state_dependency_433 )

        tree_for_string_literal63 = @adaptor.create_with_payload( string_literal63 )
        @adaptor.add_child( root_0, tree_for_string_literal63 )

        @state.following.push( TOKENS_FOLLOWING_dep_effect_IN_state_dependency_437 )
        dep_effect64 = dep_effect
        @state.following.pop
        @adaptor.add_child( root_0, dep_effect64.tree )
        # at line 179:14: ( NL )*
        while true # decision 28
          alt_28 = 2
          look_28_0 = @input.peek( 1 )

          if ( look_28_0 == NL )
            alt_28 = 1

          end
          case alt_28
          when 1
            # at line 179:14: NL
            __NL65__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_439 )

            tree_for_NL65 = @adaptor.create_with_payload( __NL65__ )
            @adaptor.add_child( root_0, tree_for_NL65 )


          else
            break # out of loop for decision 28
          end
        end # loop for decision 28
        string_literal66 = match( T__27, TOKENS_FOLLOWING_T__27_IN_state_dependency_442 )

        tree_for_string_literal66 = @adaptor.create_with_payload( string_literal66 )
        @adaptor.add_child( root_0, tree_for_string_literal66 )

        # at line 179:25: ( NL )*
        while true # decision 29
          alt_29 = 2
          look_29_0 = @input.peek( 1 )

          if ( look_29_0 == NL )
            alt_29 = 1

          end
          case alt_29
          when 1
            # at line 179:25: NL
            __NL67__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_444 )

            tree_for_NL67 = @adaptor.create_with_payload( __NL67__ )
            @adaptor.add_child( root_0, tree_for_NL67 )


          else
            break # out of loop for decision 29
          end
        end # loop for decision 29
        char_literal68 = match( T__20, TOKENS_FOLLOWING_T__20_IN_state_dependency_447 )

        tree_for_char_literal68 = @adaptor.create_with_payload( char_literal68 )
        @adaptor.add_child( root_0, tree_for_char_literal68 )

        # at line 180:3: ( NL )*
        while true # decision 30
          alt_30 = 2
          look_30_0 = @input.peek( 1 )

          if ( look_30_0 == NL )
            alt_30 = 1

          end
          case alt_30
          when 1
            # at line 180:3: NL
            __NL69__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_451 )

            tree_for_NL69 = @adaptor.create_with_payload( __NL69__ )
            @adaptor.add_child( root_0, tree_for_NL69 )


          else
            break # out of loop for decision 30
          end
        end # loop for decision 30
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_state_dependency_454 )
        constraint_body70 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body70.tree )
        char_literal71 = match( T__21, TOKENS_FOLLOWING_T__21_IN_state_dependency_459 )

        tree_for_char_literal71 = @adaptor.create_with_payload( char_literal71 )
        @adaptor.add_child( root_0, tree_for_char_literal71 )

        # at line 182:3: ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )*
        while true # decision 34
          alt_34 = 2
          alt_34 = @dfa34.predict( @input )
          case alt_34
          when 1
            # at line 182:5: ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}'
            # at line 182:5: ( NL )*
            while true # decision 31
              alt_31 = 2
              look_31_0 = @input.peek( 1 )

              if ( look_31_0 == NL )
                alt_31 = 1

              end
              case alt_31
              when 1
                # at line 182:5: NL
                __NL72__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_465 )

                tree_for_NL72 = @adaptor.create_with_payload( __NL72__ )
                @adaptor.add_child( root_0, tree_for_NL72 )


              else
                break # out of loop for decision 31
              end
            end # loop for decision 31
            string_literal73 = match( T__28, TOKENS_FOLLOWING_T__28_IN_state_dependency_468 )

            tree_for_string_literal73 = @adaptor.create_with_payload( string_literal73 )
            @adaptor.add_child( root_0, tree_for_string_literal73 )

            # at line 182:14: ( NL )*
            while true # decision 32
              alt_32 = 2
              look_32_0 = @input.peek( 1 )

              if ( look_32_0 == NL )
                alt_32 = 1

              end
              case alt_32
              when 1
                # at line 182:14: NL
                __NL74__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_470 )

                tree_for_NL74 = @adaptor.create_with_payload( __NL74__ )
                @adaptor.add_child( root_0, tree_for_NL74 )


              else
                break # out of loop for decision 32
              end
            end # loop for decision 32
            char_literal75 = match( T__20, TOKENS_FOLLOWING_T__20_IN_state_dependency_473 )

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
                __NL76__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_477 )

                tree_for_NL76 = @adaptor.create_with_payload( __NL76__ )
                @adaptor.add_child( root_0, tree_for_NL76 )


              else
                break # out of loop for decision 33
              end
            end # loop for decision 33
            @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_state_dependency_480 )
            constraint_body77 = constraint_body
            @state.following.pop
            @adaptor.add_child( root_0, constraint_body77.tree )
            char_literal78 = match( T__21, TOKENS_FOLLOWING_T__21_IN_state_dependency_484 )

            tree_for_char_literal78 = @adaptor.create_with_payload( char_literal78 )
            @adaptor.add_child( root_0, tree_for_char_literal78 )


          else
            break # out of loop for decision 34
          end
        end # loop for decision 34
        # at file 185:3: ( NL )+
        match_count_35 = 0
        while true
          alt_35 = 2
          look_35_0 = @input.peek( 1 )

          if ( look_35_0 == NL )
            alt_35 = 1

          end
          case alt_35
          when 1
            # at line 185:3: NL
            __NL79__ = match( NL, TOKENS_FOLLOWING_NL_IN_state_dependency_490 )

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
    # 188:1: dep_effect : reference equals_op ( value | NULL ) ;
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


        # at line 189:4: reference equals_op ( value | NULL )
        @state.following.push( TOKENS_FOLLOWING_reference_IN_dep_effect_502 )
        reference80 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference80.tree )
        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_dep_effect_504 )
        equals_op81 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op81.tree )
        # at line 190:3: ( value | NULL )
        alt_36 = 2
        look_36_0 = @input.peek( 1 )

        if ( look_36_0.between?( STRING, ID ) || look_36_0.between?( NUMBER, MULTILINE_STRING ) || look_36_0 == T__34 )
          alt_36 = 1
        elsif ( look_36_0 == NULL )
          alt_36 = 2
        else
          raise NoViableAlternative( "", 36, 0 )
        end
        case alt_36
        when 1
          # at line 190:5: value
          @state.following.push( TOKENS_FOLLOWING_value_IN_dep_effect_511 )
          value82 = value
          @state.following.pop
          @adaptor.add_child( root_0, value82.tree )

        when 2
          # at line 191:5: NULL
          __NULL83__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_dep_effect_517 )

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
    # 195:1: operator : 'operator' ID '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( op_conditions )? op_effects '}' ( NL )+ ;
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
      char_literal94 = nil
      __NL95__ = nil
      equals_op89 = nil
      op_conditions92 = nil
      op_effects93 = nil

      tree_for_string_literal84 = nil
      tree_for_ID85 = nil
      tree_for_char_literal86 = nil
      tree_for_NL87 = nil
      tree_for_string_literal88 = nil
      tree_for_NUMBER90 = nil
      tree_for_NL91 = nil
      tree_for_char_literal94 = nil
      tree_for_NL95 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 196:4: 'operator' ID '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( op_conditions )? op_effects '}' ( NL )+
        string_literal84 = match( T__29, TOKENS_FOLLOWING_T__29_IN_operator_533 )

        tree_for_string_literal84 = @adaptor.create_with_payload( string_literal84 )
        @adaptor.add_child( root_0, tree_for_string_literal84 )

        __ID85__ = match( ID, TOKENS_FOLLOWING_ID_IN_operator_535 )

        tree_for_ID85 = @adaptor.create_with_payload( __ID85__ )
        @adaptor.add_child( root_0, tree_for_ID85 )

        char_literal86 = match( T__20, TOKENS_FOLLOWING_T__20_IN_operator_537 )

        tree_for_char_literal86 = @adaptor.create_with_payload( char_literal86 )
        @adaptor.add_child( root_0, tree_for_char_literal86 )

        # at line 196:22: ( NL )*
        while true # decision 37
          alt_37 = 2
          look_37_0 = @input.peek( 1 )

          if ( look_37_0 == NL )
            alt_37 = 1

          end
          case alt_37
          when 1
            # at line 196:22: NL
            __NL87__ = match( NL, TOKENS_FOLLOWING_NL_IN_operator_539 )

            tree_for_NL87 = @adaptor.create_with_payload( __NL87__ )
            @adaptor.add_child( root_0, tree_for_NL87 )


          else
            break # out of loop for decision 37
          end
        end # loop for decision 37
        # --> action

        			@now[__ID85__.text] = { '_self' => __ID85__.text,
        				'_context' => 'operator',
        				'_parent' => @now,
        				'_conditions' => { '_context' => 'constraint' },
        				'_effects' => { '_context' => 'mutation' }
        			}
        			@now = @now[__ID85__.text]
        		
        # <-- action
        # at line 206:3: ( 'cost' equals_op NUMBER ( NL )+ )?
        alt_39 = 2
        look_39_0 = @input.peek( 1 )

        if ( look_39_0 == T__30 )
          alt_39 = 1
        end
        case alt_39
        when 1
          # at line 206:5: 'cost' equals_op NUMBER ( NL )+
          string_literal88 = match( T__30, TOKENS_FOLLOWING_T__30_IN_operator_550 )

          tree_for_string_literal88 = @adaptor.create_with_payload( string_literal88 )
          @adaptor.add_child( root_0, tree_for_string_literal88 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_operator_552 )
          equals_op89 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op89.tree )
          __NUMBER90__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_operator_554 )

          tree_for_NUMBER90 = @adaptor.create_with_payload( __NUMBER90__ )
          @adaptor.add_child( root_0, tree_for_NUMBER90 )

          # at file 206:29: ( NL )+
          match_count_38 = 0
          while true
            alt_38 = 2
            look_38_0 = @input.peek( 1 )

            if ( look_38_0 == NL )
              alt_38 = 1

            end
            case alt_38
            when 1
              # at line 206:29: NL
              __NL91__ = match( NL, TOKENS_FOLLOWING_NL_IN_operator_556 )

              tree_for_NL91 = @adaptor.create_with_payload( __NL91__ )
              @adaptor.add_child( root_0, tree_for_NL91 )


            else
              match_count_38 > 0 and break
              eee = EarlyExit(38)


              raise eee
            end
            match_count_38 += 1
          end

          # --> action
          	@now['_cost'] = __NUMBER90__.text.to_i	
          # <-- action

        end
        # at line 209:3: ( op_conditions )?
        alt_40 = 2
        look_40_0 = @input.peek( 1 )

        if ( look_40_0 == T__31 )
          alt_40 = 1
        end
        case alt_40
        when 1
          # at line 209:3: op_conditions
          @state.following.push( TOKENS_FOLLOWING_op_conditions_IN_operator_571 )
          op_conditions92 = op_conditions
          @state.following.pop
          @adaptor.add_child( root_0, op_conditions92.tree )

        end
        @state.following.push( TOKENS_FOLLOWING_op_effects_IN_operator_574 )
        op_effects93 = op_effects
        @state.following.pop
        @adaptor.add_child( root_0, op_effects93.tree )
        char_literal94 = match( T__21, TOKENS_FOLLOWING_T__21_IN_operator_578 )

        tree_for_char_literal94 = @adaptor.create_with_payload( char_literal94 )
        @adaptor.add_child( root_0, tree_for_char_literal94 )

        # at file 210:7: ( NL )+
        match_count_41 = 0
        while true
          alt_41 = 2
          look_41_0 = @input.peek( 1 )

          if ( look_41_0 == NL )
            alt_41 = 1

          end
          case alt_41
          when 1
            # at line 210:7: NL
            __NL95__ = match( NL, TOKENS_FOLLOWING_NL_IN_operator_580 )

            tree_for_NL95 = @adaptor.create_with_payload( __NL95__ )
            @adaptor.add_child( root_0, tree_for_NL95 )


          else
            match_count_41 > 0 and break
            eee = EarlyExit(41)


            raise eee
          end
          match_count_41 += 1
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

    OpConditionsReturnValue = define_return_scope 

    # 
    # parser rule op_conditions
    # 
    # (in SFP.g)
    # 214:1: op_conditions : 'conditions' '{' ( NL )* ( op_statement )* '}' ( NL )+ ;
    # 
    def op_conditions
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )
      return_value = OpConditionsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal96 = nil
      char_literal97 = nil
      __NL98__ = nil
      char_literal100 = nil
      __NL101__ = nil
      op_statement99 = nil

      tree_for_string_literal96 = nil
      tree_for_char_literal97 = nil
      tree_for_NL98 = nil
      tree_for_char_literal100 = nil
      tree_for_NL101 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 215:4: 'conditions' '{' ( NL )* ( op_statement )* '}' ( NL )+
        string_literal96 = match( T__31, TOKENS_FOLLOWING_T__31_IN_op_conditions_596 )

        tree_for_string_literal96 = @adaptor.create_with_payload( string_literal96 )
        @adaptor.add_child( root_0, tree_for_string_literal96 )

        char_literal97 = match( T__20, TOKENS_FOLLOWING_T__20_IN_op_conditions_598 )

        tree_for_char_literal97 = @adaptor.create_with_payload( char_literal97 )
        @adaptor.add_child( root_0, tree_for_char_literal97 )

        # at line 215:21: ( NL )*
        while true # decision 42
          alt_42 = 2
          look_42_0 = @input.peek( 1 )

          if ( look_42_0 == NL )
            alt_42 = 1

          end
          case alt_42
          when 1
            # at line 215:21: NL
            __NL98__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_conditions_600 )

            tree_for_NL98 = @adaptor.create_with_payload( __NL98__ )
            @adaptor.add_child( root_0, tree_for_NL98 )


          else
            break # out of loop for decision 42
          end
        end # loop for decision 42
        # --> action

        			@now['_conditions']['_parent'] = @now
        			@now = @now['_conditions']
        		
        # <-- action
        # at line 220:3: ( op_statement )*
        while true # decision 43
          alt_43 = 2
          look_43_0 = @input.peek( 1 )

          if ( look_43_0 == ID )
            alt_43 = 1

          end
          case alt_43
          when 1
            # at line 220:3: op_statement
            @state.following.push( TOKENS_FOLLOWING_op_statement_IN_op_conditions_609 )
            op_statement99 = op_statement
            @state.following.pop
            @adaptor.add_child( root_0, op_statement99.tree )

          else
            break # out of loop for decision 43
          end
        end # loop for decision 43
        char_literal100 = match( T__21, TOKENS_FOLLOWING_T__21_IN_op_conditions_614 )

        tree_for_char_literal100 = @adaptor.create_with_payload( char_literal100 )
        @adaptor.add_child( root_0, tree_for_char_literal100 )

        # at file 221:7: ( NL )+
        match_count_44 = 0
        while true
          alt_44 = 2
          look_44_0 = @input.peek( 1 )

          if ( look_44_0 == NL )
            alt_44 = 1

          end
          case alt_44
          when 1
            # at line 221:7: NL
            __NL101__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_conditions_616 )

            tree_for_NL101 = @adaptor.create_with_payload( __NL101__ )
            @adaptor.add_child( root_0, tree_for_NL101 )


          else
            match_count_44 > 0 and break
            eee = EarlyExit(44)


            raise eee
          end
          match_count_44 += 1
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
        # trace_out( __method__, 16 )

      end
      
      return return_value
    end

    OpEffectsReturnValue = define_return_scope 

    # 
    # parser rule op_effects
    # 
    # (in SFP.g)
    # 225:1: op_effects : 'effects' '{' ( NL )* ( op_statement )* '}' ( NL )+ ;
    # 
    def op_effects
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      return_value = OpEffectsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal102 = nil
      char_literal103 = nil
      __NL104__ = nil
      char_literal106 = nil
      __NL107__ = nil
      op_statement105 = nil

      tree_for_string_literal102 = nil
      tree_for_char_literal103 = nil
      tree_for_NL104 = nil
      tree_for_char_literal106 = nil
      tree_for_NL107 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 226:4: 'effects' '{' ( NL )* ( op_statement )* '}' ( NL )+
        string_literal102 = match( T__32, TOKENS_FOLLOWING_T__32_IN_op_effects_632 )

        tree_for_string_literal102 = @adaptor.create_with_payload( string_literal102 )
        @adaptor.add_child( root_0, tree_for_string_literal102 )

        char_literal103 = match( T__20, TOKENS_FOLLOWING_T__20_IN_op_effects_634 )

        tree_for_char_literal103 = @adaptor.create_with_payload( char_literal103 )
        @adaptor.add_child( root_0, tree_for_char_literal103 )

        # at line 226:18: ( NL )*
        while true # decision 45
          alt_45 = 2
          look_45_0 = @input.peek( 1 )

          if ( look_45_0 == NL )
            alt_45 = 1

          end
          case alt_45
          when 1
            # at line 226:18: NL
            __NL104__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_effects_636 )

            tree_for_NL104 = @adaptor.create_with_payload( __NL104__ )
            @adaptor.add_child( root_0, tree_for_NL104 )


          else
            break # out of loop for decision 45
          end
        end # loop for decision 45
        # --> action

        			@now['_effects']['_parent'] = @now
        			@now = @now['_effects']
        		
        # <-- action
        # at line 231:3: ( op_statement )*
        while true # decision 46
          alt_46 = 2
          look_46_0 = @input.peek( 1 )

          if ( look_46_0 == ID )
            alt_46 = 1

          end
          case alt_46
          when 1
            # at line 231:3: op_statement
            @state.following.push( TOKENS_FOLLOWING_op_statement_IN_op_effects_645 )
            op_statement105 = op_statement
            @state.following.pop
            @adaptor.add_child( root_0, op_statement105.tree )

          else
            break # out of loop for decision 46
          end
        end # loop for decision 46
        char_literal106 = match( T__21, TOKENS_FOLLOWING_T__21_IN_op_effects_650 )

        tree_for_char_literal106 = @adaptor.create_with_payload( char_literal106 )
        @adaptor.add_child( root_0, tree_for_char_literal106 )

        # at file 232:7: ( NL )+
        match_count_47 = 0
        while true
          alt_47 = 2
          look_47_0 = @input.peek( 1 )

          if ( look_47_0 == NL )
            alt_47 = 1

          end
          case alt_47
          when 1
            # at line 232:7: NL
            __NL107__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_effects_652 )

            tree_for_NL107 = @adaptor.create_with_payload( __NL107__ )
            @adaptor.add_child( root_0, tree_for_NL107 )


          else
            match_count_47 > 0 and break
            eee = EarlyExit(47)


            raise eee
          end
          match_count_47 += 1
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
        # trace_out( __method__, 17 )

      end
      
      return return_value
    end

    OpStatementReturnValue = define_return_scope 

    # 
    # parser rule op_statement
    # 
    # (in SFP.g)
    # 236:1: op_statement : reference equals_op value ( NL )+ ;
    # 
    def op_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      return_value = OpStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL111__ = nil
      reference108 = nil
      equals_op109 = nil
      value110 = nil

      tree_for_NL111 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 237:4: reference equals_op value ( NL )+
        @state.following.push( TOKENS_FOLLOWING_reference_IN_op_statement_668 )
        reference108 = reference
        @state.following.pop
        @adaptor.add_child( root_0, reference108.tree )
        @state.following.push( TOKENS_FOLLOWING_equals_op_IN_op_statement_670 )
        equals_op109 = equals_op
        @state.following.pop
        @adaptor.add_child( root_0, equals_op109.tree )
        @state.following.push( TOKENS_FOLLOWING_value_IN_op_statement_672 )
        value110 = value
        @state.following.pop
        @adaptor.add_child( root_0, value110.tree )
        # at file 237:30: ( NL )+
        match_count_48 = 0
        while true
          alt_48 = 2
          look_48_0 = @input.peek( 1 )

          if ( look_48_0 == NL )
            alt_48 = 1

          end
          case alt_48
          when 1
            # at line 237:30: NL
            __NL111__ = match( NL, TOKENS_FOLLOWING_NL_IN_op_statement_674 )

            tree_for_NL111 = @adaptor.create_with_payload( __NL111__ )
            @adaptor.add_child( root_0, tree_for_NL111 )


          else
            match_count_48 > 0 and break
            eee = EarlyExit(48)


            raise eee
          end
          match_count_48 += 1
        end

        # --> action
        	@now[( reference108.nil? ? nil : reference108.val )] = ( value110.nil? ? nil : value110.val )	
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

    ProcedureReturnValue = define_return_scope 

    # 
    # parser rule procedure
    # 
    # (in SFP.g)
    # 241:1: procedure : 'procedure' ID ( parameters )? '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( conditions )? effects '}' ( NL )+ ;
    # 
    def procedure
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      return_value = ProcedureReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal112 = nil
      __ID113__ = nil
      char_literal115 = nil
      __NL116__ = nil
      string_literal117 = nil
      __NUMBER119__ = nil
      __NL120__ = nil
      char_literal123 = nil
      __NL124__ = nil
      parameters114 = nil
      equals_op118 = nil
      conditions121 = nil
      effects122 = nil

      tree_for_string_literal112 = nil
      tree_for_ID113 = nil
      tree_for_char_literal115 = nil
      tree_for_NL116 = nil
      tree_for_string_literal117 = nil
      tree_for_NUMBER119 = nil
      tree_for_NL120 = nil
      tree_for_char_literal123 = nil
      tree_for_NL124 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 242:4: 'procedure' ID ( parameters )? '{' ( NL )* ( 'cost' equals_op NUMBER ( NL )+ )? ( conditions )? effects '}' ( NL )+
        string_literal112 = match( T__33, TOKENS_FOLLOWING_T__33_IN_procedure_690 )

        tree_for_string_literal112 = @adaptor.create_with_payload( string_literal112 )
        @adaptor.add_child( root_0, tree_for_string_literal112 )

        __ID113__ = match( ID, TOKENS_FOLLOWING_ID_IN_procedure_692 )

        tree_for_ID113 = @adaptor.create_with_payload( __ID113__ )
        @adaptor.add_child( root_0, tree_for_ID113 )

        # --> action

        			@now[__ID113__.text] = { '_self' => __ID113__.text,
        				'_context' => 'procedure',
        				'_parent' => @now,
        				'_conditions' => { '_context' => 'constraint', '_type' => 'and' },
        				'_effects' => { '_context' => 'mutation', '_type' => 'and' }
        			}
        			@now = @now[__ID113__.text]
        		
        # <-- action
        # at line 252:3: ( parameters )?
        alt_49 = 2
        look_49_0 = @input.peek( 1 )

        if ( look_49_0 == T__34 )
          alt_49 = 1
        end
        case alt_49
        when 1
          # at line 252:3: parameters
          @state.following.push( TOKENS_FOLLOWING_parameters_IN_procedure_700 )
          parameters114 = parameters
          @state.following.pop
          @adaptor.add_child( root_0, parameters114.tree )

        end
        char_literal115 = match( T__20, TOKENS_FOLLOWING_T__20_IN_procedure_703 )

        tree_for_char_literal115 = @adaptor.create_with_payload( char_literal115 )
        @adaptor.add_child( root_0, tree_for_char_literal115 )

        # at line 252:19: ( NL )*
        while true # decision 50
          alt_50 = 2
          look_50_0 = @input.peek( 1 )

          if ( look_50_0 == NL )
            alt_50 = 1

          end
          case alt_50
          when 1
            # at line 252:19: NL
            __NL116__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_705 )

            tree_for_NL116 = @adaptor.create_with_payload( __NL116__ )
            @adaptor.add_child( root_0, tree_for_NL116 )


          else
            break # out of loop for decision 50
          end
        end # loop for decision 50
        # at line 253:3: ( 'cost' equals_op NUMBER ( NL )+ )?
        alt_52 = 2
        look_52_0 = @input.peek( 1 )

        if ( look_52_0 == T__30 )
          alt_52 = 1
        end
        case alt_52
        when 1
          # at line 253:5: 'cost' equals_op NUMBER ( NL )+
          string_literal117 = match( T__30, TOKENS_FOLLOWING_T__30_IN_procedure_713 )

          tree_for_string_literal117 = @adaptor.create_with_payload( string_literal117 )
          @adaptor.add_child( root_0, tree_for_string_literal117 )

          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_procedure_715 )
          equals_op118 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op118.tree )
          __NUMBER119__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_procedure_717 )

          tree_for_NUMBER119 = @adaptor.create_with_payload( __NUMBER119__ )
          @adaptor.add_child( root_0, tree_for_NUMBER119 )

          # --> action
          	@now['_cost'] = __NUMBER119__.text.to_i	
          # <-- action
          # at file 255:4: ( NL )+
          match_count_51 = 0
          while true
            alt_51 = 2
            look_51_0 = @input.peek( 1 )

            if ( look_51_0 == NL )
              alt_51 = 1

            end
            case alt_51
            when 1
              # at line 255:4: NL
              __NL120__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_727 )

              tree_for_NL120 = @adaptor.create_with_payload( __NL120__ )
              @adaptor.add_child( root_0, tree_for_NL120 )


            else
              match_count_51 > 0 and break
              eee = EarlyExit(51)


              raise eee
            end
            match_count_51 += 1
          end


        end
        # at line 257:3: ( conditions )?
        alt_53 = 2
        look_53_0 = @input.peek( 1 )

        if ( look_53_0 == T__31 )
          alt_53 = 1
        end
        case alt_53
        when 1
          # at line 257:3: conditions
          @state.following.push( TOKENS_FOLLOWING_conditions_IN_procedure_737 )
          conditions121 = conditions
          @state.following.pop
          @adaptor.add_child( root_0, conditions121.tree )

        end
        @state.following.push( TOKENS_FOLLOWING_effects_IN_procedure_740 )
        effects122 = effects
        @state.following.pop
        @adaptor.add_child( root_0, effects122.tree )
        char_literal123 = match( T__21, TOKENS_FOLLOWING_T__21_IN_procedure_742 )

        tree_for_char_literal123 = @adaptor.create_with_payload( char_literal123 )
        @adaptor.add_child( root_0, tree_for_char_literal123 )

        # at file 257:27: ( NL )+
        match_count_54 = 0
        while true
          alt_54 = 2
          look_54_0 = @input.peek( 1 )

          if ( look_54_0 == NL )
            alt_54 = 1

          end
          case alt_54
          when 1
            # at line 257:27: NL
            __NL124__ = match( NL, TOKENS_FOLLOWING_NL_IN_procedure_744 )

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

    ParametersReturnValue = define_return_scope 

    # 
    # parser rule parameters
    # 
    # (in SFP.g)
    # 261:1: parameters : '(' parameter ( ',' parameter )* ')' ;
    # 
    def parameters
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = ParametersReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal125 = nil
      char_literal127 = nil
      char_literal129 = nil
      parameter126 = nil
      parameter128 = nil

      tree_for_char_literal125 = nil
      tree_for_char_literal127 = nil
      tree_for_char_literal129 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 262:4: '(' parameter ( ',' parameter )* ')'
        char_literal125 = match( T__34, TOKENS_FOLLOWING_T__34_IN_parameters_760 )

        tree_for_char_literal125 = @adaptor.create_with_payload( char_literal125 )
        @adaptor.add_child( root_0, tree_for_char_literal125 )

        @state.following.push( TOKENS_FOLLOWING_parameter_IN_parameters_762 )
        parameter126 = parameter
        @state.following.pop
        @adaptor.add_child( root_0, parameter126.tree )
        # at line 262:18: ( ',' parameter )*
        while true # decision 55
          alt_55 = 2
          look_55_0 = @input.peek( 1 )

          if ( look_55_0 == T__35 )
            alt_55 = 1

          end
          case alt_55
          when 1
            # at line 262:19: ',' parameter
            char_literal127 = match( T__35, TOKENS_FOLLOWING_T__35_IN_parameters_765 )

            tree_for_char_literal127 = @adaptor.create_with_payload( char_literal127 )
            @adaptor.add_child( root_0, tree_for_char_literal127 )

            @state.following.push( TOKENS_FOLLOWING_parameter_IN_parameters_767 )
            parameter128 = parameter
            @state.following.pop
            @adaptor.add_child( root_0, parameter128.tree )

          else
            break # out of loop for decision 55
          end
        end # loop for decision 55
        char_literal129 = match( T__36, TOKENS_FOLLOWING_T__36_IN_parameters_771 )

        tree_for_char_literal129 = @adaptor.create_with_payload( char_literal129 )
        @adaptor.add_child( root_0, tree_for_char_literal129 )

        # - - - - - - - rule clean up - - - - - - - -
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

    ParameterReturnValue = define_return_scope 

    # 
    # parser rule parameter
    # 
    # (in SFP.g)
    # 265:1: parameter : ( ID reference_type | ID 'areall' path );
    # 
    def parameter
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = ParameterReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID130__ = nil
      __ID132__ = nil
      string_literal133 = nil
      reference_type131 = nil
      path134 = nil

      tree_for_ID130 = nil
      tree_for_ID132 = nil
      tree_for_string_literal133 = nil

      begin
        # at line 266:2: ( ID reference_type | ID 'areall' path )
        alt_56 = 2
        look_56_0 = @input.peek( 1 )

        if ( look_56_0 == ID )
          look_56_1 = @input.peek( 2 )

          if ( look_56_1 == T__37 )
            alt_56 = 2
          elsif ( look_56_1 == T__50 )
            alt_56 = 1
          else
            raise NoViableAlternative( "", 56, 1 )
          end
        else
          raise NoViableAlternative( "", 56, 0 )
        end
        case alt_56
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 266:4: ID reference_type
          __ID130__ = match( ID, TOKENS_FOLLOWING_ID_IN_parameter_783 )

          tree_for_ID130 = @adaptor.create_with_payload( __ID130__ )
          @adaptor.add_child( root_0, tree_for_ID130 )

          @state.following.push( TOKENS_FOLLOWING_reference_type_IN_parameter_785 )
          reference_type131 = reference_type
          @state.following.pop
          @adaptor.add_child( root_0, reference_type131.tree )
          # --> action
          	@now[__ID130__.text] = ( reference_type131.nil? ? nil : reference_type131.val )	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 268:4: ID 'areall' path
          __ID132__ = match( ID, TOKENS_FOLLOWING_ID_IN_parameter_794 )

          tree_for_ID132 = @adaptor.create_with_payload( __ID132__ )
          @adaptor.add_child( root_0, tree_for_ID132 )

          string_literal133 = match( T__37, TOKENS_FOLLOWING_T__37_IN_parameter_796 )

          tree_for_string_literal133 = @adaptor.create_with_payload( string_literal133 )
          @adaptor.add_child( root_0, tree_for_string_literal133 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_parameter_798 )
          path134 = path
          @state.following.pop
          @adaptor.add_child( root_0, path134.tree )
          # --> action

          			@now[__ID132__.text] = { '_context' => 'all',
          				'_isa' => self.toRef(( path134 && @input.to_s( path134.start, path134.stop ) )),
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
        # trace_out( __method__, 21 )

      end
      
      return return_value
    end

    ConditionsReturnValue = define_return_scope 

    # 
    # parser rule conditions
    # 
    # (in SFP.g)
    # 277:1: conditions : 'conditions' '{' ( NL )* constraint_body '}' ( NL )+ ;
    # 
    def conditions
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = ConditionsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal135 = nil
      char_literal136 = nil
      __NL137__ = nil
      char_literal139 = nil
      __NL140__ = nil
      constraint_body138 = nil

      tree_for_string_literal135 = nil
      tree_for_char_literal136 = nil
      tree_for_NL137 = nil
      tree_for_char_literal139 = nil
      tree_for_NL140 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 278:4: 'conditions' '{' ( NL )* constraint_body '}' ( NL )+
        string_literal135 = match( T__31, TOKENS_FOLLOWING_T__31_IN_conditions_813 )

        tree_for_string_literal135 = @adaptor.create_with_payload( string_literal135 )
        @adaptor.add_child( root_0, tree_for_string_literal135 )

        # --> action

        			@now['_conditions']['_parent'] = @now
        			@now = @now['_conditions']
        		
        # <-- action
        char_literal136 = match( T__20, TOKENS_FOLLOWING_T__20_IN_conditions_821 )

        tree_for_char_literal136 = @adaptor.create_with_payload( char_literal136 )
        @adaptor.add_child( root_0, tree_for_char_literal136 )

        # at line 283:7: ( NL )*
        while true # decision 57
          alt_57 = 2
          look_57_0 = @input.peek( 1 )

          if ( look_57_0 == NL )
            alt_57 = 1

          end
          case alt_57
          when 1
            # at line 283:7: NL
            __NL137__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditions_823 )

            tree_for_NL137 = @adaptor.create_with_payload( __NL137__ )
            @adaptor.add_child( root_0, tree_for_NL137 )


          else
            break # out of loop for decision 57
          end
        end # loop for decision 57
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_conditions_826 )
        constraint_body138 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body138.tree )
        char_literal139 = match( T__21, TOKENS_FOLLOWING_T__21_IN_conditions_828 )

        tree_for_char_literal139 = @adaptor.create_with_payload( char_literal139 )
        @adaptor.add_child( root_0, tree_for_char_literal139 )

        # at file 283:31: ( NL )+
        match_count_58 = 0
        while true
          alt_58 = 2
          look_58_0 = @input.peek( 1 )

          if ( look_58_0 == NL )
            alt_58 = 1

          end
          case alt_58
          when 1
            # at line 283:31: NL
            __NL140__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditions_830 )

            tree_for_NL140 = @adaptor.create_with_payload( __NL140__ )
            @adaptor.add_child( root_0, tree_for_NL140 )


          else
            match_count_58 > 0 and break
            eee = EarlyExit(58)


            raise eee
          end
          match_count_58 += 1
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
        # trace_out( __method__, 22 )

      end
      
      return return_value
    end

    EffectsReturnValue = define_return_scope 

    # 
    # parser rule effects
    # 
    # (in SFP.g)
    # 288:1: effects : 'effects' '{' ( NL )* mutation_body '}' ( NL )+ ;
    # 
    def effects
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
      return_value = EffectsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal141 = nil
      char_literal142 = nil
      __NL143__ = nil
      char_literal145 = nil
      __NL146__ = nil
      mutation_body144 = nil

      tree_for_string_literal141 = nil
      tree_for_char_literal142 = nil
      tree_for_NL143 = nil
      tree_for_char_literal145 = nil
      tree_for_NL146 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 289:4: 'effects' '{' ( NL )* mutation_body '}' ( NL )+
        string_literal141 = match( T__32, TOKENS_FOLLOWING_T__32_IN_effects_847 )

        tree_for_string_literal141 = @adaptor.create_with_payload( string_literal141 )
        @adaptor.add_child( root_0, tree_for_string_literal141 )

        # --> action

        			@now['_effects']['_parent'] = @now
        			@now = @now['_effects']
        		
        # <-- action
        char_literal142 = match( T__20, TOKENS_FOLLOWING_T__20_IN_effects_855 )

        tree_for_char_literal142 = @adaptor.create_with_payload( char_literal142 )
        @adaptor.add_child( root_0, tree_for_char_literal142 )

        # at line 294:7: ( NL )*
        while true # decision 59
          alt_59 = 2
          look_59_0 = @input.peek( 1 )

          if ( look_59_0 == NL )
            alt_59 = 1

          end
          case alt_59
          when 1
            # at line 294:7: NL
            __NL143__ = match( NL, TOKENS_FOLLOWING_NL_IN_effects_857 )

            tree_for_NL143 = @adaptor.create_with_payload( __NL143__ )
            @adaptor.add_child( root_0, tree_for_NL143 )


          else
            break # out of loop for decision 59
          end
        end # loop for decision 59
        @state.following.push( TOKENS_FOLLOWING_mutation_body_IN_effects_863 )
        mutation_body144 = mutation_body
        @state.following.pop
        @adaptor.add_child( root_0, mutation_body144.tree )
        char_literal145 = match( T__21, TOKENS_FOLLOWING_T__21_IN_effects_868 )

        tree_for_char_literal145 = @adaptor.create_with_payload( char_literal145 )
        @adaptor.add_child( root_0, tree_for_char_literal145 )

        # at file 296:7: ( NL )+
        match_count_60 = 0
        while true
          alt_60 = 2
          look_60_0 = @input.peek( 1 )

          if ( look_60_0 == NL )
            alt_60 = 1

          end
          case alt_60
          when 1
            # at line 296:7: NL
            __NL146__ = match( NL, TOKENS_FOLLOWING_NL_IN_effects_870 )

            tree_for_NL146 = @adaptor.create_with_payload( __NL146__ )
            @adaptor.add_child( root_0, tree_for_NL146 )


          else
            match_count_60 > 0 and break
            eee = EarlyExit(60)


            raise eee
          end
          match_count_60 += 1
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
        # trace_out( __method__, 23 )

      end
      
      return return_value
    end

    ConstraintReturnValue = define_return_scope 

    # 
    # parser rule constraint
    # 
    # (in SFP.g)
    # 300:1: constraint : ID 'constraint' '{' ( NL )* constraint_body '}' ( NL )+ ;
    # 
    def constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = ConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID147__ = nil
      string_literal148 = nil
      char_literal149 = nil
      __NL150__ = nil
      char_literal152 = nil
      __NL153__ = nil
      constraint_body151 = nil

      tree_for_ID147 = nil
      tree_for_string_literal148 = nil
      tree_for_char_literal149 = nil
      tree_for_NL150 = nil
      tree_for_char_literal152 = nil
      tree_for_NL153 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 301:4: ID 'constraint' '{' ( NL )* constraint_body '}' ( NL )+
        __ID147__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_886 )

        tree_for_ID147 = @adaptor.create_with_payload( __ID147__ )
        @adaptor.add_child( root_0, tree_for_ID147 )

        string_literal148 = match( T__38, TOKENS_FOLLOWING_T__38_IN_constraint_888 )

        tree_for_string_literal148 = @adaptor.create_with_payload( string_literal148 )
        @adaptor.add_child( root_0, tree_for_string_literal148 )

        # --> action

        			@now[__ID147__.text] = { '_self' => __ID147__.text,
        				'_context' => 'constraint',
        				'_type' => 'and',
        				'_parent' => @now
        			}
        			@now = @now[__ID147__.text]
        		
        # <-- action
        char_literal149 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_896 )

        tree_for_char_literal149 = @adaptor.create_with_payload( char_literal149 )
        @adaptor.add_child( root_0, tree_for_char_literal149 )

        # at line 310:7: ( NL )*
        while true # decision 61
          alt_61 = 2
          look_61_0 = @input.peek( 1 )

          if ( look_61_0 == NL )
            alt_61 = 1

          end
          case alt_61
          when 1
            # at line 310:7: NL
            __NL150__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_898 )

            tree_for_NL150 = @adaptor.create_with_payload( __NL150__ )
            @adaptor.add_child( root_0, tree_for_NL150 )


          else
            break # out of loop for decision 61
          end
        end # loop for decision 61
        @state.following.push( TOKENS_FOLLOWING_constraint_body_IN_constraint_901 )
        constraint_body151 = constraint_body
        @state.following.pop
        @adaptor.add_child( root_0, constraint_body151.tree )
        char_literal152 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_903 )

        tree_for_char_literal152 = @adaptor.create_with_payload( char_literal152 )
        @adaptor.add_child( root_0, tree_for_char_literal152 )

        # at file 310:31: ( NL )+
        match_count_62 = 0
        while true
          alt_62 = 2
          look_62_0 = @input.peek( 1 )

          if ( look_62_0 == NL )
            alt_62 = 1

          end
          case alt_62
          when 1
            # at line 310:31: NL
            __NL153__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_905 )

            tree_for_NL153 = @adaptor.create_with_payload( __NL153__ )
            @adaptor.add_child( root_0, tree_for_NL153 )


          else
            match_count_62 > 0 and break
            eee = EarlyExit(62)


            raise eee
          end
          match_count_62 += 1
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
        # trace_out( __method__, 24 )

      end
      
      return return_value
    end

    ConstraintBodyReturnValue = define_return_scope 

    # 
    # parser rule constraint_body
    # 
    # (in SFP.g)
    # 314:1: constraint_body : ( ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+ )* ;
    # 
    def constraint_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = ConstraintBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL157__ = nil
      constraint_statement154 = nil
      constraint_namespace155 = nil
      constraint_iterator156 = nil

      tree_for_NL157 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 315:4: ( ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+ )*
        # at line 315:4: ( ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+ )*
        while true # decision 65
          alt_65 = 2
          look_65_0 = @input.peek( 1 )

          if ( look_65_0 == ID || look_65_0 == T__26 || look_65_0 == T__39 )
            alt_65 = 1

          end
          case alt_65
          when 1
            # at line 316:4: ( constraint_statement | constraint_namespace | constraint_iterator ) ( NL )+
            # at line 316:4: ( constraint_statement | constraint_namespace | constraint_iterator )
            alt_63 = 3
            alt_63 = @dfa63.predict( @input )
            case alt_63
            when 1
              # at line 316:6: constraint_statement
              @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_928 )
              constraint_statement154 = constraint_statement
              @state.following.pop
              @adaptor.add_child( root_0, constraint_statement154.tree )
              # --> action
              	@now[( constraint_statement154.nil? ? nil : constraint_statement154.key )] = ( constraint_statement154.nil? ? nil : constraint_statement154.val )	
              # <-- action

            when 2
              # at line 318:6: constraint_namespace
              @state.following.push( TOKENS_FOLLOWING_constraint_namespace_IN_constraint_body_941 )
              constraint_namespace155 = constraint_namespace
              @state.following.pop
              @adaptor.add_child( root_0, constraint_namespace155.tree )

            when 3
              # at line 319:6: constraint_iterator
              @state.following.push( TOKENS_FOLLOWING_constraint_iterator_IN_constraint_body_948 )
              constraint_iterator156 = constraint_iterator
              @state.following.pop
              @adaptor.add_child( root_0, constraint_iterator156.tree )

            end
            # at file 321:3: ( NL )+
            match_count_64 = 0
            while true
              alt_64 = 2
              look_64_0 = @input.peek( 1 )

              if ( look_64_0 == NL )
                alt_64 = 1

              end
              case alt_64
              when 1
                # at line 321:3: NL
                __NL157__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_body_957 )

                tree_for_NL157 = @adaptor.create_with_payload( __NL157__ )
                @adaptor.add_child( root_0, tree_for_NL157 )


              else
                match_count_64 > 0 and break
                eee = EarlyExit(64)


                raise eee
              end
              match_count_64 += 1
            end


          else
            break # out of loop for decision 65
          end
        end # loop for decision 65
        # - - - - - - - rule clean up - - - - - - - -
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

    ConstraintNamespaceReturnValue = define_return_scope 

    # 
    # parser rule constraint_namespace
    # 
    # (in SFP.g)
    # 324:1: constraint_namespace : path ( NL )* '{' ( NL )* ( constraint_statement ( NL )+ )* '}' ;
    # 
    def constraint_namespace
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = ConstraintNamespaceReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL159__ = nil
      char_literal160 = nil
      __NL161__ = nil
      __NL163__ = nil
      char_literal164 = nil
      path158 = nil
      constraint_statement162 = nil

      tree_for_NL159 = nil
      tree_for_char_literal160 = nil
      tree_for_NL161 = nil
      tree_for_NL163 = nil
      tree_for_char_literal164 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 325:4: path ( NL )* '{' ( NL )* ( constraint_statement ( NL )+ )* '}'
        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_namespace_971 )
        path158 = path
        @state.following.pop
        @adaptor.add_child( root_0, path158.tree )
        # at line 325:9: ( NL )*
        while true # decision 66
          alt_66 = 2
          look_66_0 = @input.peek( 1 )

          if ( look_66_0 == NL )
            alt_66 = 1

          end
          case alt_66
          when 1
            # at line 325:9: NL
            __NL159__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_973 )

            tree_for_NL159 = @adaptor.create_with_payload( __NL159__ )
            @adaptor.add_child( root_0, tree_for_NL159 )


          else
            break # out of loop for decision 66
          end
        end # loop for decision 66
        char_literal160 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_namespace_976 )

        tree_for_char_literal160 = @adaptor.create_with_payload( char_literal160 )
        @adaptor.add_child( root_0, tree_for_char_literal160 )

        # at line 325:17: ( NL )*
        while true # decision 67
          alt_67 = 2
          look_67_0 = @input.peek( 1 )

          if ( look_67_0 == NL )
            alt_67 = 1

          end
          case alt_67
          when 1
            # at line 325:17: NL
            __NL161__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_978 )

            tree_for_NL161 = @adaptor.create_with_payload( __NL161__ )
            @adaptor.add_child( root_0, tree_for_NL161 )


          else
            break # out of loop for decision 67
          end
        end # loop for decision 67
        # at line 325:21: ( constraint_statement ( NL )+ )*
        while true # decision 69
          alt_69 = 2
          look_69_0 = @input.peek( 1 )

          if ( look_69_0 == ID || look_69_0 == T__26 )
            alt_69 = 1

          end
          case alt_69
          when 1
            # at line 325:22: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_namespace_982 )
            constraint_statement162 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement162.tree )
            # --> action

            			key = self.toRef(( path158 && @input.to_s( path158.start, path158.stop ) ) + '.' + ( constraint_statement162.nil? ? nil : constraint_statement162.key )[2,( constraint_statement162.nil? ? nil : constraint_statement162.key ).length])
            			@now[key] = ( constraint_statement162.nil? ? nil : constraint_statement162.val )
            		
            # <-- action
            # at file 330:3: ( NL )+
            match_count_68 = 0
            while true
              alt_68 = 2
              look_68_0 = @input.peek( 1 )

              if ( look_68_0 == NL )
                alt_68 = 1

              end
              case alt_68
              when 1
                # at line 330:3: NL
                __NL163__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_namespace_990 )

                tree_for_NL163 = @adaptor.create_with_payload( __NL163__ )
                @adaptor.add_child( root_0, tree_for_NL163 )


              else
                match_count_68 > 0 and break
                eee = EarlyExit(68)


                raise eee
              end
              match_count_68 += 1
            end


          else
            break # out of loop for decision 69
          end
        end # loop for decision 69
        char_literal164 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_namespace_995 )

        tree_for_char_literal164 = @adaptor.create_with_payload( char_literal164 )
        @adaptor.add_child( root_0, tree_for_char_literal164 )

        # - - - - - - - rule clean up - - - - - - - -
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

    ConstraintIteratorReturnValue = define_return_scope 

    # 
    # parser rule constraint_iterator
    # 
    # (in SFP.g)
    # 333:1: constraint_iterator : 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ )* '}' ;
    # 
    def constraint_iterator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = ConstraintIteratorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal165 = nil
      string_literal167 = nil
      __ID168__ = nil
      __NL169__ = nil
      char_literal170 = nil
      __NL171__ = nil
      __NL173__ = nil
      char_literal174 = nil
      path166 = nil
      constraint_statement172 = nil

      tree_for_string_literal165 = nil
      tree_for_string_literal167 = nil
      tree_for_ID168 = nil
      tree_for_NL169 = nil
      tree_for_char_literal170 = nil
      tree_for_NL171 = nil
      tree_for_NL173 = nil
      tree_for_char_literal174 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 334:4: 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( constraint_statement ( NL )+ )* '}'
        string_literal165 = match( T__39, TOKENS_FOLLOWING_T__39_IN_constraint_iterator_1006 )

        tree_for_string_literal165 = @adaptor.create_with_payload( string_literal165 )
        @adaptor.add_child( root_0, tree_for_string_literal165 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_constraint_iterator_1008 )
        path166 = path
        @state.following.pop
        @adaptor.add_child( root_0, path166.tree )
        string_literal167 = match( T__40, TOKENS_FOLLOWING_T__40_IN_constraint_iterator_1010 )

        tree_for_string_literal167 = @adaptor.create_with_payload( string_literal167 )
        @adaptor.add_child( root_0, tree_for_string_literal167 )

        __ID168__ = match( ID, TOKENS_FOLLOWING_ID_IN_constraint_iterator_1012 )

        tree_for_ID168 = @adaptor.create_with_payload( __ID168__ )
        @adaptor.add_child( root_0, tree_for_ID168 )

        # at line 334:27: ( NL )*
        while true # decision 70
          alt_70 = 2
          look_70_0 = @input.peek( 1 )

          if ( look_70_0 == NL )
            alt_70 = 1

          end
          case alt_70
          when 1
            # at line 334:27: NL
            __NL169__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1014 )

            tree_for_NL169 = @adaptor.create_with_payload( __NL169__ )
            @adaptor.add_child( root_0, tree_for_NL169 )


          else
            break # out of loop for decision 70
          end
        end # loop for decision 70
        char_literal170 = match( T__20, TOKENS_FOLLOWING_T__20_IN_constraint_iterator_1017 )

        tree_for_char_literal170 = @adaptor.create_with_payload( char_literal170 )
        @adaptor.add_child( root_0, tree_for_char_literal170 )

        # at file 334:35: ( NL )+
        match_count_71 = 0
        while true
          alt_71 = 2
          look_71_0 = @input.peek( 1 )

          if ( look_71_0 == NL )
            alt_71 = 1

          end
          case alt_71
          when 1
            # at line 334:35: NL
            __NL171__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1019 )

            tree_for_NL171 = @adaptor.create_with_payload( __NL171__ )
            @adaptor.add_child( root_0, tree_for_NL171 )


          else
            match_count_71 > 0 and break
            eee = EarlyExit(71)


            raise eee
          end
          match_count_71 += 1
        end

        # --> action

        			id = self.toRef(( path166 && @input.to_s( path166.start, path166.stop ) ))
        			@now[id] = { '_parent' => @now,
        				'_context' => 'iterator',
        				'_self' => id,
        				'_variable' => __ID168__.text
        			}
        			@now = @now[id]
        		
        # <-- action
        # at line 344:3: ( constraint_statement ( NL )+ )*
        while true # decision 73
          alt_73 = 2
          look_73_0 = @input.peek( 1 )

          if ( look_73_0 == ID || look_73_0 == T__26 )
            alt_73 = 1

          end
          case alt_73
          when 1
            # at line 344:4: constraint_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_constraint_iterator_1029 )
            constraint_statement172 = constraint_statement
            @state.following.pop
            @adaptor.add_child( root_0, constraint_statement172.tree )
            # --> action

            			@now[( constraint_statement172.nil? ? nil : constraint_statement172.key )] = ( constraint_statement172.nil? ? nil : constraint_statement172.val )
            		
            # <-- action
            # at file 348:3: ( NL )+
            match_count_72 = 0
            while true
              alt_72 = 2
              look_72_0 = @input.peek( 1 )

              if ( look_72_0 == NL )
                alt_72 = 1

              end
              case alt_72
              when 1
                # at line 348:3: NL
                __NL173__ = match( NL, TOKENS_FOLLOWING_NL_IN_constraint_iterator_1037 )

                tree_for_NL173 = @adaptor.create_with_payload( __NL173__ )
                @adaptor.add_child( root_0, tree_for_NL173 )


              else
                match_count_72 > 0 and break
                eee = EarlyExit(72)


                raise eee
              end
              match_count_72 += 1
            end


          else
            break # out of loop for decision 73
          end
        end # loop for decision 73
        char_literal174 = match( T__21, TOKENS_FOLLOWING_T__21_IN_constraint_iterator_1044 )

        tree_for_char_literal174 = @adaptor.create_with_payload( char_literal174 )
        @adaptor.add_child( root_0, tree_for_char_literal174 )

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
        # trace_out( __method__, 27 )

      end
      
      return return_value
    end

    ConstraintStatementReturnValue = define_return_scope :key, :val

    # 
    # parser rule constraint_statement
    # 
    # (in SFP.g)
    # 353:1: constraint_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | conditional_constraint | reference binary_comp comp_value );
    # 
    def constraint_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = ConstraintStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL180__ = nil
      __NULL186__ = nil
      string_literal188 = nil
      string_literal189 = nil
      set192 = nil
      string_literal193 = nil
      reference175 = nil
      equals_op176 = nil
      value177 = nil
      reference178 = nil
      equals_op179 = nil
      reference181 = nil
      not_equals_op182 = nil
      value183 = nil
      reference184 = nil
      not_equals_op185 = nil
      reference187 = nil
      set_value190 = nil
      reference191 = nil
      set_value194 = nil
      conditional_constraint195 = nil
      reference196 = nil
      binary_comp197 = nil
      comp_value198 = nil

      tree_for_NULL180 = nil
      tree_for_NULL186 = nil
      tree_for_string_literal188 = nil
      tree_for_string_literal189 = nil
      tree_for_set192 = nil
      tree_for_string_literal193 = nil

      begin
        # at line 354:2: ( reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | conditional_constraint | reference binary_comp comp_value )
        alt_75 = 8
        alt_75 = @dfa75.predict( @input )
        case alt_75
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 354:4: reference equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1063 )
          reference175 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference175.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1065 )
          equals_op176 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op176.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_1067 )
          value177 = value
          @state.following.pop
          @adaptor.add_child( root_0, value177.tree )
          # --> action

          			return_value.key = ( reference175.nil? ? nil : reference175.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => ( value177.nil? ? nil : value177.val ) }
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 359:4: reference equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1076 )
          reference178 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference178.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1078 )
          equals_op179 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op179.tree )
          __NULL180__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_constraint_statement_1080 )

          tree_for_NULL180 = @adaptor.create_with_payload( __NULL180__ )
          @adaptor.add_child( root_0, tree_for_NULL180 )

          # --> action

          			return_value.key = ( reference178.nil? ? nil : reference178.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'equals', '_value' => self.null_value }
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 364:4: reference not_equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1089 )
          reference181 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference181.tree )
          @state.following.push( TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1091 )
          not_equals_op182 = not_equals_op
          @state.following.pop
          @adaptor.add_child( root_0, not_equals_op182.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_constraint_statement_1093 )
          value183 = value
          @state.following.pop
          @adaptor.add_child( root_0, value183.tree )
          # --> action

          			return_value.key = ( reference181.nil? ? nil : reference181.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-equals', '_value' => ( value183.nil? ? nil : value183.val ) }
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 369:4: reference not_equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1102 )
          reference184 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference184.tree )
          @state.following.push( TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1104 )
          not_equals_op185 = not_equals_op
          @state.following.pop
          @adaptor.add_child( root_0, not_equals_op185.tree )
          __NULL186__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_constraint_statement_1106 )

          tree_for_NULL186 = @adaptor.create_with_payload( __NULL186__ )
          @adaptor.add_child( root_0, tree_for_NULL186 )

          # --> action

          			return_value.key = ( reference184.nil? ? nil : reference184.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-equals', '_value' => self.null_value }
          		
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 374:4: reference ( 'is' )? 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1115 )
          reference187 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference187.tree )
          # at line 374:14: ( 'is' )?
          alt_74 = 2
          look_74_0 = @input.peek( 1 )

          if ( look_74_0 == T__41 )
            alt_74 = 1
          end
          case alt_74
          when 1
            # at line 374:14: 'is'
            string_literal188 = match( T__41, TOKENS_FOLLOWING_T__41_IN_constraint_statement_1117 )

            tree_for_string_literal188 = @adaptor.create_with_payload( string_literal188 )
            @adaptor.add_child( root_0, tree_for_string_literal188 )


          end
          string_literal189 = match( T__42, TOKENS_FOLLOWING_T__42_IN_constraint_statement_1120 )

          tree_for_string_literal189 = @adaptor.create_with_payload( string_literal189 )
          @adaptor.add_child( root_0, tree_for_string_literal189 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_1122 )
          set_value190 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value190.tree )
          # --> action

          			return_value.key = ( reference187.nil? ? nil : reference187.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'in', '_value' => ( set_value190.nil? ? nil : set_value190.val ) }
          		
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 379:4: reference ( 'isnt' | 'not' ) 'in' set_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1131 )
          reference191 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference191.tree )
          set192 = @input.look
          if @input.peek( 1 ).between?( T__43, T__44 )
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set192 ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          string_literal193 = match( T__42, TOKENS_FOLLOWING_T__42_IN_constraint_statement_1139 )

          tree_for_string_literal193 = @adaptor.create_with_payload( string_literal193 )
          @adaptor.add_child( root_0, tree_for_string_literal193 )

          @state.following.push( TOKENS_FOLLOWING_set_value_IN_constraint_statement_1141 )
          set_value194 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value194.tree )
          # --> action

          			return_value.key = ( reference191.nil? ? nil : reference191.val )
          			return_value.val = { '_context' => 'constraint', '_type' => 'not-in', '_value' => ( set_value194.nil? ? nil : set_value194.val ) }
          		
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 384:4: conditional_constraint
          @state.following.push( TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_1150 )
          conditional_constraint195 = conditional_constraint
          @state.following.pop
          @adaptor.add_child( root_0, conditional_constraint195.tree )

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 385:4: reference binary_comp comp_value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_constraint_statement_1155 )
          reference196 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference196.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_1157 )
          binary_comp197 = binary_comp
          @state.following.pop
          @adaptor.add_child( root_0, binary_comp197.tree )
          @state.following.push( TOKENS_FOLLOWING_comp_value_IN_constraint_statement_1159 )
          comp_value198 = comp_value
          @state.following.pop
          @adaptor.add_child( root_0, comp_value198.tree )
          # --> action

          			return_value.key = ( reference196.nil? ? nil : reference196.val )
          			return_value.val = { '_context' => 'constraint', '_type' => ( binary_comp197 && @input.to_s( binary_comp197.start, binary_comp197.stop ) ), '_value' => ( comp_value198.nil? ? nil : comp_value198.val ) }
          		
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

    CompValueReturnValue = define_return_scope :val

    # 
    # parser rule comp_value
    # 
    # (in SFP.g)
    # 392:1: comp_value returns [val] : ( NUMBER | reference );
    # 
    def comp_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = CompValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NUMBER199__ = nil
      reference200 = nil

      tree_for_NUMBER199 = nil

      begin
        # at line 393:2: ( NUMBER | reference )
        alt_76 = 2
        look_76_0 = @input.peek( 1 )

        if ( look_76_0 == NUMBER )
          alt_76 = 1
        elsif ( look_76_0 == ID )
          alt_76 = 2
        else
          raise NoViableAlternative( "", 76, 0 )
        end
        case alt_76
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 393:4: NUMBER
          __NUMBER199__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_comp_value_1178 )

          tree_for_NUMBER199 = @adaptor.create_with_payload( __NUMBER199__ )
          @adaptor.add_child( root_0, tree_for_NUMBER199 )

          # --> action
          	return_value.val = __NUMBER199__.text.to_f	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 395:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_comp_value_1187 )
          reference200 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference200.tree )
          # --> action
          	return_value.val = ( reference200.nil? ? nil : reference200.val )	
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

    ConditionalConstraintReturnValue = define_return_scope 

    # 
    # parser rule conditional_constraint
    # 
    # (in SFP.g)
    # 399:1: conditional_constraint : 'if' constraint_statement ( NL )* conditional_constraint_then ;
    # 
    def conditional_constraint
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = ConditionalConstraintReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal201 = nil
      __NL203__ = nil
      constraint_statement202 = nil
      conditional_constraint_then204 = nil

      tree_for_string_literal201 = nil
      tree_for_NL203 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 400:4: 'if' constraint_statement ( NL )* conditional_constraint_then
        string_literal201 = match( T__26, TOKENS_FOLLOWING_T__26_IN_conditional_constraint_1202 )

        tree_for_string_literal201 = @adaptor.create_with_payload( string_literal201 )
        @adaptor.add_child( root_0, tree_for_string_literal201 )

        # --> action

        			id = self.nextId
        			@now[id] = { '_parent' => @now,
        				'_context' => 'ifthen',
        				'_if' => nil,
        				'_then' => nil
        			}
        			@now = @now[id]
        		
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_1210 )
        constraint_statement202 = constraint_statement
        @state.following.pop
        @adaptor.add_child( root_0, constraint_statement202.tree )
        # at line 410:24: ( NL )*
        while true # decision 77
          alt_77 = 2
          look_77_0 = @input.peek( 1 )

          if ( look_77_0 == NL )
            alt_77 = 1

          end
          case alt_77
          when 1
            # at line 410:24: NL
            __NL203__ = match( NL, TOKENS_FOLLOWING_NL_IN_conditional_constraint_1212 )

            tree_for_NL203 = @adaptor.create_with_payload( __NL203__ )
            @adaptor.add_child( root_0, tree_for_NL203 )


          else
            break # out of loop for decision 77
          end
        end # loop for decision 77
        # --> action

        			@now['_if'] = { '_left' => ( constraint_statement202.nil? ? nil : constraint_statement202.key ),
        				'_right' => ( constraint_statement202.nil? ? nil : constraint_statement202.val )
        			}
        		
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_conditional_constraint_then_IN_conditional_constraint_1221 )
        conditional_constraint_then204 = conditional_constraint_then
        @state.following.pop
        @adaptor.add_child( root_0, conditional_constraint_then204.tree )
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
        # trace_out( __method__, 30 )

      end
      
      return return_value
    end

    ConditionalConstraintThenReturnValue = define_return_scope 

    # 
    # parser rule conditional_constraint_then
    # 
    # (in SFP.g)
    # 420:1: conditional_constraint_then : 'then' constraint_statement ;
    # 
    def conditional_constraint_then
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
      return_value = ConditionalConstraintThenReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal205 = nil
      constraint_statement206 = nil

      tree_for_string_literal205 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 421:4: 'then' constraint_statement
        string_literal205 = match( T__27, TOKENS_FOLLOWING_T__27_IN_conditional_constraint_then_1236 )

        tree_for_string_literal205 = @adaptor.create_with_payload( string_literal205 )
        @adaptor.add_child( root_0, tree_for_string_literal205 )

        @state.following.push( TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_1238 )
        constraint_statement206 = constraint_statement
        @state.following.pop
        @adaptor.add_child( root_0, constraint_statement206.tree )
        # --> action

        			@now['_then'] = { '_left' => ( constraint_statement206.nil? ? nil : constraint_statement206.key ),
        				'_right' => ( constraint_statement206.nil? ? nil : constraint_statement206.val )
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
        # trace_out( __method__, 31 )

      end
      
      return return_value
    end

    MutationBodyReturnValue = define_return_scope 

    # 
    # parser rule mutation_body
    # 
    # (in SFP.g)
    # 429:1: mutation_body : ( ( mutation_statement | mutation_iterator ) ( NL )+ )* ;
    # 
    def mutation_body
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = MutationBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NL209__ = nil
      mutation_statement207 = nil
      mutation_iterator208 = nil

      tree_for_NL209 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 430:4: ( ( mutation_statement | mutation_iterator ) ( NL )+ )*
        # at line 430:4: ( ( mutation_statement | mutation_iterator ) ( NL )+ )*
        while true # decision 80
          alt_80 = 2
          look_80_0 = @input.peek( 1 )

          if ( look_80_0 == ID || look_80_0 == T__39 || look_80_0 == T__46 )
            alt_80 = 1

          end
          case alt_80
          when 1
            # at line 431:4: ( mutation_statement | mutation_iterator ) ( NL )+
            # at line 431:4: ( mutation_statement | mutation_iterator )
            alt_78 = 2
            look_78_0 = @input.peek( 1 )

            if ( look_78_0 == ID || look_78_0 == T__46 )
              alt_78 = 1
            elsif ( look_78_0 == T__39 )
              alt_78 = 2
            else
              raise NoViableAlternative( "", 78, 0 )
            end
            case alt_78
            when 1
              # at line 431:6: mutation_statement
              @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_mutation_body_1260 )
              mutation_statement207 = mutation_statement
              @state.following.pop
              @adaptor.add_child( root_0, mutation_statement207.tree )
              # --> action
              	@now[( mutation_statement207.nil? ? nil : mutation_statement207.key )] = ( mutation_statement207.nil? ? nil : mutation_statement207.val )	
              # <-- action

            when 2
              # at line 433:6: mutation_iterator
              @state.following.push( TOKENS_FOLLOWING_mutation_iterator_IN_mutation_body_1273 )
              mutation_iterator208 = mutation_iterator
              @state.following.pop
              @adaptor.add_child( root_0, mutation_iterator208.tree )

            end
            # at file 435:3: ( NL )+
            match_count_79 = 0
            while true
              alt_79 = 2
              look_79_0 = @input.peek( 1 )

              if ( look_79_0 == NL )
                alt_79 = 1

              end
              case alt_79
              when 1
                # at line 435:3: NL
                __NL209__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_body_1282 )

                tree_for_NL209 = @adaptor.create_with_payload( __NL209__ )
                @adaptor.add_child( root_0, tree_for_NL209 )


              else
                match_count_79 > 0 and break
                eee = EarlyExit(79)


                raise eee
              end
              match_count_79 += 1
            end


          else
            break # out of loop for decision 80
          end
        end # loop for decision 80
        # - - - - - - - rule clean up - - - - - - - -
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

    MutationIteratorReturnValue = define_return_scope 

    # 
    # parser rule mutation_iterator
    # 
    # (in SFP.g)
    # 438:1: mutation_iterator : 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( mutation_statement ( NL )+ )* '}' ;
    # 
    def mutation_iterator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
      return_value = MutationIteratorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal210 = nil
      string_literal212 = nil
      __ID213__ = nil
      __NL214__ = nil
      char_literal215 = nil
      __NL216__ = nil
      __NL218__ = nil
      char_literal219 = nil
      path211 = nil
      mutation_statement217 = nil

      tree_for_string_literal210 = nil
      tree_for_string_literal212 = nil
      tree_for_ID213 = nil
      tree_for_NL214 = nil
      tree_for_char_literal215 = nil
      tree_for_NL216 = nil
      tree_for_NL218 = nil
      tree_for_char_literal219 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 439:4: 'foreach' path 'as' ID ( NL )* '{' ( NL )+ ( mutation_statement ( NL )+ )* '}'
        string_literal210 = match( T__39, TOKENS_FOLLOWING_T__39_IN_mutation_iterator_1297 )

        tree_for_string_literal210 = @adaptor.create_with_payload( string_literal210 )
        @adaptor.add_child( root_0, tree_for_string_literal210 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_iterator_1299 )
        path211 = path
        @state.following.pop
        @adaptor.add_child( root_0, path211.tree )
        string_literal212 = match( T__40, TOKENS_FOLLOWING_T__40_IN_mutation_iterator_1301 )

        tree_for_string_literal212 = @adaptor.create_with_payload( string_literal212 )
        @adaptor.add_child( root_0, tree_for_string_literal212 )

        __ID213__ = match( ID, TOKENS_FOLLOWING_ID_IN_mutation_iterator_1303 )

        tree_for_ID213 = @adaptor.create_with_payload( __ID213__ )
        @adaptor.add_child( root_0, tree_for_ID213 )

        # at line 439:27: ( NL )*
        while true # decision 81
          alt_81 = 2
          look_81_0 = @input.peek( 1 )

          if ( look_81_0 == NL )
            alt_81 = 1

          end
          case alt_81
          when 1
            # at line 439:27: NL
            __NL214__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_1305 )

            tree_for_NL214 = @adaptor.create_with_payload( __NL214__ )
            @adaptor.add_child( root_0, tree_for_NL214 )


          else
            break # out of loop for decision 81
          end
        end # loop for decision 81
        char_literal215 = match( T__20, TOKENS_FOLLOWING_T__20_IN_mutation_iterator_1308 )

        tree_for_char_literal215 = @adaptor.create_with_payload( char_literal215 )
        @adaptor.add_child( root_0, tree_for_char_literal215 )

        # at file 439:35: ( NL )+
        match_count_82 = 0
        while true
          alt_82 = 2
          look_82_0 = @input.peek( 1 )

          if ( look_82_0 == NL )
            alt_82 = 1

          end
          case alt_82
          when 1
            # at line 439:35: NL
            __NL216__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_1310 )

            tree_for_NL216 = @adaptor.create_with_payload( __NL216__ )
            @adaptor.add_child( root_0, tree_for_NL216 )


          else
            match_count_82 > 0 and break
            eee = EarlyExit(82)


            raise eee
          end
          match_count_82 += 1
        end

        # --> action

        			id = self.toRef(( path211 && @input.to_s( path211.start, path211.stop ) ))
        			@now[id] = { '_parent' => @now,
        				'_context' => 'iterator',
        				'_self' => id,
        				'_variable' => __ID213__.text
        			}
        			@now = @now[id]
        		
        # <-- action
        # at line 449:3: ( mutation_statement ( NL )+ )*
        while true # decision 84
          alt_84 = 2
          look_84_0 = @input.peek( 1 )

          if ( look_84_0 == ID || look_84_0 == T__46 )
            alt_84 = 1

          end
          case alt_84
          when 1
            # at line 449:4: mutation_statement ( NL )+
            @state.following.push( TOKENS_FOLLOWING_mutation_statement_IN_mutation_iterator_1320 )
            mutation_statement217 = mutation_statement
            @state.following.pop
            @adaptor.add_child( root_0, mutation_statement217.tree )
            # --> action
            	@now[( mutation_statement217.nil? ? nil : mutation_statement217.key )] = ( mutation_statement217.nil? ? nil : mutation_statement217.val )	
            # <-- action
            # at file 451:3: ( NL )+
            match_count_83 = 0
            while true
              alt_83 = 2
              look_83_0 = @input.peek( 1 )

              if ( look_83_0 == NL )
                alt_83 = 1

              end
              case alt_83
              when 1
                # at line 451:3: NL
                __NL218__ = match( NL, TOKENS_FOLLOWING_NL_IN_mutation_iterator_1328 )

                tree_for_NL218 = @adaptor.create_with_payload( __NL218__ )
                @adaptor.add_child( root_0, tree_for_NL218 )


              else
                match_count_83 > 0 and break
                eee = EarlyExit(83)


                raise eee
              end
              match_count_83 += 1
            end


          else
            break # out of loop for decision 84
          end
        end # loop for decision 84
        char_literal219 = match( T__21, TOKENS_FOLLOWING_T__21_IN_mutation_iterator_1335 )

        tree_for_char_literal219 = @adaptor.create_with_payload( char_literal219 )
        @adaptor.add_child( root_0, tree_for_char_literal219 )

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
        # trace_out( __method__, 33 )

      end
      
      return return_value
    end

    MutationStatementReturnValue = define_return_scope :key, :val

    # 
    # parser rule mutation_statement
    # 
    # (in SFP.g)
    # 456:1: mutation_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' );
    # 
    def mutation_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )
      return_value = MutationStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NULL225__ = nil
      __NUMBER228__ = nil
      string_literal230 = nil
      string_literal231 = nil
      string_literal234 = nil
      string_literal237 = nil
      char_literal239 = nil
      string_literal241 = nil
      char_literal243 = nil
      reference220 = nil
      equals_op221 = nil
      value222 = nil
      reference223 = nil
      equals_op224 = nil
      reference226 = nil
      binary_op227 = nil
      reference229 = nil
      path232 = nil
      object_body233 = nil
      path235 = nil
      reference236 = nil
      value238 = nil
      reference240 = nil
      value242 = nil

      tree_for_NULL225 = nil
      tree_for_NUMBER228 = nil
      tree_for_string_literal230 = nil
      tree_for_string_literal231 = nil
      tree_for_string_literal234 = nil
      tree_for_string_literal237 = nil
      tree_for_char_literal239 = nil
      tree_for_string_literal241 = nil
      tree_for_char_literal243 = nil

      begin
        # at line 457:2: ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' )
        alt_86 = 7
        alt_86 = @dfa86.predict( @input )
        case alt_86
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 457:4: reference equals_op value
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1354 )
          reference220 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference220.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_mutation_statement_1356 )
          equals_op221 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op221.tree )
          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_1358 )
          value222 = value
          @state.following.pop
          @adaptor.add_child( root_0, value222.tree )
          # --> action

          			return_value.key = ( reference220.nil? ? nil : reference220.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'equals',
          				'_value' => ( value222.nil? ? nil : value222.val )
          			}
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 465:4: reference equals_op NULL
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1367 )
          reference223 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference223.tree )
          @state.following.push( TOKENS_FOLLOWING_equals_op_IN_mutation_statement_1369 )
          equals_op224 = equals_op
          @state.following.pop
          @adaptor.add_child( root_0, equals_op224.tree )
          __NULL225__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_mutation_statement_1371 )

          tree_for_NULL225 = @adaptor.create_with_payload( __NULL225__ )
          @adaptor.add_child( root_0, tree_for_NULL225 )

          # --> action

          			return_value.key = ( reference223.nil? ? nil : reference223.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'equals',
          				'_value' => self.null_value
          			}
          		
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 473:4: reference binary_op NUMBER
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1380 )
          reference226 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference226.tree )
          @state.following.push( TOKENS_FOLLOWING_binary_op_IN_mutation_statement_1382 )
          binary_op227 = binary_op
          @state.following.pop
          @adaptor.add_child( root_0, binary_op227.tree )
          __NUMBER228__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_mutation_statement_1384 )

          tree_for_NUMBER228 = @adaptor.create_with_payload( __NUMBER228__ )
          @adaptor.add_child( root_0, tree_for_NUMBER228 )

          # --> action

          			return_value.key = ( reference226.nil? ? nil : reference226.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => ( binary_op227 && @input.to_s( binary_op227.start, binary_op227.stop ) ),
          				'_value' => __NUMBER228__.text.to_f
          			}
          		
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 481:4: reference 'is' 'new' path ( object_body )?
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1393 )
          reference229 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference229.tree )
          string_literal230 = match( T__41, TOKENS_FOLLOWING_T__41_IN_mutation_statement_1395 )

          tree_for_string_literal230 = @adaptor.create_with_payload( string_literal230 )
          @adaptor.add_child( root_0, tree_for_string_literal230 )

          string_literal231 = match( T__45, TOKENS_FOLLOWING_T__45_IN_mutation_statement_1397 )

          tree_for_string_literal231 = @adaptor.create_with_payload( string_literal231 )
          @adaptor.add_child( root_0, tree_for_string_literal231 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_statement_1399 )
          path232 = path
          @state.following.pop
          @adaptor.add_child( root_0, path232.tree )
          # --> action

          			id = '_' + self.nextId
          			@now[id] = { '_self' => id,
          				'_context' => 'object',
          				'_isa' => self.toRef(( path232 && @input.to_s( path232.start, path232.stop ) )),
          				'_parent' => @now
          			}
          			@now = @now[id]
          		
          # <-- action
          # at line 491:3: ( object_body )?
          alt_85 = 2
          look_85_0 = @input.peek( 1 )

          if ( look_85_0 == T__20 )
            alt_85 = 1
          end
          case alt_85
          when 1
            # at line 491:3: object_body
            @state.following.push( TOKENS_FOLLOWING_object_body_IN_mutation_statement_1407 )
            object_body233 = object_body
            @state.following.pop
            @adaptor.add_child( root_0, object_body233.tree )

          end
          # --> action

          			n = self.gotoParent()
          			@now.delete(n['_self'])
          			return_value.key = ( reference229.nil? ? nil : reference229.val )
          			return_value.val = n
          		
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 498:4: 'delete' path
          string_literal234 = match( T__46, TOKENS_FOLLOWING_T__46_IN_mutation_statement_1417 )

          tree_for_string_literal234 = @adaptor.create_with_payload( string_literal234 )
          @adaptor.add_child( root_0, tree_for_string_literal234 )

          @state.following.push( TOKENS_FOLLOWING_path_IN_mutation_statement_1419 )
          path235 = path
          @state.following.pop
          @adaptor.add_child( root_0, path235.tree )
          # --> action

          			id = '_' + self.nextId
          			@now[id] = { '_self' => id,
          				'_context' => 'mutation',
          				'_type' => 'delete',
          				'_value' => self.toRef(( path235 && @input.to_s( path235.start, path235.stop ) ))
          			}
          		
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 507:4: reference 'add(' value ')'
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1428 )
          reference236 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference236.tree )
          string_literal237 = match( T__47, TOKENS_FOLLOWING_T__47_IN_mutation_statement_1430 )

          tree_for_string_literal237 = @adaptor.create_with_payload( string_literal237 )
          @adaptor.add_child( root_0, tree_for_string_literal237 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_1432 )
          value238 = value
          @state.following.pop
          @adaptor.add_child( root_0, value238.tree )
          char_literal239 = match( T__36, TOKENS_FOLLOWING_T__36_IN_mutation_statement_1434 )

          tree_for_char_literal239 = @adaptor.create_with_payload( char_literal239 )
          @adaptor.add_child( root_0, tree_for_char_literal239 )

          # --> action

          			return_value.key = ( reference236.nil? ? nil : reference236.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'add',
          				'_value' => ( value238.nil? ? nil : value238.val )
          			}
          		
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 515:4: reference 'remove(' value ')'
          @state.following.push( TOKENS_FOLLOWING_reference_IN_mutation_statement_1443 )
          reference240 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference240.tree )
          string_literal241 = match( T__48, TOKENS_FOLLOWING_T__48_IN_mutation_statement_1445 )

          tree_for_string_literal241 = @adaptor.create_with_payload( string_literal241 )
          @adaptor.add_child( root_0, tree_for_string_literal241 )

          @state.following.push( TOKENS_FOLLOWING_value_IN_mutation_statement_1447 )
          value242 = value
          @state.following.pop
          @adaptor.add_child( root_0, value242.tree )
          char_literal243 = match( T__36, TOKENS_FOLLOWING_T__36_IN_mutation_statement_1449 )

          tree_for_char_literal243 = @adaptor.create_with_payload( char_literal243 )
          @adaptor.add_child( root_0, tree_for_char_literal243 )

          # --> action

          			return_value.key = ( reference240.nil? ? nil : reference240.val )
          			return_value.val = { '_context' => 'mutation',
          				'_type' => 'remove',
          				'_value' => ( value242.nil? ? nil : value242.val )
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
        # trace_out( __method__, 34 )

      end
      
      return return_value
    end

    SetValueReturnValue = define_return_scope :val

    # 
    # parser rule set_value
    # 
    # (in SFP.g)
    # 525:1: set_value returns [val] : '(' set_item ( ',' set_item )* ')' ;
    # 
    def set_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
      return_value = SetValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal244 = nil
      char_literal246 = nil
      char_literal248 = nil
      set_item245 = nil
      set_item247 = nil

      tree_for_char_literal244 = nil
      tree_for_char_literal246 = nil
      tree_for_char_literal248 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 526:4: '(' set_item ( ',' set_item )* ')'
        char_literal244 = match( T__34, TOKENS_FOLLOWING_T__34_IN_set_value_1468 )

        tree_for_char_literal244 = @adaptor.create_with_payload( char_literal244 )
        @adaptor.add_child( root_0, tree_for_char_literal244 )

        # --> action
        	@set = Array.new	
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_1476 )
        set_item245 = set_item
        @state.following.pop
        @adaptor.add_child( root_0, set_item245.tree )
        # at line 528:12: ( ',' set_item )*
        while true # decision 87
          alt_87 = 2
          look_87_0 = @input.peek( 1 )

          if ( look_87_0 == T__35 )
            alt_87 = 1

          end
          case alt_87
          when 1
            # at line 528:13: ',' set_item
            char_literal246 = match( T__35, TOKENS_FOLLOWING_T__35_IN_set_value_1479 )

            tree_for_char_literal246 = @adaptor.create_with_payload( char_literal246 )
            @adaptor.add_child( root_0, tree_for_char_literal246 )

            @state.following.push( TOKENS_FOLLOWING_set_item_IN_set_value_1481 )
            set_item247 = set_item
            @state.following.pop
            @adaptor.add_child( root_0, set_item247.tree )

          else
            break # out of loop for decision 87
          end
        end # loop for decision 87
        # --> action
        	return_value.val = @set	
        # <-- action
        char_literal248 = match( T__36, TOKENS_FOLLOWING_T__36_IN_set_value_1491 )

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
        # trace_out( __method__, 35 )

      end
      
      return return_value
    end

    SetItemReturnValue = define_return_scope 

    # 
    # parser rule set_item
    # 
    # (in SFP.g)
    # 533:1: set_item : value ;
    # 
    def set_item
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
      return_value = SetItemReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      value249 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 534:4: value
        @state.following.push( TOKENS_FOLLOWING_value_IN_set_item_1502 )
        value249 = value
        @state.following.pop
        @adaptor.add_child( root_0, value249.tree )
        # --> action
        	@set.push(( value249.nil? ? nil : value249.val ))	
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

    ValueReturnValue = define_return_scope :val

    # 
    # parser rule value
    # 
    # (in SFP.g)
    # 538:1: value returns [val] : ( primitive_value | reference | set_value );
    # 
    def value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )
      return_value = ValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      primitive_value250 = nil
      reference251 = nil
      set_value252 = nil


      begin
        # at line 539:2: ( primitive_value | reference | set_value )
        alt_88 = 3
        case look_88 = @input.peek( 1 )
        when STRING, NUMBER, BOOLEAN, MULTILINE_STRING then alt_88 = 1
        when ID then alt_88 = 2
        when T__34 then alt_88 = 3
        else
          raise NoViableAlternative( "", 88, 0 )
        end
        case alt_88
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 539:4: primitive_value
          @state.following.push( TOKENS_FOLLOWING_primitive_value_IN_value_1521 )
          primitive_value250 = primitive_value
          @state.following.pop
          @adaptor.add_child( root_0, primitive_value250.tree )
          # --> action
          	return_value.val = ( primitive_value250.nil? ? nil : primitive_value250.val )	
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 541:4: reference
          @state.following.push( TOKENS_FOLLOWING_reference_IN_value_1530 )
          reference251 = reference
          @state.following.pop
          @adaptor.add_child( root_0, reference251.tree )
          # --> action
          	return_value.val = ( reference251.nil? ? nil : reference251.val )	
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 543:4: set_value
          @state.following.push( TOKENS_FOLLOWING_set_value_IN_value_1539 )
          set_value252 = set_value
          @state.following.pop
          @adaptor.add_child( root_0, set_value252.tree )
          # --> action
          	return_value.val = ( set_value252.nil? ? nil : set_value252.val )	
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

    PrimitiveValueReturnValue = define_return_scope :val

    # 
    # parser rule primitive_value
    # 
    # (in SFP.g)
    # 547:1: primitive_value returns [val] : ( BOOLEAN | NUMBER | STRING | MULTILINE_STRING );
    # 
    def primitive_value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )
      return_value = PrimitiveValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __BOOLEAN253__ = nil
      __NUMBER254__ = nil
      __STRING255__ = nil
      __MULTILINE_STRING256__ = nil

      tree_for_BOOLEAN253 = nil
      tree_for_NUMBER254 = nil
      tree_for_STRING255 = nil
      tree_for_MULTILINE_STRING256 = nil

      begin
        # at line 548:2: ( BOOLEAN | NUMBER | STRING | MULTILINE_STRING )
        alt_89 = 4
        case look_89 = @input.peek( 1 )
        when BOOLEAN then alt_89 = 1
        when NUMBER then alt_89 = 2
        when STRING then alt_89 = 3
        when MULTILINE_STRING then alt_89 = 4
        else
          raise NoViableAlternative( "", 89, 0 )
        end
        case alt_89
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 548:4: BOOLEAN
          __BOOLEAN253__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_1558 )

          tree_for_BOOLEAN253 = @adaptor.create_with_payload( __BOOLEAN253__ )
          @adaptor.add_child( root_0, tree_for_BOOLEAN253 )

          # --> action

          			if __BOOLEAN253__.text == 'true' or __BOOLEAN253__.text == 'yes'
          				return_value.val = true
          			else  # 'false', 'no'
          				return_value.val = false
          			end
          		
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 556:4: NUMBER
          __NUMBER254__ = match( NUMBER, TOKENS_FOLLOWING_NUMBER_IN_primitive_value_1567 )

          tree_for_NUMBER254 = @adaptor.create_with_payload( __NUMBER254__ )
          @adaptor.add_child( root_0, tree_for_NUMBER254 )

          # --> action
          	return_value.val = __NUMBER254__.text.to_f	
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 558:4: STRING
          __STRING255__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_primitive_value_1576 )

          tree_for_STRING255 = @adaptor.create_with_payload( __STRING255__ )
          @adaptor.add_child( root_0, tree_for_STRING255 )

          # --> action
          	return_value.val = __STRING255__.text[1,__STRING255__.text.length-2]	
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 560:4: MULTILINE_STRING
          __MULTILINE_STRING256__ = match( MULTILINE_STRING, TOKENS_FOLLOWING_MULTILINE_STRING_IN_primitive_value_1585 )

          tree_for_MULTILINE_STRING256 = @adaptor.create_with_payload( __MULTILINE_STRING256__ )
          @adaptor.add_child( root_0, tree_for_MULTILINE_STRING256 )

          # --> action
          	return_value.val = __MULTILINE_STRING256__.text[2, __MULTILINE_STRING256__.text.length-2]	
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

    PathReturnValue = define_return_scope 

    # 
    # parser rule path
    # 
    # (in SFP.g)
    # 564:1: path : ID ( '.' ID )* ;
    # 
    def path
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )
      return_value = PathReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID257__ = nil
      char_literal258 = nil
      __ID259__ = nil

      tree_for_ID257 = nil
      tree_for_char_literal258 = nil
      tree_for_ID259 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 565:4: ID ( '.' ID )*
        __ID257__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_1600 )

        tree_for_ID257 = @adaptor.create_with_payload( __ID257__ )
        @adaptor.add_child( root_0, tree_for_ID257 )

        # at line 565:6: ( '.' ID )*
        while true # decision 90
          alt_90 = 2
          look_90_0 = @input.peek( 1 )

          if ( look_90_0 == T__49 )
            alt_90 = 1

          end
          case alt_90
          when 1
            # at line 565:7: '.' ID
            char_literal258 = match( T__49, TOKENS_FOLLOWING_T__49_IN_path_1602 )

            tree_for_char_literal258 = @adaptor.create_with_payload( char_literal258 )
            @adaptor.add_child( root_0, tree_for_char_literal258 )

            __ID259__ = match( ID, TOKENS_FOLLOWING_ID_IN_path_1603 )

            tree_for_ID259 = @adaptor.create_with_payload( __ID259__ )
            @adaptor.add_child( root_0, tree_for_ID259 )


          else
            break # out of loop for decision 90
          end
        end # loop for decision 90
        # - - - - - - - rule clean up - - - - - - - -
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

    ReferenceReturnValue = define_return_scope :val

    # 
    # parser rule reference
    # 
    # (in SFP.g)
    # 568:1: reference returns [val] : path ;
    # 
    def reference
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )
      return_value = ReferenceReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      path260 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 569:4: path
        @state.following.push( TOKENS_FOLLOWING_path_IN_reference_1620 )
        path260 = path
        @state.following.pop
        @adaptor.add_child( root_0, path260.tree )
        # --> action
        	return_value.val = self.toRef(( path260 && @input.to_s( path260.start, path260.stop ) ))	
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

    ReferenceTypeReturnValue = define_return_scope :val

    # 
    # parser rule reference_type
    # 
    # (in SFP.g)
    # 573:1: reference_type returns [val] : 'isref' path ;
    # 
    def reference_type
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )
      return_value = ReferenceTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      string_literal261 = nil
      path262 = nil

      tree_for_string_literal261 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 574:4: 'isref' path
        string_literal261 = match( T__50, TOKENS_FOLLOWING_T__50_IN_reference_type_1639 )

        tree_for_string_literal261 = @adaptor.create_with_payload( string_literal261 )
        @adaptor.add_child( root_0, tree_for_string_literal261 )

        @state.following.push( TOKENS_FOLLOWING_path_IN_reference_type_1641 )
        path262 = path
        @state.following.pop
        @adaptor.add_child( root_0, path262.tree )
        # --> action

        			return_value.val = { '_context' => 'null',
        				'_isa' => self.toRef(( path262 && @input.to_s( path262.start, path262.stop ) ))
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
        # trace_out( __method__, 41 )

      end
      
      return return_value
    end

    EqualsOpReturnValue = define_return_scope 

    # 
    # parser rule equals_op
    # 
    # (in SFP.g)
    # 582:1: equals_op : ( '=' | 'is' );
    # 
    def equals_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )
      return_value = EqualsOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set263 = nil

      tree_for_set263 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set263 = @input.look
        if @input.peek(1) == T__41 || @input.peek(1) == T__51
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set263 ) )
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
        # trace_out( __method__, 42 )

      end
      
      return return_value
    end

    NotEqualsOpReturnValue = define_return_scope 

    # 
    # parser rule not_equals_op
    # 
    # (in SFP.g)
    # 587:1: not_equals_op : ( '!=' | 'isnt' );
    # 
    def not_equals_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )
      return_value = NotEqualsOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set264 = nil

      tree_for_set264 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set264 = @input.look
        if @input.peek(1) == T__43 || @input.peek(1) == T__52
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set264 ) )
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

    BinaryOpReturnValue = define_return_scope 

    # 
    # parser rule binary_op
    # 
    # (in SFP.g)
    # 592:1: binary_op : ( '+=' | '-=' | '*=' | '/=' );
    # 
    def binary_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )
      return_value = BinaryOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set265 = nil

      tree_for_set265 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set265 = @input.look
        if @input.peek( 1 ).between?( T__53, T__56 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set265 ) )
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

    BinaryCompReturnValue = define_return_scope 

    # 
    # parser rule binary_comp
    # 
    # (in SFP.g)
    # 599:1: binary_comp : ( '>' | '>=' | '<' | '<=' );
    # 
    def binary_comp
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )
      return_value = BinaryCompReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set266 = nil

      tree_for_set266 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 
        set266 = @input.look
        if @input.peek( 1 ).between?( T__57, T__60 )
          @input.consume
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set266 ) )
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



    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA34 < ANTLR3::DFA
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
      
      @decision = 34
      

      def description
        <<-'__dfa_description__'.strip!
          ()* loopback of 182:3: ( ( NL )* 'or' ( NL )* '{' ( NL )* constraint_body '}' )*
        __dfa_description__
      end
    end
    class DFA63 < ANTLR3::DFA
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
      
      @decision = 63
      

      def description
        <<-'__dfa_description__'.strip!
          316:4: ( constraint_statement | constraint_namespace | constraint_iterator )
        __dfa_description__
      end
    end
    class DFA75 < ANTLR3::DFA
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
      
      @decision = 75
      

      def description
        <<-'__dfa_description__'.strip!
          353:1: constraint_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference not_equals_op value | reference not_equals_op NULL | reference ( 'is' )? 'in' set_value | reference ( 'isnt' | 'not' ) 'in' set_value | conditional_constraint | reference binary_comp comp_value );
        __dfa_description__
      end
    end
    class DFA86 < ANTLR3::DFA
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
      
      @decision = 86
      

      def description
        <<-'__dfa_description__'.strip!
          456:1: mutation_statement returns [key, val] : ( reference equals_op value | reference equals_op NULL | reference binary_op NUMBER | reference 'is' 'new' path ( object_body )? | 'delete' path | reference 'add(' value ')' | reference 'remove(' value ')' );
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa34 = DFA34.new( self, 34 )
      @dfa63 = DFA63.new( self, 63 )
      @dfa75 = DFA75.new( self, 75 )
      @dfa86 = DFA86.new( self, 86 )

    end
    TOKENS_FOLLOWING_NL_IN_sfp_49 = Set[ 1, 4, 6, 18, 22, 23, 33 ]
    TOKENS_FOLLOWING_include_IN_sfp_52 = Set[ 1, 6, 18, 22, 23, 33 ]
    TOKENS_FOLLOWING_header_IN_sfp_55 = Set[ 1, 6, 22, 23, 33 ]
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
    TOKENS_FOLLOWING_T__20_IN_class_definition_233 = Set[ 4, 6, 21, 23, 33 ]
    TOKENS_FOLLOWING_NL_IN_class_definition_235 = Set[ 4, 6, 21, 23, 33 ]
    TOKENS_FOLLOWING_attribute_IN_class_definition_240 = Set[ 6, 21, 23, 33 ]
    TOKENS_FOLLOWING_procedure_IN_class_definition_244 = Set[ 6, 21, 23, 33 ]
    TOKENS_FOLLOWING_T__21_IN_class_definition_249 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_NL_IN_class_definition_253 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__24_IN_extends_class_274 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_extends_class_276 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_attribute_291 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_attribute_293 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_attribute_295 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_297 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_attribute_307 = Set[ 50 ]
    TOKENS_FOLLOWING_reference_type_IN_attribute_309 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_311 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_object_def_IN_attribute_321 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_attribute_323 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_object_def_335 = Set[ 1, 20, 25 ]
    TOKENS_FOLLOWING_T__25_IN_object_def_344 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_object_def_346 = Set[ 1, 20 ]
    TOKENS_FOLLOWING_object_body_IN_object_def_359 = Set[ 1 ]
    TOKENS_FOLLOWING_T__20_IN_object_body_375 = Set[ 4, 6, 21, 26, 29 ]
    TOKENS_FOLLOWING_NL_IN_object_body_377 = Set[ 4, 6, 21, 26, 29 ]
    TOKENS_FOLLOWING_object_attribute_IN_object_body_382 = Set[ 6, 21, 26, 29 ]
    TOKENS_FOLLOWING_state_dependency_IN_object_body_386 = Set[ 6, 21, 26, 29 ]
    TOKENS_FOLLOWING_operator_IN_object_body_390 = Set[ 6, 21, 26, 29 ]
    TOKENS_FOLLOWING_T__21_IN_object_body_395 = Set[ 1 ]
    TOKENS_FOLLOWING_attribute_IN_object_attribute_406 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_object_attribute_411 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_object_attribute_413 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_object_attribute_415 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_object_attribute_417 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__26_IN_state_dependency_433 = Set[ 6 ]
    TOKENS_FOLLOWING_dep_effect_IN_state_dependency_437 = Set[ 4, 27 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_439 = Set[ 4, 27 ]
    TOKENS_FOLLOWING_T__27_IN_state_dependency_442 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_444 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_dependency_447 = Set[ 4, 6, 21, 26, 39 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_451 = Set[ 4, 6, 21, 26, 39 ]
    TOKENS_FOLLOWING_constraint_body_IN_state_dependency_454 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_dependency_459 = Set[ 4, 28 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_465 = Set[ 4, 28 ]
    TOKENS_FOLLOWING_T__28_IN_state_dependency_468 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_470 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_state_dependency_473 = Set[ 4, 6, 21, 26, 39 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_477 = Set[ 4, 6, 21, 26, 39 ]
    TOKENS_FOLLOWING_constraint_body_IN_state_dependency_480 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_state_dependency_484 = Set[ 4, 28 ]
    TOKENS_FOLLOWING_NL_IN_state_dependency_490 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_reference_IN_dep_effect_502 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_dep_effect_504 = Set[ 5, 6, 7, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_dep_effect_511 = Set[ 1 ]
    TOKENS_FOLLOWING_NULL_IN_dep_effect_517 = Set[ 1 ]
    TOKENS_FOLLOWING_T__29_IN_operator_533 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_operator_535 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_operator_537 = Set[ 4, 30, 31, 32 ]
    TOKENS_FOLLOWING_NL_IN_operator_539 = Set[ 4, 30, 31, 32 ]
    TOKENS_FOLLOWING_T__30_IN_operator_550 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_operator_552 = Set[ 8 ]
    TOKENS_FOLLOWING_NUMBER_IN_operator_554 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_operator_556 = Set[ 4, 30, 31, 32 ]
    TOKENS_FOLLOWING_op_conditions_IN_operator_571 = Set[ 4, 30, 31, 32 ]
    TOKENS_FOLLOWING_op_effects_IN_operator_574 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_operator_578 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_operator_580 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__31_IN_op_conditions_596 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_op_conditions_598 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_NL_IN_op_conditions_600 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_op_statement_IN_op_conditions_609 = Set[ 6, 21 ]
    TOKENS_FOLLOWING_T__21_IN_op_conditions_614 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_conditions_616 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__32_IN_op_effects_632 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_op_effects_634 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_NL_IN_op_effects_636 = Set[ 4, 6, 21 ]
    TOKENS_FOLLOWING_op_statement_IN_op_effects_645 = Set[ 6, 21 ]
    TOKENS_FOLLOWING_T__21_IN_op_effects_650 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_effects_652 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_reference_IN_op_statement_668 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_op_statement_670 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_op_statement_672 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_op_statement_674 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__33_IN_procedure_690 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_procedure_692 = Set[ 20, 34 ]
    TOKENS_FOLLOWING_parameters_IN_procedure_700 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_procedure_703 = Set[ 4, 30, 31, 32 ]
    TOKENS_FOLLOWING_NL_IN_procedure_705 = Set[ 4, 30, 31, 32 ]
    TOKENS_FOLLOWING_T__30_IN_procedure_713 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_procedure_715 = Set[ 8 ]
    TOKENS_FOLLOWING_NUMBER_IN_procedure_717 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_procedure_727 = Set[ 4, 30, 31, 32 ]
    TOKENS_FOLLOWING_conditions_IN_procedure_737 = Set[ 4, 30, 31, 32 ]
    TOKENS_FOLLOWING_effects_IN_procedure_740 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_procedure_742 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_procedure_744 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__34_IN_parameters_760 = Set[ 6 ]
    TOKENS_FOLLOWING_parameter_IN_parameters_762 = Set[ 35, 36 ]
    TOKENS_FOLLOWING_T__35_IN_parameters_765 = Set[ 6 ]
    TOKENS_FOLLOWING_parameter_IN_parameters_767 = Set[ 35, 36 ]
    TOKENS_FOLLOWING_T__36_IN_parameters_771 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_783 = Set[ 50 ]
    TOKENS_FOLLOWING_reference_type_IN_parameter_785 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_parameter_794 = Set[ 37 ]
    TOKENS_FOLLOWING_T__37_IN_parameter_796 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_parameter_798 = Set[ 1 ]
    TOKENS_FOLLOWING_T__31_IN_conditions_813 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_conditions_821 = Set[ 4, 6, 21, 26, 39 ]
    TOKENS_FOLLOWING_NL_IN_conditions_823 = Set[ 4, 6, 21, 26, 39 ]
    TOKENS_FOLLOWING_constraint_body_IN_conditions_826 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_conditions_828 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_conditions_830 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_T__32_IN_effects_847 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_effects_855 = Set[ 4, 6, 21, 39, 46 ]
    TOKENS_FOLLOWING_NL_IN_effects_857 = Set[ 4, 6, 21, 39, 46 ]
    TOKENS_FOLLOWING_mutation_body_IN_effects_863 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_effects_868 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_effects_870 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_ID_IN_constraint_886 = Set[ 38 ]
    TOKENS_FOLLOWING_T__38_IN_constraint_888 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_896 = Set[ 4, 6, 21, 26, 39 ]
    TOKENS_FOLLOWING_NL_IN_constraint_898 = Set[ 4, 6, 21, 26, 39 ]
    TOKENS_FOLLOWING_constraint_body_IN_constraint_901 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_903 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_905 = Set[ 1, 4 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_body_928 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_namespace_IN_constraint_body_941 = Set[ 4 ]
    TOKENS_FOLLOWING_constraint_iterator_IN_constraint_body_948 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_body_957 = Set[ 1, 4, 6, 26, 39 ]
    TOKENS_FOLLOWING_path_IN_constraint_namespace_971 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_973 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_namespace_976 = Set[ 4, 6, 21, 26 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_978 = Set[ 4, 6, 21, 26 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_namespace_982 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_namespace_990 = Set[ 4, 6, 21, 26 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_namespace_995 = Set[ 1 ]
    TOKENS_FOLLOWING_T__39_IN_constraint_iterator_1006 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_constraint_iterator_1008 = Set[ 40 ]
    TOKENS_FOLLOWING_T__40_IN_constraint_iterator_1010 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_constraint_iterator_1012 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1014 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_constraint_iterator_1017 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1019 = Set[ 4, 6, 21, 26 ]
    TOKENS_FOLLOWING_constraint_statement_IN_constraint_iterator_1029 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_constraint_iterator_1037 = Set[ 4, 6, 21, 26 ]
    TOKENS_FOLLOWING_T__21_IN_constraint_iterator_1044 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1063 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1065 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_1067 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1076 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_constraint_statement_1078 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_1080 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1089 = Set[ 43, 52 ]
    TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1091 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_constraint_statement_1093 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1102 = Set[ 43, 52 ]
    TOKENS_FOLLOWING_not_equals_op_IN_constraint_statement_1104 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_constraint_statement_1106 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1115 = Set[ 41, 42 ]
    TOKENS_FOLLOWING_T__41_IN_constraint_statement_1117 = Set[ 42 ]
    TOKENS_FOLLOWING_T__42_IN_constraint_statement_1120 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_1122 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1131 = Set[ 43, 44 ]
    TOKENS_FOLLOWING_set_IN_constraint_statement_1133 = Set[ 42 ]
    TOKENS_FOLLOWING_T__42_IN_constraint_statement_1139 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_set_value_IN_constraint_statement_1141 = Set[ 1 ]
    TOKENS_FOLLOWING_conditional_constraint_IN_constraint_statement_1150 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_constraint_statement_1155 = Set[ 57, 58, 59, 60 ]
    TOKENS_FOLLOWING_binary_comp_IN_constraint_statement_1157 = Set[ 6, 8 ]
    TOKENS_FOLLOWING_comp_value_IN_constraint_statement_1159 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_comp_value_1178 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_comp_value_1187 = Set[ 1 ]
    TOKENS_FOLLOWING_T__26_IN_conditional_constraint_1202 = Set[ 6, 26 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_1210 = Set[ 4, 27 ]
    TOKENS_FOLLOWING_NL_IN_conditional_constraint_1212 = Set[ 4, 27 ]
    TOKENS_FOLLOWING_conditional_constraint_then_IN_conditional_constraint_1221 = Set[ 1 ]
    TOKENS_FOLLOWING_T__27_IN_conditional_constraint_then_1236 = Set[ 6, 26 ]
    TOKENS_FOLLOWING_constraint_statement_IN_conditional_constraint_then_1238 = Set[ 1 ]
    TOKENS_FOLLOWING_mutation_statement_IN_mutation_body_1260 = Set[ 4 ]
    TOKENS_FOLLOWING_mutation_iterator_IN_mutation_body_1273 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_body_1282 = Set[ 1, 4, 6, 39, 46 ]
    TOKENS_FOLLOWING_T__39_IN_mutation_iterator_1297 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_iterator_1299 = Set[ 40 ]
    TOKENS_FOLLOWING_T__40_IN_mutation_iterator_1301 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_mutation_iterator_1303 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_1305 = Set[ 4, 20 ]
    TOKENS_FOLLOWING_T__20_IN_mutation_iterator_1308 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_1310 = Set[ 4, 6, 21, 46 ]
    TOKENS_FOLLOWING_mutation_statement_IN_mutation_iterator_1320 = Set[ 4 ]
    TOKENS_FOLLOWING_NL_IN_mutation_iterator_1328 = Set[ 4, 6, 21, 46 ]
    TOKENS_FOLLOWING_T__21_IN_mutation_iterator_1335 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1354 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_mutation_statement_1356 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_1358 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1367 = Set[ 41, 51 ]
    TOKENS_FOLLOWING_equals_op_IN_mutation_statement_1369 = Set[ 7 ]
    TOKENS_FOLLOWING_NULL_IN_mutation_statement_1371 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1380 = Set[ 53, 54, 55, 56 ]
    TOKENS_FOLLOWING_binary_op_IN_mutation_statement_1382 = Set[ 8 ]
    TOKENS_FOLLOWING_NUMBER_IN_mutation_statement_1384 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1393 = Set[ 41 ]
    TOKENS_FOLLOWING_T__41_IN_mutation_statement_1395 = Set[ 45 ]
    TOKENS_FOLLOWING_T__45_IN_mutation_statement_1397 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_statement_1399 = Set[ 1, 20 ]
    TOKENS_FOLLOWING_object_body_IN_mutation_statement_1407 = Set[ 1 ]
    TOKENS_FOLLOWING_T__46_IN_mutation_statement_1417 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_mutation_statement_1419 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1428 = Set[ 47 ]
    TOKENS_FOLLOWING_T__47_IN_mutation_statement_1430 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_1432 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_mutation_statement_1434 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_mutation_statement_1443 = Set[ 48 ]
    TOKENS_FOLLOWING_T__48_IN_mutation_statement_1445 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_value_IN_mutation_statement_1447 = Set[ 36 ]
    TOKENS_FOLLOWING_T__36_IN_mutation_statement_1449 = Set[ 1 ]
    TOKENS_FOLLOWING_T__34_IN_set_value_1468 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_1476 = Set[ 35, 36 ]
    TOKENS_FOLLOWING_T__35_IN_set_value_1479 = Set[ 5, 6, 8, 9, 10, 34 ]
    TOKENS_FOLLOWING_set_item_IN_set_value_1481 = Set[ 35, 36 ]
    TOKENS_FOLLOWING_T__36_IN_set_value_1491 = Set[ 1 ]
    TOKENS_FOLLOWING_value_IN_set_item_1502 = Set[ 1 ]
    TOKENS_FOLLOWING_primitive_value_IN_value_1521 = Set[ 1 ]
    TOKENS_FOLLOWING_reference_IN_value_1530 = Set[ 1 ]
    TOKENS_FOLLOWING_set_value_IN_value_1539 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_primitive_value_1558 = Set[ 1 ]
    TOKENS_FOLLOWING_NUMBER_IN_primitive_value_1567 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_primitive_value_1576 = Set[ 1 ]
    TOKENS_FOLLOWING_MULTILINE_STRING_IN_primitive_value_1585 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_path_1600 = Set[ 1, 49 ]
    TOKENS_FOLLOWING_T__49_IN_path_1602 = Set[ 6 ]
    TOKENS_FOLLOWING_ID_IN_path_1603 = Set[ 1, 49 ]
    TOKENS_FOLLOWING_path_IN_reference_1620 = Set[ 1 ]
    TOKENS_FOLLOWING_T__50_IN_reference_type_1639 = Set[ 6 ]
    TOKENS_FOLLOWING_path_IN_reference_type_1641 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_not_equals_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_op_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_binary_comp_0 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end

