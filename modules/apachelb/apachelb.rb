require 'rubygems'
require 'json'
require 'augeas'

module Nuri
	module Module
		class Apachelb
			InstallingLockFile = '/tmp/nuri_apachelb_installing'

			include Nuri::Resource

			ConfigFile = '/etc/apache2/sites-enabled/load_balancer'

			def initialize
				self.register('Apachelb', 'apachelb')
			end
	
			# get state of this component in JSON
			def update_state
				# installed, running, version
				if File.exist?(InstallingLockFile)
					@state['installed'] = @state['running'] = false
					@state['version'] = ''
				else
					data = `/usr/bin/dpkg-query -W apache2`
					data = data.split(' ')
					@state['installed'] = (data.length > 1 and data[0] == 'apache2') and
						File.exists?(ConfigFile)
					if @state['installed']
						@state['version'] = data[1]
						data = `/usr/bin/service apache2 status`
						@state['running'] = ((data =~ /is running/) != nil)
					else
						@state['version'] = ''
						@state['running'] = false
					end
				end

				# ServerName setting
				data = `/bin/grep "ServerName" #{ConfigFile} 2>/dev/null`.chop.strip
				data = data.split(' ')
				if data[1] != nil and data[1] != '<server_name>'
					@state['server_name'] = data[1]
				else
					@state['server_name'] = ""
				end
	
				# Balancer members setting
				data =`/bin/grep "BalancerMember" #{ConfigFile} 2>/dev/null`.chop
				members = []
				data.split("\n").each do |line|
					member = line.strip.split(' ')
					next if member[1] == nil
					members.push( member[1] )
				end
				@state['members'] = members

				return @state
			end
	
			def install(params={})
				result = false
				begin
					File.open(InstallingLockFile, 'w') { |f| f.write(' ') }
					result = system('/usr/bin/apt-get -y install apache2')
					result = system('/usr/bin/service apache2 stop') if result == true
					result = system('/usr/sbin/a2enmod proxy') if result == true
					result = system('/usr/sbin/a2enmod proxy_balancer') if result == true
					result = system('/usr/sbin/a2enmod proxy_http') if result == true
					result = system('/usr/sbin/a2enmod status') if result == true

					cmd = "/bin/rm -f /etc/apache2/sites-enabled/*; /bin/cp -f #{Nuri::Util.home_dir}/modules/apachelb/load_balancer #{ConfigFile}"
					self.stop
					result = system(cmd)
				rescue Exception
				ensure
					File.delete(InstallingLockFile) if File.exist?(InstallingLockFile)
				end

				return (result == true)
			end

			def uninstall(params={})
				result = system("/bin/rm -f #{ConfigFile}")
				result = system('/usr/bin/apt-get -y --purge remove apache2') if (result == true)
				result = system('/usr/bin/apt-get -y --purge autoremove') if (result == true)
				return (result == true)
			end

			def start
				return ( system('/usr/bin/sudo /usr/bin/service apache2 start') == true )
			end

			def stop
				return ( system('/usr/bin/sudo /usr/bin/service apache2 stop') == true )
			end

			def set_members(params={})
				members = ''
				reverses = ''
				params['members'].each do |m|
					members += "\n\tBalancerMember #{m}"
					reverses += "\n\tProxyPassReverse / #{m}"
				end

				data = File.read(ConfigFile)
				output = ''
				data.split("\n").each do |line|
					tuple = line.strip.split(' ')
					next if tuple[0] == 'BalancerMember' or tuple[0] == 'ProxyPassReverse'
					output += "#{line} \n"
					if tuple[0] == 'ProxySet'
						output += members + "\n"
					elsif tuple[0] == '</Location>'
						output += reverses + "\n"
					end
				end
				File.open(ConfigFile, 'w') { |f| f.write(output) }
				sleep 1
=begin
				data = `/bin/sed 's/BalancerMember.*//g' #{ConfigFile}`
				output = ""
				data.split("\n").each do |line|
					line2 = line.strip
					next if line2 == ''

					if line2 == '### Balancer Members ###'
						output += members + "\n"
					elsif line2.strip == '### Balancer Reverse ###'
						output += reverses + "\n"
					else
						output += line + "\n"
					end
				end
				File.open(ConfigFile, 'w') { |f| f.write(output) }
=end
				true
			end

			def set_server_name(params={})
				server_name = params['name']
				return false if server_name == nil

				cmd = "sed -i 's/ServerName.*/ServerName #{server_name}/g' #{ConfigFile}"
				return ( system(cmd) == true )
			end

		end
	end
end
