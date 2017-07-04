require './board.rb'
require 'rubygems'
require 'rspec'

describe Board do
	it "should maintain limits" do
		expect(Board.contains(5,6)).to eq(false)
		expect(Board.contains(2,2)).to eq(true)
	end

end
