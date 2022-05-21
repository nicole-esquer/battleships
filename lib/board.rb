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
      if valid_coordinate?(coordinate) == false
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
end
