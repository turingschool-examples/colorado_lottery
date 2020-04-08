require "./lib/contestant"
require "./lib/game"
require 'colorado_lottery'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ColoradoLotteryTest < MiniTest::Test

  def test_it_exists
    lottery = ColoradoLottery.new
    assert_instance_of ColoradoLottery, lottery
  end





end
