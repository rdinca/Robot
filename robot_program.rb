require './robot.rb'

class String
	def downcase_command
		ary = self.split(" ")
		ary[0].downcase!
		ary.join(" ")
	end
end


class RobotProgram

	def initialize
		@valid_place = false
		@robot = Robot.new
		Board.new(0,0,4,4)
	end

	def process_commands(filename)
		
		File.foreach(filename) do |line|
			line.chomp!
			if after_valid_place(line)
				if Robot.valid_command(line)
					@robot.instance_eval line.downcase_command
				end
			end
		end
	end

private

	def after_valid_place(command)
		return @valid_place || (@valid_place = command =~ /PLACE [#{Board.class_variable_get("@@x_low_limit")}-#{Board.class_variable_get("@@x_high_limit")}],[#{Board.class_variable_get("@@y_low_limit")}-#{Board.class_variable_get("@@y_high_limit")}],(NORTH|EAST|WEST|SOUTH)/ ? true : false)
	end

end 
