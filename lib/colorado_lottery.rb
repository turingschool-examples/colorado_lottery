class ColoradoLottery
  attr_reader :registered_contestants,
              :winners
              :current_contestants
  def initialize
    @registered_contestants = {}
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(name, lotto)
    name.age >= 18 && name.game_interest[lotto]
  end

end
