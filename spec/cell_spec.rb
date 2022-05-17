require './lib/cell'
require './lib/ship'

RSpec.describe Cell do
  before :each do
    @cell = Cell.new("B4")
    @ship = Ship.new("cruiser", 3)

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


end
