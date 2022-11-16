class ColoradoLottery
  attr_reader :registered_contestants, :winners, :current_contestants

  def initialize
    @registered_contestants = {}
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(contestant,game)
    contestant.age >= 18 && contestant.game_interests.include?(game.name)
  end

  def can_register?(contestant, game)
    if interested_and_18?(contestant,game) && !contestant.out_of_state?
      true
    elsif interested_and_18?(contestant,game) && game.national_drawing
      true
    else
      false
    end
  end

  def register_contestant(contestant,game)
    if can_register?(contestant,game)
        if @registered_contestants.keys.include?(game.name)
          @registered_contestants[game.name] << contestant
        else
          @registered_contestants[game.name] = [contestant]
        end
    end
    @registered_contestants
  end

  def eligible_contestants(game)
    eligible = []
    @registered_contestants[game.name].each do |contestant|
      eligible << contestant if contestant.spending_money >= game.cost
    end
    eligible
  end

  def charge_contestants(game)
    @current_contestants[game] = []
    @registered_contestants[game.name].each do |contestant|
      if contestant.spending_money >= game.cost
        @current_contestants[game] << contestant.full_name
        contestant.spending_money -= game.cost
      end 
    end
    @current_contestants
  end

end
