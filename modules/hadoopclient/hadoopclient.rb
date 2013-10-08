require File.expand_path(File.dirname(__FILE__)) + '/../service/service.rb'

class Sfp::Module::HadoopClient < Service
	include Sfp::Resource

	def update_state
		self.reset
	end
end
