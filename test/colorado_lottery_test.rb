require 'minitest/autorun'
require 'minitest/pride'
require './lib/contestant'
require "./lib/game"
require "./lib/colorado_lottery"

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

  def test_contestant_interested_and_18
    lottery = ColoradoLottery.new
    pick_4 = Game.new('Pick 4', 2)
    mega_millions = Game.new('Mega Millions', 5, true)
    cash_5 = Game.new('Cash 5', 1)
    winston = Contestant.new({
                         first_name: 'Winston',
                         last_name: 'Churchill',
                         age: 18,
                         state_of_residence: 'CO',
                         spending_money: 5})
    frederick = Contestant.new({
                           first_name:  'Frederick',
                           last_name: 'Douglas',
                           age: 55,
                           state_of_residence: 'NY',
                           spending_money: 20})
    benjamin = Contestant.new({
                           first_name: 'Benjamin',
                           last_name: 'Franklin',
                           age: 17,
                           state_of_residence: 'PA',
                           spending_money: 100})
    alexander = Contestant.new({
                           first_name: 'Alexander',
                           last_name: 'Aigades',
                           age: 28,
                           state_of_residence: 'CO',
                           spending_money: 10})
    alexander.add_game_interest('Pick 4')
    alexander.add_game_interest('Mega Millions')
    frederick.add_game_interest('Mega Millions')
    winston.add_game_interest('Cash 5')
    winston.add_game_interest('Mega Millions')
    benjamin.add_game_interest('Mega Millions')
    # assert_equal true, lottery.interested_and_18?(alexander, pick_4)
    assert_equal false, lottery.interested_and_18?(benjamin, mega_millions)
    assert_equal false, lottery.interested_and_18?(alexander, cash_5)
  end

  def test_contestant_can_register
    lottery = ColoradoLottery.new
    pick_4 = Game.new('Pick 4', 2)
    mega_millions = Game.new('Mega Millions', 5, true)
    cash_5 = Game.new('Cash 5', 1)
    winston = Contestant.new({
                         first_name: 'Winston',
                         last_name: 'Churchill',
                         age: 18,
                         state_of_residence: 'CO',
                         spending_money: 5})
    frederick = Contestant.new({
                           first_name:  'Frederick',
                           last_name: 'Douglas',
                           age: 55,
                           state_of_residence: 'NY',
                           spending_money: 20})
    benjamin = Contestant.new({
                           first_name: 'Benjamin',
                           last_name: 'Franklin',
                           age: 17,
                           state_of_residence: 'PA',
                           spending_money: 100})
    alexander = Contestant.new({
                           first_name: 'Alexander',
                           last_name: 'Aigades',
                           age: 28,
                           state_of_residence: 'CO',
                           spending_money: 10})
    alexander.add_game_interest('Pick 4')
    alexander.add_game_interest('Mega Millions')
    frederick.add_game_interest('Mega Millions')
    winston.add_game_interest('Cash 5')
    winston.add_game_interest('Mega Millions')
    benjamin.add_game_interest('Mega Millions')
    assert_equal true, lottery.can_register?(alexander, pick_4)
    # assert_equal false, lottery.can_register?(alexander, cash_5)
    assert_equal true, lottery.can_register?(frederick, mega_millions)
    # assert_equal false, lottery.can_register?(benjamin, mega_millions)
    # assert_equal false, lottery.can_register?(frederick, cash_5)
  end

  def test_can_register_contestant
    lottery = ColoradoLottery.new
    pick_4 = Game.new('Pick 4', 2)
    cash_5 = Game.new('Cash 5', 1)
    mega_millions = Game.new('Mega Millions', 5, true)
    winston = Contestant.new({
                         first_name: 'Winston',
                         last_name: 'Churchill',
                         age: 18,
                         state_of_residence: 'CO',
                         spending_money: 5})
    frederick = Contestant.new({
                           first_name:  'Frederick',
                           last_name: 'Douglas',
                           age: 55,
                           state_of_residence: 'NY',
                           spending_money: 20})
    alexander = Contestant.new({
                           first_name: 'Alexander',
                           last_name: 'Aigades',
                           age: 28,
                           state_of_residence: 'CO',
                           spending_money: 10})
    lottery.register_contestant(alexander, pick_4)
    assert_equal ({pick_4 => alexander}), lottery.registered_contestants
    lottery.register_contestant(alexander, mega_millions)
    assert_equal ({pick_4 => alexander, mega_millions => alexander }), lottery.registered_contestants
    lottery.register_contestant(frederick, mega_millions)
    lottery.register_contestant(winston, cash_5)
    lottery.register_contestant(winston, mega_millions)
    assert_equal ({pick_4 => alexander, mega_millions => alexander, mega_millions => frederick, cash_5 => winston, mega_millions => winston}), lottery.registered_contestants
  end

  def test_it_has_eligible_contestants
    lottery = ColoradoLottery.new
    pick_4 = Game.new('Pick 4', 2)
    cash_5 = Game.new('Cash 5', 1)
    mega_millions = Game.new('Mega Millions', 5, true)
    winston = Contestant.new({
                         first_name: 'Winston',
                         last_name: 'Churchill',
                         age: 18,
                         state_of_residence: 'CO',
                         spending_money: 5})
    frederick = Contestant.new({
                           first_name:  'Frederick',
                           last_name: 'Douglas',
                           age: 55,
                           state_of_residence: 'NY',
                           spending_money: 20})
    alexander = Contestant.new({
                           first_name: 'Alexander',
                           last_name: 'Aigades',
                           age: 28,
                           state_of_residence: 'CO',
                           spending_money: 10})
    lottery.register_contestant(alexander, pick_4)
    lottery.register_contestant(alexander, mega_millions)
    lottery.register_contestant(frederick, mega_millions)
    lottery.register_contestant(winston, cash_5)
    lottery.register_contestant(winston, mega_millions)
    assert_equal [alexander], lottery.eligible_contestants(pick_4)
  end
end
