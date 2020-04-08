class Game
attr_reader :name, :cost

  def initialize(name, cost, nat_draw = false)
    @name = name
    @cost = cost
    @nat_draw = nat_draw
  end

end
