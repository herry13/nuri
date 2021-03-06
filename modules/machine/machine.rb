class Sfp::Module::Machine
	include Sfp::Resource

	def update_state
		to_model

		if platform.include?('linux')
			load_kernel_modules(['acpiphp'])
		end

		@state['sfpAddress'] = @model['sfpAddress']
		@state['sfpPort'] = @model['sfpPort']
		@state['created'] = true

		data = `dmidecode | grep -i product`.strip
		if data.length <= 0
			@state['hypervisor'] = 'N/A'
		else
			@state['hypervisor'] = data.split("\n")[0].split(":", 2)[1].to_s.strip.downcase
		end

		@state["cpus"] = (File.exist?('/proc/cpuinfo') ? `cat /proc/cpuinfo | grep processor | wc -l`.strip.to_i : -1)
		@state['memory'] = (`which free`.strip != '' ? `free`.split("\n")[1].split(" ")[1] : -1)

		if platform.include?('linux')
			@state['disks'] = get_disks_state
		else
			@state['disks'] = {}
		end
	end

	##############################
	#
	# Helper methods
	#
	##############################

	def platform
		RUBY_PLATFORM.downcase
	end

	protected

	def load_kernel_modules(modules=[])
		loaded = []
		`lsmod`.each_line do |line|
			next if line.strip.length <= 0
			name, size, used, by = line.split(' ', 4)
			next if name.to_s.downcase == 'module'
			loaded << name
		end

		unloaded = modules - loaded
		unloaded.each do |name|
			shell "modprobe #{name}"
		end
	end

	# generate the disks' state, try to automatically mount the disk to target directory
	#
	def get_disks_state
		def generate_state
			disks = {}
			# get disks UUID
			uuids = {}
			`/sbin/blkid`.each_line do |line|
				line.strip!
				next if line.length <= 0
				device, info = line.split(':', 2)
				info = info.split(' ')
				uuids[device] = info[0].split('=', 2)[1].gsub(/"/, '')
			end

			# read fstab
			`df -l`.each_line do |line|
				line.strip!
				next if line.length <= 0
				data = line.split(' ')
				if data[0][0..4] == '/dev/'
					name = 'root'
					if data[5] != '/'
						model = (@model['disks'].is_a?(Hash) ? @model['disks'].select { |k,v| v['mount'] == data[5] if k[0] != '_' } : {})
						name = (model.length > 0 ? model.keys.first : "uuid_#{uuids[data[0]]}")
					end
					disks[name] = {
						'size' => (data[1].to_f / 1000.0).to_i,
						'mount' => data[5],
						'uuid' => uuids[data[0]]
					}
				end
			end
			disks
		end

		disks = generate_state

		if @model['disks'].is_a?(Hash)
			names = @model['disks'].keys.sort { |x,y| x <=> y }
			device = "/dev/vdb"
			# format unformatted disks, mount unmount disks
			names.each { |name|
				next if name[0] == '_' or disks.has_key?(name)
				spec = @model['disks'][name]
				status = `file -s #{device}`
				if not (status =~ /ERROR/)
					target = spec['mount'].to_s.strip
					# format the disks if not yet formatted
					system "mkfs.ext4 #{device}" if not (status =~ /.+ filesystem data/)
					# create target directory if not exist
					system "mkdir -p #{target}" if !File.exist? target
					# add fstab record
					system "sed -i '/^#{device}/d' /etc/fstab"
					system "echo '#{device}   #{target}  ext4   defaults  0 0' >> /etc/fstab"
				end
				device = device.next
			}
			system 'mount -a'
		end

		generate_state
	end
end
