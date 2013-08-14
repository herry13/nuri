Nuri2 Project
=============
- author: Herry (herry13@gmail.com)
- last update: 13-07-2013


Requirements
------------
- Ruby (>= 1.9.1)
- Ruby Gems:
	- sfp (>= 0.3.5)
	- sfplanner (>= 0.0.2)
	- colorize (>= 0.5.8)
	- coderay (>= 1.0.9)


To install
----------

	$ apt-get install make ruby1.9.1 ruby1.9.1-dev libz-dev libaugeas-ruby1.9.1 libxml2-dev libxslt-dev
	$ gem install sfplanner colorize coderay


Usage
-----
Assume that the model of your system is in file "model.sfp".
- to get the current state

		$ ./bin/nuri -h -m model.sfp -s

- to generate the plan

		$ ./bin/nuri -h -m model.sfp -p

  press 'Y' and enter to execute the plan (if the plan exists).

- to execute any generated plan

		$ ./bin/nuri -h -m model.sfp -a


