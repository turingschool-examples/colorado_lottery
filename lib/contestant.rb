class Contestant
  attr_reader :age, :state_of_residence, :spending_money, :game_interests

  def initialize(contestants)
    @contestant = contestants
    @age = contestants[:age]
    @state_of_residence = contestants[:state_of_residence]
    @spending_money = contestants[:spending_money]
    @game_interests = []
  end

  def full_name
    @contestant[:first_name] + " " +  @contestant[:last_name]
  end

  def out_of_state?
    if @contestant[:state_of_residence] == "CO"
      false
    else
      true
    end
  end

  def add_game_interest(game)
    @game_interests << game

  end
end
