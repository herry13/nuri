require File.expand_path(File.dirname(__FILE__)) + "/../aptpackage/aptpackage.rb"

class Sfp::Module::Service < Sfp::Module::AptPackage
	def update_state
		to_model
		if @model.is_a?(Hash)
			@state['installed'] = installed?
			@state['version'] = version?
			@state['running'] = Sfp::Module::Service.running?(@model['service_name'])
		end
	end

	##############################
	#
	# Action methods (see TarPackage.sfp)
	#
	##############################

	def start(p={})
		service = @model['service_name'].to_s.strip
		return false if service.length <= 0
		return true if Sfp::Module::Service.running?(service)
		system("sudo service #{service} start")
		sleep 1
		return Sfp::Module::Service.running?(service)
	end

	def stop(p={})
		service = @model['service_name'].to_s.strip
		return false if service.length <= 0
		return true if not Sfp::Module::Service.running?(service)
		system("sudo service #{service} stop")
		sleep 1
		return !Sfp::Module::Service.running?(service)
	end


	##############################
	#
	# Helper methods
	#
	##############################

	def self.running?(service)
		service = service.to_s
		return false if service.length <= 0
		data = `service #{service} status 2>/dev/null`.to_s.downcase
		return !!(data =~ /is running/ or data =~ /start\/running/ or data =~ /uptime/)
	end
end
