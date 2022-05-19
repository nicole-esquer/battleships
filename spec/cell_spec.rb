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

end
