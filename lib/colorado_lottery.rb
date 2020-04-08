class ColoradoLottery
  attr_reader :registered_contestants, :winners, :current_contestants
  def initialize
    @registered_contestants = {}
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(contestant, game)
    if contestant.game_interests.include?(game.name)
      contestant.age >= 18
    else
    false
    end
  end

  def can_register?(contestant, game)
    interested_and_18?(contestant, game) && (contestant.state_of_residence == "CO" || game.national_drawing? == true)
  end
end
