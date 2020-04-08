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
  def test_it_starts_with_no_contestants_or_winners
    lottery = ColoradoLottery.new
    assert_empty lottery.registered_contestants
    assert_empty lottery.winners
    assert_empty lottery.current_contestants
  end
end
