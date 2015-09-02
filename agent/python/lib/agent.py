#!/usr/bin/env python
# -*- coding: utf-8 -*-

# (c) 2014, Herry <herry13@gmail.com>
#
# This file is part of Nuri
#
# Nuri is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as
# published by the Free Software Foundation, either version 3 of
# the License, or (at your option) any later version.
#
# Nuri is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with Ansible. If not, see <http://www.gnu.org/licenses/>.

import tornado.ioloop
import tornado.web
import os
import sys
import httplib
from optparse import OptionParser

import sfp
import handlers
from agentdb import AgentDB
from runtime import Runtime
from planner import Planner
from daemon import Daemon
from logger import Logger


class Agent(Daemon):
	home = os.path.expanduser("~") + '/.nuri-agent'
	pid_file = home + '/agent.pid'

	__default_config = {
		'port': 1314,
		'home': home,
		#'lib_dir': os.path.dirname(os.path.realpath(__file__)),
		'log_file': home + '/agent.log',
		'bsig_log_file': home + '/bsig.log',
		'modules_dir': home + '/modules',
		'model_file': home + '/agent.model',
		'db_file': home + '/agent.sqlite',
	}
	
	def __init__(self):
		# set daemon PID file
		super(Agent, self).__init__(self.pid_file)

	def initialize(self, config={}):
		# merge custom into default configs
		self.config = dict(self.__default_config.items() + config.items())

		# create home directory if not exist
		if not os.path.exists(self.config["home"]):
			os.makedirs(self.config['home'])
			os.chmod(self.config['home'], 0700)

		# create modules directory if not exist
		if not os.path.exists(self.config['modules_dir']):
			os.makedirs(self.config['modules_dir'])

		return self

	def run(self):
		# initialize workspace
		self.config['logger'] = Logger(self.config)
		self.config['agentdb'] = AgentDB(self.config)
		self.config['runtime'] = Runtime(self.config)
		self.config['planner'] = Planner(self.config)
		
		# create webserver object
		params = dict(config=self.config)
		server = tornado.web.Application([
			(r"/state", handlers.State, params),
			(r"/state/.*", handlers.State, params),
			(r"/sfpstate", handlers.State, params),
			(r"/sfpstate/.*", handlers.State, params),
			(r"/planner/.*", handlers.Planner, params),
			(r"/model", handlers.Model, params),
			(r"/model/.*", handlers.Model, params),
			(r"/modules", handlers.Modules, params),
			(r"/modules/.*", handlers.Modules, params),
			(r"/execute", handlers.Modules, params),
			(r"/agents", handlers.Agents, params),
			(r"/bsig", handlers.BSig, params),
			(r"/bsig/.*", handlers.BSig, params),
			(r"/log", handlers.Logger, params),
			(r"/log/.*", handlers.Logger, params),
		])

		# start agent
		server.listen(self.config['port'])
		tornado.ioloop.IOLoop.instance().start()

	# return agent's PID if it is alive, otherwise None
	def isalive(self):
		if os.path.isfile(self.pid_file):
			with open(self.pid_file, 'r') as f:
				pid = int(f.read())
			try:
				os.kill(pid, 0)
				return pid
			except OSError:
				os.remove(self.pid_file)
		return None



def parse_arguments():
	parser = OptionParser()
	parser.add_option('-s', '--start', action='store_const', dest='command', const='start', help='start the agent daemon')
	parser.add_option('-t', '--stop', action='store_const', dest='command', const='stop', help='stop the agent daemon')
	parser.add_option('-r', '--restart', action='store_const', dest='command', const='restart', help='restart the agent daemon')
	parser.add_option('-a', '--status', action='store_const', dest='command', const='status', help="print the agent's status")
	parser.add_option('-p', '--port', dest='port', type='int', default=1314, help="port number agent will listen to")
	parser.add_option('-e', '--resolve', dest='reference', type='string', default=None, help="reference to be resolve")
	return parser.parse_args()

def main():
	options, args = parse_arguments()
	config = dict(port=options.port)
	if options.command or options.reference:
		agent = Agent()
		if options.command == 'start':
			pid = agent.isalive()
			if pid:
				print 'agent is already running with pid=' + str(pid)
			else:
				agent.initialize(config).start()
		elif options.command == 'stop':
			pid = agent.isalive()
			if pid:
				agent.initialize(config).stop()
			else:
				print 'agent is already stopped'
		elif options.command == 'restart':
			agent.initialize(config)
			if agent.isalive():
				agent.stop()
			agent.start()
		elif options.command == 'status':
			pid = agent.isalive()
			if pid:
				print 'agent is running with pid=' + str(pid)
			else:
				print 'agent is stopped'
		elif options.reference:
			port = options.port if options.port else agent.__default_config['port']
			path = '/' + options.reference.replace('.', '/') if not sfp.isref(options.reference) else sfp.ref_to_uri(options.reference)
			http = httplib.HTTPConnection('localhost', str(port))
			http.request('GET', '/state' + path)
			res = http.getresponse()
			if int(res.status) == 200:
				print res.read()
			else:
				print('{"status":"error"}')
	else:
		Agent().initialize(config).run()


if __name__ == "__main__":
	main()
