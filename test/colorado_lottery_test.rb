require "minitest/autorun"
require "minitest/pride"
require "./lib/contestant"
require "./lib/game"
require "./lib/colorado_lottery"


class ColoradoLotteryTest < Minitest::Test

  def setup
    @lottery = ColoradoLottery.new
  end

  def test_it_exists
    assert_instance_of ColoradoLottery, @lottery
  end

  def test_contestants
    assert_equal ({}), @lottery.registered_contestants
    assert_equal [], @lottery.winners
    assert_equal ({}), @lottery.current_contestants
  end

end
