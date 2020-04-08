class ColoradoLottery

  attr_reader :registered_contestants, :winners, :contestants

  def initialize
    @registered_contestants = {}
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(contestant, game)
    if contestant.age < 18
      false
    elsif !contestant.game_interests.include?(game.name)
      false
    else
      true
    end
  end
end
