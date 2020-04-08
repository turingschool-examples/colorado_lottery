require 'minitest/autorun'
require 'minitest/pride'
require './lib/contestant'
require './lib/game'


class ContestantTest < MiniTest::Test

  def test_it_exists


  end








#
# pry(main)> alexander = Contestant.new({first_name: 'Alexander',
#                                       last_name: 'Aigiades',
#                                       age: 28,
#                                       state_of_residence: 'CO',
#                                       spending_money: 10})
# #=> <Contestant:0x007ff87ac0a498...>
#
# pry(main)> alexander.full_name
# #=> "Alexander Aigiades"
#
# pry(main)> alexander.age
# #=> 28
#
# pry(main)> alexander.state_of_residence
# #=> "CO"
#
# pry(main)> alexander.spending_money
# #=> 10
#
# pry(main)> alexander.out_of_state?
# #=> false
#
# pry(main)> alexander.game_interests
# #=> []
#
# pry(main)> alexander.add_game_interest('Mega Millions')
# pry(main)> alexander.add_game_interest('Pick 4')
#
# pry(main)> alexander.game_interests
# => ["Mega Millions", "Pick 4"]
# ```
