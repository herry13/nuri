Nuri
====
- author: Herry (herry13@gmail.com)
- website: http://homepages.inf.ed.ac.uk/s0978621/nuri
- last update: 27-05-2013
- version: 0.3.6
 
Nuri is an automated workflow configuration tool. It allows you to manage nodes' configuration by automatically generating the workflows to achieve the desired state defined in goal & global constraints. The workflow execution will control by a master node to satisfy particular ordering constraint.

Most parts of Nuri is written in Ruby except the solver which is written in C++.

Requirements
------------
- Linux Ubuntu (>= 12.04)
- required packages
	- ruby (>= 1.8.7)
	- ruby-dev
	- rubygems (if you use ruby <= 1.8.7)
	- libz-dev
- required Ruby Gems
	- webrick
	- json
	- antlr3

For a better performance, it is recommended to use ruby >= 1.9

Some **extra packages/gems** are required by some modules:
- extra packages
 	- libaugeas-ruby (mysql)
 	- libxml2-dev (hpcloud, rackspace, aws)
 	- libxslt-dev (hpcloud, rackspace, aws)
- extra gems
	- fog (hpcloud, rackspace, aws)

To Install
----------
- If you do not have **git**, then install it first:

		$ sudo apt-get install git

- Install required packages and gems

		$ sudo apt-get update
		$ sudo apt-get install make ruby ruby-dev rubygems libz-dev libaugeas-ruby libxml2-dev libxslt-dev
		$ sudo gem install webrick json antlr3 fog

- Clone the Nuri software from Github repository:

		$ git clone https://github.com/herry13/nuri


Available Modules
-----------------
- **machine**            - a standard physical machine
- **vm**                 - a virtual machine
- public cloud (IaaS)
	- **hpcloud**            - HPCloud compute (read "module/hpcloud/README.md")
	- **rackspace**          - Rackspace compute V2 (Next-gen) (read "module/rackspace/README.md")
	- **aws**                - Amazon Web Service EC2
- http server
	- **apache**             - Apache web server
	- **nginx**              - Nginx web server
- load balancer
	- **apachelb**           - Apache load balancer
- database server
	- **mysql**              - Mysql database server
	- **mariadb**            - MariaDB database server
	- **mongodb**            - MongoDB (NoSQL) database server
- web application
	- **tikiweb**            - application layer (PHP) part of Tiki Wiki CMS
	- **tikidb**             - database layer part of Tiki Wiki CMS
	- **nurilabs**           - A web-based interface for Nuri master


Standalone Mode
---------------
1. Define your desired state as goal/global constraint in SFP language into a file.

2. Assume you defined your goal/global constraint in file "local.sfp", then to apply the configuration, invoke command:

		$ sudo ./bin/nuri-client apply local.sfp

   Nuri will generate a plan for you. To execute the plan, just type "Y" in the console.



Managing Multiple Nodes
-----------------------
### Running Nuri client on managed node

1. Create Nuri client's configuration file 'etc/nuri.sfp'. You could copy from
   the template file 'etc/nuri-template.sfp'.

2. Specify the domain-name of master node in file 'etc/nuri.sfp'

		nuri {
			...
			trusted is ("master.domain.com")
			...
		}

	You must put all client nodes' domain in trusted set if you want a node to share its states with other nodes. This may require by some components, e.g. TikiWiki component.

3. Start client daemon:

		$ sudo ./bin/nuri-client start

   To check whether the daemon has run, access the following URL with curl:
   
   		$ curl http://localhost:1313/state
   		
   If you get an error, you may need to reconfigure your firewall to open port 1313. 

4. To stop the Nuri client daemon:

		$ sudo ./bin/nuri-client stop


### Controlling Nuri clients from master node

1. Create main specification file *etc/main.sfp*. The following example specifies configuration of two client nodes i.e. *host1* and *host2* where both runs apache service.

		system {
		  host1 isa Machine {
		    address is "host1.domain.com"
		  }
		  hpvm12 isa Machine {
		    address is "host2.domain.com"
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

		$ ./bin/nuri-master pull

3. Generate a workflow to implement the desired state

		$ ./bin/nuri-master plan

   You could execute the (generated) plan by type "y" and <enter>.

4. Achieving the goal and global constraints specified in *etc/main.sfp* of master node by automatically generating and executing a workflow. The workflow execution is scheduled centrally by master node where each step sends a command to target client node. See *Distributed Execution* if you want to use distributed approach.

		$ ./bin/nuri-master apply


### Distributed Execution

In this approach, the goal and the global constraints are achieved by generating the workflow by master node. Then, the workflow is splitted-up and distributed to the clients where each client will receive only related parts. To start the execution, master node will send activation commands to all clients. This will enable the clients to execution their parts independently and cooperate each other whenever some dependencies between the actions exist. The communication between clients does not depend on master node.

This approach can be used using command:

	$ ./bin/nuri-master bsig


Documentation
-------------
Required Gems
- yard
- redcarpet

To build:

    $ cd doc
    $ ./build.sh

SFP Language
------------
- primitive types: Boolean, String, Integer
- non-primitive type: any user-defined Schema
- abstract data-structure: Array (1-dimension), and Set
- example of configuration task:
	https://github.com/herry13/nuri/tree/master/test/planning/
- more information about SFP can be found in:
	https://github.com/herry13/nuri/wiki/SFP-language

**Schema**
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

	// type quantification
	forall (MyType as x) {  // apply for all objects of MyType
		x.attribute = y
	}


License
-------

BSD License:
	https://raw.github.com/herry13/nuri/master/LICENSE
