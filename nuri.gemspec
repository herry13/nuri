Gem::Specification.new do |s|
	s.name	            = 'nuri'
	s.version           = File.read(File.dirname(__FILE__) + '/VERSION').sub(/\n/, '')
	s.date              = File.mtime(File.dirname(__FILE__) + '/VERSION').strftime("%Y-%m-%d")
	s.summary           = 'Nuri'
	s.description       = 'intelligent configuration tool'
	s.authors           = ['Herry']
	s.email             = 'herry13@gmail.com'

	s.executables       << 'nuri'
	s.files             = `git ls-files`.split("\n").select { |n| !(n =~ /^(test|modules\/cell*|modules\/idol*|examples)\/.*/) }

	s.require_paths     = ['lib']

	s.license           = 'BSD'

	s.homepage          = 'https://github.com/herry13/nuri'
	s.rubyforge_project = 'nuri'

	s.add_dependency 'sfplanner'
	s.add_dependency 'sfpagent'
	s.add_dependency 'colorize'
	s.add_dependency 'coderay'

	s.add_development_dependency 'rake'
end	
