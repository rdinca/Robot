require './board.rb'
require 'rubygems'
require 'rspec'

describe Board do
	it "should maintain limits" do
		Board.new(0,0,4,4)
		expect(Board.contains(5,6)).to be false
		expect(Board.contains(2,2)).to be true
	end

end
