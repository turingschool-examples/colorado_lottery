require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require './lib/contestant'
require './lib/colorado_lottery'
require 'pry'

class ColoradoLotteryTest < Minitest::Test

  def test_it_exists
    lottery = ColoradoLottery.new
    assert_instance_of ColoradoLottery, lottery
  end
end
