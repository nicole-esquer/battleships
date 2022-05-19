class Cell
  attr_reader :coordinate, :ship, :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    return @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    return @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if !empty?
      @ship.hit
    end
  end

end
