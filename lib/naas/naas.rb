#!/usr/bin/env ruby

require 'logger'
require 'webrick'

module Nuri
end

class Nuri::Service < WEBrick::HTTPServlet::AbstractServlet
	HOME = File.expand_path('~/.nuri')
	Dir.mkdir(HOME) if !File.exist?(HOME)
	WebDir = HOME + "/web"
	Dir.mkdir(WebDir) if !File.exist?(WebDir)

	WebFiles = {
		:index_html => File.expand_path('./index.html', File.dirname(__FILE__)),
		:index_js => File.expand_path('./index.js', File.dirname(__FILE__)),
		:index_css => File.expand_path('./index.css', File.dirname(__FILE__)),
	}

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
				@index_html = File.read(WebFiles[:index_html]) if !defined?(@index_html)
				body = @index_html
			when '/index.js'
			when '/index.css'
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
