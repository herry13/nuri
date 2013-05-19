require 'thread'

module Nuri

module BSig

class Executor

	def initialize(p={})
		@owner = owner     # holds the Nuri::Client object
		@local_mutex = Mutex.new
	end
	
	def achieve_local_goal(p={})
		# p[:bsig_id]
		# p[:goal]
		# p[:operators]
		# p[:min_op_id]

		p[:flaws] = self.get_flaws(p)
		return :no_flaw if flaws.empty?

		@local_mutex.synchronize {
			operator = self.select_operator(p)
			return :failure if operator.nil?

			return :on_going if operator.selected?
			operator.selected = true
		}

		local, remote = self.split_preconditions(operator)

		status = nil
		begin
			status = self.achieve_local_goal({
				:bsig_id => p[:bsig_id],
				:goal => local,
				:operators => p[:operators],
				:min_op_id => operator.pi + 1
			})
			sleep 1 if status == :on_going
		end until status == :no_flaw or status == :failure

		@local_mutex { operator.selected = false if status == :failure }
		return :failure if status == :failure

		status = self.achieve_remote_goal({
			:bsig_id => p[:bsig_id],
			:goal => remote,
			:min_op_id => operator.pi + 1
		})
		@local_mutex { operator.selected = false if status == :failure }
		return :failure if status == :failure

		status = self.invoke(operator)
		@local_mutex { operator.selected = false if status == :failure }
		return :failure if status == :failure

		@local_mutex { operator.selected = false }
		return :flaw_repaired
	end

	def invoke(operator)
		return :failure if not @owner.execute(operator)
		:success
	end

	def achieve_remote_goal(p={})
		# TODO
	end

	def select_operator(p={})
		# TODO
	end

	def split_preconditions(p={})
		# TODO
	end

	def get_flaws(p={})
		flaws = {}
		p[:goal].each { |path,value|
			flaws[path] = value if value != @owner.get_state(path)
		}
		flaws
	end

end

end

end
