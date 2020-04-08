class ColoradoLottery

  attr_reader :registered_contestants, :winners, :contestants

  def initialize
    @registered_contestants = {}
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(contestant, game)
    return true if contestant.age < 18 && contestant.game_interests.include?(game.name)
    false
  end

  def can_register?
    return true if (interested_and_18?(contestant, game) == true) && (contestant.out_of_state? && game.national_drawing?) == true 
  end

end
