require 'base64'
require 'pp'
require 'webrick'
require 'thread'

module Nuri
	module Client
		class Daemon
			include Nuri::Config

			attr_accessor :master_keys

			def initialize
				@master_keys = {}

				@bsig_executor = Nuri::BSig::Executor.new(self)
				@lock_goal = Mutex.new
				@goals = {}

				self.load
			end

			# Check if the HTTP requester is from any trusted host
			# @return true if trusted, otherwise false
			def trusted_address(requester)
				return false if not @config.has_key?('trusted')
				if not @config['trusted'].is_a?(Array)
					return (@config['trusted'] == requester)
				else
					@config['trusted'].each { |addr| return true if addr == requester }
				end
				false
			end

			# Process HTTP request by creating an agent and delegating the request
			# to the agent
			def process_request(request, stream)
				if not self.trusted_address(stream.socket.peeraddr[2])
					Nuri::Util.warn "Untrusted request from host ..."
					[403, {}, ['']]
				else
					Nuri::Client::Agent.new(self, request, stream).serve_request
				end
			end

			def stop
				Nuri::Util.log 'Terminate request received. Stopping Nuri client...'
				@stopped = true
				# stop any BSig executor
				stop_bsig_executor
				# shutdown the HTTP server
				@server.shutdown
				pid_file = Nuri::Util.pid_file
				File.delete(pid_file) if File.exist?(pid_file)
			end

			# start client's HTTP server to accept connection
			def start(address=nil, port=nil, daemon=false)
				if address == nil
					address = @config['host'] if @config['host'] != '' and
							@config['host'] != '0.0.0.0'
					address = '0.0.0.0' if address == nil
				end
				port = @config['port'].to_i if port == nil

				begin
					server_type = (daemon ? WEBrick::Daemon : WEBrick::SimpleServer)
					log_file = (daemon ? Nuri::Util::http_log_file : nil)
					log = WEBrick::Log.new(log_file, WEBrick::BasicLog::INFO ||
					                                 WEBrick::BasicLog::ERROR ||
					                                 WEBrick::BasicLog::FATAL ||
					                                 WEBrick::BasicLog::DEBUG ||
					                                 WEBrick::BasicLog::WARN)
					@server = WEBrick::HTTPServer.new(:Host => address,
					                                  :Port => port,
					                                  :ServerType => server_type,
					                                  :Logger => log)
					@server.mount("/", Agent, self)

					@stopped = false
					# caught the terminate signals
					['INT', 'HUP', 'TERM', 'KILL'].each { |signal| trap(signal) { self.stop } }

					# Spawn a new process for write some logs, processes' PID, and
					# BSig reminder
					fork {
						Nuri::Util.log "Start Nuri client on port #{port}"
						sleep 1
						begin
							if daemon
								# get and save process' PIDs in file "var/nuri.pid"
								data = `ps x|grep "nuri.rb client"|grep -v grep|awk '{print $1}'`
								data = data.split("\n")
								if data.length > 0
									pid = data[1].to_i.to_s + "," + $$.to_s
									Nuri::Util.log "Nuri client daemon is running with PID ##{pid}"
									f = File.open(Nuri::Util.pid_file, 'w')
									f.write(pid)
									f.close
								end
							end
						rescue Exception => exp
							Nuri::Util.log "Cannot get process' PID: " + exp.to_s
						end

						# Start BSig reminder
						Nuri::Util.log 'Start BSig reminder'
						begin
							self.start_bsig_executor
							sleep 30 #600 # 10 mins
						end while not @stopped
					}

					# Nuri client is ready to accept any request, then
					# start the HTTP server
					@server.start

				rescue Interrupt
					Nuri::Util.log 'Exiting.'
				rescue Exception => e
					Nuri::Util.log 'Client Daemon error: ' + e.to_s
					return false
				end
				return true
			end

			# Return the state of this node
			def get_state(path=nil)
				path.gsub!(/\//, '.') if path != nil
				return @root.get_state(path)
			end

			# Return the latest goal for this agent to be achieved
			def get_goal
				@lock_goal.synchronize {
					pre_goals = {}
					@goals.each { |path,values| pre_goals[path] = values.last if values.length > 0 }
					return pre_goals if pre_goals.length > 0
					return (@bsig_executor.bsig.nil? ? {} : @bsig_executor.bsig['goal'])
				}
			end

			# Verify and add a new-goal to the goal-stacks.
			# - New-goal is a set of variables, where each variable has a value.
			# - In new-goal, each variable exactly has one value.
			# - Foreach pair (variable,value), it can be added to the goal-stacks iff
			#   the value does not exist in the stack of the variable. This will avoid
			#   live-lock situation.
			def add_goal(new_goals={})
				@lock_goal.synchronize {
					possible_livelock = false
					new_goals.each do |path,value|
						# check if the new goal has been requested before to avoid livelock
						if @goals.has_key?(path) and not @goals[path].index(value).nil?
							if @goals[path].last != value
Nuri::Util.log 'new goal not at the top of goal-stack' + path + '=' + value.to_s
								possible_livelock = true
							end

						elsif not @bsig_executor.nil? and
						      @bsig_executor.bsig['goal'].has_key?(path) and
								@bsig_executor.bsig['goal'][path] == value
							if @goals.has_key?(path) and @goals[path].length > 0
Nuri::Util.log 'new goal at the bottom of goal-stack: ' + path + '=' + value.to_s
								possible_livelock = true
							end

						end
					end

					# return false livelock is possible to be occured
					return false if possible_livelock

					new_goals.each { |path,value|
						@goals[path] = [] if not @goals.has_key?(path)
						@goals[path] << value
					}
					self.start_bsig_executor
					return true
				}
			end

			# Foreach given pair (variable,value) in parameter "goals", remote
			# the value from the goal-stack iff the value is at the top.
			def remove_goal(goals={})
				@lock_goal.synchronize {
					exist = false
					goals.each do |path,value|
						if @goals.has_key?(path) and @goals[path].length > 0 and
						   @goals[path].last == value

							@goals[path].pop
							exist = true

						end
					end
					return exist
				}
			end

			# Clear all goal-stacks.
			def clear_goal; @lock_goal.synchronize { @goals.clear }; end

			# create and start BSig executor in separate thread
			def start_bsig_executor
				@bsig_executor.start if not @bsig_executor.active
			end

			# stop BSig executor
			def stop_bsig_executor
				@bsig_executor.stop
			end

			# Load BSig from cached file if such file exists
			def update_bsig_executor
				@bsig_executor.load
			end

			# Execute a procedure specified in the argument
			# @param procedure : the description of the procedure
			# @return nil if the component or the procedure is not found
			#         false if the execution is failed
			#         true if the execution is succeed
			def execute(procedure)
				def clean_parameters(params)
					p = {}
					params.each { |k,v|
						p[k[2,k.length-2]] =	params[k]
					}
					return p
				end

				params = clean_parameters(procedure['parameters'])
				puts 'exec: ' + procedure['name'] + ' (' + params.inspect + ')'
				comp_name, procedure_name = procedure['name'].extract
				component = @root.get(comp_name)
				return nil if component.nil? or not component.respond_to?(procedure_name)
				return component.send(procedure_name) if params.size <= 0
				return component.send(procedure_name, params)
			end
		end

		class Agent < WEBrick::HTTPServlet::AbstractServlet
			def initialize(server, owner)
				@owner = owner
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
				elsif path == '/bsig/goal'
					status, content_type, body = self.new_bsig_pre_goal(request.query)
				elsif path == 'reset'
					status, content_type, body = self.reset
				else
					status = 400
					content_type = body = ''
				end
				response.status = status
				response['Content-Type'] = content_type
				response.body = body
			end

			def reset
				@owner.stop_bsig_executor
				Nuri::Client.reset
				return 200, '', ''
			end

			def new_bsig_pre_goal(data)
				begin
					goal = JSON[data['json']]
					# add new pre-goal
					return 202, '', '' if @owner.add_goal(goal)
				rescue Exception => exp
					Nuri::Util.log 'Failed to achieve subgoal: ' + exp.to_s
				end
				return 500, '', ''
			end

			def deactivate_bsig(current_id)
				# 1) stopped thread which deploys BSig model
				@owner.stop_bsig_executor

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

					# 3) load and deploy BSig by starting the executor
					@owner.start_bsig_executor

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
					local = (File.exist?(bsig_file) ? JSON[File.read(bsig_file)] : {'operators' => [], 'goal' => {}})
					local['operators'] << bsig['operator'] if bsig.has_key?('operator')
					bsig['operators'].each { |r| local['operators'] << r } if bsig.has_key?('operators')
					bsig['goal'].each { |k,v| local['goal'][k] = v } if bsig.has_key?('goal')
					f = File.open(bsig_file, 'w')
					f.write(JSON.generate(local))
					f.close
					@owner.update_bsig_executor
				rescue Exception => e
					Nuri::Util.log 'Failed to save BSig: ' + e.to_s
					return 500, '', ''
				end
				return 200, '', ''
			end

			def execute_action(data)
				Nuri::Util.log "executing: #{data['json']}..."
				data = JSON[data['json']]
				cmd = data['action']
				Nuri::Util.set_system_information(data['system'])

				begin
					status = @owner.execute(cmd)
					if status.nil?
						puts "exec: Failed"
						Nuri::Util.log 'exec: Failed -- cannot find procedure: ' + procedure
						return 503, '', ''
					elsif status == true
						puts "exec: OK"
						Nuri::Util.log "exec: OK"
						return 200, '', ''
					end
				rescue Exception => e
					Nuri::Util.log e.to_s
				end
				puts "exec: Failed"
				Nuri::Util.log 'exec: Failed -- cannot execute procedure: ' + json
				return 500, '', ''
			end

			def get_state(options={})
				if not options.has_key?(:path)
					state = @owner.get_state
				else
					_, _, path = options[:path].split('/', 3)
					state = @owner.get_state(path)
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

		#def self.stop
		#	@@daemon = Nuri::Client::Daemon.new
		#	@@daemon.stop
		#end

		def self.stop
			begin
				pid_file = Nuri::Util.pid_file
				if File.exist?(pid_file)
					pids = File.read(pid_file).split(',')
					cmd1 = "/usr/bin/sudo /bin/kill -9 #{pids[1]}"
					cmd2 = "/usr/bin/sudo /bin/kill -1 #{pids[0]}"
					system(cmd1)
					system(cmd2)
					Nuri::Util.log 'Nuri client daemon was stopped'
				end
			rescue Exception => e
				Nuri::Util.log 'Cannot stop Nuri client: ' + e.to_s
			end
		end

		def self.reset
			begin
				# Delete all cache files
				dir = Nuri::Util.home_dir + '/var'
				# 1) delete BSig files
				Dir.entries(dir).each do |fname|
					path = dir + '/' + fname
					if fname[0, 5] == 'bsig_' and File.file?(path)
						File.delete(path)
					end
				end
				# 2) delete system information file
				fpath = Nuri::Util.home_dir + '/var/system.info'
				File.delete(fpath) if File.exist?(fpath)
			rescue Exception => exp
				$stderr.puts exp.to_s
			end
		end

	end
end
