class ColoradoLottery

  attr_reader :registered_contestants, :winners, :current_contestants
  def initialize
    @registered_contestants = Hash.new { |hash, key| hash[key] = [] }
    @winners = []
    @current_contestants = Hash.new { |hash, key| hash[key] = [] }
  end

  def interested_and_18?(contestant, game)
    contestant.game_interests.include?(game.name) && contestant.age >= 18
  end

  def can_register?(contestant, game)
    interested_and_18?(contestant, game) &&
    (!contestant.out_of_state? || game.national_drawing?)
  end

  def register_contestant(contestant, game)
    registered_contestants[game.name] << contestant
  end

  def eligible_contestants(game)
    registered_contestants[game.name]
  end

  def charge_contestants(game)
    eligible_contestants(game).each do |contestant|
      contestant.spending_money -= game.cost if contestant.spending_money  >= game.cost
      current_contestants[game] << contestant.full_name if contestant.spending_money >=0
    end

  end

end
