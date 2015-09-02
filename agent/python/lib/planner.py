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

import copy
import sfp

#####
#
# Planner:
# A class for implementing distributed SFP planner.
#
#####
class Planner(object):
	grounded_actions = {}

	def __init__(self, config):
		self.runtime = config['runtime']

	def values(self):
		model, state = self.runtime.get_model_sfpstate()
		values = {}
		sfp.values(model, values)
		sfp.values(state, values)
		for _type in values:
			values[_type] = list(values[_type])
		return values

	def actions(self):
		return sfp.actions(self.runtime.get_model(), {})

	def __ground_actions(self):
		def rewrite(context, params):
			for key in context.keys():
				key2 = str(key)
				val = context[key]
				for par in params:
					parx = par + '.'
					l = len(parx)
					if sfp.isref(val) and str(val)[0:l] == parx:
						context[key] = params[par] + '.' + str(val)[l:]
					if key2[0] != '_' and key2[0:l] == parx:
						context[ params[par] + '.' + key2[l:] ] = context[key]
						context.pop(key, None)
						break
				if isinstance(val, dict):
					rewrite(val, params)

		def get_params(name, action):
			params = {}
			params['$.this'], _ = sfp.pop(name)
			for key in action:
				if sfp.isref(key):
					params[key] = action[key]
			return params

		def to_fdr(name, action):
			rewrite(action, get_params(name, action))
			action['effect'] = {}
			for key in action['_effect'].keys():
				if sfp.isref(key):
					action['effect'][key] = action['_effect'][key]['_value']
			action['condition'] = {}
			for key in action['_condition'].keys():
				if sfp.isref(key):
					action['condition'][key] = action['_condition'][key]['_value']
			action['cost'] = action['_cost']
			sfp.remove_hiddens(action)
			return action

		grounded = {}
		values = self.values()
		actions = self.actions()
		for name in actions.keys():
			grounded[name] = to_fdr(name, copy.deepcopy(actions[name])) # {'$.this': _this})
			for key in actions:
				if key[0] == '_':
					actions.pop(key, None)

		self.grounded_actions = grounded
