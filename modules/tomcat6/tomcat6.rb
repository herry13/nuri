if Nuri::Util.platform == 'sl'
puts Nuri::Util.platform
	require File.dirname(__FILE__) + "/lib/sl6.rb"
elsif Nuri::Util.platform == 'ubuntu'
	require File.dirname(__FILE__) + "/lib/ubuntu1204.rb"
end
