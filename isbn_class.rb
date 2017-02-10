class ISBN

	ISBN10_REGEX = /\d{9}[\d|X]$/i 
	ISBN13_REGEX = /\d{13}/i

	def initialize(isbn)

		@isbn = isbn.delete(" -")
		@type = nil
	end

	def valid_checksum10?

		isbn = @isbn; sum = 0; checksum = isbn[-1]; isbn.chop!
		checksum = (checksum.upcase == 'X') ? 10 : checksum.to_i

		isbn.each_char.with_index {|number, index| sum += number.to_i * (index + 1)}

		(sum % 11) == checksum
	end

	def valid_checksum13?

		isbn = @isbn; sum = 0; checksum = isbn[-1].to_i; isbn.chop!

		isbn.each_char.with_index do |number, index|
			
			multiplier = (index % 2 == 0) ? 1 : 3
			sum += number.to_i * multiplier
		end

		((10 - (sum % 10)) % 10) == checksum
	end

	def set_isbn(isbn)

		@isbn = isbn
	end

	def get_checksum

		@isbn[-1]
	end

	def get_type

		length = @isbn.length

		case length

			when 10 then if @isbn.match(ISBN10_REGEX) then @type = "10" end
			when 13 then if @isbn.match(ISBN13_REGEX) then @type = "13" end
		end

		@type
	end

	def to_s

		print "#{@isbn}"
	end
end

def is_valid_ISBN?(num)

	isbn = ISBN.new(num)
	type = isbn.get_type

	case type

		when "10" then isbn.valid_checksum10?
		when "13" then isbn.valid_checksum13?
		when nil then false
	end
end