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

			def start(address=nil, port=nil)
				if address == nil
					address = @config['host'] if @config['host'] != '' and
							@config['host'] != '0.0.0.0'
					address = '0.0.0.0' if address == nil
				end
				port = @config['port'].to_i if port == nil

				begin
					@server = WEBrick::HTTPServer.new(:Host => address, :Port => port)
					@server.mount("/", Agent, self)
					trap("INT") { @server.shutdown }
					@server.start
					Nuri::Util.log 'Start Nuri Client on port: ' + port.to_s
				rescue Interrupt
					Nuri::Util.log 'Exiting.'
				rescue Exception => e
					Nuri::Util.log 'Client Daemon error: ' + e.to_s #backtrace.inspect
				end
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
				# TODO -- POST data has been parsed by WEBrick
				begin
					#system = JSON[data]
					#Nuri::Util.set_system_information(system)
					return 200, '', ''
					Nuri::Util.log 'system information updated'
				rescue
					return 404, '', ''
				end
			end

		end

		# DEPRECATED
		class Agent2
			def initialize(daemon, request, response)
				@daemon = daemon
				@request = request
				@response = response
			end

			def serve
				def check_uri(uri, value)
					parts = uri.split('/')
					return (parts.length >= 2 and parts[1] == value)
				end

				if @request.params['REQUEST_METHOD'] == 'GET'
					if check_uri(@request.params['REQUEST_URI'], 'state')
						self.http_get_state(@request.params['REQUEST_URI'])
					elsif @request.params['REQUEST_URI'] == '/status/secure'
						self.secure_connection
					elsif @request.params['REQUEST_URI'] == '/status/public_key'
						self.get_public_key
					end

				elsif @request.params['REQUEST_METHOD'] == 'POST'
					if check_uri(@request.params['REQUEST_URI'], 'system')
						self.process_system_information
					elsif @request.params['REQUEST_URI'] == '/status/master'
						self.receive_master_key
					end

				elsif @request.params['REQUEST_METHOD'] == 'PUT'
					if check_uri(@request.params['REQUEST_URI'], 'exec')
						self.execute(@request.body.read.to_s)
					end

				end
			end

			def receive_master_key
				requester = Nuri::Util.domainname(@request.params['REMOTE_ADDR'])
				data = JSON[@request.body.read]
				key = Nuri::SSL.get_private_key
				pass_phrase = key.private_decrypt( Base64.decode64(data['data1']) )
				salt = key.private_decrypt( Base64.decode64(data['data2']) )
				decrypter = OpenSSL::Cipher::Cipher.new 'AES-128-CBC'
				decrypter.decrypt
				decrypter.pkcs5_keyivgen pass_phrase, salt
				master_key = decrypter.update Base64.decode64(data['data3'])
				master_key << decrypter.final
				@daemon.master_keys[requester] = master_key
				@response.start(200) { |head,out| out.write('') }
			end

			def get_public_key
				pub_key = @daemon.get_public_key
				@response.start(200) { |head,out| out.write(pub_key.to_pem) }
			end

			def secure_connection
				requester = Nuri::Util.domainname(@request.params['REMOTE_ADDR'])
				if @daemon.master_keys.has_key?(requester)
					@response.start(200) { |head,out| out.write('') }
				else
					@response.start(404) { |head,out| out.write('') }
				end
			end

			def process_system_information
				data = @request.body.read.to_s
				system = JSON[data]
				Nuri::Util.set_system_information(system)
				@response.start(200) { |head,out| out.write('') }
				Nuri::Util.log 'system information updated'
			end

			def execute(json)
				def clean_parameters(params)
					p = {}
					params.each { |k,v|
						p[k[2,k.length-2]] =	params[k]
					}
					return p
				end

				Nuri::Util.log "executing: #{json}..."
				data = JSON[json]
				cmd = data['action']
				Nuri::Util.set_system_information(data['system'])

				params = clean_parameters(cmd['parameters'])
puts "exec: " + cmd['name'] + ": " + params.inspect + '...'
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
puts "...OK"
					rescue Exception => e
puts "..Failed"
						Nuri::Util.log 'Cannot execute procedure: ' + json
						@response.start(500) { |head,out| out.write('') }
					end
				else
					Nuri::Util.log 'Cannot find procedure: ' + procedure
					@response.start(503) { |head,out| out.write('') }
				end

				if success
					@response.start(200) { |head,out| out.write('') }
					Nuri::Util.log "...execution success!"
				else
					@response.start(500) { |head,out| out.write('') }
					Nuri::Util.log "...execution failed!"
				end
				return success
			end

			def http_get_state(path=nil)
				if path == nil
					state = @daemon.get_state
				else
					_, _, path = path.split('/', 3)
					state = @daemon.get_state(path)
				end

				if state.is_a?(Nuri::Undefined)
					@response.start(404) do |head, out| out.write(''); end
				else
					@response.start(200) do |head, out|
						head['Content-Type'] = 'application/json'
						data = { 'value' => state }
						out.write(Nuri::Sfp.to_json(data))
					end
				end
			end

			

		end


		@@daemon = nil

		def self.start
			if @@daemon == nil
				@@daemon = Nuri::Client::Daemon.new
				@@daemon.start
			end
		end

		def self.stop
			@@daemon.stop if @@daemon != nil
		end

	end
end
