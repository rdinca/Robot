require './robot.rb'
require 'rubygems'
require 'rspec'

describe Robot do
	context "basic movements" do
		before :each do
			@robot = Robot.new
			@robot.instance_variable_set("@x" , 0) 			
			@robot.instance_variable_set("@y" , 0) 
			@robot.instance_variable_set("@facing" , "NORTH") 
		end

		it "should turn left correctly" do
			@robot.left
			expect(@robot.instance_variable_get("@facing")).to eq("WEST")
		end

		it "should turn right correctly" do
			@robot.right
			expect(@robot.instance_variable_get("@facing")).to eq("EAST")
		end

		it "should move north (according to the setup)" do
			@robot.move
			expect(@robot.instance_variable_get("@y")).to eq(1)
		end

	end

	it "should place the robot in the right spot and report the position" do
		@robot = Robot.new
		@robot.place(2,3,"EAST")
		expect(@robot.instance_variable_get("@x")).to eq(2)
		expect(@robot.instance_variable_get("@y")).to eq(3)
		expect(@robot.instance_variable_get("@facing")).to eq("EAST")
		expect { @robot.report }.to output("2,3,EAST\n").to_stdout
	end

	it "should return true, when robot is not placed on the board, and false otherwise" do
		@robot = Robot.new
		expect(@robot.send(:unplaced_robot)).to eq(true)

		expect(@robot.send(:unplaced_robot)).to eq(false)

	end

end


