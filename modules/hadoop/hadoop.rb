require 'rubygems'
require 'json'

module Nuri
	module Module
		class Hadoop
			include Nuri::Resource

			def initialize
				self.register('Hadoop', 'hadoop')
			end

			# get state of this component in JSON
			def update_state
				self.reset

				config['installed'] = Nuri::Helper::Package.installed?('hadoop')
=begin
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
				if File.exist?(sconf_file)
					sconf = JSON.parse(File.read(sconf_file))
					@state['port'] = sconf['port'].to_i
					@state['server'] = sconf
				end
=end

				return @state
			end

			def install
				Nuri::Helper::Package.install('python-software-properties') if
					not Nuri::Helper::Package.installed?('python-software-properties')
				Nuri::Helper::Repository.add('ppa:hadoop-ubuntu/stable')
				Nuri::Helper::Package.install('hadoop')
				true
			end
		
			def uninstall
				return Nuri::Helper::Package.uninstall('hadoop')
			end
		
			def start
=begin
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
=end
				true
			end
		
			def stop
=begin
				config = self.read_config
				if config.has_key?('pid')
					cmd = "sudo kill -9 #{config['pid']}"
					return false if not Nuri::Helper::Command.exec(cmd)
					config.delete('pid')
				end
=end
				true
			end
		
			protected
			def set_server_config(key, value)
				config = self.read_config
				config_file = config['install_path'] + '/server/config.json'
				if File.exists?(config_file)
					data = JSON.parse(File.read(config_file))
					data[key] = value
					File.open(config_file, 'w') { |f| f.write(JSON.pretty_generate(data)) }
					return true
				end
				false
			end

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
