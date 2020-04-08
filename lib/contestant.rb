class Contestant
  attr_reader :first_name, :last_name, :age,
              :state_of_residence, :spending_money, :game_interest
    def initialize (info)
      @first_name = info[:first_name]
      @last_name = info[:last_name]
      @age = info[:age]
      @state_of_residence = info[:state_of_residence]
      @spending_money = info[:spending_money]
      @game_interest = []
    end

    def full_name
      @first_name + " " + @last_name
    end

    def out_of_state?
      @state_of_residence != 'CO'
    end
end
