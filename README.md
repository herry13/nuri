Nuri
====
author: Herry (herry13@gmail.com)
 
Dynamic Workflow Configuration Tool.

Important files:
- <HOME>/etc/nuri.sfp -- Nuri service configuration file.
- <HOME>/etc/main.sfp -- Main specification file to be deployed.
- <HOME>/etc/bsig.sfp -- Specification of Behavioural Signature model.

Ubuntu
------
Required Packages
- ruby (>= 1.8.7)
- rubygems
- libz-dev
- libaugeas-ruby

Required Ruby Gems
- mongrel
- json
- antlr3

Scientific Linux
----------------
Required Packages
- ruby (>= 1.8.7)
- rubygems
- zlib-devel
- augeas-devel

Required Ruby Gems
- mongrel
- json
- antlr3
- ruby-augeas

Documentation
-------------
Required Gems
- yard
- redcarpet

To build:

    $ cd doc
    $ ./build.sh

Issues
------
- In Ubuntu 12.04, antlr3(1.8.12) conflicts with libxml-ruby(2.3.3). Each time SFPParser parses a file, it always generates 'segmentation fault'. This issue is not arised when libxml-ruby not being used.

SFp Language
------------
Procedure:
- support cost-value
- support the following mutation statements

	x = y
	x = null

Support the following constraint statements (either in procedure's conditions, goal, or global constraint):

	x = y
	x = null
	x != y
	x != null
	if x1 = y1 then x2 = y2
	if x1 != y2 then x2 != y2
	x is in (y1, y2, y3)
	x isnt in (y1, y2, y3)
