class ColoradoLottery
  attr_reader :registered_contestants, :winners, :current_contestants

  def initialize
    @registered_contestants = {}
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(contestant, game)
    is_18 = contestant.age >= 18
    is_interested = contestant.game_interests.include?(game.name)

    is_18 && is_interested

    # contestant.age >= 18 && contestant.game_interests.include?(game.name)
  end

  def can_register?(contestant, game)
    state_resident = !contestant.out_of_state?
    national_game = game.national_drawing? == true

    interested_and_18?(contestant, game) && (state_resident || national_game)
  end

  def register_contestant(contestant, game)
    if registered_contestants[game.name] == nil
      registered_contestants[game.name] = []
    end
    registered_contestants[game.name] << contestant
  end

  def eligible_contestants(game)
    registered_contestants[game.name].find_all {|contestant| contestant.spending_money >= game.cost}
  end

  def charge_contestants(game)
    current_contestants[game] = []

    eligible_contestants(game).each do |contestant|
      current_contestants[game] << contestant.full_name
      contestant.spending_money -= game.cost
    end
  end
end
