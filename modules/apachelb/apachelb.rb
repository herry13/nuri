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
				# package apache2: installed, running, version
				if File.exist?(InstallingLockFile)
					@state['installed'] = @state['running'] = false
					@state['version'] = ''
				else
					@state['installed'] = Nuri::Helper::Package.installed?('apache2')
					@state['version'] = Nuri::Helper::Package.version?('apache2')
					@state['running'] = Nuri::Helper::Service.running?('apache2')
				end

				# ServerName
				data = (File.file?(ConfigFile) ? `/bin/grep -e "ServerName " #{ConfigFile}` : "")
				@state['server_name'] = (data.length > 0 ? data.strip.split(' ')[1] : '')
	
				# Balancer members setting
				data =`/bin/grep "BalancerMember" #{ConfigFile} 2>/dev/null`.chop
				members = []
				xmembers = []
				data.split("\n").each do |line|
					member = line.strip.split(' ')
					next if member[1] == nil
					_, address = member[1].split('http://', 2)
					name = Nuri::Util.get_system_information.index(address)
					if not name.nil?
						ref = '$.' + name
						xmembers.push(ref)
					end
					members.push( member[1] )
				end
				members.sort!
				xmembers.sort!
				@state['members'] = members
				@state['xmembers'] = xmembers

				return @state
			end
	
			def install(params={})
				result = false
				begin
					File.open(InstallingLockFile, 'w') { |f| f.write(' ') }
					return (Nuri::Helper::Package.install('apache2') and
						Nuri::Helper::Service.stop('apache2') and
						Nuri::Helper::Command.exec('/usr/sbin/a2enmod proxy') and
						Nuri::Helper::Command.exec('/usr/sbin/a2enmod proxy_balancer') and
						Nuri::Helper::Command.exec('/usr/sbin/a2enmod proxy_http') and
						Nuri::Helper::Command.exec('/usr/sbin/a2enmod status') and
						Nuri::Helper::Command.exec("/bin/rm -f /etc/apache2/sites-enabled/*") and
						Nuri::Helper::Command.exec("/bin/cp -f #{Nuri::Util.home_dir}/modules/apachelb/load_balancer #{ConfigFile}") and
						Nuri::Helper::Service.stop('apache2'))
				rescue
					return false
				ensure
					File.delete(InstallingLockFile) if File.exist?(InstallingLockFile)
				end
			end

			def uninstall(params={})
				return (Nuri::Helper::Command.exec("/bin/rm -f #{ConfigFile}") and
					Nuri::Helper::Package.uninstall('apache2'))
			end

			def start
				return Nuri::Helper::Service.start('apache2')
			end

			def stop
				return Nuri::Helper::Service.stop('apache2')
			end

			def set_xmembers(params={})
				members = ''
				reverses = ''
				params['xmembers'].each do |ref|
					path = ref.push('address')
					address = self.get_state(path)
					members += "\n\tBalancerMember http://#{address}"
					reverses += "\n\tProxyPassReverse / http://#{address}"
				end
				output = ''
				data = File.read(ConfigFile)
				data.split("\n").each do |line|
					head, _ = line.strip.split(' ', 2)
					next if head == 'BalanceMember' or head == 'ProxyPassReverse'
					output += "#{line}"
					if head == 'ProxySet'
						output += "#{members}\n"
					elsif head == '</Location>'
						output += "#{reverses}\n"
					end
				end
				File.open(ConfigFile, 'w') { |f| f.write(output) }
				sleep 1
				true
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
				return Nuri::Helper::Command.exec("sed -i 's/ServerName.*/ServerName #{server_name}/g' #{ConfigFile}")
			end

		end
	end
end
