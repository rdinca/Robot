class Board

	def initialize(x_low_limit, y_low_limit, x_high_limit, y_high_limit)
		@@x_low_limit = x_low_limit
		@@y_low_limit = y_low_limit
		@@x_high_limit = x_high_limit
		@@y_high_limit = x_high_limit	
	end

	def self.contains(x,y)
		x >= @@x_low_limit && y >= @@y_low_limit && x <= @@x_high_limit && y <= @@y_high_limit
	end

end
