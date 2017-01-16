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
				.reject { |attribute| attribute.nil? }
				.join(' ')
		end

		def attribute(name, value)
			if name && value
				format('%{name}="%{value}"', name: name, value: value)
			end
		end

		private :attribute, :attributes
	end
end
