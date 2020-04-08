require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require './lib/contestant'
require './lib/colorado_lottery'

class ColoradoLotteryTest < MiniTest::Test

  def setup
    @lottery = ColoradoLottery.new
  end

  def test_it_exists
    assert_instance_of ColoradoLottery, @lottery
  end

  def test_attributes_are_empty_collections_by_default
    assert_equal Hash.new, @lottery.registered_contestants
    assert_equal [], @lottery.winners
    assert_equal Hash.new, @lottery.current_contestants
  end
end
