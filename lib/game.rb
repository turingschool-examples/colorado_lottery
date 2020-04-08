class Game
  attr_reader :name, :cost, :national_drawing

  def initialize(name, cost, national_drawing)
    @name             = name
    @cost             = cost
    @national_drawing = true
  end

  def national_drawing?
    if @national_drawing
      true
    else
      false
    end
  end
end
