require_relative './game'

class Contestant < Game

  attr_reader :first_name, :last_name, :age, :state_of_residence, :spending_money, :full_name, :game_interests

  def initialize(info_hash)
    @first_name = info_hash[:first_name]
    @last_name = info_hash[:last_name]
    @full_name = "#{@first_name} #{@last_name}"
    @age = info_hash[:age]
    @state_of_residence = info_hash[:state_of_residence]
    @spending_money = info_hash[:spending_money]
    @game_interests = []
  end

  def out_of_state?
    @state_of_residence != 'CO'
  end

  def add_game_interest(name)
    national_status = false
    cost = 5 if name == 'Mega Millions'
    cost = 2 if name == "Pick 4"
    national_status = true if name == "Mega Millions"
    current_interest = Game.new(name, cost, national_status)
    @game_interests << current_interest.name
  end

end
