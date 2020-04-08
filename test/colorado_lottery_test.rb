require 'minitest/autorun'
require 'minitest/pride'
require './lib/contestant'
require './lib/game'
require './lib/colorado_lottery'


class ColoradoLotteryTest < Minitest::Test
  def test_it_exists
    lottery = ColoradoLottery.new
    assert_instance_of ColoradoLottery, lottery
  end

  def test_it_has_attributes
    lottery = ColoradoLottery.new
    assert_equal ({}), lottery.registered_contestants
    assert_equal [], lottery.winners
    assert_equal ({}), lottery.current_contestants
  end
end
