require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/game'
require './lib/contestant'
require './lib/colorado_lottery'
require "mocha/minitest"

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
    @grace = Contestant.new({
                           first_name: 'Grace',
                           last_name: 'Hopper',
                           age: 20,
                           state_of_residence: 'CO',
                           spending_money: 20})

   @alexander.add_game_interest('Pick 4')
   @alexander.add_game_interest('Mega Millions')
   @frederick.add_game_interest('Mega Millions')
   @winston.add_game_interest('Cash 5')
   @winston.add_game_interest('Mega Millions')
   @benjamin.add_game_interest('Mega Millions')
   @grace.add_game_interest('Mega Millions')
   @grace.add_game_interest('Cash 5')
   @grace.add_game_interest('Pick 4')

  end

  def test_it_exists
    assert_instance_of ColoradoLottery, @lottery
  end

  def test_it_registers_contestants_and_winners_empty_at_initialize
    assert_equal ({}), @lottery.registered_contestants
    assert_equal [], @lottery.winners
    assert_equal ({}), @lottery.current_contestants

  end

  def test_it_returns_interested_and_18
    assert_equal true, @lottery.interested_and_18?(@alexander, @pick_4)
    assert_equal false, @lottery.interested_and_18?(@benjamin, @mega_millions)
    assert_equal false, @lottery.interested_and_18?(@alexander, @cash_5)
  end

  def test_it_returns_can_register
    assert_equal true, @lottery.can_register?(@alexander, @pick_4)
    assert_equal false, @lottery.can_register?(@alexander, @cash_5)
    assert_equal true, @lottery.can_register?(@frederick, @mega_millions)
    assert_equal false, @lottery.can_register?(@benjamin, @mega_millions)
    assert_equal false, @lottery.can_register?(@frederick, @cash_5)
  end

  def test_registers_and_returns_contestants
    @lottery.register_contestant(@alexander, @pick_4)
    expected = {"Pick 4" => [@alexander]}
    assert_equal expected, @lottery.registered_contestants
    @lottery.register_contestant(@alexander, @mega_millions)
    expected = {"Pick 4" => [@alexander], "Mega Millions" => [@alexander]}
    assert_equal expected, @lottery.registered_contestants
    @lottery.register_contestant(@frederick, @mega_millions)
    @lottery.register_contestant(@winston, @cash_5)
    @lottery.register_contestant(@winston, @mega_millions)
    expected = {
                "Pick 4" => [@alexander],
                "Mega Millions" => [@alexander, @frederick, @winston],
                "Cash 5" => [@winston]
                }
    assert_equal expected, @lottery.registered_contestants

    @lottery.register_contestant(@grace, @mega_millions)
    @lottery.register_contestant(@grace, @cash_5)
    @lottery.register_contestant(@grace, @pick_4)
    expected = {
                "Pick 4" => [@alexander, @grace],
                "Mega Millions" => [@alexander, @frederick, @winston, @grace],
                "Cash 5" => [@winston, @grace]
                }
    assert_equal expected, @lottery.registered_contestants
  end

  def test_it_returns_eligible_contestants
    @lottery.register_contestant(@alexander, @pick_4)
    @lottery.register_contestant(@alexander, @mega_millions)
    @lottery.register_contestant(@frederick, @mega_millions)
    @lottery.register_contestant(@winston, @cash_5)
    @lottery.register_contestant(@winston, @mega_millions)
    @lottery.register_contestant(@grace, @mega_millions)
    @lottery.register_contestant(@grace, @cash_5)
    @lottery.register_contestant(@grace, @pick_4)

    assert_equal [@alexander, @grace],@lottery.eligible_contestants(@pick_4)
    assert_equal [@winston, @grace], @lottery.eligible_contestants(@cash_5)
    assert_equal [@alexander, @frederick, @winston, @grace], @lottery.eligible_contestants(@mega_millions)
  end

  def test_it_charges_and_returns_current_contestants
    @lottery.register_contestant(@alexander, @pick_4)
    @lottery.register_contestant(@alexander, @mega_millions)
    @lottery.register_contestant(@frederick, @mega_millions)
    @lottery.register_contestant(@winston, @cash_5)
    @lottery.register_contestant(@winston, @mega_millions)
    @lottery.register_contestant(@grace, @mega_millions)
    @lottery.register_contestant(@grace, @cash_5)
    @lottery.register_contestant(@grace, @pick_4)


    @lottery.charge_contestants(@cash_5)
    expected = {@cash_5 => ["Winston Churchill", "Grace Hopper"]}
    assert_equal expected, @lottery.current_contestants
    assert_equal 19, @grace.spending_money
    assert_equal 4, @winston.spending_money
    @lottery.charge_contestants(@mega_millions)
    expected = { @cash_5 => ["Winston Churchill", "Grace Hopper"],
    @mega_millions => ["Alexander Aigades", "Frederick Douglas", "Winston Churchill", "Grace Hopper"]}
    assert_equal expected, @lottery.current_contestants
    assert_equal 14, @grace.spending_money
    assert_equal 4, @winston.spending_money
    assert_equal 5, @alexander.spending_money
    assert_equal 15, @frederick.spending_money
    @lottery.charge_contestants(@pick_4)
    expected = {@cash_5 => ["Winston Churchill", "Grace Hopper"],
                @mega_millions => ["Alexander Aigades", "Frederick Douglas", "Winston Churchill", "Grace Hopper"],
                @pick_4 => ["Alexander Aigades", "Grace Hopper"]}
    assert_equal expected, @lottery.current_contestants

  end

  def test_it_return_random_winner
    @lottery.register_contestant(@alexander, @pick_4)
    @lottery.register_contestant(@alexander, @mega_millions)
    @lottery.register_contestant(@frederick, @mega_millions)
    @lottery.register_contestant(@winston, @cash_5)
    @lottery.register_contestant(@winston, @mega_millions)
    @lottery.register_contestant(@grace, @mega_millions)
    @lottery.register_contestant(@grace, @cash_5)
    @lottery.register_contestant(@grace, @pick_4)
    @lottery.charge_contestants(@cash_5)
    @lottery.charge_contestants(@mega_millions)
    @lottery.charge_contestants(@pick_4)
    assert_equal "2020-04-07", @lottery.draw_winners
    assert_equal Array, @lottery.winners.class
    assert_equal Hash, @lottery.winners.first.class
    assert_equal Hash, @lottery.winners.last.class
    assert_equal 3, @lottery.winners.length
    @lottery.stubs(:winner).returns("Grace Hopper")
    expected = "Grace Hopper won the Pick 4 on 04/07"
    assert_equal expected, @lottery.announce_winner("Pick 4")
  end




end


# - Use TDD to update your `Lottery` class so that it responds to the following interaction pattern.
# - All of the setup remains the same, make sure you have registered and charged contestants for all of the games.
# - The #draw_winners method returns the date of the drawing as a string, and populates the #winners array with a random winner for each game based on available contestants
# - Because the array for #winners will be populated randomly, we cannot guarantee its contents, but we can guarantee that it will be an array of hashes that is the same length as the number of games we have. An example, based on our setup, the return value could be:
#
# <code>
# [{"Winston Churchill"=>"Cash 5"},
# {"Frederick Douglas"=>"Mega Millions"},
# {"Grace Hopper"=>"Pick 4"}]
# </code>
#
# - To test the #announce_winner method, you will need to stub the return value of #winners.
#
# ```ruby
#
# #=>
#
# #=>
#
# #=>
#
# #=> Hash
#
# #=>
#
# # Based on the example return value of #winners above in the iteration 4 directions, the announce_winner method would then return the following:
#
#lottery.announce_winner("Pick 4")
# #=> "Grace Hopper won the Pick 4 on 04/07"
#
#lottery.announce_winner("Cash 5")
# #=> "Winston Churchill won the Cash 5 on 04/07"
#
#lottery.announce_winner("Mega Millions")
# #=> "Frederick Douglas won the Mega Millions on 04/07"
# ```
