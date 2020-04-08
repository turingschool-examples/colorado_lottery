require "./lib/contestant"
require "./lib/game"
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ConstantTest < MiniTest::Test

  def test_it_exists

    assert_instance_of Game, Game.new('Pick 4', 2)
  end

  def test_it_has_attributes
    mega_millions = Game.new('Mega Millions', 5, true)

    assert_equal "Mega Millions", mega_millions.name
    assert_equal 5, mega_millions.cost
  end

  def test_mega_millions_is_national_drawing
    mega_millions = Game.new('Mega Millions', 5, true)

    assert_equal true, mega_millions.national_drawing?
  end

  def test_pick_4_is_not_national_drawing
    pick_4 = Game.new('Pick 4', 2)

    assert_equal false, pick_4.national_drawing?
  end

  def test_instance_of_contestant

    alexander = Contestant.new({first_name: 'Alexander',
                                      last_name: 'Aigiades',
                                      age: 28,
                                      state_of_residence: 'CO',
                                      spending_money: 10})

    assert_instance_of Contestant, alexander
  end

  def test_contestant_has_attributes
    alexander = Contestant.new({first_name: 'Alexander',
                                      last_name: 'Aigiades',
                                      age: 28,
                                      state_of_residence: 'CO',
                                      spending_money: 10})
    assert_equal "Alexander Aigiades", alexander.full_name
    assert_equal 28, alexander.age
    assert_equal "CO", alexander.state_of_residence
    assert_equal 10, alexander.spending_money
  end

  def test_contestant_is_in_state_if_in_CO

    alexander = Contestant.new({first_name: 'Alexander',
                                      last_name: 'Aigiades',
                                      age: 28,
                                      state_of_residence: 'CO',
                                      spending_money: 10})

    assert_equal false, alexander.out_of_state?
  end

  def test_contestant_starts_with_no_interests

    alexander = Contestant.new({first_name: 'Alexander',
                                      last_name: 'Aigiades',
                                      age: 28,
                                      state_of_residence: 'CO',
                                      spending_money: 10})

    assert_equal [], alexander.game_interests
  end

  def test_contestant_can_add_game_interests
    alexander = Contestant.new({first_name: 'Alexander',
                                      last_name: 'Aigiades',
                                      age: 28,
                                      state_of_residence: 'CO',
                                      spending_money: 10})
    mega_millions = Game.new('Mega Millions', 5, true)
    pick_4 = Game.new('Pick 4', 2)
    alexander.add_game_interest('Mega Millions')
    alexander.add_game_interest('Pick 4')

    assert_equal ['Mega Millions', 'Pick 4'], alexander.game_interests
  end
end
