require 'restfully'
require 'restfully/addons/bonfire'

load File.expand_path(File.dirname(__FILE__)) + "/helper.rb"

class Sfp::Module::Bonfire
	include Sfp::Resource

	def initialize
		@home_dir = File.expand_path(File.dirname(__FILE__))
		@session = @experiment = @location = nil
	end

	def update_state
		to_model
		@state['running'] = self.open_connection
		@state['vms'] = self.get_vms
	end

	def create_vm(p={})
		name = p['vm'].to_s.strip
		return false if name == ''
		
		begin
			name.sub!(/^\$\./, '')
			server = self.create_server({
				:name => name,
				:image => @model['image_name'],
				:wan => @model['wan_name'],
			})
			if !server.nil?
				if !self.install_agent(server)
					delete_vm(p)
					return false
				end
				return true
			end
		rescue Exception => e
			Sfp::Agent.logger.error "Delete VM [Failed] #{e}\n#{e.backtrace.join("\n")}"
		end
		false
	end

	def delete_vm(p={})
		name = p['vm'].to_s.strip
		return false if name == ''

		begin
			name.sub!(/^\$\./, '')
			return self.delete_server({
				:name => name
			})
		rescue Exception => e
			Sfp::Agent.logger.error "Delete VM [Failed] #{e}\n#{e.backtrace.join("\n")}"
		end
		false
	end

	include Sfp::Module::BonfireHelper
end
