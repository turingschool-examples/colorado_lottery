class Contestant

  attr_reader :age, :state_of_residence, :spending_money
  def initialize(details)
    @first_name = details[:first_name]
    @last_name = details[:last_name]
    @age = details[:age]
    @state_of_residence = details[:state_of_residence]
    @spending_money = details[:spending_money]
  end

  def full_name
    @first_name + ' ' + @last_name
  end

  def out_of_state?
    @state_of_residence != 'CO'
  end

end
