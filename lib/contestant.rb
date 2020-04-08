class Contestant
  attr_reader :age, :state_of_residence, :spending_money, :game_interests
  def initialize(argument)
    @first_name = argument[:first_name]
    @last_name = argument[:last_name]
    @age = argument[:age]
    @state_of_residence = argument[:state_of_residence]
    @spending_money = argument[:spending_money]
    @game_interests = []
  end

  def full_name
    @first_name + " " + @last_name
  end

  def out_of_state?
    return false if @state_of_residence == "CO"
  end

  def add_game_interest(game)
    @game_interests << game
  end

end
