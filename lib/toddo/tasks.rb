module Toddo
	class Tasks
		def initialize(tasks = [])
			@tasks = tasks
		end

		def put(text)
			Tasks.new(@tasks << Task.new(text, @tasks.length + 1))
		end

		def remove(order)
			if order.between?(1, @tasks.length)
				@tasks.delete_at(order - 1)
				return Tasks.new(@tasks)
			end
			raise RangeError, format('Order %{order} does not exist', order: order)
		end

		def to_a
			@tasks
		end
	end
end
