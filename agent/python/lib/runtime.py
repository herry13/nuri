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

import os
import time
import json
import fcntl
import urllib2

import subprocess
import yaml
import sys
import traceback

import sfp

#####
#
# update root and model file: (lock READ|WRITE)
# - set_model
#
# using root and model file: (lock READ)
# - get_state
# - get_sfpstate
# - get_model
# - execute
#
# TODO:
# Lock is implemented using lock file with fcntl function. This should be compared
# on using SQLite locking system.
#
#####
class Runtime(object):
	def __init__(self, config):
		self.root = {}
		self.config = config
		self.model_file = config['model_file']
		self.logger = config['logger']
		self.agentdb = config['agentdb']
		self.__update()

	def get_model_state(self, path=''):
		fd = self.__lock_read_model()
		model = self.get_model(path)
		state = self.get_state(path)
		self.__unlock_model(fd)
		return model, state

	def get_model_sfpstate(self, path=''):
		fd = self.__lock_read_model()
		model = self.get_model(path)
		sfpstate = self.get_sfpstate(path)
		self.__unlock_model(fd)
		return model, sfpstate

	# Return model 
	def get_model(self, path=''):
		fd = self.__lock_read_model()
		model = {}
		if os.path.isfile(self.model_file):
			json_data = open(self.model_file)
			model = json.load(json_data)
			json_data.close()
		self.__unlock_model(fd)
		return sfp.find(model, path)

	# Set model
	def set_model(self, model):
		fd = self.__lock_read_write_model()
		with open(self.model_file, 'w') as f:
			model_json = json.dumps(model) if isinstance(model, dict) else model
			f.write(model_json)
		self.__update()
		self.__unlock_model(fd)

	# Update the objects' structure
	def __update(self):
		# read/parse model file
		model = self.get_model()
		# generate object tree structure
		self.root = self.__update_object(model, '$')

	# Return the current state (without hidden attributes)
	def get_state(self, path=''):
		fd = self.__lock_read_model()
		state = self.__get_state(path)
		self.__unlock_model(fd)
		return state

	# Return the current state in SFP (includes hidden attributes)
	def get_sfpstate(self, path=''):
		def add_hidden(state, model):
			if not isinstance(state, dict):
				return state
			for key in state:
				if isinstance(state[key], dict) and key in model:
					state[key] = add_hidden(state[key], model[key])
			for key in model:
				if key[0] == '_' and not key in state:
					state[key] = model[key]
			return state

		fd = self.__lock_read_model()
		# get the model
		model = self.get_model(path)
		# get the state
		sfpstate = self.__get_state(path)
		self.__unlock_model(fd)
		return add_hidden(sfpstate, model) if isinstance(sfpstate, dict) else sfpstate

	# Execute given action description.
	def execute(self, action):
		fd = self.__lock_read_model()
		parent, subpath = self.__get_parent_object(self.root, str(action['name']))
		if len(subpath.split('.')) > 1 or not isinstance(parent, dict) or not '_self' in parent:
			return False
		out = parent['_self'].execute(subpath, action['parameters'])
		self.__unlock_model(fd)
		return out

	# Update object structure based on given model.
	def __update_object(self, model, path):
		def instantiate_sfp_object():
			# instantiate SFP object
			sfp_object = Module(path, model['_isa'][2:], self.config)
			sfp_object.initialize(model)
			return sfp_object

		store = {}
		if ('_context' in model) and model['_context'] == 'object' and sfp.isref(model['_isa']):
			store['_self'] = instantiate_sfp_object()
		for key in model:
			value = model[key]
			if key[0] != '_' and isinstance(value, dict) and ('_context' in value) and value['_context'] == 'object':
				store[key] = self.__update_object(value, path + '.' + key)
		return store

	# Return the deepest parent object of given path 
	def __get_parent_object(self, obj, path):
		if not isinstance(path, str):
			return None, path
		elif path == '' or path == '$':
			return obj, path
		elif isinstance(obj, dict):
			head, tail = sfp.unshift(path)
			if head == '$':
				return self.__get_parent_object(obj, tail)
			elif head in obj:
				if tail == '':
					return obj[head], tail
				else:
					head2, _ = sfp.unshift(tail)
					if head2 in obj[head]:
						return self.__get_parent_object(obj[head], tail)
					else:
						return obj[head], tail
		return None, path

	# Compute object's state recursively 
	def __get_object_state(self, obj):
		if obj == None:
			return '$.Undefined'
		state = {}
		if '_self' in obj:
			# generate state of current object
			obj_state = obj['_self'].get_state()
			if not isinstance(obj_state, dict):
				return obj_state
			for key in obj_state:
				state[key] = obj_state[key]
		for key in obj:
			if key[0] != '_' and isinstance(obj[key], dict):
				state[key] = self.__get_object_state(obj[key])
		return state

	# Return state of given path.
	def __get_state(self, path):
		parent, subpath = self.__get_parent_object(self.root, path)
		if path != '' and subpath == path[2:]: # the path is not here!
			return self.__get_remote_state(path)
		else:
			state = self.__get_object_state(parent)
			return sfp.find(state, subpath) if subpath != '' else state

	# ref [Reference] : the reference of remote agent
	def __get_remote_state(self, ref):
		parts = ref.split('.', 2)
		name = parts[1]
		agent = self.agentdb.get_by_name(name)
		url = 'http://' + str(agent[name]['sfpAddress']) + ':' + str(agent[name]['sfpPort']) + '/state' + str(sfp.ref_to_uri(ref))
		return self.__http_get(url)

	def __http_get(self, url):
		self.logger.agent.info(url)
		conn = urllib2.urlopen(url)
		if conn.getcode() == 200:
			return json.loads(conn.read())			
		return None

	# Try to get lock until timeout. If timeout and lock is not given then raise exception.
	# Otherwise, create lock file. 
	def __lock_read_model(self):
		fd = open(self.model_file + '.lock', 'w+')
		fcntl.lockf(fd, fcntl.LOCK_SH)
		return fd

	def __unlock_model(self, fd):
		fd.close()

	def __lock_read_write_model(self):
		fd = open(self.model_file + '.lock', 'w+')
		fcntl.lockf(fd, fcntl.LOCK_EX)
		return fd


#####
#
# Module: A class as interface between runtime and the resource component.
#         It passes the required parameters as command line arguments,
#         and processes the outputs.
#
#####
class Module(object):
	path = ''
	model = {}
	state = {}

	__type = 'nuri'
	__extra_ansible_attributes = ['configured']

	# path: absolute path of the module in SFP model
	# module_name: implementation of schema
	#
	def __init__(self, path, module_name, config):
		self.path = path
		self.module_main = config['modules_dir'] + '/' + module_name + '/' + module_name
		config_file = config['modules_dir'] + '/' + module_name + '/config.yaml'
		if os.path.isfile(config['modules_dir'] + '/' + module_name + '/__ansible__'):
			self.__type = 'ansible'
		#self.lib_dir = config['lib_dir']

	def initialize(self, model):
		self.model = model
		self.__finals = model['_finals'] if '_finals' in model else []

	# return a dict describing the current state, or
	# return "$.Unknown" if there was an error
	def get_state(self):
		if self.__type == 'nuri':
			args = {
				'request': 'state',
				'model': self.model,
				'path': self.path
			}
			out = self.__invoke_nuri_module(args)
			return out['state'] if out and out['status'] == 'ok' else '$.Unknown'

		elif self.__type == 'ansible':
			# call module
			args = ''
			for key in self.model:
				val = self.model[key]
				if key[0] != '_' and not key in self.__finals and not sfp.isany(val) and \
				   not sfp.isaction(val) and not key in self.__extra_ansible_attributes:
					args += key + '=' + str(val) + ' '
			state = self.__invoke_ansible_module(args)
			if not isinstance(state, dict):
				return '$.Unknown' # there was an error during module execution
			state['configured'] = self.__isconfigured(state)
			return state

	# execute an action
	# return None if failed, otherwise return the description
	def execute(self, name, parameters={}):
		if self.__type == 'nuri':
			args = {
				'request': 'execute',
				'action': name,
				'parameters': parameters,
				'model': self.model,
				'path': self.path
			}
			out = self.__invoke_nuri_module(args)
			if out and out['status'] == 'ok':
				return out['description']
			else:
				return None

		elif self.__type == 'ansible':
			args = ''
			for key in self.model:
				val = self.model[key]
				if key[0] != '_' and not sfp.isany(val) and not sfp.isaction(val) and \
				   not key in self.__extra_ansible_attributes:
					args += str(key) + '=' + str(val) + ' '
			state = self.__invoke_ansible_module(args)
			if isinstance(state, dict) and self.__isconfigured(state):
				return '{"status":"ok"}'
			
	def __isconfigured(self, state):
		if 'failed' in state and state['failed']:
			return False
		for key in state:
			if key in self.model and not sfp.isany(self.model[key]) and state[key] != self.model[key]:
				return False
		return True

	# return None if failed (exception or execution was failed),
	# otherwise return the description
	def __invoke_nuri_module(self, args):
		try:
			json_args = json.dumps(args)
			p = subprocess.Popen([self.module_main, json_args], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
			out, err = p.communicate()
			if len(str(err)) > 0:
				return None
			else:
				return json.loads(out)
		except:
			return None

	# Every ansible module must be "self-contained". The required library such as
	# "ansible.module_utils.basic" should be included in the module's directory.
	#
	# return None if there was an exception, otherwise return the JSON output
	def __invoke_ansible_module(self, args):
		try:
			p = subprocess.Popen([self.module_main, args], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
			out, err = p.communicate()
			return json.loads(out)
		except:
			return None
