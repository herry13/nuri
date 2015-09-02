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

import tornado
import urlparse
import os
import subprocess
import commands
import json
import yaml
import shutil
import logging

import sfp


class Handler(tornado.web.RequestHandler):
	def initialize(self, config):
		self.config = config

	def header(self, status, content_type='text/plain'):
		self.add_header("Agent", "0.1 Python")
		self.set_status(status)
		self.set_header('Content-Type', content_type)


class Agents(Handler):
	def initialize(self, config):
		self.agentdb = config['agentdb']
		self.logger = config['logger']

	''' HTTP GET /agents '''
	def get(self):
		self.header(200, 'application/json')
		self.write(json.dumps(self.agentdb.get_all()))

	''' HTTP PUT /agents '''
	def put(self):
		self.agentdb.add(json.loads(urlparse.parse_qs(self.request.body)['agents'][0]))

	''' HTTP DELETE /agents '''
	def delete(self):
		self.agentdb.delete_all()


class State(Handler):
	def initialize(self, config):
		self.runtime = config['runtime']
		self.logger = config['logger']

	def get(self):
		state = {'state': '$.Undefined'}
		if self.request.uri == '/state' or self.request.uri == '/state/':
			state['state'] = self.runtime.get_state()
		elif self.request.uri == '/sfpstate' or self.request.uri == '/sfpstate/':
			state['state'] = self.runtime.get_sfpstate()
		else:
			ref = sfp.uri_to_ref(self.request.uri.split('/', 2)[2])
			if self.request.uri[0:7] == '/state/':
				state['state'] = self.runtime.get_state(ref)
			else:
				state['state'] = self.runtime.get_sfpstate(ref)
		self.header(200, 'application/json')
		self.write(json.dumps(state))


class Model(Handler):
	def initialize(self, config):
		self.runtime = config['runtime']
		self.logger = config['logger']

	def get(self):
		model = self.runtime.get_model()
		if model == None:
			self.header(404)
		elif self.request.uri == '/model':
			self.write(model)
			self.header(200, 'application/json; charset="utf-8"')
		else:
			path = '$.' + self.request.uri[7:].replace('/', '.')
			value = sfp.find(model, path)
			value = json.dumps(value) if isinstance(value, dict) else value
			self.write(value)

	def put(self):
		if self.request.uri == '/model':
			# parse body, save the model (automatically update the objects structure)
			model = json.dumps(json.loads(urlparse.parse_qs(self.request.body)['model'][0]), indent=4, sort_keys=True)
			self.runtime.set_model(model)

		else:
			self.header(501)

	def delete(self):
		if self.request.uri == '/model':
			# emptying the model (automatically update the objects structure)
			self.runtime.set_model('{}')

		else:
			self.header(503)


class Modules(Handler):
	def initialize(self, config):
		self.modules_dir = config['modules_dir']
		self.runtime = config['runtime']
		self.logger = config['logger']

	def get(self):
		# TODO: replace commands.* with subprocess.*
		def get_hash(path):
			# determine md5 command
			md5 = None
			if len(commands.getoutput('which md5sum')) > 0:
				md5 = 'md5sum'
			elif len(commands.getoutput('which md5')) > 0:
				md5 = 'md5'		
	
			cmd = "find " + path + " -type f -exec " + md5 + " {} + | awk '{print $1}' | sort | " + md5 + " | awk '{print $1}'" if md5 != None else None

			if cmd != None:
				code, out = commands.getstatusoutput(cmd)
				return out if code == 0 else None
			return None

		if self.request.uri == '/modules' or self.request.uri == '/modules/':
			out = {}
			for module in self.list_modules():
				out[module] = get_hash(self.modules_dir + '/' + module)
			self.write(json.dumps(out))
		else:
			parts = self.request.uri.split('/', 2)
			path = self.modules_dir + '/' + parts[2] if len(parts) > 2 else None
			if path == None or not os.path.isdir(path):
				self.header(404)
			else:
				self.write(get_hash(path))

	def put(self):
		modules = urlparse.parse_qs(self.request.body)
		for module in modules:
			self.save_module(module, modules[module][0])

	def delete(self):
		if self.request.uri == '/modules' or self.request.uri == '/modules/':
			for module in self.list_modules():
				self.delete_module(module)
		else:
			parts = self.request.uri.split('/', 2)
			self.delete_module(parts[2])

	def list_modules(self):
		entries = os.listdir(self.modules_dir)
		modules = []
		for key in entries:
			modules.append(key) if os.path.isdir(self.modules_dir + '/' + key) else None
		return modules

	def save_module(self, name, module):
		path = self.modules_dir + '/data.tgz'
		with open(path, 'wb') as f:
			f.write(module)
		subprocess.call(['tar', 'xvzf', 'data.tgz'], cwd=self.modules_dir, stdout=open(os.devnull, 'w'), stderr=subprocess.STDOUT)
		os.remove(path)
		main_file = self.modules_dir + '/' + name + '/' + name
		os.chmod(main_file, 0700) if os.path.isfile(main_file) else None
		
	def delete_module(self, name):
		path = self.modules_dir + '/' + name
		shutil.rmtree(path) if os.path.isdir(path) else None
		
	def post(self):
		out = self.runtime.execute(json.loads(urlparse.parse_qs(self.request.body)['action'][0]))
		if not out:
			self.header(503)
		else:
			self.write(out)


class BSig(Handler):
	def get(self):
		self.header(501)
		self.write("")
		print(self.request.path)

	def put(self):
		self.header(501)
		self.write("")
		print(self.request.path)

	def delete(self):
		self.header(501)
		self.write("")
		print(self.request.path)


class Logger(Handler):
	def initialize(self, config):
		self.logger = config['logger']

	def get(self):
		numlines = 100
		try:
			parts = self.request.uri.split('/', 2)
			if len(parts) > 2 and len(parts[2]) > 0:
				numlines = int(parts[2])
		except:
			self.header(400)
			return
		log = self.logger.get(numlines)
		if log:
			self.write(log)
		else:
			self.header(404)


class Planner(Handler):
	def initialize(self, config):
		self.planner = config['planner']
		self.logger = config['logger']

	def get(self):
		if self.request.uri == '/planner/values':
			self.header(200, 'application/json')
			self.write(json.dumps(self.planner.values()))
		elif self.request.uri == '/planner/actions':
			self.header(200, 'application/json')
			self.write(json.dumps(self.planner.actions()))
		elif self.request.uri == '/planner/groundedactions':
			self.header(200, 'application/json')
			self.planner.__ground_actions()
			self.write(json.dumps(self.planner.grounded_actions))
		else:
			self.header(404)
