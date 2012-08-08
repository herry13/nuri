module Nuri
	module Sfp
		module Sfplibs
			def next_id
				++@id
				return "c" + @id.to_s
			end
		
			def null_value(isa=nil)
				return { '_context' => 'null', '_isa' => isa }
			end
		
			def to_ref(path)
				return "$." + path
			end
		
			def to_json
				return @root
			end
		
			def process_file(file)
				file = @rootdir + "/" + file if @rootdir != nil and file[0,1] != '/'
				data = Nuri::Sfp::Parser.file_to_json(file)
				data.each_pair { |key,val|
					if val['_context'] == 'class' or val['_context'] == 'composite'
						@root[key] = val
					elsif val['_context'] == 'state' or val['_context'] == 'constraint'
						if @root.has_key?(key)
							if @root[key]['_context'] != val['_context']
								@root[key] = val
							else
								val['_context'].each_pair { |k2,v2| @root[key][k2] = v2 }
							end
						else
							@root[key] = val
						end
					end
				}
			end
		
			def goto_parent(remove_parent=false)
				n = @now
				@now = @now['_parent']
				n.delete('_parent') if remove_parent
				return n
			end
		end
	end
end
