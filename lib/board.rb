class Board
  attr_reader :cells
  
  def initialize
    @cells = {}
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
