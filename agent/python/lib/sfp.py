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


#####
#
# return URI of given reference
#
#####
def uri_to_ref(s):
	return '$.' + str(s).replace('/', '.')

#####
#
# return reference of given URI
#
#####
def ref_to_uri(r):
	return '/' + r[2:].replace('.', '/') if isref(r) else None

#####
#
# Find the value of given path within given value.
# Return $.Undefined if the value is not an object or schema, or
# if the path is not exist.
#
#####
def find(root, path):
	if not isinstance(path, str):
		return '$.Undefined'
	elif path == '' or path == '$':
		return root
	elif isinstance(root, dict):
		parts = path.split('.', 1)
		head = parts[0]
		tail = parts[1] if len(parts) > 1 else ''
		if head == '$':
			return find(root, tail)
		elif head in root:
			return find(root[head], tail)
	return '$.Undefined'

#####
#
# Returns the first identifier and the identifiers of given reference.
#
#####
def unshift(path):
	parts = path.split('.', 1)
	tail = parts[1] if len(parts) > 1 else ''
	return parts[0], tail


def pop(path):
	parts = path.split('.')
	last = parts.pop()
	return '.'.join(parts), last


#####
#
# Return True if given value is a reference, otherwise False
#
#####
def isref(s):
	return ((isinstance(s, str) or isinstance(s, unicode)) and str(s)[0:2] == '$.')

#####
#
# Return True if given value is any-value, otherwise False
#
#####
def isany(val):
	return (isinstance(val, dict) and '_context' in val and val['_context'] == 'any_value')

#####
#
# Return true if given value is a schema
#
#####
def isschema(value):
	return (isinstance(value, dict) and '_context' in value and value['_context'] in ['schema', 'class'])

#####
#
# Return true if given value is an action
#
#####
def isaction(value):
	return (isinstance(value, dict) and '_context' in value and value['_context'] in ['action', 'procedure'])

#####
#
# Return true if given value is an object
#
#####
def isobject(value):
	return (isinstance(value, dict) and '_context' in value and value['_context'] == 'object')

#####
#
# Recursively classifying given value to particular type and
# added to given table. The value is added if it is not a value
# of schema's attribute. The value in the condition and effect
# of action will be included.
#
#####
def values(value, table, path='$', inschema=False):
	def add(_type, val):
		if not _type in table:
			table[_type] = set()
		table[_type].add(val)

	if isinstance(value, bool):
		add('bool', value)
	elif isinstance(value, int):
		add('int', value)
	elif isinstance(value, float):
		add('float', value)
	elif isinstance(value, str) or isinstance(value, unicode):
		if not isref(value) and len(value) > 0:
			add('str', str(value))
	elif isinstance(value, dict):
		if not inschema and '_classes' in value:
			for c in value['_classes']:
				add(c, path)
		for key in value:
			if key[0] != '_' or key in ['_condition', '_effect', '_value']:
				values(value[key], table, path + '.' + key, (inschema or isschema(value)))
	return table

#####
#
# Recursively collecting actions from given value and then save them
# to _table_ where the path becomes the map-key and the descriptions
# (parameters, cost, condition, effect) become the map-value.
#
#####
def actions(value, table, path='$'):
	if isaction(value):
		table[path] = value
	elif isinstance(value, dict):
		for key in value:
			if not isschema(value[key]) and key[0] != '_':
				actions(value[key], table, path + '.' + key)
	return table


'''
# Convert SFP value to Python:
# - $.Any to None
def to_python(val):
	if isref(val) and val[0:6] == '$.Any.':
		return None
	if isany(val):
		return None
	if isinstance(val, dict):
		py = {}
		for key in val:
			py[key] = to_python(val[key])
		return py
	return val
'''

def remove_hiddens(context):
	if isinstance(context, dict):
		for key in context.keys():
			if str(key[0]) == '_':
				context.pop(key, None)
			elif isinstance(context[key], dict):
				context[key] = remove_hiddens(context[key])
	return context
