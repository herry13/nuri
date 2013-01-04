module Nuri
	module CloudHelper
		VMComponent = '$.VM'
		CloudComponent = '$.Cloud'

		def init_cloud
			@clouds = {}
			@main['system'].each do |name, node|
				next if name[0,1] == '_'
				next if node['_classes'].rindex(CloudComponent).nil?
				#puts node['_self']
				@clouds[name] = Nuri::Module::Cloud.new(node)
			end
		end

		def get_vm_address(vm)
			cloud_name = @main['system'].at?(vm['cloud'])['_self']
			if @clouds.has_key?(cloud_name)
				return @clouds[cloud_name].get_address(:name => vm['_self'])
			end
			return nil
		end

	end
end
