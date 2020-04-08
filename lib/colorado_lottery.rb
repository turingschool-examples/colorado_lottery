class ColoradoLottery
  attr_reader :registered_contestants, :winners,
              :current_contestants

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

  def can_register?(contestant, game)
    if !interested_and_18?(contestant, game)
      false
    elsif contestant.out_of_state? && !game.national_drawing?
      false
    else
      true
    end
  end

  def register_contestant(contestant, game)
    if can_register?(contestant, game) &&
       @registered_contestants[game.name].nil?
      @registered_contestants[game.name] = [contestant]
    elsif can_register?(contestant, game)
      @registered_contestants[game.name] << contestant
    end
  end

  def eligible_contestants(game)
    eligible = []
    @registered_contestants[game.name].each do |contestant|
      if contestant.spending_money >= game.cost
        eligible << contestant
      end
    end
    eligible
  end

end
