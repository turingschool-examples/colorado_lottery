require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/game'


class GameTest < Minitest::Test

  def setup
    @pick_4 = Game.new('Pick 4', 2)
    @mega_millions = Game.new('Mega Millions', 5, true)
  end

  def test_it_exists
    assert_instance_of Game, @pick_4
    assert_instance_of Game, @mega_millions
  end

  def test_it_returns_attributes
    assert_equal "Mega Millions", @mega_millions.name
    assert_equal 5, @mega_millions.cost
    assert_equal true, @mega_millions.national_drawing?
    assert_equal false, @pick_4.national_drawing?

  end


end

# #=> "Mega Millions"
#
# #=> 5
#
# #=> true
#
# #=> false
#
#alexander = Contestant.new({first_name: 'Alexander',
#                                       last_name: 'Aigiades',
#                                       age: 28,
#                                       state_of_residence: 'CO',
#                                       spending_money: 10})
# #=> <Contestant:0x007ff87ac0a498...>
#
#alexander.full_name
# #=> "Alexander Aigiades"
#
#alexander.age
# #=> 28
#
#alexander.state_of_residence
# #=> "CO"
#
#alexander.spending_money
# #=> 10
#
#alexander.out_of_state?
# #=> false
#
#alexander.game_interests
# #=> []
#
#alexander.add_game_interest('Mega Millions')
#alexander.add_game_interest('Pick 4')
#
#alexander.game_interests
# => ["Mega Millions", "Pick 4"]
