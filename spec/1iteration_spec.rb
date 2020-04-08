require './spec/test_helper.rb'
require "./lib/contestant"
require "./lib/game"

RSpec.describe 'Iteration 1' do
  before :each do
    @alexander = Contestant.new({first_name: 'Alexander',
      last_name: 'Aigades',
      age: 28,
      state_of_residence: 'CO',
      spending_money: 10})
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
  end

  it '1. Contestant Instantiation' do
    expect(Contestant).to respond_to(:new).with(1).argument
    expect(@alexander).to be_an_instance_of(Contestant)
  end

  it '2. Contestant #attrs' do
    expect(@alexander).to respond_to(:full_name).with(0).argument
    expect(@alexander.full_name).to eq('Alexander Aigades')
    expect(@alexander).to respond_to(:age).with(0).argument
    expect(@alexander.age).to eq(28)
    expect(@alexander).to respond_to(:state_of_residence).with(0).argument
    expect(@alexander.state_of_residence).to eq('CO')
    expect(@alexander).to respond_to(:spending_money).with(0).argument
    expect(@alexander.spending_money).to eq(10)
    expect(@alexander).to respond_to(:game_interests).with(0).argument
    expect(@alexander.game_interests).to eq([])
  end

  it '3. Contestant out_of_state?' do
    expect(@frederick).to respond_to(:out_of_state?).with(0).argument
    expect(@frederick.out_of_state?).to eq(true)
    expect(@winston.out_of_state?).to eq(false)
  end

  it '4. Contestant game_interests' do
    expect(@alexander).to respond_to(:add_game_interest).with(1).argument
    @alexander.add_game_interest('Mega Millions')
    @alexander.add_game_interest('Pick 4')
    expect(@alexander.game_interests).to eq(["Mega Millions", "Pick 4"])
  end

  it '5. Game Instantiation' do
    expect(Game).to respond_to(:new).with(2).argument
    expect(Game).to respond_to(:new).with(3).argument
    expect(@pick_4).to be_an_instance_of(Game)
  end

  it '6. Game #attrs' do
    expect(@pick_4).to respond_to(:name).with(0).argument
    expect(@pick_4.name).to eq("Pick 4")
    expect(@pick_4).to respond_to(:cost).with(0).argument
    expect(@pick_4.cost).to eq(2)
  end

  it '7. Game #national_drawing?' do
    expect(@pick_4).to respond_to(:national_drawing?).with(0).argument
    expect(@mega_millions.national_drawing?).to eq(true)
    expect(@pick_4.national_drawing?).to eq(false)
  end
end
