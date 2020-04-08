class Contestant
  attr_reader :first_name, :last_name, :age, :state_of_residence, :spending_money

  def initialize(attribute)
    @first_name         = attribute[:first_name]
    @last_name          = attribute[:last_name]
    @age                = attribute[:age]
    @state_of_residence = attribute[:state_of_residence]
    @spending_money     = attribute[:spending_money]
    @out_of_state       = false
    @game_interests     = []
  end

  def full_name
    "#{first_name} ".concat(last_name)
  end

  def out_of_state?
    @out_of_state
  end

  def game_interests
    @game_interests
  end
end
