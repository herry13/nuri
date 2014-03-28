class Sfp::Module::Libvirt
	include Sfp::Resource

	def update_state
		state['installed'] = installed?
		state['running'] = running?
		state['vms'] = get_vms
	end

	def start(params={})
		system("service libvirtd start")
		running?
	end

	private
	def installed?
		!!(`rpm -q -a libvirt`.strip =~ /^libvirt.*/)
	end

	def running?
		!!(`service libvirtd status`.strip =~ /.*is running.*/)
	end

	def get_vms
		out = `virsh list --all`.strip.split("\n")
		out.shift(2)
		vms = {}
		out.each do |line|
			line.strip!
			if line.length > 0
				info = line.split(" ")
				if info.length >= 3
					vms[info[1]] = {
						'running' => (info[2] == 'running'),
						'ip' => '',
						'state' => info[2]
					}
				end
			end
		end
		vms
	end
end
