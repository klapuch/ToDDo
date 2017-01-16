module Toddo
	class XmlTask
		def initialize(content, order = nil)
			@content = content
			@order = order
		end

		def to_s
			format('<task %{attributes}/>', attributes: attributes)
		end

		def attributes
			[attribute('order', @order), attribute('content', @content)]
				.reject(&:nil?)
				.join(' ')
		end

		def attribute(name, value)
			return format('%s="%s"', name, value) if name && value
		end

		private :attribute, :attributes
	end
end
