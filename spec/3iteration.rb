require "./lib/contestant"
require "./lib/game"
require "./lib/colorado_lottery"

RSpec.describe 'Iteration 3' do

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

  def register_contestants_setup
    @lottery.register_contestant(@alexander, @pick_4)
    @lottery.register_contestant(@alexander, @mega_millions)
    @lottery.register_contestant(@frederick, @mega_millions)
    @lottery.register_contestant(@winston, @cash_5)
    @lottery.register_contestant(@winston, @mega_millions)
    @lottery.register_contestant(@grace, @mega_millions)
    @lottery.register_contestant(@grace, @cash_5)
    @lottery.register_contestant(@grace, @pick_4)
  end

  it '3.1 ColoradoLottery registered_contestants' do
    expect(@lottery).to respond_to(:register_contestant)
     .with(2).argument

    @lottery.register_contestant(@alexander, @pick_4)
    expect(@lottery.registered_contestants).to eq({'Pick 4' => [@alexander]})

    @lottery.register_contestant(@alexander, @mega_millions)
    expected = {'Pick 4' => [@alexander], "Mega Millions" => [@alexander]}
    expect(@lottery.registered_contestants).to eq(expected)
    @lottery.register_contestant(@frederick, @mega_millions)
    @lottery.register_contestant(@winston, @cash_5)
    @lottery.register_contestant(@winston, @mega_millions)
    expected = {'Pick 4' => [@alexander],
                "Mega Millions" => [@alexander, @frederick, @winston],
                "Cash 5" => [@winston]}

    expect(@lottery.registered_contestants).to eq(expected)
    @lottery.register_contestant(@grace, @mega_millions)
    @lottery.register_contestant(@grace, @cash_5)
    @lottery.register_contestant(@grace, @pick_4)
    expected = {'Pick 4' => [@alexander, @grace],
                "Mega Millions" => [@alexander, @frederick, @winston, @grace],
                "Cash 5" => [@winston, @grace]}
    expect(@lottery.registered_contestants).to eq(expected)
  end

  it '3.2 ColoradoLottery eligible_contestants' do
    register_contestants_setup
    expect(@lottery).to respond_to(:eligible_contestants)
     .with(1).argument
    expect(@lottery.eligible_contestants(@pick_4)).to eq([@alexander, @grace])
    expect(@lottery.eligible_contestants(@cash_5)).to eq([@winston, @grace])
    expect(@lottery.eligible_contestants(@mega_millions))
    .to eq([@alexander, @frederick, @winston, @grace])
  end
  it '3.3 ColoradoLottery charge_contestants' do
    register_contestants_setup
    expect(@lottery).to respond_to(:charge_contestants)
     .with(1).argument

    @lottery.charge_contestants(@cash_5)
    expected = {@cash_5 => ["Winston Churchill", "Grace Hopper"]}
    expect(@lottery.current_contestants).to eq(expected)
    expect(@grace.spending_money).to eq(19)
    expect(@winston.spending_money).to eq(4)

    @lottery.charge_contestants(@mega_millions)
    expected = {@cash_5 => ["Winston Churchill", "Grace Hopper"],
                @mega_millions => ["Alexander Aigades", "Frederick Douglas", "Grace Hopper"]}
    expect(@lottery.current_contestants).to eq(expected)
    expect(@grace.spending_money).to eq(14)
    expect(@winston.spending_money).to eq(4)
    expect(@alexander.spending_money).to eq(5)
    expect(@frederick.spending_money).to eq(15)

    @lottery.charge_contestants(@pick_4)
    expected = {@cash_5 => ["Winston Churchill", "Grace Hopper"],
                @mega_millions => ["Alexander Aigades", "Frederick Douglas", "Grace Hopper"],
                @pick_4 => ["Alexander Aigades", "Grace Hopper"]}

    expect(@lottery.current_contestants).to eq(expected)
  end
end
