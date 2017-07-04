require './robot_program.rb'
require 'rubygems'
require 'rspec'

describe RobotProgram do

	it "should return false before a valid place, and true after" do
		rp = RobotProgram.new
		expect(rp.send(:after_valid_place, "LEFT")).to eq(false)
		expect(rp.send(:after_valid_place, "PLACE 2,2,NORTH")).to eq(true)
		expect(rp.send(:after_valid_place, "LEFT")).to eq(true)
	end

	it "should return true in case of a valid command and false otherwise" do
		rp = RobotProgram.new
		expect(rp.send(:valid_command, "LEFT")).to eq(true)
		expect(rp.send(:valid_command, "left")).to eq(false)
	end

end
