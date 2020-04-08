class ColoradoLottery
  attr_reader :registered_contestants,
              :winners,
              :current_contestants
  def initialize(registered_contestants = {},
                winners = [],
                current_contestants = {})
    @registered_contestants = registered_contestants
    @winners = winners
    @current_contestants = current_contestants
  end

  def interested_and_18?(contestant, game)
    interested = contestant.game_interests.include?(game.name)
    contestant.age >= 18 && interested
  end

  def can_register?(contestant, game)
    return false unless interested_and_18?(contestant,game)
    !contestant.out_of_state? || game.national_drawing?
  end

  def register_contestant(contestant, game)
    if can_register?(contestant, game)
      if registered_contestants[game.name]
        @registered_contestants[game.name] << contestant
      else
        contestants = []
        @registered_contestants[game.name] = contestants << contestant
      end
    end
  end

  def eligible_contestants(game)
    @registered_contestants[game.name].select do |contestant|
      contestant.spending_money > game.cost
    end
  end
end
