class ColoradoLottery
  attr_reader :registered_contestants, :winners, :current_contestants
  def initialize
    @registered_contestants = {}
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(contestant, game)
    if contestant.age <= 18
      false
    elsif contestant.age >= 18
      contestant.game_interests.any? do |interest|
         interest == game.name
      end
    else
      false
    end
  end
  
end
