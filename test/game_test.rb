require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require "./lib/game"
require "./lib/contestant"

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
