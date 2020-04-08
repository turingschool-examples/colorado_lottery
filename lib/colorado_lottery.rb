class ColoradoLottery

  attr_reader :registered_contestants, :winners, :current_contestants
  def initialize()
    @registered_contestants = Hash.new { |hash, key| hash[key] = [] }
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(person_interested, game_interest)
    person_interested.age >= 18 &&
    person_interested.game_interests.include?(game_interest.name)
  end

  def can_register?(person, game)
    if interested_and_18?(person, game) && game.national_drawing?
      true
    elsif interested_and_18?(person, game) && !person.out_of_state?
      true
    else
      false
    end
  end

  def register_contestant(contestant, game)
    if can_register?(contestant, game)
      @registered_contestants[game.name] << contestant
    end
  end
end
