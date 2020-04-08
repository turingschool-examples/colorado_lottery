require "./lib/contestant"
require "./lib/game"
require "./lib/colorado_lottery"

RSpec.describe 'Iteration 4' do

  before :each do
    @alexander = Contestant.new({first_name: 'Alexander',
                                last_name: 'Aigades',
                                age: 28,
                                state_of_residence: 'CO',
                                spending_money: 10})
    @benjamin = Contestant.new({first_name: 'Benjamin',
                               last_name: 'Franklin',
                               age: 17,
                               state_of_residence: 'PA',
                               spending_money: 100})
    @frederick = Contestant.new({first_name: 'Frederick',
                                last_name: 'Douglas',
                                age: 55,
                                state_of_residence: 'NY',
                                spending_money: 20})
    @winston = Contestant.new({first_name: 'Winston',
                                last_name: 'Churchill',
                                age: 18,
                                state_of_residence: 'CO',
                                spending_money: 5})
    @grace = Contestant.new({first_name: 'Grace',
                              last_name: 'Hopper',
                              age: 20,
                              state_of_residence: 'CO',
                              spending_money: 20})
    @pick_4 = Game.new('Pick 4', 2)
    @mega_millions = Game.new('Mega Millions', 5, true)
    @cash_5 = Game.new('Cash 5', 1)
    @lottery = ColoradoLottery.new
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

  def register_and_charge_contestants_setup
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
    @lottery.draw_winners
  end

  it '4.1 ColoradoLottery draw_winners' do
    register_and_charge_contestants_setup
    expect(@lottery).to respond_to(:draw_winners).with(0).argument
    expect(@lottery.draw_winners).to eq(Date.today.strftime)

  end

  it '4.2 ColoradoLottery winners' do
    register_and_charge_contestants_setup
    expect(@lottery).to respond_to(:winners).with(0).argument
    expect(@lottery.winners).to be_an_instance_of(Array)
    expect(@lottery.winners.first).to be_an_instance_of(Hash)
    expect(@lottery.winners.last).to be_an_instance_of(Hash)
    expect(@lottery.winners.length).to eq(3)
  end

  it '4.3 ColoradoLottery announce_winner' do
    register_and_charge_contestants_setup
    expect(@lottery).to respond_to(:announce_winner).with(1).argument

    @lottery.stub(:winners) { [{"Winston Churchill"=>"Cash 5"},
                              {"Frederick Douglas"=>"Mega Millions"},
                              {"Grace Hopper"=>"Pick 4"}] }
    expected_date = Date.today.strftime[5..9].gsub('-', '/')

    expected = "Grace Hopper won the Pick 4 on #{expected_date}"
    expect(@lottery.announce_winner("Pick 4")).to eq(expected)

    expected = "Frederick Douglas won the Mega Millions on #{expected_date}"
    expect(@lottery.announce_winner("Mega Millions")).to eq(expected)

    expected = "Winston Churchill won the Cash 5 on #{expected_date}"
    expect(@lottery.announce_winner("Cash 5")).to eq(expected)
  end
end
