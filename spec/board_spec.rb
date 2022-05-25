require './lib/board'
require './lib/cell'
require './lib/ship'

RSpec.describe Board do
  before (:each) do
    @board = Board.new
    @cruiser = Ship.new('Cruiser', 3)
    @submarine = Ship.new('Submarine', 2)
  end

  describe "#initialize" do
    it "exists" do
      expect(@board).to be_a(Board)
    end

    it "initializes a 4x4 board (16 cells)" do
      expect(@board.cells.count).to eq 16
    end

    it "initializes a hash" do
      expect(@board.cells).to be_a Hash
    end

    it "initializes a hash of Cell objects" do
      expect(@board.cells.values[0]).to be_a Cell
    end
  end

  describe "#valid_coordinate?" do
    it "validates coords that are true" do
      expect(@board.valid_coordinate?("A1")).to eq(true)
      expect(@board.valid_coordinate?("D4")).to eq(true)
    end

    it "validates coords that are false" do
      expect(@board.valid_coordinate?("A5")).to eq(false)
      expect(@board.valid_coordinate?("E1")).to eq(false)
      expect(@board.valid_coordinate?("A22")).to eq(false)
    end
  end

  describe "#valid_placement?" do
    it "has coords that equal length of ship" do
        expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
        expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
    end

    it "has coords that are consecutive" do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to eq(false)
      expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to eq(false)
    end

    it "has coords that aren't diagnol" do
      expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to eq(false)
    end

    it "has ships with valid placements" do
      expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to eq(true)
      expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to eq(true)
    end
  end

  describe "#is_horizontal?" do
    it "returns true if a set of cells is horizontal" do
      cruiser_coordinates = ["A1", "A2", "A3"]
      expect(@board.is_horizontal?(cruiser_coordinates)).to be true
    end

    it "returns false if a set of cells is not horizontal" do
      cruiser_coordinates = ["A1", "B1", "C1"]
      expect(@board.is_horizontal?(cruiser_coordinates)).to be false
    end
  end

  describe "#place" do
    before (:each) do
      @cell_1 = @board.cells["A1"]
      @cell_2 = @board.cells["A2"]
      @cell_3 = @board.cells["A3"]
      @board.place(@cruiser, [@cell_1, @cell_2, @cell_3])
    end

    it "places the ship" do
      expect(@cell_3.ship == @cell_2.ship).to eq(true)
    end

    it "cannot allow ships to overlap" do
      expect(@board.valid_placement?(@submarine, ["A1", "B2"])).to eq(false)
    end
  end


  describe "Rendering the Board" do
    before(:each) do
      @board.place(@cruiser, ["A1", "A2", "A3"])
    end

    it 'renders a board' do
      expect(@board.render).to eq(
      "  1 2 3 4 \n" +
      "A . . . . \n" +
      "B . . . . \n" +
      "C . . . . \n" +
      "D . . . . \n")
      expect(@board.render(true)).to eq(
      "  1 2 3 4 \n" +
      "A S S S . \n" +
      "B . . . . \n" +
      "C . . . . \n" +
      "D . . . . \n")
    end
  end

  describe "get_valid_coordinates" do
    it "can get valid coordinates for a computer board" do
    computer_coordinates = @board.get_valid_coordinates(@cruiser)
    expect(@board.valid_placement?(@cruiser, computer_coordinates)).to eq true
    end
  end
end
