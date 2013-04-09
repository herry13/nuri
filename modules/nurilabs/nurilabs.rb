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
				if @state['installed']
					server_path = "#{config['install_path']}/server/server.js"
					cmd = "/usr/bin/forever list | /bin/grep #{server_path}"
					data = Nuri::Helper::Command.getoutput(cmd).to_s.split(" ")
					server_path = "\e[90m#{server_path}\e[39m"
					@state['running'] = (data[4] == server_path)
				end
=begin
				if config.has_key?('pid')
					cmd = "ps h #{config['pid']}"
					output = Nuri::Helper::Command.getoutput(cmd).strip
					@state['running'] = (output.length > 0)
				else
					@state['running'] = false
				end
=end

				@state['server'] = {}
				sconf_file = "#{config['install_path']}/server/config.json"
				if File.exist?(sconf_file)
					sconf = JSON.parse(File.read(sconf_file))
					@state['port'] = sconf['port'].to_i
					@state['ssl'] = sconf['ssl']
					@state['recaptcha_private_key'] = sconf['recaptcha_private_key']
					@state['server'] = sconf
				end

				file = "#{config['install_path']}/web/recaptcha_public_key.js"
				data = (File.exist?(file) ? File.read(file).split("\n") : "");
				data = data[0].to_s.split("=");
				if data.length > 1
					data = data[1].strip
					data = data.gsub(/;$/, '').strip
					@state['recaptcha_public_key'] = data[1, data.length-2]
				end

				return @state
			end

			def install
				return false if not Nuri::Helper::Repository.add('ppa:chris-lea/node.js')
				Nuri::Helper::Repository.update
				return false if not Nuri::Helper::Package.install('nodejs')

				config = self.read_config
				path = config['install_path']
				version = config['git_version']

				Dir::mkdir(path) if not File.exists?(path)
				Nuri::Helper::Command.exec("chmod 0755 #{path}")

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

				cmd = "cp #{path}/server/config-template.json #{path}/server/config.json"
				return false if not Nuri::Helper::Command.exec(cmd)

				cmd = "/usr/bin/npm -g install forever"
				return Nuri::Helper::Command.exec(cmd)
			end
		
			def uninstall
				config = self.read_config
				cmd = "sudo rm -rf #{config['install_path']}"
				return Nuri::Helper::Command.exec(cmd)
			end
		
			def start
				config = self.read_config

=begin
				server_path = "#{config['install_path']}/server/server.js"
				cmd = "/usr/bin/nohup /usr/bin/node #{server_path} " +
				      " 1>/tmp/nohup_nurilabs 2>/tmp/nohup_nurilabs &"
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
=end
				server_path = "#{config['install_path']}/server/server.js"
				cmd = "/usr/bin/forever start #{server_path}"
				return Nuri::Helper::Command.exec(cmd)
			end
		
			def stop
				config = self.read_config
				#if config.has_key?('pid')
				#	cmd = "sudo kill -9 #{config['pid']}"
				#	return false if not Nuri::Helper::Command.exec(cmd)
				#	config.delete('pid')
				#end
				#true
				server_path = "#{config['install_path']}/server/server.js"
				cmd = "/usr/bin/forever stop #{server_path}"
				return Nuri::Helper::Command.exec(cmd)
			end
		
			def set_port(params={})
				return false if not params.has_key?('target')
				return self.set_server_config('port', params['target'].to_i)
			end

			def enable_ssl
				return self.set_server_config('ssl', true)
			end

			def disable_ssl
				return self.set_server_config('ssl', false)
			end

			def set_recaptcha_public_key(params={})
				config = self.read_config
				return false if not File.exist?("#{config['install_path']}/web")
				file = "#{config['install_path']}/web/recaptcha_public_key.js"
				data = "var recaptcha_public_key = \"#{params['key']}\";"
				begin
					File.open(file, 'w') { |f| f.write(data) }
				rescue
					return false
				end
				true
			end

			def set_recaptcha_private_key(params={})
				return self.set_server_config('recaptcha_private_key', params['key'])
			end

			def set_install_path(params={})
				config = self.read_config
				config['install_path'] = params['path']
				self.save_config(config)
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
