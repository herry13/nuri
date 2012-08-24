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
- libxml2-dev
- libaugeas-ruby

Required Ruby Gems
- mongrel
- json
- libxml-ruby
- antlr3

Scientific Linux
----------------
Required Packages
- ruby (>= 1.8.7)
- rubygems
- zlib-devel
- libxml2-devel
- augeas-devel

Required Ruby Gems
- mongrel
- json
- libxml-ruby
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
