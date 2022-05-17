require 'rspec'
require './lib/ship'

RSpec.describe Ship do
  before :each do
    @ship = Ship.new("cruiser", 3)
  end

  it "exists" do
    expect(@ship).to be_a Ship
  end

  it "has a name" do
    expect(@ship.name).to eq "cruiser"
  end

  it "has a length"  do
    expect(@ship.length).to eq 3
  end

  it "has beginning health equal to length" do
    expect(@ship.health).to eq 3
  end

  it "loses health when hit is run" do
    @ship.hit
    expect(@ship.health).to eq 2
  end
end
