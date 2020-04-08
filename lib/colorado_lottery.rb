

class ColoradoLottery
  attr_reader :registered_contestants, :winners, :current_contestants

  def initialize
    @registered_contestants = {}
    @winners = []
    @current_contestants = {}
  end

  def find_game_interest(name, game_interest)
    name.game_interests.find do |game|
        if game_interest.name == game
         return true
       else
         return false
        end
    end
  end

  def interested_and_18?(name, game_interest)
    if name.age >= 18 || find_game_interest(name, game_interest) == true 
      true
    else
      false
    end
  end

  def can_register?(name, game)
    if name.age >= 18
      true
    else
      false
    end
  end


end
