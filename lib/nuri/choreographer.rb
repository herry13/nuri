require 'thread'

module Nuri::Choreographer
	include Nuri::Net::Helper

	def get_bsig(p={})
		def postprocess(bsig)
			# postprocessing BSig model by removing operator's condition/effect and BSig's goal that has value Sfp::Undefined
			bsig['operators'].each { |op|
				op['condition'].keys.each { |var| op['condition'].delete(var) if op['condition'][var].is_a?(Sfp::Undefined) }
				op['effect'].keys.each { |var| op['effect'].delete(var) if op['effect'][var].is_a?(Sfp::Undefined) }

				#op['condition'].keys.each { |var| op['condition'].delete(var) if var =~ /^\$\.[a-zA-Z0-9]+\.in_cloud$/ }
				#op['condition'].keys.each { |var| op['effect'].delete(var) if var =~ /^\$\.[a-zA-Z0-9]+\.in_cloud$/ }
			}
			bsig['goal'].keys.each { |var|
				if bsig['goal'][var].is_a?(Sfp::Undefined)
					bsig['goal'].delete(var)
					bsig['goal_operator'].delete(var)
				end
			}
		end

		# set parameters value to be given to the planner
		p[:sfp] = self.create_plan_task(p)
		p[:sas_post_processor] = @sas_post_processor
		p[:parallel] = true
		p[:bsig] = true

		bsig = local_bsigs = plan = nil
		choreographing_time = Benchmark.measure do
			# generate Global BSig model
			planner = Sfp::Planner.new
			bsig = planner.solve(p)

			postprocess(bsig)

			# generate local BSig model
			local_bsigs = {}
			self.get_agents.each do |name,model|
				ref = model.ref
				local = {'id' => bsig['id'], 'operators' => [], 'goal' => {}}
				bsig['operators'].each { |op| local['operators'] << op if op['name'][0, ref.length] == ref }
				bsig['goal_operator'].each { |var,op_name| local['goal'][var] = bsig['goal'][var] if op_name[0, ref.length] == ref }
				local_bsigs[name] = local
			end
		end
		puts "Choreographing: #{choreographing_time}"

		# bsig
		local_bsigs
	end

	def deploy_bsig(p={})
		fail "BSig model is not exist (parameter :bsig)!" if p[:bsig].nil?

		return false if not push_cache_model(p)

		success = true
		p[:bsig].each do |name,bsig|
			address = @model.at?("$.#{name}.sfpAddress")
			port = @model.at?("$.#{name}.sfpPort")
			#fail "Invalid agent's address: #{name}"
			if !address.is_a?(String) or address.length <= 0 or !port.is_a?(Fixnum) or port <= 0
				puts "Agent #{name} is not exist!".yellow
				next
			end

			data = {'bsig' => JSON.generate(bsig)}
			code, _ = put_data(address, port, '/bsig', data)
			if code == '200'
				puts "Deploying BSig model to #{name}@#{address}:#{port} [OK]".green
			else
				$stderr.puts "Deploying BSig model to #{name}@#{address}:#{port} [Failed]".red
				success = false
			end
		end
		success
	end

	def push_cache_model(p={})
		p[:bsig].each do |name,bsig|
			address = @model.at?("$.#{name}.sfpAddress")
			port = @model.at?("$.#{name}.sfpPort")
			next if !address.is_a?(String) or address.length <= 0 or !port.is_a?(Fixnum) or port <= 0

			bsig['operators'].each { |operator|	
				if operator['name'] =~ /^\$(\.[a-zA-Z0-9_]+)*\.create_vm/
					target_ref = operator['parameters']['$.vm']
					_, target_name, _ = target_ref.split('.', 3)

					data = { 'model' => Sfp::Helper.deep_clone(@model[target_name]),
					         'bsig' => p[:bsig][target_name] }
					data.accept(Sfp::Visitor::ParentEliminator.new)

					push_modules(@model[target_name], address, port)

					data = {'model' => JSON.generate(data)}
					code, _ = put_data(address, port, "/model/cache/#{target_name}", data)
					if code == '200'
						puts "Sending model of #{name} to #{address}:#{port} [OK]".green
					else
						$stderr.puts "Sending model of #{name} to #{address}:#{port} [Failed]".red
						return false
					end
				end
			}

			return true
		end

		false
	end

	def purge_bsig(p={})
		# update the model to populate VM's IP address
		self.get_state(p)

		# purge BSig model by requesting: HTTP PUT /bsig
		# but without parameter 'bsig' (empty data)
		success = true
		self.get_agents.each do |name,model|
			address = model['sfpAddress']
			port = model['sfpPort']
			next if !address.is_a?(String) or address.length <= 0 or !port.is_a?(Fixnum) or port <= 0
			#fail "Invalid agent's address: #{name}" if !address.is_a?(String) or address.length <= 0 or !port.is_a?(Fixnum) or port <= 0
			
			code, _ = put_data(address, port, '/bsig', {})
			if code == '200'
				puts "Purging BSig model: #{name}@#{address}:#{port} [OK]".green
			else
				$stderr.puts "Purging BSig model: #{name}@#{address}:#{port} [Failed]".red
				success = false
			end
		end
		success
		
	end
end
