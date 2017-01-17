module Toddo
	class Task
		STARTING_ORDER = 1
		TRAILING_CHARS = ['.', ' ']

		def initialize(content, order = nil)
			@order = order
			@content = content
		end

		def order
			reorder(@order)
		end

		def content
			unify(@content)
		end

		def to_s
			return content if reorder(@order).nil?
			format('%{order}. %{content}', order: order, content: content)
		end

		def reorder(order)
			return [unify(order).to_i, STARTING_ORDER].max if sortable?(@order)
		end

		def sortable?(order)
			unify(order) =~ /^-?\d+$/
		end

		def unify(target)
			target.to_s.tr(TRAILING_CHARS.join, '').capitalize
		end

		private :reorder, :sortable?, :unify
		private_constant :STARTING_ORDER, :TRAILING_CHARS
	end
end
