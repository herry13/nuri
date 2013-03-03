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
   The account information that need to be specified: username,
   API key, authentication URL, and endpoint URL.

4) Generate a pair of RSA private and public key and put them
   in your "~/.ssh/" directory. The key usually has name "id_rsa",
   but you could use another name. This key will be assigned to
   account "root" of your VM. You can use this key to login using
   SSH to your VM later.

5) Put the name of the key in "config.sfp" so that the module
   can assign and use the key to send remote shell command to
   a new VM.
   e.g.: if your RSA key's name is "id_rsa", then

	config {
	   ...
	   default_key_name = "id_rsa"
	   ...
	}

6) Specify your "master" node address in "config.sfp"
