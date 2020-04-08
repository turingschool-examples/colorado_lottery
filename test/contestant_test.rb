require 'minitest/autorun'
require 'minitest/pride'
require "./lib/contestant"
require "./lib/game"
require "pry"

class ContestantTest < Minitest::Test

  def test_it_exist
    alexander = Contestant.new({first_name: 'Alexander',
      last_name: 'Aigiades',
      age: 28,
      state_of_residence: 'CO',
      spending_money: 10})

    assert_instance_of Contestant, alexander
  end

  def test_has_attributes
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

  def test_can_check_out_of_state
    alexander = Contestant.new({first_name: 'Alexander',
      last_name: 'Aigiades',
      age: 28,
      state_of_residence: 'CO',
      spending_money: 10})

    assert_equal false, alexander.out_of_state?
  end

  def test_can_add_game_interests
    pick_4 = Game.new('Pick 4', 2)
    mega_millions = Game.new('Mega Millions', 5, true)
    alexander = Contestant.new({first_name: 'Alexander',
      last_name: 'Aigiades',
      age: 28,
      state_of_residence: 'CO',
      spending_money: 10})

    assert_equal [], alexander.game_interests
    alexander.add_game_interest('Mega Millions')
    alexander.add_game_interest('Pick 4')
    assert_equal ['Mega Millions', 'Pick 4'],alexander.game_interests_list
  end

  def test_can_run_game_interests
    pick_4 = Game.new('Pick 4', 2)
    mega_millions = Game.new('Mega Millions', 5, true)
    alexander = Contestant.new({first_name: 'Alexander',
      last_name: 'Aigiades',
      age: 28,
      state_of_residence: 'CO',
      spending_money: 10})

    alexander.add_game_interest('Mega Millions')
    assert_equal ['Mega Millions'],alexander.game_interests_list
    alexander.add_game_interest('Pick 4')
    assert_equal ['Mega Millions', 'Pick 4'], alexander.game_interests_list
    assert_equal ["Mega Millions", "Pick 4"], alexander.game_interests
  end




end
