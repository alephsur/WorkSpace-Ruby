def sum(array)
	if array.empty? 
		return 0
	end
	return array.length
end


def max_2_sum(array)
	if array.empty?
		return 0 
	elsif array.length == 1
		return array[0]
	else
		array.sort!
		array.reverse!
		return array[0]+array[1]
	end
end

def sum_to_n?(array,n)
	if array.empty?
		return  false
	elsif array.length == 1
		return false
	else
		array.each do |x|
			array.each do |y|
				if x != y 
					if (x + y) == n
						return true
					end
				end
			end
		end
	end
	return false
end

