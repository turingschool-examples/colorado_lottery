class Contestant

  attr_reader :first_name, :last_name, :age, :state_of_residence, :spending_money

  def initialize(info_hash)
    @first_name = info_hash[:first_name]
    @last_name = info_hash[:last_name]
    @age = info_hash[:age]
    @state_of_residence = info_hash[:state_of_residence]
    @spending_money = info_hash[:spending_money]
  end
end
