class ColoradoLottery
  attr_reader :registered_contestants, :current_contestants, :winners

  def initialize()
    @registered_contestants = {}
    @current_contestants = {}
    @winners = []
  end

end
