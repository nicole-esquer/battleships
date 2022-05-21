require './lib/board'
require './lib/cell'
require './lib/ship'

RSpec.describe Board do
  before (:each) do
    @board = Board.new
    @cruiser = Ship.new('Cruiser', 3)
    @submarine = Ship.new('Submarine', 2)
  end

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

  it "validates coords that are true" do
    expect(@board.valid_coordinate?("A1")).to eq(true)
    expect(@board.valid_coordinate?("D4")).to eq(true)
  end

  it "validates coords that are false" do
    expect(@board.valid_coordinate?("A5")).to eq(false)
    expect(@board.valid_coordinate?("E1")).to eq(false)
    expect(@board.valid_coordinate?("A22")).to eq(false)
  end

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

  describe "placing the ship" do
    before (:each) do
      @board = Board.new
      @cruiser = Ship.new('Cruiser', 3)
      @submarine = Ship.new('Submarine', 2)
      @board.place(@cruiser, ["A1", "A2", "A3"])
    end

    xit "places the ship" do
      @cell_1 = board.cells
      @cell_2 = board.cells
      @cell_3 = board.cells

      @cell_1.ship
      @cell_2.ship
      @cell_3.ship

      expect(@cell_3.ship == @cell_2.ship).to eq(true)
    end

    xit "cannot allow ships to overlap" do
      expect(@board.valid_placement?(@submarine, ["A1", "B2"])).to eq(false)
    end

    describe "Rendering the Board" do
      before(:each) do
        @board = Board.new
        @cruiser = Ship.new('Cruiser', 3)
        @board.place(@cruiser, ["A1", "A2", "A3"])
      end

      xit 'renders a board' do
        expect(@board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
        expect(@board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
      end


    end
  end
end
