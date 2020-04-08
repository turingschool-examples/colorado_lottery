class ColoradoLottery
  attr_reader :winners, :registered_contestants, :current_contestants
  def initialize
    @winners = []
    @registered_contestants = {}
    @current_contestants = {}
    @contestants = []
  end

  def interested_and_18?(contestant, game)
    contestant.age >= 18 && contestant.game_interests.include?(game.name)
  end


  def can_register?(contestant, game)
    co_or_national = contestant.state_of_residence == "CO" || game.national_drawing
    return interested_and_18?(contestant, game) && co_or_national
    # - A contestant #can_register? if they are interested in the game,
    #18 years of age or older, and they are either a Colorado resident
    #or this is a national game
  end

  def register_contestant(contestant, game)

    @registered_contestants[game.name] = [contestant]
    require "pry"; binding.pry
    #   # @contestants << contestant
    #   @registered_contestants[game.name] = @contestants

    # end
    @registered_contestants
  end

  def eligible_contestants(game)
    require "pry"; binding.pry

  end

  

  # - `#eligible_contestants` is a list of all the contestants
  #who have been registered to
  # play a given game and that have more spending_money than the cost.

  # - current_contestants are lists of contestant names who have been charged, organized by game.

end
