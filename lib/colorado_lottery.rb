class ColoradoLottery

  attr_reader :registered_contestants,
              :winners,
              :current_contestants,
              :name

  def initialize
    @registered_contestants = {}
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(contestant, game_name)
    if contestant.game_interests != game_name.name
      return false
    elsif contestant.game_interests == game_name.name && contestant.age >= 18
      true
    end
  end

  def can_register?(contestant, game_name)
    if contestant.age >= 18 || contestant.game_interests == game_name.name
      return true
    end
  end
end
