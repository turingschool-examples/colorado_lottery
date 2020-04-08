require 'minitest/autorun'
require 'minitest/pride'
require './lib/contestant'
require './lib/game'

class ContestantTest < Minitest::Test

  def setup
    @alexander = Contestant.new({first_name: 'Alexander',
                                      last_name: 'Aigiades',
                                      age: 28,
                                      state_of_residence: 'CO',
                                      spending_money: 10})
  end

  def test_it_exist
    assert_instance_of Contestant, @alexander
  end

  def test_it_has_attributes
    assert_equal "Alexander", @alexander.first_name
    assert_equal "Aigiades", @alexander.last_name
    assert_equal 28, @alexander.age
    assert_equal 'CO', @alexander.state_of_residence
    assert_equal 10, @alexander.spending_money
    assert_equal [], @alexander.game_interest
  end

  def test_full_name
    assert_equal 'Alexander Aigiades', @alexander.full_name
  end

  def test_out_of_state
      assert_equal false, @alexander.out_of_state?
  end

  def test_add_game_interest
    mega_millions = Game.new('Mega Millions', 5, true)
    pick_4 = Game.new('Pick 4', 2, false)
    assert_equal [], @alexander.game_interest
    @alexander.add_game_interest(pick_4)
    @alexander.add_game_interest(mega_millions)
    assert_equal [pick_4, mega_millions], @alexander.game_interest
  end
end
