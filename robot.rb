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
		case @facing
			when NORTH
				@y += 1 if between_limits(@x, @y + 1)
			when SOUTH
				@y += -1 if between_limits(@x, @y - 1)	
			when EAST
				@x += 1	if between_limits(@x + 1, @y)
			when WEST
				@x += -1 if between_limits(@x - 1, @y)
		end		
	end

	def place(x, y, facing)
		if between_limits(x,y) 
			@x = x
			@y = y
			@facing = facing
		end
	end

	def report
		puts @x, @y, @facing unless unplaced_robot
	end


	def self.valid_command(command)
		return true if (["LEFT", "RIGHT", "MOVE", "REPORT"].include?(command) || command =~ /PLACE \d,\d,(NORTH|EAST|WEST|SOUTH)/)
		false
	end

private
	def unplaced_robot
		@x.nil? || @y.nil? || @facing.nil?
	end

	def between_limits(x,y)
		x >= 0 && y >= 0 && x < 5 && y < 5
	end
end


class String
	def downcase_command
		ary = self.split(" ")
		ary[0].downcase!
		ary.join(" ")
	end
end
 
robot = Robot.new
File.foreach( 'example3.robot' ) do |line|
	line.chomp!
	begin
		puts line
		if Robot.valid_command(line)
			robot.instance_eval line.downcase_command
		else
			puts "Invalid command!"
		end
	rescue
		puts "Reached unreachable code.. something must be wrong!\n"
	end
end