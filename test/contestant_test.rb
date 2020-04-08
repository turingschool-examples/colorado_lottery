require 'minitest/autorun'
require 'minitest/pride'
require './lib/contestant'
require 'pry';


class ContestantTest < Minitest::Test
  def test_it_exists
    alexander = Contestant.new({first_name: 'Alexander',
                                          last_name: 'Aigiades',
                                          age: 28,
                                          state_of_residence: 'CO',
                                          spending_money: 10})

    assert_instance_of Contestant, alexander
  end

  def test_it_has_readable_attributes
    alexander = Contestant.new({first_name: 'Alexander',
                                          last_name: 'Aigiades',
                                          age: 28,
                                          state_of_residence: 'CO',
                                          spending_money: 10})
    assert_equal 'Alexander', alexander.first_name
    assert_equal 'Aigiades', alexander.last_name
    assert_equal 28, alexander.age
    assert_equal 'CO', alexander.state_of_residence
    assert_equal 10, alexander.spending_money
    assert_equal [], alexander.game_interests
  end

  def test_it_can_read_full_name
    alexander = Contestant.new({first_name: 'Alexander',
                                          last_name: 'Aigiades',
                                          age: 28,
                                          state_of_residence: 'CO',
                                          spending_money: 10})
    assert_equal "Alexander Aigiades", alexander.full_name
  end

  def test_it_can_tell_if_contestant_is_from_out_of_state
    alexander = Contestant.new({first_name: 'Alexander',
                                          last_name: 'Aigiades',
                                          age: 28,
                                          state_of_residence: 'CO',
                                          spending_money: 10})


    assert_equal false, alexander.out_of_state?
  end

  def test_it_can_add_games_of_interest_to_array
    alexander = Contestant.new({first_name: 'Alexander',
                                          last_name: 'Aigiades',
                                          age: 28,
                                          state_of_residence: 'CO',
                                          spending_money: 10})
    alexander.add_game_interest('Mega Millions')
    alexander.add_game_interest('Pick 4')

    assert_equal ["Mega Millions", "Pick 4"], alexander.game_interests
  end




end
