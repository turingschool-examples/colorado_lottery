require "./lib/contestant"
require "./lib/game"
require "./lib/colorado_lottery"

RSpec.describe ColoradoLottery do
  before :each do
    @lottery = ColoradoLottery.new
    @pick_4 = Game.new('Pick 4', 2)
    @mega_millions = Game.new('Mega Millions', 5, true)
    @cash_5 = Game.new('Cash 5', 1)
    @alexander = Contestant.new({
                           first_name: 'Alexander',
                           last_name: 'Aigades',
                           age: 28,
                           state_of_residence: 'CO',
                           spending_money: 10})
    @benjamin = Contestant.new({
                          first_name: 'Benjamin',
                          last_name: 'Franklin',
                          age: 17,
                          state_of_residence: 'PA',
                          spending_money: 100})
    @frederick = Contestant.new({
                           first_name:  'Frederick',
                           last_name: 'Douglass',
                           age: 55,
                           state_of_residence: 'NY',
                           spending_money: 20})
    @winston = Contestant.new({
                        first_name: 'Winston',
                        last_name: 'Churchill',
                        age: 18,
                        state_of_residence: 'CO',
                        spending_money: 5})
    @alexander.add_game_interest('Pick 4')
    @alexander.add_game_interest('Mega Millions')
    @frederick.add_game_interest('Mega Millions')
    @winston.add_game_interest('Cash 5')
    @winston.add_game_interest('Mega Millions')
    @benjamin.add_game_interest('Mega Millions')
  end

  it "has readable attributes" do
    expect(@lottery.registered_contestants).to eq({})
    expect(@lottery.winners).to eq([])
    expect(@lottery.current_contestants).to eq({})
  end

  it "can check if contestant is 18 and interested " do
    expect(@lottery.interested_and_18?(@alexander, @pick_4)).to eq(true)
    expect(@lottery.interested_and_18?(@benjamin, @mega_millions)).to eq(false)
    expect(@lottery.interested_and_18?(@alexander, @cash_5)).to eq(false)
  end

  it "can check if a contestant is eligible to register" do
    expect(@lottery.interested_and_18?(@alexander, @cash_5)).to eq(false)
    expect(@lottery.can_register?(@alexander, @pick_4)).to eq(true)
    expect(@lottery.can_register?(@alexander, @cash_5)).to eq(false)
    expect(@lottery.can_register?(@frederick, @mega_millions)).to eq(true)
    expect(@lottery.can_register?(@benjamin, @mega_millions)).to eq(false)
    expect(@lottery.can_register?(@frederick, @cash_5)).to eq(false)
  end

  it "can register an eligible contestant to a game" do
    @lottery.register_contestant(@alexander, @pick_4)
    expect(@lottery.registered_contestants).to eq({"Pick 4" => [@alexander]})
    @lottery.register_contestant(@alexander, @mega_millions)
    expect(@lottery.registered_contestants).to eq({"Pick 4" => [@alexander], "Mega Millions" => [@alexander]})
    @lottery.register_contestant(@frederick, @mega_millions)
    @lottery.register_contestant(@winston, @cash_5)
    @lottery.register_contestant(@winston, @mega_millions)
    expected = {
      "Pick 4" => [@alexander],
      "Mega Millions" => [@alexander,@frederick,@winston],
      "Cash 5" => [@winston]
    }
    expect(@lottery.registered_contestants).to eq(expected)
    @grace = Contestant.new({
                         first_name: 'Grace',
                         last_name: 'Hopper',
                         age: 20,
                         state_of_residence: 'CO',
                         spending_money: 20})
    @grace.add_game_interest("Mega Millions")
    @grace.add_game_interest("Cash 5")
    @grace.add_game_interest("Pick 4")
    @lottery.register_contestant(@grace, @mega_millions)
    @lottery.register_contestant(@grace, @cash_5)
    @lottery.register_contestant(@grace, @pick_4)
    expected = {
      "Pick 4" => [@alexander,@grace],
      "Mega Millions" => [@alexander,@frederick,@winston,@grace],
      "Cash 5" => [@winston,@grace]
    }
    expect(@lottery.registered_contestants).to eq(expected)
  end

  it "can find eligible_contestants for a game" do
    @lottery.register_contestant(@alexander, @pick_4)
    @lottery.register_contestant(@alexander, @mega_millions)
    @lottery.register_contestant(@frederick, @mega_millions)
    @lottery.register_contestant(@winston, @cash_5)
    @lottery.register_contestant(@winston, @mega_millions)
    @grace = Contestant.new({
                         first_name: 'Grace',
                         last_name: 'Hopper',
                         age: 20,
                         state_of_residence: 'CO',
                         spending_money: 20})
    @grace.add_game_interest("Mega Millions")
    @grace.add_game_interest("Cash 5")
    @grace.add_game_interest("Pick 4")
    @lottery.register_contestant(@grace, @mega_millions)
    @lottery.register_contestant(@grace, @cash_5)
    @lottery.register_contestant(@grace, @pick_4)
    expect(@lottery.eligible_contestants(@pick_4)).to eq([@alexander,@grace])
    expect(@lottery.eligible_contestants(@cash_5)).to eq([@winston,@grace])
    expect(@lottery.eligible_contestants(@mega_millions)).to eq([@alexander,@frederick,@winston,@grace])
  end

  it "can charge a contestant" do
    @lottery.register_contestant(@alexander, @pick_4)
    @lottery.register_contestant(@alexander, @mega_millions)
    @lottery.register_contestant(@frederick, @mega_millions)
    @lottery.register_contestant(@winston, @cash_5)
    @lottery.register_contestant(@winston, @mega_millions)
    @grace = Contestant.new({
                         first_name: 'Grace',
                         last_name: 'Hopper',
                         age: 20,
                         state_of_residence: 'CO',
                         spending_money: 20})
    @grace.add_game_interest("Mega Millions")
    @grace.add_game_interest("Cash 5")
    @grace.add_game_interest("Pick 4")
    @lottery.register_contestant(@grace, @mega_millions)
    @lottery.register_contestant(@grace, @cash_5)
    @lottery.register_contestant(@grace, @pick_4)
    @lottery.charge_contestants(@cash_5)
    expect(@lottery.current_contestants).to eq({@cash_5 => ["Winston Churchill", "Grace Hopper"]})
    expect(@grace.spending_money).to eq(19)
    expect(@winston.spending_money).to eq(4)
    @lottery.charge_contestants(@mega_millions)
    expected = {
      @cash_5 => ["Winston Churchill", "Grace Hopper"],
      @mega_millions => ["Alexander Aigades", "Frederick Douglass", "Grace Hopper"]
    }
    expect(@lottery.current_contestants).to eq(expected)
    expect(@grace.spending_money).to eq(14)
    expect(@winston.spending_money).to eq(4)
    expect(@alexander.spending_money).to eq(5)
    expect(@frederick.spending_money).to eq(15)
    @lottery.charge_contestants(@pick_4)
    expected = {
      @cash_5 => ["Winston Churchill", "Grace Hopper"],
      @mega_millions => ["Alexander Aigades", "Frederick Douglass", "Grace Hopper"],
      @pick_4 => ["Alexander Aigades", "Grace Hopper"]
    }
    expect(@lottery.current_contestants).to eq(expected)
  end

  describe "iteration 4" do
    before :each do
      @lottery.register_contestant(@alexander, @pick_4)
      @lottery.register_contestant(@alexander, @mega_millions)
      @lottery.register_contestant(@frederick, @mega_millions)
      @lottery.register_contestant(@winston, @cash_5)
      @lottery.register_contestant(@winston, @mega_millions)
      @grace = Contestant.new({
                           first_name: 'Grace',
                           last_name: 'Hopper',
                           age: 20,
                           state_of_residence: 'CO',
                           spending_money: 20})
      @grace.add_game_interest("Mega Millions")
      @grace.add_game_interest("Cash 5")
      @grace.add_game_interest("Pick 4")
      @lottery.register_contestant(@grace, @mega_millions)
      @lottery.register_contestant(@grace, @cash_5)
      @lottery.register_contestant(@grace, @pick_4)
      @lottery.charge_contestants(@cash_5)
      @lottery.charge_contestants(@mega_millions)
      @lottery.charge_contestants(@pick_4)
    end

    it "can draw_winners, which returns current date and populates winner into winners hash" do
      expect(@lottery.draw_winners).to eq(Time.now.strftime("%Y/%m/%d"))
      expect(@lottery.winners.class).to eq(Array)
      expect(@lottery.winners.first.class).to eq(Hash)
      expect(@lottery.winners.last.class).to eq(Hash)
      expect(@lottery.winners.count).to eq(3)
    end

    it "can announce winners of each game" do
      expect(@lottery.announce_winner("Pick 4")).to eq("Alexander Aigades won the Pick 4 on #{Time.now.strftime("%Y/%m/%d")}").or eq("Grace Hopper won the Pick 4 on #{Time.now.strftime("%Y/%m/%d")}")
    end
  end
end
