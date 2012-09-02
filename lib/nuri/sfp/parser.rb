module Nuri
	module Sfp
		# main class which processes configuration description in SFP language either
		# in file or as a string
		class Parser
			# Parse SFP file and return its JSON representation
			def self.file_to_json(file)
				parser = Parser.new
				parser.parse_file(file)
				return parser.to_json
			end

			def initialize
				@parser = nil
			end

			# parse SFP file
			def parse_file(file)
				f = File.open(file, 'rb')
				lexer = SFP::Lexer.new(f)
				tokens = ANTLR3::CommonTokenStream.new(lexer)
				@parser = SFP::Parser.new(tokens)
				@parser.root_dir = Nuri::Util.rootdir
				@parser.home_dir = File.dirname(f.path)
				@parser.sfp
			end

			# parse SFP in a string
			def parse(text)
				lexer = SFP::Lexer.new(text)
				tokens = ANTLR3::CommonTokenStream.new(lexer)
				@parser = SFP::Parser.new(tokens)
				@parser.root_dir = Nuri::Util.rootdir
				@parser.home_dir = @parser.root_dir
				@parser.sfp
			end

			# dump the parsed specification into standard output
			def dump(root=nil)
				return if root == nil and @parser == nil
				root = @parser.root.clone if root == nil
				root.accept(ParentEliminator.new)
				puts JSON.pretty_generate(root)
				puts @parser.used_classes.inspect
			end

			def self.dump(root)
				return if root == nil
				root.accept(ParentEliminator.new)
				puts JSON.pretty_generate(root)
			end

			# return JSON representation of SFP description
			def to_json
				return nil if @parser == nil
				return @parser.to_json
			end

			# enable this class to process SFP into FDR (SAS+)
			include Nuri::Sfp::Sas
		end
	end
end
