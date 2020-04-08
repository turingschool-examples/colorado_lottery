class ColoradoLottery

  attr_reader :registered_contestants, :winners, :current_contestants
  def initialize()
    @registered_contestants = {}
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(person_interested, game_interest)
    person_interested.age >= 18 &&
    person_interested.game_interests.include?(game_interest.name)
  end
end
