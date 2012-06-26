if Nuri.platform == 'sl'
	require File.dirname(__FILE__) + "/lib/sl6.rb"
else
	require File.dirname(__FILE__) + "/lib/ubuntu1204.rb"
end
