require 'test_helper'
require 'toddo/incomplete_task'

class IncompleteTaskTest < Minitest::Test
	def test_printing_not_completed_task
		assert_equal('1. Refactor', Toddo::IncompleteTask.new(1, 'Refactor').to_s)
	end

	def test_throwing_on_not_specified_order
		exception = assert_raises Exception do
			Toddo::IncompleteTask.new('', 'Refactor').to_s
		end
		assert_equal(exception.to_s, 'Order must be numeric')
	end

	def test_removing_trailing_spaces_from_order
		assert_equal('1. Indent', Toddo::IncompleteTask.new(' 1 ', 'Indent').to_s)
	end

	def test_throwing_on_not_numeric_order
		exception = assert_raises Exception do
			Toddo::IncompleteTask.new('foo', 'Refactor').to_s
		end
		assert_equal(exception.to_s, 'Order must be numeric')
	end

	def test_natural_ordering
		assert_equal('1. Indent', Toddo::IncompleteTask.new(0, 'Indent').to_s)
		assert_equal('1. Indent', Toddo::IncompleteTask.new(-1, 'Indent').to_s)
		assert_equal('10. Indent', Toddo::IncompleteTask.new(10, 'Indent').to_s)
	end
end
