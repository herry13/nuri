Nuri
====
- author: Herry [herry13@gmail.com]
- last update: 13-07-2013
- license: BSD

Nuri is an automated workflow configuration tool. It allows us to define the desired state of
the managed system, and the tool will automatically generate and orchestrate the execution of the workflow
that will:

1. bring the system from current to the desired state,
2. maintain any necessary constraints during the configuration changes.

Unlike any other orchestration tool, this will eliminate the obligation for the user to define an explicit
workflow to implement the configuration, which allows "unattended" reconfiguration.

The desired state is specified in a declarative configuration language, called as SFP, where we could
define a "loose" specification of the desired state as well as a set of global constraints
(the constraints that must be satisfied during the changes).

Each resource is managed by an instant of Nuri module, which consists of:

1. a schema file in SFP language, that contains a set of attributes and declarative procedures;
2. an implementation file in Ruby, that has contains a Ruby class with a set of methods (the implementation of SFP procedures).


Requirements
------------
- Ruby (>= 1.9.1)
- Ruby Gems:
	- sfplanner (>= 0.1.1)
	- colorize (>= 0.5.8)
	- coderay (>= 1.0.9)

Tested on: **Ubuntu 12.04**, **Debian Squeeze**


To install
----------

	$ apt-get install git make gcc curl ruby1.9.1 ruby1.9.1-dev libz-dev libaugeas-ruby1.9.1 libxml2-dev libxslt-dev
	$ gem install sfplanner colorize coderay
	$ git clone https://github.com/herry13/nuri


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


