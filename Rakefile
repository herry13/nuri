def nuri
	File.dirname(__FILE__) + '/bin/nuri'
end

def testfiles
	File.read(File.dirname(__FILE__) + "/test/files").split("\n")
end

task :default => :test

namespace :test do
	testfiles.each { |file|
		sh("#{nuri} model -m #{file}")
	}
end
