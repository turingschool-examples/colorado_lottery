class ColoradoLottery

  attr_reader :registered_contestants, :winners, :current_contestants

  def initialize
    @registered_contestants = Hash.new { |h, k| h[k] = [] }
    @winners = []
    @current_contestants = Hash.new { |h, k| h[k] = [] }
  end

  def interested_and_18?(contestant, game)
    return true if contestant.game_interests.include?(game.name) && contestant.age >= 18
    false
  end

  def can_register?(contestant, game)
    return false if interested_and_18?(contestant, game) == false
    return false if game.national_drawing? == false && contestant.out_of_state? == true
    true
  end

  def register_contestant(contestant, game)
    @registered_contestants[game.name] << contestant
  end

  def eligible_contestants(game)
    eligible_contestants = Hash.new { |h, k| h[k] = [] }
    eligible_contestants[game.name] = @registered_contestants[game.name].find_all do |contestant|
      contestant.spending_money >= game.cost
    end
  end

  def charge_contestants(game)
    eligible_contestants(game).each do |contestant|
      contestant.buy_game(game)
    end
  end

  def current_contestants
    current_contestants = Hash.new { |h, k| h[k] = [] }
    #check if contestant has been charged. Maybe add method contestant to check if they have bought this game
    eligible_contestants.keys.each do |game|
      current_contestants[game.name] = charge_contestants
  end

end
