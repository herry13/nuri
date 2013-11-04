Gem::Specification.new do |s|
	s.name	                = 'nuri'
	s.version               = File.read(File.dirname(__FILE__) + '/VERSION').sub(/\n/, '')
	s.date                  = '2013-08-13'
	s.summary               = 'Nuri'
	s.description           = 'Automated workflow configuration tool'
	s.authors               = ['Herry']
	s.email                 = 'herry13@gmail.com'

	s.executables << 'nuri'
	s.files                 = `git ls-files`.split("\n").select { |n| !(n =~ /^(modules|test|modules\/cell)\/.*/) }

	s.require_paths = ['lib']

	s.license       = 'BSD'

	s.homepage              = 'https://github.com/herry13/nuri'
	s.rubyforge_project     = 'nuri'

	s.add_dependency 'sfplanner', '~> 0.1.1'
	s.add_dependency 'colorize', '~> 0.5.8'
	s.add_dependency 'coderay', '~> 1.0.9'
end	
