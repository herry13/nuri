OpenStack module
----------------

Required Ruby Gems:
- fog
- json

To use:
- Assume that your key-name for SSH is `default`.
- Copy your VM's SSH private key to filename `default.pem` into this directory.
- Edit file `config.yml` by filling in fields:
	- `username` - the username of your account
	- `password` - the password of your account

  Those information can be found in your OpenStack account under menu `Access`.
- Set `key_name` value.
- Replace any necessary default values of HPCloud's attributes such as:
	- `auth_uri` - the URL of OpenStack's end point (append `/tokens`)
	- `vm_image` - the UUID of the VM's image
	- `vm_flavour` - the ID of the flavour
	- `vm_ssh_user` - the user that will be used by the module for SSH (`root`, `ubuntu`, or other)
	- `vm_ssh_key_name` - the SSH key name
	- `vm_security_group` - the security group that will be applied to your VM
	- `vm_network` - the network that will be connected to your VM
