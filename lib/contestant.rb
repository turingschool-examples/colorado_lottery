class Contestant

  attr_reader :age, :state_of_residence, :spending_money, :game_interests

  def initialize(contestant)
    @first_name = contestant[:first_name]
    @last_name= contestant[:last_name]
    @age = contestant[:age]
    @state_of_residence = contestant[:state_of_residence]
    @spending_money = contestant[:spending_money]
    @game_interests = []
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def out_of_state?
    @state_of_residence != "CO"
  end

  def add_game_interest(game)
    @game_interests << game
  end
end
