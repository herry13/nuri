class Nuri::Console
	include Nuri::Helper

	ParentEliminator = Sfp::Visitor::ParentEliminator.new

	def process_args(args, parser)
		Trollop::with_standard_exception_handling parser do
			parser.parse args
		end
	end

	def check_help(args)
		help = args.count { |x| x == '-h' or x == '--help' }
		[(help > 0), args.select { |x| x != '-h' and x != '--help' }]
	end

	def do_state(args=ARGV, cmd="nuri ")
		parser = Trollop::Parser.new do
			banner <<-EOS
Usage: #{cmd}state [options] [path]
where [options] are:
EOS
			opt :model_file, 'file contains a model of desired state', :default => Nuri.main, :short => '-m'
			opt :json, 'print output in JSON'
			opt :no_color, 'disable colorized output'
			opt :no_push_module, 'disable automatic push module'
		end
		help, args = check_help(args)
		opts = process_args args, parser

		if help
			parser.educate(STDOUT)

		elsif File.exist?(opts[:model_file])
			opts[:push_modules] = true if !opts[:no_push_module]
			master = Nuri::Master.new
			master.set_model opts
			state = master.get_state opts
			state.accept(Sfp::Helper::Sfp2Ruby)
			state = state.at?("$.#{args[0]}") if args.length > 0
			puts format_hash(state, opts)

		else
			$stderr.puts format("Model file '#{opts[:model_file]}' is not exist! Use \"-h\" option for more details.", opts, :red)
		end
	end

	def do_plan(args=ARGV, cmd="nuri ")
		def format_operator(op, opts)
			if opts[:no_color]
				"#{op['name']} #{JSON.generate(op['parameters'])}"
			else
 				"#{op['name']} #{CodeRay.encode(JSON.generate(op['parameters']), :json, :terminal)}"
			end
		end

		parser = Trollop::Parser.new do
			banner <<-EOS
Usage: #{cmd}plan [options]
where [options] are:
EOS
			opt :model_file, 'file contains a model of desired state', :default => Nuri.main, :short => '-m'
			opt :parallel, 'generate a parallel plan', :short => '-l'
			opt :apply, 'generate and execute a plan', :short => '-a'
			opt :json, 'print the plan in JSON'
			opt :yaml, 'print the plan in YAML'
			opt :no_color, 'enable colorized output'
			opt :no_interactive, 'disable interactive input'
			opt :no_push_module, 'disable automatic push module'
			opt :image, 'image graph of the generated plan', :default => Dir.home + "/.nuri/plan.png" # ''
		end
		help, args = check_help(args)
		opts = process_args args, parser
	
		if help
			parser.educate(STDOUT)

		elsif File.exist?(opts[:model_file])
			opts[:plan] = true
			opts[:push_modules] = true if !opts[:no_push_module]
			# required to avoid bugs
			json = opts[:json]
			opts[:json] = nil

			# generate plan
			master = Nuri::Master.new
			master.set_model(opts)
			plan = master.get_plan(opts)

			# processing plan
			opts[:json] = json
			if plan.is_a?(Hash) and !plan['workflow'].nil?
				# workflow exists
				if plan['workflow'].length > 0
					plan_file = "#{Dir.home}/.nuri/plan.json"
					# dump the workflow to file
					File.open(plan_file, 'w') { |f| f.write(JSON.generate(plan)) }
					# generate image of the workflow
					system "#{Home}/bin/nuri-sfwgraph #{plan_file} #{opts[:image]}" if opts[:image].strip.length > 0

					if opts[:json] or opts[:yaml]
						puts format_hash(plan, opts)

					else
						actions = plan['workflow']
						if plan['type'] == 'sequential'
							p = 'Sequential Plan:'
							actions.each_index do |i|
								p += "\n#{i+1}. #{format_operator(actions[i], opts)}"
							end
							puts p
						else
							p = 'Partial-Order Plan:'
							actions.each do |op|
								p += "\n#{op['id']+1}. #{format_operator(op, opts)} (#{op['predecessors'].map{|i|i+1}}, #{op['successors'].map{|i|i+1}})"
							end
							puts p
						end

					end

					if not opts[:apply] and not opts[:no_interactive]
						print "Execute the plan [y/N]? "
						opts[:apply] = true if STDIN.gets.chomp.upcase == 'Y'
					end

					if opts[:apply]
						puts 'Executing the plan:'
						opts[:plan] = plan
						if master.execute_plan(opts)
							puts format("Execution success.", opts, :green)
						else
							puts format("Execution failed.", opts, :red)
						end
					end

				elsif plan['workflow'].length == 0
					puts format("Goal state has been achieved.", opts, :green)
				end
			else
				$stderr.puts format("No solution.", opts, :red)
			end
		else
			$stderr.puts format("Model file '#{opts[:model_file]}' is not exist! Use \"-h\" option for more details.", opts, :red)
		end
	end

	def do_bsig(args=ARGV, cmd="nuri ")
		parser = Trollop::Parser.new do
			banner <<-EOS
Usage: #{cmd}bsig [options]
where [options] are:
EOS
			opt :model_file, 'file contains a model of desired state', :default => Nuri.main, :short => '-m'
			opt :apply, 'generate and then deploy a BSig model'
			opt :status, 'get BSig status of all agents'
			opt :purge, 'purge existing BSig model', :short => '-g'
			opt :no_color, 'enable colorized output'
			opt :no_interactive, 'disable interactive input'
			opt :no_push_module, 'disable automatic push module'
		end
		help, args = check_help(args)
		opts = process_args args, parser

		if help
			parser.educate(STDOUT)

		elsif opts[:status]
			opts[:push_modules] = true if !opts[:no_push_module]
			master = Nuri::Master.new
			master.set_model opts
			master.get_state(opts).each do |name,state|
				print "- #{name}: "
				if not state.is_a?(Hash) or not state.has_key?('sfpAddress')
					putf("unknown sfpAddress", opts, :yellow)
				else
					address = state['sfpAddress']
					port = (state['sfpPort'] ? state['sfpPort'] : 1314)
					if address.is_a?(String) and port.is_a?(Fixnum)
						status = Net::HTTP.get(URI("http://#{address}:#{port}/bsig/flaws"))
						if status == '{}'
							putf("no-flaw", opts, :green)
						else
							putf(status, opts, :yellow)
						end
					elsif address.is_a?(Sfp::Undefined)
						putf("not-exist", opts, :yellow)
					elsif address.is_a?(Sfp::Unknown)
						putf("unknown", opts, :yellow)
					end
				end
			end

		elsif File.exist?(opts[:model_file])
			opts[:bsig_deploy] = true
			opts[:parallel] = true
			opts[:push_modules] = true if !opts[:no_push_module]
			master = Nuri::Master.new
			master.set_model(opts)
	
			if opts[:purge]
				print "Purging Behavioural Signature model "
				putf "[Wait]", opts, :yellow

				status = master.purge_bsig(opts)
				print "Purging Behavioural Signature model "

				if status
					putf "[OK]", opts, :green
				else
					putf "[Failed]", opts, :red
				end

			else
				bsig = master.get_bsig(opts)
				if bsig.is_a?(Hash) and bsig.length > 0
					empty_local_bsig = bsig.select { |name,local_bsig| local_bsig['operators'].length <= 0 }
					if empty_local_bsig.length != bsig.length
						puts format_hash(bsig, {:json => true, :no_color => opts[:no_color]})

						if not opts[:no_interactive] and not opts[:apply]
							print "Deploy the BSig model [y/N]? "
							opts[:apply] = true if STDIN.gets.chomp.upcase == 'Y'
						end
	
						if opts[:apply]
							print 'Deploying the BSig model '
							putf "[Wait]", opts, :yellow
							
							opts[:bsig] = bsig
							if master.deploy_bsig(opts)
								print 'Deploying the BSig model '
								putf "[OK]", opts, :green
							else
								print 'Deploying the BSig model '
								putf "[Failed]", opts, :red
							end
						end
					else
						putf "Goal state has been achieved.", opts, :green
					end
				else
					$stderr.puts format("No solution.", opts, :red)
				end
			end
		else
			$stderr.puts format("Model file '#{opts[:model_file]}' is not exist! Use \"-h\" option for more details.", opts, :red)
		end
	end

	def do_agent(args=ARGV, cmd="nuri ")
		parser = Trollop::Parser.new do
			banner <<-EOS
Usage: #{cmd}agent <subcommand> [node] [options]
where <subcommand> is:
       install     install agent (use SSH for remote node)
       upgrade     upgrade agent (use SSH for remote node)
         start     start the agent (use SSH for remote node)
       restart     restart the agent (use SSH for remode node)
          stop     stop the agent (use SSH for remote node)
        status     get status (use SSH for remote node)
         reset     delete all modules, model (desired state), bsig-model,
                    and agents list
         state     get current state
         model     get current model
          bsig     get current Behavioural Signature model
 exec <action>     execute given action description
                    <action> := <path> [param1=value1 param2=value2 ...]
        module     get modules list
           log     get last 100 lines of agent's logs file
          list     list of available agents from model file
  
where [options] are:
EOS
			opt :model_file, 'file contains a model of desired state', :default => Nuri.main, :short => '-m'
			opt :address, "address", :default => 'localhost'
			opt :port, "port", :default => 1314
			opt :ssh_user, "SSH username", :short => '-u', :default => 'root'
			opt :ssh_port, "SSH port", :short => '-p', :default => '22'
			opt :raw, "print a RAW output"
			opt :no_color, 'enable colorized output'
		end
		help, args = check_help(args)
		subcommand = (args.length > 0 ? args.shift : '')
		opts = process_args args, parser
		ssh_opt = ''
		if opts[:address] != 'localhost'
			ssh_opt = "ssh "
			ssh_opt += (opts[:ssh_user] ? "#{opts[:ssh_user]}@#{opts[:address]}" : opts[:address])
			ssh_opt += (opts[:ssh_port] ? " -p #{opts[:ssh_port]}" : '')
		end
	
		if help
			parser.educate(STDOUT)
		elsif `which sfpagent`.strip.length > 0 or ssh_opt.length > 0
			case subcommand
			when 'i', 'install'
				system("#{ssh_opt} sudo gem install sfpagent --no-ri --no-rdoc")

			when 's', 'start'
				system "#{ssh_opt} sfpagent -s && sleep 5"
				system "#{ssh_opt} sfpagent -a"

			when 'r', 'restart'
				system "#{ssh_opt} sfpagent -r"

			when 't', 'stop'
				system("#{ssh_opt} sfpagent -t")

			when 'a', 'status'
				system("#{ssh_opt} sfpagent -a")

			when 'upgrade'
				system("#{ssh_opt} sudo gem update sfpagent --no-ri --no-rdoc")

			when 'e', 'state'
				code, state = get_data(opts[:address], 1314, "/state")
				if code == '200' and state =~ /{.*}/
					state = JSON[state]['state']
					if not opts[:raw]
						state.keys.each { |key| state.delete(key) if state[key]['_context'] != 'object' }
						state.accept(Sfp::Helper::Sfp2Ruby)
					end
					puts format_hash(state, {:no_color => opts[:no_color], :yaml => true})
				else
					puts state
				end

			when 'm', 'model'
				code, model = get_data(opts[:address], 1314, "/model")
				if code == '200' and model =~ /{.+}/
					model = JSON[model]
					if not opts[:raw]
						model.select! { |k,v| k[0,1] != '_' and (not v.is_a?(Hash) or v['_context'] == 'object') }
						model.accept(Sfp::Helper::Sfp2Ruby)
					end
					puts format_hash(model, {:no_color => opts[:no_color], :yaml => true})
				elsif code == '404' or model == '{}'
					putf "Model of desired state is not exist.", opts, :yellow
				else
					$stderr.puts format("Error: #{code}", opts, :red)
				end

			when 'b', 'bsig'
				code, bsig = get_data(opts[:address], 1314, "/bsig")
				if code == '200' and bsig =~ /{.+}/
					json = JSON.pretty_generate(JSON[json])
					puts format_hash(JSON[json], {:no_color => opts[:no_color], :json => true})
				elsif code == '404' or bsig == '{}'
					putf 'Behavioural Signature model is not exist.', opts, :yellow
				else
					$stderr.puts format("Error: #{code}", opts, :red)
				end

			when 'mod', 'module', 'modules'
				code, modules = get_data(opts[:address], 1314, "/modules")
				if code == '200' and modules =~ /{.+}/
					output = YAML.dump(JSON[modules])
					puts format_hash(JSON[modules], {:no_color => opts[:no_color], :json => true})
				elsif code == '404' or modules == '{}'
					putf 'No module is available.', opts, :yellow
				else
					$stderr.puts format("Error: #{code}", opts, :red)
				end

			when 'x', 'exec', 'execute'
				if args.length > 0
					name = args.shift
					name = '$.' + name if !name.isref
					parameters = {}
					args.each do |arg|
						if arg =~ /=/
							arg = arg.split('=', 2)
							parameters[arg[0]] = arg[1]
						end
					end
					data = { 'action' => JSON.generate({ 'name' => name, 'parameters' => parameters }) }
					code, _ = post_data(opts[:address], 1314, "/execute", data)
					if code == '200'
						putf "Executing #{name} [OK]", opts, :green
					else
						putf "Executing #{name} [Failed]", opts, :red
					end
				else
					$stderr.puts format('Invalid parameters (usage: agent exec <action-path> [action-arguments]).', opts, :red)
				end

			when 'g', 'log', 'logs'
				puts Net::HTTP.get "#{opts[:address]}", "/log", 1314

			when 'l', 'list'
				get_agents(opts).each { |name,model| puts "#{name} address=#{model['sfpAddress']} port=#{model['sfpPort']}" }

			when 'reset'
				codes = []
				codes[0], _ = delete_data(opts[:address], 1314, "/bsig")
				codes[1], _ = delete_data(opts[:address], 1314, "/model/cache")
				codes[2], _ = delete_data(opts[:address], 1314, "/model")
				codes[3], _ = delete_data(opts[:address], 1314, "/modules")
				codes[4], _ = delete_data(opts[:address], 1314, "/agents")

				if (codes.index { |x| x != '200' })
					putf "Reset agent [Failed] - #{codes.inspect}", opts, :red
				else
					putf "Reset agent [OK]", opts, :green
				end

			when 'h', 'help'
				parser.educate(STDOUT)

			else
				$stderr.puts format('Unrecognized command! Use -h to print available commands.', opts, :red)
			end
		else
			$stderr.puts format('sfpagent gem is not installed!', opts, :red)
		end
	end

	def do_edit(args=ARGV)
		file = (args[0].nil? ? Nuri.main : args[0].to_s)
		if file == '-h' or file == '--help'
			puts <<-EOS
Usage: edit <filepath>
EOS
		opts = process_args args, parser

		elsif File.exist?(file)
			system "#{Nuri.config['editor']} #{file}"

		else
			$stderr.puts format('Target file is not specified!', opts, :red)

		end
	end

	def get_agents(opts={})
		opts[:push_modules] = true if !opts[:no_push_module]
		master = Nuri::Master.new
		master.set_model opts
		state = master.get_state opts
		agents = {}
		state.each do |name,model|
			agents[name] = {
				'sfpAddress' => (model.is_a?(Hash) and model['sfpAddress'].is_a?(String) ? model['sfpAddress'] : ''),
				'sfpPort' => (model.is_a?(Hash) and model['sfpPort'].is_a?(Fixnum) ? model['sfpPort'] : 0)
			}
		end
		agents
	end

	def do_console
		banner = <<-EOS
Usage: <command> [options]
where <command> is:
  [s]tate     get current state
  [p]lan      generate a plan
  [b]sig      deployment with distributed mechanism
  [a]gent     manage the agent
  [e]dit      edit model file
  [m]odel     generate the desired state
  help        print this help
  exit        exit this console

EOS

		username = `whoami`.strip
		puts About
		loop do
			begin
				print "nuri@#{username}> ".cyan
				begin
					input = STDIN.gets
					raise Exception if input.nil?
				rescue Exception
					puts ''
					break
				end
				input = input.chomp.strip
				if input.length <= 0
				elsif input[0] == '!'
					system(input[1..input.length])
				else
					command, args = input.split(' ', 2)
					break if command == 'exit' or command == 'quit' or command == 'q'
					args = args.to_s.split(' ')
					command = args[0] and args = ['-h'] if command == 'help' and args.length > 0
					case command
					when 's', 'state'
						do_state args, ''
					when 'p', 'plan', 'orchestrate'
						do_plan args, ''
					when 'b', 'bsig', 'choreograph'
						do_bsig args, ''
					when 'a', 'agent'
						do_agent args, ''
					when 'e', 'edit'
						do_edit args
					when 'm', 'model'
						do_model args
					when 'cd'
						Dir.chdir(args[0].to_s)
					when 'pwd'
						puts Dir.pwd
					when 'l', 'ls'
						system "ls #{args.join(" ")}"
					when 'ws', 'workspace'
						Dir.chdir(File.dirname(Nuri.main))
					when 'help'
						puts banner
					when 'version', '-v'
						puts About
					else
						$stderr.puts format('Unrecognized command! Type "help" to print available commands.', {}, :red)
					end
				end
			rescue Exception => e
				$stderr.puts format("#{e}\n#{e.backtrace.join("\n")}", {}, :red)
			end
		end
		putf "Bye!\n", {}, :green
	end

	def do_model(args=ARGV, cmd='nuri')
		parser = Trollop::Parser.new do
			banner <<-EOS
Usage: #{cmd}state [options]
where [options] are:
EOS
			opt :model_file, 'file contains a model of desired state', :default => Nuri.main, :short => '-m'
			opt :json, 'print output in JSON'
			opt :no_color, 'enable colorized output'
		end
		help, args = check_help(args)
		opts = process_args args, parser

		if help
			parser.educate(STDOUT)

		elsif File.exist?(opts[:model_file])
			@parser = Sfp::Parser.new({:home_dir => File.dirname(opts[:model_file])})
			@parser.parse File.read(opts[:model_file])
			model = @parser.root
			model.accept(ParentEliminator)
			model.select! { |k,v| k[0,1] != '_' and (not v.is_a?(Hash) or v['_context'] == 'object') }
			model.accept(Sfp::Helper::Sfp2Ruby)
			puts format_hash(model, opts)

		else
			$stderr.puts format("Model file '#{opts[:model_file]}' is not exist! Use \"-h\" option for more details.", opts, :red)

		end
	
	end

	def run
		banner = <<-EOS
Usage: nuri [command]
where [command] is:
    model     get compilation result of the model
    state     get the current state
     plan     generate the plan
     bsig     deployment with distributed mechanism
    agent     manage the agent
  console     enter console
  version     print the version

EOS

		if ARGV.length > 0
			success = false
			case ARGV.shift
			when 's', 'state'
				do_state
			when 'p', 'plan'
				do_plan
			when 'b', 'bsig'
				do_bsig
			when 'a', 'agent'
				do_agent
			when 'c', 'console'
				do_console
			when 'e', 'edit'
				do_edit
			when 'm', 'model'
				do_model
			when 'v', 'version'
				puts About
			else
				puts banner
			end
		else
			puts banner
		end
	end

	private
	def format_hash(hash, opts={})
		if opts[:json]
			(opts[:no_color] ? JSON.pretty_generate(hash) : CodeRay.encode(JSON.pretty_generate(hash), :json, :terminal))
		else
			(opts[:no_color] ? YAML.dump(hash) : CodeRay.encode(YAML.dump(hash), :yaml, :terminal))
		end
	end

	def format(msg, opts={}, color=:yellow)
		if not opts[:no_color]
			case color
			when :yellow
				return msg.yellow
			when :red
				return msg.red
			when :green
				return msg.green
			end
		end
		msg
	end

	def putf(msg, opts={}, color=:yellow)
		puts format(msg, opts, color)
	end
end
