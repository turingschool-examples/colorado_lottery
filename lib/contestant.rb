require "./lib/game"
require 'pry'

class Contestant
attr_reader :first_name, :last_name, :age, :state_of_residence, :spending_money, :game_interests_list

  def initialize(contestant_data)
    @first_name = contestant_data[:first_name]
    @last_name = contestant_data[:last_name]
    @age = contestant_data[:age]
    @state_of_residence = contestant_data[:state_of_residence]
    @spending_money = contestant_data[:spending_money]
    @game_interests_list = []
  end

  def full_name
    [@first_name, @last_name].join(' ')
  end

  def out_of_state?
    !@state_of_residence == "CO"
  end

  def add_game_interest(game)
    @game_interests_list << game
  end

  def game_interests
    @game_interests_list
  end

end
