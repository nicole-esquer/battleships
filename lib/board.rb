class Board
  attr_reader :cells, :rows, :columns

  def initialize
    @rows = []
    @columns = []
    @cells = {}

    ("A".."D").each do |letter|
      (1..4).each do |number|
        @cells["#{letter}#{number.to_s}"] = Cell.new("#{letter}#{number.to_s}")
      end
    end
  end

  def valid_coordinate?(coordinate)
    @cells.key?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    coordinates.each do |coordinate|
      if !valid_coordinate?(coordinate)
        return false
      end

      if @cells["#{coordinate}"].ship != nil
        return false
      end
    end

    if (ship.length != coordinates.length)
      return false
    end

    is_horizontal?(coordinates) || is_vertical?(coordinates)
  end

  def is_horizontal?(coordinates)
    letters = coordinates.map{ |coordinate| coordinate[0].ord }
    numbers = coordinates.map { |coordinate| coordinate[1].ord }

    same_letter = false
    if letters.uniq.count == 1
      same_letter = true
    end

    consecutive_numbers = false
    if numbers.each_cons(2).all? {|i,j| j == i + 1}
      consecutive_numbers = true
    end

    same_letter && consecutive_numbers
  end

  def is_vertical?(coordinates)
    letters = coordinates.map{ |coordinate| coordinate[0].ord }
    numbers = coordinates.map { |coordinate| coordinate[1].ord }

    same_number = false
    if numbers.uniq.count == 1
      same_number = true
    end

    consecutive_letters = false
    if letters.each_cons(2).all? {|i,j| j == i + 1}
      consecutive_letters = true
    end

    same_number && consecutive_letters
  end

  def place(ship, coordinates)
    if !valid_placement?(ship, coordinates)
      return puts "That is not a valid placement."
    end

    coordinates.each do |coordinate|
      @cells["#{coordinate}"].place_ship(ship)
    end
  end

  def render(show_ship = false)
      cell_1 = @cells["A1"].render(show_ship)
      cell_2 = @cells["A2"].render(show_ship)
      cell_3 = @cells["A3"].render(show_ship)
      cell_4 = @cells["A4"].render(show_ship)
      cell_5 = @cells["B1"].render(show_ship)
      cell_6 = @cells["B2"].render(show_ship)
      cell_7 = @cells["B3"].render(show_ship)
      cell_8 = @cells["B4"].render(show_ship)
      cell_9 = @cells["C1"].render(show_ship)
      cell_10 = @cells["C2"].render(show_ship)
      cell_11 = @cells["C3"].render(show_ship)
      cell_12 = @cells["C4"].render(show_ship)
      cell_13 = @cells["D1"].render(show_ship)
      cell_14 = @cells["D2"].render(show_ship)
      cell_15 = @cells["D3"].render(show_ship)
      cell_16 = @cells["D4"].render(show_ship)

      long_string = "  1 2 3 4 \n" +
      "A #{cell_1} #{cell_2} #{cell_3} #{cell_4} \n" +
      "B #{cell_5} #{cell_6} #{cell_7} #{cell_8} \n" +
      "C #{cell_9} #{cell_10} #{cell_11} #{cell_12} \n" +
      "D #{cell_13} #{cell_14} #{cell_15} #{cell_16} \n"
      return long_string
  end

  def get_valid_coordinates(ship)
    game_coordinates = @cells.keys
    ship_coordinates = []

    until valid_placement?(ship, ship_coordinates) do
      ship_coordinates = game_coordinates.sample(ship.length)
    end

    return ship_coordinates
  end


end
