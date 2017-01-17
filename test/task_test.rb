require 'test_helper'
require 'toddo/task'

class TaskTest < Minitest::Test
	def test_printing_not_completed_task
		assert_equal('1. Refactor', Toddo::Task.new('Refactor', 1).to_s)
	end

	def test_printing_completed_task
		assert_equal('Refactor', Toddo::Task.new('Refactor').to_s)
	end

	def test_removing_trailing_spaces
		assert_equal('1. Indent', Toddo::Task.new('Indent', ' 1 ').to_s)
		assert_equal('1. Indent', Toddo::Task.new('  Indent  ', '1').to_s)
	end

	def test_removing_dots
		assert_equal('1. Indent', Toddo::Task.new('Indent.', '1').to_s)
		assert_equal('1. Indent', Toddo::Task.new('.Indent', '1').to_s)
	end

	def test_natural_ordering
		assert_equal('1. Indent', Toddo::Task.new('Indent', 0).to_s)
		assert_equal('1. Indent', Toddo::Task.new('Indent', -1).to_s)
		assert_equal('10. Indent', Toddo::Task.new('Indent', 10).to_s)
	end
end
