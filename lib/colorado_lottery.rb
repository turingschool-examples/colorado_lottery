class ColoradoLottery
  attr_reader :winners, :registered_contestants, :current_contestants
  def initialize
    @winners = []
    @registered_contestants = {}
    @current_contestants = {}
  end

  def interested_and_18?(contestant, game)
    contestant.age >= 18 && contestant.game_interests.include?(game.name)
  end
end

# - A contestant #can_register? if they are interested in the game,
#18 years of age or older, and they are either a Colorado resident
#or this is a national game