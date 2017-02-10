require "minitest/autorun"
require_relative "isbn_class.rb"

class TestISBN < Minitest::Test 

	def test_valid_type

		isbn = ISBN.new("877195869x")
		assert_equal("10", isbn.get_type)

		isbn.set_isbn("04 7-1-9 58 69-7")
		assert_equal("10", isbn.get_type)

		isbn.set_isbn("9780470059029")
		assert_equal("13", isbn.get_type)
	end
end