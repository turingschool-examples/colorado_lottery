require 'minitest/autorun'
require 'minitest/pride'


class ContestantTest < Minitest::Test

  def setup
    @alexander = Contestant.new({first_name: 'Alexander',}
                                 last_name: 'Aigiades',
                                 age: 28,
                                 state_of_residence: 'CO',
                                 spending_money: 10)}
  end

  def test_it_exists
    assert_instance_of Contestant, @alexander
  end

  def test_it_has_readable_attributes
    assert_equal "Alexander Aigiades", @alexander.full_name
    assert_equal 28, @alexander.age
    assert_equal "CO", @alexander.state_of_residence
  end
end
