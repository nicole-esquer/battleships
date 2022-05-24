class Computer
  attr_reader :board, :cruiser, :submarine

  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def get_valid_coordinates(ship)
    game_coordinates = @board.cells.keys
    ship_coordinates = []

    until @board.valid_placement?(ship, ship_coordinates) do
      ship_coordinates = game_coordinates.sample(ship.length)
    end

    return ship_coordinates
  end

end
