module Nuri
	module Sfp
		module Sfplibs
			attr_accessor :rootdir
			attr_reader :root, :used_classes

			def init
				@root = Hash.new
				@now = @root
				@id = 0
				@root['Object'] = { '_self' => 'Object', '_context' => 'class', '_parent' => @root }
				@unexpanded_classes = Array.new
				@used_classes = Array.new
			end

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

			def expand_classes
				@unexpanded_classes.each { |c|
					sclass = @root.at?(c['_extends'])
					c.inherits( sclass )
					c['_super'] = (sclass.has_key?('_super') ? sclass['_super'].clone : Array.new)
					c['_super'] << c['_extends']
				}
			end

			def expand_object(obj)
				return if not obj.has_key?('_isa') or obj['_isa'] == nil
				objclass = @root.at?(obj['_isa'])
				obj.inherits( objclass )
				obj['_classes'] = (objclass.has_key?('_super') ? objclass['_super'].clone : Array.new)
				obj['_classes'] << obj['_isa']
				@used_classes = @used_classes.concat(obj['_classes']).uniq
			end
		end
	end
end
