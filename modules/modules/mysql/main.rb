if Nuri.platform == 'sl'
	require File.dirname(__FILE__) + "/lib/sl6.rb"
elsif Nuri.platform == 'ubuntu'
	require File.dirname(__FILE__) + "/lib/ubuntu1204.rb"
end
