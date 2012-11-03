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
				if File.file?(ConfigFile)
					config = read_config
					config.each { |k,v| @state[k] = v }
				end

				return @state
			end

			def read_config
				config = {}
				File.open(ConfigFile) do |f|
					f.read.split("\n").each { |line|
						key, value = line.split('=', 2)
						config[key] = value
					}
				end if File.file?(ConfigFile)
				config
			end

			def write_config(config={})
				Dir.mkdir(ConfigDir) if not File.directory?(ConfigDir)
				File.open(ConfigFile, 'w') do |f|
					config.each { |k,v| f.write(k + '=' + v + "\n") }
				end
			end
	
			def install(params={})
				# TODO
puts 'install tikiwiki'
puts self.get('webserver.document_root').inspect
puts self.get('database').inspect

				false
			end
		
			def uninstall(params={})
				# TODO
				false
			end

			def set_webserver(params={})
				config = read_config
				config['ws'] = params['ws']
				write_config(config)
				true
			end

			def set_database(params={})
				config = read_config
				config['db'] = params['db']
				write_config(config)
				true
			end
		
			def set_path(params={})
				false
			end
		
			def upgrade(params={})
				false
			end
		end
	end
end
