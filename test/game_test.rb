require 'minitest/autorun'
require 'minitest/pride'
require './lib/contestant'
require './lib/game'
require 'pry'

class GameTest < Minitest::Test
  def test_it_exists
    pick_4 = Game.new('Pick 4', 2)
    assert_instance_of Game, pick_4
  end

  def test_it_has_attributes
    mega_millions = Game.new('Mega Millions', 5, true)
    pick_4 = Game.new('Pick 4', 2)
    assert_equal 'Mega Millions', mega_millions.name
    assert_equal 'Pick 4' , pick_4.name
    assert_equal 5 , mega_millions.cost
    assert_equal 2 , pick_4.cost
     assert_equal true , mega_millions.national_drawing?
     assert_equal false , pick_4.national_drawing?
  end
end
