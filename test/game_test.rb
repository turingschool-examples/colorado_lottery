require "./lib/game"
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class GameTest < MiniTest::Test

  def test_it_exists

    assert_instance_of Game, Game.new('Pick 4', 2)
  end

  def test_it_has_attributes
    mega_millions = Game.new('Mega Millions', 5, true)

    assert_equal "Mega Millions", mega_millions.name
    assert_equal 5, mega_millions.cost
  end

  def test_mega_millions_is_national_drawing
    mega_millions = Game.new('Mega Millions', 5, true)

    assert_equal true, mega_millions.national_drawing?
  end

  def test_pick_4_is_not_national_drawing
    pick_4 = Game.new('Pick 4', 2)

    assert_equal false, pick_4.national_drawing?
  end
end
