if Nuri::Util.platform == 'sl'
	require 'modules/network/lib/sl6/network.rb'
elsif Nuri::Util.platform == 'ubuntu'
	require 'modules/network/lib/ubuntu1204/network.rb'
elsif Nuri::Util.platform == 'macos'
	require 'modules/network/lib/macos/network.rb'
end
