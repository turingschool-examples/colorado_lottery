class ColoradoLottery

  attr_reader :registered_contestants,
              :winners,
              :current_contestants,
              :name

  def initialize
    @registered_contestants = {}
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(contestant, game_name)
    if contestant.game_interests != game_name.name
      return false
    elsif contestant.game_interests == game_name.name && contestant.age >= 18
      true
    end
  end

  def can_register?(contestant, game_name)
    if contestant.age >= 18 || contestant.game_interests == game_name.name
      return true
    end
  end

  def register_contestant(contestant, game_name)
    @registered_contestants[game_name] = contestant
  end

  def eligible_contestants(game_name)
    eligible_contestants = []
    @registered_contestants.each do |contestant|
      eligible_contestants << contestant
      require "pry"; binding.pry
    end
    eligible_contestants
  end
end
