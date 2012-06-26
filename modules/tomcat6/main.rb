platform = Nuri.platform
if platform == 'ubuntu'
	require File.dirname(__FILE__) + "/lib/ubuntu1204.rb"
elsif platform == 'sl'
	require File.dirname(__FILE__) + "/lib/sl6.rb"
end
