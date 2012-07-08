if Nuri::Util.platform == 'sl'
	#require File.dirname(__FILE__) + "/lib/sl6.rb"
	require 'modules/apache/lib/sl6.rb'
elsif Nuri::Util.platform == 'ubuntu'
	#require File.dirname(__FILE__) + "/lib/ubuntu1204.rb"
	require 'modules/apache/lib/ubuntu1204.rb'
end
