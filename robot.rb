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
		@facing = LEFT[@facing] unless unplaced_robot			
	end

	def right
		@facing = RIGHT[@facing] unless unplaced_robot
	end

	def move
		if !unplaced_robot
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
	end

	def place(x, y, facing)
		if Board.contains(x,y) 
			@x = x
			@y = y
			@facing = facing
		end
	end

	def report
		puts "#{@x},#{@y},#{@facing}" unless unplaced_robot
	end

private
	def unplaced_robot
		@x.nil? || @y.nil? || @facing.nil?
	end

end



 

