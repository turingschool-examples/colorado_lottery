require "./lib/contestant"
require "./lib/game"
require "pry"

class ColoradoLottery
  attr_reader :registered_contestants, :winners
  def initialize
    @registered_contestants = {}
    @winners = []
  end

  def current_contestants
    @registered_contestants
  end

  def interested_and_18?(contestant, game)
    contestant.game_interests.include?(game.name) && contestant.age >= 18
  end

  def can_register?(contestant, game)
    interested_and_18?(contestant, game) && (game.national_drawing? || contestant.out_of_state? == false)
  end

  def register_contestant(contestant, game)
    if can_register?(contestant, game)
      @register_contestant[game.name] = contestent
    end
  end



end
