class ColoradoLottery
  attr_reader :registered_contestants,
              :winners,
              :current_contestants

  def initialize
    @registered_contestants = Hash.new
    @winners = []
    @current_contestants = []
  end

  def interested_and_18?(contestant, game)
   contestant.game_interests.include?(game) && contestant.age >= 18
  end

  def can_register?(contestant, game)
    interested_and_18? && (!contestant.out_of_state? || game.national_drawing?)
  end


end
