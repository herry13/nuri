require 'net/http'

module Nuri
	module Master
		class Daemon
			attr_accessor :verify_execution

			include Nuri::Config

			def initialize
				self.load
				@main = self.get_main
				@verify_execution = true
			end

			def get_plan(state=nil)
				sfp = Nuri::Sfp.deep_clone(@main)
				sfp.delete('system')
				sfp['initial'] = (state == nil ? self.get_state :
						Nuri::Sfp.deep_clone(state))
				sfp.accept(Nuri::Sfp::SfpGenerator.new(sfp))
				planner = Nuri::Planner::Solver.new
				return planner.solve_sfp_to_json(sfp)
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
				plan = planner.solve_sfp_to_sfw(sfp)

puts JSON.pretty_generate(plan)
				# TODO -- execute the plan here
				succeed = true
				if plan['workflow'] != nil
					plan['workflow'].each do |action|
						node = self.get_node(action['name'], @main['system'])
						succeed = self.execute(action, node['domainname']) if node != nil
						break if not succeed
					end
				end
				succeed
			end

			def execute(action, address)
				def verify(action)
					state = get_state
					action['effects'].each do |key,value|
						raise Nuri::ExecutionFailedException, action['name'] if state.at?(key) != value
puts '...OK'
					end
				end

				url = URI.parse('http://' + address + ':' + Nuri::Port.to_s + '/exec')
				data = JSON.generate(action)
				begin
print 'exec: ' + action['name']
					req = Net::HTTP::Put.new(url.path)
					res = Net::HTTP.start(url.host, url.port) { |http| http.request(req, data) }
					verify(action) if @verify_execution

					return true if res.code == '200'
				rescue ExecutionFailedException => efe
					Nuri::Util.log efe.to_s
				rescue Exception => e
					Nuri::Util.log 'Cannot execute action: ' + action['name']
				end
puts '...FAILED'
				false
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
