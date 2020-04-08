class ColoradoLottery

  attr_reader :registered_contestants, :winners, :current_contestants

  def initialize
    @registered_contestants = Hash.new { |h, k| h[k] = [] }
    @winners = []
    @current_contestants = Hash.new { |h, k| h[k] = [] }
  end

  def interested_and_18?(contestant, game)
    return true if contestant.game_interests.include?(game.name) && contestant.age >= 18
    false
  end

  def can_register?(contestant, game)
    return false if interested_and_18?(contestant, game) == false
    return false if game.national_drawing? == false && contestant.out_of_state? == true
    true
  end

  def register_contestant(contestant, game)
    @registered_contestants[game.name] << contestant
  end
end
