How to use HPCloud module
=========================

Require Packages
----------------
- libxml2-dev
- libxslt-dev

Install HPCloud hpfog library
-----------------------------
	$ curl -sL https://docs.hpcloud.com/file/hpfog-0.0.18.gem > hpfog-0.0.18.gem
	$ gem install hpfog-0.0.18.gem

Configuring
-----------
1. Rename "config-template.sfp" to "config.sfp"
2. Replace "ssh_private_key-template.pem" with your own SSH private
   key. The module will use this key for installing Nuri through
   SSH remote command
3. Edit "config.sfp" using any text editor
	- set the value of attribute "master" with the address of Nuri
     master node which will be trusted by Nuri client
	- put the information of your HPCloud account i.e. "description"
	  "account_id", "auth_uri", "tenant_id", "zone", and
	  "secret_key"
	- set the default flavor and image IDs which will be used for
	  creating a VM ("default_flavor_id" and "default_image_id")
	- set the key-name of your SSH private key in "default_key_name"
     e.g. if you have a key-name "default" in your HPCloud account,
	- use this key-name as the filename of your private key
	  e.g. "default.pem"
