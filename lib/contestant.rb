class Contestant
    attr_reader :full_name, :age, :state_of_residence, :spending_money, :game_interests
  def initialize(info)
  @first_name = info[:first_name]
  @last_name = info[:last_name]
  @full_name = info[:first_name] + " " + info[:last_name]
  @age = info[:age]
  @state_of_residence = info[:state_of_residence]
  @spending_money = info[:spending_money]
  @game_interests = []
  end

  def add_game_interest(game)
    @game_interests << game
  end


end
