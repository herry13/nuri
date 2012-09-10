require 'socket'

module Nuri
	module Client
		class Daemon
			include Nuri::Config

			def initialize
				self.load
			end

			def get_state(path='')
				return @root.get_state(path)
			end

			def start(address=nil, port=nil)
				if address == nil
					address = @config['host'] if @config['host'] != '' and
							@config['host'] != '0.0.0.0'
				end
				port = @config['port'].to_i if port == nil
				begin
					server = case address
						when nil then TCPServer.new(port)
						else TCPServer.new(address, port)
					end
				end
	
				Nuri::Util.log 'Starting server on port: ' + port.to_s
				loop do
					session = server.accept
					Thread.start(self, session) do |daemon, session|
						Nuri::Client::Agent.new(daemon, session).serve
					end
				end
			end
		end

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
					puts 'Execute: ' + path
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

		def self.start
			daemon = Nuri::Client::Daemon.new
			daemon.start
		end

	end
end
