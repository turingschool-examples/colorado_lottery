require 'minitest/autorun'
require 'minitest/pride'
require "./lib/contestant"

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

    assert_equal "Alexander", alexander.first_name
    assert_equal "Aigiades", alexander.last_name
    assert_equal 28, alexander.age
    assert_equal "CO", alexander.state_of_residence
    assert_equal 10, alexander.spending_money
  end

  def test_full_name
    alexander = Contestant.new({first_name: 'Alexander',
                                last_name: 'Aigiades',
                                age: 28,
                                state_of_residence: 'CO',
                                spending_money: 10})

    assert_equal "Alexander Aigiades", alexander.full_name
  end

  def test_if_contestant_is_out_of_state
    alexander = Contestant.new({first_name: 'Alexander',
                                last_name: 'Aigiades',
                                age: 28,
                                state_of_residence: 'CO',
                                spending_money: 10})
    out_of_state_contestant = Contestant.new({first_name: 'Bill',
                                last_name: 'Bob',
                                age: 28,
                                state_of_residence: 'MO',
                                spending_money: 10})

    assert_equal false, alexander.out_of_state?
    assert_equal true, out_of_state_contestant.out_of_state?
  end

  def test_game_interests_is_empty_array
    alexander = Contestant.new({first_name: 'Alexander',
                                last_name: 'Aigiades',
                                age: 28,
                                state_of_residence: 'CO',
                                spending_money: 10})

    assert_equal [], alexander.game_interests
  end

  def test_can_add_game_interests_to_contenstant
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




# ### Iteration 1
#
# Use TDD to create a `Game` and `Contestant` class that respond to the following interaction pattern:
# A contestant is considered out of state if their state of residence is not Colorado.

# alexander = Contestant.new({first_name: 'Alexander',
#                                       last_name: 'Aigiades',
#                                       age: 28,
#                                       state_of_residence: 'CO',
#                                       spending_money: 10})
# #=> <Contestant:0x007ff87ac0a498...>
#
# alexander.full_name
# #=> "Alexander Aigiades"
#
# alexander.age
# #=> 28
#
# alexander.state_of_residence
# #=> "CO"
#
# alexander.spending_money
# #=> 10
#
# alexander.out_of_state?
# #=> false
#
# alexander.game_interests
# #=> []
#
# alexander.add_game_interest('Mega Millions')
# alexander.add_game_interest('Pick 4')
#
# alexander.game_interests
# => ["Mega Millions", "Pick 4"]
