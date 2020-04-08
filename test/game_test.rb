require "minitest/autorun"
require "minitest/pride"
require "./lib/contestant"
require "./lib/game"

class GameTest < Minitest::Test

  def setup
    @pick_4 = Game.new('Pick 4', 2, false)
    @mega_millions = Game.new('Mega Millions', 5, true)
  end

  def test_it_exists
    assert_instance_of Game, @pick_4
  end

  def test_it_has_attributes
    assert_equal "Mega Millions", @mega_millions.name
    assert_equal 5, @mega_millions.cost
  end


end
