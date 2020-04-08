class Contestant

  attr_reader :full_name,
              :age,
              :state_of_residence,
              :spending_money,
              :game_interests
  def initialize(information)
    @full_name = information[:first_name] + " " + information[:last_name]
    @age = information[:age]
    @state_of_residence = information[:state_of_residence]
    @spending_money = information[:spending_money]
    @game_interests = []
  end

  def out_of_state?
    @state_of_residence != "CO"
  end

  def add_game_interest(game)
    @game_interests << game
  end
end
