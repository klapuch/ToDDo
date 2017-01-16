module Toddo
	class CompleteTask
		TRAILING_CHARS = ['.', ' ']

		def initialize(text)
			@text = text
		end

		def to_s
			unify(@text)
		end

		def unify(target)
			target.to_s.tr(TRAILING_CHARS.join, '').capitalize
		end

		private :unify
		private_constant :TRAILING_CHARS
	end
end
