require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/computer'

class Game
  attr_reader :player_board, :computer_board

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @player_ships_count = 2
    @computer_ships_count = 2
  end

  def main_menu
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    response = gets.chomp.downcase

    if response == "p"
      puts "Let's go!"
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
    # Figure out a way for this to not spit out array of computer ships
  end


  def start
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The cruiser is three units long and the submarine is two units long."
    player_board_render = @player_board.render(true)
    puts player_board_render
    # Figure out a way for this to not spit out nil
  end

  def player_place_cruiser
    puts "Enter the coordinates to use for your cruiser (3 coordinates):"
    puts "Type them in this format: A1 A2 A3"
    player_cruiser = Ship.new('cruiser', 3)
    player_cruiser_coords = gets.chomp.upcase.split
    if @player_board.valid_placement?(player_cruiser, player_cruiser_coords)
      @player_board.place(player_cruiser, player_cruiser_coords)
      @player_board.render(true)
      player_place_submarine
    else
      puts "Those coordinates are not valid. Please try again."
      player_place_cruiser
    end
  end

  def player_place_submarine
    puts "Enter the coordinates to use for your submarine (2 coordinates):"
    puts "Type them in this format: A1 A2"
    player_submarine = Ship.new('submarine', 2)
    player_submarine_coords = gets.chomp.upcase.split
    if @player_board.valid_placement?(player_submarine, player_submarine_coords)
      @player_board.place(player_submarine, player_submarine_coords)
      @player_board.render(true)
    else
      puts "Those coordinates are not valid. Please try again."
      player_place_submarine
    end
  end

  def turn
    puts "=============COMPUTER BOARD============="
    puts @computer_board.render
    puts "==============PLAYER BOARD=============="
    puts @player_board.render(true)
    # Figure out how to not display a nil after this line

    player_turn = true
    computer_turn = false
    player_shot = ""

    #player does stuff until it shoots
    #after play shoots, player_turn = false, computer_turn = true
    while player_turn
      puts "Enter the coordinate for your shot:"
      player_shot = gets.chomp.upcase
      if !@computer_board.valid_coordinate?(player_shot)
        puts "That is not a valid coordinate. Please try again."
        player_turn
      elsif @computer_board.cells[player_shot].fired_upon?
        puts "That cells has already been shot at. Please try again."
        player_turn
      else
        @computer_board.cells[player_shot].fire_upon
        player_turn = false
        computer_turn = true
      end
    end

    while computer_turn
      #coordinate and has to be a string
      computer_shot = @player_board.cells.keys.sample(1)
      computer_shot_string = computer_shot[0]
      @player_board.cells[computer_shot].fire_upon
    end

    puts "Your shot on #{player_shot} was a hit/miss/sink"
    puts "My shot on #{computer_shot} was a hit/miss/sink"

    # Check if all ships for either person are sunk
    # This turn actually needs to be in a conditional where we are checking
    # if all the ships are sunk or not
    !turn

  end
end

do an each

player_ships_health = []
player_board.cells.each do |cell|
  if cell.ship.health != 0
    player_ships << []
  end
end
