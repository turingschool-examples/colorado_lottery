require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require "./lib/game"
require "./lib/contestant"
require "./lib/colorado_lottery"

class ColoradoLotteryTest < Minitest::Test

  def setup
    @lottery = ColoradoLottery.new
  end

  def test_it_exists
    assert_instance_of ColoradoLottery, @lottery
  end
  
end
