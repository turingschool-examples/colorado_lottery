require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'


class GameTest < Minitest::Test
  def setup
    @pick_4 = Game.new('Pick 4', 2)
    @mega_millions = Game.new('Mega Millions', 5, true)
  end
end

# pry(main)> pick_4 = Game.new('Pick 4', 2)
# #=> #<Game:0x007f96c296b7b0...>
#
# pry(main)> mega_millions = Game.new('Mega Millions', 5, true)
# #=> #<Game:0x007f96c2953278...>
#
# pry(main)> mega_millions.name
# #=> "Mega Millions"
#
# pry(main)> mega_millions.cost
# #=> 5
#
# pry(main)> mega_millions.national_drawing?
# #=> true
#
# pry(main)> pick_4.national_drawing?
# #=> false
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
