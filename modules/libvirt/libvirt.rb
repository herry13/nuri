class Sfp::Module::Libvirt
	include Sfp::Resource

	def update_state
		to_model

		@state['installed'] = installed?
		@state['running'] = running?

		check_vm_status
		@state['vms'] = get_vms
	end

	def start(params={})
		system("service libvirtd start")
		running?
	end

	def stop(params={})
		system("service libvirtd stop")
		not running?
	end

	SleepTime = 30 # seconds
	WaitTime = 1800 # seconds (30 mins)

	def create_vm(params={})
		vm_name = params['vm'].sub(/^\$\./, '')
		if get_vms.has_key?(vm_name)
			log.info "vm:#{vm_name} is already exist"
			return true
		end

		log.info "creating vm:#{vm_name} [Wait]"
		status = false

		ks_file = generate_kickstart_file(vm_name)
		script_file = generate_script_file(vm_name, ks_file)

		log.info `/bin/bash #{script_file}`

		File.delete(ks_file) if File.exists?(ks_file)
		File.delete(script_file) if File.exists?(script_file)

		vms = get_vms
		if vms[vm_name] and vms[vm_name]['ip'].to_s.length > 0
			address = vms[vm_name]['ip'].to_s
			log.info "vm:#{vm_name} is created - address=#{address}"
			log.info "vm:#{vm_name} - wait until ssh server is running"
			wait_time = WaitTime
			until sshable?(address, 22) or wait_time < 0 do
				sleep SleepTime
				wait_time -= SleepTime
				start_vm(params)
			end
			status = sshable?(address, 22)
			log.warn "agent on vm:#{vm_name} is not running" if status and nuriable?(address)
		end
		
		if status
			log.info "creating vm:#{vm_name} [OK]"
		else
			log.error "creating vm:#{vm_name} [Failed]"
		end

		status
	end

	def delete_vm(params={})
		vm_name = params['vm'].sub(/^\$\./, '')
		if not get_vms.has_key?(vm_name)
			log.info "vm #{vm_name} is not exist"
			return true
		end

		!!system("virsh destroy #{vm_name} && virsh undefine #{vm_name}")
	end

	def start_vm(params={})
		name = params['vm'].to_s.sub(/^\$\./, '')
		return false if name.length <= 0
		vms = get_vms
		system("virsh start #{name}") if vms[name] and not vms[name]['running']

		vm_running?(name)
	end

	protected
	def installed?
		!!(`rpm -q -a libvirt`.strip =~ /^libvirt.*/)
	end

	def running?
		!!(`service libvirtd status`.strip =~ /.*is running.*/)
	end

	def vm_running?(name)
		vms = get_vms
		(vms[name] and vms[name]['running'])
	end

	def get_vms
		out = `virsh list --all`.strip.split("\n")
		out.shift(2)
		vms = {}
		domain = @model['dns_domain'].to_s.strip
		out.each do |line|
			line.strip!
			if line.length > 0
				info = line.split(" ")
				if info.length >= 3
					vms[info[1]] = {
						'running' => (info[2] == 'running'),
						'ip' => (domain.length > 0 ? "#{info[1]}.#{domain}" : info[1]),
						'state' => info[2]
					}
				end
			end
		end
		vms
	end

	def home
		File.expand_path(File.dirname(__FILE__))
	end

	def random_str
		srand.to_s[1..5]
	end

	def generate_kickstart_file(name)
		template_file = "#{home}/vm.ks"
		output_file = "/tmp/" + random_str + "_#{name}.ks"
		ks = render(::File.read(template_file), {'name' => name})
		File.open(output_file, "w") { |f| f.write(ks) }
		output_file
	end

	def get_spec(name)
		model = resolve_model("$.#{name}").delete_if { |k,v| k[0] == '_' }
		{
			'name' => name,
			'cpus' => 1,
			'memory' => 256,
			'disksize' => 4,
			'mac_address' => (1..6).map{"%0.2X"%rand(256)}.join(":"), # '54:52:00:6C:46:01',
			'os' => 'ubuntu-linux',
			'os_version' => 'precise',
			'image_location' => '/nfs/vms/herry/images',

		}.merge(model)
	end

	def generate_script_file(name, ks_file)
		spec = get_spec(name)
		spec['ks_file'] = ks_file
		template_file = "#{home}/create_vm.sh"
		output_file = "/tmp/" + random_str + "_#{name}.sh"
		script = render(::File.read(template_file), spec)
		File.open(output_file, "w") { |f| f.write(script) }
		output_file
	end

	def serveable?(ip, port)
		if ip.length > 0
			begin
				Timeout::timeout(1) do
				begin
					s = TCPSocket.new(ip, port)
					s.close
					true
					rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
						false
					end
				end
			rescue Timeout::Error
				false
			end
		else
			false
		end
	end

	def sshable?(ip, port)
		serveable?(ip, port)
	end

	def nuriable?(ip)
		serveable?(ip, 1314)
	end

	def check_vm_status
		get_vms.each do |name,state|
			start_vm({'vm' => "$.#{name}"}) if not state['running']
		end
	end
end
