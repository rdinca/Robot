class Board

	X_LOW_LIMIT	 = 0
	Y_LOW_LIMIT  = 0
	X_HIGH_LIMIT = 5
	Y_HIGH_LIMIT = 5

	def self.contains(x,y)
		x >= X_LOW_LIMIT && y >= Y_LOW_LIMIT && x < X_HIGH_LIMIT && y < Y_HIGH_LIMIT
	end

end
