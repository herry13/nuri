require File.expand_path(File.dirname(__FILE__)) + "/../machine/machine.rb"

class Sfp::Module::VM < Sfp::Module::Machine
	def update_state
		self.class.superclass.instance_method(:update_state).bind(self).call
		@state['in_cloud'] = @model['in_cloud']
	end
end
