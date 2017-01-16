require 'test_helper'
require 'toddo/complete_task'

class CompleteTaskTest < Minitest::Test
	def test_printing_completed_task
		assert_equal('Refactor', Toddo::CompleteTask.new('Refactor').to_s)
	end

	def test_upper_case_first_char
		assert_equal('Refactor', Toddo::CompleteTask.new('refactor').to_s)
	end

	def test_removing_trailing_spaces
		assert_equal('Indent', Toddo::CompleteTask.new(' Indent ').to_s)
	end

	def test_removing_trailing_dots
		assert_equal('Bla', Toddo::CompleteTask.new('Bla.').to_s)
		assert_equal('Bla', Toddo::CompleteTask.new('.Bla').to_s)
	end
end
