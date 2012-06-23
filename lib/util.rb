module Util
	def getOS
		data = `uname -o`
		return data.strip
	end

	def getPlatform
		data = `cat /etc/issue`
		return "ubuntu" if ((data =~ /Ubuntu/) != nil)
		return "sl" if ((data =~ /Scientific Linux/) != nil)
		return nil
	end
end
