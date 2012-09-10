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
				rescue Exception => e
					Nuri::Util.log 'Client Daemon error: ' + e.to_s
				end
			end

			def process(req, res)
				Nuri::Client::Agent.new(self, req, res).serve
			end
			
			def get_state(path='')
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
				if @request.params['REQUEST_METHOD'] == 'GET'
					if @request.params['REQUEST_URI'] == '/state' or
							(@request.params['REQUEST_URI'] =~ /^\/state\/.*/) != nil
						self.http_get_state
					end

				elsif @request.params['REQUEST_METHOD'] == 'POST'

				elsif @request.params['REQUEST_METHOD'] == 'PUT'

				end
			end

			def http_get_state
				state = @daemon.get_state
				if state.is_a?(Nuri::Undefined)
					res.start(404) do |head, out| out.write(''); end
				else
					@response.start(200) do |head, out|
						head['Content-Type'] = 'application/json'
						data = { 'value' => state }
						out.write(Nuri::Sfp.to_json(data))
					end
				end
				#	out.write('{"value":"nena":{}}')
				#end
			end
		end


=begin
		class Agent
			def initialize(daemon, session)
				@session = session
				@request = session.gets
				@daemon = daemon
			end

			def process_get(path)
				begin
					if path == '/state' or path[0, 7] == '/state/'
						if path == '/state' or path.length <= 7 # parts.length <= 2
							data = @daemon.get_state
						else
							path = path[7, path.length-7]
							path = path[0, path.length-1] if path[path.length-1, 1] == '/'
							path.gsub!(/\//, '.')
							data = @daemon.get_state(path)
						end
						return sfp_value_to_json_reply(data)
					end
				rescue Exception => e
					return create_code_msg(500, 'Internal Server Error', e.to_s)
				end
			end

			def process_post(path, data)
			end

			def process_put(path, data)
				begin
					puts 'Execute: ' + path + ' -- ' + data
				rescue Exception => e
					return create_code_msg(500, 'Internal Server Error', e.to_s)
				end
			end

			def process_request(req)
puts 'Process request: ' + req.to_s
				type, path, data = req.split(' ', 3)
				if type == 'GET'
					return self.process_get(path)
				elsif type == 'POST'
					return self.process_post(path, data)
				elsif type == 'PUT'
					return self.process_put(path, data)
				end
				return nil
			end
	
			def serve
				begin
					reply = self.process_request(@request.to_s)
					if reply != nil
						@session.print reply
					else
						@session.print self.create_code_msg(404, 'Object Not Found')
					end
				ensure
					@session.close
				end
			end

			def create_code_msg(code, message, description="")
				return "HTTP/1.1 #{code}/#{message}\r\nServer: Nuri Client\r\n\r\n" +
						description
			end

			def sfp_value_to_json_reply(value)
				value = { 'value' => value }
				value = Nuri::Sfp.to_pretty_json(value)
				return "HTTP/1.1 200/OK\r\nServer: Nuri Client\r\n" +
						"Content-Length: " + value.length.to_s + "\r\n" +
						"Content-Type: application/json\r\n" +
						"\r\n" + value
			end

			def get_content_type(ext)
				return case ext
					when '.json' then 'application/json'
					else 'text/plain'
				end
			end
		end
=end

		def self.start
			daemon = Nuri::Client::Daemon.new
			daemon.start
		end


	end
end
