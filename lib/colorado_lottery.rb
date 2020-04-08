class ColoradoLottery

  attr_reader :registered_contestants,
              :winners,
              :current_contestants

  def initialize
    @registered_contestants = {}
    @winners = []
    @current_contestants = []
  end

  def interested_and_18?(name, game_name)
    if name.game_interests == game_name && name.age > 17
      true
    else
      false
    end
  end
end
