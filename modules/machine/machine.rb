
class Sfp::Module::Machine
	include Sfp::Resource

	def update_state
		to_model

		@state['sfpAddress'] = @model['sfpAddress']
		@state['sfpPort'] = @model['sfpPort']
		@state['created'] = true

		data = `dmidecode | grep -i product`.strip
		if data.length <= 0
			@state['is_virtual'] = true
			@state['hypervisor'] = 'N/A'
		else
			_, product = data.split("\n")[0].split(":", 2)
			case product.strip.downcase
			when 'kvm', 'virtualbox', 'vmware'
				@state['is_virtual'] = true
				@state['hypervisor'] = product.strip
			else
				@state['is_virtual'] = false
			end
		end

		@state["cpus"] = (File.exist?('/proc/cpuinfo') ? `cat /proc/cpuinfo | grep processor | wc -l`.strip.to_i : -1)
		@state['memory'] = (`which free`.strip != '' ? `free`.split("\n")[1].split(" ")[1] : -1)

		@state['disk'] = get_disk_state
	end

	protected
	# generate the disks' state, try to automatically mount the disk to target directory
	#
	def get_disk_state
		def generate_state
			disk = {}
			# get disks UUID
			uuids = {}
			`blkid`.each_line do |line|
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
						model = (@model['disk'].is_a?(Hash) ? @model['disk'].select { |k,v| v['mount'] == data[5] if k[0] != '_' } : {})
						name = (model.length > 0 ? model.keys.first : "uuid_#{uuids[data[0]]}")
					end
					disk[name] = {
						'size' => (data[1].to_f / 1000.0).to_i,
						'mount' => data[5],
						'uuid' => uuids[data[0]]
					}
				end
			end
			disk
		end

		disk = generate_state

		if @model['disk'].is_a?(Hash)
			names = @model['disk'].keys.sort { |x,y| x <=> y }
			device = "/dev/vdb"
			# format unformatted disks, mount unmount disks
			names.each { |name|
				next if name[0] == '_' or disk.has_key?(name)
				spec = @model['disk'][name]
				status = `file -s #{device}`
				if not (status =~ /ERROR/)
					target = spec['mount'].to_s.strip
					# format the disk if not yet formatted
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
