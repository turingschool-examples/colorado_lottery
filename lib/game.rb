class Game
    attr_reader :name, :cost
  def initialize(name, cost, national_drawing = false)
    @name = name
    @cost = cost
  end
end
