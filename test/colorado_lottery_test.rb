require 'minitest/autorun'
require 'minitest/pride'
require './lib/colorado_lottery'

class ColoradoLotteryTest < Minitest::Test
  def setup
    @lottery = ColoradoLottery.new
  end

  def test_initialization_with_attributes
    assert_equal Hash.new, @lottery.registered_contestants
    assert_equal Array.new, @lottery.winners
    assert_equal Hash.new, @lottery.current_contestants 
  end
end
