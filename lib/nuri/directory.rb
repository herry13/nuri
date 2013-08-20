require 'thread'

module Nuri::Master::Model
	@@mutex = Mutex.new
	@@model = {}

	def self.set(path, data)
		@@mutex.synchronize {
			parent_path, key = path.pop_ref
			if key.nil?
				@@model[parent_path] = data
			else
				parent = @@model.at?(parent_path)
				fail "#{parent_path} is invalid! - #{parent.class.name}" if !parent.is_a?(Hash)
				parent[key] = data
			end
		}
	end

	def self.get(path)
		data = nil
		@@mutex.synchronize {
			data = @@model.at?(path)
		}
		data
	end

	def self.delete(path)
		@@mutex.synchronize {
			parent_path, key = path.pop_ref if path.pop_ref
			if key.nil?
				@@model.delete(parent_path)
			else
				parent = @@model.at?(parent_path)
				fail "#{parent_path} is invalid! - #{parent.class.name}" if !parent.is_a?(Hash)
				parent.delete(key)
			end
		}
	end
end
