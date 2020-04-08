require "./lib/game"
require 'pry'

class Contestant
attr_reader :first_name, :last_name, :age, :state_of_residence, :spending_money

  def initialize(contestant_data)
    @first_name = contestant_data[:first_name]
    @last_name = contestant_data[:last_name]
    @age = contestant_data[:age]
    @state_of_residence = contestant_data[:state_of_residence]
    @spending_money = contestant_data[:spending_money]
  end

  def full_name
    [@first_name, @last_name].join(' ')
  end
end
