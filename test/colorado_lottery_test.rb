require 'minitest/autorun'
require 'minitest/pride'
require './lib/contestant'
require './lib/game'
require './lib/colorado_lottery'
require 'pry'

class ColoradoLotteryTest < Minitest::Test
  def test_it_exists
    lottery = ColoradoLottery.new
    assert_instance_of ColoradoLottery, lottery
  end

  def test_it_has_registered_contestants
    lottery = ColoradoLottery.new
    #unable to resove error with testing
    assert_equal {} , lottery.registered_contestants
  end
end
