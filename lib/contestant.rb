class Contestant

  attr_reader :first_name, :last_name, :age, :state_of_residence, :spending_money, :full_name, :game_interests

  def initialize(info_hash)
    @first_name = info_hash[:first_name]
    @last_name = info_hash[:last_name]
    @full_name = "#{@first_name} #{@last_name}"
    @age = info_hash[:age]
    @state_of_residence = info_hash[:state_of_residence]
    @spending_money = info_hash[:spending_money]
    @game_interests = []
  end

  def out_of_state?
    @state_of_residence != 'CO'
  end

  def add_game_interest(name)
    @game_interests << name
  end

end
