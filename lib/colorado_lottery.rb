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
    binding.pry
  end
end
