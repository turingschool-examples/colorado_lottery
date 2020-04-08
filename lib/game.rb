class Game
attr_reader :name, :cost

  def initialize(name, cost, national_drawing = false)
    @name = name
    @cost = cost
    @nat_draw = national_drawing
  end

  def national_drawing?
    @nat_draw
  end

end
