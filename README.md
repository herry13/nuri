Nuri
====
- author: Herry (herry13@gmail.com)
- website: http://homepages.inf.ed.ac.uk/s0978621/
- last update: 16-09-2012
 
Nuri is a dynamic workflow configuration tool. It allows you to manage nodes' configuration by automatically generating the workflows to achieve the desired state defined in goal & global constraints. The workflow execution will control by a master node to satisfy particular ordering constraint.

Requirements
------------
Ubuntu
- required packages
	- ruby (>= 1.8.7)
	- rubygems
	- libz-dev
	- libaugeas-ruby
- required Ruby Gems
	- mongrel
	- json
	- antlr3

Scientific Linux
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

Running Nuri client on managed node
-----------------------------------
1. Start client daemon:

		$ ./bin/nuri.rb &

2. To check whether the daemon has run, open the following URL in your browser: *http://localhost:9090/state*.
   If you get an error, you may need to reconfigure your firewall to open port 9090. 

Controlling Nuri clients from master node
-----------------------------------------
1. Create main specification file *etc/main.sfp*. This file is configuration specification to be deployed onto managed nodes:
  - For example, if your clients' hostname and address are:
    - hpvm11, hpvm11.diy.inf.ed.ac.uk
    - hpvm12, hpvm12.diy.inf.ed.ac.uk
  - Put the list of your clients in *system* block:

			system {
			  hpvm11 isa Node {
			    domainname is "hpvm11.diy.inf.ed.ac.uk"
			  }
			  hpvm12 isa Node {
			    domainname is "hpvm11.diy.inf.ed.ac.uk"
			  }
			}

  - Define the goal and global constraint of your system. For example, if you want both clients to have *apache* service
    running, then *goal* and *global* blocks will contain:

			goal constraint {
			  hpvm11.apache.running = true
			  hpvm12.apache.running = true
			}
			
			global constraint {
			}

2. Get current state of all nodes:

		$ ./bin/nuri.rb -c pull pretty

3. Applying the goal & global constraints:

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
- non-primitive type (user-defined Class)
- abstract data-structure: Array (1-dimension)

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
