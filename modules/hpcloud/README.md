HPCloud module
--------------

Required Ruby Gems:
- fog
- json

To use:
- Copy your VM's SSH private key to filename 'hpcloud.pem'.
- Edit file 'config.yml' by filling in
	- access_key
	- secret_key
	- tenant_id
  Those information can be found in your HPCloud account (menu API Keys of HPCloud console).
- Set 'key_name' value.
- Replace any necessary default values of HPCloud's attributes such as zone, image_id, flavour_id, etc.
