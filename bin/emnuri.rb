#!/usr/bin/env ruby

require 'rubygems'
require 'eventmachine'
require 'evma_httpserver'

class HttpServer < EM::Connection
	include EM::HttpServer

	def post_init
		super
		no_environment_strings
	end

	def process_http_request
		puts @http_request_method
		puts @http_request_uri
		puts @http_query_string
		puts @http_protocol
		puts @http_content
		puts @http_cookie
		puts @http_content_type
		puts @http.inspect

		response = EM::DelegatedHttpResponse.new(self)
		response.status = 200
		response.content_type 'text/html'
		response.content = 'It works'
		response.send_response
	end
end

EM::run do
	EM::start_server("0.0.0.0", 9090, HttpServer)
end
