require './lib/cell'
require './lib/ship'

RSpec.describe Cell do
  before do
    @cell = Cell.new("B4")
    @ship = Ship.new("Cruiser", 3)
  end

  it "exists" do
    expect(@cell).to be_a(Cell)
  end

  it "has a coordinate" do
    expect(@cell.coordinate).to eq("B4")
  end

  it "returns nil when ship is called" do
    expect(@cell.ship).to eq(nil)
  end

  it "is empty? is true" do
    expect(@cell.empty?).to eq(true)
  end

  describe "place_ship" do
    it "places the ship" do
      @cell.place_ship(@ship)
      expect(@cell.ship).to be_a(Ship)
      expect(@cell.ship).to eq(@ship)
    end
  end

  describe "fired_upon" do
    it "returns false if fired_upon?" do
      expect(@cell.fired_upon?).to eq(false)
    end

    it "can be fired_upon" do
      @cell.fire_upon
     expect(@cell.fired_upon?).to eq(true)
    end
  end

  describe "render" do
    it 'returns "S" if show_ship = true and is not empty and is fired upon' do
      @cell.place_ship(@ship)
      expect(@cell.render(true)).to eq("S")
    end

    it 'returns "." if show_ship is false and is empty and not fired upon' do
      expect(@cell.render).to eq(".")
    end

    it 'returns "M" if empty and is fired upon and show ship is false' do
      @cell.fire_upon
      expect(@cell.render).to eq("M")
    end

    it 'returns "X" if not empty? and is fired upon and show ship is false' do
      @cell.place_ship(@ship)
      3.times do
        @cell.fire_upon
      end
      expect(@cell.render).to eq("X")
    end

    it 'returns "H" if not empty? and is fired upon and show ship is false' do
      @cell.place_ship(@ship)
      @cell.fire_upon
      expect(@cell.render).to eq("H")
    end
  end

end
