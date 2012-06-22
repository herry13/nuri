module Util
	def getOS
		data = `cat /etc/issue`
		return "ubuntu" if ((data =~ /Ubuntu/) != nil)
		return "sl" if ((data =~ /Scientific Linux/) != nil)
		return nil
	end
end
