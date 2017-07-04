require './robot_program.rb'

rp = RobotProgram.new

puts "Load File:"
filename = gets
filename.chomp!
rp.process_commands(filename)
