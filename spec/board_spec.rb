require 'rspec'
require './lib/board'
require './lib/cell'
require './lib/ship'

RSpec.describe Board do
  before do
    @board = Board.new
    @cell = Cell.new("B4")
    @ship = Ship.new("Cruiser", 3)
  end

  describe "#initialize" do
    it "is a Board" do
      expect(@board).to be_a Board
    end

    it "creates a hash of cells" do
      expect(@board.cells).to be_a Hash
    end

  end
end
