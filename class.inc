class Cloud {
	name       ""
	is_private true
}

class Machine {
   name       ""
   running    false
   ipAddress  ""
   action start {
      precondition { }
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

class VM extends Machine {
	on         as *Cloud
	hasService as *Service
	action stop {
		precondition {
			$this.hasService.running false
		}
		postcondition {
			$this.running false
		}
	}
}

class Service {
   name    ""
   running false
   on      as *Machine
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

class Client extends Machine {
   refer as *Service
   action changeReference(s as *Service) {
      precondition {
         $this.running true
      }
      postcondition {
         $this.refer $s
	$pc.x5 += 3
	$pc.x6 -= 3
	$pc.x7 /= 3
	$pc.x8 *= 3

      }
   }
}
