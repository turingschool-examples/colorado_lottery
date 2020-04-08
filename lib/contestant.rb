class Contestant

  attr_reader :first_name, :last_name, :age, :state_of_residence, :spending_money
  def initialize(init_hash)
    @first_name = init_hash[:first_name]
    @last_name = init_hash[:last_name]
    @age = init_hash[:age]
    @state_of_residence = init_hash[:state_of_residence]
    @spending_money = init_hash[:spending_money]
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
