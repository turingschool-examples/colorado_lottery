class Game

  attr_reader :name, :cost

  def initialize(name, cost, national_status = false)
    @name = name
    @cost = cost
    @national_status = national_status
  end

  def national_drawing?
    @national_status
  end

end
