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
	end

	def process_commands(filename)

		File.foreach(filename) do |line|
			line.chomp!
			puts line
			if after_valid_place(line)
				if valid_command(line)
					@robot.instance_eval line.downcase_command
				else
					puts "Invalid command!"
				end
			end
		end
	end

private

	def after_valid_place(command)
		return @valid_place || (@valid_place = command =~ /PLACE [0-4],[0-4],(NORTH|EAST|WEST|SOUTH)/ ? true : false)
	end

	def valid_command(command)
		return true if (["LEFT", "RIGHT", "MOVE", "REPORT"].include?(command) || command =~ /PLACE \d,\d,(NORTH|EAST|WEST|SOUTH)/)
		false
	end

end 
