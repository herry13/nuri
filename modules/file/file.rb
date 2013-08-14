require 'etc'
require 'fileutils'

module Sfp::Module
	class File
		include Sfp::Resource

		def update_state
			path = @model['path'].to_s
			fullpath = ::File.expand_path(path)
			@state['path'] = path

			if ::File.exist?(fullpath)
				@state['exists'] = true
				@state['content'] = ::File.read(fullpath)
				stat = ::File.stat(fullpath)
				@state['user'] = Etc.getpwuid(stat.uid).name if @model['user'] != ''
				@state['group'] = Etc.getgrgid(stat.gid).name if @model['group'] != ''
			else
				@state['exists'] = false
				@state.delete('user') if @state.has_key?('user')
				@state.delete('group') if @state.has_key?('group')
				@state.delete('content') if @state.has_key?('content')
			end

=begin
			@state['exists'] = ::File.exist?(fullpath)
			@state['content'] = (@state['exists'] ? ::File.read(fullpath) : '')

			if @state['exists']
			else
				@state['user'] = @state['group'] = ''
			end
=end
		end

		def create(p={})
			begin
				::File.open(::File.expand_path(@state['path']), 'w') { |f| f.write(p['content']) }
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
