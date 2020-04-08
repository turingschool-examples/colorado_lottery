class ColoradoLottery

  attr_reader :registered_contestants, :winners, :current_contestants

  def initialize
    @registered_contestants = Hash.new
    @winners = []
    @current_contestants = Hash.new
  end

  def interested_and_18?(contestant, game)
    return true if contestant.game_interests.include?(game.name) && contestant.age >= 18
    false
  end
end
