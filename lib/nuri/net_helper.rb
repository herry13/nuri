require 'uri'
require 'net/http'

module Nuri::Net
end

module Nuri::Net::Helper
	def http_request(uri, request, open_timeout=5, read_timeout=1800)
		http = Net::HTTP.new(uri.host, uri.port)
		http.open_timeout = open_timeout
		http.read_timeout = read_timeout
		http.start
		http.request(request) { |res| return [res.code, res.body] }
	end	

	def post_data(address, port, path, data, open_timeout=5, read_timeout=1800)
		address = address.to_s.strip
		port = port.to_s.strip
		path = path.to_s.strip
		raise Exception, "Invalid parameters [address:#{address},port:#{port},path:#{path}]" if
			address.length <= 0 or port.length <= 0 or path.length <= 0

		path.sub!(/^\/+/, '')
		url = URI.parse("http://#{address}:#{port}/#{path}")
		req = Net::HTTP::Post.new(url.path)
		req.set_form_data(data)
		http_request(url, req, open_timeout, read_timeout)
	end

	def put_data(address, port, path, data, open_timeout=5, read_timeout=1800)
		address = address.to_s.strip
		port = port.to_s.strip
		path = path.to_s.strip
		raise Exception, "Invalid parameters [address:#{address},port:#{port},path:#{path}]" if
			address.length <= 0 or port.length <= 0 or path.length <= 0

		path.sub!(/^\/+/, '')
		url = URI.parse("http://#{address}:#{port}/#{path}")
		req = Net::HTTP::Put.new(url.path)
		req.set_form_data(data)
		http_request(url, req, open_timeout, read_timeout)
	end

	def get_data(address, port, path, open_timeout=5, read_timeout=1800)
		address = address.to_s.strip
		port = port.to_s.strip
		path = path.to_s.strip
		raise Exception, "Invalid parameters [address:#{address},port:#{port},path:#{path}]" if
			address.length <= 0 or port.length <= 0 or path.length <= 0

		path.sub!(/^\/+/, '')
		url = URI.parse("http://#{address}:#{port}/#{path}")
		req = Net::HTTP::Get.new(url.path)
		http_request(url, req, open_timeout, read_timeout)
	end
end
