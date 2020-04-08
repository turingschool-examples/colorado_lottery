require 'minitest/autorun'
require 'minitest/pride'
require './lib/contestant'
require "./lib/game"
require "./lib/colorado_lottery"

class ColoradoLotteryTest < Minitest::Test

  def setup
    @lottery = ColoradoLottery.new
    @pick_4 = Game.new('Pick 4', 2)
    @mega_millions = Game.new('Mega Millions', 5, true)
    @cash_5 = Game.new('Cash 5', 1)
    @alexander = Contestant.new({
                       first_name: 'Alexander',
                       last_name: 'Aigades',
                       age: 28,
                       state_of_residence: 'CO',
                       spending_money: 10})
    @benjamin = Contestant.new({
                       first_name: 'Benjamin',
                       last_name: 'Franklin',
                       age: 17,
                       state_of_residence: 'PA',
                       spending_money: 100})
    @frederick = Contestant.new({
                       first_name:  'Frederick',
                       last_name: 'Douglas',
                       age: 55,
                       state_of_residence: 'NY',
                       spending_money: 20})
    @winston = Contestant.new({
                     first_name: 'Winston',
                     last_name: 'Churchill',
                     age: 18,
                     state_of_residence: 'CO',
                     spending_money: 5})
  end

  def test_it_exists
    assert_instance_of ColoradoLottery, @lottery
    assert_instance_of Game, @pick_4
    assert_instance_of Game, @mega_millions
    assert_instance_of Game, @cash_5
    assert_instance_of Contestant, @alexander
    assert_instance_of Contestant, @benjamin
    assert_instance_of Contestant, @frederick
    assert_instance_of Contestant, @winston
  end

  def test_it_has_no_registered_contestants
    expected_contestant_hash = {}
    assert_equal expected_contestant_hash, @lottery.registered_contestants
  end

  def test_it_has_no_winners
    assert_equal [], @lottery.winners
  end

  def test_it_has_no_current_contestants
    expected_current_hash = {}
    assert_equal expected_current_hash, @lottery.current_contestants
  end
end
