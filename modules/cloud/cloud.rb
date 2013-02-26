require 'rubygems'
require 'fog'

module Nuri
	module Module
		class Cloud
			include Nuri::Resource

			attr_accessor :auth_uri

			def update_state
				@state['running'] = false
			end

			def open_connection
				false
			end

			def get_address(params={})
				self.open_connection if @conn.nil?
				servers = @conn.servers
				servers.each { |s|
					if s.name == params[:name] and s.state != "ACTIVE(deleting)"
						return s.public_ip_address
					end
				}
				nil
			end

			def get_info(name)
				self.open_connection if @conn.nil?
				servers = @conn.servers
				servers.each { |s| return s if s.name == name }
				nil
			end

			def is_port_open?(address, port)
				begin
					Timeout::timeout(1) do
						begin
							s = TCPSocket.new(address, port)
							s.close
							return true
						rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
							return false
						end
					end
				rescue Timeout::Error
				end
				return false
			end

			def create_vm(params={})
				false
			end

			def delete_vm(params={})
				false
			end
		end
	end
end
