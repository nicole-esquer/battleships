require './lib/board'
require './lib/cell'
require './lib/ship'


class Game

  def initialize
    @cruiser = Ship.new('Cruiser', 3)
    @submarine = Ship.new('Submarine', 2)
  end

  def main_menu
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    response = gets.chomp.downcase

    if response == "p"
      puts "Let's go!"
      #start
    elsif
      puts "Bye!"
      #exit game, return to main_menu
    else response != "p" || "q"
      puts "I'm sorry, that's an invalid entry. Please try again."
      #return to main_menu
    end
  end

  def start

  end



end
