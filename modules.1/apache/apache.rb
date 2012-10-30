if Nuri::Util.platform == 'sl'
	require 'modules/apache/lib/sl6.rb'
elsif Nuri::Util.platform == 'ubuntu'
	require 'modules/apache/lib/ubuntu1204.rb'
end
