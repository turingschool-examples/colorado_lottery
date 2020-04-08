require 'minitest/autorun'
require 'minitest/pride'
require "./lib/contestant"
require "./lib/game"

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
    # assert_equal 10, pick_4.national_drawing?
  end


end
