require 'rubygems'
require 'json'

module Nuri
	module Module
		class Nurilabs
			include Nuri::Resource

			def initialize
				self.register('Nurilabs', 'nurilabs')
			end

			# get state of this component in JSON
			def update_state
				self.reset
				config = self.read_config
				config.each { |k,v| @state[k] = v if @state.has_key?(k) }

				@state['installed'] = File.exists?("#{config['install_path']}/server/server.js")

				if config.has_key?('pid')
					cmd = "ps h #{config['pid']}"
					output = Nuri::Helper::Command.getoutput(cmd).strip
					@state['running'] = (output.length > 0)
				else
					@state['running'] = false
				end

				sconf_file = "#{config['install_path']}/server/config.json"
				sconf = JSON.parse(File.read(sconf_file))
				@state['port'] = sconf['port'].to_i

				return @state
			end

			def install
				config = self.read_config
				path = config['install_path']
				version = config['git_version']

				Dir::mkdir(path) if not File.exists?(path)

				Nuri::Helper::Package.install('wget')
				download_url = "https://github.com/herry13/nurilabs/tarball/#{version}"
				cmd = "cd #{path}; /usr/bin/wget -O nurilabs.tgz #{download_url}"
				return false if not Nuri::Helper::Command.exec(cmd)

				cmd = "cd #{path}; tar xvzf nurilabs.tgz 1>/dev/null 2>/dev/null; rm -f nurilabs.tgz"
				return false if not Nuri::Helper::Command.exec(cmd)

				cmd = "cd #{path}; /bin/ls | grep 'herry13-nurilabs'"
				dir = Nuri::Helper::Command.getoutput(cmd).strip

				cmd = "cd #{path}; mv #{dir}/* . 2>/dev/null; mv #{dir}/.* . 2>/dev/null; rm -rf #{dir}"
				return false if not Nuri::Helper::Command.exec(cmd)

				#cmd = "cd #{path}; sudo npm list | grep forever@"
				#result = Nuri::Helper::Command.getoutput(cmd).strip
				#if result.length <= 0
				#	cmd = "sudo npm install forever"
				#	return false if not Nuri::Helper::Command.exec(cmd)
				#end

				true
			end
		
			def uninstall
				config = self.read_config
				cmd = "sudo rm -rf #{config['install_path']}"
				return Nuri::Helper::Command.exec(cmd)
			end
		
			def start
				config = self.read_config

				server_path = "#{config['install_path']}/server/server.js"
				cmd = "/usr/bin/nohup /usr/bin/node #{server_path} 1>/tmp/nohup_nurilabs 2>/tmp/nohup_nurilabs &"
				return false if not Nuri::Helper::Command.exec(cmd)

				pid_file = "#{config['install_path']}/server/pid"
				counter = 0
				begin
					sleep(1)
					counter += 1
				end until File.exists?(pid_file) or counter > 10
				return false if not File.exists?(pid_file)
				config['pid'] = File.read(pid_file).to_i

				self.save_config(config)

				File.delete(pid_file)

				true
			end
		
			def stop
				config = self.read_config
				if config.has_key?('pid')
					cmd = "sudo kill -9 #{config['pid']}"
					return false if not Nuri::Helper::Command.exec(cmd)
					config.delete('pid')
				end
				true
			end
		
			def set_port(params={})
				config = self.read_config
				config_file = config['install_path'] + '/server/config.json'
				if File.exists?(config_file)
					data = JSON.parse(File.read(config_file))
					data['port'] = params['port'].to_i
					File.open(config_file, 'w') { |f| f.write(JSON.pretty_generate(data)) }
					return true
				end
				false
			end

			def set_install_path(params={})
				config = self.read_config
				config['install_path'] = params['path']
				self.save_config(config)
				true
			end

			protected
			ConfigFile = File.expand_path(File.dirname(__FILE__)) + '/config.json'
			def read_config
				return JSON.parse(File.read(ConfigFile)) if File.exists?(ConfigFile)
				return {'install_path' => '/opt/nurilabs', 'port' => 8080, 'git_version' => 'master'}
			end

			def save_config(config)
				File.open(ConfigFile, 'w') { |f| f.write(JSON.generate(config)) }
			end
		end
	end
end
