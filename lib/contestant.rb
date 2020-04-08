class Contestant
  attr_reader :first_name, :last_name, :age, :state_of_residence, :spending_money

  def initialize(attribute)
    @first_name         = attribute[:first_name]
    @last_name          = attribute[:last_name]
    @age                = attribute[:age]
    @state_of_residence = attribute[:state_of_residence]
    @spending_money     = attribute[:spending_money]
  end

  def full_name
    "#{first_name} ".concat(last_name)
  end
end
