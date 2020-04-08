require 'minitest/autorun'
require 'minitest/pride'
require './lib/contestant'

class ContestantTest < Minitest::Test

  def test_it_exist
    alexander = Contestant.new({first_name: 'Alexander',
                                      last_name: 'Aigiades',
                                      age: 28,
                                      state_of_residence: 'CO',
                                      spending_money: 10})
    assert_instance_of Contestant, alexander
  end

  def test_it_has_attributes
    alexander = Contestant.new({first_name: 'Alexander',
                                      last_name: 'Aigiades',
                                      age: 28,
                                      state_of_residence: 'CO',
                                      spending_money: 10})
                                      #require 'pry'; binding.pry
    assert_equal "Alexander", alexander.first_name
  end
end
