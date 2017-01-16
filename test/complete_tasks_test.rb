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

	def test_removing_edges
		assert_nothing_raised do
			Toddo::CompleteTasks.new(['foo', 'bar', 'baz', 'bur']).remove(4)
		end
		assert_nothing_raised do
			Toddo::CompleteTasks.new(['foo', 'bar', 'baz', 'bur']).remove(1)
		end
	end

	def test_throwin_on_removing_by_unknown_order
		overflow = assert_raises RangeError do
			Toddo::CompleteTasks.new(['foo', 'bar', 'baz', 'bur']).remove(5)
		end
		underflow = assert_raises RangeError do
			Toddo::CompleteTasks.new(['foo', 'bar', 'baz', 'bur']).remove(-1)
		end
		zero = assert_raises RangeError do
			Toddo::CompleteTasks.new(['foo', 'bar', 'baz', 'bur']).remove(0)
		end
		assert_equal('Order 5 does not exist', overflow.to_s)
		assert_equal('Order -1 does not exist', underflow.to_s)
		assert_equal('Order 0 does not exist', zero.to_s)
	end
end
