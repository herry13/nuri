require 'etc'
require 'fileutils'
require 'digest/sha1'

class Sfp::Module::File
	include ::Sfp::Resource

	##############################
	#
	# update current state method
	#
	##############################

	def update_state
		path = @model['path'].to_s.strip
		if @model['exists']
			create(path)
		else
			delete(path)
		end

		@state['path'] = path
		@state['exists'] = ::File.exist?(path)
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

	def delete(file)
		::File.delete(file) if ::File.exist?(file)
	end

	def create(file)
		log.warn "Failed to create/update file #{file}!" if
			not set_content(file) or
			not set_owner(file) or
			not set_permission(file)
	end

	def set_content(file)
		return true if not @model['content'].is_a?(String)
		begin
			current = (::File.exist?(file) ? content? : nil)
			desired = Digest::SHA1.hexdigest(@model['content'])
			File.open(file, 'w') { |f| f.write(@model['content']) } if current != desired
			return true
		rescue Exception => e
			log.error "#{e}\n#{e.backtrace.join("\n")}"
		end
		false
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
		(::File.exist?(@model['path']) ? Digest::SHA1.hexdigest(::File.read(@model['path'])) : '')
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
