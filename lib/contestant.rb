class Contestant

  attr_reader :full_name, :age, :state_of_residence, :spending_money
  def initialize(args)
    @full_name = args[:first_name] + " " + args[:last_name]
    @age = args[:age]
    @state_of_residence = args[:state_of_residence]
    @spending_money = args[:spending_money]
  end

  def out_of_state?
    @state_of_residence != "CO"
  end
end
