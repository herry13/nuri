require 'thread'

module Nuri::Choreographer
	include Nuri::Helper

	def get_bsig(p={})
		def postprocess(bsig)
			# postprocessing BSig model by removing operator's condition/effect and BSig's goal that has value Sfp::Undefined
			bsig['operators'].each { |op|
				op['condition'].keys.each { |var| op['condition'].delete(var) if op['condition'][var].is_a?(Sfp::Undefined) }
				op['effect'].keys.each { |var| op['effect'].delete(var) if op['effect'][var].is_a?(Sfp::Undefined) }
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
		puts "Choreographing " + format_benchmark(choreographing_time)

		# bsig
		local_bsigs
	end

	def deploy_bsig(p={})
		fail "BSig model is not exist (parameter :bsig)!" if p[:bsig].nil?

		return false if not push_cache_model(p)

		return false if not clear_agents_list

		push_agents_list

		success = true
		p[:bsig].each do |name,bsig|
			address = @model.at?("$.#{name}.sfpAddress")
			port = @model.at?("$.#{name}.sfpPort")
			if !address.is_a?(String) or address.length <= 0 or !port.is_a?(Fixnum) or port <= 0
				puts (p[:color] ? "[Warn]".yellow : "[Warn]") + " Agent #{name} is not exist!"
				next
			end

			data = {'bsig' => JSON.generate(bsig)}
			code = nil
			begin
				code, _ = put_data(address, port, '/bsig', data)
			rescue
			end
			if code == '200'
				puts "Deploying BSig model to #{name}@#{address}:#{port} " + (p[:color] ? "[OK]".green : "[OK]")
			else
				$stderr.puts "Deploying BSig model to #{name}@#{address}:#{port} " + (p[:color] ? "[Failed]".red : "[Failed]")
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
					code = nil
					begin
						code, _ = put_data(address, port, "/model/cache/#{target_name}", data)
					rescue
					end
					if code == '200'
						puts "Sending model of #{name} to #{address}:#{port} " + (p[:color] ? "[OK]".green : "[OK]")
					else
						$stderr.puts "Sending model of #{name} to #{address}:#{port} " + (p[:color] ? "[Failed]".red : "[Failed]")
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

			code = nil
			begin			
				code1, _ = delete_data(address, port, '/bsig')
				code2, _ = delete_data(address, port, '/agents')
			rescue
			end
			if code1 == '200' and code2 == '200'
				puts "Purging BSig model: #{name}@#{address}:#{port} " + (p[:color] ? "[OK]".green : "[OK]")
			else
				$stderr.puts "Purging BSig model: #{name}@#{address}:#{port} " + (p[:color] ? "[Failed]".red : "[Failed]")
				success = false
			end
		end
		
		success		
	end
end
