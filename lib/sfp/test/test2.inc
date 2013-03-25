class Service {
	installed is false
	running is false

	procedure install {
		conditions {
			this.installed is false
		}
		effects {
			this.installed is true
		}
	}
	procedure uninstall {
		conditions {
			this.installed is true
		}
		effects {
			this.installed is false
		}
	}

	procedure start {
		conditions {
			this.installed is true
			this.running is false
		}
		effects {
			this.running is true
		}
	}
	procedure stop {
		conditions {
			this.installed is true
			this.running is true
		}
		effects {
			this.running is false
		}
	}
}
