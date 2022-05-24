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




end
