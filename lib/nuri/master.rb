require 'net/http'
require 'base64'

module Nuri
	module Master
		class Daemon
			attr_accessor :do_verify_execution

			include Nuri::Config

			def initialize
				self.load(false)
				@main = self.get_main
				@do_verify_execution = true
			end

			def get_bsig(state=nil)
				sfp = Nuri::Sfp.deep_clone(@main)
				sfp.delete('system')
				sfp['initial'] = (state == nil ? self.get_state : Nuri::Sfp.deep_clone(state))
				sfp.accept(Nuri::Sfp::SfpGenerator.new(sfp))
				planner = Nuri::Planner::Solver.new
				return planner.solve_sfp_to_json(sfp, {:parallel => true})
			end

			def get_plan(state=nil)
				sfp = Nuri::Sfp.deep_clone(@main)
				sfp.delete('system')
				sfp['initial'] = (state == nil ? self.get_state : Nuri::Sfp.deep_clone(state))
				sfp.accept(Nuri::Sfp::SfpGenerator.new(sfp))
				planner = Nuri::Planner::Solver.new
				return planner.solve_sfp_to_json(sfp)
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

			def apply
				state = get_state
				sfp = Nuri::Sfp.deep_clone(@main)
				sfp.delete('system')
				sfp['initial'] = Nuri::Sfp.deep_clone(state)
				sfp.accept(Nuri::Sfp::SfpGenerator.new(sfp))
				planner = Nuri::Planner::Solver.new
				plan = planner.solve_sfp_to_sfw(sfp)

				puts JSON.pretty_generate(plan)
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
						send_data(target, Nuri::Port, '/system', system)
					rescue Exception => e
						Nuri::Util.log 'Cannot send system information to ' + target.to_s + ' (' + e.to_s + ')'
					end
				end
			end

			# Send data to remote address in JSON format
			def post_data(address, port, path, data)
				url = URI.parse('http://' + address + ':' + port.to_s + path)
				data = "json=" + JSON.generate(data)
				req = Net::HTTP::Post.new(url.path)
				res = Net::HTTP.start(url.host, url.port) { |http| http.request(req, data) }
				return res.code, res.body
			end

			def get_data(address, port, path)
				url = URI.parse('http://' + address + ':' + port.to_s + path)
				req = Net::HTTP::Get.new(url.path)
				res = Net::HTTP.start(url.host, url.port) { |http| http.request(req) }
				return res.code, res.body
			end

			def put_data(address, port, path, data)
				url = URI.parse('http://' + address + ':' + port.to_s + path)
				req = Net::HTTP::Put.new(url.path)
				res = Net::HTTP.start(url.host, url.port) { |http| http.request(req, data) }
				return res.code, res.body
			end

			def get_node(path, root)
				while path != '$'
					path = path.to_top
					n = root.at?(path)
					return n if n != nil and n['_classes'].rindex(MainComponent) != nil
				end
			end
		end

		def self.start
			# TODO -- start Nuri master
		end

		def self.apply
			master = Nuri::Master::Daemon.new
			master.apply
		end

		def self.pull
			master = Nuri::Master::Daemon.new
			return master.get_state
		end

		def self.plan
			master = Nuri::Master::Daemon.new
			return master.get_plan
		end

		def self.get_bsig
			master = Nuri::Master::Daemon.new
			return master.get_bsig
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

		def self.update_system
			master = Nuri::Master::Daemon.new
			master.update_system
		end

	end
end
