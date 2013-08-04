module Sfp::Module
	class Cloud
		include Sfp::Resource

		ConfigFile = '/tmp/sfp_client_config'
		def update_state
			if File.exist?(ConfigFile)
				@state['refer'] = File.read(ConfigFile)
			else
				@state['refer'] = nil
			end
		end

		def redirect(p={})
			return false if !p.has_key?('s')
			if p['s'].nil?
				File.delete(ConfigFile) if File.exist?(ConfigFile)
			else
				File.open(ConfigFile, 'w') { |f| f.write(p['s'].to_s) }
			end
			true
		end
	end
end
