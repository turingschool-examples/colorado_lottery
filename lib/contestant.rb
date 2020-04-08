class Contestant
  attr_reader :first_name,
              :last_name,
              :age,
              :state_of_residence,
              :spending_money

  def initialize(contestant_info)
    @first_name = contestant_info[:first_name]
    @last_name = contestant_info[:last_name]
    @age = contestant_info[:age]
    @state_of_residence = contestant_info[:state_of_residence]
    @spending_money = contestant_info[:spending_money]
  end

  def full_name
    @first_name + " " + @last_name
  end

  def out_of_state?
    if @state_of_residence == "CO"
      false
    else
      true
    end
  end

end
