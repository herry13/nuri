class Sfp::Module::Service2
	include Sfp::Resource

	def update_state
		to_model

		@state['running'] = running?
	end

	##############################
	#
	# Action methods (see service2.sfp)
	#
	##############################

	def start(p={})
		return true if running?

		if @model['name'].to_s.strip.length > 0
			shell "sudo service #{@model['name']} start"
		elsif @model['script'].to_s.strip.length > 0
			shell "sudo #{@model['script']} start"
		else
			return false
		end
		sleep 1
		running?
	end

	def stop(p={})
		return true if not running?

		if @model['name'].to_s.strip.length > 0
			shell "sudo service #{@model['name']} stop"
		elsif @model['script'].to_s.strip.length > 0
			shell "sudo #{@model['script']} stop"
		else
			return false
		end
		sleep 1
		not running?
	end


	##############################
	#
	# Helper methods
	#
	##############################

	def running?
		output = nil
		if @model['name'].to_s.strip.length > 0
			output = `service #{@model['name']} status 2>/dev/null`.to_s.downcase
		elsif @model['script'].to_s.strip.length > 0
			output = `#{@model['script']} status 2>/dev/null`.to_s.downcase
		else
			return false
		end
		return !!(output =~ /is running/ or output =~ /start\/running/ or output =~ /uptime/)
	end
end
