OpenStack module
----------------

Required Ruby Gems:
- fog
- json

To use:
- Assume that your key-name for SSH is `default`
- Copy your VM's SSH private key to filename `default.pem`
- Edit file `config.yml` by filling in
	- username
	- password
  Those information can be found in your OpenStack account under menu `Access`
- Set `key_name` value.
- Replace any necessary default values of HPCloud's attributes such as `auth_uri`, `vm_image`, `vm_flavour`, etc.
