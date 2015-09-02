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
import subprocess
import logging

class Logger(object):
	agent = None
	bsig = None

	def __init__(self, config):
		self.log_file = config['log_file']
		self.bsig_log_file = config['bsig_log_file']

		self.agent = logging.getLogger('agent')
		self.agent.setLevel(logging.INFO)
		self.bsig = logging.getLogger('bsig')

		formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')

		# set main log file
		main_handler = logging.FileHandler(
			filename = self.log_file,
			mode = 'a',
			encoding = None,
			delay = False
		)
		main_handler.setFormatter(formatter)
		logging.root.addHandler(main_handler)
		self.agent.addHandler(main_handler)

		# set bsig log file
		bsig_handler = logging.FileHandler(
			filename = self.bsig_log_file,
			mode = 'a',
			encoding = None,
			delay = False
		)
		bsig_handler.setFormatter(formatter)
		self.bsig.addHandler(bsig_handler)

	def get(self, numlines=100):
		if os.path.isfile(self.log_file):
			p = subprocess.Popen(['tail', "-n " + str(numlines), self.log_file], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
			out, err = p.communicate()
			print err
			if len(err) <= 0:
				return str(out)
		return None
