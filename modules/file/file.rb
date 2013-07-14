require 'etc'
require 'fileutils'

module Sfp::Module
	class File
		include Sfp::Resource

		def update_state
begin
			path = @model['path'].to_s
			fullpath = ::File.expand_path(path)
			@state['path'] = path
			@state['created'] = ::File.exist?(fullpath)
			@state['content'] = (@state['created'] ? ::File.read(fullpath) : '')

			if @state['created']
				stat = ::File.stat(fullpath)
				@state['user'] = Etc.getpwuid(stat.uid).name if @model['user'] != ''
				@state['group'] = Etc.getgrgid(stat.gid).name if @model['group'] != ''
			else
				@state['user'] = @state['group'] = ''
			end
rescue Exception => e
				Sfp::Agent.logger.error "Error in updating state #{@state['path']} #{e}\n#{e.backtrace.join("\n")}"
end
		end

		def create(p={})
			begin
				::File.open(File.expand_path(@state['path']), 'w') { |f| f.write(p['content']) }
				return true
			rescue Exception => e
				Sfp::Agent.logger.error "Error in creating file #{@state['path']} #{e}\n#{e.backtrace.join("\n")}"
			end
			false
		end

		def remove(p={})
			begin
				::File.delete(@state['path'])
				return true
			rescue Exception => e
				Sfp::Agent.logger.error "Error in removing file #{@state['path']} #{e}\n#{e.backtrace.join("\n")}"
			end
			false
		end

		def set_ownership(p={})
			begin
				user = (p['user'] == '' ? nil : p['user'])
				group = (p['group'] == '' ? nil : p['group'])
				::FileUtils.chown user, group, @state['path']
				return true
			rescue Exception => e
				Sfp::Agent.logger.error "Error in setting ownership of file #{@state['path']} #{e}\n#{e.backtrace.join("\n")}"
			end
			false
		end
	end
end
