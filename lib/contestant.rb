class Contestant

  attr_reader :age, :state_of_residence, :spending_money, :game_interests
  def initialize(details)
    @first_name = details[:first_name]
    @last_name = details[:last_name]
    @age = details[:age]
    @state_of_residence = details[:state_of_residence]
    @spending_money = details[:spending_money]
    @game_interests = []
  end

  def full_name
    @first_name + ' ' + @last_name
  end

  def out_of_state?
    @state_of_residence != 'CO'
  end

  def add_game_interest(game)
    @game_interests << game
  end

end
