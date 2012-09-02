if Nuri::Util.platform == 'sl'
	require 'modules/node/lib/sl6/node.rb'
elsif Nuri::Util.platform == 'ubuntu'
	require 'modules/node/lib/ubuntu1204/node.rb'
elsif Nuri::Util.platform == 'macos'
	require 'modules/node/lib/macos/node.rb'
end
