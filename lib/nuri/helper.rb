require 'uri'
require 'net/http'

module Sfp::Helper
	Sfp2Ruby = Object.new
	def Sfp2Ruby.visit(name, value, parent)
		if name[0] == '_' or (value.is_a?(Hash) and (value['_context'] == 'constraint' or value['_context'] == 'procedure'))
			parent.delete(name)
		else
			parent[name] = val(value)
		end
		true
	end

	def Sfp2Ruby.val(value)
		if value.is_a?(Hash)
			case value['_context']
			when 'null'
				nil 
			when 'any_value'
				'$.Any:' + value['_isa']
			when 'set'
				parent[name] = value['_values']
			else
				value
			end
		elsif value.is_a?(Sfp::Unknown)
			'$.Unknown:' + value.type.to_s
		elsif value.is_a?(Sfp::Undefined)
			'$.Undefined:' + value.type.to_s
		else
			value
		end 
	end
end

module Nuri::Helper
	def post_data(address, port, path, data, open_timeout=5, read_timeout=1800)
		uri = create_uri(address, port, path)
		req = Net::HTTP::Post.new(uri.path)
		req.set_form_data(data)
		http_request(uri, req, open_timeout, read_timeout)
	end

	def put_data(address, port, path, data, open_timeout=5, read_timeout=1800)
		uri = create_uri(address, port, path)
		req = Net::HTTP::Put.new(uri.path)
		req.set_form_data(data)
		http_request(uri, req, open_timeout, read_timeout)
	end

	def get_data(address, port, path, open_timeout=5, read_timeout=1800)
		uri = create_uri(address, port, path)
		req = Net::HTTP::Get.new(uri.path)
		http_request(uri, req, open_timeout, read_timeout)
	end

	def delete_data(address, port, path, open_timeout=5, read_timeout=1800)
		uri = create_uri(address, port, path)
		req = Net::HTTP::Delete.new(uri.path)
		http_request(uri, req, open_timeout, read_timeout)
	end

	private
	def create_uri(address, port, path)
		address = address.to_s.strip
		port = port.to_s.strip
		path = path.to_s.strip
		raise Exception, "Invalid parameters [address:#{address},port:#{port},path:#{path}]" if
			address.length <= 0 or port.length <= 0 or path.length <= 0
		path.sub!(/^\/+/, '')
		URI.parse("http://#{address}:#{port}/#{path}")
	end

	def use_http_proxy?(uri)
		ENV['no_proxy'].to_s.split(',').each { |pattern|
			pattern.chop! if pattern[-1] == '*'
			return false if uri.host[0,pattern.length] == pattern
		}
		true
	end

	def http_request(uri, request, open_timeout=5, read_timeout=1800)
		if ENV['http_proxy'].to_s.strip != '' and use_http_proxy?(uri)
			proxy = URI.parse(ENV['http_proxy'])
			http = Net::HTTP::Proxy(proxy.host, proxy.port).new(uri.host, uri.port)
		else
			http = Net::HTTP.new(uri.host, uri.port)
		end
		http.open_timeout = open_timeout
		http.read_timeout = read_timeout
		http.start
		http.request(request) { |res| return [res.code, res.body] }
	end	
end
