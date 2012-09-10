require 'net/http'

module Nuri
	module Master
		class Daemon
			include Nuri::Config

			def initialize
				self.load
				@main = self.get_main
			end

			def get_plan(state=nil)
				sfp = Nuri::Sfp.deep_clone(@main)
				sfp.delete('system')
				sfp['initial'] = (state == nil ? self.get_state :
						Nuri::Sfp.deep_clone(state))
				sfp.accept(Nuri::Sfp::SfpGenerator.new(sfp))
				planner = Nuri::Planner::Solver.new
				return planner.solve_sfp(sfp)
			end

			def get_state(path='')
				return nil if not @main.has_key?('system')
				current_state = {'_context'=>'state', '_self'=>'initial'}
				@main['system'].each do |key,node|
					next if key[0,1] == '_' or not node['_isa'] == '$.Node' or
							node['domainname'] == ''
					state = self.get_child_state(node['domainname'])
					if state != nil
						state.each { |k,v| current_state[k] = v }
					end
				end
				current_state
			end
	
			def get_child_state(address)
				begin
					url = URI.parse('http://' + address + ':' + Nuri::Port.to_s + '/state')
					req = Net::HTTP::Get.new(url.path)
					res = Net::HTTP.start(url.host, url.port) { |http| http.request(req) }
					json = JSON.parse(res.body)
					return json['value'] if json.is_a?(Hash) and json.has_key?('value')
				rescue Exception => e
					Nuri::Util.log 'Cannot get state of node ' + address + ': ' + e.to_s
				end
				nil
			end

			def apply
				state = get_state
				sfp = Nuri::Sfp.deep_clone(@main)
				sfp.delete('system')
				sfp['initial'] = state
				sfp.accept(Nuri::Sfp::SfpGenerator.new(sfp))
				planner = Nuri::Planner::Solver.new
				plan = planner.solve_sfp_to_json(sfp)

				puts JSON.pretty_generate(plan)
				# TODO -- execute the plan here
				if plan['workflow'] != nil
					plan['workflow'].each do |action|
						node = self.get_node(action['name'], @main['system'])
						self.execute(action, node['domainname']) if node != nil
					end
				end

			end

			def execute(action, address)
				url = URI.parse('http://' + address + ':' + Nuri::Port.to_s + '/exec')
				data = JSON.generate(action)
				puts data, url
				begin
					Net::HTTP.start(url.host, url.port) do |http|
						headers = {'Content-Type' => 'application/json; charset=utf-8'}
						response = http.send_request('PUT', url.request_uri, data, headers)
						puts "Response #{response.code} #{response.message}: #{response.body}"
					end
				rescue Exception => e
					Nuri::Util.log 'Cannot execute action: ' + action['name']
					return false
				end
				true
			end

			def get_node(path, root)
				while path != '$'
					path = path.to_top
					n = root.at?(path)
					return n if n != nil and n['_isa'] == '$.Node'
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

		def self.state
			master = Nuri::Master::Daemon.new
			return master.get_state
		end

		def self.plan
			master = Nuri::Master::Daemon.new
			return master.get_plan
		end
	end
end

=begin
		def get_plan
			sfp = Nuri::Sfp.deep_clone(@main)
			sfp.delete('system')
			sfp['initial'] = self.get_state
			sfp.accept(Nuri::Sfp::SfpGenerator.new(sfp))
			planner = Nuri::Planner::Solver.new
			return planner.solve_sfp(sfp)
		end

		def start
			sleep_time = 2 # in seconds
			@running = true
			begin
				Nuri::Sfp::Parser.dump(self.get_state)
				Kernel.sleep(sleep_time)
			end while @running
		end

		def stop
		end
	end
end

m = Nuri::Master.new
m.start
=end
