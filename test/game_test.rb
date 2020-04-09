require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/game'

class GameTest < Minitest::Test
  def test_it_exists
    pick_4 = Game.new('Pick 4', 2)

    assert_instance_of Game, pick_4
  end

  def test_it_has_attributes
    pick_4 = Game.new('Pick 4', 2)
    mega_millions = Game.new('Mega Millions', 5, true)

    assert_equal 'Pick 4', pick_4.name
    assert_equal 2, pick_4.cost
    assert_equal false, pick_4.national_drawing?
    assert_equal true, mega_millions.national_drawing?
  end
end
