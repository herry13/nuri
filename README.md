Nuri
====
- author: Herry (herry13@gmail.com)
- website: http://homepages.inf.ed.ac.uk/s0978621/
- last update: 16-09-2012
 
Nuri is a dynamic workflow configuration tool. It allows you to manage nodes' configuration by automatically generating the workflows to achieve the desired state defined in goal & global constraints. The workflow execution will control by a master node to satisfy particular ordering constraint.

Most parts of Nuri is written in Ruby except the solver which is written in C++.

To Install
----------
- If you do not have **git**, then install it first:

		$ sudo apt-get install git


- Clone the Nuri software from Github repository:

		$ git clone https://github.com/herry13/nuri


Requirements
------------
These are requirements for running a **Nuri Client** service on managed node:
- Ubuntu
	- required packages
		- ruby (>= 1.8.7)
		- rubygems
		- libz-dev
		- libaugeas-ruby
	- required Ruby Gems
		- mongrel
		- json
		- antlr3
- Scientific Linux
	- required packages
		- ruby (>= 1.8.7)
		- ruby-devel
		- rubygems
		- zlib-devel
		- augeas-devel
	- required Ruby Gems
		- mongrel
		- json
		- antlr3
		- ruby-augeas

These are requirements for running a **Nuri Master** on master node:
- Ubuntu
	- required packages
		- ruby (>= 1.8.7)
		- rubygems
		- libz-dev
	- required Ruby Gems
		- json
		- antlr3
- Scientific Linux
	- required packages
		- ruby (>= 1.8.7)
		- ruby-devel
		- rubygems
		- zlib-devel
	- required Ruby Gems
		- json
		- antlr3

Running Nuri client on managed node
-----------------------------------
1. Start client daemon:

		$ ./bin/nuri.rb &

2. To check whether the daemon has run, open the following URL in your browser: *http://localhost:9090/state*.
   If you get an error, you may need to reconfigure your firewall to open port 9090. 

Controlling Nuri clients from master node
-----------------------------------------
1. Create main specification file *etc/main.sfp*. The following example specifies configuration of two client nodes i.e.
   *hpvm11* and *hpvm12* where both runs apache service.

		system {
		  hpvm11 isa Node {
		    domainname is "hpvm11.diy.inf.ed.ac.uk"
		  }
		  hpvm12 isa Node {
		    domainname is "hpvm11.diy.inf.ed.ac.uk"
		  }
		}

		goal constraint {
		  // apache on 'hpvm11' is running
		  hpvm11.apache.running = true
		  // apache on 'hpvm12' is running
		  hpvm12.apache.running = true
		}
		
		global constraint {  // no global constraint
		}

2. Get current state of all nodes:

		$ ./bin/nuri.rb -c pull

3. Applying the goal & global constraints specified in *etc/main.sfp* on *hpvm11* and *hpvm12*
   by generating and executing a workflow

		$ ./bin/nuri.rb -c apply

Documentation
-------------
Required Gems
- yard
- redcarpet

To build:

    $ cd doc
    $ ./build.sh

SFp Language
------------
- primitive types: Boolean, String, Number
- non-primitive type: any user-defined Class
- abstract data-structure: Array (1-dimension)
- example of configuration task:
	https://github.com/herry13/nuri/tree/master/test/planning

**Class**
- could have one or more attributes with a primitive/non-primitive type
- could have one or more procedures

**Procedure**
- support cost-value
- support the following *effects* statements:

		x = y
		x = null

- support the following *conditions* statements:

		x = y
		x = null
		x != y
		x != null
		if x1 = y1 then x2 = y2
		if x1 != y2 then x2 != y2
		x is in (y1, y2, y3)
		x isnt in (y1, y2, y3)
		for (my_array as x) {
			x.attribute = y
		}

**Goal & Global Constraints**
- support the following the following constraint statements:

		x = y
		x = null
		x != y
		x != null
		if x1 = y1 then x2 = y2
		if x1 != y2 then x2 != y2
		x is in (y1, y2, y3)
		x isnt in (y1, y2, y3)
		for (my_array as x) {
			x.attribute = y
		}
