require 'rubygems'

module Nuri
	module Module
		class Tikiwiki

			include Nuri::Resource

			ConfigDir = '/var/lib/tikiwiki'
			ConfigFile = '/var/lib/tikiwiki/path'

			def initialize
				self.register('Tikiwiki', 'tikiwiki')
			end
	
			# get state of this component in JSON
			def get_self_state
				@state['installed'] = File.directory?(ConfigDir)

				@state['path'] = ""
				@state['version'] = ""
				if @state['installed'] and File.file?(ConfigFile)
					File.open(ConfigFile) do |f|
						f.split("\n").each { |k,v| @state[k] = v }
					end
				end
puts 'state: ' + @state.keys.inspect
				return @state
			end
	
			def install(params={})
				# TODO
puts 'install tikiwiki'
				puts self.get('webserver.document_root').inspect
puts self.get('database').inspect
				#puts self.get('database').inspect

				false
			end
		
			def uninstall(params={})
				# TODO
				false
			end
		
			def change_path(params={})
				false
			end
		
			def upgrade(params={})
				false
			end
		end
	end
end
