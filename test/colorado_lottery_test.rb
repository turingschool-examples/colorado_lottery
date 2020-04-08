require 'minitest/autorun'
require 'minitest/pride'
require './lib/contestant'
require "./lib/game"
require "./lib/colorado_lottery"
require 'pry'

class ColoradoLotteryTest < Minitest::Test
  def test_it_exists
    lottery = ColoradoLottery.new

    assert_instance_of ColoradoLottery, lottery
  end

  def test_it_starts_with_no_registered_contestants
    lottery = ColoradoLottery.new

    assert_equal ({}), lottery.registered_contestants
  end

  def test_it_starts_with_no_winners
    lottery = ColoradoLottery.new

    assert_equal [], lottery.winners
  end

  def test_there_are_no_current_contestants
    lottery = ColoradoLottery.new

    assert_equal ({}), lottery.current_contestants
  end

  def test_if_interested_and_18
    lottery = ColoradoLottery.new
    pick_4 = Game.new('Pick 4', 2)
    mega_millions = Game.new('Mega Millions', 5, true)
    cash_5 = Game.new('Cash 5', 1)
    alexander = Contestant.new({
                       first_name: 'Alexander',
                       last_name: 'Aigades',
                       age: 28,
                       state_of_residence: 'CO',
                       spending_money: 10})
    benjamin = Contestant.new({
                       first_name: 'Benjamin',
                       last_name: 'Franklin',
                       age: 17,
                       state_of_residence: 'PA',
                       spending_money: 100})
    frederick = Contestant.new({
                       first_name:  'Frederick',
                       last_name: 'Douglas',
                       age: 55,
                       state_of_residence: 'NY',
                       spending_money: 20})
    winston = Contestant.new({
                       first_name: 'Winston',
                       last_name: 'Churchill',
                       age: 18,
                       state_of_residence: 'CO',
                       spending_money: 5})

    alexander.add_game_interest('Pick 4')
    alexander.add_game_interest('Mega Millions')
    frederick.add_game_interest('Mega Millions')
    winston.add_game_interest('Cash 5')
    winston.add_game_interest('Mega Millions')
    benjamin.add_game_interest('Mega Millions')

    assert_equal true, lottery.interested_and_18?(alexander, pick_4)
    assert_equal false, lottery.interested_and_18?(benjamin, mega_millions)
    assert_equal false, lottery.interested_and_18?(alexander, cash_5)
  end
end
