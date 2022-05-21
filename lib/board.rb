class Board
  attr_reader :cells, :rows, :columns

  def initialize
    @rows = []
    @columns = []
    @cells = {}

    ("A".."D").each do |letter|
      # @rows << letter
      (1..4).each do |number|
        # @columns << number.to_s
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
  end

end






# numbers = [1, 2, 3, 4]
# letters = ["A", "B", "C", "D"]
#
# cells = {}
# letters.each do |letter|
#   numbers.each do |number|
#     cells_hash["#{letter}#{number.to_s}"] = Cell.new("#{letter}#{number.to_s}")
# end
# end
