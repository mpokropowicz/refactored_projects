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

	def test_valid_checksums

		isbn = ISBN.new("877195869x")
		assert_equal(true, isbn.valid_checksum10?)

		isbn.set_isbn("0471958697")
		assert_equal(true, isbn.valid_checksum10?)

		isbn.set_isbn("9780470059029")
		assert_equal(true, isbn.valid_checksum13?)
	end

end