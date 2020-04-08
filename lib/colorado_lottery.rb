class ColoradoLottery
  attr_reader :registered_contestants, :winners, :current_contestants

  def initialize
    @registered_contestants = {}
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(contestant, game)
    contestant.age >= 18 && contestant.game_interests.include?(game.name)
  end

  def out_of_state_only_for_national(contestant, game)
    if game.national_drawing? == false
      contestant.out_of_state? == false
    else
      true
    end
  end

  def can_register?(contestant, game)
    interested_and_18?(contestant, game) && out_of_state_only_for_national(contestant, game)
  end
end
