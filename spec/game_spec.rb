require './lib/game'

RSpec.describe Game do
  before (:each) do
    @game = Game.new
    @board = Board.new
    @player_board = Board.new
    @computer_board = Board.new
    @player_ships_count = 2
    @computer_ships_count = 2
  end

  it 'exists' do
    expect(@game).to be_instance_of(Game)
    expect(@player_board).to be_instance_of(Board)
    expect(@computer_board).to be_instance_of(Board)
  end

  it "attributes" do
    computer_cruiser = Ship.new('Cruiser', 3)
    computer_submarine = Ship.new('Submarine', 2)

    expect(computer_cruiser).to be_instance_of(Ship)
    expect(computer_submarine).to be_instance_of(Ship)
  end


end
