require './board.rb'

class Robot


	NORTH = "NORTH"
	SOUTH = "SOUTH"
	EAST  = "EAST"
	WEST  = "WEST"	

	LEFT = 
	{
		NORTH => WEST,
		WEST => SOUTH,
		SOUTH => EAST,
		EAST => NORTH
	}

	RIGHT = 
	{
		NORTH => EAST,
		EAST => SOUTH,
		SOUTH => WEST,
		WEST => NORTH
	}

	def initialize
		@x = nil
		@y = nil
		@facing = nil
	end

	def left
		@facing = LEFT[@facing]
	end

	def right
		@facing = RIGHT[@facing]
	end

	def move
		case @facing
			when NORTH
				@y += 1 if Board.contains(@x, @y + 1)
			when SOUTH
				@y += -1 if Board.contains(@x, @y - 1)	
			when EAST
				@x += 1	if Board.contains(@x + 1, @y)
			when WEST
				@x += -1 if Board.contains(@x - 1, @y)
		end
	end

	def place(x, y, facing)
		if Board.contains(x,y) 
			@x = x
			@y = y
			@facing = facing
		end
	end

	def report
		printf "#{@x},#{@y},#{@facing}"
	end

end



 

