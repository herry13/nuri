require File.expand_path(File.dirname(__FILE__)) + "/../package/package.rb"

class Sfp::Module::Service < Sfp::Module::Package
	include Sfp::Resource

	def update_state
		self.reset
		if @model.is_a?(Hash)
			@state['installed'] = Sfp::Module::Package.installed?(@model['package_name'])
			@state['version'] = Sfp::Module::Package.version?(@model['package_name']).to_s
			@state['running'] = Sfp::Module::Service.running?(@model['service_name'])
		end
	end

	def self.running?(service)
		service = service.to_s
		return false if service.length <= 0
		data = `service #{service} status 2>/dev/null`.to_s.downcase
		return !!(data =~ /is running/ or data =~ /start\/running/ or data =~ /uptime/)
	end

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
end
