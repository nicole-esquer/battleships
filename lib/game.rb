class Game
  attr_reader :player_board, :computer_board, :player_ships_count, :computer_ships_count

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
      place_computer_ships
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
    start
  end


  def start
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The cruiser is three units long and the submarine is two units long."
    player_board_render = @player_board.render(true)
    puts player_board_render
    player_place_cruiser
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
      turn
    else
      puts "Those coordinates are not valid. Please try again."
      player_place_submarine
    end
  end

  def show_boards
    puts "=============COMPUTER BOARD============="
    puts @computer_board.render
    puts "==============PLAYER BOARD=============="
    puts @player_board.render(true)
  end

  def turn
    show_boards

    player_turn = true
    computer_turn = false
    player_shot = ""
    computer_shot = ""

    while player_turn && @computer_ships_count > 0
      puts "Enter the coordinate for your shot:"
      player_shot = gets.chomp.upcase
      if !@computer_board.valid_coordinate?(player_shot)
        puts "That is not a valid coordinate on the board! Please try again."
        player_turn = true
      elsif @computer_board.cells[player_shot].fired_upon?
        puts "That cells has already been shot at. Please try again."
        player_turn = true
      else
        @computer_board.cells[player_shot].fire_upon
        if @computer_board.cells[player_shot].render == "M"
          puts "You missed your shot on #{player_shot}."
        elsif @computer_board.cells[player_shot].render == "H"
          puts "You hit your shot on #{player_shot}."
        elsif @computer_board.cells[player_shot].render == "X"
          puts "You sunk my ship on #{player_shot}!"
          @computer_ships_count -= 1
        end
        player_turn = false
        computer_turn = true
      end
    end

    if @computer_ships_count == 0
      game_over
      return "Game over!"
    end

    while computer_turn && @player_ships_count > 0
      computer_shot = @player_board.cells.keys.sample(1)
      computer_shot_string = computer_shot[0]
      if @player_board.cells[computer_shot_string].fired_upon?
        computer_turn = true
      else
        @player_board.cells[computer_shot_string].fire_upon
        if @player_board.cells[computer_shot_string].render == "M"
          puts "I missed my shot on #{computer_shot_string}."
        elsif @player_board.cells[computer_shot_string].render == "H"
          puts "I hit my shot on #{computer_shot_string}."
        elsif @player_board.cells[computer_shot_string].render == "X"
          puts "I sunk your ship on #{computer_shot_string}!"
          @player_ships_count -= 1
        end
        player_turn = true
        computer_turn = false
      end
    end

    if @player_ships_count == 0
      game_over
      return "Game over!"
    end

    if @player_ships_count > 0 && @computer_ships_count > 0
      turn
    end
  end

  def game_over
    if @computer_ships_count == 0
      puts "✨✨✨✨✨ You won! ✨✨✨✨✨"
      show_boards
    else
      puts "🤖🤖🤖🤖🤖 I won! 🤖🤖🤖🤖🤖"
      show_boards
    end
    reset
  end

  def play_again
    puts "Would you like to play again?"
    puts "Enter p to play. Enter q to quit."
    response = gets.chomp.downcase

    if response == "p"
      puts "Nice to see you again!"
      place_computer_ships
    elsif response == "q"
      puts "Bye!"
    else
      puts "I'm sorry, that's an invalid entry. Please try again."
      play_again
    end
  end

  def reset
    @player_board = Board.new
    @computer_board = Board.new
    @player_ships_count = 2
    @computer_ships_count = 2
    play_again
  end

end
