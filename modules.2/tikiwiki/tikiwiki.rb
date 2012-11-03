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
				#@state['webserver'] = nil
				#@state['database'] = nil
				if @state['installed'] and File.file?(ConfigFile)
					File.open(ConfigFile) do |f|
						f.split("\n").each { |k,v| @state[k] = v }
					end
				end

				return @state
			end
	
			def install
				# TODO
puts 'install'
puts self.root.inspect
				#puts self.get('webserver').inspect
				#puts self.get('webserver.document_root').inspect
				#puts self.get('database').inspect

				false
			end
		
			def uninstall
				# TODO
				false
			end
		
			def change_path
				false
			end
		
			def upgrade
				false
			end
		end
	end
end
