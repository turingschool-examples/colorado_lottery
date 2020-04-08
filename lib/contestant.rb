class Contestant
  attr_reader :full_name, :age, :state_of_residence,
              :spending_money, :game_interests

  def initialize(contestant_details)
    @full_name = "#{contestant_details[:first_name]} #{contestant_details[:last_name]}"
    @age = contestant_details[:age]
    @state_of_residence = contestant_details[:state_of_residence]
    @spending_money = contestant_details[:spending_money]
    @game_interests = []
  end

  def out_of_state?
    @state_of_residence != "CO"
  end

  def add_game_interest(game_interest)
    @game_interests << game_interest
  end
end
