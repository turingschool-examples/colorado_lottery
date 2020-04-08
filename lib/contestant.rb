class Contestant
  attr_reader :first_name, :last_name, :age, :spending_money, :state_of_residence

  def initialize(info)
    @first_name = info[:first_name]
    @last_name = info[:last_name]
    @age = info[:age]
    @spending_money = info[:spending_money]
    @state_of_residence = info[:state_of_residence]
    @out_of_state = false
  end

  def full_name
    @first_name + " " + @last_name
  end

  def out_of_state?
    @out_of_state
  end

end
