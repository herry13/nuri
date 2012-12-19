require 'base64'
require 'pp'
require 'webrick'

module Nuri
	module Client
		class Daemon
			include Nuri::Config

			attr_accessor :master_keys

			def initialize
				@master_keys = {}
				self.load
			end

			def trusted_address(requester)
				return false if not @config.has_key?('trusted')
				if not @config['trusted'].is_a?(Array)
					return (@config['trusted'] == requester)
				else
					@config['trusted'].each { |addr| return true if addr == requester }
				end
				false
			end

			def process_request(request, stream)
				if not self.trusted_address(stream.socket.peeraddr[2])
					Nuri::Util.warn "Untrusted request from host ..."
					[403, {}, ['']]
				else
					Nuri::Client::Agent.new(self, request, stream).serve_request
				end
			end

			def stop
				begin
					pid_file = Nuri::Util.home_dir + '/var/nuri.pid'
					return if not File.exist?(pid_file)
					pid = File.read(pid_file).to_i
					Process.kill('INT', pid)
					Nuri::Util.log 'Stopped Nuri client daemon'
				rescue Exception => e
					Nuri::Util.log 'Cannot stop Nuri client: ' + e.to_s
					return false
				end
				return true
			end

			def start(address=nil, port=nil, daemon=false)
				if address == nil
					address = @config['host'] if @config['host'] != '' and
							@config['host'] != '0.0.0.0'
					address = '0.0.0.0' if address == nil
				end
				port = @config['port'].to_i if port == nil

				begin
					server_type = (daemon ? WEBrick::Daemon : WEBrick::SimpleServer)
					pid_file = Nuri::Util.home_dir + '/var/nuri.pid'
					@server = WEBrick::HTTPServer.new(:Host => address,
					                                  :Port => port,
					                                  :ServerType => server_type)
					@server.mount("/", Agent, self)

					['INT', 'TERM'].each do |signal|
						trap(signal) do
							@server.shutdown
							File.delete(pid_file) if File.exist?(pid_file)
						end
					end

					fork do
						Nuri::Util.log "Start Nuri client on port #{port}"
						if daemon
							data = `ps x | grep "nuri.rb client" | grep -v grep | awk '{print $1}'`.split("\n")
							if data.length > 0
								pid = data[1].to_i
								Nuri::Util.log "Nuri client daemon is running with PID ##{pid}"
								f = File.open(pid_file, 'w')
								f.write(pid)
								f.close
							end
						end
					end

					@server.start

				rescue Interrupt
					Nuri::Util.log 'Exiting.'
				rescue Exception => e
					Nuri::Util.log 'Client Daemon error: ' + e.to_s
					return false
				end
				return true
			end

			def get_state(path=nil)
				path.gsub!(/\//, '.') if path != nil
				return @root.get_state(path)
			end

			def get_public_key
				return Nuri::SSL.get_public_key
			end
		end

		class Agent < WEBrick::HTTPServlet::AbstractServlet
			def initialize(server, daemon)
				@daemon = daemon
			end

			def do_GET(request, response)
				path = request.path
				path.chop! if path[path.length-1,1] == '/'
				if path[0,6] == '/state'
					status, content_type, body = self.get_state(:path => path)
				else
					status = 400
					content_type = body = ''
				end
				response.status = status
				response['Content-Type'] = content_type
				response.body = body
			end

			def do_POST(request, response)
				#pp request.query
				path = request.path
				path.chop! if path[path.length-1,1] == '/'
				if path == '/system'
					status, content_type, body = self.set_system_information(request.query)
				else
					status = 400
					content_type = body = ''
				end
				response.status = status
				response['Content-Type'] = content_type
				response.body = body
			end

			def do_PUT(request, response)
				path = request.path
				path.chop! if path[path.length-1,1] == '/'
				if path == '/exec'
					status, content_type, body = self.execute_action(request.query)
				elsif path == '/bsig'
					status, content_type, body = self.save_bsig(request.query)
				elsif path == '/bsig/activate'
					status, content_type, body = self.activate_bsig(request.query)
				else
					status = 400
					content_type = body = ''
				end
				response.status = status
				response['Content-Type'] = content_type
				response.body = body
			end

			def deactivate_bsig(current_id)
				# 1) stopped thread which deploys BSig model -- TODO

				# 2) list old-BSig models and delete them
				dir = Nuri::Util.home_dir + '/var'
				Dir.entries(dir).each do |fname|
					head, id = fname.split('_')
					next if head != 'bsig' or id.to_i >= current_id.to_i
					File.delete("#{dir}/#{fname}")
				end
			end

			def activate_bsig(data)
				begin
					bsig = JSON[data['json']]
					bsig_id = bsig['id']

					# 1) deactivate old-bsig
					self.deactivate_bsig(bsig_id)

					# 2) save current BSig's ID
					bsig_id_file = Nuri::Util.home_dir + '/var/bsig_id'
					f = File.open(bsig_id_file, 'w')
					f.write(bsig_id)
					f.close

					# 3) load and deploy BSig -- TODO
				rescue Exception => e
					Nuri::Util.log 'Failed to activate BSig: ' + e.to_s
					return 500, '', ''
				end
				return 200, '', ''
			end

			def save_bsig(data)
				begin
					bsig = JSON[data['json']]
					bsig_file = Nuri::Util.home_dir + '/var/bsig_' + bsig['id'].to_s
					local = (File.exist?(bsig_file) ? JSON[File.read(bsig_file)] : {'rules' => [], 'goal' => {}})
					local['rules'] << bsig['rule'] if bsig.has_key?('rule')
					bsig['rules'].each { |r| local['rules'] << r } if bsig.has_key?('rules')
					bsig['goal'].each { |k,v| local['goal'][k] = v } if bsig.has_key?('goal')
					f = File.open(bsig_file, 'w')
					f.write(JSON.generate(local))
					f.close
				rescue Exception => e
					Nuri::Util.log 'Failed to save BSig: ' + e.to_s
					return 500, '', ''
				end
				return 200, '', ''
			end

			def execute_action(data)
				def clean_parameters(params)
					p = {}
					params.each { |k,v|
						p[k[2,k.length-2]] =	params[k]
					}
					return p
				end

				Nuri::Util.log "executing: #{data['json']}..."
				data = JSON[data['json']]
				cmd = data['action']
				Nuri::Util.set_system_information(data['system'])

				params = clean_parameters(cmd['parameters'])
				puts "exec: " + cmd['name'] + " (" + params.inspect + ')'
				comp_name, cmd_name = cmd['name'].pop_ref
				component = @daemon.root.get(comp_name)
				success = false
				if component != nil
					begin
						if params.size <= 0
							success = component.send(cmd_name)
						else
							success = component.send(cmd_name, params)
						end
						
						component.get_self_state if success
						puts "exec: OK"
					rescue Exception => e
						puts "exec: Failed"
						Nuri::Util.log 'exec: Failed -- cannot execute procedure: ' + json
						return 500, '', ''
					end
				else
					Nuri::Util.log 'exec: Failed -- cannot find procedure: ' + procedure
					return 503, '', ''
				end

				if success
					Nuri::Util.log "exec: OK"
					return 200, '', ''
				else
					Nuri::Util.log "exec: Failed"
					return 500, '', ''
				end
				return success
			end

			def get_state(options={})
				if not options.has_key?(:path)
					state = @daemon.get_state
				else
					_, _, path = options[:path].split('/', 3)
					state = @daemon.get_state(path)
				end

				if state.is_a?(Nuri::Undefined)
					return 404, '', ''
				else
					data = Nuri::Sfp.to_json({'value' => state})
					return 200, 'application/json', data
				end
			end

			def set_system_information(data)
				begin
					system = JSON[data['json']]
					Nuri::Util.set_system_information(system)
					Nuri::Util.log 'system information updated'
					return 200, '', ''
				rescue
					return 404, '', ''
				end
			end
		end

		@@daemon = nil

		def self.start(daemon=false)
			if @@daemon == nil
				@@daemon = Nuri::Client::Daemon.new
				@@daemon.start(nil, nil, daemon)
			end
		end

		def self.stop
			@@daemon = Nuri::Client::Daemon.new
			@@daemon.stop
		end

	end
end
