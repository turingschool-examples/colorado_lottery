class ColoradoLottery
  attr_reader :registered_contestants, :current_contestants, :winners

  def initialize()
    @registered_contestants = {}
    @current_contestants = {}
    @winners = []
  end

  def interested_and_18?(contestant, game)
    if contestant.age >= 18
      contestant_interest = false
      if contestant.game_interests.each do |interest|
        contestant_interest = true if interest == game.name
      end
      contestant_interest
    end
  else
    false
  end
  end

  def can_register?(contestant, game)
    if interested_and_18?(contestant, game) == true && game.name == "Mega Millions" && contestant.age >= 18
      true
    elsif interested_and_18?(contestant, game) == true && game.name == "Cash 5" && contestant.state_of_residence == 'CO'
      true
    elsif interested_and_18?(contestant, game) == true && game.name == "Pick 4" && contestant.state_of_residence == 'CO'
      true
    else
      false
    end
  end

  def register_contestant(contestant, game)
    if can_register?(contestant, game) == true
      if @registered_contestants[game.name]== nil
        counter = []
        @registered_contestants[game.name] = counter
        counter << contestant
      else
        @registered_contestants[game.name] << contestant
      end
    end
  end

  def eligible_contestants(game)
    eligible_contestants = []
      @registered_contestants[game.name].each do |contestant|
        if contestant.spending_money > game.cost
          eligible_contestants << contestant
      end
    end
  end


end
