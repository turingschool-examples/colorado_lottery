class Game
  attr_reader :name, :cost, :national_drawing

  def initialize(name, cost, national_drawing = false)
    @name = name
    @cost = cost
  end

  def national_drawing?
    @national_drawing = true 
  end
end
