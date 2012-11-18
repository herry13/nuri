Nuri
====
- author: Herry (herry13@gmail.com)
- website: http://homepages.inf.ed.ac.uk/s0978621/
- last update: 16-09-2012
- version: 0.1.1
 
Nuri is an automated workflow configuration tool. It allows you to manage nodes' configuration by automatically generating the workflows to achieve the desired state defined in goal & global constraints. The workflow execution will control by a master node to satisfy particular ordering constraint.

Most parts of Nuri is written in Ruby except the solver which is written in C++.

Requirements
------------
- Linux Ubuntu 12.04
- required packages
	- ruby (>= 1.8.7)
	- rubygems
	- libz-dev
	- libaugeas-ruby
- required Ruby Gems
	- mongrel
	- json
	- antlr3
- git

To Install
----------
- If you do not have **git**, then install it first:

		$ sudo apt-get install git


- Clone the Nuri software from Github repository:

		$ git clone https://github.com/herry13/nuri

Available Modules
-----------------
- Apache (Apache)
- Mysql (Mysql)
- Apache Load Balancer (Apachelb)
- Tiki Wiki (Tikiweb & Tikidb)

Running Nuri client on managed node
-----------------------------------
1. Specify the domain-name of master node in file 'etc/nuri.sfp'

		nuri {
			...
			trusted is ("master.domain.com")
			...
		}

	You must put all client nodes' domain in trusted set if you want a node to share its states with other nodes. This may require by some components, e.g. TikiWiki component.

2. Start client daemon:

		$ sudo ./bin/nuri.rb &

3. To check whether the daemon has run, open the following URL in your browser: *http://localhost:9090/state*.
   If you get an error, you may need to reconfigure your firewall to open port 9090. 

Controlling Nuri clients from master node
-----------------------------------------
1. Create main specification file *etc/main.sfp*. The following example specifies configuration of two client nodes i.e.
   *host1* and *host2* where both runs apache service.

		system {
		  host1 isa Node {
		    domainname is "host1.domain.com"
		  }
		  hpvm12 isa Node {
		    domainname is "host2.domain.com"
		  }
		}

		goal constraint {
		  // apache on 'host1' is running
		  host1.apache.running is true

		  // mysql on 'host2' is running
		  host2.mysql.running is true
		}
		
		global constraint {  // no global constraint
		}

2. Get current state of all nodes from master node:

		$ bin/nuri.rb -c pull

3. Generate a workflow to implement the desired state

		$ bin/nuri.rb -c plan

4. Applying the goal & global constraints specified in *etc/main.sfp* on master node onto client nodes i.e. *host1* and *host2* by generating and executing a workflow

		$ bin/nuri.rb -c apply

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
- primitive types: Boolean, String, Integer
- non-primitive type: any user-defined Class
- abstract data-structure: Array (1-dimension), and Set
- example of configuration task:
	https://github.com/herry13/nuri/tree/master/test/planning/

**Class**
- could have one or more attributes with a primitive/non-primitive type
- could have one or more procedures to make changes the value of the attributes

**Procedure**
- support cost-value
- support the following *effects* statements:

		x = y
		x is y

- support the *condition* statements as specified in *constraint* section.

**Constraint**
The user could define the following constraints in the procedure's **condition**, **goal**, and **global** constraints:

	// equality
	x = y
	x is y
	x = null
	x is null

	// inequality
	x != y
	x isnt y
	x != null
	x isnt null

	// conditional
	if x1 = y1 then x2 = y2
	if x1 != y2 then x2 != y2

	// membership
	x is in (y1, y2, y3)
	x isnt in (y1, y2, y3)

	// array enumeration
	foreach (my_array as x) {
		x.attribute = y
	}

	// set enumeration
	foreach (my_set as x) {
		x.attribute = y
	}

	// class quantification
	forall (MyClass as x) {  // apply for all objects of MyClass
		x.attribute = y
	}


License
-------

BSD LICENSE

Copyright (c) 2012, Herry
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met: 

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer. 
2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution. 

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

The views and conclusions contained in the software and documentation are those
of the authors and should not be interpreted as representing official policies, 
either expressed or implied, of the FreeBSD Project.

The solver binaries are under GPL License from http://fast-downward.org.
