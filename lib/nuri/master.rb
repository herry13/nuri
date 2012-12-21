require 'net/http'
require 'base64'

module Nuri
	module Master
		class Daemon
			include Nuri::Config

			attr_accessor :do_verify_execution

			def initialize
				self.load(false)
				@main = self.get_main
				@do_verify_execution = true
			end

			def debug_json
				sfp = Nuri::Sfp.deep_clone(@main)
				sfp.delete('system')
				sfp['initial'] = self.get_state
				sfp.accept(Nuri::Sfp::SfpGenerator.new(sfp))
				puts Nuri::Sfp::to_pretty_json(sfp);
			end

			def debug_sas
				sfp = Nuri::Sfp.deep_clone(@main)
				sfp.delete('system')
				sfp['initial'] = self.get_state
				sfp.accept(Nuri::Sfp::SfpGenerator.new(sfp))
				@parser = Nuri::Sfp::Parser.new
				@parser.root = sfp
				puts @parser.to_sas
			end

			def get_state(path='')
				return nil if not @main.has_key?('system')

				current_state = {'_context'=>'state', '_self'=>'initial'}
				@main['system'].each do |key,node|
					next if key[0,1] == '_' or
					        node['_classes'].rindex(MainComponent) == nil or
					        node['domainname'] == ''
					state = self.get_child_state(node['domainname'])
					if state != nil
						state.each { |k,v| current_state[k] = v }
					else
						# TODO
						#current_state[key] = Nuri::Sfp.deep_clone(node)
					end
				end
				current_state
			end

=begin
			def challenge_child(address)
				begin
					url = URI.parse("http://#{address}:#{Nuri::Port}/status/secure")
					req = Net::HTTP::Get.new(url.path)
					res = Net::HTTP.start(url.host, url.port) { |http| http.request(req) }
					return true if res.code == '200'
					if res.code == '404'
						return self.send_public_key_to_child(address)
					end
				rescue Exception => e
					Nuri::Util.log "Cannot challenge node #{address}: " + e.to_s
				end
				false
			end

			def get_child_public_key(address)
				url = URI.parse("http://#{address}:#{Nuri::Port}/status/public_key")
				req = Net::HTTP::Get.new(url.path)
				res = Net::HTTP.start(url.host, url.port) { |http| http.request(req) }
				return nil if res.code != '200'
				return res.body
			end
	
			def send_public_key_to_child(address)
				data = self.get_child_public_key(address)
				return false if data == nil

				child_pub_key = OpenSSL::PKey::RSA.new data
				key = Nuri::SSL.public_key_to_s
				pass_phrase = Nuri::SSL.random_string
				salt = Nuri::SSL.random_string[0,8]
				encrypter = OpenSSL::Cipher::Cipher.new 'AES-128-CBC'
				encrypter.encrypt
				encrypter.pkcs5_keyivgen pass_phrase, salt
				encrypted = encrypter.update key
				encrypted << encrypter.final

				data = {
					'data1' => Base64.encode64(child_pub_key.public_encrypt(pass_phrase)),
					'data2' => Base64.encode64(child_pub_key.public_encrypt(salt)),
					'data3' => Base64.encode64(encrypted)
				}
				data = JSON.generate(data)

				url = URI.parse("http://#{address}:#{Nuri::Port}/status/master")
				req = Net::HTTP::Post.new(url.path)
				res = Net::HTTP.start(url.host, url.port) { |http| http.request(req, data) }
				return true if res.code == '200'

				false
			end
=end

			def get_child_state(address)
				#return nil if not self.challenge_child(address)

				begin
					code, body = self.get_data(address, Nuri::Port, '/state')
					if code == '200'
						json = JSON.parse(body)
						return json['value'] if json.is_a?(Hash) and json.has_key?('value')
					end
				rescue Exception => e
					Nuri::Util.log 'Cannot get state of node ' + address + ': ' + e.to_s
				end
				nil
			end

			def create_task(state=nil)
				sfp_task = Nuri::Sfp.deep_clone(@main)
				sfp_task.delete('system')
				sfp_task['initial'] = (state == nil ? self.get_state : Nuri::Sfp.deep_clone(state))
				sfp_task.accept(Nuri::Sfp::SfpGenerator.new(sfp_task))
				return sfp_task
			end

			def get_bsig(state=nil)
				sfp_task = create_task(state)
				planner = Nuri::Planner::Solver.new
				plan = planner.solve_sfp(sfp_task)
				bsig = (plan.nil? ? nil : planner.to_bsig)
				return bsig
			end

			def reset
				system = get_system_information
				system.each_value do |address|
					begin
						put_data(address, Nuri::Port, '/reset', '')
					rescue Exception => e
						Nuri::Util.log 'Cannot reset ' + address.to_s + ' (' + e.to_s + ')'
					end
				end
			end

			def apply_bsig(debug=false)
				bsig = self.get_bsig
				puts JSON.pretty_generate(bsig) if debug
				return true if bsig['operators'].nil? or bsig['operators'].length <= 0
				begin
					Nuri::Util.log "Sending BSig: #{bsig['id']}"

					# update system information
					self.update_system

					# send BSig operators to clients
					nodes = []
					bsig['operators'].each do |operator|
						node = self.get_node(operator['name'], @main['system'])
						return false if node.nil?

						address = node['domainname']
						json = {'id' => bsig['id'], 'operator' => operator}
						data = "json=" + JSON.generate(json)
						code, _ = put_data(address, Nuri::Port, '/bsig', data)
						if code != '200'
							raise Exception, "sending BSig operator:#{code},#{address}"
						end
						nodes << address
					end

					# send BSig goal to clients
					bsig['goal'].each do |var_name,value|
						node = self.get_node(var_name, @main['system'])
						return false if node.nil?

						address = node['domainname']
						json = {'id' => bsig['id'], 'goal' => {var_name => value}}
						data = "json=" + JSON.generate(json)
						code, _ = put_data(address, Nuri::Port, '/bsig', data)
						if code != '200'
							raise Exception, "sending BSig goal:#{code},#{address}"
						end
						nodes << address
					end

					# send deployment signal to all clients
					nodes.uniq!
					Nuri::Util.log "Activate BSig ID #" + bsig['id'].to_s
					json = {'id' => bsig['id']}
					data = "json=" + JSON.generate(json)
					nodes.each do |address|
						code, _ = put_data(address, Nuri::Port, '/bsig/activate', data)
						if code != '200'
							raise Exception, "Failed-activate BSig:#{code},#{address}"
						end
					end

				rescue Timeout::Error
					Nuri::Util.log 'Timeout on sending BSig to clients'
					return false
				rescue Exception => exp
					Nuri::Util.log 'Failed: ' + exp.to_s
					return false
				end

				return true
			end

			def get_plan(state=nil, json=false, parallel=false)
				sfp_task = create_task(state)
				planner = Nuri::Planner::Solver.new
				return planner.solve_sfp(sfp_task, json, parallel)
			end

			def apply(parallel=false, debug=false)
				state = get_state
				plan = self.get_plan(state, false, parallel)
				puts JSON.pretty_generate(plan) if debug
				self.execute_workflow(plan)
			end

			def execute_workflow(plan)
				state = get_state
				succeed = true
				if plan['workflow'] != nil
					begin
						plan['workflow'].each do |action|
							node = self.get_node(action['name'], @main['system'])
							if node == nil
								succeed = false
							else
								succeed = self.execute(action, node['domainname'], state)
							end
							break if not succeed
							state = get_state
						end
					rescue Timeout::Error
						succeed = false
						# TODO: retry exec the workflow here
					end
				end
				succeed
			end

			def execute(action, address, current_state=nil)
				def verify(action)
					state = get_state
					action['effect'].each do |key,value|
						v = state.at?(key)
						raise Nuri::ExecutionFailedException, action['name'] if state.at?(key) != value
						puts 'OK'
					end
				end

				print 'exec: ' + action['name'] + '...'
				data = { 'action' => action, 'system' => self.get_system_information }
				data = "json=" + JSON.generate(data)
				begin
					code, _ = put_data(address, Nuri::Port, '/exec', data)
					if code == '200'
						verify(action) if @do_verify_execution
						return true
					end
				rescue Timeout::Error
					Nuri::Util.log "Timeout when executing: " + action['name']
					raise Timeout::Error
				rescue ExecutionFailedException => efe
					Nuri::Util.log efe.to_s
				rescue Exception => e
					Nuri::Util.log 'Cannot execute action: ' + action['name']
				end
				puts 'FAILED'
				false
			end

			def get_system_information
				system = {}
				@main['system'].each do |key,value|
					next if key[0,1] == '_'
					if value.is_a?(Hash) and value.isobject and
						value['_classes'].rindex(Nuri::Config::MainComponent) != nil

						system[key] = value['domainname']
					end
				end
				system
			end

			def update_system
				system = get_system_information
				system.each_value do |target|
					begin
						post_data(target, Nuri::Port, '/system', system)
					rescue Exception => e
						Nuri::Util.log 'Cannot send system information to ' + target.to_s + ' (' + e.to_s + ')'
					end
				end
			end

		end

		def self.start
			# TODO -- start Nuri master
		end

		def self.apply(debug=false)
			master = Nuri::Master::Daemon.new
			master.apply(false, debug)
		end

		def self.pull
			master = Nuri::Master::Daemon.new
			return master.get_state
		end

		def self.plan(parallel=false)
			master = Nuri::Master::Daemon.new
			return master.get_plan(nil, true, parallel)
		end

		def self.get_bsig
			master = Nuri::Master::Daemon.new
			return master.get_bsig
		end

		def self.apply_bsig(debug=false)
			master = Nuri::Master::Daemon.new
			return master.apply_bsig(debug)
		end

		def self.debug_json
			master = Nuri::Master::Daemon.new
			master.debug_json
		end

		def self.debug_sas
			master = Nuri::Master::Daemon.new
			master.debug_sas
		end

		def self.exec(sfw_file)
			plan = nil
			File.open(sfw_file) { |f| plan = JSON[ f.read ] }
			if plan != nil
				master = Nuri::Master::Daemon.new
				if master.execute_workflow(plan)
					puts 'Execution succeed!'
				else
					puts 'Execution failed!'
				end
			else
				puts 'Invalid workflow (sfw) file'
			end
		end

		def self.reset
			master = Nuri::Master::Daemon.new
			master.reset
		end

		def self.update_system
			master = Nuri::Master::Daemon.new
			master.update_system
		end

	end
end
