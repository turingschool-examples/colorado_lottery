require 'minitest/autorun'
require './lib/contestant'
require "./lib/game"
require 'pry'


class ContestantTest < Minitest::Test

def test_instance_of_game
  pick_4 = Game.new('Pick 4', 2)
  assert_instance_of Game, pick_4
end

def test_game_has_attributes
  pick_4 = Game.new('Pick 4', 2)
  mega_millions = Game.new('Mega Millions', 5, true)
  assert_equal 'Pick 4', pick_4.name
  assert_equal 2, pick_4.cost
  assert_equal 'Mega Millions', mega_millions.name
  assert_equal 5, mega_millions.cost
  assert_equal true, mega_millions.national_drawing?
  assert_equal false, pick_4.national_drawing?
end

def test_instance_of_contestant
  alexander = Contestant.new({first_name: 'Alexander',
                              last_name: 'Aigiades',
                              age: 28,
                              state_of_residence: 'CO',
                              spending_money: 10})
  assert_instance_of Contestant, alexander
end

def test_contestant_has_attributes
  alexander = Contestant.new({first_name: 'Alexander',
                              last_name: 'Aigiades',
                              age: 28,
                              state_of_residence: 'CO',
                              spending_money: 10})
  assert_equal 'Alexander', alexander.first_name
  assert_equal "Alexander Aigiades", alexander.full_name
  assert_equal 28, alexander.age
  assert_equal "CO", alexander.state_of_residence
  assert_equal 10, alexander.spending_money
  assert_equal false, alexander.out_of_state?
  assert_equal [], alexander.game_interests
end

def test_if_add_game_interest_works
  alexander = Contestant.new({first_name: 'Alexander',
                              last_name: 'Aigiades',
                              age: 28,
                              state_of_residence: 'CO',
                              spending_money: 10})
  pick_4 = Game.new('Pick 4', 2)
  mega_millions = Game.new('Mega Millions', 5, true)
  alexander.add_game_interest('Mega Millions')
  alexander.add_game_interest('Pick 4')
  assert_equal ['Mega Millions', 'Pick 4'], alexander.game_interests
end




end
