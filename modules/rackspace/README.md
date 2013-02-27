Requirements
------------
- ruby (>= 1.9)
- ruby gems
	- fog (>= 1.9)
	- sshkey (>= 1.4)

Configuring
-----------
1) Install the required ruby gems

	$ sudo gem install fog sshkey

2) Copy file "config-template.sfp" to "config.sfp"

3) Put your Rackspace account information in file "config.sfp".
   Account info: username, API key, authentication URL, and
                 endpoint URL.

4) Generate a pair of RSA Key and put then in your
   "~/.ssh/" directory.

5) Put the name of the key in "config.sfp" so that the module
   can assign and use the key to login to a VM.

6) Specify your master node address in "config.sfp"
