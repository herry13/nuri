//--- types ---//
class Cloud {
	name    ""
	running false
}

class VM {
	name    ""
	running false
	on      as *Cloud
	svc     as *Service
	
	action start {
		precondition {
			$this.on.running true
		}
		postcondition {
			$this.running true
		}
	}
	
	action stop {
		precondition {
			$this.svc.running false
		}
		postcondition {
			$this.running false
		}
	}

	action migrate (target as *Cloud) {
		precondition {
			$this.running false
		}
		postcondition {
			$this.on $target
		}
	}
}

class Service {
	name    ""
	running false
	on      as *VM
	
	action start {
		precondition {
			$this.on.running true
		}
		postcondition {
			$this.running true
		}
	}
	
	action stop {
		precondition { }
		postcondition {
			$this.running false
		}
	}
}

class AppService extends Service {
	web as *WebService

	action stop {
		precondition {
			$this.web.running false
		}
		postcondition {
			$this.running false
		}
	}
}

class WebService extends Service {
	app as *AppService

	action start {
		precondition {
			$this.on.running  true
			$this.app.running true
		}
		postcondition {
			$this.running true
		}
	}
}

class Client {
	refer as *WebService 

	action changeReference(s as *WebService) {
		precondition { }
		postcondition {
			$this.refer  $s
		}
	}
}
