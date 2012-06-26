#!/usr/bin/env ruby

require 'augeas'

Augeas::open do |aug|
	puts aug.get("/files/etc/apache2/ports.conf/*[self::directive='NameVirtualHost']/arg")
	puts aug.get("/files/etc/apache2/ports.conf/*[self::directive='Listen']/arg")
	puts aug.get('/files/etc/apache2/sites-available/default/VirtualHost/arg')
	puts aug.get("/files/etc/apache2/sites-available/default/VirtualHost/*[self::directive='DocumentRoot']/arg")
end
