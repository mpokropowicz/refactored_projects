def nums_one_away(num1, array)

	result = []
	array.each {|num2| if num2.delete(num1).length == 1 then result << num2 end}
	result
end