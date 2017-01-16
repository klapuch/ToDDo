module Toddo
	class IncompleteTask
		STARTING_ORDER = 1

		def initialize(order, task)
			@order = order
			@task = task
		end

		def to_s
			format('%{order}. %{task}', order: reorder(@order), task: @task)
		end

		def reorder(order)
			return [unify(order).to_i, STARTING_ORDER].max if sortable?(@order)
			raise Exception, 'Order must be numeric'
		end

		def sortable?(order)
			unify(order) =~ /^-?\d+$/
		end

		def unify(target)
			target.to_s.strip
		end

		private :reorder, :sortable?, :unify
		private_constant :STARTING_ORDER
	end
end
