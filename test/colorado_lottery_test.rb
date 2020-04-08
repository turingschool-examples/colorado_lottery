require 'minitest/autorun'
require 'minitest/pride'
require './lib/contestant'
require './lib/game/'
require './lib/colorado_lottery'

class ColoradoLotteryTest < Minitest::Test

  def setup
    @lottery = ColoradoLottery.new
#review boolean parameter for Game class
    @pick_4 = Game.new('Pick 4', 2, false)
    @mega_millions = Game.new('Mega Millions', 5, true)
    @cash_5 = Game.new('Cash 5', 1, false)

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

  def test_it_exist
    assert_instance_of ColoradoLottery, @lottery
  end

  def test_interested_and_18
    @alexander.add_game_interest(@pick_4)
    @alexander.add_game_interest(@mega_millions)
    @frederick.add_game_interest(@mega_millions)
    @winston.add_game_interest(@cash_5)
    @winston.add_game_interest(@mega_millions)
    @benjamin.add_game_interest(@mega_millions)
require 'pry'; binding.pry
    assert_equal false, @lottery.interested_and_18?(@benjamin, @mega_millions)
    assert_equal true, @lottery.interested_and_18?(@alexander, @pick_4)
  end

end
