class ColoradoLottery
  attr_reader :registered_contestants, :winners, :current_contestants
  def initialize
    @registered_contestants = Hash.new
    @winners = Array.new
    @current_contestants = Hash.new
  end

  def interested_and_18?(contestant, game)
    if contestant.age >= 18 && contestant.game_interests.any? {|games|games == game.name}
      true
    else
      false
    end
  end

  def can_register?(contestant, game)
    if interested_and_18?(contestant, game) == true && game.national_drawing? == true
      true
    elsif interested_and_18?(contestant, game) == true && contestant.out_of_state? == false
      true
    else
      false
    end
  end
end
