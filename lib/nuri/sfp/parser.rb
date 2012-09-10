module Nuri
	module Sfp
		# main class which processes configuration description in SFP language either
		# in file or as a string
		class Parser
			attr_accessor :root, :root_dir

			# Parse SFP file and return its JSON representation
			def self.file_to_sfp(file)
				parser = Parser.new
				parser.parse_file(file)
				return parser.to_sfp
			end

			def self.to_sfp(string)
				parser = Parser.new
				parser.parse(string)
				return parser.to_sfp
			end

			def initialize(root_dir=nil)
				@root_dir = root_dir.to_s
			end

			# parse SFP file
			def parse_file(file)
				f = File.open(file, 'rb')
				lexer = SFP::Lexer.new(f)
				tokens = ANTLR3::CommonTokenStream.new(lexer)
				parser = SFP::Parser.new(tokens)
				parser.root_dir = (@root_dir == nil or @root_dir == '' ?
						File.expand_path('.') : @root_dir)
				parser.home_dir = File.dirname(f.path)
				parser.sfp
				@root = parser.root
				@parser_arrays = parser.arrays
			end

			# parse SFP in a string
			def parse(text)
				lexer = SFP::Lexer.new(text)
				tokens = ANTLR3::CommonTokenStream.new(lexer)
				parser = SFP::Parser.new(tokens)
				parser.root_dir = (@root_dir == nil or @root_dir == '' ?
						File.expand_path(File.dirname('.')) : @root_dir)
				parser.home_dir = parser.root_dir
				parser.sfp
				@root = parser.root
				@parser_arrays = parser.arrays
			end

			# dump the parsed specification into standard output
			def dump(root=nil)
				return if root == nil
				root = Nuri::Sfp.deep_clone(@root)
				root.accept(ParentEliminator.new)
				puts JSON.pretty_generate(root)
			end

			def self.dump(root)
				return if root == nil
				root.accept(ParentEliminator.new)
				puts JSON.pretty_generate(root)
			end

			def to_sfp
				@root
			end

			def to_json
				root = self.to_sfp
				return if root == nil
				root = Nuri::Sfp.deep_clone(root)
				return Nuri::Sfp.to_json(root)
			end

			# enable this class to process SFP into FDR (SAS+)
			include Nuri::Sfp::Sas
		end

		def self.to_json(sfp)
			root = Nuri::Sfp.deep_clone(sfp)
			root.accept(Nuri::Sfp::ParentEliminator.new)
			return JSON.generate(root)
		end

		def self.to_pretty_json(sfp)
			root = Nuri::Sfp.deep_clone(sfp)
			root.accept(Nuri::Sfp::ParentEliminator.new)
			return JSON.pretty_generate(root)
		end

		def self.deep_clone(value)
			if value.is_a?(Hash)
				result = value.clone
				value.each do |k,v|
					next if k == '_parent'
					result[k] = Nuri::Sfp.deep_clone(v)
					result[k]['_parent'] = result if result[k].is_a?(Hash) and
							result[k].has_key?('_parent')
				end
				result
			elsif value.is_a?(Array)
				result = Array.new
				value.each { |v| result << Nuri::Sfp.deep_clone(v) }
				result
			else
				value
			end
		end

	end
end
