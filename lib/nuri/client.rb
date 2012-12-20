require 'base64'
require 'pp'
require 'webrick'
require 'thread'

module Nuri
	module Client
		class Daemon
			include Nuri::Config

			attr_accessor :master_keys
			attr_reader :bsig_executor

			def initialize
				@master_keys = {}
				@bsig_executor = nil
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

			# stop client's HTTP server gracefully
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
					pid_file = Nuri::Util.home_dir + '/var/nuri.pid'
					@server = WEBrick::HTTPServer.new(:Host => address,
					                                  :Port => port,
					                                  :ServerType => server_type)
					@server.mount("/", Agent, self)

					# caught the terminate signals
					['INT', 'TERM'].each do |signal|
						trap(signal) do
							# stop any BSig executor
							@bsig_executor.stop if not @bsig_executor.nil?
							# shutdown the HTTP server
							@server.shutdown
							File.delete(pid_file) if File.exist?(pid_file)
						end
					end

					# dump some logs and PID
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

					# BSig executor
					self.start_bsig_executor

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

			# create and start BSig executor in separate thread
			def start_bsig_executor
				@bsig_executor = BSigExecutor.new(self) if @bsig_executor.nil?
				@bsig_executor.start if not @bsig_executor.active
			end

			# stop BSig executor
			def stop_bsig_executor; @bsig_executor.stop if not @bsig_executor.nil?; end

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
				comp_name, procedure_name = procedure['name'].pop_ref
				component = @root.get(comp_name)
				return nil if component.nil? or not component.respond_to?(procedure_name)
				return component.send(procedure_name) if params.size <= 0
				return component.send(procedure_name, params)
			end
		end

		class BSigExecutor
			SleepTime = 2

			attr_reader :running, :active, :flaws, :goal

			def initialize(owner, goal=nil)
				@owner = owner
				@goal = goal
				@flaws = {}
				@lock_running = Mutex.new
				@lock_running.synchronize { @running = false; @active = false }
				@lock_flaws = Mutex.new
			end

			def start
				Nuri::Util.log 'Starting BSig executor'
				@main_thread = Thread.new {
					@lock_running.synchronize { @running = true; @active = true }

					while @running
						if not self.load_bsig
							Nuri::Util.log 'Cannot load BSig'
							break
						elsif self.at_goal?
							Nuri::Util.log 'At goal state'
							break
						else
							if not self.execute_one
								Nuri::Util.log 'Failed executing BSig'
								break
							end
						end
					end

					@active = false
				}
			end

			def stop
				Nuri::Util.log 'Send stop-signal to BSig executor'
				@lock_running.synchronize { @running = false }
				while @active; sleep 1; end
			end

			def load_bsig
				begin
					# 1) get latest BSig's ID
					bsig_id_file = Nuri::Util.home_dir + '/var/bsig_id'
					return false if not File.exist?(bsig_id_file)
					bsig_id = File.read(bsig_id_file).to_i
	
					# 2) read BSig
					bsig_file = Nuri::Util.home_dir + "/var/bsig_#{bsig_id}"
					return false if not File.exist?(bsig_file)
					@bsig = JSON[File.read(bsig_file)]

					return true

				rescue Exception => exp
					Nuri::Util.log 'Failed: ' + exp.to_s
				end
				return false
			end

			def add_new_flaw(path, value)
				@flaws[path] = [] if not @flaws.has_key?(path)
				@flaws[path] << value
			end

			def at_goal?
				begin
					goal = (@goal.nil? ? @bsig['goal'] : @goal)
					goal.each do |path,value|
						self.add_new_flaw(path, value) if value != @owner.get_state(path)
					end

					@flaws.each { |path,values| return false if values.length > 0 }
				rescue Exception => exp
					Nuri::Util.log 'Failed: ' + exp.to_s
				end
				return true
			end

			def execute_one
				# TODO
				@flaws.each { |path,values| puts path + ': ' + values.length.to_s }

				puts 'execute'
				candidates, selected_operators = self.search_candidates
				subgoals, operator = select_operator(candidates, selected_operators)
				# return false if goal cannot be reached
				return false if operator.nil?

				# check and satisfy the precondition of selected operator
				return false if not check_and_satisfy_precondition(operator)

				# execute the operator
				return false if not @owner.execute(operator)
				# if execution is succeed, remove the flaw from the goal stack
				subgoals.each { |path| @flaws[path].pop }

				return true
			end

			def check_and_satisfy_precondition(operator)
				operator['condition'].each do |path,pre|
					value = @owner.get_state(path)
puts path + ': ' + pre.to_s + ' == ' + value.to_s
					return false if value != pre
					#return false if @owner.get_state(path) != value
				end
				return true
			end

			# Return an operator to be executed and the path of subgoal reached by the operator
			def select_operator(candidates, selected_operators)
				return nil if candidates.nil? or selected_operators.nil? or selected_operators.length <= 0
				# Select the operator that has the highest ID value. Each operator
				# has an ID which represents its index in total-order plan
				selected_operators.uniq!
				selected_operators.sort! { |x,y| x.id <=> y.id } 
				operator = selected_operators.last
				subgoals = []
				candidates.each { |path,operators| subgoals << path if not operators.index(operator).nil? }
				return subgoals, operator
			end

			def search_candidates
				candidates = {}
				selected_operators = []
				@flaws.each do |path,values|
					next if values.length <= 0
					value = values.last
					matched_operators = []
					@bsig['operators'].each do |operator|
						operator['effect'].each { |k,v|
							if path == k and value == v
								matched_operators << operator
								selected_operators << operator
								break
							end
						}
					end
					# return if a flaw cannot be reached by any operator
					# which also means that the goal cannot be achieved
					return nil, nil if matched_operators.length <= 0

					candidates[path] = matched_operators
				end

				# candidates: selected operators which are classified by the flaw
				# selected_operators: all selected operators
				return candidates, selected_operators
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

					# 3) load and deploy BSig by starting the executor -- TODO
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

		def self.stop
			@@daemon = Nuri::Client::Daemon.new
			@@daemon.stop
		end

		def self.reset
			begin
				dir = Nuri::Util.home_dir + '/var'
				Dir.entries(dir).each do |fname|
					path = dir + '/' + fname
					if fname[0, 5] == 'bsig_' and File.file?(path)
						File.delete(path)
					end
				end
			rescue Exception => exp
				$stderr.puts exp.to_s
			end
		end

	end
end
