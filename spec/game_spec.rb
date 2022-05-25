require './lib/game'
require './lib/board'
require './lib/ship'
require './lib/cell'

RSpec.describe Game do
  before (:each) do
    @game = Game.new
  end

  it 'exists' do
    expect(@game).to be_instance_of(Game)
    expect(@game.player_board).to be_instance_of(Board)
    expect(@game.computer_board).to be_instance_of(Board)
  end

  it "attributes" do
    computer_cruiser = Ship.new('Cruiser', 3)
    computer_submarine = Ship.new('Submarine', 2)
    expect(computer_cruiser).to be_instance_of(Ship)
    expect(computer_submarine).to be_instance_of(Ship)
  end

  it "can render player and computer boards" do
    line_1 = "=============COMPUTER BOARD============="
    line_2 = @game.computer_board.render
    line_3 = "==============PLAYER BOARD=============="
    line_4 = @game.player_board.render(true)
    expect(@game.show_boards).to eq (line_1 + "\n" + line_2 + "\n" + line_3 + "\n" + line_4)
  end

end
