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

import sys
import json
import urlparse
import sqlite3 as sqlite

# table "agents":
# - name VARCHAR
# - address VARCHAR
# - port INT
#
class AgentDB(object):
	tablename = 'agents'

	def __init__(self, config):
		self.db_file = config['db_file']
		self.conn = sqlite.connect(config['db_file'])

		self.logger = config['logger']

		# check table existence
		with self.conn:
			if not self.__table_exists():
				self.conn.cursor().execute("CREATE TABLE " + self.tablename + "(name VARCHAR, address VARCHAR, port INT)")
				self.conn.commit()
			if not self.__table_exists():
				raise Exception('cannot create table ' + self.tablename)

	def __table_exists(self):
		return (len(self.__query("SELECT name FROM sqlite_master WHERE type='table' AND name='" + self.tablename + "'")) > 0)

	def __query(self, sql):
		with self.conn:
			return self.conn.cursor().execute(sql).fetchall()

	def __get(self, where=''):
		sql = 'SELECT name,address,port FROM ' + self.tablename
		sql += ' WHERE ' + where if len(where) > 0 else ''
		agents = {}
		for row in self.__query(sql):
			agents[row[0]] = {'sfpAddress': row[1], 'sfpPort': row[2]}
		return agents

	# Add agents
	def add(self, agents):
		with self.conn:
			c = self.conn.cursor()
			for key in agents:
				address = str(agents[key]['sfpAddress'])
				port = str(int(agents[key]['sfpPort']))
				c.execute('INSERT INTO ' + self.tablename + " VALUES ('" + key + "','" + address + "'," + port + ")")
			self.conn.commit()

	# return return by name
	def get_by_name(self, name):
		where = "name='" + name + "'"
		return self.__get(where)

	# Return all agents
	def get_all(self):
		return self.__get()

	# delete all agents
	def delete_all(self):
		with self.conn:
			c = self.conn.cursor()
			c.execute("DELETE FROM " + self.tablename)
			self.conn.commit()

	# delete agent by name
	def delete_by_name(self, name):
		c = self.conn.cursor()
		c.execute("DELETE FROM " + self.tablename + " WHERE name='" + name + "'")
		self.conn.commit()
