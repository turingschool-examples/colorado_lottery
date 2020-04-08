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
    @registered_contestants[game.name].find_all do |contestant|
      contestant.spending_money >= game.cost
    end
  end

  def charge_contestants(game)
    eligible = eligible_contestants(game)
    eligible.map do |contestant|
      contestant.spend(game.cost)
      if @current_contestants[game].nil?
        @current_contestants[game] = [contestant.full_name]
      else
        @current_contestants[game] << contestant.full_name
      end
    end
  end

end
