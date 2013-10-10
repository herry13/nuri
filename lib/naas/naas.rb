#!/usr/bin/env ruby

require 'json'
require 'logger'
require 'webrick'

module Nuri
end

class Nuri::Service < WEBrick::HTTPServlet::AbstractServlet
	HOME = File.expand_path('~/.nuri')
	Dir.mkdir(HOME) if !File.exist?(HOME)

	WebDir = File.expand_path('.', File.dirname(__FILE__))
	WebFiles = ['index.html', 'index.js', 'index.css', 'jquery.js']

	PIDFile = '/tmp/nuri_service.pid'
	Log = Logger.new(HOME + "/nuri.log")

	Port = 8383

	@@enabled = false

	def self.start
		fail "Nuri service is already running with PID #{pid}" if status == :running

		Process.daemon
		Log.info 'starting'
		@@enabled = true

		Signal.trap('HUP') {
			@@enabled = false
			@@server.shutdown if defined?(@@server) and !@@server.nil?
		}

		until not @@enabled do
			begin
				File.open(PIDFile, 'w') { |f| f.write($$.to_s) }

				config = {
					:Port => Port,
					:ServerType => WEBrick::SimpleServer,
					:DirectoryIndex => 'index.html',
					:Logger => Log
				}
				@@server = WEBrick::HTTPServer.new(config)
				@@server.mount "/", Nuri::Service # WEBrick::HTTPServlet::FileHandler, WebDir
				@@server.start

				sleep 1
			rescue Exception => e
				Log.error "#{e}"
				Log.debug e.backtrace.join("\n")
				sleep 10
			end
		end

		Log.info 'stopped'
	end

	def self.status
		begin
			Process.kill 0, pid
			return :running
		rescue
		end
		:stopped
	end

	def self.stop
		if status == :running
			Log.info 'stopping'
			Process.kill 'HUP', pid
			sleep 5
			system "kill -9 #{pid}" if status == :running
		end
		true
	end

	def self.pid
		(File.exist?(PIDFile) ? File.read(PIDFile).to_i : 1)
	end

	def initialize(server)
		@server = server
		@cache = {}
	end

	def do_GET(request, response)
		status = 404
		content_type = body = ''

		if not trusted?(request)
			status = 403
		else
			case request.path
			when '/'
				status = 200
				content_type = 'text/html'
				@cache[WebFiles[0]] = File.read(WebDir + '/' + WebFiles[0]) if !@cache.has_key?(WebFiles[0])
				body = @cache[WebFiles[0]]
			when '/modules/'
				status, content_type, body = get_modules
			when /^\/.+/
				req = request.path[1, request.path.length-1]
				WebFiles.each do |file|
					if file == req
						status = 200
						case File.extname(file)
						when '.css'
							content_type = 'text/css'
						when '.js'
							content_type = 'application/javascript'
						else
							content_type = 'text/plain'
						end
						@cache[file] = File.read(WebDir + '/' + file) if !@cache.has_key?(file)
						body = @cache[file]
						break
					end
				end
			end
		end

		response.status = status
		response['Content-Type'] = content_type
		response.body = body
	end

	def trusted?(request)
		# TODO
		true
	end

	def get_modules
		module_dir = WebDir + '/../../modules'
		modules = Dir.entries(module_dir).select { |entry| File.directory?(File.expand_path(module_dir + '/' + entry)) and !(entry == '.' or entry == '..') }
		[200, 'application/json', JSON.generate({'modules' => modules})]
	end
end

if $0 == __FILE__
	case ARGV[0]
	when 'start'
		Nuri::Service.start
	when 'status'
		if Nuri::Service.status == :running
			puts "Nuri service is running with PID #{Nuri::Service.pid}."
		else
			puts "Nuri service is not running."
		end
	when 'stop'
		Nuri::Service.stop
	when 'restart'
		Nuri::Service.stop
		Nuri::Service.start
	else
		puts 'Usage: service.rb [start|stop|restart|status]'
	end
end
