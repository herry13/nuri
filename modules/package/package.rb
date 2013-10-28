class Sfp::Module::Package
	include Sfp::Resource

	def update_state
		self.reset

		@state['installed'] = installed?
		@state['version'] = version?
	end

	def installed?
		false
	end

	def version?
		""
	end

	def install(p={})
		false
	end

	def uninstall(p={})
		false
	end
end
