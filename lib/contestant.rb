class Contestant
  attr_reader :first_name, :last_name, :age, :spending_money, :state_of_residence, :game_interests

  def initialize(info)
    @first_name = info[:first_name]
    @last_name = info[:last_name]
    @age = info[:age]
    @spending_money = info[:spending_money]
    @state_of_residence = info[:state_of_residence]
    @out_of_state = false
    @game_interests = []
  end

  def full_name
    @first_name + " " + @last_name
  end

  def out_of_state?
    @out_of_state
  end

  def add_game_interest(game)
    @game_interests << game
  end
end
