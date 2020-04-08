class ColoradoLottery
  attr_reader :registered_contestants, :winners, :current_contestants
  def initialize
    @registered_contestants = {}
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(name, game)
    if name.age < 18
      false
    elsif !name.game_interests.include?(game.name)
      false
    else
      true
    end
  end

  def can_register?(name, game)
    if interested_and_18?(name, game)
      true
    elsif !name.out_of_state? && game.national_drawing?
      true
    else
      false
    end
  end
end
