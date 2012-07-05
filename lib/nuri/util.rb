require 'rubygems'
require 'logger'

module Nuri
	class Util
		@@rootdir = File.dirname(__FILE__) + "/../.."
		@@logger = Logger.new(@@rootdir + "/log/message.log")
		@@os = nil
		@@platform = nil

		def self.rootdir
			return @@rootdir
		end

		def self.log(msg=nil)
			if msg != nil
				@@logger.info msg
			end
			return @@logger
		end

		def self.os
			@@os = (`uname -o`).strip if @@os == nil
			return @@os
		end

		def self.platform
			return @@platform if @@platform != nil
			if (self.os =~ /Linux/) != nil
				data = `cat /etc/issue`
				@@platform = "ubuntu" if (data =~ /Ubuntu/) != nil
				@@platform = "sl" if (data =~ /Scientific Linux/) != nil
			end
			return @@platform
		end
	end
end
