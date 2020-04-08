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


  def register_contestant(contestant, game)
    new_contestant =[contestant]
    if can_register?(contestant, game) == true
      if @registered_contestants[game.name] == nil
        @registered_contestants[game.name] = new_contestant
        # require "pry";binding.pry
      else
        @registered_contestants[game.name] << contestant
      end
    end
  end

  def eligible_contestants(game)
    @registered_contestants[game.name].find_all{|contestant| contestant.spending_money >= game.cost}
  end
end
