class BookInStock
	attr_accessor :isbn, :price



	def initialize(isbn,price)
		if isbn.length == 0 
			raise ArgumentError,"isbn is empty"
		end
		if price <= 0 
			raise ArgumentError,"price is less or equal to zero" 
		end

		@isbn = isbn
		@price = price
	end

	def price_as_string
		return "$" + '%.2f'%[(@price*100).round(2)/100]
	end
end
