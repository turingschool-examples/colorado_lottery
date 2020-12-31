require "./lib/contestant"
require "./lib/game"
require "./lib/colorado_lottery"

RSpec.describe 'Iteration 2' do

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
                                spending_money: 1})
    @winston = Contestant.new({first_name: 'Winston',
                                last_name: 'Churchill',
                                age: 18,
                                state_of_residence: 'CO',
                                spending_money: 0})
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
  end

  it '2.1 ColoradoLottery Instantiation' do
    expect(ColoradoLottery).to respond_to(:new).with(0).argument
    expect(@lottery).to be_an_instance_of(ColoradoLottery)
  end

  it '2.2 ColoradoLottery attrs' do
    expect(@lottery).to respond_to(:registered_contestants)
     .with(0).argument
    expect(@lottery.registered_contestants).to eq({})
    expect(@lottery).to respond_to(:winners).with(0).argument
    expect(@lottery.winners).to eq([])
    expect(@lottery).to respond_to(:current_contestants).with(0).argument
    expect(@lottery.current_contestants).to eq({})
  end

  it '2.3 ColoradoLottery interested_and_18?' do
    expect(@lottery).to respond_to(:interested_and_18?).with(2).argument
    expect(@lottery.interested_and_18?(@alexander, @pick_4))
    .to eq(true)
    expect(@lottery.interested_and_18?(@benjamin, @mega_millions))
    .to eq(false)
    expect(@lottery.interested_and_18?(@alexander, @cash_5))
    .to eq(false)
  end

  it '2.4 ColoradoLottery can_register?' do
    expect(@lottery).to respond_to(:can_register?).with(2).argument
    expect(@lottery.can_register?(@alexander, @pick_4)).to eq(true)
    expect(@lottery.can_register?(@alexander, @cash_5)).to eq(false)
    expect(@lottery.can_register?(@frederick, @mega_millions)).to eq(true)
    expect(@lottery.can_register?(@benjamin, @mega_millions)).to eq(false)
    expect(@lottery.can_register?(@frederick, @cash_5)).to eq(false)
  end
end
