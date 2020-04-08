class Game
  attr_reader :name, :cost, :national_drawing

  def initialize(name, cost, type = false)
    @name = name
    @cost = cost
    @national_drawing = type
  end

  def national_drawing?
    @national_drawing
  end

end
