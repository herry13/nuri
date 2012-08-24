if Nuri::Util.platform == 'sl'
	require 'modules/tomcat6/lib/sl6'
elsif Nuri::Util.platform == 'ubuntu'
	require 'modules/tomcat6/lib/ubuntu1204'
end
