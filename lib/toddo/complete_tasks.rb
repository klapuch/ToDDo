module Toddo
	class CompleteTasks
		def initialize(tasks = [])
			@tasks = tasks
		end

		def put(text)
			CompleteTasks.new(@tasks << IncompleteTask.new(@tasks.length + 1, text))
		end

		def remove(order)
			if exists?(order)
				@tasks.delete_at(order - 1)
				return CompleteTasks.new(@tasks)
			end
			raise RangeError, format('Order %{order} does not exist', order: order)
		end

		def exists?(order)
			order.between?(1, @tasks.length)
		end

		def to_a
			@tasks
		end
	end
end
