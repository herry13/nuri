require 'base64'
require 'pp'
require 'webrick'
require 'thread'

module Nuri
	module Client
		class Daemon
			include Nuri::Config
			include Nuri::NetHelper

			attr_accessor :master_keys

			def initialize
				@master_keys = {}

				#@bsig_executor = Nuri::BSig::Executor.new(self)
				@bsig_executor = Nuri::BSig::Executor.new({:owner => self})
				@lock_goal = Mutex.new
				@goals = {}
				@system_nodes = []

				self.init
			end

			# Check if the HTTP requester is from any trusted host
			# @return true if trusted, otherwise false
			def trusted_address(requester)
				return true if requester == 'localhost'
				return false if not @config.has_key?('trusted')
				if not @config['trusted'].is_a?(Array)
					return (@config['trusted'] == requester)
				else
					@config['trusted'].each { |addr| return true if addr == requester }
				end
				system_nodes = Nuri::Util.get_system_information
				system_nodes.each_value { |addr| return true if addr == requester }
				false
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
				File.delete(pid_file + ".1") if File.exist?(pid_file + ".1")
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
					log_file = Nuri::Util::http_log_file
					log = WEBrick::Log.new(log_file, WEBrick::BasicLog::INFO ||
					                                 WEBrick::BasicLog::ERROR ||
					                                 WEBrick::BasicLog::FATAL ||
					                                 WEBrick::BasicLog::WARN)
					access_log = [[log, WEBrick::AccessLog::COMBINED_LOG_FORMAT]]
					@server = WEBrick::HTTPServer.new(:Host => address,
					                                  :Port => port,
					                                  :ServerType => server_type,
					                                  :Logger => log,
					                                  :AccessLog => access_log)
					@server.mount("/", Agent, self)

					@stopped = false
					# caught the terminate signals
					['INT', 'HUP', 'TERM', 'KILL'].each { |signal| trap(signal) { self.stop } }

					# Spawn a new process for write some logs, processes' PID, and
					# BSig reminder
					fork {
						Nuri::Util.log "Listen on port #{port}"
						sleep 1
						begin
							if daemon
								# get and save process' PIDs in file "var/nuri.pid"
								data = `ps x|grep "nuri client"|grep -v grep|grep -v #{$$}|awk '{print $1}'`
								if data.length > 0
									pids = "#{data.to_i} #{$$}"
									File.open(Nuri::Util.pid_file, 'w') { |f| f.write(pids) }
									Nuri::Util.log "Nuri client daemon is running with PIDs ##{pids}"
								end
							end
						rescue Exception => exp
							Nuri::Util.error "Cannot get process' PID: " + exp.to_s
						end

						# Start BSig reminder
						Nuri::Util.log 'Starting BSig reminder'
						bsig_start_path = '/bsig/local_start'
						begin
							begin
								put_data('localhost', Nuri::Port, bsig_start_path)
							rescue Exception
							end
							sleep 30 #600 # 10 mins
						end while not @stopped
					}

					# Nuri client is ready to accept any request, then
					# start the HTTP server
					@server.start

				rescue Interrupt
					Nuri::Util.log 'Exiting.'
				rescue Exception => e
					Nuri::Util.error "Client Daemon error: #{e} [#{e.backtrace}]"
					return false
				end
				return true
			end

			def get_bsig; return @bsig_executor.bsig; end

			# Return the state of this node
			def get_state(path=nil)
				path = path.gsub(/\//, '.') if path.is_a?(String) # path != nil
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
								Nuri::Util.warn 'new goal not at the top of goal-stack: ' + path + '=' + value.to_s
								possible_livelock = true
							end

						elsif not @bsig_executor.nil? and
						      @bsig_executor.bsig['goal'].has_key?(path) and
								@bsig_executor.bsig['goal'][path] == value
							if @goals.has_key?(path) and @goals[path].length > 0
								Nuri::Util.warn 'new goal at the bottom of goal-stack: ' + path + '=' + value.to_s
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
				@bsig_executor.start #if not @bsig_executor.active
			end

			# stop BSig executor
			def stop_bsig_executor
				@bsig_executor.stop
			end

			# Load BSig from cached file if such file exists
			def update_bsig_executor
				#@bsig_executor.load
			end

			def reset
				begin
					self.stop_bsig_executor
					Nuri::Client.reset
					@bsig_executor.reset
					@goals.clear
				rescue Exception => exp
					Nuri::Util.error "Failed to delete cache data - #{exp} [#{exp.backtrace}]"
					return false
				end
				Nuri::Util.log 'Cache data have been deleted.'
				return true
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
				Nuri::Util.debug 'execute operator: ' + procedure['name'] + ' (' + params.inspect + ')'
				comp_name, procedure_name = procedure['name'].extract
				component = @root.get(comp_name)
				return nil if component.nil? or not component.respond_to?(procedure_name)
				return component.send(procedure_name) if params.size <= 0
				return component.send(procedure_name, params)
			end

			def call(function_path, params={})
				comp_name, function_name = function_path.extract
				component = @root.get(comp_name)
				return nil if component.nil? or not component.respond_to?(function_name)
				return component.send(function_name) if params.size <= 0
				return component.send(function_name, params)
			end

		end

		class Agent < WEBrick::HTTPServlet::AbstractServlet
			include Nuri::NetHelper

			def initialize(server, owner)
				@owner = owner
				@execution_mutex = Mutex.new
			end

			def do_GET(request, response)
				if not @owner.trusted_address(request.peeraddr[2])
					Nuri::Util.warn "Untrusted request from: " + request.peeraddr[2]
					status = 403
					content_type, body = ''
				else
					path = request.path
					path.chop! if path[path.length-1,1] == '/'
					if path[0,6] == '/state'
						status, content_type, body = self.get_state(:path => path)
					elsif path == '/bsig'
						status, content_type, body = self.get_bsig
					elsif path == '/logs'
						status, content_type, body = self.get_logs
					else
						status = 400
						content_type = body = ''
					end
				end
				response.status = status
				response['Content-Type'] = content_type
				response.body = body
			end

			def do_POST(request, response)
				if not @owner.trusted_address(request.peeraddr[2])
					Nuri::Util.warn "Untrusted request from: " + request.peeraddr[2]
					status = 403
					content_type, body = ''
				else
					path = request.path
					path.chop! if path[path.length-1,1] == '/'
					if path == '/system'
						status, content_type, body = self.set_system_information(request.query)
					elsif path == '/system/update'
						status, content_type, body = self.update_system_information(request.query)
					else
						status = 400
						content_type = body = ''
					end
				end
				response.status = status
				response['Content-Type'] = content_type
				response.body = body
			end

			def do_PUT(request, response)
				if not @owner.trusted_address(request.peeraddr[2])
					Nuri::Util.warn "Untrusted request from: #{request.peeraddr[2]}"
					status = 403
					content_type, body = ''
				else
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
					elsif path == '/bsig/start'
						status, content_type, body = [200, '', '']
					elsif path == '/bsig/local_start'
						status, content_type, body = self.start_bsig_executor
					elsif path == '/bsig/vm'
						status, content_type, body = self.save_bsig_vm(request.query)
					elsif path == '/reset'
						status, content_type, body = self.reset
					elsif path[0,10] == '/function/' and path.length > 10
						status, content_type, body = self.call_function(path, request.query)
					else
						status = 400
						content_type = body = ''
					end
				end
				response.status = status
				response['Content-Type'] = content_type
				response.body = body
			end

			def save_bsig_vm(data)
				begin
					bsig = JSON[data['json']]
					bsig_file = Nuri::BSig.bsig_vm_file(bsig['id'])
					local = (File.exist?(bsig_file) ? JSON[File.read(bsig_file)] : {})

					vm_name = bsig['vm']
					local[vm_name] = { 'operators' => [], 'goal' => {} } if not local.has_key?(vm_name)
					operators = local[vm_name]['operators']
					goals = local[vm_name]['goal']

					operators << bsig['operator'] if bsig.has_key?('operator')
					bsig['operators'].each { |op| operators << op } if bsig.has_key?('operators')
					bsig['goal'].each { |k,v| goals[k] = v } if bsig.has_key?('goal')

					File.open(bsig_file, 'w') { |f| f.write(JSON.generate(local)) }
				rescue Exception => e
					Nuri::Util.error "Failed to save BSig VM: #{e} [#{e.backtrace}]"
					return 500, '', ''
				end
				return 200, '', ''
			end

			def start_bsig_executor
				@owner.start_bsig_executor
				[200, '', '']
			end

			def reset
				[ (@owner.reset ? 200 : 500), '', '' ]
			end

			def new_bsig_pre_goal(data)
				begin
					goal = JSON[data['json']]
					# add new pre-goal
					return 202, '', '' if @owner.add_goal(goal)
				rescue Exception => exp
					Nuri::Util.error "Failed to achieve subgoal: #{exp} [#{exp.backtrace}]"
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
					File.open(bsig_id_file, 'w') { |f| f.write(bsig_id) }

					# 3) load and deploy BSig by starting the executor
					@owner.start_bsig_executor

				rescue Exception => e
					Nuri::Util.error "Failed to activate BSig: #{e} [#{e.backtrace}]"
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
					File.open(bsig_file, 'w') { |f| f.write(JSON.generate(local)) }
					@owner.update_bsig_executor
				rescue Exception => e
					Nuri::Util.error "Failed to save BSig: #{e} [#{e.backtrace}]"
					return 500, '', ''
				end
				return 200, '', ''
			end

			def execute_action(data)
				@execution_mutex.synchronize {
					Nuri::Util.log "[Exec: #{data['json']}..."
					data = JSON[data['json']]
					cmd = data['action']
					Nuri::Util.set_system_information(data['system'])
	
					begin
						status = @owner.execute(cmd)
						if status.nil?
							Nuri::Util.error "[Exec:#{cmd['name']} => Failed] Cannot find the procedure:#{cmd.inspect}"
							return 503, '', ''
	
						elsif status.is_a?(Array) and status[0] == true
							return 200, 'application/json', status[1]
	
						elsif status == true
							Nuri::Util.log "[Exec:#{cmd['name']} => OK]"
							return 200, '', ''
	
						end
					rescue Exception => e
						Nuri::Util.error "Error: #{e} [#{e.backtrace}]"
						e.backtrace
					end
				}

				Nuri::Util.error "[Exec:#{cmd['name']} => Failed] Cannot execute the procedure:#{cmd['name']},status=#{status}."
				return 500, '', ''
			end

			def call_function(path, data)
				begin
					# /function/<function-path>
					_, _, func_path = path.split('/', 3)
					func_path = '$.' + func_path.gsub(/\//, '.') if not func_path.nil?
					params = (data.is_a?(Hash) and data.has_key?('json') ? JSON[data['json']] : {})
					data = {'value' => @owner.call(func_path, params)}
					return 200, 'application/json', JSON.generate(data)
				rescue Exception => exp
					Nuri::Util.error "Error: calling function #{func_path} - #{exp} [#{exp.backtrace}]"
				end
				[500, '', '']
			end

			def get_state(options={})
				if not options.has_key?(:path)
					state = @owner.get_state
				else
					_, _, path = options[:path].split('/', 3)
					path = '$.' + path.gsub(/\//, '.') if not path.nil?
					state = @owner.get_state(path)
				end

				return 204, '', '' if state.is_a?(::Nuri::Undefined)
				return 404, '', '' if state.is_a?(::Nuri::Unknown)

				data = Nuri::Sfp.to_json({'value' => state})
				[200, 'application/json', data]
			end

			def get_logs
				[200, 'application/json', JSON.generate({'logs' => Nuri::Util.get_logs})]
			end

			def get_bsig
				bsig = @owner.get_bsig
				return 404, '', '' if bsig.nil?
				bsig = bsig.clone
				bsig["id"] = Nuri::BSig.get_active_id
				[200, 'application/json', JSON.generate(bsig)]
			end

			def propagate_system_information(system)
				system.each_value do |target|
					next if target.nil? or target.to_s.length <= 0
					next if not Nuri::Util.is_nuri_active?(target)
					begin
						post_data(target, Nuri::Port, '/system', system)
					rescue Exception => e
						Nuri::Util.log "Cannot send system information to #{target} - #{e} [#{e.backtrace}]"
					end
				end
			end

			def update_system_information(data)
				begin
					system = Nuri::Util.get_system_information
					items = JSON[data['json']]
					changed = false
					items.each do |key,value|
						next if system.has_key?(key) and system[key] == value
						system[key] = value
						changed = true
					end
					if changed
						Nuri::Util.set_system_information(system)
						Nuri::Util.log 'system information is updated(2)'
						self.propagate_system_information(system)
					end
					return 200, '', ''
				rescue
				end
				[404, '', '']
			end

			def set_system_information(data)
				begin
					system = JSON[data['json']]
					Nuri::Util.set_system_information(system)
					Nuri::Util.log 'system information is updated(1)'
					return 200, '', ''
				rescue
				end
				[404, '', '']
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
			begin
				if File.exist?(Nuri::Util.pid_file)
					pids = File.read(Nuri::Util.pid_file).split(" ")
					cmd = "/usr/bin/sudo /bin/kill -9 #{pids[1]} 2>/dev/null 1>/dev/null"
					cmd += ";/usr/bin/sudo /bin/kill -1 #{pids[0]} 2>/dev/null 1>/dev/null"
					raise Exception if (system(cmd) != true)
					Nuri::Util.log 'Nuri client daemon was stopped'
				end
			rescue Exception => e
				Nuri::Util.error "Cannot stop Nuri client: #{e} [#{e.backtrace}]"
			end
		end

		def self.reset
			begin
				# Delete all cache files
				dir = Nuri::Util.home_dir + '/var'
				# 1) delete BSig files and log files
				Dir.entries(dir).each do |fname|
					path = dir + '/' + fname
					next if not File.file?(path)
					if fname[0, 5] == 'bsig_'
						File.delete(path)
					end
				end
				# 2) delete system information file
				fpath = Nuri::Util.home_dir + '/var/system.info'
				File.delete(fpath) if File.exist?(fpath)
			rescue Exception => exp
				Nuri::Util.error exp.to_s + "\n" + exp.backtrace.to_s
			end
		end

		def self.print_state
			client = Nuri::Client::Daemon.new
			state = client.get_state
			state = {} if state == nil
			state.accept(Nuri::Sfp::PrettyStateGenerator.new) if
					ARGV.length < 3 or ARGV[2] != 'details'
			puts Nuri::Sfp.to_pretty_json(state) if state != nil
		end

		def self.local_plan(params={})
			def clean_parameters(params)
				p = {}
				params.each { |k,v| p[k[2, k.length-2]] = params[k] }
				p
			end

			if params[:sfp_file].to_s.strip.length <= 0
				puts 'Please specify the desired configuration file!'
				return
			end

			raise Exception, "Configuration file is not exist: #{params[:sfp_file]}" if not File.exist?(params[:sfp_file])

			client = Nuri::Client::Daemon.new

			# read desired state
			sfp_task = client.parse_main_file(params[:sfp_file])

			# create SFP planning task
			sfp_task['initial'] = client.get_state
			sfp_task.accept(Nuri::Sfp::SfpGenerator.new(sfp_task))

			# compute the plan
			planner = Nuri::Planner::Solver.new
			plan = planner.solve_sfp(sfp_task, false, false)

			#puts JSON.pretty_generate(plan)
			if plan.nil? or plan['workflow'].nil?
				puts 'no solution!'

			elsif plan['workflow'].length <= 0
				puts "The desired state is already achieved!"

			else plan['workflow'].length > 0
				plan['workflow'].each { |proc| puts "- #{proc['name']}#{JSON.generate(proc['parameters'])}" }
				print "Execute the workflow [y/N]? "
				if STDIN.gets.strip.upcase == 'Y'
					puts "\nExecuting the plan..."
					success = true
					plan['workflow'].each do |proc|
						print "executing: #{proc['name']}#{JSON.generate(proc['parameters'])}    "
						success = client.execute(proc)
						puts (success ? "[OK]" : "[FAILED]")
						break if not success
					end
					if not success
						puts "\nExecution failed!"
					else
						puts "\nExecution success!"
					end
				end
			end
			puts ''
		end

	end
end
