require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/computer'

class Game
  attr_reader :player_board, :computer_board

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
  end

  def main_menu
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    response = gets.chomp.downcase

    if response == "p"
      puts "Let's go!"
      gamestate
    elsif response == "q"
      puts "Bye!"
    else
      puts "I'm sorry, that's an invalid entry. Please try again."
      main_menu
    end
  end

  def place_computer_ships
    computer_cruiser = Ship.new('Cruiser', 3)
    computer_submarine = Ship.new('Submarine', 2)
    @computer_board.place(computer_cruiser, @computer_board.get_valid_coordinates(computer_cruiser))
        @computer_board.place(computer_submarine, @computer_board.get_valid_coordinates(computer_submarine))
  end


  def start
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The cruiser is three units long and the submarine is two units long."
    player_board_render = @player_board.render(true)
    puts player_board_render
  end

  def player_place_cruiser
    puts "Enter the coordinates to use for your cruiser (3 coordinates):"
    puts "Type them in this format: A1 A2 A3"
    player_cruiser_coords = gets.chomp.upcase.split
    if @player_board.valid_placement?(player_cruiser, player_cruiser_coords)
      @player_board.place(player_cruiser, player_cruiser_coords)
      @player_board.render(true)
      player_place_submarine
    else
      puts "Those coordinates are not valid. Please try again."
      player_place_submarine
    end
  end

  def player_place_submarine

  end

end

# game = Game.new
# game.main_menu
