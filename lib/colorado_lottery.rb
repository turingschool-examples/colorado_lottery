class ColoradoLottery
  attr_reader :registered_contestants, :winners, :current_contestants
  def initialize
    @registered_contestants = {}
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(contestant, game)
      contestant.game_interests.include?(game.name) && at_least_18?(contestant)
  end

  def at_least_18?(contestant)
    contestant.age >= 18
  end
end
