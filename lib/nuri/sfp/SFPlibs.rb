module Nuri
	module Sfp
		module Sfplibs
			attr_accessor :root_dir, :home_dir
			attr_reader :root, :used_classes, :arrays

			def init
				@root = Hash.new
				@now = @root
				@id = 0
				@root['Object'] = { '_self' => 'Object', '_context' => 'class', '_parent' => @root }
				@unexpanded_classes = Array.new
				@used_classes = Array.new
				@arrays = Hash.new
			end

			def next_id
				nid = "c" + @id.to_s
				@id += 1
				return nid
			end
		
			def null_value(isa=nil)
				return { '_context' => 'null', '_isa' => isa }
			end
		
			def to_ref(path)
				first, rest = path.split('.', 2)
				return path if first == 'parent'
				return "$." + path
			end
		
			def to_sfp
				return @root
			end
	
			def create_constraint(name, type='and')
				return { '_self' => name,
					'_context' => 'constraint',
					'_type' => type,
					'_parent' => @now
				}
			end

			def process_file(file)
				filepath = file
				filepath = @root_dir + "/" + file if @root_dir != nil and file[0,1] != '/'
				filepath = @home_dir + "/" + file if not File.exist?(filepath)
				raise Exception, 'File not found: ' + file if not File.exist?(filepath)
				data = Nuri::Sfp::Parser.file_to_sfp(filepath)
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

			def self.expand_object(obj, root)
				return false if obj == nil or root == nil or
						not obj.has_key?('_isa') or obj['_isa'] == nil
				objclass = root.at?(obj['_isa'])
				raise Exception, 'Super class is not found: ' + obj['_self'] + ' < ' + obj['_isa'] if objclass == nil
				obj.inherits( objclass )
				obj['_classes'] = (objclass.has_key?('_super') ? objclass['_super'].clone : Array.new)
				obj['_classes'] << obj['_isa']
				return true
			end

			def expand_object(obj)
				return false if not Nuri::Sfp::Sfplibs.expand_object(obj, @root)
				@used_classes = @used_classes.concat(obj['_classes']).uniq
			end

			def deep_clone(value)
				if value.is_a?(Hash)
					result = value.clone
					value.each { |k,v|
						if k != '_parent'
							result[k] = deep_clone(v)
							result[k]['_parent'] = result if result[k].is_a?(Hash) and result[k].has_key?('_parent')
						end
					}
					result
				elsif value.is_a?(Array)
					result = Array.new
					value.each { |v| result << deep_clone(v) }
					result
				else
					value
				end
			end

		end
	end
end
