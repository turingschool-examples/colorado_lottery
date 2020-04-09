require 'date'

class ColoradoLottery
  attr_reader :registered_contestants,
              :winners,
              :current_contestants

  def initialize
    @registered_contestants = {}
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(contestant, game)
    # return false if contestant.age < 18
    contestant.game_interests.include?(game.name) && contestant.age >= 18
  end

  def out_of_state_only_for_national?(contestant, game)
    contestant.out_of_state? && !game.national_drawing?
  end

  def can_register?(contestant, game)
    location_indicator = !contestant.out_of_state? || game.national_drawing?
    interested_and_18?(contestant, game) && location_indicator
  end

  def register_contestant(contestant, game)
    @registered_contestants[game.name] = [] if @registered_contestants[game.name].nil?
    @registered_contestants[game.name] << contestant
  end

  def eligible_contestants(game)
    @registered_contestants[game.name].find_all do |contestant|
      contestant.spending_money >= game.cost
    end
  end

  def charge_contestants(game)
    # @current_contestants[game] = [] if @current_contestants[game].nil?
    eligible_contestants(game).each do |contestant|
      if @current_contestants[game].nil?
        @current_contestants[game] = [contestant.full_name]
      else
        @current_contestants[game] << contestant.full_name
      end
      contestant.reduce_spending_money(game.cost)
    end
  end

  def draw_winners
    Date.today.strftime("%y-%m-%d")
  end
end
