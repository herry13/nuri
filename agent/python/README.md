Nuri Agent
==========

Nuri agent implementation in Python

##Still Under Development


##Requirements

- Python >= 2.4
- Tornado
- PyYAML

##Default Configuration

- `home`: `~/.nuri-agent`


##Implemented HTTP Methods

- `GET`

	- `/model`: get desired state model
	- `/log`: get log file
	- `/modules`: get MD5 hash of one or all of modules
	- `/state`: get agent's state
	- `/agents`
	
- `POST`

	- `/execute`

- `PUT`

	- `/model`: set desired state model
	- `/agents`

- `DELETE`

	- `/model`: delete desired state model
	- `/modules`: delete one or all modules
	- `/agents`

###Not yet implemented HTTP methods

- `GET`: `/bsig`
- `PUT`: `/bsig`
- `DELETE`: `/bsig`
