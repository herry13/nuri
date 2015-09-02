home = File.dirname(__FILE__)

require "#{home}/webservice.rb"

use Rack::CommonLogger

run NuriWebService::API
