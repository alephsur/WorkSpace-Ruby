def hello(name)
	return "Hello, " + name
end

def starts_with_consonant?(s)
	if s.length >0 
		if /[aeiouAEIOU]/.match(s[0]) != nil
			return false
		elsif /[a-zA-Z]/.match(s[0]) != nil
			return true
		else
			return false
		end
	else
		return false
	end
end

def binary_multiple_of_4?(s)
	if s.length > 0 
		if /[[:alpha:]]/.match(s) != nil
			return false
		elsif /[23456789]/.match(s) != nil 
			return false
		else
			if s.to_i(2)%4 ==0
				return true
			else
				return false
			end
		end		
	else
		return false
	end
end