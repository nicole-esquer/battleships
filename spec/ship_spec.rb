require 'rspec'
require './lib/ship'

RSpec.describe Ship do
  before :each do
    @ship = Ship.new("cruiser", 3)
  end

  it "exists" do
    expect(@ship).to be_a Ship
  end


end
