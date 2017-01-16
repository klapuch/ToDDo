require 'test_helper'
require 'toddo/complete_tasks'

class CompleteTasksTest < Minitest::Test
	def test_incrementing_order
		tasks = Toddo::CompleteTasks.new()
			.put('Indent')
			.put('Refactor')
			.to_a
		assert_equal('1. Indent', tasks[0].to_s)
		assert_equal('2. Refactor', tasks[1].to_s)
	end

	def test_removing_by_known_order
		tasks = Toddo::CompleteTasks.new(['foo', 'bar', 'baz', 'bur'])
			.remove(2)
			.to_a
		assert_equal(3, tasks.length)
		assert_equal('foo', tasks[0])
		assert_equal('baz', tasks[1])
		assert_equal('bur', tasks[2])
	end

	def test_removing_in_natural_order
		assert_nothing_raised do
			Toddo::CompleteTasks.new(['foo', 'bar', 'baz', 'bur']).remove(4)
		end
		assert_nothing_raised do
			Toddo::CompleteTasks.new(['foo', 'bar', 'baz', 'bur']).remove(1)
		end
	end

	def test_throwing_on_removing_by_unnatural_order
		end_exception = assert_raises RangeError do
			Toddo::CompleteTasks.new(['foo', 'bar', 'baz', 'bur']).remove(-1)
		end
		zero_exception = assert_raises RangeError do
			Toddo::CompleteTasks.new(['foo', 'bar', 'baz', 'bur']).remove(0)
		end
		assert_equal('Order -1 does not exist', end_exception.to_s)
		assert_equal('Order 0 does not exist', zero_exception.to_s)
	end

	def test_throwing_on_removing_over_limit
		overflow_exception = assert_raises RangeError do
			Toddo::CompleteTasks.new(['foo', 'bar', 'baz', 'bur']).remove(5)
		end
		assert_equal('Order 5 does not exist', overflow_exception.to_s)
	end
end
