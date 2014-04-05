require 'etc'
require 'fileutils'
require 'digest/sha1'

class Sfp::Module::File
	include ::Sfp::Resource

	##############################
	#
	# method to update current state
	#
	##############################

	def update_state
		path = @model['path'].to_s.strip

		if not exist? or type? != @model['type'] or target? != content?
			create if del
		end

		@state['path'] = path
		@state['exists'] = exist?
		@state['type'] = type?
		@state['content'] = content?
		@state['user'], @state['group'] = user_group?
		@state['permission'] = permission?
	end

	##############################
	#
	# Helper methods
	#
	##############################

	protected

	def del(p={})
		return true if not exist?

		file = @model['path']
		if ::File.file?(file)
			::File.delete(file)
		elsif ::File.directory?(file) and file != '/'
			shell "rm -rf #{file}"
		end
		not exist?
	end

	def create(p={})
		return true if exist?
		file = @model['path']
		if @model['type'] == 'file'
			not set_content(file) or
			not set_owner(file) or
			not set_permission(file)
		elsif @model['type'] == 'directory'
			Dir.mkdir(file)
		end
		exist?
	end

	def exist?
		::File.exist?(@model['path'])
	end

	def type?
		if exist?
			(::File.file?(@model['path']) ? 'file' : 'directory')
		else
			''
		end
	end

	def set_content(file)
		if @model['type'] == 'directory'
			shell "mkdir #{@model['path']}"
		else
			begin
				File.open(file, 'w') { |f| f.write(@model['content'].to_s) } if content? != target?
				return true
			rescue Exception => e
				log.error "#{e}\n#{e.backtrace.join("\n")}"
			end
			false
		end
	end

	def set_owner(file)
		return true if not ::File.exist?(file)
		return true if not @model['user'].is_a?(String)
		return true if not @model['group'].is_a?(String)
		!!system("chown #{@model['user']}:#{@model['group']} #{file}")
	end

	def set_permission(file)
		return if not ::File.exist?(file) or not @model['permission'].is_a?(String)
		!!system("chmod #{model['permission']} #{file}") if @model['permission'] != permission?
		true
	end

	def content?
		(::File.file?(@model['path']) ? Digest::SHA1.hexdigest(::File.read(@model['path'])) : '')
	end

	def target?
		Digest::SHA1.hexdigest(@model['content'].to_s)
	end

	def user_group?
		if ::File.exist?(@model['path'])
			stat = ::File.stat(@model['path'])
			[Etc.getpwuid(stat.uid).name, Etc.getgrgid(stat.gid).name]
		else
			['', '']
		end
	end

	def permission?
		(::File.exist?(@model['path']) ? sprintf("%o", ::File.stat(@model['path']).mode) : '')
	end

end
