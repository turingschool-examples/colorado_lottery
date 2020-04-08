class Game

  attr_reader :name, :cost 

  def initialize(name_parameter, cost, national_drawing)
    @name = name_parameter
    @cost = cost
  end
end
