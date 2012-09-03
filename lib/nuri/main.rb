#!/usr/bin/env ruby

# Ruby libraries
require 'rubygems'
require 'logger'
require 'mongrel'
require 'json'
require 'pp'
require 'thread'
require 'socket'
require 'uri'
require 'net/http'
# Nuri libraries
require 'nuri/util'
require 'nuri/resource'
require 'nuri/undefined'
require 'nuri/sfp/main'
require 'nuri/planner/main'
# Nuri modules
require 'modules/node/node'

module Nuri
	class Main < Mongrel::HttpHandler
		attr_reader :config, :main, :bsig

		def initialize
			self.read_config
			self.load_modules
			@locked = false
			@mutex = Mutex.new
			self.read_bsig if @config.has_key?('bsig') and @config['bsig']
			self.read_main
			#self.apply
		end

		def read_bsig
			Nuri::Util.log 'Read BSig description...'
			begin
				sfpfile = '/etc/nuri/bsig.sfp'
				sfpfile = Nuri::Util.rootdir + '/etc/bsig.sfp' if not File.file?(sfpfile)
				@bsig = Nuri::Sfp::Parser.file_to_json(sfpfile)
				Nuri::Util.log 'Successfully load ' + sfpfile
			rescue Exception => exp
				Nuri::Util.log.error "Cannot load " + sfpfile + " -- " + exp.to_s
			rescue StandardError => stderr
				Nuri::Util.log.error "Cannot load " + sfpfile
			end
		end

		def read_main
			Nuri::Util.log 'Read main description...'
			begin
				mainfile = Nuri::Util.rootdir + '/etc/main.sfp'
				@main = Nuri::Sfp::Parser.file_to_json(mainfile)
				Nuri::Util.log 'Successfully load ' + mainfile
			rescue Exception => exp
				Nuri::Util.log.error "Cannot load " + mainfile.to_s + " -- " + exp.to_s
			rescue StandardError => stderr
				Nuri::Util.log.error "Cannot load " + mainfile.to_s
			end
		end

		# Reads configuration file in '/etc/nuri/config.sfp'. If it does not
		# exist then it tries to read '<HOME>/etc/config.sfp'.
		def read_config
			begin
				Nuri::Util.log 'Read configuration file...'
				cfile = '/etc/nuri/nuri.sfp'
				cfile = Nuri::Util.rootdir + "/etc/nuri.sfp" if not File.file?(cfile)
				@config = Nuri::Sfp::Parser.file_to_json(cfile)['nuri']
				Nuri::Util.log 'Successfully load configuration file ' + cfile
			rescue Exception => exp
				Nuri::Util.log.error "Cannot load configuration file " + cfile + ' -- ' + exp.to_s
			rescue StandardError => stderr
				Nuri::Util.log.error "Cannot load configuration file " + cfile
			end
		end

		# Load all installed modules.
		def load_modules
			# load installed modules
			Nuri::Util.log "Load modules..."
			modules_dir = Nuri::Util.rootdir + "/modules"

			# create dummy root
			@root = Nuri::Resource.new('root')

			# load module 'Node'
			node = Nuri::Module::Node.new
			@root.add(node)

			# load other modules and put them as node's children
			Dir.foreach(modules_dir) { |mod|
				next if mod == 'node'
				path = modules_dir + "/" + mod
				if File.directory?(path) and File.file?(path + "/" + mod + ".rb")
					require 'modules/' + mod + '/' + mod
					begin
						m = eval("Nuri::Module::" + mod.capitalize + ".new")
						m.name = mod if m.name == nil
						node.add(m)
						Nuri::Util.log "Successfully load module " + mod
					rescue Exception => exp
						Nuri::Util.log.error "Cannot load module " + mod + " -- " + exp.to_s
					end
				end
			}
		end

		# Start nuri service.
		def start
			@http = Mongrel::HttpServer.new(@config.at?('host'), @config.at?('port').to_i)
			@http.register("/", self)
			Nuri::Util.log "Start server on " + @config.at?('host') + ":" +
				@config.at?('port').to_i.to_s + " with PID #{Process.pid}"
			@http.run.join
		end
	
		# Stop nuri service.
		def stop
			@http.graceful_shutdown
			Nuri::Util.log "Nuri is stopped"
		end
	
		def process(req, res)
			if req.params['REQUEST_METHOD'] == 'GET'
				if req.params['REQUEST_URI'] == '/state' or
					(req.params['REQUEST_URI'] =~ /^\/state\/.*/) != nil
					return self.http_get_state(req, res)
				elsif req.params['REQUEST_URI'] == '/goal' or
					(req.params['REQUEST_URI'] =~ /^\/goal\/.*/) != nil
					return self.http_get_goal(req, res)
				elsif req.params['REQUEST_URI'] == '/dashboard' or
					(req.params['REQUEST_URI'] =~ /^\/dashboard\/.*/) != nil
					return self.get_dashboard(req, res)
				end
			elsif req.params['REQUEST_METHOD'] == 'POST'
				if req.params['REQUEST_URI'] == '/state' or
					(req.params['REQUEST_URI'] =~ /^\/state\/.*/) != nil
					return self.http_set_state(req, res)
				elsif req.params['REQUEST_URI'] == '/goal' or
					(req.params['REQUEST_URI'] =~ /^\/goal\/.*/) != nil
					return self.http_set_goal(req, res)
				end
			end
			res.start(404) do |head, out| out.write(''); end
		end
	
		def send_error(res, msg='')
			res.start(500) do |head, out| out.write(msg); end
			Nuri::Util.log.error msg
		end

		def get_dashboard(req, res)
			params = req.params['REQUEST_URI'].split('/', 3)
			if params[2] == nil or params[2] == ''
				send_file(Nuri::Util.rootdir + '/lib/dashboard/index.html', res)
			else
				send_file(Nuri::Util.rootdir + '/lib' + req.params['REQUEST_URI'], res)
			end
		end

		def send_file(file, res)
			# TODO -- security should be evaluated
			if not File.exist?(file)
				res.start(404) { |head, out| out.write('Resource not found!') }
			else
				res.start(200) do |head, out|
					out.write(File.read(file))
				end
			end
		end

		# get state
		def http_get_state(req, res)
			begin
				path = req.params['REQUEST_PATH'].sub(/^\/state\/?/,'')
				data = JSON['{"value":""}']
				state = self.get_state(path)
				if state.is_a?(Nuri::Undefined)
					res.start(404) do |head, out| out.write(''); end
				else
					res.start(200) do |head, out|
						head["Content-Type"] = "application/json"
						data['value'] = state
						out.write(JSON.generate(data))
					end
				end
			rescue Exception => exp
				self.send_error(res, exp.to_s)
			end
		end

		def get_state(path='')
			return @root.get_state(path)
		end

		def http_set_state(req, res)
=begin
			if not self.lock
				res.start(403) do |head,out| out.write(''); end
			else
				begin
					path = req.params['REQUEST_URI'].sub(/^\/state\/?/,'')
					@root.reset_goal
					@root.set_goal(path, (JSON[req.body.read])['value'])
					puts JSON.generate(@root.get_goal) # debug
					res.start(200) do |head,out| out.write(''); end
					# applying the goal state
					self.apply
					res.start(200) do |head,out| out.write(''); end
				rescue Exception => e
					self.send_error(res, e.to_s)
				end
			end
=end
		end

		def http_set_goal(req, res)
			begin
				data = JSON[req.body.read]
				data.each { |k,v|
					@root.set_goal(k,v)
				}
				res.start(200) { |head,out| out.write('') }
			rescue Exception => e
				self.send_error(res, e.to_s)
			end
		end

		def lock(locked=true)
			@mutex.synchronize {
				return false if @locked and locked
				@locked = locked
				return true
			}
		end

		# apply the goal state
		def apply(wait=false)

			t = Thread.new() {
				puts 'Implement changes.'

				# TODO -- put planning stuffs here
				@root.reset_goal
				@main['goal'].each { |k,v|
					next if k[0,1] == '_'
					Nuri::Util.log 'Invalid goal: ' + k if not @root.set_goal(k, v)
				}

=begin
				hostname = Nuri::Util.hostname
				@main['system'].each_pair { |key,value|
					next if key[0,1] == '_' or 
						!value.is_a?(Hash) or
						!value.has_key?('hostname') or
						value['hostname'] != hostname

					@main['goal'].each { |k,v|
						next if k[0,1] == '_'
						puts k + ': ' + @root.get_state(k).class.to_s
					}
					# collect desired state for this key
					node = key
					desired = @main['goal'].select { |k,v| k[2,node.length] == node }
					if desired.length > 0
						# get current state
						current = self.get_state
						desired.each { |v|
							ref, cons = v
							if cons['_type'] == 'equals' and
									current.at(ref) != cons['_value']
								puts ref + ": " + current.at(ref).to_s + " => " + cons['_value'].to_s
								@root.set_goal(desired)
								break
							end
						}
					end
					break	
				}
=end

				puts 'The changes has been applied'
				self.lock(false)
			}

			t.join if wait
		end

		def http_get_goal(req, res)
			begin
				goal = JSON.generate(@root.get_goal)
				res.start(200) do |head,out| out.write(goal); end
			rescue Exception => e
				self.send_error(res, e.to_s)
			end
		end
	end
end
