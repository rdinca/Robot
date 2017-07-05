require './robot_program.rb'
require 'rubygems'
require 'rspec'

describe RobotProgram do

	it "should return false before a valid place, and true after" do
		rp = RobotProgram.new
		expect(rp.send(:after_valid_place, "LEFT")).to be false
		expect(rp.send(:after_valid_place, "PLACE 2,2,NORTH")).to be true
		expect(rp.send(:after_valid_place, "LEFT")).to be true
	end


	it "should output the correct report" do
		rp = RobotProgram.new
		expect { rp.process_commands("example.robot") }.to output("3,3,NORTH").to_stdout
	end

end
