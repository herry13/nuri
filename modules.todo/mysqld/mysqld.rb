if Nuri::Util.platform == 'sl'
	require 'modules/mysqld/lib/sl6'
elsif Nuri::Util.platform == 'ubuntu'
	require 'modules/mysqld/lib/ubuntu1204'
end
