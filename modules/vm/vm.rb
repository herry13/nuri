require File.expand_path(File.dirname(__FILE__)) + "/../machine/machine.rb"

class Sfp::Module::VM < Sfp::Module::Machine
	InCloud = "#{Sfp::Agent::Home}/vm.in_cloud"

	def update_state
		self.class.superclass.instance_method(:update_state).bind(self).call
		@state['in_cloud'] = (File.exist?(InCloud) ? File.read(InCloud).strip : '')
	end
end
