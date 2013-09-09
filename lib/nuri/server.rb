require 'yaml'
require 'logger'
require 'webrick'

module Nuri
end

module Nuri::Server
	VarDir = (Process.euid == 0 ? '/var/nuri' : File.expand_path('~/.nuri'))
	Dir.mkdir(VarDir, 0700) if not File.exist?(VarDir)

	PIDFile = "#{VarDir}/nuri.pid"
	PlanFile = "#{VarDir}/plan.json"
	LogFile = "#{VarDir}/nuri.log"
	ModelFile = "#{VarDir}/main.sfp"
	ModulesDir = "#{VarDir}/modules"
	Dir.mkdir(ModulesDir, 0700) if not File.exist?(ModulesDir)

	ConfigDir = (Process.euid == 0 ? '/etc/nuri' : File.expand_path('~/.nuri'))
	ConfigFile = "#{ConfigDir}/nuri.yml"

	DefaultIntervalTime = 5
	DefaultPort = 1313

	def init
		Dir.mkdir(ConfigDir, '0755') if not File.exist?(ConfigDir)

		if not File.exist?(ConfigFile)
			# generate and save default configuration file
			config = { "port" => DefaultPort,
			           "interval_time" => 5 }
			File.open(ConfigFile, 'w', 0644) { |f| f.write(YAML.dump(config)) }

			# generate an empty model file
			File.open(ModelFile, 'w', 0644) { |f| f.write('') }
		end

		#if not File.exist?(".git")
		#	system("cd #{ConfigDir}; git init 1>/dev/null 2>/dev/null")
		#	File.open("#{ConfigDir}/.gitignore", 'w', 0644) { |f| f.write("*.pid\n*.log\n") }
		#	system("cd #{ConfigDir}; git add -A . 1>/dev/null 2>/dev/null; git commit -m 'nuri init' 1>/dev/null 2>/dev/null")
		#end
	end

	def start
		if not File.exist?(ConfigFile)
			puts "Execute 'nuri init' first!"
			exit!(1)
		end

		if File.exist?(PIDFile)
			pid = File.read(PIDFile).to_i
			begin
				Process.kill 0, pid if pid > 0
				# Nuri server is still running
				puts "Nuri server is already running with PID #{pid}."
				exit!(1)
			rescue
			end
		end

		@logger = WEBrick::Log.new(LogFile, WEBrick::BasicLog::INFO ||
		                                    WEBrick::BasicLog::ERROR ||
		                                    WEBrick::BasicLog::FATAL ||
		                                    WEBrick::BasicLog::WARN)

		@logger.info "Reading configuration file [Wait]"
		@config = YAML.load(File.read(ConfigFile))
		@logger.info "Reading configuration file [OK]"

		['INT', 'KILL', 'HUP'].each { |signal|
			trap(signal) {
				@logger.info "Shutting down Nuri server..."
				@enabled = false
				@web_server.shutdown
			}
		}

		puts "Starting Nuri server..."
		Process.daemon

		File.open("#{PIDFile}", 'w', 0644) { |f| f.write($$.to_s) }

		start_web_server

		start_nuri_server
	end

	def start_nuri_server
		@enabled = true
		@logger.info "Nuri server is running."

		options = { :parallel     => true,
		            :model_file   => ModelFile,
		            :apply        => true,
		            :push_modules => true,
		            :modules_dir  => ModulesDir,
		            :silent       => true }

		interval_time = (@config['interval_time'] ? @config['interval_time'].to_i : DefaultIntervalTime)

		while @enabled
			@logger.info "Executing the model."

			plan = nil
			begin
				#plan = get_plan if File.exist?(ModelFile)

				if plan.is_a?(Hash)
					File.open(PlanFile, 'w', '0644') { |f| f.write(JSON.pretty_generate(plan)) }
					@logger.info "Executing the generated plan in file #{PlanFile}."
					options[:plan] = plan
					if execute_plan(options)
						@logger.info "Execution is success!"
					else
						@logger.info "Execution is failed!"
					end
				end

			rescue Exception => e
				@logger.error "Error: #{e}\n#{e.backtrace.join("\n")}"
			end
	
			sleep interval_time
		end

		@logger.info "Nuri server has stopped."
	end

	def start_web_server
		Thread.new {
			config = { :Host => '0.0.0.0',
			           :Port => (@config['port'] ? @config['port'].to_i : DefaultPort),
			           :ServerType => WEBrick::SimpleServer,
			           :Logger => @logger }
			@web_server = WEBrick::HTTPServer.new(config)
			@web_server.mount('/', Nuri::Server::Handler, self, @logger)
			@web_server.start
		}
	end

	def stop
		begin
			pid = File.read(PIDFile).to_i
			Process.kill 'HUP', pid
			puts "Stopping Nuri server..."
		rescue
			puts "Nuri server is not running."
		end
	end

	def get_model(p={})
		(File.exist?(ModelFile) ? File.read(ModelFile) : '')
	end

	def get_log(total_lines=0)
		(File.exist?(LogFile) ? `tail -n #{total_lines} #{LogFile}` : '')
	end

	class Handler < WEBrick::HTTPServlet::AbstractServlet
		def initialize(server, master, logger)
			@master = master
			@logger = logger
		end

		def do_GET(request, response)
			status = 400
			content_type, body = ''

			if not trusted(request.peeraddr[2])
				status = 403
			else
				path = (request.path[-1,1] == '/' ? request.path.chop : request.path)
				if path == '/model'
					status, content_type, body = [200, 'text/plain', @master.get_model(:json => true)]
				elsif path == '/log'
					status, content_type, body = [200, 'text/plain', @master.get_log(100)]
				end
			end

			response.status = status
			response['Content-Type'] = content_type
			response.body = body
		end

		def do_POST(request, response)
			status = 400
			content_type, body = ''

			response.status = status
			response['Content-Type'] = content_type
			response.body = body
		end

		def do_PUT(request, response)
			status = 400
			content_type, body = ''

			response.status = status
			response['Content-Type'] = content_type
			response.body = body
		end

		def trusted(address)
			# TODO
			true
		end
	end
end

nuri = Object.new
nuri.extend(Nuri::Server)
nuri.init
#nuri.start
nuri.stop
