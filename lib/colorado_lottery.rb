

class ColoradoLottery
  attr_reader :registered_contestants, :winners, :current_contestants

  def initialize
    @registered_contestants = {}
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(name, game_interest)
    if name.age >= 18
      true
    else
      false
    end
  end

end
