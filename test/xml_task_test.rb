require 'test_helper'
require 'toddo/xml_task'

class XmlTaskTest < Minitest::Test
	def test_including_order
		assert_equal(
			'<task order="1" content="Refactor"/>',
			Toddo::XmlTask.new('Refactor', 1).to_s
		)
	end

	def test_without_order
		assert_equal(
			'<task content="Refactor"/>',
			Toddo::XmlTask.new('Refactor').to_s
		)
	end
end
