require 'mongrel'

module Nuri
	module Client
		class Daemon < Mongrel::HttpHandler
			include Nuri::Config

			def initialize
				self.load
			end

			def start(address=nil, port=nil)
				if address == nil
					address = @config['host'] if @config['host'] != '' and
							@config['host'] != '0.0.0.0'
					address = '0.0.0.0' if address == nil
				end
				port = @config['port'].to_i if port == nil

				begin
					@http = Mongrel::HttpServer.new(address, port)
					@http.register("/", self)
					Nuri::Util.log 'Start Nuri Client on port: ' + port.to_s
					@http.run.join
				rescue Interrupt
					Nuri::Util.log 'Exiting.'
				rescue Exception => e
					Nuri::Util.log 'Client Daemon error: ' + e.to_s #backtrace.inspect
				end
			end

			def process(req, res)
				Nuri::Client::Agent.new(self, req, res).serve
			end
			
			def get_state(path=nil)
				path.gsub!(/\//, '.') if path != nil
				return @root.get_state(path)
			end
		end

		class Agent
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
					end

				elsif @request.params['REQUEST_METHOD'] == 'POST'
					if check_uri(@request.params['REQUEST_URI'], 'system')
						self.process_system_information(@request.body.read.to_s)
					end

				elsif @request.params['REQUEST_METHOD'] == 'PUT'
					if check_uri(@request.params['REQUEST_URI'], 'exec')
						self.execute(@request.body.read.to_s)
					end

				end
			end

			def process_system_information(data)
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

				data = JSON[json]
				cmd = data['action']
				Nuri::Util.set_system_information(data['system'])

				params = clean_parameters(cmd['parameters'])
puts "exec: " + cmd['name'] + ": " + params.inspect
				comp_name, cmd_name = cmd['name'].pop_ref
				component = @daemon.root.get(comp_name)
puts component.class.name
				success = false
				if component != nil
					begin
						if params.size <= 0
							success = component.send(cmd_name)
						else
							success = component.send(cmd_name, params)
						end
puts "success: " + success.inspect
					rescue Exception => e
						Nuri::Util.log 'Cannot execute procedure: ' + json
						@response.start(500) { |head,out| out.write('') }
					end
				else
					Nuri::Util.log 'Cannot find procedure: ' + procedure
					@response.start(503) { |head,out| out.write('') }
				end

				if success
					@response.start(200) { |head,out| out.write('') }
				else
					@response.start(500) { |head,out| out.write('') }
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
					puts state.to_s
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

		def self.start
			daemon = Nuri::Client::Daemon.new
			daemon.start
		end

	end
end
