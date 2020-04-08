require "minitest/autorun"
require "./lib/game"


class GameTest < Minitest::Test
  def setup
    @pick_4 = Game.new('Pick 4', 2)
    @mega_millions = Game.new('Mega Millions', 5, true)
  end

  def test_it_exists
    assert_instance_of Game, @pick_4
    assert_instance_of Game, @mega_millions
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
