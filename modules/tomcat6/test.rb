require 'rubygems'
require 'xml'

# port
parser = XML::Parser.file('/etc/tomcat7/server.xml')
doc = parser.parse
node = doc.find_first('/Server/Service/Connector')
puts node.attributes['port']
