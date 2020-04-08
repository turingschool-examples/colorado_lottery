class ColoradoLottery
  attr_reader :registered_contestants, :winners, :current_contestants

  def initialize
    @registered_contestants = {}
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(contestant, game)
    contestant.age >= 18 && contestant.game_interests.include?(game.name)
  end

  def out_of_state_only_for_national(contestant, game)
    if game.national_drawing? == false
      contestant.out_of_state? == false
    else
      true
    end
  end

  def can_register?(contestant, game)
    interested_and_18?(contestant, game) && out_of_state_only_for_national(contestant, game)
  end

  def register_contestant(contestant, game)
    if can_register?(contestant, game) == true
      if @registered_contestants[game.name] == nil
        @registered_contestants[game.name] = [contestant]
      elsif @registered_contestants[game.name] != nil
      @registered_contestants[game.name] << contestant
      end
    end
  end

  def eligible_contestants(game)
    @registered_contestants[game.name].find_all do |contestant|
      contestant.spending_money >= game.cost
    end
  end

  def charge_contestants(game)
    @current_contestants[game] = []
    eligible_contestants(game).each do |contestant|
      contestant.spending_money -= game.cost
      @current_contestants[game] << contestant.full_name
    end
  end

  def draw_winners
    #draw_winners method returns the date of the drawing as a string, and populates the #winners array with a random winner for each game based on available contestants
  end
end
