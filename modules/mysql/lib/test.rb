require 'augeas'

Augeas::open do |aug|
	puts aug.get("/files/etc/mysql/my.cnf/*[self::directive='port']/arg")
end
