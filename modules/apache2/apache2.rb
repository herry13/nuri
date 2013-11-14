class Sfp::Module::Apache2
	include Sfp::Resource

	def update_state
		@state['path'] = path
		@state['installed'] = resolve(path + '.package.installed')
		@state['running'] = resolve(path + '.service.running')
	end
end
